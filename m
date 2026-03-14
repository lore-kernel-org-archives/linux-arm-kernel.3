Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED6AC107BCF8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 07:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QU2LBcgAvCPPWBcn4VVnnvgq9slBddM7xfCczZ90R/I=; b=YvADvQpwPMZBgkMRbKyYYDlCKM
	k8Map2vOIc+69F8DWmV4RFYC/UmYEvoboRLi8GETvB7gWU+0MnkDuDQf7C/PYVvaALtNLOI90odzA
	QtYR/8yqkt1ePVJfnISE3eZU3M9dKFve8Frtv66vAqy0OTTGAL3VcX8hOGYPHQxhw/lUNclmNg6u/
	2r8yUxuTVpRmzlRnZdgZZIblbX9D2oCxUHFLEWljOsk7Seja4o8vjmi7gNueRlc98wvRHnYR1YGbc
	3k34Iu2rQ/oWbedoSZG56IaSjBeKG7LnA99rj0WBvtphjAljvSXPptkAPW4v5830vqVVfTnzB9sVl
	YDoZvZCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1JJd-00000001a73-0AJT;
	Sat, 14 Mar 2026 07:21:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1JJZ-00000001a5w-2QQB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 07:21:39 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62E3ndkQ677410
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Mar 2026 07:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QU2LBcgAvCPPWBcn4VVnnvgq9slBddM7xfCczZ90R/I=; b=pjQdafnHGkZ+aKVc
	NdCKU6UoGRmo30NPqRauAzKQypsIDLgBGDrHWssiH8b1R80YvABqEinbEMBBWawZ
	jgAgkvb08v1XTTFuxikbLKktTL4frjF9Oi1T8J6VMi45tWN1Qlwv/4ZMLhhnI4sW
	hiUm5XfFAFqcnQX644xm8YJUkEZlGHsTL1EnhCdv/VJcpzhMJBHwXELJaGFXRgmS
	NM1X/wRj7GV35pfkp7Z7h6Zm0UxN9pJIzWil79wK9sPh+2XUM3JqG1/bf5Q0bcmP
	Bpn70+1aSiCG2JlNTR2u44goUcEBhsqvekqI2iwkW8bB9BGACdBvZLSkPvPVDzB9
	99DW8g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw03xgaps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Mar 2026 07:21:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae405e95f5so34315855ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Mar 2026 00:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773472894; x=1774077694; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QU2LBcgAvCPPWBcn4VVnnvgq9slBddM7xfCczZ90R/I=;
        b=Zcr+h6s1F7q7PuGup/7BxUcQZOlXaPFJdaGBt0YpqzasTReJuR7rdI3mgtZ+tC5D7b
         naPDD7cbu+EeEgnLdq0vC5oMKl7ZmnISShFwAcygjCDze8+euZvNM2ULEKDBrOSp8GpI
         5FHBDgMtOq3skCQih3XcrdZkhDDEkqNQfO9W45UIu1Ckqd6f0BBwA18pStBfJzdX3nIX
         L1WV//3C5Hl64pFdri4FvSScxyeYy8JjnGL4RcGPlRWNoPj1r2c9P/S0/29JzAte5Cjj
         rQhdrNO+Cx8Yq7kyvTx7Ki5TmHL67guDgdLP5xxKK1rsNZnnIG3UKVYLtWqFVIctmh7B
         meFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773472894; x=1774077694;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QU2LBcgAvCPPWBcn4VVnnvgq9slBddM7xfCczZ90R/I=;
        b=p25PPr4r4w//D3otxgFRRQwrSD+5yXZXc/33jTHPaV4f1vanvUg9n4fW+13mkkvvUM
         dvAG/1qH4ulV2bwJYDnmfgmKKPy79gyM0uZNWJ6rj+00oOTkaUVBx+9uMXzWmRdgjO+h
         y0m/UlEyu7db99ONyKP8nyfESxtoAPIjwyYSMFFP7q2arYBb6HMjCSC5nlHMmA5KxnkG
         1U5pP1bg/xIb5l+H4uxnv2YXASXacu3UZ5S9YfB6NNWobqH7OU/qLkxIex4i8xb1QviG
         Dn4LUCL/RSBO/ZeGhb9DnUQ14RBlonKGCbiKTiTeCdlpGfeAuDLYSzLKYbLNtrwXA9AG
         qPUw==
