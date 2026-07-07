Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38861C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 15:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d8YHwGJCeEFKefM96NEtoTmLf7gsLMxJ2f5daJOJFZk=; b=LOneU7cRSLrv5imroKJPeksY/Q
	aJ/RiClCuyvjdldP3d3E/Fo2TTLMM4hKHt5rcpbhU31kvL1ilzdqMZqvSacPyrZUkenVUFVVW1yU9
	IryIErVMVi5avJdrQcjpsK33mmSrlR3tHDnNfMCRZRwyzqqa6d80pjBC4GHOZHNzHKk9EeK+jqW8Y
	K0GirFsm/5vvQZnDJBlW3IDoo/VQDlf64iElF9ga3VRvSXyim1WJf+Qz7jRamAsWTvOTCqKkCrCWq
	ffqhzi2PhDkEN5mSz6yEjmUatgkCcpVDqeTM+4tYe+WWSTdh4ZGfyT1qxuIGBbMiY28BxgRD1dqRq
	0LhAnATw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7Jz-0000000FEnZ-3ePn;
	Tue, 07 Jul 2026 15:02:51 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7Jw-0000000FEnB-1IBn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 15:02:49 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-46ed4f66256so3878330f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 08:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783436566; x=1784041366; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d8YHwGJCeEFKefM96NEtoTmLf7gsLMxJ2f5daJOJFZk=;
        b=lSNNhDS5bWJ3Fy6+5BDx6Ha4hIT/Dv80CSNa1kOZ6yBlaJROLyABB3n0iPEoXiC9kW
         zXqaqV2FmC8oYm2mtemkvpt0X+VrYafHJc223Vb1cnJLa5FqcxDlN2yddYSoSVNtS3Y0
         8r/wQistossBlq1JM4sQ5UVPsldZe59WLmw/RP9hfKU3/KSGnUossoKZ40K+aLEtEbWg
         zXQBBm2BWczuUBbKZFEbR28oxeHCfy57H06EiCgMXbtWNAnxHBRr2TW/Azwb+zAtIacN
         +IK13V5iV/i5UDPgYH3cxuoBcaHGKCog2SUhKS9qporilN1jeyTz44vJFqaCrMY3+Chq
         9URA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783436566; x=1784041366;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d8YHwGJCeEFKefM96NEtoTmLf7gsLMxJ2f5daJOJFZk=;
        b=ekakVYLvx6xYuq1JDH5CcLSkP9/Jp2bSSMAvOGwSbUyKeHtNJbCd+Vo5Xzknu4PN5u
         TDoYjgpRa1ZhNIMcw4DaNtItbzsO1xZFMqjAoRVfxjrqZVCLvf85/b2wDLtflRHJdH4P
         LP5f8Sa1UROAMv2F/taGSeKpRa7sdYfrutzBRhA8qbKguDolXUqLo8eWGYm1URrVv9hj
         XaWXysOx8f6Kdql129+0GKK/hRCKeMn5CxeDeSrUi69pKa+cWRkHQKqgJpUCX9qCsK5F
         RSJCwefvaw/aYWs2BvjyP4Mzp5adFso86AyKeuIi3HHbJ5w7Mp2937xRuMlGyW1oJl5c
         1guw==
X-Forwarded-Encrypted: i=1; AHgh+RoFzWhKLp/TUs+7z4pn0znB112hP0BMwohmJ1Jhu+rTBkDMKNqrl/1+PcJ+M0HnwGDiz+Vli60sO/0+/7dTQqKO@lists.infradead.org
X-Gm-Message-State: AOJu0YwVSQ44O+BTuux4hXpO/alt6M4apEJswY0/P+ifYtU+BGfEj7re
	apzWZKlSpiRBItWLHTRMtVACIn7TVC1lS0kmnur+VoxVg6rmY0zNGwI=
X-Gm-Gg: AfdE7ckBBjAF+BVMBcweDC44WpfMiqEvgDgQ0clP2gVcFS4lcH3kRKDxPaVvmbY1tD4
	F3+qIfWcOO9jWfySivp+0ReB0/rfQE7LVxnJk+/Z6AmpKA1cQIgQY5CFZb2f9Axq52qGpSGGykb
	14XxK2+c+StP7qU6usScz5JmCS1TdFSd3bt93Di5iCRL28UVbVMucB0bLJKK8tAE5/garq+PAUG
	xTgQbwOcPn1XdgVbpiN8w4Gb4+QoYl2rdnQUxOOYXESJCNZvtrtD7cLdMtgT7/u5Ago6UreBi4v
	N1RE1pYsP0oct155poDoAlzirYCG+XPvg+55phRJRfUwW2EIja0UFqU3XzxGAhyS+cNNgVkCWvD
	dQHNAIQNIsY6VgSXqF23tQzgEHMZ6cFV613VTknqp7K/5Eswvzvy7zE+X9KoFM/DhyAATS3+P0o
	Kt1xZM1e68EiBeCH7FyHNt4ad2tJn4DLS9vQitCFlvZB7CjbW9ewBr0Gixetv2kinOCk4Lrg==
X-Received: by 2002:a05:600c:4747:b0:493:be3e:cc3 with SMTP id 5b1f17b1804b1-493df093146mr65333955e9.21.1783436566150;
        Tue, 07 Jul 2026 08:02:46 -0700 (PDT)
Received: from ?IPV6:2001:b07:2ec:601d:4b26:1672:75c7:805a? ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e10af392sm62069495e9.2.2026.07.07.08.02.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 08:02:45 -0700 (PDT)
Message-ID: <dc5aef2e-600e-4e97-b76b-dcc8bd72c709@gmail.com>
Date: Tue, 7 Jul 2026 17:02:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 03/13] drm/msm: look for lpac from dts
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, iommu@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-3-01d50c3e0c99@gmail.com>
 <rwohvfbsw2brpxrfg26egu5arwe6g7n2etelo33eegmu5cz65k@3syofuxzsjrc>
Content-Language: en-US
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
In-Reply-To: <rwohvfbsw2brpxrfg26egu5arwe6g7n2etelo33eegmu5cz65k@3syofuxzsjrc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_080248_367893_27F1A3B2 
X-CRM114-Status: GOOD (  21.04  )
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

On 7/6/26 5:04 PM, Dmitry Baryshkov wrote:
> On Sun, Jul 05, 2026 at 09:13:37PM +0200, Anna Maniscalco wrote:
>> In order to associate the SID used by LPAC to it's own domain and
>> context bank we need a separate node on the DTS.
> Can we use iommu-map instead of adding a new device using the same
> addresses? You provide zero explanations, but it seems like you are
> trying to separate a part of the GPU into a separate device, but it's
> unnecessary.

What I was trying to say is that we need to map sid0 and sid1 to 
different context banks.

 From what I recall, so long as we use the same dt node, the iommu 
drivert provides no way of doing this.

What kgsl does is having a node for the iommu and then subnodes for gfx 
lpac and secure.

The address on the lpac device doesn't really matter. I have very limted 
knowledge of DTSs but I think we could just leave it out altogether?

>
>> Add the code to look up that node on initialization.
>>
>> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
>> ---
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 21 ++++++++++++++++++++-
>>   drivers/gpu/drm/msm/msm_gpu.h           |  1 +
>>   2 files changed, 21 insertions(+), 1 deletion(-)
>>

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>


