Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781E6C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 06:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IiLGpE2uyMrqtwvy9R1BT98d8U7KS311154swWkBZBE=; b=X3SfqxIM7z3bTwWPFlsBcZMAVE
	DYnN5RY849ZmoUkBASQr4CqcrSmtf+vQGU1O5E08HBKymXGVpnsL4W5dfMpVwDAyDeT717ORvJvUd
	2VaMHVpxAxsTgaf9YeUl6FLsO/eCSXS4zjoMkFAInGREGuo7zHlBleklqK36X2YQBWAuhXLhGg+qt
	ORac7stpNq5T/SRHNMx4IyL0LgNfVIlDnfKtaqn5tShszSI0/z0zMJlx9y2NG9hZ27tt+LF6uPfQp
	4bhUcHxEngUD5Rn7E9m2cbFvrQB/sN9FR6thcW/jqs9mLQwu3m9WYqCGj/c0RS7AJ2hx0j76XXTM3
	sK60rzcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYfb6-00000001Zh5-36KE;
	Mon, 07 Jul 2025 06:45:04 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYfYC-00000001ZTS-16gW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 06:42:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=IiLG
	pE2uyMrqtwvy9R1BT98d8U7KS311154swWkBZBE=; b=FyAGP6pqhTWS7vDw7fmX
	dh2+VKzogPqkT8l7OQ1SW8LDBGl0c9nIu6jysu18SXB9FsJPMPzaJW8ZSogJ5CAt
	tsVx1qQ+muSk3FGUEJ6A3+jI1vwzUI3S2cI4aSzKrP64vLyAZcnl90oQKOcNHJ/D
	I2DWu8fyMtmzt44cX/vikJV29JXkajR/DGpWjWOdbYnuwqJjj1TXF7gK2SLSG0DM
	mwQ1DwVrlk4iW4W5qmJHxyacHR9cCLsY/PftOZoEqrtRZ/ngo+MwF/m53uNEni/2
	ADhtJUZKvOLguYSRG2ejY+PvgRo3kGuxXRBXRTCa/78msA45BA0exJJV63W1F6lf
	zA==
Received: (qmail 1127800 invoked from network); 7 Jul 2025 08:41:55 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Jul 2025 08:41:55 +0200
X-UD-Smtp-Session: l3s3148p1@I6XGI1E5huogAwDPXxVOAFK6vZd9m4LR
Date: Mon, 7 Jul 2025 08:41:55 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
	catalin.marinas@arm.com, will@kernel.org, mturquette@baylibre.com,
	sboyd@kernel.org, p.zabel@pengutronix.de, lizhi.hou@amd.com,
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v3 0/9] PCI: rzg3s-host: Add PCIe driver for Renesas
 RZ/G3S SoC
Message-ID: <aGtsM22QYqekuiQA@shikoro>
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_234205_149530_4CDDA092 
X-CRM114-Status: UNSURE (   6.47  )
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


> Please provide your feedback.

What is this based on? I tried v6.16-rc4 and renesas-driver/master. Or
is there a branch I could pull?


