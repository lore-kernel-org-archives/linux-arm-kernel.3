Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905D6C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 00:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7UlrFfylbpBy4vneHs950WaWukboneC9snxAgQqSJWQ=; b=hVkEEB7jNSYngH+YoBKq3WR+Qv
	mfDo7tQrj+t9UPgz2Ckm+C8zSnpxXFJb5eRDC1FOsqygHeLUrSC2Hk02NWvD0OCIQsIyRseWDJ2nn
	VLMankgcK4n8eLCVuqsNRpoLi4suR9zCWFc8PIdgNtDph4kOQIEUXwa+86NN9Ub9e5zE40a8YvaA+
	451afdv3EIyYQ8YGLLUj0xJHcBtLke3Vgrppgqz8N+o6/eIlqlWLTFru+WyC5j2hByzW2BAK9dEbw
	jNtdDdRexJ0dZJK6lr2b2N6Jx6/n7u8kpzFHaIrxTi9nrQggImJtmV7pBS91tRRCIc//N1gs4V3Dx
	2Cm/G62g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSPoc-0000000ETfJ-2djf;
	Fri, 20 Jun 2025 00:41:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSPmO-0000000ETXQ-2NbA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 00:38:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6B7DE5C62CA;
	Fri, 20 Jun 2025 00:36:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8677EC4CEEA;
	Fri, 20 Jun 2025 00:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750379930;
	bh=xT+r7K9OiBk+EdMW4tR3tGw9dLU8vBuU4Ipb1ONEep4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=GVzENPjX9I9+db+c2/GbYUz8TUjCoTCbPrWl4Ppa+kMTKigeinpZI0PDs6pLjZdzs
	 iusETX77A9BJN4Y6kKc9mJuwiI8Zl2UJDka72P+btN4NAMXuXaKm0DQzc7h1daH2gY
	 pktEY8l9s6jOOTQ1gwobcB2UbBUttsN9CulbOmoDFFOPopai26QzUt0dboS8UFXODS
	 aNrBYWQCBoDGXkqmnCsQIGONzW6ESNFtUWOfe2dJ4E/i1EpUFDTymX+mNdNA3hYrdp
	 qPHN4qDAKa3bgBPaKBdevk4hRqIautR4btFF7l7BZEa4JrVixcQLiSQBqnCvvaAGZn
	 oiz3CbOi1cXMQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250619062108.2016511-1-xiaolei.wang@windriver.com>
References: <20250619062108.2016511-1-xiaolei.wang@windriver.com>
Subject: Re: [PATCH v3] clk: imx: Fix an out-of-bounds access in dispmix_csr_clk_dev_data
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Frank.li@nxp.com, Xiaolei Wang <xiaolei.wang@windriver.com>, abelvesa@kernel.org, festevam@gmail.com, kernel@pengutronix.de, mturquette@baylibre.com, peng.fan@nxp.com, s.hauer@pengutronix.de, shawnguo@kernel.org
Date: Thu, 19 Jun 2025 17:38:49 -0700
Message-ID: <175037992976.4372.2373294324696093637@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_173852_650209_2F09CB03 
X-CRM114-Status: UNSURE (   7.18  )
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

Quoting Xiaolei Wang (2025-06-18 23:21:08)
> When num_parents is 4, __clk_register() occurs an out-of-bounds
> when accessing parent_names member. Use ARRAY_SIZE() instead of
> hardcode number here.
>=20
>  BUG: KASAN: global-out-of-bounds in __clk_register+0x1844/0x20d8
>  Read of size 8 at addr ffff800086988e78 by task kworker/u24:3/59
>   Hardware name: NXP i.MX95 19X19 board (DT)
>   Workqueue: events_unbound deferred_probe_work_func
>   Call trace:
>     dump_backtrace+0x94/0xec
>     show_stack+0x18/0x24
>     dump_stack_lvl+0x8c/0xcc
>     print_report+0x398/0x5fc
>     kasan_report+0xd4/0x114
>     __asan_report_load8_noabort+0x20/0x2c
>     __clk_register+0x1844/0x20d8
>     clk_hw_register+0x44/0x110
>     __clk_hw_register_mux+0x284/0x3a8
>     imx95_bc_probe+0x4f4/0xa70
>=20
> Fixes: 5224b189462f ("clk: imx: add i.MX95 BLK CTL clk driver")
> Cc: stable@vger.kernel.org
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> ---

Applied to clk-fixes

