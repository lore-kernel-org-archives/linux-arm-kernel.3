Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D6FC02192
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 21:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rEer5Vac7kMVgv5bwbnGzchPKoqx1kUftnZtMdARFIA=; b=aO4qGgRz6lFoi1wRRqZkBMe/cY
	ezzNQdQkfkcUwzk4UGZfpNonghH17TZOHMdIClJuMUghKKq+vxqnot74NPeAid2f57jAKLigE4o52
	zZd7B5p4TDV7lzcLL6REXsJbg/NzV7txgVR2n5r0+qP5i1JOKzDyqOaXT88zfyselgzVKSPGNfQk4
	mOPN2CBrHVBd1L9bq+fDJ8raVXekXi6ANKy5HV+jnWQIqw/A9BVz8rdYAooqqrI6FaPdmL6GX7M5X
	/1C/j3Kh7HqP42oUBtjX3p4gyqnTym2Ld7pkZT5/mFSG8gAVLaKLDTBggF1IY0iXdY1XZUrx5g0Kp
	CUxcD9wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tct0w-00000005qSk-3qit;
	Tue, 28 Jan 2025 21:20:54 +0000
Received: from ns.lynxeye.de ([87.118.118.114] helo=lynxeye.de)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcrq0-00000005mEW-3jSG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 20:05:34 +0000
Received: by lynxeye.de (Postfix, from userid 501)
	id 6F899E74071; Tue, 28 Jan 2025 21:04:58 +0100 (CET)
Received: from [192.168.178.25] (a89-182-99-197.net-htp.de [89.182.99.197])
	by lynxeye.de (Postfix) with ESMTPSA id 0A738E74067;
	Tue, 28 Jan 2025 21:04:57 +0100 (CET)
Message-ID: <c8db4ad722b7dd169ea71990238dbc82da91f3a4.camel@lynxeye.de>
Subject: Re: [PATCH net-next v3 1/4] net: stmmac: Switch to zero-copy in
 non-XDP RX path
From: Lucas Stach <dev@lynxeye.de>
To: Thierry Reding <thierry.reding@gmail.com>, Furong Xu <0x1207@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Brad Griffis <bgriffis@nvidia.com>, Jon
 Hunter <jonathanh@nvidia.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexander Lobakin <aleksander.lobakin@intel.com>, Joe Damato
 <jdamato@fastly.com>, Andrew Lunn	 <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet	 <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni	 <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, 	xfr@outlook.com,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Date: Tue, 28 Jan 2025 21:04:56 +0100
In-Reply-To: <qkjv53fn32qdi5jh2d6bqdfnnl5x4x74cmir6fjtstfw2ijds6@eoxctjkqij7u>
References: <cover.1736910454.git.0x1207@gmail.com>
	 <bd7aabf4d9b6696885922ed4bef8fc95142d3004.1736910454.git.0x1207@gmail.com>
	 <d465f277-bac7-439f-be1d-9a47dfe2d951@nvidia.com>
	 <20250124003501.5fff00bc@orangepi5-plus>
	 <e6305e71-5633-48bf-988d-fa2886e16aae@nvidia.com>
	 <ccbecd2a-7889-4389-977e-10da6a00391c@lunn.ch>
	 <20250124104256.00007d23@gmail.com>
	 <qkjv53fn32qdi5jh2d6bqdfnnl5x4x74cmir6fjtstfw2ijds6@eoxctjkqij7u>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_120533_072733_4F8FE3DA 
X-CRM114-Status: GOOD (  16.24  )
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

Am Freitag, dem 24.01.2025 um 14:15 +0100 schrieb Thierry Reding:
>=20
[...]
> > The dma-coherent property in device tree node is SoC specific, so only =
the
> > vendors know if their stmmac ethernet controller is dma coherent and
> > whether their device tree are missing the critical dma-coherent propert=
y.
>=20
> What I fail to understand is how dma-coherent can make a difference in
> this case. If it's not present, then the driver is supposed to maintain
> caches explicitly. But it seems like explicit cache maintenance actually
> causes things to break. So do we need to assume that DMA coherent
> devices in generally won't work if the driver manages caches explicitly?
>=20
> I always figured dma-coherent was more of an optimization, but this
> seems to indicate it isn't.

There is a real=C2=A0failure scenario when the device is actually dma-
coherent, but the DT claims it isn't: If a location from e.g. a receive
buffer is already allocated in the cache, the write from the device
will update the cache line and not go out to memory. If you then do the
usual non-coherent cache maintenance, i.e. invalidate the RX buffer
area after the device indicated the reception of the buffer, you will
destroy the updated data in the cache and read stale data from memory.

Regards,
Lucas

