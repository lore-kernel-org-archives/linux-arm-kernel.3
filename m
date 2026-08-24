Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7559AC5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 18:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bBAzJ1wZvTBzk2jjxXm3YqIN0/WHyV3eBtBFUun8nQ0=; b=g0GN2XzGyPNciS8xngmfofFUlb
	APKXf5XKZ5wRm5uCLhSiRHTlv3K0dCjH9Qnw7ufjrcqa11EPx9yJ0C4kCFSYSU3zOaMdPEMINdDVY
	9qhVJnq5OriCmzZnowzxbKqJBaiXXFLUVhqJy6SNwEdr6e30jl6Kc7j1Ncbz1ugW/KsLrELA1Sz/E
	pqW9b9H1kVkue3tdHvbkZ0P5sUd/t4JvbY1GTf2nJUt938IlOgFET0uymYNHAs/pKAt6yMEOJW+bI
	zXY12yuHpCe0il/TEQrPYOjPYRLn9A/0uhBfa02Wv2FfPJZuo+XiE/dVvwiAPJg51b+/Vdk4iyWOe
	y/mzK7uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyZC5-0000000HEiN-0JLs;
	Mon, 24 Aug 2026 18:14:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyZC1-0000000HEhf-3mD1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 18:14:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3FBA64394A;
	Mon, 24 Aug 2026 18:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16CDE1F000E9;
	Mon, 24 Aug 2026 18:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787595285;
	bh=bBAzJ1wZvTBzk2jjxXm3YqIN0/WHyV3eBtBFUun8nQ0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=jgAXqGNasidbaHQMnp5/SMprfR24IUmQiq8GmvgOdzqvGTFc2WNl2gHAGWyK4UJAA
	 ByhiiLyF1JoFw7QInGYLTqnz+lO0fpq17gGejgBfcoz7NmvTrzJBpPt8adRbXiucr1
	 L0t2oByWLooDg+TVK0h9NBQUcLB9lymHNbTp8uxRMCiTarrOWYheF9dynLWEDL9JSm
	 O8q+q9akjuhyhLslrVdA2J35E+njlTzbRjn74YPpXf151DwVAaHU7jc5HQd2inb97W
	 5Z7HSEz580eRcD1F//V50hLwnc5oh6A1WHNp1zrJNVf2qLx+W9sIf+z6hUf9fyKfHb
	 pqGoM30MOUnBg==
Date: Mon, 24 Aug 2026 11:14:43 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, anthony.l.nguyen@intel.com,
 przemyslaw.kitszel@intel.com, andrew+netdev@lunn.ch, saeedm@nvidia.com,
 tariqt@nvidia.com, mbloch@nvidia.com, maxime.chevallier@bootlin.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 aleksander.lobakin@intel.com, horms@kernel.org, magnus.karlsson@intel.com,
 sdf@fomichev.me, ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
 john.fastabend@gmail.com, guoren@kernel.org, dtatulea@nvidia.com,
 witu@nvidia.com, martin.lau@kernel.org, yoong.siang.song@intel.com,
 intel-wired-lan@lists.osuosl.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
 linux-csky@vger.kernel.org, leon@kernel.org
Subject: Re: [PATCH net v3 3/3] net: stmmac: document oversized AF_XDP frame
 handling
Message-ID: <20260824111443.34bffe04@kernel.org>
In-Reply-To: <aoiIarzdjk92RkCN@devvm7509.cco0.facebook.com>
References: <20260819160535.1472459-1-sdf@fomichev.me>
	<20260819160535.1472459-4-sdf@fomichev.me>
	<aoceSoSFMx69Z9up@boxer>
	<aoeoJ6-njBxcWs4w@devvm7509.cco0.facebook.com>
	<aogpDsa8hz6CPpD3@boxer>
	<aoiIarzdjk92RkCN@devvm7509.cco0.facebook.com>
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

On Fri, 21 Aug 2026 10:28:47 -0700 Stanislav Fomichev wrote:
> > > I do agree that a better idea is to probably do these checks during control
> > > paths, but it's a bit more involved (and not sure if it's possible? if we
> > > have a bunch of xsk sockets and we change that max_sdu, do we go over all
> > > sockets on the system somehow?). My main motivation with this patch was
> > > to make our LLM reviewers less chatty about preexisting issues.  
> > 
> > I hear you, however I feel like we do not know this driver too much and
> > probably we don't have a HW to test out such changes, so maybe let us try
> > to fix existing behavior?  
> 
> Let's definitely fix it properly if you have better ideas. But since we
> don't have HW, I'm not super confident doing anything sophisticated
> myself :-D

Let me take the first 2 patches and leave the stmmac for later.
I don't think anyone involved care particularly deeply here.

Maxime said he bought a bunch of relevant HW. If we finally wrap 
the AF_XDP tests into driver runtime he should be able to help us...

