Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E180C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 14:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2P30axWy4XsVmcI5+rqO0WWfrQvTuFZT9dYcuIC3/Dc=; b=a9J1E7KxIw9OVOxLbHwHaVuXkF
	1b1E7N1vSoYikdhW8rrYidQfudeL+QZKm3y+hTw1fR/vDEWpaE7IA0urnv/8czFYtJl8KQWisRoLP
	xfXNIfzOC2PDAB2HGM7o1nm3jSHiZPz/qfhNCI0xRSN+LrkCESJdgqzaPxxNfifqQ27l1HmaFPTsF
	kkerbmQoeHL5jUbWpcbEWWO8o6kn1rHDhNG4IVb9byA+WxXOxyqhMmH4hO6CreP/W7XT/JKzhIjJ/
	Z4LzTkZ6ZER2ieNynRjN+FIHBCdQfIlueqTvPYmdJWIFCOFd491D9Qs/oGr1YuA7bgRmdL3VP3bZw
	0hbyy4fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaF0e-0000000F3OC-3ntI;
	Fri, 11 Jul 2025 14:45:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaEyJ-0000000F36v-1GjD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 14:43:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 117CF5C715B;
	Fri, 11 Jul 2025 14:43:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B982C4CEF0;
	Fri, 11 Jul 2025 14:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752245009;
	bh=UEqcf9BWe9KSrJPz14kGQMwOPOmc8OadmITUFSWpuEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sz8VykjguiAuVoV0hyJ3PDMgg7yAmfztLYWKJncQAujXcfRYc+kNt3brvzbT9mrQr
	 AoTZ61ZcWxsrcWUchqUjn1BbWSSCdumE55cPlAKNS+v6Tv2xkexyoowYoafUKd3DzI
	 U1F+2HQ0Bm2e2HBXXSQo811niX5aGl72URCbAQ/YeQ0Tf9oKI+auExS2hxYU65V/dZ
	 bI4XZPP2obDEOwXc9NE+EssbLNyejXj0hMmoLwL/JhJzrURHLD85K0KQjInQw0w3hS
	 viMtmI6ksFRptGf0lg7tnPBCNcN7wfkS+qDlnapO3FZlVmUFZ4DwQvG/PwzBY4HwfJ
	 5CdWWhQa0J0/g==
Date: Fri, 11 Jul 2025 15:43:23 +0100
From: Simon Horman <horms@kernel.org>
To: Himanshu Mittal <h-mittal1@ti.com>
Cc: pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
	davem@davemloft.net, andrew+netdev@lunn.ch,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, srk@ti.com,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Roger Quadros <rogerq@kernel.org>, danishanwar@ti.com,
	m-malladi@ti.com, pratheesh@ti.com, prajith@ti.com
Subject: Re: [PATCH net v2] net: ti: icssg-prueth: Fix buffer allocation for
 ICSSG
Message-ID: <20250711144323.GV721198@horms.kernel.org>
References: <20250710131250.1294278-1-h-mittal1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710131250.1294278-1-h-mittal1@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_074331_423897_12DEE18C 
X-CRM114-Status: GOOD (  15.65  )
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