X-Forwarded-Encrypted: i=1; AJvYcCVKJvDh5ooCkGc0xLreDyoL5BRgC0T44X9HyDwlv/QjLsqFDAh+ntvXJlnWVTIQDyIoRZ0hEFk8suJvLGw+ZN2Q@lists.infradead.org
X-Gm-Message-State: AOJu0Yw54OW3wUm+tJX8jD2PDO3dpOj7WkCSeEbSDbZYY7e/O0QAphml
	U/uHU8NqMMgV4i85KrLL8a+DzajwWpwyjictGFgzwrM46eLaLMSLshOVKK9pkoXjU7rMh3NhYcZ
	eW6rkHyX9FstJoRMeNSFjfULg7tAhm1O4dKnDeWkJaoke8QFRdYyv0LjmnaqOmRaT/1yRKYU3IS
	umgw==
X-Gm-Gg: ATEYQzyxldg8H/AvdvR6pr5my5uyFwlqFyMA+evlQbCflNYjQMC7exmK3OXlrI6f6B5
	MxaYJgVIdQa+uZKtfibhzaJsXPmos4cuWStnkEwhaFDJktnaR+1NsAEH2k4/oISWsa4R02eiUxz
	kg87lRw3ILAEft4tIJDIJ9Ad7Q5MplTOyEhYb3xMyiyny3xcaBlXzx90qZcZuyKCmHJdVyeodwT
	b46JQI9jKiGXYElUTlNbbFICyduGnux4ckz0jjEYdl5L276LZE6T3V1LpMwCzZ+/fciRzN/p+PR
	6J3W0llMTFxB3kcJ3xlKZW0JyAKhBZHZRE7BzyS5HWSF+o/3r7IKCi0Plq21tZThTsnQ/gHBtO+
	PmRVSl05l53RGkYj8XgtpBHc9LwAlW8Qf985d93j4Ah7SPFoAhM1CiiBwULgLB8rX+eBlg5WDPC
	mQ05Ym//gn6g==
X-Received: by 2002:a17:903:2b03:b0:2ae:557e:1f75 with SMTP id d9443c01a7336-2aecab07540mr57768015ad.29.1773472894146;
        Sat, 14 Mar 2026 00:21:34 -0700 (PDT)
X-Received: by 2002:a17:903:2b03:b0:2ae:557e:1f75 with SMTP id d9443c01a7336-2aecab07540mr57767635ad.29.1773472893643;
        Sat, 14 Mar 2026 00:21:33 -0700 (PDT)
Received: from [10.133.33.24] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece8453cdsm41005825ad.84.2026.03.14.00.21.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2026 00:21:33 -0700 (PDT)
Message-ID: <7b40df1f-1c53-47e9-99bb-13d6d030eeaf@oss.qualcomm.com>
Date: Sat, 14 Mar 2026 15:21:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/12] scsi: ufs: core: Introduce a new ufshcd vops
 negotiate_pwr_mode()
To: Bart Van Assche <bvanassche@acm.org>, avri.altman@wdc.com,
        beanhuo@micron.com, martin.petersen@oracle.com, mani@kernel.org
Cc: linux-scsi@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
        Ajay Neeli <ajay.neeli@amd.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Wang <peter.wang@mediatek.com>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Stanley Jhu <chu.stanley@gmail.com>, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        "Bao D. Nguyen" <quic_nguyenb@quicinc.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Archana Patni <archana.patni@intel.com>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-samsung-soc@vger.kernel.org>,
        "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>,
        "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-mediatek@lists.infradead.org>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>
References: <20260308151409.3779137-1-can.guo@oss.qualcomm.com>
 <20260308151409.3779137-2-can.guo@oss.qualcomm.com>
 <fff6bc07-169b-48aa-a6c2-0d243bad0d82@acm.org>
Content-Language: en-US
From: Can Guo <can.guo@oss.qualcomm.com>
In-Reply-To: <fff6bc07-169b-48aa-a6c2-0d243bad0d82@acm.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE0MDA1NSBTYWx0ZWRfXx9KoYbDWQKuG
 0X2Gfcn86QXS3lT2Aac8H5rR/MGPgRuV4nGNuytC5mvnyhaTHLxWtddgqm7Meu0hkN7XrUrmcqE
 wwPUl5E8DNPWhovw9us4YdGCRizygs9/jFFUnvLG+EclOnvK8DIUC5g0FmjPbQeNKt92ycP0p4w
 9ImqfnDcQEWX04K+Z5Bwh4eZ7agR/+DDGRB7dQeYBEwPvQlJL0Y4/Sq8QnVZm/NPQ7x6WMJYkGb
 ilJsLmoh/llc/hC/gGi13h1UpZG5dK5YM8Ej2bzPXKl1GvAunYE8PdOEVpBC+/r7b1EMDnVKapP
 geLJ9chWzh+rEjI0U3clHw97UesjMIWrSgsFACvK9uQCbpxZbaUYHEZu4xiRd6DY4ajC+zGJ545
 BUpIdvJO7zdmzWAGnZMnnbX2d3MQ+yEOvINq3MUVuzClLg5tejn6UK9/7mDWHJzlkwPyySwpnYp
 kVXQ2FmZERB22Ag9a2w==
