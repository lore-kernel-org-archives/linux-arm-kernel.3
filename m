Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9036CCA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q9QXSmcQk7wiCYlKK6+sUB3ZaThL+9sYBmMDwHt3Hjw=; b=4fCedZ+UBoEAx9uh36q+9VNaI3
	HZmOdhEDXiLBV6b5jsxmqB6eO/Xu+80PeRKYJrxsKekZiQkuC4is8Fu/wlRYuKor03tkMD2ibHskn
	vEJa9m41J/L+rSaA/8JebJt4do6X0AQGz36mI6JmBzav2g4WUrsCVZOtHalGr6X+W7c/1Jr9+HMcI
	oxc9jPpV//yq9K81qo6ZEaUtjsc5HY0zTOEgsGnYXYVZLda7Z1GXz98yX2eYalcgt/WVgS8qwD1NP
	bjGiV3O+zHjvo6pRz3F9A3GbhVSmbpry7L2MBGUeOa4rCd7BcsjZXPpEyvXixt3ngjCfL/ZZZVs8o
	PwaN2ddA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloEr-0000000AhyM-00L7;
	Tue, 12 Aug 2025 12:36:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkEC-0000000ADbU-1Tvq
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 12 Aug 2025 08:19:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Q9QXSmcQk7wiCYlKK6+sUB3ZaThL+9sYBmMDwHt3Hjw=; b=VFLB+qQQOtY2dizvNu5X3mtvdO
	lk8xxLQkCvMyceq0lu/J/XuVPaz+i6DFA98hBXt0hYgHwX3FaRwOXXq3mE8qMwcUxsrxR/iuOnbqe
	rh32ocBcMKe1VOpyLOoaMz1rWToGFum/6YuHH6GtPkPNze6W5usxMcC1kD0NaHnDoKwpqT7tNypJS
	Ed6dRYZs6+n92cCAbJcnOUdnfsx8lCMn7jpB8wSJeZTHL5WSm8kvVYz9KmirCt7M8NvnoP+t+NIYd
	D8ASOy8LgHeO8QoSqVeH5Sm7wF3ALivTPPsOgNJInWrB0Jg2ips0Bgvk2mDjQ69wwyuXQ129sFMvi
	928uH6TA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkE9-0000000Fkcg-06DL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 08:19:27 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C5YmUH021869
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 08:19:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q9QXSmcQk7wiCYlKK6+sUB3ZaThL+9sYBmMDwHt3Hjw=; b=ezgowA1EbOUDJffI
	bn3nOy6A8tGNpwREDt9jRMaC0mnVUXTda4NpvPAydJd1LgMMRjKbQqKBIqmz/Oqn
	Tl5w1w16g19eIgJiHIuvLJjHa0Oz9B6jC6vjFsdUVZN9woZfXa9s3dp+EYd116Dd
	8YySwdbjtjmlZ7qQZ1VG5iCTNORZX6hQBRMkVtrtspu1OEq6Ounfu1aPMmMwm29i
	3rvFGlhuo6rbcoRBFVlOJ8Eq2Fl0oqZn/jrcSFdcRtB3+LX5wMpefISAJ0L1LY+v
	GREiFwJdv3urjq0tg/R40lghQQ8FZpEL2I4SmR18rC+5dIa1mflTTPNNmToE0ufw
	xG+4ag==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxj47c12-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 08:19:20 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-76bf3e05024so4952868b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 01:19:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754986759; x=1755591559;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9QXSmcQk7wiCYlKK6+sUB3ZaThL+9sYBmMDwHt3Hjw=;
        b=O9bKRWKpykdoA63PcAtEmhylnSrz66Dau6goA2UnrQ3zS8UH7BE9IXt3jqZZLqcbCV
         8j/0cobE0X4Y5Ky9k0Juz3sjLOhaU1Cb6qqx/BmHaPtwgWcs9gdrYNa15FxAK+R9tXLy
         9c4hVrRyHwMu/PHSBnOHzoSQOFis3j7auYYGjCxBQ3p50LAv4e5QbZXjdAi66IqKCNGh
         j5P1eNvmbDZy8Qloi799RFchO3U4RWOZcbUk/VuyOrg2Jr0S8fRQL4c/L1YC39MEdwRF
         c2csVbO4UrBEMEkH4KsJ5CKs9hur1k1SG1y4Jmvae6d21WedKK8oT263Am3FYdZOOYb5
         4mXA==
