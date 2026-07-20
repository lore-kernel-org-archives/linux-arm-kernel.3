Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBD8C4452A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 13:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QhC99x7vdLxugeCtGkIpVFaFlhQmyHyfood4QTosfNY=; b=0cTZUjJh2Y7u5/bHx/TRkJzTlO
	PjgNGXI4tABjHXwtAIcs4ocV04od3SmiOxZq+R/G48V50XfS6BQVNz6P47fTkJy7YV81VEtudPIqw
	3poU8HQfZHWc25ko7duujImz3irOEb3NIAifg+dva3Y4Pv0TMnjF0DpK5dZIXs250snfqmY/jiRbT
	weKhFbySrt7HRAu11MAFNe1vKmKE4sUKRbjdoc0cgF67sxmnnwaUysE5tyteu1c34PQN/u1aAnBMp
	RZ+SYRjIx04P+pbBCBL9o9wIJVWmwkjwFzdeQ4i+zP/Yd4HipOXHkDJn3W5w2bQ13MjlWVEY/u3g6
	JigUfQkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnrz-00000006m1k-195E;
	Mon, 20 Jul 2026 13:17:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnry-00000006m1J-1q7Q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 13:17:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D114B41957;
	Mon, 20 Jul 2026 13:17:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00AE71F000E9;
	Mon, 20 Jul 2026 13:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784553437;
	bh=QhC99x7vdLxugeCtGkIpVFaFlhQmyHyfood4QTosfNY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Ekx0qK/Srb8oSP2eKbdTYsBPRyxMt/d9O3yjxos43A26fm14PVGfA99xc1oFaUNRH
	 t33/CXj4ytIGGRt26MnPn2GM3yH32lCmh3J0EUkGbmryEjN4mrgRsZ1tpDtOEQz8Hy
	 4QxR55IuxVkS02SgFKDZ0WSYhYKgc5DcDIqZdxqSMJFZQdRInsuvu+Bgit/wx0OEby
	 YB/2d3xzxjXnYSDAahvKQRQ3ewu3NupVczdRvQXI6TDe7ApQsF5top5L4+CsQ8icyg
	 SD8vyge5RQ40E6ems95LfxdFijgsxt98ytN7q+tX8TcxRtqAt0KzwtjH+5GJDO/VvS
	 85f/TrAelG57A==
From: Manivannan Sadhasivam <mani@kernel.org>
To: bhelgaas@google.com, "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>, 
 Jacky Chou <jacky_chou@aspeedtech.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, linux-aspeed@lists.ozlabs.org, 
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260708095814.385480-1-jirislaby@kernel.org>
References: <20260708095814.385480-1-jirislaby@kernel.org>
Subject: Re: [PATCH] PCI: aspeed: Switch to irq_domain_create_linear()
Message-Id: <178455343360.25926.10984869704341739230.b4-ty@b4>
Date: Mon, 20 Jul 2026 15:17:13 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2
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


On Wed, 08 Jul 2026 11:58:14 +0200, Jiri Slaby (SUSE) wrote:
> irq_domain_add_linear() is going away as being obsolete now. Switch to
> the preferred irq_domain_create_linear(). That differs in the first
> parameter: It takes more generic struct fwnode_handle instead of struct
> device_node. Therefore, of_fwnode_handle() is added around the
> parameter.
> 
> Note some of the users can likely use dev->fwnode directly instead of
> indirect of_fwnode_handle(dev->of_node). But dev->fwnode is not
> guaranteed to be set for all, so this has to be investigated on case to
> case basis (by people who can actually test with the HW).
> 
> [...]

Applied, thanks!

[1/1] PCI: aspeed: Switch to irq_domain_create_linear()
      commit: f944349dcbaeaa9d6e1c8f2f8182f5560ba79581

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



