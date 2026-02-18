Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D1BE9A02C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 16:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wa9GX10RqICwHPztX1CkkMQoNAp0yb6VcbWDWpqUr4U=; b=F1NyRkTXO7uPvxUnXied5tUusH
	l0kIN66NjG8RRFXWIG2RDS3UbXQLRk7mfxMMHorj5X1D/Bme495ug+wnS3mdBHd6EKaooVjLR0BJY
	lhopK6o//VyL/XrpKiWCwHdVJZxHBlB/hgLDOBZSjMrH4nl0S1th31d8gv0FUUFOYYPcBygMYOYDl
	l+SRYbrKYI+XsNEQnMVU2Wk9bAaiHWaUsUKF0TioIflRvQW8gMZlRMJ+GuNtejha3E5cd3xIO7OJ6
	QcnkdyFCMHSxow146ev448zN87HsdbcpduTnatyyQ5VKQ+5vwOyz0HBf8zcQSQYNi6++UxsZnIuwu
	7muR1JiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vskhN-0000000A72R-1kTd;
	Wed, 18 Feb 2026 16:46:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vskhK-0000000A71a-3gDQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 16:46:48 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I8X53u3694192
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Feb 2026 16:46:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wa9GX10RqICwHPztX1CkkMQoNAp0yb6VcbWDWpqUr4U=; b=ALJ7b+JbCMeaM63G
	rzeiUWyjlWMpOUAyLjwoiKwzdmv/sQmNj2Dk1HMlLluLfhih5Stn1+j/GxIUAyDf
	ELBR9PEzvaeo4yTPPmO8eFDBzwGBPSYAjlAQTIqPkcqpGWQphRcRRnQhFb1wi180
	cQKdmrZboqT+/WY4GIx0DVRbiA3PWw5n/j6eF0xW+zGWWhmbzyTfXd7lVBl9ZCR0
	ZB+a5xT2mytwrai8P9fb+oIAWmrtX8oFfsI6R9ZVtBxaX7VvBzzRU6O2wOJQNW04
	MlcuqpiTMSMjJQejRatER7PvTFWgoRI0vVp7npnEk4Ks/NUDxqhVgr9YIOfj558W
	OtNa1g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccyfb2y4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Feb 2026 16:46:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8ca3ef536ddso8948385a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Feb 2026 08:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771433204; x=1772038004; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Wa9GX10RqICwHPztX1CkkMQoNAp0yb6VcbWDWpqUr4U=;
        b=kFyIvo70196twKGyn9UiEV7sWsvWLKhro+SFLXvNOxsqiGKqQPkoZumlWvulNhgP1F
         AJ1juriFI/yW4mBmSIZmy+JiO4ktrnEORTDPDn5CtA5STrQUMHosx67uvJd2OSLzzU18
         dtYMCL3mHdflfoESFn0XdLKOATrpfci4PkChbKfy6XCbU6DbLYxe8eKzyIDlYCIqY0Gn
         aaD0ito4GW8htwiPyyHtXMr8K2I+zd84CQvj3iv82LXGRIMCaNRSO7/D3CFCaWqCAFNE
         5QqirYVvqgxB5kdPCfeDFs5YpJ5KirDL70Kc6cwMQTHybOTdgHmb/79bect8QuffAveL
         4/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771433204; x=1772038004;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wa9GX10RqICwHPztX1CkkMQoNAp0yb6VcbWDWpqUr4U=;
        b=Q47vbvlw0hjxoZc6Rwi4Bo0GnT2/GyNwO93BuNT1O0IK51M9YSuLjUwWAe2ns1UcK3
         mThC/wk58B6pevXWnjhUSYbIGRPFOWE6FL3iNfCd8fXCCvNaEcB5B07N0E078nuy08RK
         YoGDP6MzkFYtU5LakaLdGCZLWQOXkR+ZqDKIz+Ln+29IlPQxBXP3zSoaa/sXF01nPhRT
         XjndQ2OJ/rsRZxP5cGwMKEu/Eurd+t2JxE3F7cevLj6xBtpyYOPUrpiCWnIu9epqOT4F
         Y02uONP27iPQ68z1kRYk1ffNcz28I7y4t2LoxSnmPE9Xsk6x/ohxHjhIzoetssQ6Tuff
         1Qfw==
X-Forwarded-Encrypted: i=1; AJvYcCU8NnLnc2zBua+TDc9AhhzZAcdAlC5lmotC33FXkLmE9vCQbPYVl87HSPilpZcIq0Yxpzlou0s+9qX5i2GpSIzQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwHCGwIVdneeISTJPT0SJm2wXmnlhafhisdH1cCKeunjO9Igc4k
	Jos8Gj7pkLxlyJ8t2o//2aL8jWHyXOf67Xf73Hw38IOOukXaJEFm6skVZyv/e9QJZQ4qt9jspgd
	xCbcPglz5OpTGjxcY8jvVIU3OXAfVXPKeIuqB8AZ7eGdz0vc130ij3/2E4pcSSKO+BbqtJjUyya
	otxg==
