Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1655E6F079
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 11:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GoXV5/kZyFMZVald6kwaeihI+dlbH8TvOiyZEmCCauc=; b=mVCpeB48drYiU7E46Am4/DooVR
	VRVnZqYUroIjt0DDo8cGkHNh2wCHAZXAof7hyNC4r1u5+2sTro33IchcGpIVtgDXKaJsFZn5LnsNQ
	meW5MGVFQsU9/ncg8MbPdgeU5mtrDDnWVeHC7+tYZati3gc+G4ihUDBgqtJ0r0EJfhEBiwwJQNds3
	CmSU4pOO4UCd5VsU3yNwKG4gmFpwmpno3XAzIAZNAByAG827I9GZdgNy0+Jy1afcDd0en/WeXmeFf
	hihGZ+jw27YbPbGHESFpK4LErhhKyC3q0Pi+n7tj1UihIyGW/6sLT2sTYQbDT67mTQVLV1siGxaMt
	ox5A5RAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY0Yx-0000000EwhF-20ef;
	Tue, 23 Dec 2025 11:28:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY0Yv-0000000Ewh7-3q5j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 11:28:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 036756013B;
	Tue, 23 Dec 2025 11:28:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AB01C116C6;
	Tue, 23 Dec 2025 11:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766489300;
	bh=lZe1cCbxkn52whYgqfzuO8vrl214dFz4RWvAWiF8ObI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DTZpsN3eHoFAL9lrlZRgFKStnM20W6ebr/myjO8gHzSWEQKg0j7s+gU5cLBlx/qhk
	 2iOvObt6Oxh3c0IoTL3f0rp2ZZd6wCYPH/aCbVLV9O3EeVp8I66XxWnELaoZWpdWL2
	 KS1hCJeaWL6G+hDcujgg9Zmns9YQkyp9SAoz4EDxQl57jEN6411dFMCBuXX8lkg+Tx
	 rYm5Jc5LjJkHArFYrjdgdNxzbOCU4hSqtePP0JKUyR6M9BVa3v6zUAqeNCmJ9cINU/
	 Z358X8iWp06b+w2Sz3N2U0zAhckweAxPNdfwnJiyOHXbCoSn8lmBiL6OyIIZII/75M
	 wnD1ZyGfbFyfQ==
From: Vinod Koul <vkoul@kernel.org>
To: Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, dmaengine@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251221080450.1813479-1-wens@kernel.org>
References: <20251221080450.1813479-1-wens@kernel.org>
Subject: Re: [PATCH] dmaengine: sun6i: Choose appropriate burst length
 under maxburst
Message-Id: <176648929819.697163.12733277039569161505.b4-ty@kernel.org>
Date: Tue, 23 Dec 2025 16:58:18 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Sun, 21 Dec 2025 16:04:48 +0800, Chen-Yu Tsai wrote:
> maxburst, as provided by the client, specifies the largest amount of
> data that is allowed to be transferred in one burst. This limit is
> normally provided to avoid a data burst overflowing the target FIFO.
> It does not mean that the DMA engine can only do bursts in that size.
> 
> Let the driver pick the largest supported burst length within the
> given limit. This lets the driver work correctly with some clients that
> give a large maxburst value. In particular, the 8250_dw driver will give
> a quarter of the UART's FIFO size as maxburst. On some systems the FIFO
> size is 256 bytes, giving a maxburst of 64 bytes, while the hardware
> only supports bursts of up to 16 bytes.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: sun6i: Choose appropriate burst length under maxburst
      commit: 7178c3586ab42693b28bb81014320a7783e5c435

Best regards,
-- 
~Vinod



