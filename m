Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA50E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 19:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9MlZNSuihMzsbpWH5zZsR1I+UuImjUXgbUhx3ezXKa0=; b=Z/eex6UeHZdY8YT51qxsPhc6/D
	skpGNl7N0DA9TPXBp43YBJQ9xQg0G6BBmVZTgN5FhppYBFZIyj1xVEbdyVuFvwsQYAVsYFBguD8WE
	karwI1AJmzoWNrkiBHRShpVMXxxNJIgvQuvOdsfNmlFP+SX1BAXkC7gPOw3R2k80YsMcVBwBEANr0
	ozyMMq5dUEk5cIWZVWrFMdz6qpG7iRwwiSTx0X6tnNzPz+t+0E8BMD2LksnZp6hSlBMGrHK40fz9B
	N1qNHZU1uFc2FzmqgZfSmWwk1hiEfJXsZTWLQA9pMza2ChZMQq6CIvHu4CDsnXZO5Gu9VfFj9T/dw
	vxTxBuRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVFeG-00000006Az0-2p3p;
	Tue, 07 Jan 2025 19:53:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVFd3-00000006AqR-0Jgi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 19:52:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7AD2D5C5D6C;
	Tue,  7 Jan 2025 19:51:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33F1AC4CED6;
	Tue,  7 Jan 2025 19:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736279560;
	bh=9MlZNSuihMzsbpWH5zZsR1I+UuImjUXgbUhx3ezXKa0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=pFTFQBHo3h4saiNnGCsllRyOcrDDUrPpocit4lCurwUEEubLaPeYTARdXT06mXJ96
	 A+t8NPXJKeG+RLLbzHxwgFGuHyOTdvQpVpFPPCu2J4edlKRdwMrGcpHjnEzMZzGjs4
	 0iZfmJM2rrNvCOSrjkU2VjBZZisKzaJqfGxVI0v901xzCgjgf40wv8zG5ER+RoIo5N
	 MJjG7+7odbuEbJrOliuFVEYztKKmDvI9xLYuBm++51wmpfoKrsq0/VEKFnUQTT1kD5
	 7l6sS6WfnpQN4lKvjpmtbWGt+tfgtchWYqtjQ+vSs8eIFSil/hLoELTHrduV0P6YGI
	 CFnLBTUmfKOMA==
Message-ID: <b35471953c18b7918103ed52432c4b64.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250106082937.29555-1-shubhrajyoti.datta@amd.com>
References: <20250106082937.29555-1-shubhrajyoti.datta@amd.com>
Subject: Re: [PATCH] clk: clocking-wizard: calculate dividers fractional parts
From: Stephen Boyd <sboyd@kernel.org>
Cc: git@amd.com, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Anatoliy Klymenko <anatoliy.klymenko@amd.com>
To: Michael Turquette <mturquette@baylibre.com>, Michal Simek <michal.simek@amd.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 07 Jan 2025 11:52:38 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_115241_164431_985A7BA6 
X-CRM114-Status: UNSURE (   6.49  )
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

Quoting Shubhrajyoti Datta (2025-01-06 00:29:37)
> Calculate dividers fractional parts to optimally modulate output frequenc=
y.
> Clocking wizard supports having multiplier m and divisors d and o.
> Currently the fractional parts of m and o are not utilised.
> For the pixel clock usecases a higher accuracy is needed..
> Adding support for m and o to have fractional values.
>=20
> Co-developed-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
> Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> Tested-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
> ---

Applied to clk-next

