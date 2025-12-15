Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC95D5B842
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 15:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K3EiCf37zmh6OYCxevsK3wYl1l2l0yO8i3lRu2zzoOo=; b=Es5QxUh1erSx03xLIPA2hskTNC
	N5+tzaTyPfpksBvEL/RYNBV1tZGcwFHmFcpGRG+tLYykRryGNHeDJilPUgF4OUpvQUSnIp4C1/kVb
	sOlHIdeiEWi8nkMfY6VOIhO2EynfZSPFOsGzi5ozNvsfnoWkvenHUNvoehF2zDubDis4wIQsOgAp8
	m4c1kQ4I6Iwp6GRmzxxjlNzRu0XXQifpo1PGM0jVLs/MEcRDn4JT9j/TaxDQLDikfNIvFkwBfRNBS
	yCc30eADZKK/dqP78hgJRiP/RiRNCDEqL1kFtqArvzMtQ4x/vdxy+OmA3A9Y61buqkUIBnMxuK9qz
	C4LEgEbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAkM-00000003ufH-346J;
	Mon, 15 Dec 2025 15:44:26 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAkK-00000003ueU-06nc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 15:44:25 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-78e7a16e4c0so12881567b3.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 07:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765813462; x=1766418262; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K3EiCf37zmh6OYCxevsK3wYl1l2l0yO8i3lRu2zzoOo=;
        b=k/+/MQG2NEOmvBGiCKTyLC12xcKNe0xE0MMqsiwMi86/LyOfRZtHwpykQUEBCS8Nvl
         msg4Sb46UjwnVBx+csHQWjBTitx66mVcPLkcTeyLr1rPIKMAxBOq+SK4nuSV2/P83WBl
         IO1v2YE7MH0kTPrwz71ixnZO6wJXEpN2Aloul1HOndNszHMz4V5uVlZ78fFFqW4Wafkv
         9fPN72xiLKTdUgpGRbxlhtOovnJPh6Z0Z16I7g4e2wTFCzIKtppuaSrEn8EunVHyDmSU
         LkFudDWeYTOA70rNFVXnxdCWxap7hX7F5qiqg05cstKiOd6UQCUvO3kbauCuHI9bjOlh
         jYjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765813462; x=1766418262;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3EiCf37zmh6OYCxevsK3wYl1l2l0yO8i3lRu2zzoOo=;
        b=qlLkdMk2Vmw/rJQhD7Xe4K2opNtIvKscbo5o8+U4izKz+hZ9AJCkDpSk994oMKYcM9
         RcE8RKcAEMVjsj/9gWQvhmIAO8VSlGKoexVaKizJnbb6WRc4Ii+Jfpu9wB2dTrowFGlm
         ev2/NYNldl8VJG71aUjiboXnuwi7GEy+XKxKUPgMvD1FqFUWYWZqwDPq2g1I0RODfbEZ
         JRTsYh9VJYUVPZz3oTmXQnM9gJeXODnMSrfBW4gOJAJS3Ik6lOS4IwUe6Y0tEAwDeOIQ
         Pf2efjZ++i8Z5RnQYrEq4DKPvmAJ6oRZH0rB5R6DO6YB3vKw1m6wMYU9rGEfa2MBcNGN
         3/Lg==
X-Forwarded-Encrypted: i=1; AJvYcCX17mp2MzOs//i/B4QfTmIpF8uw0F5Xjk79JVnHHZdeslqKaecpNz+cPrTn2puKr06goZNKVBirB3Y2sjSesGI6@lists.infradead.org
X-Gm-Message-State: AOJu0Yzd/dF31jgkkvcD2IaBIWv+FkC1Vs87dpjuCO+uP2WWsjlR2nbU
	g1h/tP/jDmdGIG8lIGMb23PCv2GCP7FWlfQP4QOJaM5M04JDKkbvrQUWtJyvJtpncceomYVGru3
	GX1sZhB1zQqaSSQXSBfw6dB6a+0Tp7vnoZwCQAUvSJA==
X-Gm-Gg: AY/fxX66XUQacDMCK/V+dbloLHktDxyAydfBv8s/1sKQ7mdma97Svx+Coi8+bTM+X1p
	nL4ochCMeta0P8yHrlSiPkwsJEkzVsiyxAm3wGuBnR4uW/1RusGXo8FTx6pdMcqOWIKEMa4fiAU
	vKxh93XBNH6X0V7zkzRLOTw82rILZubELAuzwUC1IaeqhAL4DDP+EAdb5J4iTtAUDcQqfoTpkjE
	rKU5wg7ww5C2aGis0FSHB44hDzsZinQpVPSixq8O0mLPUC9fWzPTucoSDfsfQkNfQpr7UtI
X-Google-Smtp-Source: AGHT+IGoFL7q8HvVv9KIvA1/iDdDg15+gVc1fqtWPGh45LUtRp806bxzNvgl8df7HOVfQLqABF6bjGbmgvq2nhhi7vM=
X-Received: by 2002:a05:690e:dc9:b0:645:541a:4f11 with SMTP id
 956f58d0204a3-6455564f24fmr8169644d50.49.1765813462393; Mon, 15 Dec 2025
 07:44:22 -0800 (PST)
MIME-Version: 1.0
References: <20251203-mt8189-add-mmc-support-v1-0-f5ce43212fe9@collabora.com>
In-Reply-To: <20251203-mt8189-add-mmc-support-v1-0-f5ce43212fe9@collabora.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 15 Dec 2025 16:43:42 +0100
X-Gm-Features: AQt7F2qLO5M-hmnWGiTMCwqz4Oz4UGYnEMVnkbdBTh1zCvxxkv8BxBAberyOD40
Message-ID: <CAPDyKFoXoO-rpEK4Y-FZyWhpOumiwir96-XfLOOR2U1h73ADhg@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add SD/MMC Card driver support for Mediatek MT8189 SoC
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, kernel@collabora.com, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_074424_069255_AD8518A7 
X-CRM114-Status: GOOD (  18.17  )
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

On Wed, 3 Dec 2025 at 12:45, Louis-Alexis Eyraud
<louisalexis.eyraud@collabora.com> wrote:
>
> This patch series adds in the Mediatek SD/MMC Card host driver (mtk-sd)
> the support of Mediatek MT8189 SoC and its variants (MT8371 and
> MT8391).
>
> It has been tested with a kernel based on next-20251203 tag on the
> Mediatek Genio 720-EVK board, based on MT8391 SoC, using both onboard
> eMMC storage and a micro-SD card.
>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
> Louis-Alexis Eyraud (3):
>       dt-bindings: mmc: mtk-sd: Add support for MT8189 SoC
>       mmc: mtk-sd: add support for SPM resource release control
>       mmc: mtk-sd: add support for MT8189 SoC
>
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml |  3 +++
>  drivers/mmc/host/mtk-sd.c                         | 32 ++++++++++++++++++++---
>  2 files changed, 32 insertions(+), 3 deletions(-)
> ---
> base-commit: e47d97576181b31291cf58e77d737d21def0e160
> change-id: 20251128-mt8189-add-mmc-support-ff6df8f89e41
>
> Best regards,
> --
> Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
>

The series applied for next, thanks!

Kind regards
Uffe

