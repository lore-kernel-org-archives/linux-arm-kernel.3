Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD88F53D9A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 20:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jJBFredQsBgmgmGTs858Z5BT7TRaBr9kz7LPGRKIpA4=; b=kbHhdvIdslMfGMHnwXQYJz7c13
	PgqRNqHPj1qEQV6zYZngizrVx4/TsJ3P0+102J3ILW882KBZuM/84jSfFS49S7OK7m0Ct6QLq6Eiy
	AgYzN5m0fWviyn3DL2DDR8WzZCpXhNPLdmfNrrWRP0Ty/fpzs1bqrs9E9l6Aa2P8urEeWctq4DtF6
	7zpdUvJ7KypRfWRs6dMPnXpzyHhOQmH92dAJ8TtxX1odZjD6CYdTUFtzsdST7aXK0NBpeEy/A5Sla
	s+hzRppIV0MhbRuOcSrdiiS7n0p/xBmR/6bykLexM6FE01GbKfOpG/cTIpOOSAEyXezoTSqkozyTm
	J+xeUSpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Er7-00000004q6i-0SB9;
	Mon, 16 Mar 2026 20:48:05 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.205])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Er4-00000004q6B-1lYb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 20:48:03 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 576B8C0007E1;
	Mon, 16 Mar 2026 13:48:01 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 576B8C0007E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1773694081;
	bh=hD6lC6A6buBaBVdEubbBxEn5jOKzo+sgoFWiTATvXr8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xni5rtDNv08f/HukhkX2c6FgEh8zKJDQy6MSurqvVSxa4C2K8lu/xzQ6LLhhHep9D
	 QTCB//qczPF9yeYv6lspWp8uk449oNVrY9PBoS9UbxLdO+J2yn/u9/FROWvKE+mxv5
	 dT5bpPq508bcOsjJhVHaJS4D/EThuK5FJOUlU4NQ=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id EC7F1A83;
	Mon, 16 Mar 2026 13:48:00 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Linus Walleij <linusw@kernel.org>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <rafal@milecki.pl>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/7] ARM: dts: bcm6878: Fix PL081 DMA block IRQ
Date: Mon, 16 Mar 2026 13:48:00 -0700
Message-ID: <20260316204800.2145851-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218-bcmbca-i2c-dts-v2-1-5373ef82c50c@kernel.org>
References: <20260218-bcmbca-i2c-dts-v2-0-5373ef82c50c@kernel.org> <20260218-bcmbca-i2c-dts-v2-1-5373ef82c50c@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_134802_530058_A0F54971 
X-CRM114-Status: UNSURE (   8.29  )
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

On Wed, 18 Feb 2026 10:30:48 +0100, Linus Walleij <linusw@kernel.org> wrote:
> SPI_TABLE_OFFSET_2 is 96 in 6878.  96+30 = 126.
> Convert back dtsi SPI interrupt 126 - 32 = 94
> 
> Reviewed-by: William Zhang <william.zhang@broadcom.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

