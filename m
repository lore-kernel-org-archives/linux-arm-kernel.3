Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E4BCA6011
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 18:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4z66aqJo1l1YspH17oLJxoIeFufDzkwqCpOg6u8MQ6g=; b=1YbKkIgo1BDRM8EZ0aeTxMUijL
	Lz4F7i7egcMSRpRWlB07/NWStYvBl1VUplZW8sAHm8nUeaUHNCNg8YecmTeCRf8CGnxWdmmfvoVgR
	p44buEoD/nI1jiDZIpxzs80dmdNOsXOENROxkylPBFR9BiPJsbUm38MjYHwLdPokT8o5KU0LQDWXj
	gjl9Nl6yS3KfiwDzdv5sLORbFtdgNDGWdQJFx2c9l3hlfPaXaxyBJoIykWB/pTGzyqNvOspYO6JBS
	ACqu7ZBOwU5NTXiEUYFy0mbLQI4uMfqsaj51PwRe09aPBRozK5q8DMGHkvONl6wKA1yEk6AwT5wRq
	/Cm3HBCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEsY7-00000004qJ1-1JXw;
	Thu, 08 Oct 2026 18:08:59 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEsY5-00000004qIe-2cKs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 18:08:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=4z66aqJo1l1YspH17oLJxoIeFufDzkwqCpOg6u8MQ6g=; b=YndwBeLg1/XhS/cOGCFIDVErsf
	uClpxm+fDnQeNi4DJdF1+dvHOinXuPM5a0IzRMQRLdYyMqTfz0PnHJDM7egQh0mlL1TC96vkzHlkg
	KpsDYcU62MfU5vR/piMMcFM2lGQPVPKEZxAo6ewpkRaqLiklUIvEN1cq/6BlehjCoUgA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xEsXu-009fjF-Gf; Thu, 08 Oct 2026 20:08:46 +0200
Date: Thu, 8 Oct 2026 20:08:46 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
	Jason Cooper <jason@lakedaemon.net>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: mvebu: mvebu-soc-id: fix missing clk_put() on error
 path
Message-ID: <1d32e115-17c4-4bd2-9689-907ac8f324df@lunn.ch>
References: <20261008171410.2717704-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008171410.2717704-1-vulab@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_110857_668827_1F4E42DD 
X-CRM114-Status: GOOD (  12.57  )
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

On Fri, Oct 09, 2026 at 01:14:10AM +0800, Haotian Zhang wrote:
> get_soc_id_by_pci() takes a reference on the PCIe clock with
> of_clk_get_by_name(), but when clk_prepare_enable() fails it jumps to
> the clk_err label, which only drops the device node references and never
> calls clk_put(). The struct clk and the clock core reference it holds
> are leaked on that error path.

	/*
	 * If the PCIe unit is actually enabled and we have PCI
	 * support in the kernel, we intentionally do not release the
	 * reference to the clock.
...

Given this comment, you need more detail in the commit message to
explain how your change and this comment goes together.

    Andrew

---
pw-bot: cr

