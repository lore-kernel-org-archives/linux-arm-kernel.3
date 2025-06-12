Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F097C71149
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OayAwQmqUS5xBnpKlsPtHcH+ut8P7sLkCqxdrNplYgE=; b=FP2p2S9P88podJy9PpdPNcGoMv
	2FatrEywhu+dU7llOqm8a/PKvXMIiGc+fHDn0lUbwSTgl3hUG7hAngcvuGKjx32du38+soLofjUlu
	5BRW/k/fuSzK00xL74dOMpPNpWNf9lm7tHxU9wJZVjnmRPhtanx01Et3VHuszX7GFu6G5XjAVCQAO
	wgEowLONmiuvg1uqYQUx0S5w5vt/wwkDZ6RJ38oe1NofJbNtunLIPHuI7vUJLLljhZUzIBqB/GmoT
	URut2gTzUuL6DLvegRrlQF/eBNp6/uGxGPuobYJfGauOUEP1fIClsQHznylUdfb+yIkFFW2G5k+Fz
	gdQ1F1Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnpO-0000000EHIw-0Bp3;
	Thu, 12 Jun 2025 19:43:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPj3H-0000000Ddro-0RkS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 14:37:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5E78B62A05;
	Thu, 12 Jun 2025 14:37:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83BB4C4CEEE;
	Thu, 12 Jun 2025 14:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749739030;
	bh=XjylmrRqZ48JZY8HZ5z1esy1sYe5LmPYknndof2mkwE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lAS5Z+Yk6ujy0mqVXbxU0MD8zqK3f11QGtQgLaObOTArWWNB6dz0YpeYoEuTRnS/B
	 aajjVn9I2j73wiyftslTWJRwYx+zQiGOZ7OtLSpvL014ktvQazBM6JG/M3EntCtfLX
	 bke+zAqp1zvE4R2qA3POsn5fxdNetskS9JEay7lcfGingJwuy3jR6ERYfB+f7vWhuE
	 2rbqcPLc7m4uDwSB2UlrVTdW9463736wVNOQS+TZZs1luDKaaLCd1Kmb+SZw1WDRe2
	 4+oKzAe4sVBNdOWp+JiC2Z20Q0ELDBMB0WyJgjU2d2hX0fT7Vf4nQ3wk+ud7Tq3HEB
	 r5hq2OHQcTTgw==
Date: Thu, 12 Jun 2025 07:37:08 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: MD Danish Anwar <danishanwar@ti.com>
Cc: Meghana Malladi <m-malladi@ti.com>, Paolo Abeni <pabeni@redhat.com>,
 Eric Dumazet <edumazet@google.com>, "David S. Miller"
 <davem@davemloft.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Roger Quadros <rogerq@kernel.org>
Subject: Re: [PATCH net-next] net: ti: icssg-prueth: Read firmware-names
 from device tree
Message-ID: <20250612073708.69902ffc@kernel.org>
In-Reply-To: <03555d09-e506-4f48-a073-b06b63e1af4a@ti.com>
References: <20250610052501.3444441-1-danishanwar@ti.com>
	<20250611170211.7398b083@kernel.org>
	<03555d09-e506-4f48-a073-b06b63e1af4a@ti.com>
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

On Thu, 12 Jun 2025 10:49:17 +0530 MD Danish Anwar wrote:
> > You seem to be deleting the old constants. Is there no need to keep
> > backward compatibility with DT blobs which don't have the firmware-name
> > properties ?  
> 
> ICSSG-PRUETH driver is only supported by AM65x and AM64x and both the
> DTs have the firmware name property. So I don't think there is any need
> to maintain the older hard coded values.
> 
> AM65x -
> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/tree/arch/arm64/boot/dts/ti/k3-am654-icssg2.dtso#n28:~:text=pru2_1%3E%2C%20%3C%26rtu2_1%3E%2C%20%3C%26tx_pru2_1%3E%3B-,firmware%2Dname,-%3D%20%22ti%2Dpruss/am65x
> 
> AM64x -
> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/tree/arch/arm64/boot/dts/ti/k3-am642-evm.dts#:~:text=tx_pru1_1%3E%3B-,firmware%2Dname,-%3D%20%22ti%2Dpruss
> 
> Let me know if this is okay.

IDK much about embedded but what you say sounds convincing to me :)
Just also add that paragraph to the commit msg? (without the links)

