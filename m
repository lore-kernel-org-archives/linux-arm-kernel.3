Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B63CD98E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 20:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gwo8BfYbtWdTsD2kD2xvWmHwutXtNuD/7PfiuNBO8/k=; b=f4KcVNermrrjSfgClEtgnpd3jb
	VLMhiUeZdRNd0Ca1jxzpbB38ocDHAeS8nw25vcYAkmOUfQPulHWtH0vnSINDZpaywvym7GQcfAYuf
	ocQ43dcOcRkA2UtcYgsVfp8qMhhQDK30Cj/zKDsyILrKOvw+1BHtorU+mSkrEBl4ibsxzaGz26+pL
	UhjSpy9US3T+Xkw8ufO1G84GRKFd7gimzAosodNz12PgkqjRASRx6hioaWBt3OlpWWlbHNqgaMZqK
	Kg+RE8KPeSiFVg7JJr+3wRzXnH4KiJ8O/LaCthPJTcKaoSVxyIcxIMBZDvRR3+3YI2s5Zy3FgPSsx
	7NSucWhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZELk-0000000EqjM-1wUn;
	Mon, 15 Jun 2026 20:56:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZELj-0000000EqjF-1IQd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 20:56:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9902041830;
	Mon, 15 Jun 2026 20:56:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78C0E1F000E9;
	Mon, 15 Jun 2026 20:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781556962;
	bh=gwo8BfYbtWdTsD2kD2xvWmHwutXtNuD/7PfiuNBO8/k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=BHS0SKlRs9BWTFHWG8jt45niVzZI0nXhyyWGo/j7SBSS4Y8iBZUhF8B278ofv82oZ
	 m5EAGBOl6+RXhwZ/zmQ8V9pU830ga8ZVlqpifn5p+kDgOWpsmnF2zy3tBFUbj/Bbb6
	 rgeJZHTPi5uKM6e4ZewyAhL0q6SvVj44dL3iQrTpijUyCJ0WHWKhJ+jLs2YOgtfJTF
	 Rt0xfQK+CrVme1gkHDCzM7yRMb8InGbyfvOSa+lMKdtYdKQqgQ0zAK/ao7L4RvLVJv
	 AF2qQIovOW67CQ3OdU5FMy0dmlE+C/9vNlys6llhcSC3mdzosAuuvcIAIbN3uNhlDO
	 LSW/zrfv+RTFg==
Date: Mon, 15 Jun 2026 13:56:00 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Parvathi Pudi <parvathi@couthit.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, danishanwar@ti.com, rogerq@kernel.org,
 pmohan@couthit.com, afd@ti.com, basharath@couthit.com, arnd@arndb.de,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, pratheesh@ti.com,
 j-rameshbabu@ti.com, vigneshr@ti.com, praneeth@ti.com, srk@ti.com,
 rogerq@ti.com, m-malladi@ti.com, krishna@couthit.com, mohan@couthit.com
Subject: Re: [PATCH net-next 3/3] net: ti: icssm-prueth: Support duplicate
 HW offload feature for HSR and PRP
Message-ID: <20260615135600.655e4be4@kernel.org>
In-Reply-To: <20260611123636.376577-4-parvathi@couthit.com>
References: <20260611123636.376577-1-parvathi@couthit.com>
	<20260611123636.376577-4-parvathi@couthit.com>
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

On Thu, 11 Jun 2026 18:03:28 +0530 Parvathi Pudi wrote:
> From: Roger Quadros <rogerq@ti.com>
> 
> In HSR and PRP modes each outgoing frame must be sent on both PRU slave
> ports.
> 
> Previously the driver was writing the frame into each port's transmit queue
> independently after updating the tags resulting in performing two OCMC
> buffer copy operations.
> 
> Frame duplicate offloading is implemented with a common shared queue
> between the two ports. The driver writes the frame once into OCMC RAM,
> each port reads from the shared queue and replicates the transmission to
> both PRU ports, synchronising between PRU ports are maintained within
> firmware with appropriate handling.
> 
> For HSR the driver inspects the encapsulated ethertype in the HSR tag.
> PTP frames (ETH_P_1588) are sent on the directed port only to avoid double
> duplication and all other HSR frames are duplicated to both ports.
> VLAN-tagged HSR frames are handled by advancing past the 4-byte VLAN header
> before reading the HSR tag.
> 
> For PRP the driver checks the 6-byte RCT trailer for the ETH_P_PRP suffix
> to identify redundancy-tagged frames. Frames without an RCT are sent on the
> originating port only.

Warning: drivers/net/ethernet/ti/icssm/icssm_prueth.h:113 struct member 'host_recv_flag' not described in 'prueth_packet_info'

Please note that net-next will be closed for the next two weeks.
-- 
pw-bot: cr

