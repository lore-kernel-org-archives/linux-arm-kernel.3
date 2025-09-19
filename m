Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E2ECAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 18:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cxT6TPuVr6VNfT0qVSTFqMoTa3oTyrVPwrAlb7CQBJA=; b=vPxUTbRA+Sr1nekzP/6woiD2J2
	BUVpm/33Dur4pPMBfILLej69ik71d8aJoqeB8xz8jdDLIIF6I2Eh9tH745ys71mzJztrQSrh2RTz4
	t1tI3h9HGHRfCxSdhg6RedNbnKmYAw/ORwLPdxUjX/IzGmfTMlNEZcJFpEbeVemCqHl9EWOhOkol3
	++e3hom1kyQQMbAF4oEj58ZZjn1DasaCmHpuSsFTSMdOCl41mLLaqFxIV4cXHB0Gjp4JytE4kvPRl
	2KCGKA3zwW3gQc5TYajYLW1JHCZxSakCjIAAegFiP6zjIYoLD5IjmEkoAVWUA0l9f7wM/uoXIRTk2
	zbhC2XvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzg5r-00000003nuS-1eau;
	Fri, 19 Sep 2025 18:44:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzg5p-00000003ntr-1TR5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 18:44:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F0B3944175;
	Fri, 19 Sep 2025 18:44:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44870C4CEF9;
	Fri, 19 Sep 2025 18:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758307464;
	bh=TvNct0puZkUduc5sUbES816mFOXImptqyANagH2X/rg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P3cUVJEJqWFBU7ww0WmUJbD83nfjVDNdDRJtPJeu4fS51UMblHAO+y1IiOgLm2w/t
	 TUbpudm+KVhuUZBN44nNp+D8YU57QIok0SMUNjlWzyovX6d8n7Fv4r5utvbTcFzm80
	 wsREd6wbVor91Lf68a/PZROm7ttTQdnfeGEjXJ3POhix1+nAinVdjzdkxQC+oRli2s
	 VhBqmPEGC1qZJkDMLyBb2Z8h32wupJupI0gO+bMuua+R2hebikzvZwbHAWb/jmc24+
	 3yf3+/nPuXtNraKM+5mpi0YKhXJ3duaJ7nikdVjjcFh09+FOmsu5zGh8YRQrhL79kt
	 5Dw3rKMVLZaBA==
Date: Fri, 19 Sep 2025 19:44:19 +0100
From: Will Deacon <will@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: catalin.marinas@arm.com, akpm@linux-foundation.org, david@redhat.com,
	lorenzo.stoakes@oracle.com, ardb@kernel.org, dev.jain@arm.com,
	scott@os.amperecomputing.com, cl@gentwo.org,
	Yang Shi <yang@os.amperecomputing.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v8 0/5] arm64: support FEAT_BBM level 2 and large block
 mapping when rodata=full
Message-ID: <aM2kg49jBia4VKYr@willie-the-truck>
References: <20250917190323.3828347-1-yang@os.amperecomputing.com>
 <175822779944.710258.10028837182267037801.b4-ty@kernel.org>
 <fc43aa07-d4ad-47d5-8381-61d4a9b8c467@arm.com>
 <aM0-FQlepoxxGkRd@willie-the-truck>
 <ceaf604f-8ad7-4e19-812e-7eeace10d835@arm.com>
 <aM1E34lRjKg7nlRu@willie-the-truck>
 <38fa4717-9105-4bca-a2cd-914afc109570@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38fa4717-9105-4bca-a2cd-914afc109570@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_114425_407846_33B3B8E4 
X-CRM114-Status: GOOD (  12.82  )
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

On Fri, Sep 19, 2025 at 01:00:49PM +0100, Ryan Roberts wrote:
> On 19/09/2025 12:56, Will Deacon wrote:
> > So how about we:
> > 
> >   - Remove X4 from the list
> >   - I try harder to apply your patch for secondary CPUs...
> >   - ... if I fail, we can apply it next time around
> > 
> > Sound reasonable?
> 
> Yeah that works for me. Cheers!

So after all that, the conflict was straightforward once I sat down and
looked at it properly.

Please can you check for-next/core? I forcefully triggered the
repainting path in qemu and it booted without any problems.

Will

