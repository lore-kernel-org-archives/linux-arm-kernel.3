Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B5D0C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 22:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/nZ5vLwAzsNnnPm1vpVhd40+MzAtASMHps3Kb30tzxE=; b=4dUIFyZzF+V2aSLq7HYrktd2o0
	wi1WG4ga8612rn+a3svrlqaJ1f2puBdJFC14ZYJrvtoYbUDP2xr8qFBql/HqzXDGLu0mlPwIGvX45
	DPAILj5Bls8ZDCZB2jBNBYwei4yR7tic9KlFLeo2gqrP9uMPNCqG2oNk5JKaHOTbnboKJPVqUMtlL
	LZKJB8Lh7ljIi77v3vCuqb1Ysq/sydhcItp+/PGr3Z+GCkZY9xNVbVgT7xQhNTxKOPHVOh78Jpljg
	3IBMFrywlsfBkM1DlSjf9spbcEu624xAQ+PtSmgABU7GcDxdciOFNIjog0mmvf4ZS2TvOe5nkdLZD
	w4O96dmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSjyU-0000000GggY-0OyS;
	Fri, 20 Jun 2025 22:12:42 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSjsK-0000000GgH5-2o57
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 22:06:22 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-adb4e36904bso453607966b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 15:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750457179; x=1751061979; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/nZ5vLwAzsNnnPm1vpVhd40+MzAtASMHps3Kb30tzxE=;
        b=RdZD+vl1H/jxss69EFGEOYXXFrOSYVFyOornUWSMkKXl/eyGItqU0CjGqg5UvvggGM
         k2xOyM+E0ZUJUGn8x0oXnV0GyIvJY0ekC/+mjCar82rju3JiqyjpsTBOkkEegYQBy83V
         TigeKBDkFQweDn9KoM7osFeUvjhxsPoUWOVHstWVOvJtJTQWcd8Idf3OleXJJvkMT4yA
         RmVUHJkZqyQueR9hyjrwBukmNqsRkdPdArWUiGnz2gWbhpG9doHqC1azYFDFx1juprKg
         kprYggDPlnuTNEkeI30ZFqxoD/WZDroZ9TIZRevVIDPSFGHYW0kXNT760pzR7zHG63Mf
         6jQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750457179; x=1751061979;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/nZ5vLwAzsNnnPm1vpVhd40+MzAtASMHps3Kb30tzxE=;
        b=eCVCjr63UiiH0FwZE+IC7a31ezlPGG1/HFDKtkKoJwiSV591E6LJtCgbbdD8rvQ8zi
         eEl+0rgeguFEcf5+m/M2ObIfTSo5JMjuW8c7Kgib8qrLUTYICFRrSPaOMQJ3JrT4eX53
         xczIDvIU/RN+ryG/8iSVRCfhU25IgXCe4ZSYaxteZqRWqroTxLzxeTk6LNkJF+6DdRNJ
         XkRCO5OHVIjdZ5NMbM+XOqaxsguQJKvvCURdrv65D36TBoXXxvTB2TF6uRnK+bRoBcpH
         kABQBtmdVavnRW1vahG8WSL5qr0KhYTlcQr/WJg9Rx3Cdt7iw0SjGbhKWOSwUC0r8gTA
         wyDA==
X-Gm-Message-State: AOJu0YxGyjNjWht9HeIRDQVf2OFRbpmXUMGaCP/P+jEIOeNhxI2ib3eD
	6Nc1r8292e1mPXDx0riSdlzdGodZJZHYN1l+SbyUkBzZYXlgYnNxYXk=
