Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A83C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 17:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DNs1y/XC3g0OnCiOoRpL2o87x4tEc7z7kiM7MFcFVrw=; b=yqAKWaXzylx9dKzfMWYb38rc90
	EQ/mgd8wu/SdoxYQjFkFi8hIhTDvpzjihVjX4b3sHQjGZpjOp5Aym1g1jGa3uSahtDH5CpQrtdZro
	Es/K+XiRkgJpzxS0ljnVtd6wSHO1RkHwb8f2pRAWRjLQQZYUh018cvP/1BkaEs80dBfnhJnk3VaU3
	sNEPbQAF4xCpJQ5xa+dSugfIPlo7NUMwUXDRJTQ83niaW5YmizBenmnRKvekeD5RnfmhUwM2vGbSV
	jrCmND938nhWNIm5LAvW99yZK4dAMNKIxsfVMwgt4rVGfrALI0sVcAqrftTTk5Z38xt379PXMTgDx
	wvWKjkIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzHdE-00000002plR-0rWd;
	Wed, 26 Aug 2026 17:41:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzHdB-00000002pl3-3jQK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 17:41:47 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QGuf3e901504
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 17:41:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DNs1y/XC3g0OnCiOoRpL2o87x4tEc7z7kiM7MFcFVrw=; b=X1ZJBQEI4m7075Qf
	RMJ9LsQNmoixFMkQeZXtBnHrVA6gkwQVkf+E9WO6BD8GhEeurHYQn05SEytvXNE9
	rnJw9zzSbCqyrFhMD5liUDwFi8h53vuc9knw2VByDe8GM1OCNDTJLjGMo8irFhZI
	4xwAMUHQeGHH75vWCdAb+54EJjMY39szLIODzPZiDZ3HLjpL1+Bk/YdchE6rdP+H
	EHhuPETBGl+ULvKdnXyXlOfWfeZaJIFPj39ohnk8wC1E7kDWPhNY5sEzK2vCSDuz
	jJ8DjURpQohW6eZnXkL2ren693FWHP3Iz6cF8dYUm6t2ehfhzHfnn+bIJmIsnhTy
	XIRNaQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga03u1ams-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 17:41:45 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84a251c2e3eso133051b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 10:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787766104; x=1788370904; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DNs1y/XC3g0OnCiOoRpL2o87x4tEc7z7kiM7MFcFVrw=;
        b=ZrvVAMWctp6gbtukfylGdFbIopg2+jAwQY5hzsnd3J9jwRYZM14j4IKXxiiaY5opAb
         V1Y533q1v1uyeKk6/+zPhHdba2yALIif9BUK1xbip+bYYR+dCOxcuTQHb45M0LJFHOz3
         ycODE5U2JhrvCOarpXPBmJbLFLlZ0o+lPbgo8YGP+6OpmJSOdPVeV/U+F77eXSxek7Nx
         ZCg6iMpCGINJ/PyZOy+6WEi3tj2rJJIgC732fzgzYYKf3LroLjw3ejlPGQf1DdF6pIIS
         f9H/oGnBlbmA4E9P/qTEBL69IzW9li+9+CFiVZXmhTDesV60YV+qHtrv6pZv4hITd8nY
         G7OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787766104; x=1788370904;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DNs1y/XC3g0OnCiOoRpL2o87x4tEc7z7kiM7MFcFVrw=;
        b=rar5w/ekcJyBbgdLkFk2olKIhGNTL18JrNacsgI6ukgbfUFNVNSvrw6EZ8nmr8OKfU
         jFQd+SJoQXt+6GiCUlXzK7O8fKTcP6mDQwB1XgXWZVNfDUZ4orKx/ElI7wxMa3Ws5dRs
         NNcfCewcmDXOIKyfu5/DLDKHbkInuKTnim+t33s0HZ5z9joh2/VXiOsGnebUD/2jU4I1
         ctHYAL8O2Q4e0xjV74Ui+xqPJW4WunhHpQ/KFCOmK6V9oW7oB2TMNoiG2Ru3+nIaJKnL
         AGVv0ng3o+1jClQGQwm+XAHhyc8EZQ4Tci+mVEhzEjHlVTmwb1eogjZgvd6rCRH2A/mD
         LmtA==
X-Forwarded-Encrypted: i=1; AHgh+RrnZvd1PpqCcm75G6NG/Gp8dwzDPZWrVIxYBO4b4oCzzgfQSU0NN0KCy5XlFjQDgmlGyqLZtwqxurXvmNxGDoyg@lists.infradead.org
X-Gm-Message-State: AFuF++nV6qmvkuLYmn2fSgPxeZ7zfiN7+qhtt8ETgh0SZusIUf4bxm1U
	dQ3caPhkFitNfQ3CN7fgTSI6fHGbKkkznBztWUarPq/43wskjwSWF+I7gblzjfdZALp0lwhNFTs
	w4WTTSm6aEWMC3BpBv9e1cFuOtJ9wBe08CgYEXoRyvzKnKsE8ariDW8avacsKhGAubUpMYnwPIb
	0SlA==
