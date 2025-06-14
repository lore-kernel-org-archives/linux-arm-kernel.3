Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D08C7114A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Jun 2025 17:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6kTHFYuxYKp69nwDKTKyVzJ+iQ9d7XQa28YEsKxku84=; b=y2v5b4olXUSoIplG1Mpy7OLPxs
	FNHlZlnBIQx5gCB4uTCaBjK3z/gjRm9h1DS7emFTwv8kETQO2OFOYbGoYNca6hE0Kheofjn2iT9pa
	z49o3zi4/AeyzJmrkp9z45A9tjmc74JEeBxxdljylVotKvVEgXbaXqj9S07FFrhkTzROLQyMiD7uN
	TC5imhMz4XtQA4fanHINhFL5fLymV43we7PidtccmmNSc82ant+JOBM4uqYuH8B/Egje4UCU/JBLP
	+knUgrpeXSWwNBt+t/i2+l1WOsZ0J+/pKacwavBpGcco6CrgI4jDzPo9eu/QPwdLXpcAv9UkNKn1z
	owiJ170Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQUUq-00000001ZOo-2Rrw;
	Sat, 14 Jun 2025 17:16:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQUSf-00000001ZKP-0atb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Jun 2025 17:14:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 476F15C58E0;
	Sat, 14 Jun 2025 17:12:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79EEFC4CEEB;
	Sat, 14 Jun 2025 17:14:31 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id AE39F5F755;
	Sun, 15 Jun 2025 01:14:28 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20250607135029.2085140-1-wens@kernel.org>
References: <20250607135029.2085140-1-wens@kernel.org>
Subject: Re: [PATCH] clk: sunxi-ng: a523: Mark MBUS clock as critical
Message-Id: <174992126867.1032609.10087338535850688863.b4-ty@csie.org>
Date: Sun, 15 Jun 2025 01:14:28 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_101433_228969_5DB846F9 
X-CRM114-Status: UNSURE (   8.69  )
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

On Sat, 07 Jun 2025 21:50:29 +0800, Chen-Yu Tsai wrote:
> The MBUS serves as the main data bus for various DMA masters in the
> system. If its clock is not enabled, the DMA operations will stall,
> leading to the peripherals stalling or timing out. This has been
> observed as USB or MMC hosts timing out waiting for transactions
> when the clock is automatically disabled by the CCF due to it not
> being used.
> 
> [...]

Applied to sunxi/clk-fixes-for-6.16 in local tree, thanks!

[1/1] clk: sunxi-ng: a523: Mark MBUS clock as critical
      commit: 713d48878e8a5e4bcca6355324f943eb72cd2c84

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


