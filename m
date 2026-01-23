Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E62D74ECB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 13:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZFcVCUbs6+A4DjohoDcTbMd4NWYz6AemlNmvZZNsXj8=; b=DVVNnkp98e61ty3palySzrDidg
	BRv4IicYbKAKetfaO/fcdpiJmh5Cx0JfpcKbELCgK4LhyzjkFNRGwMMMyefMnR5ZaL+4k8lWGdrg8
	/zuJMfgdIewwGjcrWil/9aH5ewOUTh1JNkhSHxS4vr4jrBVt+OTwe6HLwsjq4xkq8iGRG08EozzdF
	jCOTvEpRkL2pFJZKgb4E0wlQCknL38ClVe0asoSNO2M/o/pus17//7qlGmJDat+2tjZwgegzXhY9x
	UDvpZ0gPDIcTNOEEXHx/D+GuicqRbfGDINWeQKZM+9Lk6PHOtXIFEnoPV4rMu3bptrNTkTKtdklR5
	OEtNXDrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjHH8-00000008yHt-43eg;
	Fri, 23 Jan 2026 13:32:35 +0000
Received: from mail-vk1-f169.google.com ([209.85.221.169])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjHH6-00000008yG7-2tbn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 13:32:33 +0000
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-566474a6e10so217472e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 05:32:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769175151; x=1769779951;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZFcVCUbs6+A4DjohoDcTbMd4NWYz6AemlNmvZZNsXj8=;
        b=qWbHxgBmr/IiMQ4KONJrgv/pLGQqoT7BHIqrh6PfIQ7uwLtAw1d5BT29OPpJpeVkbh
         QHMwpcMFHoFvlfTKHTOZRgP/7ZhP9s8oYyHfVrt9O6xMBgISM5bK8vAXljZk7ut3Cauc
         jEdW87mrFS8YWPdt53zJ5Dnj9Sr7mC9S5k3+aW414ro1/Rukg3xqnTzbeqsJG31ilEUV
         tU4H/JZQyoEGcjwgJ2fzv/klCXB0RCbVkZcTKqIVpiH0VXQpsvetSMocDgOVT8paKQM9
         NGPw36DSDtvfTosYvw1Pl9f1aqsQdbtvcAL5eEasn7tH2fhZE8ZDPQEK2eWj4El84e2T
         v3Ig==
X-Gm-Message-State: AOJu0Yw5HSBh4+ChwntzoKjiIRSCqaFSiE6udC7kKuqdpC7rg4fehsBt
	UYQGGFRfqE5Lobis8RVfW9RX6CfDZUvTISAcq5U/mlm89l5Gjqq1aIE6kMrlJtMh
X-Gm-Gg: AZuq6aJbrT4CExxGtAHnWabVXp7SKRRBhvahMdzfRyzvg8Rxym3cZxOcEhVFE4BvdN1
	eBOt8R5PGtgqqutlJgI7Y7RcIOd8/HdkcrF4+OUGykcIOJft2ZwMF6tMSRC9emabkiZhejLVDOD
	6vchWPRtjzSGn4OuujquPmpHYYQDMkh0mjhKZ7Q1hjq7MnzpBi8tQTj9bG/qDZ5YnWkw7aMnMgw
	4Jvbpo6XZKMchDSeTr9/YfRnRQrjnIts1oDl/3stl+awJZFt/ahkOyhXlyRkVeRlzZBu1Jcq5ld
	ftOxNgCSxjHZ+fzAtP2BdupE1x+K9N4a+n98HdgXDwQuMhBRufGY94XpkY7oYDD4wJ4VsPYbxJy
	4Lr/y/Qt2BQRgCXYxtTWOymuEXM/Mf5gRiPxQwvjHb0PY3XsjHmMlEknD4SOBU1Fcc+5bbQmnWq
	8d46NoUeg5ydOI10h+2Fc2OzmDhl5cHD2hRroCHerF3KUM7zrC2JBzJleQjVoqJ9E=
X-Received: by 2002:a05:6102:c91:b0:5f5:3bc4:725f with SMTP id ada2fe7eead31-5f54bcef2bamr853743137.37.1769175151138;
        Fri, 23 Jan 2026 05:32:31 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f54d66c977sm537635137.12.2026.01.23.05.32.30
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 05:32:30 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-566474a6e10so217461e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 05:32:30 -0800 (PST)
X-Received: by 2002:a05:6102:f14:b0:5ef:a9fb:f1f3 with SMTP id
 ada2fe7eead31-5f54bae7a41mr1054952137.11.1769175150254; Fri, 23 Jan 2026
 05:32:30 -0800 (PST)
MIME-Version: 1.0
References: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org> <20260118135038.8033-7-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260118135038.8033-7-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Jan 2026 14:32:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUaPJCdzx5nGgmO4=z5TL6UYiYDaEgL1ezWABh6vPJOCA@mail.gmail.com>
X-Gm-Features: AZwV_QiSLMv1d8wTOd_fggCZcAN0A0pAIafduPy_jaGRkU9OQ3Tlbc0VC45o0gg
Message-ID: <CAMuHMdUaPJCdzx5nGgmO4=z5TL6UYiYDaEgL1ezWABh6vPJOCA@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] arm64: dts: renesas: r8a77990: Add USB 3.0 PHY and
 USB3S0 clock nodes
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	devicetree@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_053232_727775_B2C37635 
X-CRM114-Status: GOOD (  18.82  )
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

On Sun, 18 Jan 2026 at 14:51, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add USB 3.0 PHY and PHY clock node for R8877990 E3 . The PHY node is
> different in that it does not have control registers and extal clock,
> which are not routed to the SoC pads on E3, therefore describe the
> PHY as usb-nop-xceiv simple PHY. Add USB3S0 clock pad fixed-clock
> node, the frequency has to be overridden at board level.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> V2: Describe PHY as usb-nop-xceiv and update commit message

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.21.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

