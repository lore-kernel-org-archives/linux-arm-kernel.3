Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A93D3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 11:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yyAejQoJ31yxLblaGyJA0UaK0btri2z1qopeoq8fo/o=; b=t3JCOngI7BkG2gnv8SdPZbyIqn
	bRXT5H2UFVFNiEDayTqBTADj3nr/KdS52KYFF7xH5Euzdx33h55vFbJODUpX74/TD8247ZIwj/XzY
	wnRu1sRQfjNadw7Poemy/qIH6e74N5QfCA6jnYXsGhNGOrlvZ/3517KzxmYdogpylQScb/4nLAV+2
	8hHW+MwY3aOqo0brFDiKlmxTvrpS0nPP5Au4ilesmlVe37JBYSWPFt5kJ0ZfAHnsWwu0by7DDdvFy
	A0d2zBT3d4ak1zGAt8O+Lpklaubuk4tW4DIyzgyLpV/vSyEr+RT9ZLz3sBy7c9aBGJIif+2k1Nk1B
	CQKv2krQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaBny-00000003dbY-1Ngn;
	Mon, 29 Dec 2025 11:52:54 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaBnv-00000003dam-1Gqa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 11:52:52 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-594330147efso10828322e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 03:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767009169; x=1767613969; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yyAejQoJ31yxLblaGyJA0UaK0btri2z1qopeoq8fo/o=;
        b=V0ce7uAYYx0TGpoOAQ2gXapbP1Qy0EcTF9XOEhxs0JSQy8zs6Cvtju75AzZ9oF1nCY
         MTMTg6vdF+Cukmadnl90Djxtox82Qwxrgkji3keMCMUXaV+1ZHVJfVgNDVboz8LnGnOH
         gAqR2W4rTxwrhstUNEqtu1Fjn0ObL3A/x0Kp1yVNfNIwMIwT68Nn5ypELlWjKxLElRwz
         i7rPTPYz0+b6UmvMTiXUPfqAA1GJ6kpPCkY/qinq0mIxdVi4cp7/wkyPUtaJ3OKVaWkV
         RIFtRS55VNycY08AuW6l0QA01zENaXYO/RdhYCEZfXTdolxqSwTQVbCnuZ/gEUpvfQv5
         O/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767009169; x=1767613969;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yyAejQoJ31yxLblaGyJA0UaK0btri2z1qopeoq8fo/o=;
        b=QwjVA7D5l8JMWglCzy37KeRtUDPV7GJf4X8T2eE3KJqLEGQAp9FopJF4f7IjVV7kql
         +vGdtfs+GqzX/OvO2JqRqpF0nvL2dFkViNrIzNdTPL9fnkFrZZy7meI7QRbZ2Z3q5vfL
         Z2K5siu/xNEtFU8dwHPcDZgHCKsq0r5Rm16z2dX0V2W9tZ6dO5/PVMjIUaCiCULq2uaq
         0SI7DUHoV7TKGhBBECYbrLvTNORjAokc57NVaftrxOpsCqtAfW46OynazCuTuD/3xvQk
         IzsrX8mpIWNS4vCUCA3hctI4N/yxvlRLO3OhCQXf3Hm6AeogpKp1g3wkrVJG/ARzS6qx
         nYDg==
X-Forwarded-Encrypted: i=1; AJvYcCW++It3Iny9UfTofuEyF4SczHJF/FIr2ye7LimdcedPhxz+GEQv8Gc633Wza4BwZTMTsLbfQfHZDdG671AjoU20@lists.infradead.org
X-Gm-Message-State: AOJu0YzlYy67sOsIRxTW0tRcm8sgpNwx5IJPFajwMqxTnKfGiH0kP1vu
	QQRglMjESZGmJPKbB9odXNNSUjhZ2EVAvR1jzaaHTIxoNgWKB/F42/4KOULVtxv04o9VxHJRUyQ
	LZGsU8qfVJqXx9Buxa/zfUIZqODLb1q+5rQCUyTXsMg==
X-Gm-Gg: AY/fxX49FevgEAexqQKxy/PYQiX2ik7hA9qAxp87mfcoqjJOqE2XFCBzxIH1IwRnM3w
	OQ15+EX9mggaCFaMaX+kNqDrblQyweciDY8tiBAO5ZBS8khkg2qpmrgAU5MTkyeE6WYg8kdiySF
	06BpsWvUsoWk5a/sBiAChGFNnmzU0G02CiL2eQ+hLjVRpkd9Eqb6A6aTVtW0oGUW7z/BSV4ziL5
	91jr00KOKk5bBxoc8+gfCgZM7vuhVODnftgWbUiBIQstEHkOrF5YnO7OsC0GLwA6Stkfg4c