X-Forwarded-Encrypted: i=1; AJvYcCXblFlJzmyagP2XqzeBuncs9dFPFF9fYSV6Y3aydtzffNwpJTcYxj7g6wt/hvbTQN3yNJADKR3sVQ5Wo+4IIIta@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7GxC+jBt8Ohu0q1w4aZqvkfh2vdI6j3SBTW11ir2CZ1M7ZLEs
	mPPisHcGHuzyKFU9C2HQLSJfsdEQ0/msOYloAMieuY/1NYDKSwIe11yTTdGPFYQBEfq6aJk9My7
	lJzXw/f0+hVZSNcAbSNP/ce8HlsrjFn1T4DnqjO8SJLh39BzZmC7XVqe0HjUEAmvww0CDsEoBmS
	2Tuw==
X-Gm-Gg: ASbGncs2KW4BxMu1ILrNhASqg74rnXBwxb2qUwkH3U3SdMYdnGjaechdHEoapYFK4b1
	3iKnNkqMvyhdxsA+ax+GUQL//5ae8XO/ONiQcKNVwfpAB7BdIJ892g9dZg7OTmbELWBBj0hiewk
	s8uvLXeQr/QZ1weOCKQEpLg+oOFIu37BwgJ+eEv6/0UnoAeUmFpUVdHrM2MvP9AtFHL1k4pdmIf
	XLRVhbUJ0YCVO0y0m8CKUyNlx598zIxQpNJEz2nmAo+dv+Xoo4ierhA+ZE0QwLf7ZvPkjWn7iSj
	rD0w7g+KHbsDPU9jC2a/X+rn04IRk5Vbh6gEu0Wj/wReSF9jTsddg1ZBVmlAu+SjgtTIdT5qIPM
	ezRF+hfQx/v1LZxOQgtO+ixo0VEEYDAiO
X-Received: by 2002:a05:6a20:258d:b0:21a:eabb:ab93 with SMTP id adf61e73a8af0-2409a895f7amr3711444637.6.1754986759512;
        Tue, 12 Aug 2025 01:19:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEO10xU9ZfSLkw9mApIC6RN/5DfAeAo3uPA3QI869bvJmzxE2pfjh+sEvtPpS8AVW8pX0riA==
X-Received: by 2002:a05:6a20:258d:b0:21a:eabb:ab93 with SMTP id adf61e73a8af0-2409a895f7amr3711410637.6.1754986759024;
        Tue, 12 Aug 2025 01:19:19 -0700 (PDT)
Received: from [10.133.33.10] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce8fa10sm28728852b3a.52.2025.08.12.01.19.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 01:19:18 -0700 (PDT)
Message-ID: <85dc8b0e-bf0b-44c7-9ef8-cce460fd1d22@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 16:19:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight-etm4x: Conditionally access register
 TRCEXTINSELR
To: James Clark <james.clark@linaro.org>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
References: <20250811-trcextinselr_issue-v1-1-ed78f3215502@oss.qualcomm.com>
 <de68756d-7ef4-484f-8eb0-26a88ed41cad@linaro.org>
Content-Language: en-US
From: yuanfang zhang <yuanfang.zhang@oss.qualcomm.com>
In-Reply-To: <de68756d-7ef4-484f-8eb0-26a88ed41cad@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNyBTYWx0ZWRfX0cToo8Ctm2ag
 EjHLbbXr8c2GCgrJgZYS86tD2gePZliTkzC0I0x8Bfv+VW4UizCgURwuHXcW/XoJAWFRGdEav7N
 iz6NqF36LTQ+GHIHLOiP3iV5O/ffae3ABqIZrAkttFHAfqm2q+KfdxYcv91gk56gZBkXCifcEre
 WT3hI0I9QyBwCjji+jDIWUPP+Pky8pa8dcYw6DNTO699u6tdJotOslVNw6gpTl0Yh+2DT890Jn7
 5e765LmBe8O69jlKjGgCOnvNKB+Qg+K5h3YQ9J6FZNSauz3ejYuwPBqtxeEv1pukb+951OEO5AG
 7o54CMgYQJeWbz/a4h9qVw1OWqHzvDs3I888OVyhs0V5SoJKLrWyOIKtD+ezbO4eZsIQLPZG0nP
 +HXQ4mmJ
X-Authority-Analysis: v=2.4 cv=fvDcZE4f c=1 sm=1 tr=0 ts=689af908 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=bRSsP4KCScyoyIGQGosA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: GoO4jv1dMct1xmL7U0RzceCP3H6IOyJS
X-Proofpoint-GUID: GoO4jv1dMct1xmL7U0RzceCP3H6IOyJS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_091925_492774_34DF7EA9 
X-CRM114-Status: GOOD (  22.13  )
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


