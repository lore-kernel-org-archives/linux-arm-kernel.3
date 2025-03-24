Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FCDC36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 16:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RR/33HkyWRVzBTpKjMr4gmsX71tawz+FueWvMxXm7FQ=; b=Ch4gRDfyofNAvez1Yp9YHCPFfG
	oboifu1w+1wyyfxC03i3m9JFX9GfJjw0BGgP6pWCh6DezLx8NxB84PRJHfm7RpVjFNLT/23Unrvp2
	zbFaVdpOxI1jSaDjCCPZ1BOzMPwblGn0nN7d+C/hKvPUSiYyto79CUxCIvPuS4rgWhBuJh2ZQAhnq
	Au3h++My6ZasBoJVfULKLOHyLwav7dCa4MbcPkNV5YmVvw+TbMdvAK3i1qUn/qYtXMdraW0I2vj2q
	LvcoE22xDtt0xdUH/qGD/ZPUC8qi1KwZj51k35RYdQuzTVF33B+kE7/TBUNPgZsgcP2MfnPxFw3ug
	a6t+zF2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twkkk-00000003fGy-3IVT;
	Mon, 24 Mar 2025 16:34:18 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twkgj-00000003eRV-3quG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 16:30:11 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso21030455e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 09:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742833808; x=1743438608; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RR/33HkyWRVzBTpKjMr4gmsX71tawz+FueWvMxXm7FQ=;
        b=di4/LiaGJG0VZrzZjPc8WgYpsmixfhlVkK75A2gGJFZ7DFgpl45TK2gMGihqhGvtS4
         700R3KeQ7rfKk1pqQu09SO55hKXqWBCgkznj+Wv3JvstIGsWukyGaGEBr3bElF7pvOrN
         hGKWLZkCAVZ3a98bYyrjfguSlx4bQsh3ISrtZWQ/GgoHcRVF4wNObUlbuZLGppEji2Xn
         N07LifMSICPaAV7P/SE2fvEeoaVfcbMh58HA0PObOsDTYdDcw2jKcSQ5NKAujDl5D3pE
         qHkE75og/7RVxyw4KvatN7Qie9uFv0Hdbh0fLQg5nRd6NLA9dp81d5WTuHpulS8qYuqT
         1QIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742833808; x=1743438608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RR/33HkyWRVzBTpKjMr4gmsX71tawz+FueWvMxXm7FQ=;
        b=WudG2MqoEQP9mkmCXtPL8aUlyDWbvJun51YsxvGgowLYkYwgAHd1YsUMi6SGsEwMgB
         NGCZwvjX+tIEa0kbguBgevDmmATSxpIN/4zNXU4nNzNKPukUNLLLmSdQIrNxfK2zHntM
         WcBeICYPzLOWaGWLkqnfVcSVIJlGOYKcyaqzGPmTVlc1ok2nwN2aGvTddVWXoUOhLvW+
         P6x1rARUFkHG1M6UOq3lYKVfOu2VpxFHurJDg71WPXXam4t8Z2cuIIxBcKRGjRb6kKxH
         VahsJ0MyvYFMmZgB7k98km6L6W6/7b+PlX6UR04ddM+f7qo3SS/IZunij7HbCj5NJ4iJ
         VWMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwJwi5E/JeKM/JobwO27NKlVpgT+hh19+1xPmVMBNe/3d4EY/AQHaeZpy4pFt1ySIM57A2x577Ez4bZEGv62ai@lists.infradead.org
X-Gm-Message-State: AOJu0YzEud7hbE03MQvMpvHIosb9wLm9NmpTPsPIf4ZSJhyW014SW1Xu
	HJB/pL1vDLiR7mulS+m9wC6KtudnI4EF55YsiDVnFUL6tV+dZj2fpyopOoT/
