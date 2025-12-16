Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54BC2D5B161
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 06:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4uJzsh/7B5SBq4huKfJ24GYK5+66IuujLDlaWSU9v70=; b=O/f3K5qC/6K+K+ipLEOM/bxkKs
	stxOs5aqcDV0uc6lk9a7R6GkFkRWUUs1MwU+JdPvE2+TVwUwZx3qHo3E2Ylz5cHfReadXyXtUh74b
	NVCbWSdmMUlT5fmOjRX8XvhhPB/DsfJJOIr3ZwGstddVhidYl6ap3KcRcEvgPDl5gj1m3NWWdTJ8S
	ai3mPCxDJBI8zHomUHbWvPYsIbk4QwVaNq0bNcJ3VRq8XU7QRnp8TBTgUdps/6F+EDKcaOJ4lBJnS
	rUf5nQSrT+qu55Ow6Zf3/USoeS4ELXnH30WpLNV1DTDDnyZ5Kzxdn/G5hG4kvqYJ+h5aFIzsH9FCw
	n1B8OB9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVOUt-00000004mgd-2uaV;
	Tue, 16 Dec 2025 06:25:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVOUs-00000004mgX-124o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 06:25:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E8DF96013F;
	Tue, 16 Dec 2025 06:25:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DEA4C4CEF1;
	Tue, 16 Dec 2025 06:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765866320;
	bh=jURSggc8h5Auoce5njAyzjWeWLT5P7bncC7/J9uqAIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X6eKLQbs299j6gqCWs0N6kliERfyOLEJYBLj9OjmQWO8xApvcW1nMZW7qSPX9qF2t
	 Gpl8+hGXqMt3pkh0mxh/9/e+v5GKe7qILvY7jujhVhdrTJDI8QDBp0e/zterdp/Au8
	 XZ7GtBVJr8c33wkRJEmNk/pxUSM36yPE5/+e39YE+pIdIRqyd21KJxjfieF+Y++vHu
	 KLfdXaj1r+PVuSxADZZpJczinr4nWQOZ+dlCe4/iSsOeGsEGzNAhDqs8PQKwxUNDQl
	 N6x9LzTfvBVbI4qDrV+33hthxDs4imD+uGJ+ksRIC7z2GVq/u54ScozuMvWeVf9khP
	 3sP/tTAuG7i4A==
Date: Tue, 16 Dec 2025 07:25:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	=?utf-8?B?SsOpcsOpbWll?= Dautheribes <jeremie.dautheribes@bootlin.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 1/8] dt-bindings: vendor-prefixes: Add AAEON vendor prefix
Message-ID: <20251216-tricky-masterful-wildcat-1efbd5@quoll>
References: <20251212-dev-b4-aaeon-mcu-driver-v1-0-6bd65bc8ef12@bootlin.com>
 <20251212-dev-b4-aaeon-mcu-driver-v1-1-6bd65bc8ef12@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251212-dev-b4-aaeon-mcu-driver-v1-1-6bd65bc8ef12@bootlin.com>
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

On Fri, Dec 12, 2025 at 08:41:04AM +0100, Thomas Perrot (Schneider Electric) wrote:
> Add the AAEON vendor prefix to support the AAEON SRG-IMX8PL MCU driver
> devicetree bindings.
> 
> Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


