Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F66EA4FC7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 14:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7UcNIiszEKvIE+Kf7TAf++7dJZgkiPPqma20oF8iNSw=; b=noLBdmK0oshqln2GfnY02egGyI
	jJ69P053HLWSzj+UnxiOsQ26oGYotCXIqMd+/n/whqQwaMtauFW79JwlfO/Uc5tpzvCIBxEgJTi0W
	+hTtWAEuTGm0A+Iuzb6BEsDkM0tHe5SwAmAqvWPL9jL97phnw2503sRgVbCSXtLwsV1RYtNeWhGwv
	crS/4PZ1wM0BKxNeor0R1YEngD0Roe5sur2rXpbjCTgxKmrkDJDEC5ZkxrhFdwABy+9FheJs7ewQZ
	O7vNaVw1aXLP1aw447/5TL3ohQqY4rpthXypFPWlUFg7x6OHRlNXUB5OVh2A2UBdsG8RoDRaNJGpX
	vbWMNIZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuWgl-00000000RuR-3Ijm;
	Mon, 23 Feb 2026 14:13:31 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuWgj-00000000Rtd-0FQn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 14:13:30 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-59e57973dbfso4332724e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 06:13:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771856007; cv=none;
        d=google.com; s=arc-20240605;
        b=BNCMHmIqAi/nhY/zzC1H9FrwcNkD8QexTCEpfmVxakzkaHwyEo2asAy6ZQF4mMHGKe
         BNSyC+9iVkOSA8YLG+7wlvluwvD0ffTRNnp781vMZiz3ecxC/7C9gmyxQOWniQp0ifmA
         rGGvCJcA8x3sRY/CJxwriWgC/CX648Fn9m19Nnf76J0wapLDrA843/uWtB1VJE51tptE
         pFUS84ti4Pf76YYqhTOfqBYJJBe1SFQUZs5aVtjSgFpnU9aq4phjOsmtiXJFnaUMz4yc
         ksebHmZgyvxxf9z5OCFkMOCmBFx0b96+o6srVFzSAVe2Il+1Zc49TmzZGFJPSmVXAl4a
         BRyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7UcNIiszEKvIE+Kf7TAf++7dJZgkiPPqma20oF8iNSw=;
        fh=ckB+87PonzasurLvyFV8M2jifoko/IGqTLG+VTWU7nE=;
        b=X30AHRAaeHl31J8VKLV/vtvo+FWl/J1COhULfBtQyLERrBZCZCwxI1HltNDBbbOdaq
         9MBj99JRFtppq+66zQf3lvPqNfMCjKde76ml2YfoxpLJ+O4JJkxCXZImwPHbEbRqEqlV
         q5vGJRAIUcnqFMUkpt0KKqx3lD3RNLBG1+8UxomyWwbf6MSxCN4jEqJihzONB9f3nwYl
         B+7MQzyAIHCdqqPZVeRw6X8bzJYHebo72NdKH6JwP7uV5ly6xfMOnrNyZ7Y5W6jq2Dr1
         HHP6DkAvm+WXnQewNDmTHZrxw8NlfdDVgGLRClT2m7qxrkEMtko2VKGI4Uor+RUm8nDT
         5fgA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771856007; x=1772460807; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7UcNIiszEKvIE+Kf7TAf++7dJZgkiPPqma20oF8iNSw=;
        b=ac2RQW0pI1bgqmCYzOoI1fCPAR3XbSvuQ2mbMQWdj856VvpVybzHA/jFezV/DvD4vf
         GBhaaGRATzYPh4jSLhxBkYVkA/007z2Mnbii5Aw3+Cil4sD6GiKW89GMohUSPROHlsWf
         pfblbgaF+IHc62owBFKmKWo0xNKZzsnD8T6om+Ouul6GkuYx28X0ViEqoZgmejHZhBPr
         yuSpja2Iw6KrpO4pVjkSFjVwLPb2XBi0ODSDnvaS6PbMhzJJKvQr8jqXhCIO/3UgfzwE
         rohcrPToGVZS9nWs5J6CpGDALrpUL23BJ1zt+4CDkI5F3eURQedkCONeYWUUtTzMl6D+
         U7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771856007; x=1772460807;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7UcNIiszEKvIE+Kf7TAf++7dJZgkiPPqma20oF8iNSw=;
        b=XlsLXiCocKqPdnnTO+lwKD7QqVaMwSBbp6zIMqusatzkH5oY5dvZuVVcVqpLBtCFNo
         PWL9Tjghy9dDVj4YSsNUbcr2H2ZgOgVOjbHHAYedr75oqdZ+y2WYR9YpTTIxa/zo+0Z2
         Kl4ddd+Cr9qlPLRH0GXy+vR7kZ+A1tpqTmbFoUOkNUZXK0TdSXhGpEQR/NSdbVdVJefc
         eRZyhiIdh2418HzMfoYSXAevhASkhjlcRtMNhvOd8rezY8oaEoHuzSujRuAv41zG10LC
         XQgCkxBbG7k04R3Ub9DLz4SdWX79apCUoOFN22lnlo9woai+93Ff7wBxwdPUJB7l4Wwv
         iY9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUy0/Derr0a1+ZX8lG77LfKb5SNs/YKw+ADbZYO/sRqdZdeC/mQIyHmDmOOiN2GsRBxKr/lnv+HbROya6X9VPuD@lists.infradead.org
