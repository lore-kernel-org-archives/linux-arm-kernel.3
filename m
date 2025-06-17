Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC10C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 08:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zrZPx0STfRRus6zvHgDdFyqAJdk67cYWcmtLJpHw4IU=; b=rZb8l/RsAvybi/qp2eWiGV2KQz
	6C+Dj7ejx9xzA6hlzpipHJ5J3QTFOBPdGx2IvEskVsqcjf1wTkm2WaXGn9PgG/juBIw5IJzJzRsgL
	MrTng91O5rA9WZMs5FWqVtLqSTLry7ba4MmY825Y0F3OTIomX4xVyEQN0WMpxTG9KABpOOjttb7/O
	4zz61MNLoA1RiC01H0G0h1FKtcKXF8P/7NHpBrY4o6QsB1wMn6WzsjLF6IcGl9DSY++/rwNgDm+Bc
	h/m7Sm87Cabo8gFcNJDDctzl18+ekMnfwPsJhYfGhNoDsKuS0+Z4PqBzo4f6CQTVYdVza7SB5MExF
	leB3PKwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRS9E-00000006fbU-25Sg;
	Tue, 17 Jun 2025 08:58:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRS6u-00000006fK9-2ntk;
	Tue, 17 Jun 2025 08:56:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zrZPx0STfRRus6zvHgDdFyqAJdk67cYWcmtLJpHw4IU=; b=eNZLq3iK9iEUMstyXFzvy5k331
	OHkm3FQ2xTdgVZLc8VHxtufFGI874492yiXGzSeaZSAJBxpVxWdRA5f9tw+MItWmlaEEuBTV6p20V
	vQSNE9FczSKiR6my/nr5qm88gpbGw/tW+t+Y9GtSSjncJVVVB2pG5uh6NdpvGGx29JkCDZI/fz/IG
	5MvW6xm9MjfkaajvADUpp0h2AC+IRtSCM/Y8Fky660xzw6h/ToTrjZOA+7GQ88uoUeSRivc+ErY4Q
	gc4NNyAd8m0iEbd1dl+JJCZbu6uOgxjjjHEDqxXdU2staLV6I7XP9/ObeD3d56fDIJq7miHaNCXCX
	/NbJAFPA==;
Received: from 2001-1c00-8d82-d000-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d82:d000:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRS6q-00000003kd2-0y9V;
	Tue, 17 Jun 2025 08:56:00 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id EA703308523; Tue, 17 Jun 2025 10:55:58 +0200 (CEST)
Date: Tue, 17 Jun 2025 10:55:58 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Kuyo Chang <kuyo.chang@mediatek.com>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	jstultz <jstultz@google.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/1] sched/deadline: Fix fair_server runtime calculation
 formula
Message-ID: <20250617085558.GN1613376@noisy.programming.kicks-ass.net>
References: <20250614020524.631521-1-kuyo.chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250614020524.631521-1-kuyo.chang@mediatek.com>
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

On Sat, Jun 14, 2025 at 10:04:55AM +0800, Kuyo Chang wrote:
> From: kuyo chang <kuyo.chang@mediatek.com>
> 
> [Symptom]
> The calculation formula for fair_server runtime is based on
> Frequency/CPU scale-invariance.
> This will cause excessive RT latency (expect absolute time).
> 
> [Analysis]
> Consider the following case under a Big.LITTLE architecture:
> 
> Assume the runtime is : 50,000,000 ns, and FIE/CIE as below
> FIE: 100
> CIE:50
> First by FIE, the runtime is scaled to 50,000,000 * 100 >> 10 = 4,882,812
> Then by CIE, it is further scaled to 4,882,812 * 50 >> 10 = 238,418.

What's this FIE/CIE stuff? Is that some ARM lingo?


> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index ad45a8fea245..8bfa846cf0dc 100644
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -1504,7 +1504,10 @@ static void update_curr_dl_se(struct rq *rq, struct sched_dl_entity *dl_se, s64
>  	if (dl_entity_is_special(dl_se))
>  		return;
>  
> -	scaled_delta_exec = dl_scaled_delta_exec(rq, dl_se, delta_exec);
> +	if (dl_se == &rq->fair_server)
> +		scaled_delta_exec = delta_exec;
> +	else
> +		scaled_delta_exec = dl_scaled_delta_exec(rq, dl_se, delta_exec);

Juri, the point it a bit moot atm, but is this something specific to the
fair_server in particular, or all servers?

Because if this is something all servers require then the above is
ofcourse wrong.