On 8/11/2025 6:25 PM, James Clark wrote:
>
>
> On 11/08/2025 10:57 am, Yuanfang Zhang wrote:
>> The TRCEXTINSELR is only implemented if TRCIDR5.NUMEXTINSEL > 0.
>> To avoid invalid accesses, introduce a check on numextinsel
>> (derived from TRCIDR5[11:9]) before reading or writing to this register.
>>
>
> Looks like this should have a fixes: tag.
updated in next patch.
>
>> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 11 ++++++++---
>>   drivers/hwtracing/coresight/coresight-etm4x.h      |  2 ++
>>   2 files changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> index 42e5d37403addc6ec81f2e3184522d67d1677c04..8a9c4caceff0165e4fce7ac4250f3e16ccc1d34e 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> @@ -528,7 +528,8 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>>           etm4x_relaxed_write32(csa, config->seq_rst, TRCSEQRSTEVR);
>>           etm4x_relaxed_write32(csa, config->seq_state, TRCSEQSTR);
>>       }
>> -    etm4x_relaxed_write32(csa, config->ext_inp, TRCEXTINSELR);
>> +    if (drvdata->numextinsel)
>> +        etm4x_relaxed_write32(csa, config->ext_inp, TRCEXTINSELR);
>>       for (i = 0; i < drvdata->nr_cntr; i++) {
>>           etm4x_relaxed_write32(csa, config->cntrldvr[i], TRCCNTRLDVRn(i));
>>           etm4x_relaxed_write32(csa, config->cntr_ctrl[i], TRCCNTCTLRn(i));
>> @@ -1423,6 +1424,7 @@ static void etm4_init_arch_data(void *info)
>>       etmidr5 = etm4x_relaxed_read32(csa, TRCIDR5);
>>       /* NUMEXTIN, bits[8:0] number of external inputs implemented */
>>       drvdata->nr_ext_inp = FIELD_GET(TRCIDR5_NUMEXTIN_MASK, etmidr5);
>> +    drvdata->numextinsel = FIELD_GET(TRCIDR5_NUMEXTINSEL_MASK, etmidr5);
>>       /* TRACEIDSIZE, bits[21:16] indicates the trace ID width */
>>       drvdata->trcid_size = FIELD_GET(TRCIDR5_TRACEIDSIZE_MASK, etmidr5);
>>       /* ATBTRIG, bit[22] implementation can support ATB triggers? */
>> @@ -1852,7 +1854,9 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
>>           state->trcseqrstevr = etm4x_read32(csa, TRCSEQRSTEVR);
>>           state->trcseqstr = etm4x_read32(csa, TRCSEQSTR);
>>       }
>> -    state->trcextinselr = etm4x_read32(csa, TRCEXTINSELR);
>> +
>> +    if (drvdata->nrseqstate)
>
> Shouldn't this be "if (drvdata->numextinsel)"? Or it needs a comment saying why it's different to the others.
typo, will correct in next patch.
>
> Otherwise looks ok.
>
>> +        state->trcextinselr = etm4x_read32(csa, TRCEXTINSELR);
>>         for (i = 0; i < drvdata->nr_cntr; i++) {
>>           state->trccntrldvr[i] = etm4x_read32(csa, TRCCNTRLDVRn(i));
>> @@ -1984,7 +1988,8 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
>>           etm4x_relaxed_write32(csa, state->trcseqrstevr, TRCSEQRSTEVR);
>>           etm4x_relaxed_write32(csa, state->trcseqstr, TRCSEQSTR);
>>       }
>> -    etm4x_relaxed_write32(csa, state->trcextinselr, TRCEXTINSELR);
>> +    if (drvdata->numextinsel)
>> +        etm4x_relaxed_write32(csa, state->trcextinselr, TRCEXTINSELR);
>>         for (i = 0; i < drvdata->nr_cntr; i++) {
>>           etm4x_relaxed_write32(csa, state->trccntrldvr[i], TRCCNTRLDVRn(i));
>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
>> index ac649515054d905fa365203bd35f1d839b03292f..823914fefa90a36a328b652b0dc3828b9bddd990 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
>> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
>> @@ -162,6 +162,7 @@
>>   #define TRCIDR4_NUMVMIDC_MASK            GENMASK(31, 28)
>>     #define TRCIDR5_NUMEXTIN_MASK            GENMASK(8, 0)
>> +#define TRCIDR5_NUMEXTINSEL_MASK               GENMASK(11, 9)
>>   #define TRCIDR5_TRACEIDSIZE_MASK        GENMASK(21, 16)
>>   #define TRCIDR5_ATBTRIG                BIT(22)
>>   #define TRCIDR5_LPOVERRIDE            BIT(23)
>> @@ -999,6 +1000,7 @@ struct etmv4_drvdata {
>>       u8                nr_cntr;
>>       u8                nr_ext_inp;
>>       u8                numcidc;
>> +    u8                numextinsel;
>>       u8                numvmidc;
>>       u8                nrseqstate;
>>       u8                nr_event;
>>
>> ---
>> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
>> change-id: 20250811-trcextinselr_issue-f267afa0e5ed
>>
>> Best regards,
>

