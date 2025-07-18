Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17380C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 14:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x5KFpv+HguD1EXq25PZOdZWBAfqqW2oh7rfLtZat8Lo=; b=rs1C61FQ74tZHrv410Kfe4XvQo
	g4n5FABzyeMc8cgechiUR57cFuHHU7tRulyeGf1YaOF3kwe3Ulmn8mC/1StfQ3GnXE58oNcgtRwwp
	bVm0TvgieaHHyj5wGfGw9/Uu0XFbQ/tzn+tatCfXWsN55XArLylTIs9kUQKMd7cAUF6WyDhdlOB3X
	wBVDZHSoKisES9RwIfKYFjwI3Md86zoH0Oq1hAr5Iw8eFX3w9lmYiyuYmHk4cYfLc5Zj5rnP9Dhi3
	Z9vezLR13fPmUdiNVzYgJ9oOEpuQ63phfmq83yY3GRA4Ef9FOwODSI8afNuHuG54ZWT8ybjB5msoV
	fFBEV11w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucm6L-0000000Cof9-2Ed9;
	Fri, 18 Jul 2025 14:30:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucm3u-0000000CoRx-0378
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 14:27:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AD199A5730F;
	Fri, 18 Jul 2025 14:27:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F856C4CEEB;
	Fri, 18 Jul 2025 14:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752848864;
	bh=OnxfV2yPEQVTv3ciBTrkkEXKVRS4lJt/Hwo5k2TvS+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kpqpYlSKyInOvbiMDs64WIZazYcsXfGEF5wAu3XhfYchOKHJ2U2M0wtuP86c4aFvG
	 nrUlAcH5WpOlDuZGAK0+iBwCYanToDXMxe0khgDz/PW72ZnJC4TAo5li5LAiZ+HQrO
	 QnvXSgQms2eMnTdzs4TLlc5rsZjbZp1anpZ6mqUjbwqKSZKj/aEc8b/zt4Z1Vvbuxv
	 Hb6snd5Mkh0365llavrBzHGuAxohxjZ4EfdMrqXwW4DJAYGaFcc/aGCajJOSZ/3WBq
	 gSWFlGCdagzcUnz909IN35j7TiqN/iNPLvepKR3xzK4bvVcid9+BZneRwyNBtrnIE4
	 0yJ76B4jfOvjg==
Date: Fri, 18 Jul 2025 15:27:39 +0100
From: Simon Horman <horms@kernel.org>
To: Himanshu Mittal <h-mittal1@ti.com>
Cc: pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
	davem@davemloft.net, andrew+netdev@lunn.ch,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, srk@ti.com,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Roger Quadros <rogerq@kernel.org>, danishanwar@ti.com,
	m-malladi@ti.com, pratheesh@ti.com, prajith@ti.com
Subject: Re: [PATCH net v3] net: ti: icssg-prueth: Fix buffer allocation for
 ICSSG
Message-ID: <20250718142739.GD2459@horms.kernel.org>
References: <20250717094220.546388-1-h-mittal1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717094220.546388-1-h-mittal1@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_072746_181557_7730B5F1 
X-CRM114-Status: GOOD (  20.00  )
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

