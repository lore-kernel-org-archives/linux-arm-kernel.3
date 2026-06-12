Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738EECD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 14:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jws4kc/6HCJln3nPYNLHurE61VFKguu58eheUohgKlM=; b=fAGwrNfjEKVSxU+TeUN7D5XLdU
	Zvi4lJT39SRyR7khudynSrhrHpIZ4I/Ivdo23/TfE+Tw16OsDzamYOV9OgqRoLTHihHcYTQ883vla
	sRcuMDEo7BRbTagw9XPzuNVxbpux2HgQAbgP37w9vXgF2bmfXoaq3OoGbJkdRIxzzof3dVUvcfTpt
	LKvnxnGRK4RLy3iyfxafg2w6SFPdAWwjV+S8yUAdkN/+cPHDCKEACY5/bdZp0ZCnQQ6tl1vMAYKOb
	/qj7wlD7dHd3qLScysSTyA2or9NDuSf+TGWNHkb+mb9kK7hWxAQ1Mrso2O3HUii6YRqwifGytpxwD
	EOiyT++A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY33Y-0000000B5ah-3bVK;
	Fri, 12 Jun 2026 14:40:24 +0000
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY33W-0000000B5Zv-02Wz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 14:40:23 +0000
Received: by mail-ua1-x933.google.com with SMTP id a1e0cc1a2514c-9639e91e773so391595241.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 07:40:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781275220; cv=none;
        d=google.com; s=arc-20240605;
        b=bv0ckNahuEo9x0LgfJCzyWrO/2Jkj1qKZvDRTGIjM7VMYpOIkrqJxytovBi/YH922k
         rhumV1Fcmu15UAYsK6wmgHLO0xqE5qhuxkXGKVfB6GKvrsKfMbU2MZrb2JVt9bAEVqbj
         TR1JcafJApfZgBtePjOHJ3JVXB2/0YTE9No/fFgXazFo81ZENrt/X11Q2DXwK0eIjp53
         vMPA0uorQZTZ7FH1g7Inf1rmBJhZgHNeq8VG8V5gloSRm71tZnr/D+bMoi798fR1CPbX
         Buvm2sMmQ3P5DxF7UqGnpoCMun9kadQ1KrW8o9izzchYgLHEAyLhp7rXN2kOGDIrGdcD
         kLzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jws4kc/6HCJln3nPYNLHurE61VFKguu58eheUohgKlM=;
        fh=/dGjzRmKDdCVLqh/auUBitYg65Onblf/9XIFCyCKZLM=;
        b=FSvryBrPySgjqnjCugurvwuRnzMHnNzPZrz7Cp71fGgZoLL//AM1OL/iHBEqzJJWB2
         nFa83kgNI48q5pT+dhfRoQhIO9Ym3tVb5DIg9KAeOVdAmqBWPqldmSynsHbtBN5c5k0f
         FDRr4jke52eQICfiPcQkWHYteDxG6DxotJxBZE0wZziMGX2aKj8Gb1YoFhCylg/yuvXp
         TfDDT5I2rFkh7vBnXYdh0L3/IyNbLN1qK/tK9Eab5KJmWHpmwXrPLWPenYOCiJLdNdYL
         KXRHdjCaFV1AqDjnhPQ3Ygwvop61kqVcr5dbjvfpAOSrnh0DPvjMp0sM6LweXOtKAjqn
         cbIw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781275220; x=1781880020; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jws4kc/6HCJln3nPYNLHurE61VFKguu58eheUohgKlM=;
        b=rk2pVvXxOUIUcPsW89xgvnt+F7/UnmjRgdNLEsbZezns4/5B96mbo97VGZMJT9z/B1
         67Z1IhQI513uWO5iq0tRCJh8ez6j7ioGlob66DGbPVVspLivhUVQylUV8XXvBcW94IfD
         NsznLuIx5htwmvKQ8I4CWIJUVOoHxx7Bbdy+jFO95j1e/MDJqkyF7xk9PgG33MdsYNEc
         Pb1ep3M+YYxb9MfYM+cCJjQKTdO2TshgUNduug00SIMYt2eZWqeHEdDui3uZg13V1A3l
         gOerkLFpCa21XlrB5yWUFPN69I6nTXsoNLjlCWMpzlAofEuiiW02XxoP/hCqm32bb4sd
         V6lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781275220; x=1781880020;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jws4kc/6HCJln3nPYNLHurE61VFKguu58eheUohgKlM=;
        b=RZjF8lz6/hYSjkoyvUxyVZmYBvjN76aeTTJIlMgtlzWtm3XwCBChSrrgEocNG8Ez+w
         nl8EDCnUcet+gjkFFzx+F3fwUwyjgXCDWb77lYBDpYJ/gkvyQegmvMAzeil5jvL5r/j3
         j/MOUuUp9McMjJ61a2KzCs/25HlqBbMJWf3t1wMEacV+LNxmXFnqJM3W6xo09tJQJtJg
         9jk7bZ3+Zz17o1tLOMDYvI7HkkKd8A8t4A0gO6dMh6oR6DO9koHYSKICO8PEF+XP0bno
         igrvYk0mkvY0QECvbpfb6Y21bXvECd/XjIS55gWhl+/SjUwWnf2NimtJxInKWuK+yzT7
         yBlg==
