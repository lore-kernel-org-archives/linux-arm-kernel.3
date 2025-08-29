Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8544FCA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 14:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GMCKh6ebU0u4Z6oifWcZMdJi/zOPW0SlqzJnGxsRIpQ=; b=rkZUYFxJagH1R7jX9PLwX8HDfM
	up2/jfOPzQkbrpSx7NiuoFB5snwI9YUPN+XpQIG4jveHiVkwGHG//hP+OmAhmHU/A8W6X7MVn7XzX
	vFadyZ86vhJrddAt02YMzaCnwt5Gara1a/OMQZulHfVWj21IEdmsvnElzo2sCPvbuGxtkIoB6d7Uj
	QSLB+usBKVY8YJPhNs+Lz58F6qL7Yrc4I4Mxh93u09+qmhBGrsJvIuJt0aKdBGOclqLPYO363nuih
	qLTC83qYlESYWyF6q1ZegUkOAPbYDEKJPS+w1/0I8vkXccFSSw4rIhOv78n3DSyGAxZ9znkyTdPeB
	v+T7VbRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us09q-000000062Vu-2nNw;
	Fri, 29 Aug 2025 14:32:50 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urvDK-000000056Zh-0Pft
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 09:16:07 +0000
Received: by mail-ej1-x641.google.com with SMTP id a640c23a62f3a-afebb6d4093so299846366b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 02:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756458964; x=1757063764; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GMCKh6ebU0u4Z6oifWcZMdJi/zOPW0SlqzJnGxsRIpQ=;
        b=g4HXyC3yA8osmCpV1nM5uO5VZ1g4rLq0Qchu3jN4UfHZ/2F1jt9piwAVgOY7B+dKn0
         hLgAozOxISy+Bg3RI2+je7URWABlnKeGZVvuzVnVUyRzRQqxH3LZrMXWEo14wwXMjS99
         ie8Zf/huc/byat+mMSc0W0vtDN/wdlnFjHRc4klBwgk8YSTx9SuhMefq3cqDOe45x3ez
         7NdugkOJ+qDe1Z1XhEAlDMKm1FmsCrfTTaq9H9+S9Pt7fQvZeZx0+Q7Tx4zXvolLtfWC
         gAe4JfGD9qltmu01Jk4oQMOzU7ipyN7UIc7f4Jy/kbwTcNVBOSEz4nsBULcHMp9PaoN7
         01Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756458964; x=1757063764;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GMCKh6ebU0u4Z6oifWcZMdJi/zOPW0SlqzJnGxsRIpQ=;
        b=VbOnGmenhx4PMHnMlTFG6pVIehVUPllATO25+YoWDZsg6DW0iWqs9zsACC25NtW+rS
         gLvzGj75EJY01AR7+WF/odIDDoZir39L1Vx7bIQqBWD92OpfTL6JU+ApdlP4xlfjxgO7
         1vVIF41y9licpuKHdiiFMhhIFaqtdLqEQ/+DMnOCQ684PsjyHZXLYTGCSpN9jiE33ea2
         qlFrRdcIzz5iQeOAPxZmRENiexkXBQ88NAVbr9ULgFRCX0hbKEgp/CNjBdb03WkRizvr
         JUyJ0gGlDMIPUyTXpac+2mpCpjgfrnRh/eTgStu5Ih58aoOnlAkMcw2j5SyMD0mmtfxF
         08vw==
X-Forwarded-Encrypted: i=1; AJvYcCXWuHTy/swqIK1zsQlrnqBI5nJJPNPj0ZfTTrOFbA8xn/wMHfkof08IM7RQu3gvQH4XcjC0risDGSLD0FwxaePM@lists.infradead.org
X-Gm-Message-State: AOJu0Yzrqpw0moIbSXY1PsLTGE+zhCV6Ggiesr5A0Fn7FcgOp0LBdBXK
	ilmo5D1OzHaCukEY0b/M9VM5MaTNLx04NZnEZjsPoJ4TReEuC+Dn+zoRaQk2VXKj30E=
X-Gm-Gg: ASbGncsAGcfA2KgYYObeoQOdhhL9FEWpvB6elZ7j0DzAtkIWoti/lpoOMYGMyH24hTx
	VWkIDJ1ezPPG9j3M923j53OinbGmDtxh24j1hxeyFcXVLBiclPaNV24OZdzHZ1k5OOzvAlkDXpx
	NVmiQIu2mV2QVOlJwK+Mka0vKQVGWjr3/uvvlQAnJ0spRB/e7XOd53ebRcbG1aiAM8+s6MQlC90
	oHCIH8yzj44/Aiap2hJ8PrEHwm1+l+eZLbwJ3CDWf3GEI1ht9mlrHgSsiyjw76N73PcmTL9W+BE
	/PIduzZG/yq8U0f0U8Dei9U6EpsV/EagOyQDGTmRWMf994RveIhG1jnG0sbYKzeeoRBTx2SkC57
	C57gAtuwfQ/pUqw45YI04LLzFjHdV1ZrpDOPGN1JZ6IbOE1HIF8aGJSFe3EkhyYxj+a9yHC0AT+
	KABtkzyfMltthqPygD
X-Google-Smtp-Source: AGHT+IEHgFynTh/fqQXSlnQVx/CrD8Li2R2KkbetyhBA2XZxZI4OAUkno3CLyIily5/Z/tnr+qqhWw==
X-Received: by 2002:a17:907:970c:b0:afe:ae6c:411e with SMTP id a640c23a62f3a-afeae6c4776mr1267829366b.30.1756458964378;
        Fri, 29 Aug 2025 02:16:04 -0700 (PDT)