On Thu, Jul 10, 2025 at 06:42:50PM +0530, Himanshu Mittal wrote:
> Fixes overlapping buffer allocation for ICSSG peripheral
> used for storing packets to be received/transmitted.
> There are 3 buffers:
> 1. Buffer for Locally Injected Packets
> 2. Buffer for Forwarding Packets
> 3. Buffer for Host Egress Packets
> 
> In existing allocation buffers for 2. and 3. are overlapping causing packet
> corruption.
> 
> Packet corruption observations:
> During tcp iperf testing, due to overlapping buffers the received ack
> packet overwrites the packet to be transmitted. So, we see packets on wire
> with the ack packet content inside the content of next TCP packet from
> sender device.
> 
> Details for AM64x switch mode:
> -> Allocation by existing driver:
> +---------+-------------------------------------------------------------+
> |         |          SLICE 0             |          SLICE 1             |
> |         +------+--------------+--------+------+--------------+--------+
> |         | Slot | Base Address | Size   | Slot | Base Address | Size   |
> |---------+------+--------------+--------+------+--------------+--------+
> |         | 0    | 70000000     | 0x2000 | 0    | 70010000     | 0x2000 |
> |         | 1    | 70002000     | 0x2000 | 1    | 70012000     | 0x2000 |
> |         | 2    | 70004000     | 0x2000 | 2    | 70014000     | 0x2000 |
> | FWD     | 3    | 70006000     | 0x2000 | 3    | 70016000     | 0x2000 |
> | Buffers | 4    | 70008000     | 0x2000 | 4    | 70018000     | 0x2000 |
> |         | 5    | 7000A000     | 0x2000 | 5    | 7001A000     | 0x2000 |
> |         | 6    | 7000C000     | 0x2000 | 6    | 7001C000     | 0x2000 |
> |         | 7    | 7000E000     | 0x2000 | 7    | 7001E000     | 0x2000 |
> +---------+------+--------------+--------+------+--------------+--------+
> |         | 8    | 70020000     | 0x1000 | 8    | 70028000     | 0x1000 |
> |         | 9    | 70021000     | 0x1000 | 9    | 70029000     | 0x1000 |
> |         | 10   | 70022000     | 0x1000 | 10   | 7002A000     | 0x1000 |
> | Our     | 11   | 70023000     | 0x1000 | 11   | 7002B000     | 0x1000 |
> | LI      | 12   | 00000000     | 0x0    | 12   | 00000000     | 0x0    |
> | Buffers | 13   | 00000000     | 0x0    | 13   | 00000000     | 0x0    |
> |         | 14   | 00000000     | 0x0    | 14   | 00000000     | 0x0    |
> |         | 15   | 00000000     | 0x0    | 15   | 00000000     | 0x0    |
> +---------+------+--------------+--------+------+--------------+--------+
> |         | 16   | 70024000     | 0x1000 | 16   | 7002C000     | 0x1000 |
> |         | 17   | 70025000     | 0x1000 | 17   | 7002D000     | 0x1000 |
> |         | 18   | 70026000     | 0x1000 | 18   | 7002E000     | 0x1000 |
> | Their   | 19   | 70027000     | 0x1000 | 19   | 7002F000     | 0x1000 |
> | LI      | 20   | 00000000     | 0x0    | 20   | 00000000     | 0x0    |
> | Buffers | 21   | 00000000     | 0x0    | 21   | 00000000     | 0x0    |
> |         | 22   | 00000000     | 0x0    | 22   | 00000000     | 0x0    |
> |         | 23   | 00000000     | 0x0    | 23   | 00000000     | 0x0    |
> +---------+------+--------------+--------+------+--------------+--------+
> --> here 16, 17, 18, 19 overlapping with below express buffer
> 
> +-----+-----------------------------------------------+
> |     |       SLICE 0       |        SLICE 1          |
> |     +------------+----------+------------+----------+
> |     | Start addr | End addr | Start addr | End addr |
> +-----+------------+----------+------------+----------+
> | EXP | 70024000   | 70028000 | 7002C000   | 70030000 | <-- Overlapping

Thanks for the detailed explanation with these tables.
It is very helpful. I follow both the existing and new mappings
with their help. Except for one thing.

It's not clear how EXP was set to the values on the line above.
Probably I'm missing something very obvious.
Could you help me out here?

> | PRE | 70030000   | 70033800 | 70034000   | 70037800 |
> +-----+------------+----------+------------+----------+
> 
> +---------------------+----------+----------+
> |                     | SLICE 0  |  SLICE 1 |
> +---------------------+----------+----------+
> | Default Drop Offset | 00000000 | 00000000 |     <-- Field not configured
> +---------------------+----------+----------+

...

