Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84851C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 12:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xflSa0hR/PENfTIOp0gqa3rilFj0JKDkxLJsuqmvYRo=; b=12oyMtgqMJA0rODUm8yHRITL1U
	mleigIbAZWccIpLr7UDf46C72VmoJhkobpu5yEH3LolRlUZXeFH6si7fHmkoLD+8KI7hIqQO1PyZ1
	swoNESbR/8GG4sYPCDHvhXvaXsug2imXRk1H8UQCC8D9+puRtWiqYvisv37BaWaKdeWfVbBXbEFgX
	fNxkdtHCMpj7M4W5Tt15kxXgkZ6i4NAoMKxzelSiNO/kACLrYX655vB0XRKzsG5nIuMAKgFwOW1ww
	YBJEwa04mHBWL705Rdlg8z9i0Kfr4hJxPBKi2y0/5zMDsr96Y+ykYd3cfdeomWMIFaM+yCMixFDZS
	CbrPuFSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvFUf-0000000CAJQ-1mry;
	Thu, 20 Mar 2025 12:59:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvFPb-0000000C9Sf-2Smn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 12:54:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C17465C68AA;
	Thu, 20 Mar 2025 12:51:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 734EBC4CEDD;
	Thu, 20 Mar 2025 12:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742475254;
	bh=vxV+a/fLmjjCRymtdhQarF9ezoeGwerQqeFxyUA3row=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mshW1Y1mUUWzSAYHX9v4UeBiVBN7iJ+TcNCV6wFNs7ezLg1Su9nsxvJML07ynWPyS
	 7bBrvZaRYZaffw1osYjlU28JPszJOQD7uAno0Z4FDSCn2Gn2M7f28MfKhgAMz9kvU2
	 X5Z00tR5QE4aPdzX8QFqr2DnTkYUs0X5pf48SfxX9yGRx8HFoLPDH8tsZ+HRZiHTlm
	 BspfnzdRWUxEdCj2w4ie9gD9KSkqD77LBZuHVsqF3FdyHMOYqdlC+sTROuhWo9ba+A
	 glkEgWE98+ENvZ7R1gFGQLaklueQud518AhZutgCB0C+v+djPuXQTGlWT/hgf8wIoz
	 9MAaLVz7SAOVg==
Date: Thu, 20 Mar 2025 12:54:08 +0000
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
Subject: Re: [PATCH net-next 2/3] net: ti: prueth: Fix possible NULL pointer
 dereference inside emac_xmit_xdp_frame()
Message-ID: <20250320125408.GO280585@kernel.org>
References: <20250317101551.1005706-1-m-malladi@ti.com>
 <20250317101551.1005706-3-m-malladi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317101551.1005706-3-m-malladi@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_055415_680228_EF044D47 
X-CRM114-Status: GOOD (  11.34  )
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

On Mon, Mar 17, 2025 at 03:45:49PM +0530, Meghana Malladi wrote:
> There is an error check inside emac_xmit_xdp_frame() function which
> is called when the driver wants to transmit XDP frame, to check if
> the allocated tx descriptor is NULL, if true to exit and return
> ICSSG_XDP_CONSUMED implying failure in transmission.
> 
> In this case trying to free a descriptor which is NULL will result
> in kernel crash due to NULL pointer dereference. Fix this error handling
> and increase netdev tx_dropped stats in the caller of this function
> if the function returns ICSSG_XDP_CONSUMED.
> 
> Fixes: 62aa3246f462 ("net: ti: icssg-prueth: Add XDP support")
> Signed-off-by: Meghana Malladi <m-malladi@ti.com>

Reviewed-by: Simon Horman <horms@kernel.org>