X-Authority-Analysis: v=2.4 cv=YLOSCBGx c=1 sm=1 tr=0 ts=69b50c7f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=CqDDh8lFt03Jwv5G6gcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: ttJdB7rVFEp2Dp6f0onN7wyMxESP25Dh
X-Proofpoint-GUID: ttJdB7rVFEp2Dp6f0onN7wyMxESP25Dh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-14_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603140055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_002137_731997_C30A9929 
X-CRM114-Status: GOOD (  21.73  )
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

Hi Bart,

On 3/14/2026 6:09 AM, Bart Van Assche wrote:
> On 3/8/26 8:13 AM, Can Guo wrote:
>> +static int exynos_ufs_negotiate_pwr_mode(struct ufs_hba *hba,
>> +                     const struct ufs_pa_layer_attr *dev_max_params,
>> +                     struct ufs_pa_layer_attr *dev_req_params)
>> +{
>> +    struct ufs_host_params host_params;
>> +    int ret;
>> +
>> +    if (!dev_req_params) {
>> +        pr_err("%s: incoming dev_req_params is NULL\n", __func__);
>> +        return -EINVAL;
>> +    }
>> +
>> +    ufshcd_init_host_params(&host_params);
>> +
>> +    /* This driver only support symmetric gear setting e.g. 
>> hs_tx_gear == hs_rx_gear */
>> +    host_params.hs_tx_gear = exynos_ufs_get_hs_gear(hba);
>> +    host_params.hs_rx_gear = exynos_ufs_get_hs_gear(hba);
>> +
>> +    ret = ufshcd_negotiate_pwr_params(&host_params, dev_max_params, 
>> dev_req_params);
>> +    if (ret)
>> +        pr_err("%s: failed to determine capabilities\n", __func__);
>> +
>> +    return ret;
>> +}
>
> The dev_req_params test is not necessary since the UFS core never 
> passes a NULL pointer as third argument, isn't it? I propose to remove 
> the
> dev_req_params test.
I considered the same when I made the change but I didn't do so because 
I wanted to keep
the original codes as same as possible in vendor specific implementations...

I will remove the check in next version and see if their maintainers are 
OK with that or not.
>
>> +static int ufs_hisi_negotiate_pwr_mode(struct ufs_hba *hba,
>> +                       const struct ufs_pa_layer_attr *dev_max_params,
>> +                       struct ufs_pa_layer_attr *dev_req_params)
>> +{
>> +    struct ufs_host_params host_params;
>> +    int ret;
>> +
>> +    if (!dev_req_params) {
>> +        dev_err(hba->dev, "%s: incoming dev_req_params is NULL\n", 
>> __func__);
>> +        return -EINVAL;
>> +    }
>> +
>> +    ufs_hisi_set_dev_cap(&host_params);
>> +    ret = ufshcd_negotiate_pwr_params(&host_params, dev_max_params, 
>> dev_req_params);
>> +    if (ret)
>> +        dev_err(hba->dev, "%s: failed to determine capabilities\n", 
>> __func__);
>> +
>> +    return ret;
>> +}
>
> Same comment here - please remove the dev_req_params test.
Will do.
>
>> +static int ufs_qcom_negotiate_pwr_mode(struct ufs_hba *hba,
>> +                       const struct ufs_pa_layer_attr *dev_max_params,
>> +                       struct ufs_pa_layer_attr *dev_req_params)
>>   {
>>       struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>>       struct ufs_host_params *host_params = &host->host_params;
>> +    int ret;
>> +
>> +    if (!dev_req_params) {
>> +        pr_err("%s: incoming dev_req_params is NULL\n", __func__);
>> +        return -EINVAL;
>> +    }
>> +
>> +    ret = ufshcd_negotiate_pwr_params(host_params, dev_max_params, 
>> dev_req_params);
>> +    if (ret)
>> +        dev_err(hba->dev, "%s: failed to determine capabilities\n", 
>> __func__);
>> +
>> +    return ret;
>> +}
>
> Also here, please remove the dev_req_params test.
Sure.
>
> Additionally, I see that identical "if (ret) dev_err(...)" code occurs
> in the three callbacks shown above. Shouldn't that code be moved into
> the only caller of these functions in the UFS core?
Point taken.

Thanks,
Can Guo.
>
> Thanks,
>
> Bart.


