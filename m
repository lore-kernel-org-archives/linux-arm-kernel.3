Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84D2CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 17:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SrzBV/CHeC4K43UCwv6a0kN1Tfy/GhWE6NmP1fIYMXI=; b=3CASPUHMYFJWWwSw0Wj/X3rLTI
	HncnQqNCP4K+GC5YisJj1mRykxcPvvfrvokG7nOFX8eaULfuaUFltm/K1xHt6hTBbY6vaVHncB6K/
	HK7B+Uuc34qSJQoMwwsXtBoVHf7d5xb5gty81xZbm8shPuHLgJb4dslSdDp0VykLOWOouOCkwtm6l
	2dq5q0kTkPeE/+8BY+oSxZbjHDw6Oexe1hrbQDl7EbyBbPw7Xuh284oAywsS2hIDCID1TAs2jnF5A
	/+qrB0zWd3IHFZFgbj6nbu/g2qgo+H6Wds7o6bQx7I6shyoo1Y8Lloim6uPfPQCwUsrcnF8IMQxD+
	963QqZLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUpJf-0000000FZW0-3mZM;
	Wed, 03 Jun 2026 17:23:43 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUpJd-0000000FZVU-3slf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 17:23:43 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-304f0039c02so52071eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 10:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780507420; x=1781112220; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SrzBV/CHeC4K43UCwv6a0kN1Tfy/GhWE6NmP1fIYMXI=;
        b=FbD1s+ImASClxnAW0B/x4s2pFS1rXXEoZz1d734umND4lwchC5lZDALXGX1PpIYnpb
         klZFFAzr3gc0XmWqfQ7Gm7KXD5OMhk3HCUQJQWe5VvEi7IEGkCfps+8S4KFELhHFN229
         abIK3KzyaPzXOpYOdQi+dKxTYJtdBe75+d/NY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780507420; x=1781112220;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SrzBV/CHeC4K43UCwv6a0kN1Tfy/GhWE6NmP1fIYMXI=;
        b=VrtqvvtkBkpuH4+mGj436V7M9V+wKJ1B+aC16gBMZkWXU3Uh6BA6Lynyx8ntWYaMIA
         e6r5ZLphxLQ1A075oO+Ml02zHLPTlp26ObDECyCQ4ByAkPvykQj8j14OiT/q3dHNVCOM
         A50GMn+Ot8f8sYa+32OP2UZG+4aNo8bD49eslSGpH+hvDjERp4uPFtmpTso8H+ssX5PQ
         amndo43skdNB0OqjOSRYEdqCIqs7VdmouV0NRaffKnfu/+31HezktV8dalWkWi9HeBBd
         HXZRzNNq+LrEMy1xdGewNqptshLCnmpVpk6FjZ3oxQOWNdiYhNJDLnTdDQ9Xj5LIZEmu
         QPig==
X-Forwarded-Encrypted: i=1; AFNElJ9C9bW3uXlAyVZOTMCGuiwsg3isw7ML7dKKaB5VvkXNRamayaTa3jP8m7NvANZKlAubjPpX5vxOFRevKDh/aQGf@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe435q30+fZKNGRkoCaTWZDUH5faehtPuKYQwN4j4BKP3F9yVV
	ALkAcQrA2pesZW4i9x4EChH52XA6Qri+9Iwyam8n7JRICy9nVbuJRdF9pkaT63QB0w==
X-Gm-Gg: Acq92OH6H4uxk9Vbv9e1u4UHU4lt9abkGG1XEKXZW/2kWNz4Va9AvltS/UUDTvNGi5V
	wVHiq3R03+gMM3l878XD10WOjGr3P+MNFsDVd9HjrEHh6o19hf8ygGLWgV+mKiRgtMLKLwAR76z
	BU0p7eECu+Nscd04Upfkr6g8l82fGeCosA/s5qIGY/84BLeLTU2g3vbHMOq6g3yPdyQM8anXO8Y
	t/f3g7d78s1loOO8PnmzQS8QsVxiuvBnwd4CpqEnW9MC0OVSjabA9102NqEeG/YkoqyY4DDsKxE
	4/vIK//+9EMNznTId4+YbVY1mMdtQUnKXHxkJQQss4dE0UApl1+/2Nvcyc5YfAJHZ0M/y3+h06z
	2dITft48GePKHQHV4JOt3Z8s7ts+WjGvYfp8GkJQa2KfC4Pb0sMipX5yvS2OmwLlpT3xU2ibthR
	/SapULTNW+9J4LJQMjXIfDiH2BtOfDGTItl5rnH/HolfJIvFz6MrN17ZHO7hQZEvhauCFHXApq
X-Received: by 2002:a05:7301:128b:b0:2ea:b7a9:580d with SMTP id 5a478bee46e88-3074fa80739mr2310951eec.9.1780507420313;
        Wed, 03 Jun 2026 10:23:40 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:c444:80f4:5ace:a65c])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-3074d9fde90sm4323779eec.0.2026.06.03.10.23.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 10:23:39 -0700 (PDT)
Date: Wed, 3 Jun 2026 10:23:37 -0700
From: Brian Norris <briannorris@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bjorn Andersson <andersson@kernel.org>
Cc: devicetree@vger.kernel.org, Doug Anderson <dianders@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	Julius Werner <jwerner@chromium.org>,
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>
Subject: Re: [PATCH 0/7] dts: Add /firmware/#{address,size}-cells to
 Chromium-based DTs
Message-ID: <aiBjGekXkr2nIf-w@google.com>
References: <20260428200712.2660635-1-briannorris@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428200712.2660635-1-briannorris@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_102341_998718_C1C6FB0A 
X-CRM114-Status: GOOD (  17.47  )
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

(Trim address list)

Hi Bjorn, AngeloGioacchino,

On Tue, Apr 28, 2026 at 01:06:52PM -0700, Brian Norris wrote:
...
> The /firmware node has an empty 'ranges', but does not have
> address/size-cells.
> 
> Commit 6e5773d52f4a ("of/address: Fix WARN when attempting translating
> non-translatable addresses") started requiring #address-cells for a
> device's parent if we want to use the reg resource in a device node.
> This leads to errors like the following:
> 
> [    7.763870] coreboot_table firmware:coreboot: probe with driver coreboot_table failed with error -22
> 
> This series adds appropriate #{address,size}-cells to the device trees
> used on Arm Chromebooks to work around the problem.
...

> Brian Norris (7):
>   arm64: dts: rockchip: Add #{address,size}-cells to Chromium-based
>     /firmware
>   ARM: dts: rockchip: Add #{address,size}-cells to Chromium-based
>     /firmware
>   ARM: dts: nvidia: Add #{address,size}-cells to Chromium-based
>     /firmware
>   ARM: dts: samsung: Add #{address,size}-cells to Chromium-based
>     /firmware
>   arm64: dts: mediatek: Add #{address,size}-cells to Chromium-based
>     /firmware
>   arm64: dts: nvidia: Add #{address,size}-cells to Chromium-based
>     /firmware
>   arm64: dts: qcom: Add #{address,size}-cells to Chromium-based
>     /firmware

Patch 1 and 2 (Rockchip) and 3 and 6 (Nvidia) are applied to linux-next.
Patch 4 is obsolete / unnecessary. That leaves patch 5 (Mediatek) and 7
(Qualcomm).

Bjorn (Qualcomm) and AngeloGioacchino (Mediatek), any thoughts? I can
resend them separately if that helps somehow.

Regards,
Brian

