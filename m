Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B65CC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 12:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QmQTgHnNfk/YJQVz70Z46dnEeEGmjtdUuR03pGN2Bwc=; b=iquAFz0/u6D2RwNlTT3o3gYr4I
	FzPqe+9Dy4XFeTAMrwK1lCgjLe5t+RPScO334upV7z+QtgZbDqVCKZJ6H75Tz9K4b+YgYn8rIPxCv
	+g3ZEi5WnjYOekaKkJqBA7yDwvb83EgB5/hjmC/d0HzGuOMmpvpinStoUsdHgP1AgLe7iNYB6SZdk
	NFLar2mSMVkhz4SM483sjIbe3JkP7TpPV3L/ZB1mHPsNWGyZfhjZPMFGVCXveh0fn5QoWAU/OaBt4
	qL6uJ9INxo1XXS3tDI7/1ISlvC8nF1xJ6e1dDTJR6kD3odTfd5KzSJwySz0afaQ7ewfQRGQQyTqx/
	+aMVgoaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvFT0-0000000CA6Z-3D1Z;
	Thu, 20 Mar 2025 12:57:46 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvFPJ-0000000C9R3-0lHL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 12:53:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 95CD9A49413;
	Thu, 20 Mar 2025 12:48:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADDDBC4CEDD;
	Thu, 20 Mar 2025 12:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742475235;
	bh=qz7MeaPR8fOUUQcZ6yj6cjFnFISOPaxEsa/PQ0ftEok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OSEaEyweNzA4Glaku9/kxFiZYPTRlTzqNWNKbcpiVt/T0M7WrzFY/xXDcutG7k5+u
	 uHHjzBC581oQo4wIvbP1SEszyEzB1856/ZDv9NriIotrP4CF5GrlZ5psV42voERfr4
	 Ry42mOocCkwIBXO99fp9JpMdoSBFOglm9n4ZYiuyu08kYdyzcSgWv5nYUXfvl9JAim
	 6/o3gNfm+Nd/BuOtWDP54RdRLSi9n08t5BY+Dq2+Zpj2mxxcRQozAOFtFHLDBKiSdz
	 2+5DGh2sJPOchXiUFxqv97zueJDS01w781OpmO9C61jXvCcvhi0cXCJ3Krgz7gGHGJ
	 vgccg7ifdK5XQ==
Date: Thu, 20 Mar 2025 12:53:49 +0000
From: Simon Horman <horms@kernel.org>
To: Meghana Malladi <m-malladi@ti.com>
Cc: pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
	davem@davemloft.net, andrew+netdev@lunn.ch, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kory.maincent@bootlin.com,
	javier.carrasco.cruz@gmail.com, diogo.ivo@siemens.com,
	jacob.e.keller@intel.com, john.fastabend@gmail.com, hawk@kernel.org,
	daniel@iogearbox.net, ast@kernel.org, srk@ti.com,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Roger Quadros <rogerq@kernel.org>, danishanwar@ti.com
Subject: Re: [PATCH net-next 1/3] net: ti: prueth: Fix kernel warning while
 bringing down network interface
Message-ID: <20250320125349.GN280585@kernel.org>
References: <20250317101551.1005706-1-m-malladi@ti.com>
 <20250317101551.1005706-2-m-malladi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317101551.1005706-2-m-malladi@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_055357_285090_89CFC51C 
X-CRM114-Status: GOOD (  13.48  )
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

On Mon, Mar 17, 2025 at 03:45:48PM +0530, Meghana Malladi wrote:
> During network interface initialization, the NIC driver needs to register
> its Rx queue with the XDP, to ensure the incoming XDP buffer carries a
> pointer reference to this info and is stored inside xdp_rxq_info.
> 
> While this struct isn't tied to XDP prog, if there are any changes in
> Rx queue, the NIC driver needs to stop the Rx queue by unregistering
> with XDP before purging and reallocating memory. Drop page_pool destroy
> during Rx channel reset and this is already handled by XDP during
> xdp_rxq_info_unreg (Rx queue unregister), failing to do will cause the
> following warning:
> 
> [  271.494611] ------------[ cut here ]------------
> [  271.494629] WARNING: CPU: 0 PID: 2453 at /net/core/page_pool.c:1108 0xffff8000808d5f60

I think it would be nice to include a bit more of the stack trace here.

> 
> Fixes: 46eeb90f03e0 ("net: ti: icssg-prueth: Use page_pool API for RX buffer allocation")
> Signed-off-by: Meghana Malladi <m-malladi@ti.com>

It is a shame that we now have more asymmetry regarding
the allocation of the pool and unwind on error prueth_prepare_rx_chan().

But if I see things correctly the freeing of the pool via
xdp_rxq_info_unreg() is unconditional. And with that in mind
I agree the approach taken by this patch makes sense.

Reviewed-by: Simon Horman <horms@kernel.org>

...

