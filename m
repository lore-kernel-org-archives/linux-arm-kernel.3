Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00BFAC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 16:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7CW4v4AoHa6ABcgvmCbVdRqCmm5FyrKaem/pFda21aQ=; b=2VvRGGbAqwXK9MLlpKFcDZgm9e
	lSXXavr+jKXHa/GrNoJ5264G9+QSfG1AQVPOopsbLX0IET+m1tawrl/I2zktqg0zgOa6LS5mltXOH
	qqvpt6L7sL3VFHkiSvhSCgyJp80b1QrsFteNRL11GrdKMEBAruqlEFWMsXq67cXx9TCfE9WhMoVkX
	mEKSbq9iRyocRzQ84FneZrtvv23twNhJFhliAJyP7YeIhXSDdouZy1W4/KHpTaINOdU5khfcq0K+i
	6ssS685KdKvC4hjje3Bok7s6T/qsafaN3ud+z6KlYcSktQBaWiIPiIpj9lIh1VJO7ytpjZPfYfDCe
	iaTY1niQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkQMX-00000008wY0-2aQ5;
	Tue, 18 Feb 2025 16:22:21 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkQGi-00000008v3r-4426
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 16:16:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=7CW4v4AoHa6ABcgvmCbVdRqCmm5FyrKaem/pFda21aQ=; b=Q+/BuoE+1urhxGFcvtl35FVsxq
	S6wbn84edysVF5aBP5POmy5hFKja8DXTSGp0ryQrLMhEF+LaPD3lf3JAtrn89xZCWuP7i2vnQHmVz
	RbZO0rMdpIDeE8JpcQTYEWqOADi0Ecjwn77kqHQg9NsCpHNBsRd1PaimO6xJIRvm8pB8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tkQGV-00FLaL-3P; Tue, 18 Feb 2025 17:16:07 +0100
Date: Tue, 18 Feb 2025 17:16:07 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: "Gupta, Suraj" <Suraj.Gupta2@amd.com>,
	"Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	"Simek, Michal" <michal.simek@amd.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Eric Dumazet <edumazet@google.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>
Subject: Re: [PATCH net-next] net: xilinx: axienet: Implement BQL
Message-ID: <da67b82c-1068-41c8-93d6-df0e7b009e4a@lunn.ch>
References: <20250214211252.2615573-1-sean.anderson@linux.dev>
 <BL3PR12MB6571A18DA9E284A301FF70FAC9F92@BL3PR12MB6571.namprd12.prod.outlook.com>
 <aa58373c-a4ac-4994-821b-40574e19be3d@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa58373c-a4ac-4994-821b-40574e19be3d@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_081621_010982_C9CDEF2B 
X-CRM114-Status: UNSURE (   7.98  )
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

> > Could you please check if BQL can be implemented for DMAengine flow?
> 
> I can have a look, but TBH I do not test the dma engine configuration since it is
> so much slower.

It might actually benefit more from BQL if it is slower?

	Andrew

