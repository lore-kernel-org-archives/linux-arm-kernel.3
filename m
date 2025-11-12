Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B734FCD4853
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 22:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PKqNXD1DollfLI5h1J2Xseqpi/6Yas+Ng79HmXPNvu8=; b=MBS2gOa1XuQYcnrbX0zKuuUymf
	vxQ86bmQ6nfbmMQsb50rV4zFO6j0SIRO3/oMaLLnFmhVlfz65Y7/L9YO+j98p3LwcdEl+lR9bFAZb
	bQYu156Zw4bWkAwcGApLXS+G10eh0/+fadSplVSoqSis3a3E00rUfV/JDKAL0K0mt7JxDSQbiCsCr
	vPD/C1GMJQVGBKtXx7nSwvl4uvBQekZq/UgMjdUvbG7PRn+Wqd2Ri9F3+kNNUyxEwT/xmRrVFjJcx
	71zbuqfhqgunAVdWMNL/a+GDpGdBIxmNQa7POgxqtBKjfqaTYeZHJhLJ/ugi+gOlVgb/lpYOcSSKz
	XU3xZHiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJJ25-00000009ZO5-3JA7;
	Wed, 12 Nov 2025 22:09:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJJ23-00000009ZNk-2KbJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 22:09:40 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ACGYLcN1757648
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 22:09:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PKqNXD1DollfLI5h1J2Xseqpi/6Yas+Ng79HmXPNvu8=; b=YaOQ2gMvd3/T2S8/
	MFfA/GNKngL5oDoYFpGPtoDfaZtgNEd3XKI7mFuEDVr3AoHNMLQ1RveVof/P4K1C
	MBTr1vFrsSX3rd8CT/nDm0Cx7/HQSUMMxBkD2xD/pggoeQbc4UdQ0At17NM7gWW9
	5m2RJOwq74SAEruoLtIqCJDADeMt6FI2XMOwC3eITawkofhDN8nltztqtxQRHftW
	foR+RMjQpLY4n/Nag8BcHwprobmGjkMqulU/Feeqm5lHY85HMukVa2nwk57pu4Nv
	QPdO5BzUJ37cd+3xC7xlgxq0B5paVicxwtHp1lLFddI5EtFgX5NYPRo3fQUlSEkf
	j0E5tQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acwve8wu5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 22:09:38 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297b35951b7so1380475ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 14:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762985378; x=1763590178; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PKqNXD1DollfLI5h1J2Xseqpi/6Yas+Ng79HmXPNvu8=;
        b=hhAXakD+slO2u+VkYjhKztwZEaMA/KzCh7W+TYeM9kyvGuLRPPiSMb8lYNfrpXDIGk
         aiohhv+5zDTLdUsTyqDa5w0AWQG2E9pg4QYewOIVhLncKPvx51AFjUqayqnK/Z3uDv2d
         nh57ivPwl+gEV/+Z+K5fFkIF7YNH3wdiTZ9TQ3QblbWjYXzpsb7HgeqEio38k/eirpOK
         kf2aL2+1+a12ayhE+ksJzMK3Hunj5Our5s4YfPDmzJPYbIaz1G68cA9G9LU4Tp6iY5NM
         UtrWnSN5mklCJyx0JrOmGy+5bOOT9jd3A1a5spjt+ZdBi1URoRwHlsATwjDT7k/b05OX
         Fxew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762985378; x=1763590178;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PKqNXD1DollfLI5h1J2Xseqpi/6Yas+Ng79HmXPNvu8=;
        b=OON6Le1tWYye+vECB3s85z0HEld7rtIAJDGtEJg089vwmNLCN/ZP/AaTh/mrCBhasB
         CJqLmpT9PejYMvTx4aWkB/2CR1yvsuQLIXOPHt5M/VDuzQEipdGu0mTiwjG1LkXHJxgF
         Ro/xR/bTfd6FqZcbkABgOsFWUmETTebO/QuRz5DnYvCBTFbM7YNMmHSRmxb4BcOD+VIn
         XH7UHOf1H9e9jUNlAry2LFbMyNvh0W33j8+F683vm2Ykq2RRw019sQ2/yjSWQFQ8ZZ2u
         Q+3K7d0tY0Ryit1AQdqguPuJKihYsyY3elvZKwgPZ77oC3E6Rfn8543gB7D+K/Ecjjg4
         H3WQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlAJOFV7t0918so3HTbVEWUheZ34AO+bVKUn83xzVpXGnEJlsB+/hsNN0A6MzsltN0LO85oDXd1SNR2nHu1znp@lists.infradead.org
X-Gm-Message-State: AOJu0YyE3C6zjf2Xjpv7yiOnVMBYdAXR9wIcfg1SLXzIdUGnsSSeuw1H
	4qxaLHmY0JQPSL2gooT1b3PGLXZRU9bvaKFA1S8McCUJihaTuGjXB455Gd5uBhrXjILUqBjnKJK
	j5UPNRCOMHYBmjxZd71aqrITgJLOUwBvTGUl8B1wTcl8agIMoZX3HcRwNaNq5YinHvyqFNWsw0H
	aLhQ==
