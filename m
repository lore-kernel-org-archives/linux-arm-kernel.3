Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C670ED58094
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 12:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xsTV/loYrY62LYDuJNo37p0oBX0hVto76KaPCQGmTYM=; b=ekxmXSqH0DwagXiiq/LfHewxCR
	+Fmka3n1JVcS4HaocrHj93lrf/6Kys8CVV3iTwVitPfcdjOEHzi6Humz15lMr/HAo+X41WwCmg7bN
	i43n2U/VSwCI8Py8TABFszuELdij1QJdSN26BsxgsFTvBJpBKXxB9HMs71XMAJAft8534iKs8MRVP
	DAL3NjRJuN+T0iRdcrI2c3WltwFqtXp7zd2S66PifBGWL3XSzp2sA1owFuKJ0T3Gsd9TNWri7x1da
	Ug/0AhXffRNqmW7mlIuzXzidZ2Ux7GiVQAJoCF8UK7WWt3FbcyMJ/nG5XaToucyu0zogpCummikQ/
	ip0qtmuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFYaw-000000082m4-0bDV;
	Mon, 25 Nov 2024 12:53:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFYZy-000000082cr-3OVg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 12:52:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C50E25C5AE2;
	Mon, 25 Nov 2024 12:51:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2021C4CECE;
	Mon, 25 Nov 2024 12:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732539158;
	bh=Hvasdb7Y1B9JNzgx80X5SPlj6UThep3Ym8D7Ij/hhvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n5CcNBqh3Hb+M0sCt6BGXda2YzgJG5Ut9EFIKKRwaTfRPGbPAomowUnQ7uhh/fkBJ
	 a/qq7CgwjXByye8wN8ZS2EH8PHLFkr+3Gj9zFMcnoNX4xSz1CpZ6rFTsS5/X1qglWA
	 CdoA/IqOWY+MyR/yH3k6vL7+I4K3WCYb0UEeULXhHmA6oNxkT9e+qbShVy9vDsdl0c
	 rhUW8IsCz6Cyg90jfWUy3Z2tDaSKvF2L5HQLuBfEtd7LVmd8UO/uu+68C4R5R/9dbB
	 qSzEU5UBswIL+lErWcBbvh4se5NcB+wnjPuwniiPTaNsy7lkTIgw5jBN9xj9EzQJtR
	 w6fjbgaJp2LhA==
Date: Mon, 25 Nov 2024 12:52:33 +0000
From: Will Deacon <will@kernel.org>
To: Namhyung Kim <namhyung@kernel.org>, catalin.marinas@arm.com
Cc: Mark Rutland <mark.rutland@arm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Stephane Eranian <eranian@google.com>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] perf/arm-cmn: Ensure port and device id bits are set
 properly
Message-ID: <20241125125233.GB858@willie-the-truck>
References: <20241121001334.331334-1-namhyung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241121001334.331334-1-namhyung@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_045238_887996_B6AC3B34 
X-CRM114-Status: GOOD (  12.40  )
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

On Wed, Nov 20, 2024 at 04:13:34PM -0800, Namhyung Kim wrote:
> The portid_bits and deviceid_bits were set only for XP type nodes in
> the arm_cmn_discover() and it confused other nodes to find XP nodes.
> Copy the both bits from the XP nodes directly when it sets up a new
> node.
> 
> Fixes: e79634b53e39 ("perf/arm-cmn: Refactor node ID handling. Again.")
> Signed-off-by: Namhyung Kim <namhyung@kernel.org>
> ---
>  drivers/perf/arm-cmn.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Catalin -- here's another perf fix for you!

Thanks,

Will