X-Gm-Gg: AR+sD13bzggt5tKGeL/19TQLTxqYLnZIS7n1OOLf0pBOoXM5kertIMvAp7VNr19ruK8
	C7edEee1YrVZLUZ/mMF+IrEE0J30qz3DQBj+emq17Wu3R4HeQoVB8hbEu79ijllxoMKTWsTjdKv
	+k+FEtFsxy7bfMptlW/IvS4BMgGJ0PkXu4s1OjTHOYpw8YurMxTuCDbgqr+ttet32/sZrPFh882
	dZaKWMwYyWEygUrRyXxzJlO7vHEZfS7P1IJ1FJWwE1zArGVdzeP+v27AMImvHlqTG/tmm4Dvj2U
	5zCne9e2W4WQFLIH7uX6uB6AkQhYbbsYMUqfgK4WGWKTF2XLDWFHdtBaEoRUpIKic4PqIqV6S5V
	6MihwebmhMBanOrTLbD/nzoyYYONWpeyGlnriqR4EmNwZ1Tae/w3Ny+EYYkqR2s7aKS6Ns0PIKg
	u1MwdxSMFS5RYKaRRebA==
X-Received: by 2002:a05:6a00:2d0b:b0:851:80de:db56 with SMTP id d2e1a72fcca58-854c892307bmr887216b3a.13.1787766104025;
        Wed, 26 Aug 2026 10:41:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d0b:b0:851:80de:db56 with SMTP id d2e1a72fcca58-854c892307bmr887137b3a.13.1787766103429;
        Wed, 26 Aug 2026 10:41:43 -0700 (PDT)
Received: from [10.50.45.102] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8535d345ecesm1230693b3a.59.2026.08.26.10.41.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 10:41:42 -0700 (PDT)
Message-ID: <39fbb239-ea0d-4168-bb20-07bfa10bc539@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 23:11:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 07/12] arm_mpam: propagate MSC access errors for
 mpam_reprogram_ris_partid()
To: Andre Przywara <andre.przywara@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Hanjun Guo
 <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
        Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
        Trilok Soni <tsoni@quicinc.com>,
        Srinivas Ramana <sramana@qti.qualcomm.com>,
        Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
        Ritwick Sharma <ritwick.sharma@arm.com>, Gavin Shan <gshan@redhat.com>,
        linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260807105451.3728284-1-andre.przywara@arm.com>
 <20260807105451.3728284-8-andre.przywara@arm.com>
Content-Language: en-US
From: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
In-Reply-To: <20260807105451.3728284-8-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE0OCBTYWx0ZWRfX/8479kDHEOzP
 Kj4VVrF8DAysoR8syBPkIwW9l/bTxd4Kb2QMHkBR2HO8Y22rh0iXW3k6q0lWPADSn344sbwcuNN
 fTDP2tYqL6iwdL0kaEWngcwD2lBk2QVArjC+c+uC5rw+38gylps0uGIfQ9yFeR7xOLC1KJioKYq
 nMbFGcU4RVk8Xy6XTbE2Lx8TlSQghp1zuKWrDeLpSfc32cqQLtqisuXP9jO5mtt8x9Y/0+eJ4vF
 KSK0EkCWFFEIaU95/h7Bitr521VHFGlXTGdHc738vcOCiWZpPl1WR3oo685wTR1a9EuLGcVzeHs
 IC3dN1UAViGrpzAbmKs7LV5Ig6FhBpUErgBaZPZsT+7HSZgyl55r6PkRVwJqLYGqk2c9b6dQk0L
 0KvZ7keHm3dWDLoFTJ6B/vUgQlfIHD9iGNYV7oHkhI+aXqdWQWr9JaWTVg+vfXJdd/OMwaazgny
 TXta8gApcX3NchafQrg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE0OCBTYWx0ZWRfX0hagZahbL8/E
 w5paJW76CKCQMvdovp/8xiX2G27A0GIPFhxo8vGu8WZkjUh78x/DHgEzXZ1oxz/bAZfNAm0TmKy
 FT0CBh32ONq6c6wEyPTlX5iGerG7/14=
X-Proofpoint-ORIG-GUID: h6ymTWi2fHY4qXoY4gnM4bxAnUEi5GVN
X-Authority-Analysis: v=2.4 cv=RcqgzVtv c=1 sm=1 tr=0 ts=6a8f2559 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=K_wyc9vDMbpTIRadLRgA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: h6ymTWi2fHY4qXoY4gnM4bxAnUEi5GVN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 bulkscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_104145_939403_216A4349 
X-CRM114-Status: GOOD (  14.59  )
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



On 8/7/2026 4:24 PM, Andre Przywara wrote:
> Allow the mpam_reprogram_ris_partid() function to check for and return
> errors, and propagate MSC read and write errors from the lower level up.
> This also covers the callers of this function: mpam_reset_ris() and
> apply_config().
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Review-by: Ben Horgan <ben.horgan@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Gavin Shan <gshan@redhat.com> # on NVIDIA Grace Hopper
> ---
>   drivers/resctrl/mpam_devices.c | 137 ++++++++++++++++++++++-----------
>   1 file changed, 94 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 96579178f0c3..49239b15a27f 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
Reviewed-by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>


