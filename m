Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7461EC43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 20:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nZg/W7O3xMrPOVncSfqHtuO2PvBNacKXPKLTL7Ha6Q0=; b=tfocK9Ho6yd8bipODA27WZXk20
	ijv52HSDqlAJUvWctpZIm/sWR05B70tywed5XYu1VWN1aLqpdEKKJcoQ72inL/Q7k6NC0j50dpAf9
	zD5VGpTUoRNlhxDPui/rpXfMO14/k4yJXrg2OWXFc3+l82G2HhQivFF07qoZzMgtaefKpqSgyZMCp
	mZbLde6xCNifEYxIFPM/IfCBQNU2WcBLDOU6cL1/IBcz3zN/nQQ9IlpxvO0DgYaM9OZ9ZFq0/MPBs
	KX6R3kfZGnG8M1E9Lu50EeGln0GbIQ2ChMW8eHdKlJ4y1wkiAccgf3MY4Rb1QZi9zIlhYJiVK7GI/
	FGlnd4CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weISA-0000000FQdF-154W;
	Mon, 29 Jun 2026 20:19:38 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weIS6-0000000FQbM-3YkC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 20:19:37 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2c9b42be8feso20740795ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 13:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782764373; x=1783369173; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZg/W7O3xMrPOVncSfqHtuO2PvBNacKXPKLTL7Ha6Q0=;
        b=aVwUy0q/g6JkmdalFhaNttbITIwUb0EwBjoEURF95B603WGOuaF26xE8Fp/hixu++6
         wrqYYP4Jb1mo9KRwLlhkGbD/XLyNkFi5A8vX+8BcG+3s9VslTGI/rd1+jqjax62TeQtd
         ZEA0x2/HaW7pGAub+ro+XZdOTVRoigSMS9vTJO2Tfpmi84XxKTv9nY9NrypTREaQirtd
         GDWQPc/lleVdQ1VRZDjVSdcE9ZME7Us5qr3naIvTiEn8oQjWigcRpWKDb6bVH0+uVLQx
         0qRdZlcT/mPd7tm6+VugB4Hf7G3gHVCQtloN2vKZZj099iKheJd1vhlC39J2G4j/bYap
         ys0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782764373; x=1783369173;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nZg/W7O3xMrPOVncSfqHtuO2PvBNacKXPKLTL7Ha6Q0=;
        b=LVzL0aTRyriu4gbyvrNo8uTaf7TUeudUqAlt8xbIGWQ4fRHZN8306d1v/2suxKQcwJ
         q5nJfgP86OIPxOLxHaLLfZATNq3Wuvp4ujLrSZc0U49HoCiwjHq7C1pGNU4YXlTrvqOl
         9rwaXeO5fxY195vm9xTPP8qNs3vFUQkCsvdkk6a1vCFDnSBMYgl+yOQ31EBCgWxsZc1W
         Yjyx88mquIeSkxpp73chJzlmlAAN2zK3NGg32nuqyGspcMm3qAn5PqtkiEEYQ7yaP7kE
         7TSesVw6tcC3rmnd0PGWhsumzTxGZJz/Tx6CeG8vHMbaJt2tlgmYQtWLYn3VMzw8SAyl
         T8pg==
X-Forwarded-Encrypted: i=1; AHgh+RoPQ25p7A+mYF47kxIdRwEYkiLfV3ypOBpE/F1qcRq/KmNTBUBYoTK6J9FFiSuLRdRSxRszwqkc9J4R4u6SG9sB@lists.infradead.org
X-Gm-Message-State: AOJu0YxTwCpxd1tNkURe+p8Nsxf4PD1l3W3Ji7v6MsOWWnjbxWryVmpH
	FlsFavgVwFhTHOYcDWCPIoJqPXXa87ruGZWceazPvAUZjjSGDbcIiIw69Q+UKkmdy5c=
X-Gm-Gg: AfdE7cmyL2uJjc7gG4ZaMhIW1DyLKAuptzMePNHP6lq/NZRKbYhI0fucIu7ZwB360sS
	28gZMOSAa9+Qtuil0TmcicLMo49E6HMYXibmz2DHWCkaBdN1oyQQO5MbU3Iecps90gdhk4gkY8b
	EnWYPxr7Ib+NFe+TCGubCJFGnknDSdymEMcWOH2l5RawpTX30niViVeHLqyxHkR72ljJ6/KhKGx
	oHWEG5EzetviNXUbq66UaqrBXhkyc7KgzNUw8WFZ66i377rVU/7AYd25dwoNGfkpggKcCd7e34F
	nTiDuBtzqte/LJMB6v6QAptylqskYuZKmENAR7r+zblt+/WAVSYPkyvO82I2GC9VwQmqzn7E6cc
	AXY6vR+XHX0xhSWOgQeCVdo4UgfDfF/9LLoYQhWTLpn2WqThdBMLRImMeFpaHdLbhV+oev4i3Xq
	jvFEbKvKxcgw==
X-Received: by 2002:a17:903:1c2:b0:2c9:e86e:aa0a with SMTP id d9443c01a7336-2ca2d3d202emr6219205ad.0.1782764373360;
        Mon, 29 Jun 2026 13:19:33 -0700 (PDT)
Received: from localhost ([71.212.202.210])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2ca37c908e7sm102735ad.35.2026.06.29.13.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 13:19:32 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-omap@vger.kernel.org
In-Reply-To: <20260608-n-dt-bindings-simple-bus-syscon-v3-0-4eba9ec1212a@oss.qualcomm.com>
References: <20260608-n-dt-bindings-simple-bus-syscon-v3-0-4eba9ec1212a@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/3] dt-bindings: mfd: syscon: Tighten
 checks
Message-Id: <178276437217.1055800.1836973932721840283.b4-ty@b4>
Date: Mon, 29 Jun 2026 13:19:32 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_131934_898935_9EBA5D0A 
X-CRM114-Status: UNSURE (   9.60  )
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


On Mon, 08 Jun 2026 22:44:23 +0200, Krzysztof Kozlowski wrote:
> Changes in v3:
> - Drop patch #2:
>   dt-bindings: mfd: syscon: Drop unneeded case for syscon + simple-mfd
> - Bump dtschema requirement
> - Link to v2: https://patch.msgid.link/20260608-n-dt-bindings-simple-bus-syscon-v2-0-0203e6c249dc@oss.qualcomm.com
> 
> Changes in v2:
> 1. New patches #2 and #3
> 1. Add missing part of patch #1, thus not adding Rob's Ack.
> https://lore.kernel.org/all/20260531110404.12768-3-krzysztof.kozlowski@oss.qualcomm.com/
> 
> [...]

Applied, thanks!

[3/3] ARM: dts: ti: Add specific compatibles for SCM conf nodes
      commit: 68f994ec51e279e63c8fc40c1bfa8add4b708111

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>


