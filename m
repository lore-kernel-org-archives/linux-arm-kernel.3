Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A00C83F38
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 12:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ia9GyGbk8B9rjMX/RPITkTLboZkRzYcVoZFfzz+/9ho=; b=0jT8ARyKRLujHV8rP1emDhzWG8
	Hv5fxex/zRlCfbAVgTn4YI6rZDh3EZVczLYlARqcQtl91sgwZIz/nSHZjie4vrK52G/wNHVFoLBUs
	WY2tQb5Wmt1DkcV5qLzmqRHTWQJo3x7B7TnIXLL6O6GDIuQv42DKcfMW+GwIa4qJa56QaqRdQpD1h
	PiumRZj7jZUVCX08Qd6t8ph3hqL5hjTCZrq98HOZTSu0jx3fr0xAlxw7hk7aH8AATofhxsrGOeB7b
	yjzwQD2OlIHUZwQ8o69R9aWppqXfrRBtZ66orhIzIoEJok7MgMEBC3qpHNOsNkK5JDTIyP4JPVBln
	pxh/8wBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc1iK-00000007j2i-0FGj;
	Wed, 16 Jul 2025 12:58:24 +0000
Received: from phubs.tethera.net ([2607:5300:60:3a9d::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc1fp-00000007idH-1Pqj;
	Wed, 16 Jul 2025 12:55:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tethera.net;
 i=@tethera.net; q=dns/txt; s=2024; t=1752670540; h=from : to : cc :
 subject : in-reply-to : references : date : message-id : mime-version
 : content-type : from;
 bh=Ia9GyGbk8B9rjMX/RPITkTLboZkRzYcVoZFfzz+/9ho=;
 b=MR9kmxwYKgoB6qvgTWe3XASPi1F6c62HiYwIBJY1Dvg0Tk2YovQguaaJ7sFv+f/USkCV+
 cnyR39/CZ5fvL6Z5D52jKrP0gEQug6JbX9TK/AuKThrXmmA3EEe2V3+MUqdqukW4EkQ+C5H
 BKV4bFVRuSJQ/V8TH2/H/B0bv4LHwUMjYQchBjYu6TOQJaPnjm+I2DhXwlZGFyZotwqTyto
 otGcMWlzXuUmLOGrhs0ntxhQwsNmfo4NQ0s9a+YqSs/DN4jccWFFGyfHWtdoef6hVd5tOCJ
 fZz2v1+IitN+g9Q32K/amKtTL+C8yiEOLWmB/rqs9tFqoFTVM2fBsL6+eE+Q==
Received: from tethera.net (fctnnbsc51w-159-2-211-58.dhcp-dynamic.fibreop.nb.bellaliant.net [159.2.211.58])
	by phubs.tethera.net (Postfix) with ESMTPS id 9AD4118006D;
	Wed, 16 Jul 2025 09:55:39 -0300 (ADT)
Received: (nullmailer pid 2675178 invoked by uid 1000);
	Wed, 16 Jul 2025 12:55:39 -0000
From: David Bremner <david@tethera.net>
To: Niklas Cassel <nks@flawful.org>
Cc: wilfred.opensource@gmail.com, alistair@alistair23.me, bhelgaas@google.com, cassel@kernel.org, dlemoal@kernel.org, heiko@sntech.de, kw@linux.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, linux-rockchip@lists.infradead.org, lpieralisi@kernel.org, mani@kernel.org, p.zabel@pengutronix.de, robh@kernel.org, wilfred.mallawa@wdc.com, Shawn Lin <shawn.lin@rock-chips.com>
Subject: Re: [PATCH v3] PCI: dw-rockchip: Add support for slot reset on link
 down event
In-Reply-To: <aHSs6ZF8rQIqEOyR@flawful.org>
References: <20250509-b4-pci_dwc_reset_support-v3-1-37e96b4692e7@wdc.com>
 <87cya6wdhc.fsf@tethera.net> <aHSs6ZF8rQIqEOyR@flawful.org>
Date: Wed, 16 Jul 2025 09:55:39 -0300
Message-ID: <87zfd41eic.fsf@tethera.net>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_055549_569169_CC1536AA 
X-CRM114-Status: GOOD (  11.49  )
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

Niklas Cassel <nks@flawful.org> writes:


> That said, if you have problems with suspend/resume, perhaps you want to
> try this patch instead:
> https://lore.kernel.org/linux-pci/1744940759-23823-1-git-send-email-shawn.lin@rock-chips.com/
>
> I don't know if Shawn intends to send a new version or not.

Thanks for the suggestion. In fact the hardware vendor (mnt research)
ships a version of this patch with a 6.15.x kernel. An updated version
would be helpful, as the previous version(s) no longer apply (with git
am). Failing that I can have a go at manually rebasing the patch.

d

