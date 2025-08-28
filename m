Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA65C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ViZhgiI208mpprvGOd6oxNdz3FM6ZQalsGn/kG8/O+A=; b=kJ94hLSnV8QXnc29/xU2SfIJhg
	ux3neJIZjkdrgbvhEdxHDd55Wlrcq9sLP6cMZHxk4YPs5Ylg8BRqMKlnBxLoX+3wym7hJyfghEwXn
	J2aJaxYgfTkYGbr1PR3TcNpT+FHV5bLBUReC7To/3t5nk5SBWRoiRNNbpYzunEAu31a+bouxAZwp/
	CpOYutwTSkd6dFVx3qTqFNcPxBkz8wUsqNWsv5qBMyybg6C7xDyo5o8IJ+sA+PCKARU9ADbCdCdub
	CJIa4MkA2ebjjmzYMrZhYKrK+nuu/B9Et4D4vO/Yi5OXQqkFr4tf0QyJ9yBK4SiR0nwijEzft2/r4
	Ux8Ws3dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgOX-00000002TZe-3NvF;
	Thu, 28 Aug 2025 17:26:41 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urcWO-00000001hpG-3teD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 13:18:34 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-afcb72d51dcso131098666b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 06:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756387111; x=1756991911; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ViZhgiI208mpprvGOd6oxNdz3FM6ZQalsGn/kG8/O+A=;
        b=bpYgX4zsKMXfihUWcgIHvXHi4TfDDeLljeLewAyi6FM6mSBSw2uA7de8UxyxBrWP1G
         GN8Y/s6w+T1GUlJwo+CmQNsZMYstMgPCkLaOXZwv7xsLvUwl+66+8s/pxP484eQYZGPd
         x6e2+gyz1dcN/e/7SU53v6zpYpsQBoWfVbp1gXyk3lm8tos4eAwVmb22ERj9uG0ykwyY
         gkB5ky+SF1h0hbTyPtcIAlOXWWmzzJTooG4wfrzkZCZrUtDbrqbxdFwwMwssfs+r6N15
         4CiKllDI/sfETOHPUVzbQqXLCECxnGPfWslE4YKzdfjPUuipCEv+6EIXDiWIB6C0wKlx
         720Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756387111; x=1756991911;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ViZhgiI208mpprvGOd6oxNdz3FM6ZQalsGn/kG8/O+A=;
        b=eMkm5hC2HPCiDH6kOhJ45wajO+zWz/C4ud6VQ0/41ud1v9NyQStOYf/KucSjN32VoQ
         CXKnO8c1otCk1/Q6TR9apXSGX4PXOYSKsYjScZgiHF1OQnznn76LeeAz+KdBMiTSN8k2
         qOEd+oxDlmSfHF4XswQ5NwdABvYYFcUrjutqr6amFzUADHo/Ud0fG43Q9B5QoclUr31l
         VGr1QqHqihwoGkkUfBSfoBz93GUy607HIHFI+PW/t51Lms3SziQq7RvfLHnC34vL4JJK
         wYbE5pDxF0jfISZJSuyE4abMb8pSwoZ/gwAYZkaObvYzQjvuN6jwlDTTZag4hJhfrPkR
         quJA==
X-Forwarded-Encrypted: i=1; AJvYcCX9rg/BkK6sI/RqGUQyitGsBL32FH2fqCrtOFCnEuFEqwU6OvqOfjalTju3CFSfTW/NPu3Z6LX2XtKWdPxt2McA@lists.infradead.org
X-Gm-Message-State: AOJu0YyKOWXgxT4BFJEMHohguI5vs3htHv4H+JqTjmnOtUEVxyN7YzoW
	uz5EYTY78QbqlXo6/mIeQxYwOCmkpWnTnUapy9JSkTCX3L8P7pxfbPZE1L5Z1++CXIo=
X-Gm-Gg: ASbGncsA5+MkoCk5awk4b1mLo+GQ3obS5TSkSCvlORK3Y6zldreOQNR6WpQeQ+m/IIj
	OG/4AOjaWno63PxjF4kG720Q7W/fzfwH+Xh1SzZCXM45uK+Y4Jobl7dITLsLSOiTe7JD5NLHOGO
	tQtpdZiqEotxH84GDXJ9mjTgGpY1WH9wnhbL/hJcMqBmaykw8G06UcCZ6pXoHbYU2Sc1XO3n0dC
	9XtNxfMxgnkXocboN7mYldlGWXXgqe8SQY2sM/kZsWKGHi1P+VPt/Ll1GFHFoJhNn0BQjwOqaq+
	bx4pWuqtOY6DuDjSmo5zT+DRxzgbZTbAAKxD3aESwXhPOEhhtc9rmpa3ItsVw5TZ0g8IbHrSl9s
	LMrNe+fmEvZx0bQ3TbbzD84QZMsGjY9jjEXP4FvXUcrZLzKjv/ix2TOBkuT/JHYCAtTdRZEhKl6
	+9u4Qn65KMnMN6
X-Google-Smtp-Source: AGHT+IEaSNs6TM+t6ZkGhDUEgtd04oIngPsTBonqSpot3F8/HKB8oZ6LSxQKQNPdYyIrbplDJe/VjA==
X-Received: by 2002:a17:907:7f90:b0:afe:82ef:5433 with SMTP id a640c23a62f3a-afe82ef59a0mr1449610066b.10.1756387110829;
        Thu, 28 Aug 2025 06:18:30 -0700 (PDT)
Received: from [10.41.150.230] ([77.241.232.9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe790e382csm945788466b.79.2025.08.28.06.18.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 06:18:30 -0700 (PDT)
Message-ID: <1b00069b-e9b8-411f-9a66-de449ce4420d@linaro.org>
Date: Thu, 28 Aug 2025 15:18:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 09/13] arm64: defconfig: enable rockchip camera
 interface and mipi csi-2 receiver
To: michael.riesch@collabora.com, Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Markus Elfring <Markus.Elfring@web.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20240220-rk3568-vicap-v10-0-62d8a7b209b4@collabora.com>
 <20240220-rk3568-vicap-v10-9-62d8a7b209b4@collabora.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20240220-rk3568-vicap-v10-9-62d8a7b209b4@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_061832_969532_AC1DF157 
X-CRM114-Status: GOOD (  14.62  )
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

On 19/08/2025 01:26, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> The Rockchip Camera Interface (CIF) and the Rockchip MIPI CSI-2 Receiver
> are featured in many Rockchip SoCs in different variations.
> Enable the drivers for them in the default configuration.
> 
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>   arch/arm64/configs/defconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 58f87d09366c..625cb5b47fb5 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -876,6 +876,8 @@ CONFIG_VIDEO_RENESAS_FCP=m
>   CONFIG_VIDEO_RENESAS_FDP1=m
>   CONFIG_VIDEO_RENESAS_VSP1=m
>   CONFIG_VIDEO_RCAR_DRIF=m
> +CONFIG_VIDEO_ROCKCHIP_CIF=m
> +CONFIG_VIDEO_ROCKCHIP_CSI=m
>   CONFIG_VIDEO_ROCKCHIP_RGA=m
>   CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
>   CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

