Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A5FCAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 20:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=glOE5dMfucj+qnBmBQgUz3G1w2LwhX5scC5okr2TCTA=; b=a1xzYZRD0PcVIl8U60pS2Jf49/
	boNWw6zQnWhRgheU09mhL7NDP9Y6HxploiqqKXS5VHeR0XlnC0mW9CmM/OXlOpaOxhrCEUomjkAoo
	lc9wAMC4d+L/fJnf2PDFhBDnGl9/poZZxfrmpguj3iq0CrZnDLD2S2d+jjoKJX73S/DzLcEwqUQug
	LApOH3O5oYCnkqCwMK6liJGk73IxdkstjMTCRXTzkO8rpsfnrTfa9e0f1NdkqU3q+WwkDR1HUzp8M
	xBoBUvYjXus8IuJ/iXJgtv120nf8vb5/fvcucKEVlqIOwlIonNEAoY+ri+hsvzYDXm/ock0kH/itw
	mmU/eMUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzi6m-000000041Hr-2Wxz;
	Fri, 19 Sep 2025 20:53:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzi6l-000000041HU-43BT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 20:53:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 141E260145;
	Fri, 19 Sep 2025 20:53:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97ABEC4CEF0;
	Fri, 19 Sep 2025 20:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758315210;
	bh=E1ZV+UNqR3veyxuHfX6mAzdM+m+4EnKUxmuyWi+TK24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cADIhg/49suBO/uC2IsFh0Z7L+funFZc48pMScM7SuZh2dhesxomGab/EsnPO8bdD
	 BeF+aZ1x7wBm0wJcNgRvxBhY+NZIzza1GoorjrVhGAnu0KMJU8BsAQTn7ZnrZ8cy/v
	 k2nEtYObhwAaQKGRaorlKhok+oho/mDNS94ZwHXxz3NqaOQv76rzs2SThvkFERpMSD
	 agfFoSpllXKFRxQBQ5PmodugBYh6s0bt/MmWq0QpygbEpo+3JczH8bcI0ASmFpVxk8
	 R2li5Bcz9H3VLWwBtpbG2PRrkEbZGjHH0SJa2xd1wasFzPTmaDC+Mvw8qZWv/QYP0y
	 Fwj2Hwaj1icUw==
Date: Fri, 19 Sep 2025 15:53:29 -0500
From: Rob Herring <robh@kernel.org>
To: Jeremy Kerr <jk@codeconstruct.com.au>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
	"benh@kernel.crashing.org" <benh@kernel.crashing.org>,
	"joel@jms.id.au" <joel@jms.id.au>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"naresh.solanki@9elements.com" <naresh.solanki@9elements.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v18 1/3] dt-bindings: i2c: aspeed,i2c.yaml: add
 transfer-mode and global-regs properties and update example
Message-ID: <20250919205329.GA2192084-robh@kernel.org>
References: <20250820051832.3605405-1-ryan_chen@aspeedtech.com>
 <20250820051832.3605405-2-ryan_chen@aspeedtech.com>
 <9d6660f0bf5119cedee824cf764f15838622833a.camel@codeconstruct.com.au>
 <OS8PR06MB7541C0D6696FC754D944D45EF208A@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <03abda47219b8b0b476a3740c7ed2acc4b2b16dc.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03abda47219b8b0b476a3740c7ed2acc4b2b16dc.camel@codeconstruct.com.au>
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

On Mon, Sep 15, 2025 at 11:41:31AM +0800, Jeremy Kerr wrote:
> Hi Ryan,
> 
> > > OK, but the ast2400 and ast2500 I2C peripherals - which this binding also
> > > describes - do not have that facility. Given the 2600 is a distinct peripheral (as
> > > discussed on the v16 series), this would seem to warrant a distinct binding.
> > > 
> > > Should this be split out into an ast2600-specific binding, to reflect that it is
> > > different hardware? The reference to the global registers and transfer modes
> > > would then be added only to the ast2600-i2c-bus binding.
> > 
> > I agree it would be cleaner to split out a new binding file specifically for AST2600,
> > for example: `aspeed,ast2600-i2c.yaml`
> > But also I think `aspeed,i2cv2.yaml` more better name, that compatible will 
> > support next generation such like AST2700 .....
> 
> The ship may have already sailed on that one, as you already have the
> existing compatible string describing existing hardware.
> 
> I would assume that the compatible string should be fixed for an
> instance of the specific hardware, but the DT maintainers may be able to
> provide some input/precedence on changing an existing binding, if
> necessary.
> 
> If this does get changed, I would expect that you would need a
> corresponding update in the old driver too.
> 
> Or, another option may be to keep the current generation ("v2 core with
> compat registers") as-is (ie., at ast2600-i2c-bus), and introduce a new
> string for the next - where the primary hardware change might be the
> removal of compat registers, but it's still new hardware

About the only place we use version numbers (without regret) is when the 
version can be traced back to the actual verilog. This is typically only 
IP targeted to FPGAs. The reality in SoCs is h/w designers can't help 
themselves to not change things. In reality, there are almost always 
some changes.

Rob

