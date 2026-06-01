Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524FCCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 15:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gcTAWBNvqdXkfD29QAq7nzgqHlhaPiOnHfi0IMSEWoI=; b=JgKsREH9B2zpZQdV8YAFxSShBz
	kM4RI/jt2gtVl3ullb71bqgeDRuTdjhFkmZc5KFSxb1vIiy43sKqLqoRbLa9SwMOXg6xn7Oogzt0a
	5eIFad6tQvSh2OOsSigb4LEuCEIg+fxV39mQ2Ez2HHkiDKoEA1uBlKt8ectB9trso/+x/A8QSW4ei
	lHdTbTSabfE+cTSYN3q9UuYZ7HBY+DMuvc8zwzqwfMMyrftqzo4mfaYgmdRlG/rSu8Tts0NAa1Mek
	P0LffqySMi/eJXWnYWZmJyuN2Fuf/BsgQ7iUclM3TjeLRJfK41lli5r4Ur6uBEB9k3RE7xcX1VMNw
	qicZb06g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU4Ek-0000000BLYW-0z6A;
	Mon, 01 Jun 2026 15:07:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU4Ej-0000000BLYD-0tnr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 15:07:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5849B600AA;
	Mon,  1 Jun 2026 15:07:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 223881F00893;
	Mon,  1 Jun 2026 15:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780326448;
	bh=gcTAWBNvqdXkfD29QAq7nzgqHlhaPiOnHfi0IMSEWoI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h/31by74JtvqeAok898sE7u6ct+ZlsreTncTkVXMC192uEKtrrmLDOH3MlL58iI25
	 NLSB2FsjFiygFgzdH0E4B8dPVp+KS2JutTKb0PG7mIxGKNn474CUF8k11MOL95Ioo2
	 8nSkqQ6MY9X4Jx6VcGF66QomhmKEk8sQ0xN+6JaeTFsmdMuFEcx+m5TLjuEDYnbOrV
	 ShfxIpbl6/GuwefkbBR3GFGxwNF3x5MB7Vv+SS0WoD+6zYCEJ++ZkfJvELIcEzoc4u
	 1+8VXRIuKzskEZm5T71AleovmqkMsCXMLNtYo/awfJG8B+v63NcGw4e83nQdxAEINz
	 nvJqNqzIZeARw==
Date: Mon, 1 Jun 2026 16:07:23 +0100
From: Will Deacon <will@kernel.org>
To: Saurav Sachidanand <sauravsc@amazon.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	aghayev@amazon.com, juew@amazon.com
Subject: Re: [PATCH 1/4] perf: nvidia_t410_cmem_latency: fix cpuhp state leak
 on init failure
Message-ID: <ah2gKxlr8mBSSg9f@willie-the-truck>
References: <20260514010629.76558-1-sauravsc@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514010629.76558-1-sauravsc@amazon.com>
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

Hi Saurav,

On Thu, May 14, 2026 at 01:06:26AM +0000, Saurav Sachidanand wrote:
> If platform_driver_register() fails, the cpuhp multi-state registered
> by cpuhp_setup_state_multi() is never cleaned up. Add
> cpuhp_remove_multi_state() on the error path, mirroring the cleanup
> in cmem_lat_pmu_exit().
> 
> Fixes: 429b7638b2df ("perf: add NVIDIA Tegra410 CPU Memory Latency PMU")
> Signed-off-by: Saurav Sachidanand <sauravsc@amazon.com>
> ---
>  drivers/perf/nvidia_t410_cmem_latency_pmu.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Do you plan to respin this series, taking into account the comments from
Besar and Sashiko? If you do, please include a cover letter next time as
well.

Cheers,

Will

