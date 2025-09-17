Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CAE6CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 01:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kPcYVN/bdj4IAsOc2wtOoTywOlIcugnZO98J5M8IzPg=; b=EZHso0DkNAvI2axxcx0ZX0HRFU
	deGooKdkQMY2oTIheidHk7b1imALG172NRazlTPd7r9X9a57oD0MB2rUpjX0a+ttnatm1Rz41xgDn
	/qc+kMWYNMjcAxDQKP/y7njzZ7P5cZwZ5pgsDyUePDVp8XuGOcp1nWN8NutOuinmiRdB/ESALf5AO
	yfwUiar8hp3pBGP+geVQc9pF6MdjfRyxJxawM1E6/XoDTSKNLWJIo7pszjxoFkMuHUvSpS5Op/11l
	NgjDLViFsmJEGJcnkZNtiw0dyj5jm+28R+fBthq8jg8eMtRn14kBxsHc6VULw4eqdgFEg0g/KtQyU
	qrYx3dTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uygX5-00000009mRh-0tUK;
	Wed, 17 Sep 2025 01:00:27 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uygX2-00000009mRM-1glD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 01:00:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1758070822;
	bh=kPcYVN/bdj4IAsOc2wtOoTywOlIcugnZO98J5M8IzPg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=kit1a2J7OpKqINcCyhtqpEkjNPspQe0QOwfTIt3cnWsRBM0Z6bkiByAs5lTFy4yOl
	 jdhbbVke58ds1NvIYBtljzY6o64gXE/r6XUIB4c6KrMbQQ2fJqBMEApFsPC5CQqyyV
	 xaw+8O4jlmznaFgL1/A1IrL1WCIi1LumdLGHboTGVV5qtNLGigxKejX9HzmHn89vxD
	 sjfViM6+lAkrql/m7IrQvBED6sFGuZrauJ9FPgc72Q4zNiZKVc+v5N2x4NB9DlewGO
	 B9mOrlF/vyTg3ofG3J1+ITkzLEUnaI9jjs/r1fg/ih8GDLFa1KEpTEoaNjXHeWzoA0
	 L67cOlWzEMtAQ==
Received: from [127.0.1.1] (unknown [120.20.76.56])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id BCCFC6F070;
	Wed, 17 Sep 2025 09:00:17 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: patrick@stwcx.xyz, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Zane Li <Zane_Li@wiwynn.com>
Cc: Zane Li <zane_li@wiwynn.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
In-Reply-To: <20250916034036.348247-1-Zane_Li@wiwynn.com>
References: <20250916034036.348247-1-Zane_Li@wiwynn.com>
Subject: Re: [PATCH v1 1/1] ARM: dts: aspeed: yosemite4: allocate ramoops
 for kernel panic
Message-Id: <175807081736.540394.10309376848327644681.b4-ty@codeconstruct.com.au>
Date: Wed, 17 Sep 2025 10:30:17 +0930
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_180024_637122_2D6BB9BE 
X-CRM114-Status: UNSURE (   7.91  )
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

On Tue, 16 Sep 2025 11:40:35 +0800, Zane Li wrote:
> Reserve a ramoops memory region in the Yosemite4 device tree so that
> kernel panic logs can be preserved across reboots. This helps with
> post-mortem debugging and crash analysis.
> 
> 

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


