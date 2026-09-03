Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622AEC624D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 23:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EIHDkLIlWv8dC8AntA5JVQgeAcHvFlAslv/XDaxPTPI=; b=ivjbdj6RJgVhUlA5QoqH5gMh8a
	41Gi5SxOVLA+h4KkyT/oK1jtt5q79ZWP9f1vUPF3oSudNEJZ3L3PK/Xur50CXTGMw4bByo08JETk7
	b5MdYg7KN7C9mkj7TSLa2NxIcI1hki3Hs19VIsZpv8Zsmu9LEo8oVYcAKhgHq/MVkwzDK4hbRVt67
	JK3xRTqw4praXcnAThlszpASjVwGTOeP59iztnQ+SI8ImPkgtoKrev2Pj8HS/E4VFu7IGmbYfMGEG
	6uHBqSBQ1UFwnC6BHpzr6H75dcZ11TyWSEIS04p3QW7PLLgJTPvafrdyCW9jVOigCQ89Bnurh+ZmF
	T1yijAIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Gol-00000000lmq-3IXT;
	Thu, 03 Sep 2026 23:26:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Gok-00000000lmh-1sNC;
	Thu, 03 Sep 2026 23:26:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B62F343866;
	Thu,  3 Sep 2026 23:25:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 526ED1F000E9;
	Thu,  3 Sep 2026 23:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788477959;
	bh=EIHDkLIlWv8dC8AntA5JVQgeAcHvFlAslv/XDaxPTPI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=KqAB+jW43Ok7vli8pgIy+nVe5ry10H8KxmZcXIRi2paGbb4bmL5F7MzX1HxsJqhUj
	 9u7YgX+bSuDPhO7GKNnLndY/ONLfW40SjuL+6MDkC4yHmUsoPtCgYXcYmCwrloG/l/
	 YSWnCqi20Qac8RsrEtpdIi7oDY2M/klMCxIJP4xlBCmnQj3C1XmOmsMsRciOKEYd/h
	 rJkumR/DCV9O2M+eO/Nq/kCLLmn/0MDC5npit6CY7WqjaF0uJLh5Szi+UASsx9NJFi
	 K+j93D3iAo32NtpG92iO90jFSB+nfhMUgIz5pYRZ3Qtuy60XoOgJCaMBi8J2W5NU07
	 GiZlc6jRfDpDw==
Date: Thu, 3 Sep 2026 16:25:58 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Alexander Lobakin <aleksander.lobakin@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, Madhur Agrawal <madhur.agrawal@airoha.com>
Subject: Re: [PATCH net-next v5] net: airoha: add HW GRO offload support
Message-ID: <20260903162558.2679c1d1@kernel.org>
In-Reply-To: <apmWLtgcUXRrOTFj@lore-desk>
References: <20260831-airoha-eth-lro-v5-1-6b0f50401121@kernel.org>
	<fce0ee5a-476a-4867-9dd2-08e55993bd90@redhat.com>
	<aplpllPidmCjhSmA@lore-desk>
	<1ef90408-99b6-42fb-a7c6-7e5bca20c46d@redhat.com>
	<apmWLtgcUXRrOTFj@lore-desk>
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

On Thu, 3 Sep 2026 17:45:50 +0200 Lorenzo Bianconi wrote:
> > Lacking more details from the vendor, I think you need to use a
> > pktdrill-like sender, explicitly sets the segment lengths to some not
> > mergeable (like, i.e. 200-300-400) but otherwise fitting a GRO packet
> > (i.e. same hdr except for the sequence number and push flag allowed only
> > in the last packet), ensure that the aggregation timeout lasts long
> > enough to receive all of them, and check if the engine really aggregates
> > them or not.  
> 
> I think in the example you pointed out (length 200,300,400) the hw engine will
> create a single TCP packet composed by 3 segments (with gso_size = 300) while
> sw GRO will just push sigle skbs. I agree this is just a GRO approximation.
> If it is not enough I am fine to switch back to LRO implementation.

FWIW the gro.py test covers that and many more cases..

