Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 837FDF33A8E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 15:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dcj0ejoSnW/5eblQMFtU+6rnCGFUr5a/VkoxkVgkFIU=; b=20UkPsQK9NsAIObRBBW9SpjH9A
	NEHSPhzn0Z7LX7D6MemG3NuBtNVmuxbmQUboJrlY8jGJs9fQx4CuFwDUMSpavFYq0yMDyqWFwurRE
	8+uTlqMBrsJSl/G2VVOf40fbZeQ84LZFc7IkSzTrd/Lig4gb/S7C2+npJxMfn/GAdkUJtQDv+9WGk
	Vk0q2LShizvOfUAtt93ZPpy336Ndi6orkn9hY9vVH2qSFFXZVSSuy4grGDqvGTiyJOy0UMkA43KEo
	rBYrEc9mF/25Q7ecJvd68BWCRSjMNG2/K/zyYg/h0UsPUdqdAyEIBmuOCX/7rFapKCTtNJGasmazk
	6YjkxlDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyAUb-000000026X7-026T;
	Thu, 05 Mar 2026 15:20:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyAUZ-000000026Vz-13VH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 15:20:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BE0C44072B;
	Thu,  5 Mar 2026 15:19:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E616BC116C6;
	Thu,  5 Mar 2026 15:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772723997;
	bh=fiPz7wtqOY5BeMkxwRsGcfzBJ/wpg9ehDqfpzlZwBLQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cy/zFlEmHAifNQfbSTWPYDYipTTH6trB82Oy0edkNFgF3YpPGscbwDmMl6vOh2a1o
	 cpLko/5dWTKLyg07VjmS9LvqLoqnVHOa10DVNy56/V8v9skgkhMOnmKQiBd13OF6ka
	 /p85yoP6L6p3fmrqnArS85XXxfzOKNwC6EDHgH+oBU82lczxgd0IXLvSjUnlBq/k+l
	 +YQNjeZKi1l1nUxwuU4utBs0zt/8j5Bey0RfbuahW3/7fg8yk9OFdVfa18aPtLZbkr
	 f0hmeSriiIJz++KYt3Q7i1jDkiLdKpJbo3FOMMZWy/DCGjGDbww8vzd28fbZQEWa+C
	 u0XPYXxW/UvsA==
Date: Thu, 5 Mar 2026 07:19:56 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Chen-Yu Tsai <wens@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, Samuel Holland
 <samuel@sholland.org>
Subject: Re: [PATCH net-next v2 1/8] net: stmmac: mdio: convert MDC clock
 divisor selection to tables
Message-ID: <20260305071956.08d49615@kernel.org>
In-Reply-To: <aaly2p34HoJAIJbx@shell.armlinux.org.uk>
References: <aald--qJquWGIvmO@shell.armlinux.org.uk>
	<E1vy69y-0000000Btwd-3oq7@rmk-PC.armlinux.org.uk>
	<aaly2p34HoJAIJbx@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_071959_311389_E153B9FB 
X-CRM114-Status: GOOD (  12.13  )
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

On Thu, 5 Mar 2026 12:11:06 +0000 Russell King (Oracle) wrote:
> On Thu, Mar 05, 2026 at 10:42:26AM +0000, Russell King (Oracle) wrote:
> > Convert the MDC clock divisor selection to tabular format.
> > 
> > Note that there is a change for 300MHz, but this is not a problem,
> > as the MDC clock remains within the useable ranges, which are:  
> 
> I notice that checkpatch complains about "useable", which it should
> not do. "useable" is perfectly correct, especially in British English.
> As I'm British, I won't be fixing this checkpatch complaint.

Yesterday it reported a warning that someone repeated the word 'very'.
As in "this is very very wrong". checkpatch, eh? gold.

