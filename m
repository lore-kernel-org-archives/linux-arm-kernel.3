Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A25ACCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 14:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hGa7B98r9MqkGDgKlmDgrSnW42cjpgklRI/2tR3rrb0=; b=bW0XncBL54pVBJOGIdAzxlhb8K
	fIvYVs2LqzhNNAUVV6hfY6EGzzlkyXP+9NuNoKaitNZUC+8X+bEv+FUoRDggjZF4rfuquwRzaZ5pe
	p8M5CGZ5y9wWvDgIrLgw2rnu5flapZxCpvWGz3yCsUm6prPOGy3HTfvRONOiGh7SW0a6vB0sNrEf3
	Th283BOVKw4fBr+UO/pFSWrbZdC8JWfsLzrx9YtGuafnN9mcTcroHrrynXRrJRYBEvL3m1xkFYzsY
	hToRLCq1MT4iF3QVHhX95p/+4kOOQSzja5FUpOiSj/4STI5dCksRq4u+fflyOFn2EUQIGpXQmJNTk
	iLEbbsGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIpJf-00000007Jda-3xr3;
	Tue, 11 Nov 2025 14:25:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIpJd-00000007Jcz-2S7i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 14:25:51 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABBG7Gu2425243
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 14:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hGa7B98r9MqkGDgKlmDgrSnW42cjpgklRI/2tR3rrb0=; b=DGgsmsp3z5Kly49F
	2Hq/3japteXVdZPaeIYVZvju6RwgCftm3mwlfB5kZrBZWou2alIVyDiJ8gra/AKt
	NtpiSahSi/l9VMHGE3iqpp5/Z/mNQW4lcrVFjs0l8IB8Eo0+8fhBQBGUYJR+VO5E
	VTXGwe59agQekoRbgea8fGGod+LVAqjbQvsN7tLsxWYmq9mJ6RpOg054zekzaszX
	7oKmwQjXANhYnkw/Dix/5sc2qB6H/L8Qa6KyE/aKSFYuPecUakEW5SEf70FiMmvq
	9jl7LKoTmdduSKy3zuE+u8GXJV5aNOAFxGyBp4i2KZYpkxWRKK6eNZn9AWRurky0
	kWM9YA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ac2350vx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 14:25:48 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297b35951b7so69297045ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 06:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762871148; x=1763475948; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hGa7B98r9MqkGDgKlmDgrSnW42cjpgklRI/2tR3rrb0=;
        b=UjSNcrkw+Wq20ngcDOJ1oofISwdR3BAOFwhQactoF3BZhtCVCY3mk8VBu1iOs15ADf
         lzIDnYn/Trz4LShW0hNhip9ck6Xzd17DieqPJnAQz74kaK1/859PGU7UhVaVoDAdg3G4
         MpQ+qmm55n278uMzBpP/yL1m+kK7A4rmWxU7vfcOz7nWQnag0pM7220/vtxsN+gyIWRP
         Xog/2CUoHn/TRny18MCEaWP0NdQci+F0SQwl7nV22r5fWOHGsEfqQVuejIgrS/X/CsSj
         i6NS2qDRyPtowaw3XC+OB9FKIY9C5aGh2M0YyGGRfe7h1jwx0MgVQ7+GZwv2G/N/tzgl
         LJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762871148; x=1763475948;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hGa7B98r9MqkGDgKlmDgrSnW42cjpgklRI/2tR3rrb0=;
        b=SexSP9lJCJtjI+V72Jzhq9QWg84mA+1TbZZs9FhIItx1BzFpBovdyOB3jb9Jh1v0re
         RMZUfBMalZr7CfnZTWu7jueE/nsJ/VvIM5iD4PFiIEK87qycbQHUFFVZatop5hFs8BM5
         dEzuTl6PBlKfBfLt7tU6sE/WSqcfWn5aCYnXAblFjNBCpZnNY2CwENmTYAKj7cXBmVe5
         ZW4bz+CiYS6rKO2NB0cv6XsaRwHd47iajYo5AVadN1j2JwUJe1Pnfrfqv1svcvi+9QDo
         hF8YKuuUOdXp50038dL7uBgVSj4fS8PZw8Yk65jCfKgq4FY5PxTWn85+rmiFdwFr6YG0
         OyCA==
X-Forwarded-Encrypted: i=1; AJvYcCVOSAJZSPkwtpzQvoj/aEcYsx8kxBvR/a20yinGbFF+0RtxqK8gnSwbmGCyZGmkLwIt24RhIHX3YDbqD+q9JCah@lists.infradead.org
X-Gm-Message-State: AOJu0YxVmnJCMzsrMxstXT2kghPhO+7cadP+9E6ZGdlI98yLrdKsXodS
	yjnkhE9ysT4Np6VsxZJsx82OD8BLV+UtM8MFVEFJylvATxQE4/3Exy34pWJor/nbaX7e6ssGCc+
	i20LykIJTs2qnmdQZOQbKQlqIrdwYIGds7ao/nc8bQGYbtP3amgyh34ZPKk6H484M6cl+hMzTmV
	eWzw==
