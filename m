Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A863DC44514
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 09:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WsqS/RENXKBaiPcJVoqlvqE5VI6ff8i4YR1XPG/1jws=; b=ljDbh59B9f0FGwm1icAeOVOVfH
	Hi6xlYxZGetqhb7J0VqyXOarbmpHulS6FEI8CsADkcsx1u29cRyBVFjE+Yrj/WYXhit6ryuBEdzV9
	3VUO++c3FgjRDr50yTZONcBIsrPGdd3j8bEbE6ZD6U/gxVNXEOIcE+oV9JX/DsClkMHjCdFzVGmBR
	bkjZbbnqO2fCo8NvzZ1IkY8zJb0x7XLLpWWScObkCVVc0vd6uj0Kg7XsPwZp/+oyIyDABzBKdg+jX
	q2giXuouocvJ4IvSNR8Gp+6JRhmE+DevBdHpSiRAm8p6CTPDlRM2QLJZeYz1/EaaW5QuQNHAQkK0/
	Viysq0Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkehF-00000001oS9-1qu5;
	Fri, 17 Jul 2026 09:17:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkehE-00000001oRR-15cO;
	Fri, 17 Jul 2026 09:17:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B301A60204;
	Fri, 17 Jul 2026 09:17:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E19E1F000E9;
	Fri, 17 Jul 2026 09:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784279847;
	bh=WsqS/RENXKBaiPcJVoqlvqE5VI6ff8i4YR1XPG/1jws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m5HakIZ0OPmQfxWfVzz83Zk5vj5X4xylgQw5lZEic4qN12nSEtvzPt1akW7R3aG7I
	 BIDW7MNUu9XuwovXeZfEVuowJb+pmjYjaBtAwb6s9qo80wJ+e4R+D7cwCFSF5d9nMy
	 4glZQ0q2Xh4igofwJdYWFu1MiHT4nfstnSwWd1LEG/TF4Tzz3fcMmA+wk4T0d1iR6s
	 +x4V4/DBH6xRzJ+GgJOGTDa6lXoghO6AmfINorr8Emj2Vp9lvZylRbetpr8HhUZBbS
	 1tdZuHf1ZiVX+winVpJrqY0bF8ICBaN4jPHiziMBfXJH7k1B2kXXTpEratoxQorgFG
	 8nHgLbNmzWVnA==
Date: Fri, 17 Jul 2026 11:17:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Roman Vivchar <rva333@protonmail.com>
Subject: Re: [PATCH 1/7] watchdog: mtk_wdt: add explicit compatibles for SoCs
 using mt6589 fallback
Message-ID: <20260717-unbeatable-strict-heron-fd1741@quoll>
References: <20260716161923.266315-1-akkun11.open@gmail.com>
 <20260716161923.266315-2-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260716161923.266315-2-akkun11.open@gmail.com>
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

On Fri, Jul 17, 2026 at 01:19:17AM +0900, Akari Tsuyukusa wrote:
> Several SoCs currently rely on matching "mediatek,mt6589-wdt" via the
> fallback compatible. Add dedicated of_device_id entries for each of
> them so that the driver can match directly on the SoC-specific string.

This makes no sense, NAK.

Best regards,
Krzysztof


