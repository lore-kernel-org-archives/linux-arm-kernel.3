Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A742BC44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 17:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mZZOF6F/+6qbNKDZNrs6o2rZDEXs+kob5JewkcsaTMI=; b=QHE/bMbRB/2zQ4+watdNICyO85
	0W6w8ka2cUqLY4cXtajqHt1QAK1gpnieNReBvAxZie80ytH0gTj1b72yAbO+YArUAh3ksBEdNfYfe
	e9TYg15S4O7uY5KHGoRfQCrqoi6W/TZPbMd+DJGHdpAKKM8QnMrIyx72drxbzy2XWtZKMtE+k0dEB
	SpeOu4lI1C57X+JMOH+82aFeClOBNRHZL2GrUx5HcCt8t+xT+suRYUzfs4XzOiEbV2Sk4ZAdKykHW
	pqeopFDEHVuNggbXtuXz0Zbvr3StZhyhYVWALqtnLMUCLVR7f/CfaBlaIFskUCHB+WUA4bVoZWaET
	tcK73c8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrMV-00000007Skj-2GtX;
	Mon, 20 Jul 2026 17:01:03 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrMS-00000007SjM-2pJA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 17:01:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B260D4E40E81;
	Mon, 20 Jul 2026 17:00:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7C80260360;
	Mon, 20 Jul 2026 17:00:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2CC2111BD0382;
	Mon, 20 Jul 2026 19:00:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784566857; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=mZZOF6F/+6qbNKDZNrs6o2rZDEXs+kob5JewkcsaTMI=;
	b=NO3JayVdQ3CLT/6I5bhNFXPmsyyk3gjtLO74861rznSjjAiL0jbKD4m/9c7UTOuXhyAZIE
	hK/5x73D6QSBO6KzbYGfA8N2DK7QfB3w0lUQaN293kooZPGiZwXbqtSsOuOm0b/2gdyxe5
	uoIfaTD8Y7wFX5SCHtuKQrQjcTq+1VykLD3I+wGic9mG0oGlfuOiV4pgz2WvJJABCwuE7i
	fiRRx9Mq54xB5lnICoVgjRkZ+SYxwhArSIUOW8i5Hx2K2DiXxVsaKuEx+80N3eA+Yb8DZz
	9FlCpISUFqqIZ+0NJrAH3crNikvFUwc3QiLr1vU1wpoqTvn1YUpNxlpOMtKdaw==
Date: Mon, 20 Jul 2026 19:00:52 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Jan Kotas <jank@cadence.com>,
	Michal Simek <michal.simek@amd.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Frank Li <Frank.Li@nxp.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Swark Yang <syang@axiado.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-i3c@lists.infradead.org,
	linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: (subset) [PATCH v3 4/8] dt-bindings: i3c: cdns: add Axiado
 AX3005 I3C variant
Message-ID: <178456684519.97914.11616437803490580349.b4-ty@b4>
References: <20260716-upstream-axiado-ax3005-upstream-v3-4-c429095143ec@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716-upstream-axiado-ax3005-upstream-v3-4-c429095143ec@axiado.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_100100_850887_2BEFA43E 
X-CRM114-Status: UNSURE (   7.11  )
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

On Thu, 16 Jul 2026 20:51:11 -0700, Swark Yang wrote:
> Add binding for Axiado AX3005 I3C master. So far, no changes
> are known, so it can fall back to the cdns,i3c-master compatible.

Applied, thanks!

[4/8] dt-bindings: i3c: cdns: add Axiado AX3005 I3C variant
      https://git.kernel.org/i3c/c/0dbcbd4c0b7a

Best regards,

