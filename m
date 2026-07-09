Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF486C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 19:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ukg8K27ZNplR+yNjefMWINfSHgjifpE3C2eq9F7iWjM=; b=n8/I5MyRTR14ggNt6Lag8IxP6C
	4D92/bH+t3RqkJMhskBR3lHS7LoBYytCiyBiOtiBrMoUTXlB6Zu1EMk5w6E4VNIY5dIzG4A58pxyG
	E76YpMap1eEFD4rhetr3CoEfw6p6HFtNdgOwLrDJQcZ6uK3Wo9UmgBkazVoFIxhN3UrXEDbJ7pob0
	PWc5XOvA4RKQ6dX8te6QWOtQ8DVKNx7/8g+KXLwJHeoAkvquk935x3qCo2yJq13EoOQ/Hf1cNAoj3
	BON0PHxA0Xz+G2ZWT2l6Vd/54kt6/motQOcFyHAY6ETAVQ7bclBiapvmfd4dU0HVeEP9vn/7CuxMV
	Y9jZA7Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whuBx-00000003Qiw-1Q55;
	Thu, 09 Jul 2026 19:13:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whuBu-00000003QhV-135w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 19:13:48 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HXXjl2475471
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Jul 2026 19:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ukg8K27ZNplR+yNjefMWINfSHgjifpE3C2eq9F7iWjM=; b=KNheesOfomsVUduc
	CcvE8SZac96fJwdfD/TF5VQoEEcRgWj7I7Frf00hqvY9YqdBKm+Q4GHzmND/guqL
	btUvlew9kmRNw+mfAP2J5jKDtmluhG7B4jpcDaecLJDHLua6GQA6kXhzFr+ldrb5
	jq0mhLmSnUMZWsb9Obz8avq6lEubhe6hzOH4+7RJzLx85w70UhKvzl6DAzRxb0So
	b/XFXEOcEn+TUYyz7rsBbLtMnbUfuTClcpfLx7lfS6duopKQc1jj+ivBPNAwOUCh
	ZWXzokrJCv4KqAa8umDnUVMD6E43C8+9lcMn7+xCHPtCFduKmq8bbtZE1nNfKuRt
	Jz7J5Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf5mrt84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 19:13:45 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f0c6ea10e8so601976d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 12:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783624425; x=1784229225; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ukg8K27ZNplR+yNjefMWINfSHgjifpE3C2eq9F7iWjM=;
        b=axZTo/MgctnomYSJiaBxm/ZdQ78vKzdBMk58ntgCy3KUlM1WlO7MPcdZ3F4FQUTDX0
         KCB8+/BW9WhTD0a2kQRK8PrcQ38fzgADDqF+q4DY/KLP+rUur9kUaEb5mfRYIV8CCF+s
         iRWNr0sjQjrMmmKNax8J21UYhIv34jy/s7vZ3bsAnhFjU1IQdYFxWf8+2lW+5vGeBbmx
         WL/3iT1flW8zLxy7dHlrqAK/Z7E90Qq7roNguRcbxHiJ72HJny5YxALhGmA/zhpev7tN
         1xSQRUe+mnl6Xq/YzwMG4+noVtTfKSqn4bgSiAdKSGbfkucxOjSrCFkckNecu0gOyRQz
         PnOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783624425; x=1784229225;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ukg8K27ZNplR+yNjefMWINfSHgjifpE3C2eq9F7iWjM=;
        b=lhrDiXbT6mVkO8rIE+CXC5hvQPftFCCiHNKNc1H3hZVFRoiLknnUQbfaLVELkFYZeU
         kF377qjxc3bDpvVEgaG1I1mr2T/iXnfh5Jei54D3OaAv4M10NaaDvfm5aVcVONgG6+Fy
         CGIaHqhRNFZGEjfsWPlcsDB2IVbtw1wunbwNYP/XSHxYT7SQWKyU008Z7YDPbF53smI8
         6iAMzPEiDmIF+RZPK0iQNU5IpR2a9rYEmZi33YPU6/TA3SnYZVzvKaI/d3+Myb7raHNp
         Lh7V0eYDmbV9YUDiNxB/V2NNPzGn9uplj2YD0lg+wdHy6e/oqYn+Bwk2rQlxtlqnW1UO
         BYQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rojvh9J0vYKCXvusNcMMMHB/YIuMVcV53Z5SHKDBxhIkhoq2IOtpVBov+K9LcbXHG12KQWPe4hudmqtBeDzw7cj@lists.infradead.org
X-Gm-Message-State: AOJu0YwswW0iqGRo7ZZb5BFOKQBHX2gCZN20rkvWJW3d5Llpi51k6XfD
	Xw6+Udnd4JNkipkFkQyaNhWWe/r498jZhQjA4fuSBzFEUSIRI1PeY3OfoZsQoFYEaA/sgZ+gpGL
	qWkZYihtXkFWcj5U13XUXDRO+RyoWkhK91iq6Ti2HIVNv74Xxf/9DIMp5sixM/JAxVpcjMOLMEj
	ADAA==