X-Forwarded-Encrypted: i=1; AFNElJ+qvRXsVFngfTobYpIkkRsUEORtJSzxXdKmQpM/crPJt/MqOK1VauS6/ItXNEEhh+QUtLoDE98qoUtokbYrUDbK@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0tR6pTm+HzC5eVhTOJzwweXE6oQAnz5oWHc7WlyGkXbgCoeLX
	ZrfhCVzCGsKnPxNFwQLZQp1q98YfeORMifufllGdkJMnIGf6gQh+SDFE3W4uafnWoh8xknO3bIq
	GtpvnjFosmC9han+bRaVR4Gc1WkpkNZM=
X-Gm-Gg: Acq92OEyOEao2QtV+V7fAQv837Fp0Yj294zOZmjYCtMV/8QcKG303wTD713LTMJp7wP
	aBLC8AND2o5A9YvS1LewDRq9/D/qqG/UMFYkUjADnPUzzFboeZ2guKhZDHxkFckbTAf/kFi943F
	Sp+3MkRbDUgFlm49atvEewpfHD2GIuDrob+OpizVuKG5BGsAx4YgGego1KznlqOEOWwXa+NdDR2
	Jo+bLwXOJlN/J4eeKRjFoIHiF9yuXZ6rccNlG1Rq0gNFZA3U1FLqSix0gzP8fEA9y7knx3foyOs
	XEchV5mMLJERH9DBWeMq1QW4czBwkFZuZ2xlgSQ=
X-Received: by 2002:a05:6102:3e8a:b0:633:f2bf:7de4 with SMTP id
 ada2fe7eead31-71e88b250c7mr1959385137.10.1781275220197; Fri, 12 Jun 2026
 07:40:20 -0700 (PDT)
MIME-Version: 1.0
References: <1a0c86ab264cdc1c79c917e984b90991af51d827.1779123847.git.shuvampandey1@gmail.com>
 <20260611222653.GA527114@bhelgaas>
In-Reply-To: <20260611222653.GA527114@bhelgaas>
From: Shuvam Pandey <shuvampandey1@gmail.com>
Date: Fri, 12 Jun 2026 20:24:56 +0545
X-Gm-Features: AVVi8CdKAP86TtMoO599NkYV98Yvwx6Qva5SIn9Z5VQSeP_4V_va59YftVroKA4
Message-ID: <CANAAWH+qT8T4_OBwu0WxU6o0FTT7xqwpLTOFrWiV1dZbXHk+fw@mail.gmail.com>
Subject: Re: [PATCH 2/2] PCI: meson: Add missing remove callback
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Yue Wang <yue.wang@amlogic.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Fan Ni <fan.ni@samsung.com>, 
	Shradha Todi <shradha.t@samsung.com>, Hanjie Lin <hanjie.lin@amlogic.com>, 
	linux-pci@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_074022_048640_80DE0871 
X-CRM114-Status: GOOD (  11.75  )
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

Hi Bjorn,

> What's the user-visible effect of this?  Does it avoid an oops?
> Reduce power usage?

I don't have hardware with this controller, so I have not observed an
oops from this.

The concrete effect is that driver unbind/module unload gets the
matching teardown for the successful probe path: the DesignWare host
bridge is unregistered with dw_pcie_host_deinit(), and the PHY is
powered off with meson_pcie_power_off() before devres releases the
driver's resources.

So yes, it should reduce power usage after unbind. The host bridge
teardown is also the matching cleanup for dw_pcie_host_init(), but I
don't have hardware evidence of an oops on unbind.

> Of the 34 instances of .probe() in drivers/pci/controller/dwc/, on 12
> implement .remove(), so if this fixes a problem, I'm wondering whether
> other drivers have the same problem.

Yes, that may deserve a broader driver-by-driver audit. I only checked
Meson for this patch. Some DWC drivers implement .remove(), and several
others set .suppress_bind_attrs, which affects the manual sysfs
bind/unbind path. Before this patch, the Meson driver had neither, while
meson_pcie_probe() calls meson_pcie_power_on() and registers the host
bridge with dw_pcie_host_init().

Thanks,
Shuvam

