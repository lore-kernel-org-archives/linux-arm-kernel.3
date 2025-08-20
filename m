Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 439B1CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 08:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nly9DoWpxiIK3Bux+9KCd5jXpmFRSSnatyDWGlMobUY=; b=pmnXWz1L4wn6yT2UpmmiLPm5kF
	lO983pJGySatB2VuP1Cfv7LyNMeYZ2pWSifm2mvyxJGJcGT6R4hxGgsqQhTQy+W/cj/pV/cC0qHtk
	PZ9q/O+zBueOBW8jRIY5Moub9O36ndJ8N5y9y9bMjzVt4eXwujR5exnxcTTlpdz/83sp2CYUQOsY4
	OUXL4NaPUprhQbB4inrUpBjkDPDCsiESIw391hMtGC48P+02aTBdiN7ZFoSyfqF/khtpz6pYYx82Z
	Kc+E07uItwuoNGVEj2Jna+GAIExzfTVsYCfKi+Apwu8FnlgMmo8/qgCEDFYf5OeMfAMWdKTS6TdO9
	NiOEKi8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoeUx-0000000CnLT-3E4a;
	Wed, 20 Aug 2025 08:48:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uodKq-0000000CcFk-3wQE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 07:34:18 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1pDn6031596
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 07:34:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nly9DoWpxiIK3Bux+9KCd5jXpmFRSSnatyDWGlMobUY=; b=T+8V4XH0XIabcTiH
	+IVr4RJF7+wP1APLtXeMWx4sifFCv2vr/EQlpAAI0REykMRM8JFYRhIU/fUScWc5
	TqP/n7M28abxbu0hCs+Bny+nmQCVkFTiX1lq5+7I3QIeOLWjdAk675s9pJ04a5dx
	eUdS3ok9vpnHMaxob5IferiocSMwMDo0gtgQ0nwNZD83XvidrYZsak0pJGQgBznO
	KDCqAlI7VPaICCx2AMfJMvTGAVHCWILxb2PlJZ/CHTbgaJ+zgKsWe4wqUG40rCF1
	OtGrAAWwoXlSNkiGo5gufFwdICs3jtSPp9crF0ez433cGdYgqWaN3PuBi3GIVwuS
	ZPDMiA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52dgt3p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 07:34:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-32326bf571bso11189732a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 00:34:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755675254; x=1756280054;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nly9DoWpxiIK3Bux+9KCd5jXpmFRSSnatyDWGlMobUY=;
        b=slPkV60kYa9tlKZD+t69i/4hUQtBPgJpmbnc02nHLsS8cgtFkV3XWm5rfNshUbrZzi
         rAOl3GwzLlFKKcyGsmSJwdrYgivY/wf4UHDG2pZWSNrm+S4IgLZqS3EH9PHbEBOSyj7q
         j//vCoyX2fvJsN7JF68bAqRF0GHLcx5mWX/L7drAAmOphXYVREDyJo7gMETf5j6bFGWk
         fe66IFTxqji0GMrnX4D7sqqI6T64eGaskVbYR2g7wJQZDobaZ4jdhnQP2Aj1nI31OinW
         32mS4KqeAGeXtmt1OhZau8lT6XTctFSzB3aVLHIPa1ONPmv9I9aGNWg/OWpBcHXvzowb
         K5HQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwQ57grIv7Nc4JwcX9Cvv7BIDvFI0yTAcXA9cPW+2dduxaUb57+2u11gjBaqns5zYBvE6YZoT5jX6k8ZKbWyzK@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1lwQw2WkpVWQiwUTF2MlnnLc5puileSR0M2qWRLW6eaKIATFf
	HyAIBIvPd6PMpTy8r1ENafjLk5uE1w2zMMcg+A1yUGK0Zxz6PgXcA8syVg/WfXN1S6ewnjrVz4p
	OTFSHom3EtLrnr7x38WTpwfWRnOmycDjBYlIwzy4/9uFY1yn3ubxGwLU1o7X3S2tZ+UNDy6BGjH
	0aNQ==
X-Gm-Gg: ASbGncsh7/ChXxIz6hHxa/x2JR6XPlRmMZ+4rQR6HTnjwjFXXZc1Jormes1abU5JcKy
	KqpNJqy2sp3CCAVVMmfXhAwTkf8lvpaXNHoTjJOg0SvFfh0/wSwIz1c5qaIYtrix+i19Sc3yUWu
	FHpJs0pDKTYWlfrD1s1yAE7DwpK9kWfBhgc0fyrE2fl13O3WICB5cJ2upDmBvVHqW7qeuHbKQ8i
	zDMPcyaKLiHakqGTDwP0kqIMuTJYqAM7RuzOz3sutP7rosu59coeQ68WpEwkiWtJqK0BsAcsP76
	LV6uEb8znhmTmsjnvaRvpw76fGkX8I17SuDFmyWMGvnECggbJ9oYOdmjYfzLXIxpD+uffAf4IAu
	WwtHhiAff8ATGnjI8H2d6+d0tr41AkyamF/Y=