On Thu, Jul 17, 2025 at 03:12:20PM +0530, Himanshu Mittal wrote:
> Fixes overlapping buffer allocation for ICSSG peripheral
> used for storing packets to be received/transmitted.
> There are 3 buffers:
> 1. Buffer for Locally Injected Packets
> 2. Buffer for Forwarding Packets
> 3. Buffer for Host Egress Packets
> 
> In existing allocation buffers for 2. and 3. are overlapping causing
> packet corruption.
> 
> Packet corruption observations:
> During tcp iperf testing, due to overlapping buffers the received ack
> packet overwrites the packet to be transmitted. So, we see packets on
> wire with the ack packet content inside the content of next TCP packet
> from sender device.
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
> | PRE | 70030000   | 70033800 | 70034000   | 70037800 |
> +-----+------------+----------+------------+----------+
> 
> +---------------------+----------+----------+
> |                     | SLICE 0  |  SLICE 1 |
> +---------------------+----------+----------+
> | Default Drop Offset | 00000000 | 00000000 |     <-- Field not configured
> +---------------------+----------+----------+
> 
> -> Allocation this patch brings:
> +---------+-------------------------------------------------------------+
> |         |          SLICE 0             |          SLICE 1             |
> |         +------+--------------+--------+------+--------------+--------+
> |         | Slot | Base Address | Size   | Slot | Base Address | Size   |
> |---------+------+--------------+--------+------+--------------+--------+
> |         | 0    | 70000000     | 0x2000 | 0    | 70040000     | 0x2000 |
> |         | 1    | 70002000     | 0x2000 | 1    | 70042000     | 0x2000 |
> |         | 2    | 70004000     | 0x2000 | 2    | 70044000     | 0x2000 |
> | FWD     | 3    | 70006000     | 0x2000 | 3    | 70046000     | 0x2000 |
> | Buffers | 4    | 70008000     | 0x2000 | 4    | 70048000     | 0x2000 |
> |         | 5    | 7000A000     | 0x2000 | 5    | 7004A000     | 0x2000 |
> |         | 6    | 7000C000     | 0x2000 | 6    | 7004C000     | 0x2000 |
> |         | 7    | 7000E000     | 0x2000 | 7    | 7004E000     | 0x2000 |
> +---------+------+--------------+--------+------+--------------+--------+
> |         | 8    | 70010000     | 0x1000 | 8    | 70050000     | 0x1000 |
> |         | 9    | 70011000     | 0x1000 | 9    | 70051000     | 0x1000 |
> |         | 10   | 70012000     | 0x1000 | 10   | 70052000     | 0x1000 |
> | Our     | 11   | 70013000     | 0x1000 | 11   | 70053000     | 0x1000 |
> | LI      | 12   | 00000000     | 0x0    | 12   | 00000000     | 0x0    |
> | Buffers | 13   | 00000000     | 0x0    | 13   | 00000000     | 0x0    |
> |         | 14   | 00000000     | 0x0    | 14   | 00000000     | 0x0    |
> |         | 15   | 00000000     | 0x0    | 15   | 00000000     | 0x0    |
> +---------+------+--------------+--------+------+--------------+--------+
> |         | 16   | 70014000     | 0x1000 | 16   | 70054000     | 0x1000 |
> |         | 17   | 70015000     | 0x1000 | 17   | 70055000     | 0x1000 |
> |         | 18   | 70016000     | 0x1000 | 18   | 70056000     | 0x1000 |
> | Their   | 19   | 70017000     | 0x1000 | 19   | 70057000     | 0x1000 |
> | LI      | 20   | 00000000     | 0x0    | 20   | 00000000     | 0x0    |
> | Buffers | 21   | 00000000     | 0x0    | 21   | 00000000     | 0x0    |
> |         | 22   | 00000000     | 0x0    | 22   | 00000000     | 0x0    |
> |         | 23   | 00000000     | 0x0    | 23   | 00000000     | 0x0    |
> +---------+------+--------------+--------+------+--------------+--------+
> 
> +-----+-----------------------------------------------+
> |     |       SLICE 0       |        SLICE 1          |
> |     +------------+----------+------------+----------+
> |     | Start addr | End addr | Start addr | End addr |
> +-----+------------+----------+------------+----------+
> | EXP | 70018000   | 7001C000 | 70058000   | 7005C000 |
> | PRE | 7001C000   | 7001F800 | 7005C000   | 7005F800 |
> +-----+------------+----------+------------+----------+
> 
> +---------------------+----------+----------+
> |                     | SLICE 0  |  SLICE 1 |
> +---------------------+----------+----------+
> | Default Drop Offset | 7001F800 | 7005F800 |
> +---------------------+----------+----------+
> 
> Rootcause: missing buffer configuration for Express frames in
> function: prueth_fw_offload_buffer_setup()
> 
> Details:
> Driver implements two distinct buffer configuration functions that are
> invoked based on the driver state and ICSSG firmware:-
> - prueth_fw_offload_buffer_setup()
> - prueth_emac_buffer_setup()
> 
> During initialization, driver creates standard network interfaces
> (netdevs) and configures buffers via prueth_emac_buffer_setup().
> This function properly allocates and configures all required memory
> regions including:
> - LI buffers
> - Express packet buffers
> - Preemptible packet buffers
> 
> However, when the driver transitions to an offload mode (switch/HSR/PRP),
> buffer reconfiguration is handled by prueth_fw_offload_buffer_setup().
> This function does not reconfigure the buffer regions required for
> Express packets, leading to incorrect buffer allocation.
> 
> Fixes: abd5576b9c57 ("net: ti: icssg-prueth: Add support for ICSSG switch firmware")
> Signed-off-by: Himanshu Mittal <h-mittal1@ti.com>

Thanks for the updated patch description.

Reviewed-by: Simon Horman <horms@kernel.org>

FTR, I did spend some time looking over the mappings described
above and correlating them with both the code and the "Details" above.
I agree with the analysis above and that the patchset addresses
the problem as described.

...

