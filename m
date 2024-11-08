Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12491D5C0D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 14:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LsPCVms6hNNfLUkJTitnYnu1jKozUMg34GhP2YbGR/Y=; b=R+Sipdr1la8xQd5CPRkrnvr7So
	EBIp9o3m6KqvWnHKl8Qm5HQZV5lkisvj1h7I6EifSzNIe9nxh3oHNfdEB0GkIL14I88ggSddt4OTh
	rrc40vCqdBatKXpvXe45b758mpkFS7EPULR2amQ6HNt+faeZBXXoivWcsHZ4xyZY0gmJAQDiguB0b
	OjjQXXFem4JqM4aQCQErinzfMgg+WkMPFeGaBDnDgSRcfmfAXUaMp6wytL1nBl0NwpHyGcnoyzY66
	Wss+lfj3qIpL2vPMRG2RhvsKDLF6vU0MLelaiZxF8FCQ6FIANblXLMlr++H2eUPLAssfb6jKUr3yi
	KDntxWTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9QHH-0000000Au4v-2FKK;
	Fri, 08 Nov 2024 14:47:59 +0000
Received: from out-173.mta0.migadu.com ([2001:41d0:1004:224b::ad])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9PmA-0000000AoiJ-1O1g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 14:15:53 +0000
Date: Sat, 9 Nov 2024 01:15:16 +1100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1731075347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LsPCVms6hNNfLUkJTitnYnu1jKozUMg34GhP2YbGR/Y=;
	b=dyRNsVDTwaKej4kfRQld0HktPA9K31WMR+7RMV7BkZyFHohDGsgh1Ni/SdHK1cF+2R1gR3
	E44AMjR6bxQC7HScfiopeaR5sHe7tc5H73ez0wWQdpHXWy+DDSSuypMNYDuvBXu91X5OYX
	/zTcFle6IGlpjTeWpb1qWnbZ4sdt3OTUUJzLFXD85jv/Inx7Ng4nrf7Oa/tgwPYKYOHXfq
	q6Qyy6x94JDR5O6fGBJaN8B9vzCA5hihKqFw26GUNovZ5TwZAmuEy2myt3SLTCR/6xVmhU
	05FqmKXjfPLpUsWxlc8ivY1X3kFTZyT6Tj9eDu6viVNU/iM4CR6BdagzgqLxEw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: John Watts <contact@jookia.org>
To: Parthiban <parthiban@linumiz.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Samuel Holland <samuel@sholland.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: Workaround TCON TOP conflict between DE0 and
 DE1
Message-ID: <Zy4c9BFcrz2JVU6k@titan>
References: <20241108-tcon_fix-v1-1-616218cc0d5f@jookia.org>
 <20241108115357.691b77b0@donnerap.manchester.arm.com>
 <Zy4SKCBwce3q0yj5@titan>
 <b26b9d86-4ff9-4543-85ce-176dccfbfa05@linumiz.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b26b9d86-4ff9-4543-85ce-176dccfbfa05@linumiz.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_061550_903396_1BB2309E 
X-CRM114-Status: GOOD (  14.34  )
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

On Fri, Nov 08, 2024 at 07:36:16PM +0530, Parthiban wrote:
> To add, 0x20 will be DE0 <--> LCD0 and DE1 <--> TV0. Below note (copied from
> R40) states the priority of the DE selection, which fails to work? Not sure,
> may be disabling CORE1_SCLK_GATE and CORE1_HCLK_GATE in de2-clk helps.
> 
> With A133 following the same as T113 with single mixer without TV, still
> sets 0x20 in vendor kernel.
> 
> copied from R40:
> Note: The priority of DE0 is higher than DE1.
> If TCON_LCD0 selects DE0 and DE1 as source at the same time, then
> DE0 will be used for the source of TCON_LCD0.

Hi there,

Yes that was a pretty bad typo, I meant to say DE1 to TV0
The prioritization seems broken in the T113 at least, it's racy from
what I see in testing. I should note this in the patch too.

I looked at the datasheets and kernel code briefly: I can't seem to
figure out what SCLK/HCLK gating does and I don't think the kernel
touches these registers which are gated by default.

> Thanks,
> Parthiban

John Watts

