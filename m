Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E496070269
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 14:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pWGaCNud;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RRc7hiqh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7vvpFbZYF9+EatWYsfyFZjmAL4FqwomgWuTi5Yv6hUQ=; b=pWGaCNudMpdj92phaN0gckV4UB
	2xsoO8sjab07veG/YKn4s1wCjEUp48QuXpOp53Cst3/1X91r+pngxooQEMmDvw1uQbVUlOQvJsZ/E
	N1kj6FtecE8nmoUW6ygF5qdR3TgL0x08xEN+7MvKPURuVQDzwKbpnux8HP/2y0yE8P1C5pd9UguxR
	X+70cqQ3dBGmXqeZvfqkezORUIi9Ix9XBm7FRs+KzUy5NgTtgV/n5zAtiw/Obe+g5euDyY2crvRBc
	WgJ1wLfkDKd/Zl+izBtQOOo3/DnRO2o8ocF6QmcXc1x9H7lLAH7gAOQf3VsPojZHow0wm7VUH30wd
	fUtIGexw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNtHx-0000000GsTW-0lEG;
	Mon, 02 Nov 2026 14:45:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNtHv-0000000GsT9-0cQ2;
	Mon, 02 Nov 2026 14:45:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5EE7B60DB6;
	Mon,  2 Nov 2026 14:45:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3F941F00A17;
	Mon,  2 Nov 2026 14:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793630730;
	bh=7vvpFbZYF9+EatWYsfyFZjmAL4FqwomgWuTi5Yv6hUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RRc7hiqh8QxgBfGnCpjQ5GfLpfJtDbKNTp+S4f+jcYs7aKQiRNt9MyudWdPg9LdF/
	 CgK/Uf9/QQ7mQPSEuMOQXZpDnm4qmmB9cFdu9oFO9wG9Yz6h/4c9hrCW/Hm0J4wjmr
	 kt9kt04KeskZOiY5LXXuA+Hswy+8RdLEH6NxfObkfCJ3RIv7PiTf8wz2Jpaewt3qpp
	 XwG/JJaDdNNYTzoUyiy933ZYLCcSomZIA8Y//PfbGbjkflR7U+FtN3nY3l/4gyNhp8
	 HHTL6fyK+sV7pO2GZ+ri+AqgqNOEN6fxlTNBnXp0gPh1N+xI/f5SA5BjHikgpMB9r0
	 uu0DfftDuebIA==
Date: Mon, 2 Nov 2026 08:45:26 -0600
From: Rob Herring <robh@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	"open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 2/9] dt-bindings: phy: bcm-ns-usb3-phy: Describe the NSP
 variant
Message-ID: <20261102144526.GD1232511-robh@kernel.org>
References: <20261021172819.668120-1-florian.fainelli@broadcom.com>
 <20261021172819.668120-3-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021172819.668120-3-florian.fainelli@broadcom.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 10:28:11AM -0700, Florian Fainelli wrote:
> Northstar Plus uses the Northstar Bx PHY register sequence but also
> requires coordinated USB2 and USB3 core resets and a USB2 IDM interface
> clock enable.
> 
> Add an NSP compatible with a required USB2 DMP phandle. Describe the
> shared PHY relationship with EHCI, OHCI and xHCI so initialization
> finishes before any host starts operating.
> 
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
>  .../bindings/phy/bcm-ns-usb3-phy.yaml         | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