X-Google-Smtp-Source: AGHT+IGXTnQvaqHS0G2iP51aqu1mvuIV4jhgR6at2cQP1b4/0bJHJAEiAFHVEV4s8SZhwvY+c3cbe65DWXNr4JmMalg=
X-Received: by 2002:a05:6512:3686:b0:59b:4213:7587 with SMTP id
 2adb3069b0e04-59b42137644mr469217e87.27.1767009168978; Mon, 29 Dec 2025
 03:52:48 -0800 (PST)
MIME-Version: 1.0
References: <20251220-mt8196-shader-present-v2-0-45b1ff1dfab0@collabora.com>
In-Reply-To: <20251220-mt8196-shader-present-v2-0-45b1ff1dfab0@collabora.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 29 Dec 2025 12:52:13 +0100
X-Gm-Features: AQt7F2qiYKGEucbLF3l0nxkbcDv5up47FHRBhmipPDgxy8BIo3kAL2HBIUAOYlA
Message-ID: <CAPDyKFqkPg5rWYk7cwDywRn_pexQhd2V3R63atjruJnSpYxfZQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Make MT8196 get its Mali GPU shader_present from nvmem
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Chia-I Wu <olvaffe@gmail.com>, kernel@collabora.com, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_035251_401004_8E19084C 
X-CRM114-Status: GOOD (  29.36  )
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

On Sat, 20 Dec 2025 at 19:50, Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> The MediaTek MT8196 SoC's Mali SHADER_PRESENT register does not list
> only functional shader cores, but also those that are fused off to
> improve yield.
>
> The SHADER_PRESENT bitmask with the one fused off core omitted is to be
> found in an efuse. However, the efuse address is considered
> confidential, and is not public knowledge.
>
> The MT8196 GPUEB MCU, which does the power management for the Mali GPU
> on this SoC, knows and reads the efuse however, and exposes it in the
> shared memory intended to communicate state to the application
> processor. Reading the bitmask from this shared memory area is the
> vendor's intended solution.
>
> This series models this in the binding and implements it in the
> corresponding Linux drivers:
> - the mali-valhall-csf binding gets an nvmem-cells/nvmem-cell-names
>   property to declare that shader-present is in a different castle
> - the mt8196-gpufreq binding requires nodes to expose the shader-present
>   cell
> - panthor checks for the presence of the shader-present cell and uses it
>   as the shader-present value if it's found, instead of the Mali GPU
>   register contents
> - mtk-mfg-pmdomain becomes an nvmem provider and will happily serve
>   queries for the shader-present cell
>
> While it would be preferable if we could read the efuse directly, it's
> not possible as things stand, and insisting on it will just keep this
> hardware from working in mainline. Running a GPU workload with a
> SHADER_PRESENT bitmask that includes a faulty core results in corrupt
> GPU rendering output.
>
> Modelling the mt8196-gpufreq device as a nvmem-cell provider however is
> not lying about the hardware's capabilities, as it truly does provide
> access to the nvmem-cell, even if it acts as a proxy.
>
> From a bindings and panthor perspective, this is also generic enough to
> where hypothetical other vendors doing the same thing (even with direct
> efuse access) can rely on the same cell name and implementation.
>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

I have applied the pmdomain changes in patch2 and patch 4 for next, thanks!

I assume the gpu changes will be funneled via another tree, but let me
know if there is a reason to keep these changes together.

Kind regards
Uffe


> ---
> Changes in v2:
> - panthor: move to nvmem_cell_read_variable_le_u64
> - mtk-mfg-pmdomain: put of_node in error path
> - mtk-mfg-pmdomain: remove leftover stray of_node_put on NULL
> - Link to v1: https://lore.kernel.org/r/20251217-mt8196-shader-present-v1-0-f6f8f3aa1e93@collabora.com
>
> ---
> Nicolas Frattaroli (4):
>       dt-bindings: gpu: mali-valhall-csf: Add shader-present nvmem cell
>       dt-bindings: power: mt8196-gpufreq: Describe nvmem provider ability
>       drm/panthor: Implement reading shader_present from nvmem
>       pmdomain: mediatek: mtk-mfg: Expose shader_present as nvmem cell
>
>  .../bindings/gpu/arm,mali-valhall-csf.yaml         | 14 +++++
>  .../bindings/power/mediatek,mt8196-gpufreq.yaml    | 13 +++++
>  drivers/gpu/drm/panthor/panthor_hw.c               | 36 ++++++++++---
>  drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c       | 59 ++++++++++++++++++++++
>  4 files changed, 116 insertions(+), 6 deletions(-)
> ---
> base-commit: 638148c6ffa31d2e4958d51708ff3675221e2da7
> change-id: 20251217-mt8196-shader-present-e2dc3f97fc74
>
> Best regards,
> --
> Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
>