Received: from localhost (host-79-36-0-44.retail.telecomitalia.it. [79.36.0.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afefcc1c397sm161585666b.81.2025.08.29.02.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 02:16:04 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 29 Aug 2025 11:17:58 +0200
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	linux-arm-kernel@lists.infradead.org, florian.fainelli@broadcom.com,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-gpio@vger.kernel.org,
	Jonathan Bell <jonathan@raspberrypi.com>, svarbanov@suse.de,
	linus.walleij@linaro.org, devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>, conor+dt@kernel.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jiri Slaby <jirislaby@kernel.org>, krzk+dt@kernel.org,
	Al Cooper <alcooperx@gmail.com>, linux-mmc@vger.kernel.org,
	wahrenst@gmx.net, iivanov@suse.de, mbrugger@suse.com,
	Will Deacon <will@kernel.org>, Phil Elwell <phil@raspberrypi.com>
Subject: Re: [PATCH v2 0/5] Add peripheral nodes to RaspberryPi 5 DT
Message-ID: <aLFwRrfjmq1wU8-b@apocalypse>
References: <cover.1756386531.git.andrea.porta@suse.com>
 <175641306018.2175061.15558471823903740794.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <175641306018.2175061.15558471823903740794.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_021606_139033_918280CE 
X-CRM114-Status: GOOD (  33.47  )
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

Hi Rob,

On 15:31 Thu 28 Aug     , Rob Herring (Arm) wrote:
> 
> On Thu, 28 Aug 2025 15:17:09 +0200, Andrea della Porta wrote:
> > Hi,
> > 
> > The following patches add a few peripheral DT nodes and related pin/gpio
> > nodes for Raspberry Pi 5.
> > 
> > - Patch 1: Amend the bindings to avoid DT compiler warnings.
> > 
> > - Patch 2: Adds core pinctrl nodes and defines SD pins as a first appliance
> >   for the pinctrl.
> > 
> > - Patch 3: Wires the gpio-key for power button and related gpio controller.
> > 
> > - Patch 4: Adds DT node for WiFi.
> > 
> > - Patch 5: Adds Bluetooth DT node.
> > 
> > All comments and suggestions are welcome!
> > 
> > Happy hacking!
> > Ivan and Andrea
> > 
> > 
> > CHANGES in V2:
> > 
> > --- DTS ---
> > 
> > - bcm2712.dtsi: added a proper clocks node to the uarta serial
> >   in order to replace the legacy clock-frequency property. As
> >   a result, the following patch from the previous patchset
> >   has been dropped since it's now useless:
> > 
> >   "dt-bindings: serial: Add clock-frequency property as an alternative to clocks"
> > 
> > 
> > Andrea della Porta (1):
> >   dt-bindings: mmc: Add support for capabilities to Broadcom SDHCI
> >     controller
> > 
> > Ivan T. Ivanov (4):
> >   arm64: dts: broadcom: bcm2712: Add pin controller nodes
> >   arm64: dts: broadcom: bcm2712: Add one more GPIO node
> >   arm64: dts: broadcom: bcm2712: Add second SDHCI controller node
> >   arm64: dts: broadcom: bcm2712: Add UARTA controller node
> > 
> >  .../bindings/mmc/brcm,sdhci-brcmstb.yaml      |   2 +-
> >  .../dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts  | 133 ++++++++++++++++++
> >  arch/arm64/boot/dts/broadcom/bcm2712.dtsi     |  55 ++++++++
> >  3 files changed, 189 insertions(+), 1 deletion(-)
> > 
> > --
> > 2.35.3
> > 
> > 
> > 
> 
> 
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>   pip3 install dtschema --upgrade
> 
> 
> This patch series was applied (using b4) to base:
>  Base: attempting to guess base-commit...
>  Base: tags/next-20250828 (exact match)
> 
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
> 
> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/broadcom/' for cover.1756386531.git.andrea.porta@suse.com:
> 
> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb: /soc@107c000000/pinctrl@7d504100: failed to match any schema with compatible: ['brcm,bcm2712c0-pinctrl']
> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /soc@107c000000/pinctrl@7d504100: failed to match any schema with compatible: ['brcm,bcm2712c0-pinctrl']
> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb: /soc@107c000000/pinctrl@7d510700: failed to match any schema with compatible: ['brcm,bcm2712c0-aon-pinctrl']
> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /soc@107c000000/pinctrl@7d510700: failed to match any schema with compatible: ['brcm,bcm2712c0-aon-pinctrl']
> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb: hvs@107c580000 (brcm,bcm2712-hvs): clocks: [[28, 4], [28, 16]] is too long
> 	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml#
> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hvs@107c580000 (brcm,bcm2712-hvs): clocks: [[28, 4], [28, 16]] is too long
> 	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml#
> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /soc@107c000000/pinctrl@7d504100: failed to match any schema with compatible: ['brcm,bcm2712c0-pinctrl']
> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /soc@107c000000/pinctrl@7d510700: failed to match any schema with compatible: ['brcm,bcm2712c0-aon-pinctrl']
> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hvs@107c580000 (brcm,bcm2712-hvs): clocks: [[28, 4], [28, 16]] is too long
> 	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml#
> 
>

For some reason I've dropped, from the previous cover letter, the
phrase mentioning that this patchset depends on this patchset:

https://lore.kernel.org/all/7ed0f2779829f4e63b69d8cf5cedda9f849996bc.1756372805.git.andrea.porta@suse.com/

which contains the schema. If you apply it as prerequisite, warnings
should disappear.

Many thanks,
Andrea