X-Gm-Gg: ASbGncu+xtHCirCeKg7hkdQWbphsutfs4Xl81Bd4muZAjn4QLwj1FETcz/rHOKG3CzG
	/RivLkXoO36WnT9SE3lbw3UnKhLVVu5vpHjjSMlzERMIWM709LC3px+Cp298G6y9FzeWNZfxixV
	yoBNa/AdIOJpOSYudnhNqd/zm8jw2YWUg+pumN9DT4cD3riT3hDsi1HRLO+s8LaZor4ELU55164
	nD/rJexBpQDC9gzEEZpBIqoS3oT394xQOYdqBCqy5H+AG1misE9NqiHm0ZqUg7NxL03RWWzezhz
	lVAD/9tdTFPNcYEfYybuveN3wkr4riPwNqn3XOp23Wxop6nCgqbIFd3PaM7X9xqF23iQRp829A=
	=
X-Google-Smtp-Source: AGHT+IEYDHPLPS/aiLsylQmdV4aS29FcdoVYkARHkjeD3JC5HuUi2/GalehZw8KEnx2WXwNuzXZgDw==
X-Received: by 2002:a17:907:1ca8:b0:ade:35fc:1a73 with SMTP id a640c23a62f3a-ae057f9e1b6mr483910966b.55.1750457178076;
        Fri, 20 Jun 2025 15:06:18 -0700 (PDT)
Received: from [192.168.20.26] ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054083406sm227701466b.75.2025.06.20.15.06.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 15:06:17 -0700 (PDT)
Message-ID: <970c41dc-e89b-4963-abbe-398dc3d53110@gmail.com>
Date: Sat, 21 Jun 2025 00:06:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] Support for Adreno X1-45 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250620-x1p-adreno-v3-0-56398c078c15@oss.qualcomm.com>
Content-Language: en-US
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
In-Reply-To: <20250620-x1p-adreno-v3-0-56398c078c15@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_150620_717285_AF9E6A04 
X-CRM114-Status: GOOD (  16.93  )
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


On 6/20/25 08:54, Akhil P Oommen wrote:
> Add support for X1-45 GPU found in X1P41200 chipset (8 cpu core
> version). X1-45 is a smaller version of X1-85 with lower core count and
> smaller memories. From UMD perspective, this is similar to "FD735"
> present in Mesa.
>
> Tested Glmark & Vkmark on Debian Gnome desktop.
>
> I think Bjorn can pick the DT patch and Rob Clark can pick up the rest.
>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

Hi,

Thanks for the long awaited series!
Works on Asus Zenbook A14 UX3407QA (x1-26-100), tested on Ubuntu 24.10 
with Gnome 47 on Wayland.

Tested-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com> # x1-26-100

Regards,
Alex

> ---
> Changes in v3:
> - Rebased on v6.16-rc1
> - Fixed speedbin table in drm/msm
> - Corrected the regex for the adreno opp node (Krzysztof)
> - Replace underscore with hypen in DT node names (Krzysztof)
> - Link to v2: https://lore.kernel.org/r/20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com
>
> Changes in v2:
> - Skip 'delete-property' wherever it is unnecessary (Dmitry)
> - Reorder dt nodes alphabetically (Konrad)
> - A new patch#1 to fix the dtbs_check error
> - Link to v1: https://lore.kernel.org/r/20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com
>
> ---
> Akhil P Oommen (4):
>        dt-bindings: opp: adreno: Update regex of OPP entry
>        arm64: defconfig: Enable X1P42100 GPUCC driver
>        drm/msm/adreno: Add Adreno X1-45 support
>        arm64: dts: qcom: Add GPU support to X1P42100 SoC
>
>   .../bindings/opp/opp-v2-qcom-adreno.yaml           |   2 +-
>   arch/arm64/boot/dts/qcom/x1e80100.dtsi             |   7 ++
>   arch/arm64/boot/dts/qcom/x1p42100-crd.dts          |   4 +
>   arch/arm64/boot/dts/qcom/x1p42100.dtsi             | 120 ++++++++++++++++++++-
>   arch/arm64/configs/defconfig                       |   1 +
>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  39 +++++++
>   6 files changed, 170 insertions(+), 3 deletions(-)
> ---
> base-commit: d9946fe286439c2aeaa7953b8c316efe5b83d515
> change-id: 20250603-x1p-adreno-219da2fd4ca4
>
> Best regards,