X-Gm-Gg: AfdE7cm4Y5ogF/kT/iwu58UrCQLr6MyxajhgrJyZ+6TeHAToS13JGM68jDjxfPYp8Bu
	Jv2kmfSbAAiumQFtGZDS9JEPfzsGbl4n+b7AZ3vZo3f0j8GJSaDFdD3M8Y23GBUTtzJeXy72qot
	CUsgrIGUbPiER7jVzY4xoPkxEdHi92MtecIC16sDstw4mbHvf3KQFC/G32kuQiguXeBAPm6Ck/K
	plYuOsUXIlewWUPyvpb2+8qJzoVrf8vrXpKJ9MZ2QrGzF8Wtz9m1eN36U9eiX7YWkNdYFnXp8qV
	h55gJdDQQ/uxiOyO6vS7m+geIvdlXh4dY4xc1r6gBjDdMKtih206N/t317rLm/BURVabJdlGK9V
	vRlOzft5yV9v0Sk2MP7fyKJI39wG/OZ0m1Rc=
X-Received: by 2002:a05:6214:529c:b0:8eb:1061:552c with SMTP id 6a1803df08f44-8ff941c2fc6mr52516206d6.5.1783624424554;
        Thu, 09 Jul 2026 12:13:44 -0700 (PDT)
X-Received: by 2002:a05:6214:529c:b0:8eb:1061:552c with SMTP id 6a1803df08f44-8ff941c2fc6mr52515356d6.5.1783624423732;
        Thu, 09 Jul 2026 12:13:43 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69c14972fc7sm595785a12.22.2026.07.09.12.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 12:13:42 -0700 (PDT)
Message-ID: <88edd673-1220-43ca-805f-675890be0cfc@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 21:13:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/7] arm64: dts: qcom: shikra: Add GPU cooling
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Aastha Pandey <aastha.pandey@oss.qualcomm.com>
References: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
 <20260710-shikra-gpu-v6-6-b388ec5dce77@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260710-shikra-gpu-v6-6-b388ec5dce77@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ulei-aJXLSewyxtuJQQQo4n8_HZ_HMLl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE4OSBTYWx0ZWRfX7jkH3DKoGEJ0
 jbMBpr08OfKsqkFQ0BwOmyN5OgD12rfhhG1klVHZyt0rGXXDrSBHDtybZf92IKRnKlfvLO+gU2V
 XU4QZpZTvzDwiMugxmOmDKh01kaLaTo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE4OSBTYWx0ZWRfX0to8jjELPLVS
 xaj5MA9CfhTD3pcfCqce2BI/7GcB8sIYcwXP5CyBoV+EV18PJ3T+aWJsTKrYIJ1yfWghB5KZWY3
 rXlHB9K3G24SoyGlWTFYMzkbqzzmHdfy+Q4r2HJPCS791x9nQ73g+310x0HNwWcs35cHEgZvAOI
 qpFegAGeV2LSC8XHJMoQF7+1ksCNTu0EiUHpVZubDqXCzTJVBclAwJPhEBBViyp6mOPmNYLx6ZK
 ZChjPFEP1F/z7UXZxY+UuJA6XseSN//RHkF26Sf7K2IlZqdvTOUX8s5KQ1YyNrD7qH1EIQImOZX
 YnGumAAGEa22c64XXhLWVxdIJDR2YywvGpVy2Oy9CWM5ks3UDt7a9j9ToiiSm/ljd4KDR0e5qtm
 srsq7mLHZ0iMrgAQMrGEaEsQCoA37NGPHONl51l9oAlMGFpOaEn7L6SAX0GQCkzQvcQPsXi4x8+
 jt6i1McYHohc6U7pmKw==
X-Proofpoint-GUID: ulei-aJXLSewyxtuJQQQo4n8_HZ_HMLl
X-Authority-Analysis: v=2.4 cv=N+QZ0W9B c=1 sm=1 tr=0 ts=6a4ff2e9 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=QDjCMyA0A8yHJihhU1wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090189
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_121346_405665_814CB359 
X-CRM114-Status: GOOD (  11.31  )
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

On 7/9/26 8:42 PM, Akhil P Oommen wrote:
> From: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
> 
> Unlike the CPU, the GPU does not throttle its speed automatically when it
> reaches high temperatures. Set up GPU cooling by throttling the GPU speed
> when reaching 115°C.
> 
> Without passive_delay, the governor fires only on trip crossing
> interrupts. Temperature stabilizing between two trips generates no
> interrupt, so not all cooling levels are applied. Set passive_delay to
> enable periodic polling to ensure all cooling levels are applied.
> 
> Signed-off-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

