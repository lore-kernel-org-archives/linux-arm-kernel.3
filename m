Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FAC9CD3442
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 16:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7GjT8jvwulPqP8B31j4N+jS1twNrmu/SOUTc9Uxtl5o=; b=aTgwPf3GGKPgYdKttLKxRkqzVQ
	oZ81W/QZDqCr9clKWzNaW3nWchaFP3uCk9D+WyeSA6+fbFZQe47Q8uB+b4xlQ2fu8BGZxVj9QbLNy
	F4umqya+TBtazEMP5clkGftLeqBI+kHDyszPI0wJ5zxaoZgGiJwXrrIu8w6TUOAZGteVQMIPlp+x5
	koitznSazxMmtndXc+8j6ZYZniuEpBQWMlDFA0RdhAJwpNrmlu+aOZTUcl2A7i1NgtuPsV/cVSWE4
	kyczjtBGIReJ0nU/WWUgUkc4hhTxYcWxpedzZx+4med9Zh3UWRbfeWjWrCuwRf9CK03KZTwQgUy1E
	3n/8i5Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL1Im-00000004IJP-0zT1;
	Thu, 07 May 2026 16:10:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL1Ik-00000004IJH-3NMK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 16:10:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 427D060252;
	Thu,  7 May 2026 16:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32DA5C2BCB2;
	Thu,  7 May 2026 16:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778170214;
	bh=fxwf3I7h7jhgXQ9lw8NOcAt3++3EMEiDRO+U9K4nGPQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uCuMcWr9E0ZYLfq7TWoM2JB4UuCJ5bmGDp0CgS8YV6u1Fu0kGSIeqXuQ+gVHco7Yh
	 zCswGy+R6KX6gxhvA1t8Q7c59bspjQE2GEETMR7FN9xMOXyqgfD3OTEhn7WRAikeFz
	 EC7RaHAG3XRcRMCf5VuwHJUTYism9BYK94Jdwit95i01F0BVQWJuLqjVQYFr1n5sZl
	 B5TkDpQz9BHM0Rpo0gR0IfFVcdnBI4NiLJkMnsg56gBUZmpKy6vAARBhOvfFNlgMhu
	 dEw12El0DxT3k8NKYtbojeCWFp/dpFPqO8zc7d/ijxCMyDylN6kGvHu9xwpqrRTQFE
	 EFbSf7FyaNXpg==
Date: Thu, 7 May 2026 09:10:12 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Steen Hegelund <Steen.Hegelund@microchip.com>,
 <UNGLinuxDriver@microchip.com>, "Sebastian Andrzej Siewior"
 <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, Steven
 Rostedt <rostedt@goodmis.org>, Bjarni Jonasson
 <bjarni.jonasson@microchip.com>, Lars Povlsen <lars.povlsen@microchip.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, <kees@kernel.org>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-rt-devel@lists.linux.dev>,
 Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net v2 0/4] net: sparx5: misc fixes for sparx5 and
 lan969x
Message-ID: <20260507091012.7eeb17f5@kernel.org>
In-Reply-To: <20260506-misc-fixes-sparx5-lan969x-v2-0-fb236aa96908@microchip.com>
References: <20260506-misc-fixes-sparx5-lan969x-v2-0-fb236aa96908@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 6 May 2026 09:25:35 +0200 Daniel Machon wrote:
>       net: sparx5: fix wrong chip ids for TSN SKUs
>       net: sparx5: configure serdes for 1000BASE-X in sparx5_port_init()

Let me grab these two already. patch 1 I think needs more work,
patch 2 is probably fine but maybe we should address the sashiko
issue in the same series

