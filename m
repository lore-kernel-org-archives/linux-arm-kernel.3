Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F020C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 14:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ojdUxvWc7DvJBcp3kNJ9k+HiytwtVpCbZjoRrEzQMTM=; b=ZM7NiM9wjw22dZQ8QKB8VB7pt/
	DHrVOzynfWnIzV9rHjfGkcYoeyfhGzZG761s0p7CTwIOSlnfKOFwrBec9fTlX10LK+9+s+B3YXA8I
	ZIcl/azFjeQuHEoz3kUS1htcauKjX78QrrafJb1J5JcmETBUN9aAUcEWf3omVO1z5TWYYAKxs42ut
	4tpvsLB66LGZJU7dz/lUw2aUXeWZsha2skHAu0QSJQwgwmWUwQ7h59KogMlwioxMrTQqqNk3Ojw3n
	Ied1a+KMV39YeeY5irZGeh3um3AI8FMKiO/TMDSMgWjMUWfT5UufIhiLeWQqEM7yvE091eGnGK1CJ
	zZ1BcOhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsjxX-0000000Baf8-1lB1;
	Thu, 13 Mar 2025 14:54:55 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsjvs-0000000BaX8-408F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 14:53:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C3910A4756C;
	Thu, 13 Mar 2025 14:47:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4519BC4CEDD;
	Thu, 13 Mar 2025 14:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741877591;
	bh=w52BMGEb/zNW6DRdLAa5vip7+Q6bfilfvxV8/qdG/Ak=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dlk75RX4BJJymKAK8ib8Bfq9GxVJVC5iw3D4UtFdjm3m2z8Pg2Q0X5iVmpCQ0sOnh
	 uCT6cH49pKZGgqc62hABR3U7O1RQ5siUeNePNUP6Rq0fBAdTqYIriSK/ZoNx4Ai4ea
	 pXhb/F+3VhgbaATFUYtUDKS6Ma968EHvM7riUwkHra5//pnsNNS/3akhiVw7GGCOIi
	 aL+xpG5U+UgWe8c3YYiaykJg8kZhQDlU6Mxg501HsmyBYhfpBOeQaJSNZEc+Bxt5a7
	 tAzNeP3CJQrOG15HT62bQh47ak3koZanZsE9XgkKjU7/pDnDSC8NiiVpSAsfhq1/B3
	 EOlmQNs44gKaw==
From: Lee Jones <lee@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
 claudiu.beznea@tuxon.dev, mturquette@baylibre.com, sboyd@kernel.org, 
 arnd@arndb.de, Ryan.Wanner@microchip.com
Cc: dharma.b@microchip.com, mihai.sain@microchip.com, 
 romain.sioen@microchip.com, varshini.rajendran@microchip.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9656d46ee0255b9aba404d77d2d204376a9cb248.1736522006.git.Ryan.Wanner@microchip.com>
References: <cover.1736522006.git.Ryan.Wanner@microchip.com>
 <9656d46ee0255b9aba404d77d2d204376a9cb248.1736522006.git.Ryan.Wanner@microchip.com>
Subject: Re: (subset) [PATCH v6 3/3] dt-bindings: mfd:
 atmel,sama5d2-flexcom: add microchip,sama7d65-flexcom
Message-Id: <174187758697.3701280.18234838828113464973.b4-ty@kernel.org>
Date: Thu, 13 Mar 2025 14:53:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_075313_056524_835989A5 
X-CRM114-Status: UNSURE (   4.91  )
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

On Fri, 10 Jan 2025 08:25:42 -0700, Ryan.Wanner@microchip.com wrote:
> Add flexcom binding documentation for sama7d65.
> 
> Consolidated entries into one enum to match proper coding style.
> 
> 

Applied, thanks!

[3/3] dt-bindings: mfd: atmel,sama5d2-flexcom: add microchip,sama7d65-flexcom
      commit: c37ee2ed38391eef476fea6af8eccd0d31f5ed98

--
Lee Jones [李琼斯]


