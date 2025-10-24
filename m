Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1459ECCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 23:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v696+d7bEKIHP2KzhVvsY2xM2Oejqt840Bj3nBovTiM=; b=rjHEy3WkLhqlir/gGANqys9IgA
	fREWQu6P8DLwlCEjWlBbu4jab3h8iswjZUQSofzMFPxBPftGz0k0d41yujj8SnnfyWLwBolMM5Agr
	ekErXilzuLeWr6wmwjs8qxuk6s1pPUjT7ccSNctuP69pItaeF6Yt4Qg9SoRPJwikQmPEc2DJowsNo
	xVqq1AENRRaEQ4Sd44lZF+Xr6EEwwGu2NLhfBGyhHu5agud/VdHlc5UVRCnpb5Ar5pNcdAGimgjW8
	JdKopknj1HhwS4OQjwKrUvL8UAHAxDu6cuZYQ0yxvnWP0WXf6BbvxgyWYqaEYbgANMYM7X9Q5g8h4
	FBUoviwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCQww-0000000AdGo-3BoD;
	Fri, 24 Oct 2025 23:11:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCQwv-0000000AdGR-3k9e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 23:11:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 00E4A601A7;
	Fri, 24 Oct 2025 23:11:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72E58C4CEF1;
	Fri, 24 Oct 2025 23:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761347516;
	bh=F1LhiwGp0x3wM8SAKbj7UnEIjjud2a8/8+rDH/aYbsk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vMc8uwQa2ZrwjDbFF6Ktnl5l6b3YVFOifLfJacDlgvv45EyGN3Y6vPdMmdK2BrXsK
	 TiBckurBINKotx8ovqoOOPI0fnqJVuVhO8YOdPW8TSaySjdDMzuWxcuc7wNk/kVPsA
	 5N/yiuZvGf9TKL4dFHeNX0PtjsF+lZKSi+uU0JkK5LwpUGassFriVhIqO8Sp42MLdR
	 X03nJP9dqgLarDzc4Mh3tXRP3Eb7pU2YqiYW+ig73LkP9XGIhABgXfL9+6rWojAguE
	 OwAL6gnIeuecSfwRAT3vMeZjGTVJE5/x/RjVcBdJNTSV2vOjIDb8Xk7ILwlgo/qJdu
	 mbg0SpRIpe76w==
Date: Fri, 24 Oct 2025 18:11:54 -0500
From: Rob Herring <robh@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	"jk@codeconstruct.com.au" <jk@codeconstruct.com.au>,
	Kevin Chen <kevin_chen@aspeedtech.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>
Subject: Re: [PATCH v5 1/3] dt-bindings: interrupt-controller:
 aspeed,ast2700: Add support for INTC hierarchy
Message-ID: <20251024231154.GA2962687-robh@kernel.org>
References: <20251022065507.1152071-1-ryan_chen@aspeedtech.com>
 <20251022065507.1152071-2-ryan_chen@aspeedtech.com>
 <20251022135101.GA3349934-robh@kernel.org>
 <TY2PPF5CB9A1BE674594566C13B8D8B2984F2F0A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY2PPF5CB9A1BE674594566C13B8D8B2984F2F0A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
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

On Thu, Oct 23, 2025 at 06:57:01AM +0000, Ryan Chen wrote:
> Hello Rob.
> 	Thank you for your detailed review and comments.
> 
> > Subject: Re: [PATCH v5 1/3] dt-bindings: interrupt-controller: aspeed,ast2700:
> > Add support for INTC hierarchy
> > 
> > On Wed, Oct 22, 2025 at 02:55:05PM +0800, Ryan Chen wrote:
> > > AST2700 contains two-level interrupt controllers (INTC0 and INTC1),
> > > each with its own register space and handling different sets of
> > > peripherals.
> > 
> > This is a mess!
> > 
> > How does this relate to the existing "aspeed,ast2700-intc-ic"? Its schema has a
> > block diagram of connections which I can understand. This does not.
> > 
> > The use of child nodes here is questionable. A variable number of interrupt
> > banks is not a reason to have child nodes. I'm only guessing that's what's
> > happening here because you haven't explained it.
> 
> Let me clarify the hardware structure and the purpose of these bindings.
> 
> The AST2700 SoC includes two top-level interrupt controller modules,
> INTC0 and INTC1. (aspeed,ast2700-intc0, aspeed,ast2700-intc1)
> Each of them provides routing selection and register protection
> features.
> Within each INTCx block, there are multiple sub-blocks called
> intc-ic, each handling multi-interrupt sources.
> ("aspeed,ast2700-intc0-ic", "aspeed,ast2700-intc1-ic")
> 
> Cascading occurs between the child banks:
> Level 1 : intc0-ic have multi-interrupts connect to GIC (root)
> Level 2 : multi Intc1-ic# connect to intc0-ic
> The parent intc0/1 nodes expose register regions for routing and
> protection control, serving as containers for their intc-ic children.

Being a 2nd vs. 3rd level interrupt controller is not a reason for 
different compatibles. The programming model is obviously the same for 
both as you essentially have 0 driver changes. Having N banks of 32 
interrupts vs. 1 bank of 32 interrupts is not a reason to have multiple 
intcN-ic nodes. That is a very common difference between instances of 
the same interrupt controller such as the GIC.

What you need to do is simply extend your driver to support N banks of 
32 interrupts. That's what almost every other irqchip driver with more 
than 32 interrupts does. If you are lucky, then the offset to each 
bank's registers is just hwirq/32 * <bank stride> and the number of 
banks can be calculated from the length of 'reg'. If you are not 
lucky, then you could put 1 'reg' entry for each bank.

AFAICT, the existing binding in aspeed,ast2700-intc.yaml should work for 
you.

> 
> The following simplified diagram shows the hierarchy:
> 
> 
>                                  +----------+       +----------+
>                                  |  intc0   |       |  intc1   |
> - - - - - - - - - - - - - - - - -+---- -----+- -  - +------ - -+
>   +-----------------------+      |          |       |          |
>   | +-------+ +---------+ |      |          |       |          |
>   | |       | |         | |      |          |       |          |
>   | |  PSP  +-+ GIC     | |      |          |       |          |
>   | |       | |         | |      |          |       |          |
>   | +-------+ |         | |      |          |       |          |
>   |           |         | |      +----------+       |          |
>   |           | 192~201 <-|------+          <-------+ intc1-ic |
>   |           +---------+ |      |          |       |          |
>   +-----------------------+      | intc0-ic <-------+ intc1-ic |
>                                  |          |       |          |
>                                  | 			<-------+ intc1-ic |
>                                  +----------+		  .....

You already match on intc0 and handle 32 interrupts. Now you are adding 
intc0-ic to match on and handling the same 32 interrupts?

Rob