X-Gm-Gg: ASbGncucXerGrxqYSxYNuD5NkvIXp/N46PTjqS68FJGwzcHEaDvDGUPBFL0gUx4h2Dt
	tWrM9C3b1MpzdGTDk5VIHd8zC8gNXV2WC68VDAxQZaUbNBeYptNGHuXr91jkIpZYVfycbEFVBfb
	z2aMquE18wsVip+rPIOYCHfQbi/ip+DASaatsHYIcI8q7sKmAVkeR40V2Y2r3OBvE1UljVRSs3N
	jRs6uyayQM6vHWktgBibVjh4aM2CRwZrY9Kei9fuADNeIKC2/yyJV2LuiWpgPnvtBCdY71h+XCO
	N6AuE8QnJGNp5bndnxcu/ec1etcvXvtMZclM4TFav7Yh/xGRhrgd5ImP5tt4Z1EfDh7+ZvZh1+O
	mcebpwC4=
X-Google-Smtp-Source: AGHT+IEo9FRh6+xI/yyeaQ866fq+Tvmef9RLHhF10hpOmSRuuMOdP7oXv8eQi8BJzr1/UzfTyIuU2w==
X-Received: by 2002:a5d:6da5:0:b0:391:2f71:bbb3 with SMTP id ffacd0b85a97d-3997f958f34mr10877702f8f.46.1742833807619;
        Mon, 24 Mar 2025 09:30:07 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fdb0669sm124106765e9.34.2025.03.24.09.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 09:30:07 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] imx8mp: add support for the IMX AIPSTZ bridge
Date: Mon, 24 Mar 2025 12:25:51 -0400
Message-Id: <20250324162556.30972-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_093009_955843_D236A053 
X-CRM114-Status: GOOD (  19.44  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The AIPSTZ bridge offers some security-related configurations which can
be used to restrict master access to certain peripherals on the bridge.

Normally, this could be done from a secure environment such as ATF before
Linux boots but the configuration of AIPSTZ5 is lost each time the power
domain is powered off and then powered on. Because of this, it has to be
configured each time the power domain is turned on and before any master
tries to access the peripherals (e.g: AP, CM7, DSP, on i.MX8MP).

The child-parent relationship between the bridge and its peripherals
should guarantee that the bridge is configured before the AP attempts
to access the IPs.

Other masters should use the 'access-controllers' property to enforce
a dependency between their device and the bridge device (see the DSP,
for example).

At the moment, we only want to apply a default, more relaxed
configuration, which is why the number of access controller cells
is 0.

The initial version of the series can be found at [1]. The new version
should provide better management of the device dependencies.

[1]: https://lore.kernel.org/linux-arm-kernel/20241119130726.2761726-1-daniel.baluta@nxp.com/

---
Changes in v3:
* make '#address-cells' and '#size-cells' constants and equal to 1 in the
binding. The bus is 32-bit.
* add child node in the example DT snippet.
* the 'aips5' DT node now contains 2 memory regions: that of the
peripherals accessible via this bridge and that of the access controller.
* link to v2: https://lore.kernel.org/lkml/20250226165314.34205-1-laurentiumihalcea111@gmail.com/

Changes in v2:
* adress Frank Li's comments
* pick up some A-b/R-b's
* don't use "simple-bus" as the second compatible. As per Krzysztof's
comment, AIPSTZ is not a "simple-bus".
* link to v1: https://lore.kernel.org/lkml/20250221191909.31874-1-laurentiumihalcea111@gmail.com/
---

Laurentiu Mihalcea (5):
  dt-bindings: bus: add documentation for the IMX AIPSTZ bridge
  dt-bindings: dsp: fsl,dsp: document 'access-controllers' property
  bus: add driver for IMX AIPSTZ bridge
  arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
  arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'

 .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 107 ++++++++++++++++++
 .../devicetree/bindings/dsp/fsl,dsp.yaml      |   3 +
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |   8 +-
 drivers/bus/Kconfig                           |   6 +
 drivers/bus/Makefile                          |   1 +
 drivers/bus/imx-aipstz.c                      |  92 +++++++++++++++
 6 files changed, 215 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
 create mode 100644 drivers/bus/imx-aipstz.c

-- 
2.34.1


