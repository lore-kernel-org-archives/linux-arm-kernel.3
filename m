Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A42C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 22:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FYqD+8EuHNbP6ZIkLeQ20YUnJezRRXMcecWfjRiQZw0=; b=urDnZKy9EbdsGDXrbpm9mygAYQ
	Pfgc4IcKb/E6lvvWSQTXPFy2VPrhRiDDNB+bMGntYL/7yMq9utXvsfrXrWMXErk9JNhEMQhjRZ10Y
	CFB+1KqZL2Zs5ZTVtIIAHnjuUAWXuANlCzY5DcbEjrFXbm1G7AdLS6bMqvZ1uNvSg46ZaqMpwICWo
	izU5epiYxMcYrJmnhhysqVlh08GoYUZcPSMzHVLqAb8HUDqZhDOv7VOhahPa4ayUhWfaw96CQwwcU
	H5fOkrYtoU139FLXkfwO6a3uhT0J2F6URqPJyxsiboQ6EbT94TencpAHEkNTZlxB8IYWW+vvFzyFk
	iOwHkurQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Kku-0000000CgH8-2iu2;
	Thu, 17 Sep 2026 22:39:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Kks-0000000CgGw-3t12
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 22:38:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5C44D4015C;
	Thu, 17 Sep 2026 22:38:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 986F41F00893;
	Thu, 17 Sep 2026 22:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789684738;
	bh=FYqD+8EuHNbP6ZIkLeQ20YUnJezRRXMcecWfjRiQZw0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=DzwVsXoXHLMEaSwh8pkPEtTZNMxKgNsQlbsMxoVgE6nuxkw3wcNDQaK6f+HiIiWIR
	 VuedDSXpyvp/BYW+rDGHCPD7sripNpVxMuH6d63EF1h90INd98Ajq2S3kIt64SZp4C
	 QcjWZpTzIX1/K+PiEnIjwv0K3aZyl7SJy8m+xYkqj1//ac48wqkrz8Y+fOYdwk9G2H
	 mzADuqrUn/xju4AAj9rY1p/FSZ5xZcdq3upVmldTPYTgsehphCm0wthg9NZi1vjNxd
	 ZsqAiD5E+9vIz2H8d5MNFMZ/aejOTey6vbLh48rAn2we7H2OneoLeAcZ0mf5B0kkyD
	 46uX+D4jfGQkQ==
From: Srinivas Kandagatla <srini@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Doug Berger <opendmb@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Lee Jones <lee@kernel.org>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: brgl@kernel.org, driver-core@lists.linux.dev, 
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, iommu@lists.linux.dev, netdev@vger.kernel.org, 
 linux-pm@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
In-Reply-To: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
References: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 0/8] driver core: prefer
 platform_device_set_fwnode()
Message-Id: <178968473139.466806.13272492778306156816.b4-ty@kernel.org>
Date: Thu, 17 Sep 2026 23:38:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Mon, 20 Jul 2026 11:24:47 +0200, Bartosz Golaszewski wrote:
> With the final platform device and software node rework changes having
> been queued in the driver core tree, Danilo pointed out that
> platform_device_set_fwnode() is no longer used and should be removed. I
> argued that instead we should prefer it over the OF-specific
> platform_device_set_of_node().
> 
> This series converts drivers using platform_device_set_of_node() to
> platform_device_set_fwnode() and does not intend any functional change
> as the semantics of:
> 
> [...]

Applied, thanks!

[8/8] slimbus: qcom-ngd-ctrl: use platform_device_set_fwnode()
      commit: bb74fae19700fd1fa92def9daf49e6fbdea26006

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