X-Gm-Message-State: AOJu0YwrCZyiNkUhIrAraoKuUmZJXgkTsvmsWCjtuBQYiP+ozPgb1GkL
	Ca6fkSgleljBAy7Bt9FwfSojVAAe+1fH3rOK9/gXQOFRQU5JGBCuOs0tp5skxky/UzWmAGLH9qw
	1h1uapN15XwsRt+5bsJu1dSPh2iYWTo1FH5k7Azougw==
X-Gm-Gg: AZuq6aIcZD5i6n5n0hxSGkbwq5BSHpIdXpYBFt8oKXXMo13vh+wlgjAmjaTnMqDwLT+
	KMN9oK6BHLEmKEIDDzjsnvEq1vXGUcNnBxGEA+j+Po0WO2mltJwOuuOTcZdTxLNOxYYJBkNB3wE
	rvTZdBF7MnBfN9cPk+f3mmK3DKSLiMrJKmdo89CTDm2ed4VsDHFtaGjKaXF7o0BxrMgqJJYJ5aL
	d9Ol+10DYMctv3Xi7xwePhLLlKQDH/3GQbnUkx/+h1uj+t8rb/99kw6rxbsAaR57Z+5Oz0m1SyS
	Ix/yp0dh
X-Received: by 2002:a05:6512:108c:b0:59f:822b:b739 with SMTP id
 2adb3069b0e04-59f8abde44cmr5314261e87.4.1771856006894; Mon, 23 Feb 2026
 06:13:26 -0800 (PST)
MIME-Version: 1.0
References: <20260206-axiado-ax3000-add-emmc-host-driver-support-v3-0-ef83b09325be@axiado.com>
In-Reply-To: <20260206-axiado-ax3000-add-emmc-host-driver-support-v3-0-ef83b09325be@axiado.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 23 Feb 2026 15:12:50 +0100
X-Gm-Features: AaiRm52Jn7GtelEGkOZ9XPfUniIrpYcIWOFdBS3zcfWiZwJDEnJ15M24z8fGJdw
Message-ID: <CAPDyKFr-N=P1vKSHGtOr1surWApBUz630v2xsBD+5KkPWaPZbg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Add Axiado AX3000 eMMC Host Controller Support
To: Tzu-Hao Wei <twei@axiado.com>
Cc: SriNavmani A <srinavmani@axiado.com>, Prasad Bolisetty <pbolisetty@axiado.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Michal Simek <michal.simek@amd.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_061329_132148_90ED11C1 
X-CRM114-Status: GOOD (  18.07  )
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

On Fri, 6 Feb 2026 at 09:23, Tzu-Hao Wei <twei@axiado.com> wrote:
>
> Axiado AX3000 SoC eMMC controller is based on Arasan eMMC controller.
>
> This series includes:
> 1. Add bindings for AX3000 SoC eMMC controller
> 2. Add arasan sdhci support for eMMC in Axiado AX3000
>
> For platform device tree change, we will send a different series of
> patches.
>
> It has been verified on AX3000 platform.
>
> ---
> Changes in v3:
> - Enable SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN quirk
> - Remove dependencies in b4
> - Link to v2: https://lore.kernel.org/r/20260109-axiado-ax3000-add-emmc-host-driver-support-v2-0-934f1a61f7c0@axiado.com
>
> Changes in v2:
> - Keep host controller changes in this patchset
> - Use pdata instead of mix compatible string
> - Fix coding style
> - Link to v1: https://lore.kernel.org/r/20251222-axiado-ax3000-add-emmc-host-driver-support-v1-0-5457d0ebcdb4@axiado.com
>
> Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
>
> ---
> SriNavmani A (2):
>       dt-bindings: mmc: arasan,sdhci: Add Axiado AX3000 SoC
>       mmc: sdhci-of-arasan: add support on Axiado AX3000 SoC
>
>  Documentation/devicetree/bindings/mmc/arasan,sdhci.yaml |  3 +++
>  drivers/mmc/host/sdhci-of-arasan.c                      | 15 +++++++++++++++
>  2 files changed, 18 insertions(+)
> ---
> base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
> change-id: 20251222-axiado-ax3000-add-emmc-host-driver-support-2cc84a8f889a
>
> Best regards,
> --
> Tzu-Hao Wei <twei@axiado.com>
>

Applied for next, thanks!

Kind regards
Uffe

