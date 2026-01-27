Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F3CAD2D8F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 11:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OqeEVMZrY/b1NpZNa3oOu9VBtor2/8rkEIETkYfILLc=; b=kmaXqVQUB99neFKDTBmRDpfrib
	NcwACeL7TrHpw+tJOWae3CTQkKfBP90mTKsvGutWyS7KfsiM2/TB/g2idnAK3UsJ7WD2O0xMqjs8r
	Uvx9GR19QMRrTGPhCdHe9phTvtp0Ks357UYoBU6YJUK/owoh0cKCMtQqztNF1gMjdxlSklO5YR0GL
	yavwTMDuzpwLudWbgQRs01Cmy04Mh/ySKzHKjvAdF8fYNtneS4yLB+Hji7+WentQjl+SM4Rs6HFum
	v4ZJaZtsfTmcBCzMYTgB4BiDr6wHKIDU9iuXKuqOjtRkBavyl1mJJYbPGpwT4926X6pJ8C5TPnnQg
	QNZgDxrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkgpj-0000000E74e-18IX;
	Tue, 27 Jan 2026 11:02:07 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkgpc-0000000E72g-31ZF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 11:02:02 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-59dd34f8120so6614931e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 03:02:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769511719; cv=none;
        d=google.com; s=arc-20240605;
        b=Nxql5gGUxqwq+/69Ax2VSZVz+Zz1TfOKZvE6M7jYnwimkAW0FQAuwkXeDwjdYHJyjd
         ticPMQZ+uKBRuIPXjNl3na6XQtUxfEw/p8g0M7YBpBX3cwaDrcnOOOx01W5Xbgcvbpef
         ojCM174G/3ELsD2IPp6rpWY5K73jrbczAZ5CO9qqGzcpwBo7pc9oxGGq3RRfkoqtiC68
         g2wHu45kOOx08JiJumj+xdwAlEiFOY2piVBtj8Qux2TgVkm4uLVHDDgKbQGTxPjb77cS
         DtWVb0rdV+OPOP0GWTCpCsToMeowNy5yS6parCdZTeM7epiSgDPU5rEhvSIxKs0NwLoz
         wNUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OqeEVMZrY/b1NpZNa3oOu9VBtor2/8rkEIETkYfILLc=;
        fh=P8/Y1jt2RTFdqaQOlLtB0wVmlOimi/Xi17G/vGMdHFY=;
        b=WJn/Jty4IOmSDpDkio3oYK09JWgG2zJxYy2YonUwnv9dnQ8dYrBhS8rERTyyXQ/vEe
         3zJNmtVo0z/Hl9J0iBvfv37aGQafvhOilp4AV+BgO1EiT1f2SSTzw8nlvQvi9lgw6KQQ
         FrG4EZu4J9j0N0CMQuZHVD06Z023KxepShDEW6Wc/X0sI1dUHhKR8lMsGXXWXnhfAYa+
         rKo59Kae4loxuGM+q5hH1NdVeFbgB+GGJQAs3eHyEszd0/iYUoPYz8Um8SjZWdw8x4YG
         QiaWZFEsMkLd19p7UP8PIpBS2uugDYShYU5qa2jKMcGkbx78FnBENpt/2fQPfAt5twXT
         11fQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769511719; x=1770116519; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OqeEVMZrY/b1NpZNa3oOu9VBtor2/8rkEIETkYfILLc=;
        b=V2KNmWQUzktRMe8OnnxypmbzbERWOQdkB0AElOxKP+GAN9VwSloVWTjkKkyESWonX1
         0BHPnKK40IHRs+HjnUoKKVr9pXn34AmG7Fr6gatafxjQ9466u3ov0fWyWYCMgd1mO0Ig
         7TQ/HQubBG6nNLf+S9N+kSvvOGh9T3bFT9lmg7Zb0ra1UxPSn6nDShBr/8tzqCjtC8fe
         jiAnrq7qKsJJFyI/q22VEf/xQJ2BhVyoTkcO6KFirU757EpzMzi8AKwmzHAs3H/uTkj/
         PXjG36o2gv8qz1dI1LWekakVZvD7Dwpis+bb/b0yl+3RrZVspIKl2WSsrRSAP6dfntd/
         Nymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769511719; x=1770116519;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OqeEVMZrY/b1NpZNa3oOu9VBtor2/8rkEIETkYfILLc=;
        b=tV1qlsXkvHOSpsX55CZI1ngMTD3MaXHbqXZVNWIPkbgW2jd4PIa5JUupMe7BKM+T+U
         n0gDO0HCCyEyZlDsfOQTXCsnBfMwjrH5xXazjs+SjBAaBZhD94ySHFh7BbntwoTJqtQe
         p+tmRI8NQr2txvukhOgflYYvVAwYTn6jUInjwp9qz9Nnwu6mYuy0pmm9pIaPCeMy56UP
         BOX+r0oawp8mfbAUJxlt8ZC5u8ln09b1O4Jj99YUxitWgU6CymhL7+PYTh2txz9a164E
         TgCvQkJjODUjhvueMca4U+rzXiJtytphOELG34y5WL6OhH4kSrt8Fvv4umYdEa1Cd7HU
         bxLA==