X-Gm-Gg: ASbGncs5ud7yARasXl9PDjiBPOf7kykU4MNeZxB9LBDUc45WkJ4DN78tKSQXAfgMXPZ
	BUlxOKLcbAPs21ELoBuItyX3d5Yf6mVe1wCpHkFirCCByGX79aAUbzbqJZUv5b35lPStGPLcyFT
	3eD96ijOKix9q3m6DcQWr7HrJrFfxQ081wPUO79VdVPBq9V+GHPBUg5Up0SCrP67oVSE4TftyD8
	eS3AkTgxTzrl01//VWTg2NUF7QgK8dv0kyjTRfJk6SuMQ6HDMOzv4FRL9umIuIenKzOOCJDvMH5
	PFrX4IQXGztRFVkUvHPzFXKZuGt7Cug8UlEKF9BRdw7N/sR4OuI5ptf8Q5uhzjWxzzK1a7YzlPn
	6hFIsCyjknm0XI97jcYwAVg==
X-Received: by 2002:a17:902:ea0a:b0:297:c638:d7c9 with SMTP id d9443c01a7336-297e562e197mr179715675ad.13.1762871147484;
        Tue, 11 Nov 2025 06:25:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkROrZLUIRrbkgoTAgkprVjqaX7dHmwbXmMslaYaaMrgNrailMFiy5g2vGuUSJjGn5syzSxQ==
X-Received: by 2002:a17:902:ea0a:b0:297:c638:d7c9 with SMTP id d9443c01a7336-297e562e197mr179715115ad.13.1762871146970;
        Tue, 11 Nov 2025 06:25:46 -0800 (PST)
Received: from [10.206.103.12] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c740a9sm183312755ad.53.2025.11.11.06.25.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 06:25:46 -0800 (PST)
Message-ID: <ad372979-adab-4486-ac69-90a9df1ae512@oss.qualcomm.com>
Date: Tue, 11 Nov 2025 19:55:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/21] dt-bindings: display/msm/gmu: Add Adreno X2-85
 GMU
To: Krzysztof Kozlowski <krzk@kernel.org>
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
 <20251110-kaana-gpu-support-v2-20-bef18acd5e94@oss.qualcomm.com>
 <20251111-magnetic-jasper-slug-3abc3e@kuoka>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20251111-magnetic-jasper-slug-3abc3e@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDExNSBTYWx0ZWRfXyihoAqgbfx5X
 KBBiKPNgS/86xeLfxPEw60QHOLZm5cQZuBrKsMAX5/Gx0qhz+s4mkjA74HTHzWJiv8zuLb/5AEK
 oaq8lFyqWAQvJ2LqXitksA3+DX2zV/pJvOF10n1ihVWFx9phIco+Wu0u64Kh1ohl99pQ759jOQQ
 n/7/9MbcVBJh7SakuXaeYd8Li7wQmKqgVGmCLrkQS7DkZc2v7F2ET4+bkrtGFiqC2TN+FymfI+x
 OliZUlq9HCLUH/iXUhZleHfpVqKzfnB+hoQ1NwMakfUK9PXSm6NI+ABBvIknDNloq3b1uM2ntAt
 8wQrLkhlILiJ73v1byeiYE7rzB4MWikanBkAN/GALbYMemA0BgujxCYwr+v/wMQctnH0v6KzOuo
 ZGZ4Rk4uyZ/tAdQonTzGtF2rdN5SWA==
X-Proofpoint-ORIG-GUID: sEoV-6q7VtAs5YH4a5T3_kb9QV_jpdmF
X-Proofpoint-GUID: sEoV-6q7VtAs5YH4a5T3_kb9QV_jpdmF
X-Authority-Analysis: v=2.4 cv=O8I0fR9W c=1 sm=1 tr=0 ts=6913476c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=3RWeJ3mqlPvKrM-9dKcA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_02,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511110115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_062549_770032_39765A6B 
X-CRM114-Status: GOOD (  24.33  )
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

On 11/11/2025 1:19 PM, Krzysztof Kozlowski wrote:
> On Mon, Nov 10, 2025 at 10:07:26PM +0530, Akhil P Oommen wrote:
>> Document Adreno X2-85 GMU found in Glymur chipsets in the
>> dt-binding specification. It is very similar to Adreno 840
>> GMU with the additional requirement of RSCC HUB clock.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> <form letter>
> This is a friendly reminder during the review process.
> 
> It looks like you received a tag and forgot to add it.
> 
> If you do not know the process, here is a short explanation:
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> versions of patchset, under or above your Signed-off-by tag, unless
> patch changed significantly (e.g. new properties added to the DT
> bindings). Tag is "received", when provided in a message replied to you
> on the mailing list. Tools like b4 can help here. However, there's no
> need to repost patches *only* to add the tags. The upstream maintainer
> will do that for tags received on the version they apply.
> 
> Please read:
> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
> 
> If a tag was not added on purpose, please state why and what changed.
> </form letter>
> 

I think you got confused. These are new patches I have included for
Glymur support in Rev 2 (as mentioned in the cover letter). Did you
confuse with the other patch for Kaanapali?

-Akhil.

> Best regards,
> Krzysztof
> 


