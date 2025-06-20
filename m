Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC65C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 05:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oqhNWYJcnnLWhHm+EU+eEhxl9YLxgdkBjlZ5xMTxYGU=; b=UTnsBG2BNNAD/C7lY5zPnvXJC5
	CVVLd1gkie4Rgn0a/UmMWtP70QHo/wUPHAflryKSHdjb3CQLqWGOEz4/5Cy4yU4rp0lu+xBZAhzYZ
	lrHv4tJMQNGmkV406PL6Kx+6fQOpGvA5CDEUFe6tqqbwGphi29p46/5G8BDJPHlSIzyMNCaL+acsa
	tvY6pi6klYzdvrN8teYVjFrZykOQJ4j28g5S2R2tDHt9n3iY0pUFqgTlMcK5lFkPwGo+EIlQK06z9
	tdj8LrQt2ZGsCRf0i40ZMxdub6z43n3ybBBcuJgIwkh3HyI5tkTpepW/nffmr0R+g+bbShTzqZO4p
	7Ct4jF7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSU3j-0000000Ellq-0GVO;
	Fri, 20 Jun 2025 05:13:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSU1U-0000000Elbu-2OwJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 05:10:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 991E45C695C;
	Fri, 20 Jun 2025 05:08:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2586FC4CEED;
	Fri, 20 Jun 2025 05:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750396242;
	bh=3Owcc1dRQY1Z8F1XG3Fhvz1hyBv+3yD4Obr3vbxaSeU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AwXhW/3dW4NobnXVrDnuTj9sJWvpONnO6e13RC1b8v30Q5BZHyA5X3ixaqY+vERJb
	 nr0Zh0vWuZwid66smDuNUlz+GLmutwxaZze2SOUG5oh8nwy/AJTCVGfwt0fp72Yt9Q
	 U9MjBGLTf5narKknvYW6atYjvPurd6V4NfTaM6CU=
Date: Fri, 20 Jun 2025 07:10:39 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, Michal Simek <michal.simek@amd.com>,
	Saravana Kannan <saravanak@google.com>,
	Leon Romanovsky <leon@kernel.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH net 0/4] net: axienet: Fix deferred probe loop
Message-ID: <2025062004-sandblast-overjoyed-6fe9@gregkh>
References: <20250619200537.260017-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619200537.260017-1-sean.anderson@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_221044_652581_0E44FDB5 
X-CRM114-Status: UNSURE (   9.23  )
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

On Thu, Jun 19, 2025 at 04:05:33PM -0400, Sean Anderson wrote:
> Upon further investigation, the EPROBE_DEFER loop outlined in [1] can
> occur even without the PCS subsystem, as described in patch 4/4. The
> second patch is a general fix, and could be applied even without the
> auxdev conversion.
> 
> [1] https://lore.kernel.org/all/20250610183459.3395328-1-sean.anderson@linux.dev/

I have no idea what this summary means at all, which isn't a good start
to a patch series :(

What problem are you trying to solve?  What overall solution did you
come up with?  Who is supposed to be reviewing any of this?

totally confused,

greg k-h

