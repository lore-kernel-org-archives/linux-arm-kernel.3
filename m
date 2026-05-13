Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77348CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 05:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wmRv0NXfvAce8J6idgvVoBoDVEkEvCPS+byXzjlhfXY=; b=Hx5tMw1l+hGYpb
	e240Z+NwHW+Ej50jHf1vMg3HnTloZ2SalsTDfY+uPfAMJCO9of7gpmf2AzVaHd2A9XpOE0b3+PhSi
	4l5CURNaxnHw2SDOpVpS8og+fZxf86ZxuOc2B/UjYGPon5nIH84aCXjY3lt5W67d5aEhy9NqKxZT0
	7mdTqEPl+rJM78tDKy95hXMObmc+Eap6L0iOkRdeHXQvC83NRbjXiBef+yyL6wmEPuctXtNDaFPZm
	Nx8NIUUEeYWWxTbHEBCFmnXH1JirniNTWlgzN6YQFSg7/LgX7WfLNPBpeAbMom6iJRVbd/fo1H+Mf
	QRbawaLgpFJeL+JaLvFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN1iJ-00000001H41-0mRt;
	Wed, 13 May 2026 05:00:55 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN1iC-00000001H1t-1L4x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 05:00:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wmRv0NXfvAce8J6idgvVoBoDVEkEvCPS+byXzjlhfXY=; b=EWzUj4tu2qzfPmKhV0LSyUP0e/
	A3Cz/uHu48L9IkjANb/a1YpjHBFiqAv3m96wTSFuqYWuSYhq66rTktXoZNmFXhYgN+SZ4xLsE9A4C
	FjHk6I/Of960hPJwD4wgsKFjbs6KWEqYQ27n2nLNvt82CpPG3Zr2fSCWOIHPd3IFKaO/f0TOsHCTA
	wHenwyyZu3VIEVyvd4fTF0N/XL2DjWhT07Tem9YpjMwbSj9QswWL7yNHGUYgDPV0Ekmdr0Nq/dJvz
	tXMo6Qyxm0FeqhwFcpFiVFhp6DPag+9/FW6S6wF+n0enRdIuxJQM3ZnwtG5vQLHaz1NdAMukZmbCI
	FV+w8Hkw==;
Received: from [91.102.182.218] (helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wN1i8-0000000EWci-1TeL;
	Wed, 13 May 2026 07:00:44 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Subject: [PATCH v2 0/3] Add GPADC support for A523
Date: Wed, 13 May 2026 06:59:41 +0200
Message-Id: <20260513-sunxi-a523-gpadc-v2-0-d5efde151dac@mmpsystems.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAD0FBGoC/2WNQQ6CMBBFr0Jmbc20UlBX3sOwKNDCGIGmAwRCu
 LuA7ly+5P33F2AbyDLcowWCHYmpazdQpwiK2rSVFVRuDApVghpTwUM7kTBaXUTlTVkIeU1vxuj
 SpTqGbeaDdTQdyWf2ZR7yly36vbMbNXHfhfn4HOXu/fIS//OjFChil+ToYkR0+aNpPM/c24bP/
 g3Zuq4feLPNdMYAAAA=
X-Change-ID: 20260507-sunxi-a523-gpadc-1879aa5df754
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Maksim Kiselev <bigunclemax@gmail.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Michal Piekos <michal.piekos@mmpsystems.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778648397; l=2048;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=XH+azKLywEpqSB0i4Y2/0GdjxWHJ3jmNGYIdBfCkokk=;
 b=5J2hVbVK/PUi9ynrfmAOgLftmF+fQ6SsWektq2wfCiUiElGmoG5SEivGpI8stoM35+fRw6Csl
 1XMEhEroFq2BRVkNZsXI0sEmqTDmEPTSV9GjBfystqCGyBjfXXJn8NT
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_220048_838811_B2A7FB3C 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
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

Add support for Allwinner A523 GPADC in sun20i gpadc driver and describe
corresponding node in dts for A523 SoC.

A523 uses same model as existing driver except it has two clocks.

Added support to enable more than one clock in the driver, extended the
binding with new compatible and wired up dts node for A523 as its own
fallback compatible.

Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
---
Changes in v2:
- Handle scenario when 0 clocks has been defined
- Fix copy&paste sentence in 3rd patch commit message
- Moved status as last property in dts node
- Make A523 its own fallback compatible
- Removed redundant maxItems/minItems properties from binding
- Link to v1: https://patch.msgid.link/20260510-sunxi-a523-gpadc-v1-0-4f6b0f4000fb@mmpsystems.pl

To: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
To: Nuno Sá <nuno.sa@analog.com>
To: Andy Shevchenko <andy@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>
To: Maksim Kiselev <bigunclemax@gmail.com>
Cc: linux-iio@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org

---
Michal Piekos (3):
      dt-bindings: iio: adc: Add GPADC for Allwinner A523
      iio: adc: sun20i-gpadc: add A523 gpadc support
      arm64: dts: allwinner: a523: add gpadc node

 .../iio/adc/allwinner,sun20i-d1-gpadc.yaml         | 32 +++++++++++++++++++++-
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi     | 11 ++++++++
 drivers/iio/adc/sun20i-gpadc-iio.c                 | 11 +++++---
 3 files changed, 49 insertions(+), 5 deletions(-)
---
base-commit: 8ab992f815d6736b5c7a6f5fd7bfe7bc106bb3dc
change-id: 20260507-sunxi-a523-gpadc-1879aa5df754

Best regards,
--  
Michal Piekos <michal.piekos@mmpsystems.pl>