X-Gm-Gg: AZuq6aLJIjc8tMTxlFp6mI/iHH5BXWEkoSkDZ2HTycb0F+rUIUhN1psePez2lfekykN
	q4ZKKG/kVvY3/FtpZxHZRCAPLsVCrYK5yu5wYUChdGJ7cdrKnfWDNtYSH0vbucVBTLGCnNCTMS1
	v0OTWw0HNT5D3UAHy5XRZFUHhuTWMJweLM6mf4vRnt9cWAXZp128fdyli+ewJ5qIilKeY84LIY3
	ENH3uHupjOih+004Qo8UdJ0So+0znVapZ+vP2nnMxMjx2xFw0LASGABTSbuTeL39mdK3yrwCBs0
	o64KU7F9W+aE2MENrg17hBpZcB5AMiWbLemjWBop8nFPCDvhj79I3wGthfXhALbg21/u+D48tAt
	HJIATP26d6w3HLZKxja92pWnvBZskqw396Vne9y6HWvTJ0M7JOg==
X-Received: by 2002:a05:620a:458f:b0:8ca:3c67:891a with SMTP id af79cd13be357-8cb42428bd7mr2255280185a.52.1771433203823;
        Wed, 18 Feb 2026 08:46:43 -0800 (PST)
X-Received: by 2002:a05:620a:458f:b0:8ca:3c67:891a with SMTP id af79cd13be357-8cb42428bd7mr2255274785a.52.1771433203170;
        Wed, 18 Feb 2026 08:46:43 -0800 (PST)
Received: from [192.168.1.29] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483983fdcc1sm20661695e9.31.2026.02.18.08.46.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 08:46:42 -0800 (PST)
Message-ID: <5e2f98c5-993b-417b-b27c-a683283d1587@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 17:46:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: MAINTAINERS: Include resctrl MPAM driver
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu
 <fenghuay@nvidia.com>, Will Deacon <will@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260216110240.159691-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260216110240.159691-4-krzysztof.kozlowski@oss.qualcomm.com>
 <aZXnbDZvzDnUKVoB@arm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <aZXnbDZvzDnUKVoB@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: R_yHuWKrvKdOZkBgt4NSeMu6PpEvPaIn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDE0MyBTYWx0ZWRfX5NWyOIONMOWm
 Q64pspq//V0pCzaavp2d7oYtfGSbgLevz2MvU+cmKprRqmhw0rb2jh890lwArYjWqa3v9mhTyDL
 TvZG8Tykag/XGhVaAZZizjZHShzoT0VZXODKF4urqlINg5TAZ8iQHyo4oljnCkYVwp7E/Acl1CI
 qI9/JEBlFTktuv5aGJANIGR5EvcLzrsgY8WAux6vpEOc596K+cgNMelhWcrShYwwle75ukaDT7x
 TIB5YoAaVfnkR7sQhu4su+746gcWA3UDZfLzx7GHyjKS4n1epQbyz9z9KfgAgC8edDchVuYZQj6
 iSp2Tk+tDdBodrQJZMGVXoMOs2vdoUF8A3dbbcFOCcyPSR5xsKijSn2VA0DPlxtIWh05uKZijyE
 t1mJCrGxZi4eXvtr+cOJPmnXmDtDlqaH1inklWOuJeffmi+UChw53tfcy64+37eAppHSa9PQtxG
 kBBD5bCUQCd2C2mNRjw==
X-Authority-Analysis: v=2.4 cv=JNo2csKb c=1 sm=1 tr=0 ts=6995ecf4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=QyXUC8HyAAAA:8
 a=Ikd4Dj_1AAAA:8 a=o2L9dTJEZln2RXGxqE0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: R_yHuWKrvKdOZkBgt4NSeMu6PpEvPaIn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_084647_072452_DEF49FE6 
X-CRM114-Status: GOOD (  17.64  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 18/02/2026 17:23, Catalin Marinas wrote:
> On Mon, Feb 16, 2026 at 12:02:42PM +0100, Krzysztof Kozlowski wrote:
>> No maintainers handling the code (so subsystem maintainers) are shown with
>> scripts/get_maintainers.pl on MPAM drivers in drivers/resctrl/.  It
>> seems that there is no dedicated subsystem for resctrl and existing
>> drivers went through ARM64 port maintainers, so make that explicit to
>> avoid patches being lost/ignored.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
>>  MAINTAINERS | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index faa914a5f34d..199058abc152 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -3822,6 +3822,8 @@ S:	Maintained
>>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
>>  F:	Documentation/arch/arm64/
>>  F:	arch/arm64/
>> +F:	drivers/resctrl/*mpam_*
>> +F:	include/linux/arm_mpam.h
>>  F:	drivers/virt/coco/arm-cca-guest/
>>  F:	drivers/virt/coco/pkvm-guest/
>>  F:	tools/testing/selftests/arm64/
> 
> What's wrong with the current entry?

I explained in the commit msg:
"No maintainers handling the code (so subsystem maintainers)"

It does not list the maintainers picking up patches, so if you use
standard tools (like b4, patman or scripted get_maintainers), you will
never appear on To/Cc list (relying on git-fallback is wrong).

Of course maybe you will still get the patches with lei/korgalore, so up
to you.


> 
> $ ./scripts/get_maintainer.pl -f drivers/resctrl/mpam_*
> James Morse <james.morse@arm.com> (maintainer:MPAM DRIVER)
> Ben Horgan <ben.horgan@arm.com> (maintainer:MPAM DRIVER)
> Reinette Chatre <reinette.chatre@intel.com> (reviewer:MPAM DRIVER)
> Fenghua Yu <fenghuay@nvidia.com> (reviewer:MPAM DRIVER)
> linux-kernel@vger.kernel.org (open list)
> 


Best regards,
Krzysztof

