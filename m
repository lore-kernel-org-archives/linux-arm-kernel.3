Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB8B6079043
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 16:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WgeoeryY;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hd1iJO17
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4hSSmxRQOYQLc9X1LIBh+NOmGHv/RzthQxE33huemtQ=; b=WgeoeryYP7GgfPP3LTLB2lm6WB
	cvNs8no8sn9JJg9G5Zhyl8azl1Kvmu/sm+tGoSmVD6tj52ZDGgCYMU4TDy7hZvC3dzWnIPUfkVOcn
	TBRp9T9PDfsHDDF88F4qKu8p/4MB8wl2cdr+8inYkODCcNq5CkiBk+F/LVx/vCpM3xqqfKPRsUj3i
	DM7auZU5jEUfqXxHfgPMS/GtJ25h9uXoEgSiSjy4fxVGyV0c3IT8LHo0yCsGYjgMPDlQYy7fFPoqh
	+SYE8ZDVFkCa/esNAElPyX/1JM4O2n+fy/6uZXUD7BcKXr5knuH8YsRgdMZEit+mH0Q3RjDxIoEbL
	fsW13BBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvHQ-0000000HLMj-0GVT;
	Mon, 02 Nov 2026 16:53:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvHO-0000000HLLy-3YsL;
	Mon, 02 Nov 2026 16:53:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 075CC60134;
	Mon,  2 Nov 2026 16:53:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C2421F00A1D;
	Mon,  2 Nov 2026 16:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793638385;
	bh=4hSSmxRQOYQLc9X1LIBh+NOmGHv/RzthQxE33huemtQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hd1iJO17zYx5UbfD1AhdqZ0MOToj3xpVgH9dJStKut9idV8JWyc1ZpdH0d8UtMuD3
	 8mjxtC+Wq5QGHqs/r1p2+7cFiFoWTNXb0nNE3Lh/FYOZ98Z/hfCC9lFRgSpgMyqLF3
	 t9Oyvu70FzchK/LPHyEmXnhjQqa/MyDp8OOx79xK4NZVyTE6YykGqVeyLisI2VrlfK
	 Vr5danEHRYbxmSDW1IUajEX5QjqRCoW0SQzXMNtD3r87C4jbVzJRWXX5KfPBDQQQgW
	 QDMreyeCPukHqU0TXae1qzbsoLU+2vwFEiCBes8iWrL+ePfuyLaVc1LBJz2lvbRf9Q
	 0M8cieXD54jEA==
Date: Mon, 2 Nov 2026 17:52:59 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	"open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" <linux-ide@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:BROADCOM IPROC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>
Subject: Re: [PATCH v4 0/6] Fix SATA support for NSP SoCs
Message-ID: <aui_68Kxlpr7zdyn@ryzen>
References: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Florian,

On Thu, Oct 29, 2026 at 02:25:07PM -0700, Florian Fainelli wrote:
> This patch series fixes SATA on the Northstar Plus (BCM58xxx/8831x)
> which was broken due to a number of things:
> 
> - the SATA PHY assumed separate PCB windows when a shared one is used
>   for this generation of SoCs
> - the clock/reset (IDM) was not being configured by the driver which
>   meant that depending upon what the boot loader did, or did not, we
>   could have had the AHCI controller still in reset by then
> - on some reference boards, the AHCI controller is not DMA coherent,
>   assuming so leads to all sorts of timeouts, data corruption, etc.
> 
> Since this touches several subsystems: DT, PHY, AHCI and DTS, I would be
> keen on having Damien merge all of those via his tree if acceptable by
> the DT and PHY maintainers, I am OK either way for Broadcom SoC.

Patch 2 (after we get an R-b from DT maintainers) and patch 3 can go via
libata tree, but the normal way would be for phy changes to go via PHY
tree and device tree changes usually go via arm-soc (and lately it seems
to go via a broadcom specific tree first).


Kind regards,
Niklas