X-Forwarded-Encrypted: i=1; AJvYcCXUagUDUrAODSZdNzQK7rVAp5MFHX5SZP0abCfrbKPwv/B9wk0EQeC0enRQJQkRiSwP1kcc6u5lwvxcCwx0hal4@lists.infradead.org
X-Gm-Message-State: AOJu0YzEcyxJzSbZ31I7vD2n5pUX7LlYmJ6yj7Nf1aYCMdz5JuRUdA87
	bs6PNdZMk9CyIDsZHWPzUCT3aNsMosIa/9oumk6dqz8Ww2c7wBoFEPDwDZLRcJJIJ2bQUsQ0A6z
	JmxDxn2qJ0MMrzFzbuFRFo5V7sYe6vWW0kJoVFwlBRg==
X-Gm-Gg: AZuq6aJ1xMVcC8doQYFNJ5028czAkgCnci6iA9gHds/HOSjz/9wn66yczuWvG0+1dBj
	hdgo2BgnFp7pC2j+Zk5MixtFmMCoszcNf24fy6oms3D+G8ixaAWHElpmXo1d/eNHJzg9xJR/Tg8
	fF3hkqC+eJ8yTuh5SOrUIKoiz4iw54NMczXhkQfK0plaQMfjkGSunsdOnDhzdsY7cCyfJ3m1OQo
	Ur0dH0FX3D638f5tjdHw/2RRZTWmdVA9tCDaQ5XyoI0Bwz12z872Dx8rczv6v9cIJuQQ94Xd6zd
	ov6VaU4=
X-Received: by 2002:a05:6512:3407:b0:59e:39b:f46f with SMTP id
 2adb3069b0e04-59e0402f27fmr590217e87.43.1769511718237; Tue, 27 Jan 2026
 03:01:58 -0800 (PST)
MIME-Version: 1.0
References: <1769171049-74327-1-git-send-email-shawn.lin@rock-chips.com>
In-Reply-To: <1769171049-74327-1-git-send-email-shawn.lin@rock-chips.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 27 Jan 2026 12:01:21 +0100
X-Gm-Features: AZwV_QjWKWIZU3kG6heS5jQbYm2iHh9G7GKnI8uUsEJZ2hAre5A9ItHgOfjtB5Y
Message-ID: <CAPDyKFq_=7SS5RWyFXYjec3hTFdwN2_aKAt5O6SqgBuYxFh7Ew@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Remove deprecated mshc alias support from dw_mmc
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Wei Xu <xuwei5@hisilicon.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Jaehoon Chung <jh80.chung@samsung.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_030200_782566_DB5CFCA9 
X-CRM114-Status: GOOD (  17.02  )
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

On Fri, 23 Jan 2026 at 13:24, Shawn Lin <shawn.lin@rock-chips.com> wrote:
>
>
> The support for the mshc alias has long been deprecated[1], as the mmc core
> already provides standard alias support for obtaining the controller ID[2].
> With mshc aliases removed from the last Rk3036 plaform[3], the only remaining
> users are the HiSilicon hi3660-hikey960 and hi3670-hikey970 boards. This patch
> series removes support for mshc from the dwmmc driver and updates the DTS files
> for the hi3660-hikey960 and hi3670-hikey970 to use the standard mmc alias instead.
> Considering that the hikey960 and hikey970 are open development boards, users are
> expected to use newer kernels, and the need to adapt old DTBs to new kernels is
> relatively low. Therefore, backward compatibility of DTBs is likely not a major
> concern here.
>
> [1] https://lore.kernel.org/linux-rockchip/20211124184603.3897245-1-john@metanate.com/
> [2] Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> [3] https://lore.kernel.org/linux-rockchip/c6feab79-5b73-413b-a94f-9d1b2fa6df43@gmail.com/
>
>
> Changes in v2:
> - Fix a warning(lkp)
> - reorder patch sequence
>
> Shawn Lin (3):
>   arm64: dts: hisilicon: hikey960/970: Convert to use standard mmc alias
>   mmc: dw_mmc-k3: Remove mshc alias support
>   mmc: dw_mmc: Remove mshc alias support
>
>  arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts |  4 ++--
>  arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dts |  4 ++--
>  drivers/mmc/host/dw_mmc-k3.c                      | 23 ++++++++---------------
>  drivers/mmc/host/dw_mmc.c                         |  9 +++------
>  4 files changed, 15 insertions(+), 25 deletions(-)
>
> --
> 2.7.4
>

The series applied for next, thanks!

Kind regards
Uffe