X-Gm-Gg: ASbGnct3JjRNoVBeahASr2L1Rz6506Zk8tGVyTXMxOvOtjkFsc5oNdXP7b9q3HG6Wfo
	M7eD17G39c+o15NdPpzCZlyQWHJOmw8Gwk7LN7AHbeLMp9Dm+wqwByq2xf4QQiQz6+m+7cdLNcE
	A5+uS7v9Pg9flw6tMHWekNeW8lGnYIOqjlOo89SMACtHYA7Rluob5NE9eZ1UXaB3xBhzVuI132W
	zBs87xfYkp9o7XsIbVcyYJ1ikVWe4Rg1uVqeYUztpTqYQBe0h+IsgBkMHP9mfaYTdwKSXYyGdcO
	YCO+NRFgzkhZ4YJ5ZFccmalEYWM+gzGwGWxYDaQz0kkvedWzTQf0tWFkY3ROVJ1CHmRiFFZKXaD
	BXOzuFt0Izuwt3MWSJz9OFg==
X-Received: by 2002:a17:903:1b6b:b0:295:4d97:84dd with SMTP id d9443c01a7336-2984edd59fdmr58284655ad.51.1762985377612;
        Wed, 12 Nov 2025 14:09:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHbDPQwjbxvdgWkQp34t9iHfLbIFLfFbNnosXkOr7CJTuwb5+1HxivTIaNHyQXba3NQUZhkaQ==
X-Received: by 2002:a17:903:1b6b:b0:295:4d97:84dd with SMTP id d9443c01a7336-2984edd59fdmr58284135ad.51.1762985377049;
        Wed, 12 Nov 2025 14:09:37 -0800 (PST)
Received: from [192.168.1.5] ([106.222.234.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b0c9dsm1704455ad.67.2025.11.12.14.09.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 14:09:36 -0800 (PST)
Message-ID: <d4753c6b-b3cc-423b-912e-61f8b7bc3c1a@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 03:39:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/21] drm/msm/a6xx: Fix the gemnoc workaround
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse
 <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-2-bef18acd5e94@oss.qualcomm.com>
 <a1273bdf-d926-48b4-877e-48d5ff45e7d9@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <a1273bdf-d926-48b4-877e-48d5ff45e7d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bwNwHB5WKPg1k2Ei_VJogmlLjnsC-Htb
X-Authority-Analysis: v=2.4 cv=F7Rat6hN c=1 sm=1 tr=0 ts=691505a2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=2IP1oaZ8+KUWsYovLW0HHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=vAHTylR2Z3b6qOykXHEA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: bwNwHB5WKPg1k2Ei_VJogmlLjnsC-Htb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDE3OSBTYWx0ZWRfX8JRkykU//y6P
 44TEKUzS8ifWVNzrXM56s2NAGfjc2x2cDRNYIaXpag/N3GServPAgia6+JfNtg/pftgz8seWyro
 3jc5U9Ma24Tc4QSinPJRGqlOtIsjz/5usjrO05kHYmJBui/PCIxYOraBch0snANWR4u3VbJZlHx
 PstS0jyxiJaeIGzeuRdVY8BgjsAlU97gDkaMoWHWev85BrzwTd2p6fbv9je2pnbk3aClZsS/gah
 Dguuk4RRnabE5XWbVL3jSlpuxX7Q+nRsWaMkQeO5kjDN0LXVKGw+iOFTMpyZc4Z0cea4uwZ3HLz
 2/QNOZ5pvIW1Gd+mDso2iWW7kgb/wuilHOjufxVebze5xvv4HgLyR7hxk9b6Ey25N/qiGTWSLI2
 ew4CNGpISKNpDTO/4B8/DA2nhxSGRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_140939_607659_797C1D7E 
X-CRM114-Status: GOOD (  19.41  )
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

On 11/12/2025 3:48 PM, Konrad Dybcio wrote:
> On 11/10/25 5:37 PM, Akhil P Oommen wrote:
>> Correct the register offset and enable this workaround for all A7x
>> and newer GPUs to match the recommendation. Also, downstream does this
>> w/a after moving the fence to allow mode. So do the same.
> 
> It does so for _notify_slumber(), but not for _pwrctl_suspend() in kgsl,
> but in my understanding, making sure the bus arbiter doesn't gate access
> first makes more sense

Yes. I didn't change the order in a6xx_gmu_force_off() (equivalent of
kgsl_pwrctl_suspend)

-Akhil

> 
>>
>> Fixes: dbfbb376b50c ("drm/msm/a6xx: Add A621 support")
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index 4e6dc16e4a4c..605bb55de8d5 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -485,8 +485,9 @@ static void a6xx_gemnoc_workaround(struct a6xx_gmu *gmu)
>>  	 * in the power down sequence not being fully executed. That in turn can
>>  	 * prevent CX_GDSC from collapsing. Assert Qactive to avoid this.
>>  	 */
>> -	if (adreno_is_a621(adreno_gpu) || adreno_is_7c3(adreno_gpu))
>> -		gmu_write(gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, BIT(0));
>> +	if (adreno_is_a7xx(adreno_gpu) || (adreno_is_a621(adreno_gpu) ||
>> +				adreno_is_7c3(adreno_gpu)))
>> +		gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_CX_FALNEXT_INTF, BIT(0));
> 
> Arghhh copypasta, thanks for catching this!
> 
> Konrad


