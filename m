Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B86CAC593
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 11:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EuC+XvIL/H1RcGvLTnb3E3XHeL2xCveiM1F3iSWb7A0=; b=E24rIdvVogzZwxEYd0kCgnXp1+
	BWjLyNu+XfhuzW/+xYhKD2n//T6GIv3AuP99ioBZu96ofZfXR0mxVOgAmkEEH18wXM3maWv6wEwba
	Q/B7Iz1XZuCEHNu1c7ErMIz0ofkUjyd8snTMHDVj6EaDZ04H99pZELShryi57QAynjpTeqCF/HUSF
	9lGH4J3kQVPgjBOXJnCuZY69L66El3B3TxldO+5KhNmu3MLUuHJdm+FYqtlMM7PVtqHc6d+bdB38G
	viqAWewyU1n2VdWTRM9Lbw3UGqbC1LVGDxSZOIQuExLk5FLrI5qmxeDwj7KkYaixaDA6DKQdRJdRr
	u0tmdCyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6yo-00000003pQ7-1saF;
	Mon, 15 Sep 2025 11:02:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6yl-00000003pOK-42p5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 11:02:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9975444714;
	Mon, 15 Sep 2025 11:02:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3162AC4CEF1;
	Mon, 15 Sep 2025 11:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757934159;
	bh=NuAPghNBbEeMoQfj/KDPyEmoT7CNKEs46PUUsk73Hxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sf81PQ1US69vWJJL6Gp2AQ2dASB+blYHnLKq2DXxAnO9p2xk/km516ZQhePj0wG+e
	 3C+EDslmHIlL3TihkcrL3gmA0bAHyAizd/ZhCVT6nIULkHhEVZIY0VamT4F5deB66j
	 lFOrSV5d+knmwiwJEvy8Uv/rWoSA5hGkgS+HSUzihVE0ssIHG5IVahlmoM9zu2algM
	 CWh3f9TjqS+j5KDUxG2EJ8JoWtQWbmrZ6BvjBa3855KpKaXlSDudQD1qiQJajd3U7G
	 FSGQj+JlzFV25rRBdDYXr7BHACeJuru4PgRBLdRhdRTAR4scwOKhbsUWrJcZVI3WWY
	 1EbltiwzcZW9Q==
Date: Mon, 15 Sep 2025 12:02:34 +0100
From: Simon Horman <horms@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH net-next v6 0/6] net: stmmac: Add support for Allwinner
 A523 GMAC200
Message-ID: <20250915110234.GT224143@horms.kernel.org>
References: <20250913101349.3932677-1-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250913101349.3932677-1-wens@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_040240_022572_B5429307 
X-CRM114-Status: UNSURE (   9.89  )
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

On Sat, Sep 13, 2025 at 06:13:43PM +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
> 
> Hi everyone,
> 
> This is v6 of my Allwinner A523 GMAC200 support series.

Hi,

Unfortunately this series does not apply cleanly to net-next.
So, after waiting for review, please rebase and repost.

Thanks!

-- 
pw-bot: changes-requested

