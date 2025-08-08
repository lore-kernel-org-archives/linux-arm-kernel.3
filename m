Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD804C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 16:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E4xQuR94392QCxvnSW1P0K7raTMOcs34B/Ow/dpfiGc=; b=M79s5h6RPmgXvObWFk7IR6sKsY
	gIEwZvE9CY4H8KUsgQHOztIPA24DRXjnS9uoKv1LQF5aUtFJr53q4f8CjqOCBtX2Ihxyac2g20rxA
	vH7S3A1kW9Ww5uaE/SQR9AKBicko0R55JnTj5MptR/PFsfFiYoQ3EebIJq5nmqdux3Kh0RNZeIk3Z
	W/kKy0BgyJALhqnbYG8MmXT+OU2zYnpnmYPYWv5fg1ubA3zWNQrMlapARM6AMEvjzkpiQ3pyjBGzH
	zVT2febZ0Vk3oUwxozfkiggqM7ZhdIiWISYil/zVZMGUU509FBGPklWQfXerUbZLl0XMnDBrMGMWx
	5cDnQcIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukPcL-00000003Hml-2sPE;
	Fri, 08 Aug 2025 16:06:53 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.207])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukPZm-00000003HbD-2Hmr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 16:04:16 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id BB0E1C001508;
	Fri,  8 Aug 2025 09:04:12 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com BB0E1C001508
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1754669052;
	bh=+eOVY9tUPincYEWSfvcp/AyQSua0qXQ8IOjEUh+Rg4Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d4vRw/7KEV9m9DKdBdDoeE2Bv66WwyGKM459lsGpI1ElJ9I46Wpc89SL2CctgqSiq
	 qr5HALG5Kj8dUa8PB1WfXsGAs35S6Ol+IU8dpDTbz8i2DqUhJvrx0GTqX2dOxHFNmc
	 RW2aAY7SmNTpr55seLp5IEJxJnIMsok8srzM8bYs=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 49AE71800051E;
	Fri,  8 Aug 2025 09:04:12 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Taishi Shimizu <s.taishi14142@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Rafal Milecki <zajec5@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: bcm: Add support for Buffalo WXR-1750DHP
Date: Fri,  8 Aug 2025 09:04:11 -0700
Message-ID: <20250808160411.40391-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250713071826.726682-2-s.taishi14142@gmail.com>
References: <20250713071826.726682-1-s.taishi14142@gmail.com> <20250713071826.726682-2-s.taishi14142@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_090414_678193_8E7D918A 
X-CRM114-Status: UNSURE (   8.69  )
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

From: Florian Fainelli <f.fainelli@gmail.com>

On Sun, 13 Jul 2025 16:18:24 +0900, Taishi Shimizu <s.taishi14142@gmail.com> wrote:
> Add Buffalo WXR-1750DHP under BCM4708 based boards.
> 
> Signed-off-by: Taishi Shimizu <s.taishi14142@gmail.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