X-Received: by 2002:a17:90b:3844:b0:31e:c630:ec93 with SMTP id 98e67ed59e1d1-324e131a899mr2888523a91.16.1755675254439;
        Wed, 20 Aug 2025 00:34:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXDivTvpj3UqHfz74ALWqU9rV4LJoYCvA5ve9X5L/gyN4sJRnjaY/HUd8dxtuv2EansQoL7A==
X-Received: by 2002:a17:90b:3844:b0:31e:c630:ec93 with SMTP id 98e67ed59e1d1-324e131a899mr2888485a91.16.1755675253861;
        Wed, 20 Aug 2025 00:34:13 -0700 (PDT)
Received: from [10.249.23.102] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d0d14efsm4661557b3a.2.2025.08.20.00.34.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 00:34:13 -0700 (PDT)
Message-ID: <453a4f7b-78dd-4831-904a-27d882400c6e@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 15:34:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] pinctrl: sx150x: Make the driver tristate
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        dmitry.baryshkov@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        xiangxu.yin@oss.qualcomm.com, kernel@oss.qualcomm.com
References: <20250818-modularize-sx150x-gpio-expander-v1-0-c2a027200fed@oss.qualcomm.com>
 <20250818-modularize-sx150x-gpio-expander-v1-1-c2a027200fed@oss.qualcomm.com>
 <CACRpkdaeAqD=mpG4y16CPKwJ=pjATY9TxeRnXR9abziCOQb-0Q@mail.gmail.com>
 <aae972ca-5b8f-4329-ab32-12da1522e01b@oss.qualcomm.com>
 <ab60bd1f-0000-47a8-94fd-899b4e3eefd7@kernel.org>
Content-Language: en-US
From: Fange Zhang <fange.zhang@oss.qualcomm.com>
In-Reply-To: <ab60bd1f-0000-47a8-94fd-899b4e3eefd7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX00zkHnJH4sMa
 rGrhrMD9wgDIXpIGHpybxIFnyzbylub2PtPeIcLDvvOayeM1Or2Qf8TIPShjCBSW1rKuti5latX
 sZskXGXmu6Zd5LNk63Oz2xv3w0A9+9RC2fswqgC1+H58EpRFlfp5FJmQQcd2sRn7ft3Bzh+StWM
 BTNHKX0j3WMpQ7qxbq3RzusNWB/QJn+xjs4Kyz4oGRb0lyBjY+fxtys0G91ztZ7CEP+uPNtTdyH
 pQnMCoa3i2C3EeouvUyS7nRRDl6gZqL9vsEbPBr8eLbSpUA5h6xCIUTG3mRD9n4g9t9cxynRq69
 AEmdZZGUPR6QhSkTL+PRx5oCvcnNkWe+dpdQFR1rA89kMqCAY53+ooW87FWLLZAUotAgUBH1Vkv
 vGyLfE7gm/Z8pPeYN+USMutchyVyQA==
X-Proofpoint-ORIG-GUID: FmmqiFO57oC-ChuZ9lsAPmDneeoFFRPM
X-Proofpoint-GUID: FmmqiFO57oC-ChuZ9lsAPmDneeoFFRPM
X-Authority-Analysis: v=2.4 cv=SoXJKPO0 c=1 sm=1 tr=0 ts=68a57a77 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=ss4ELvlYdx4pI-vPaQ0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_003417_098269_ED0E608C 
X-CRM114-Status: GOOD (  19.81  )
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



On 8/20/2025 2:18 PM, Krzysztof Kozlowski wrote:
> On 20/08/2025 04:55, Fange Zhang wrote:
>>
>>
>> On 8/19/2025 8:55 PM, Linus Walleij wrote:
>>> On Mon, Aug 18, 2025 at 6:41 AM Fange Zhang
>>> <fange.zhang@oss.qualcomm.com> wrote:
>>>
>>>> Set PINCTRL_SX150X config option as a tristate and add
>>>> MODULE_DEVICE_TABLE()/MODULE_LICENSE() to export appropriate information.
>>>>
>>>> Signed-off-by: Fange Zhang <fange.zhang@oss.qualcomm.com>
>>>
>>> Fair enough!
>>>
>>> This patch 1/2 applied to the pinctrl tree.
>>
>> Thanks
>>
>>>
>>> Please funnel patch 2/2 through the SoC tree.
>>
>> Hi Bjorn, Konrad,
>>
>> Would it be acceptable to include this defconfig change, or is there a
>> preferred process I should follow to get it reviewed and accepted?
> 
> You need to send it to them... Cc-ing people on random email does not
> solve the problem. You need to send the patch to proper maintainers.

Got it, will update in next patch

> 
> Best regards,
> Krzysztof


