Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B148C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 16:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G5b//BkNIqes2hUhYdYRenDT4oNgUr9ZBFQ1l0UOe2I=; b=UhJyzZEEz3f/bkVcLhe8NMPD/Z
	RuTxxZAKiyag1fYTMXfc2oeyZ+ZmrE77LxsANy31X2UaAi2rrrXOHyfuuikz7vteyXAaXCFbDP7UL
	e3dAsrem+fQkfLuJA7xJEcQ6WKOKGGFIVQJVgcbZRovJisUwIg1k26rF9KrxgbPk1SzTZJeggBoXs
	zS2FMq4bK4QtWmgVPRKNiEgbqx7j9u3NUPuNOn2hLjfW3k3f2SGUNXpVYTXzAh4gqWjbVlEt+JxT2
	YgPA+a6wPK+hjACMN9oV2YLOIq2GQ0tLMuibG6pulpIhfO2IglxpEDQOCNZHWIXYXkVGJNuNWc/x/
	29uzDY5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZfF-00000006Uqk-14dK;
	Tue, 18 Mar 2025 16:19:37 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZdX-00000006UON-26GO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 16:17:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2EC00A48A64;
	Tue, 18 Mar 2025 16:12:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83D34C4CEDD;
	Tue, 18 Mar 2025 16:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742314670;
	bh=+fa8DsdkVEv2EwfFN1t5sni/y+6veh77iQj6yymkA8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nKuiv4fqNVq8iSizhXj59I6aunnpkEoeQzB6FQxsxzyV68p0P/5FlST6roMo6um2g
	 ZaqgOZ61tv2fpOwxMiTpqxIG7pZF6KvXpEijVZtqvsCFe84fC3mExU4ZN0Gt/zR2BY
	 UWdGqBcfKODPmCxO1mu9MEf1Qrm9ve2Kjwv2b56FIHTMsOVdiHLZzdsslcnLZsC8dn
	 JPD7eUJ+/MAPez89CCF1g6TdJjl8a6lsmyEY8IVPp/ZNpf4s8KWr3Vg5kWjcWIPTt8
	 tS7JoD8BiLkm2N6A7D7wccy5YHvDjOTby3QQkH+ctda4BlTUj+9x7OxBqYgRmgxsfc
	 3zsYLSsdA+2wQ==
Date: Tue, 18 Mar 2025 16:17:46 +0000
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH Resend] perf/arm-cmn: Remove CMN-600 DTC domain special
 case
Message-ID: <20250318161744.GB13981@willie-the-truck>
References: <67985e39f53b56385d79a4f1264cf7f9cacedb58.1742308248.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67985e39f53b56385d79a4f1264cf7f9cacedb58.1742308248.git.robin.murphy@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_091751_601253_A5749810 
X-CRM114-Status: GOOD (  12.77  )
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

Hi Robin,

On Tue, Mar 18, 2025 at 02:32:10PM +0000, Robin Murphy wrote:
> The special case for trying to infer the DTC domain for DTC-adjacent
> nodes on CMN-600 is fragile and buggy - currently resulting in subtly
> messed up DTC counter allocation - and the theoretical benefit it
> offers to a tiny minority of use-cases arguably doesn't outweigh the
> inconsistency it offers to others anyway. Just get rid of it.
> 
> Fixes: ab33c66fd8f1 ("perf/arm-cmn: Enable per-DTC counter allocation")
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/perf/arm-cmn.c | 7 -------
>  1 file changed, 7 deletions(-)

You've got "Resend" in the subject, but I can't seem to find the original
posting :/

Please can you point me at it? I just want to make sure that I'm not
missing patches, as you're unlikely to be the only person affected if
that is the case.

Cheers,

Will

