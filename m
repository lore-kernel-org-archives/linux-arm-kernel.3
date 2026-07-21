Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 410BCC4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 17:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G1xIDTvgZ4xzm/y4PId7m0JZQk33VonJiCwyHQfI7w4=; b=Rt3Ot3refO3p5BpVwTZRg6AQ06
	SwlQF/2d3WQ3W4ifkGPauiC20nyF35KLYB9hhGjxLbggd1e5LqnAbFCl05eYyqt8pmuuIguHh2EM1
	SXZ5jjlScR1w5kLRks7X8ZaCyZozQ1PnRp6mxIVSbw5z5bTM1JubrBiEORaP8xhpxu2ayzV9HQwGy
	YOZgKjAd1k4MuRS6YLZzMYUPPYjJXHolS6c0v9Bi1R42+Lnk02TIudmfPHXmuSFWXQpHnDqcbKSOG
	SSOmB3jDSj2xtAhCy7k+1ugyUR6BPOjrwGXiltnUfkbEp7+rg9jgff2mx6AiOB7MPYUQjrwfzUe5q
	pnPqQijw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmE7g-0000000A2Mv-3sHA;
	Tue, 21 Jul 2026 17:19:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmE7R-0000000A2Ku-0PgB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 17:19:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4E559601D9;
	Tue, 21 Jul 2026 17:19:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B4931F00A3F;
	Tue, 21 Jul 2026 17:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784654340;
	bh=G1xIDTvgZ4xzm/y4PId7m0JZQk33VonJiCwyHQfI7w4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=I3J0SdG01kE6rdr1FSu1R3zVfFWQbw9lRLTQmNudH5bgjiecaV1WU3e9cbI4PODgS
	 JcLXBvcvUyvB3yAhtqo+NMtwWwPzRPyXmK1U7ci2hsczYXIu4q27naG31eVrKgNDRF
	 hWec1Gj65tCJhT52Ls0zJbj/0dkIPJJYez8BEz1JSt7zORXlLOyVdFBsfRc+n9h7VV
	 lxDcsuVVJ5m4i5x0rUf+DbxnOToPhxJbtZmh7UEBwhew0pb2twuYLkcBELI6+aVRh/
	 9ErKfk5dYyOkutA8RIta4NSi4Ddu12+E92rzib/ScfS6tLJQEEZsYl+sRZWBsfO+e+
	 2OeMOHuTUBRPg==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	jic23@kernel.org,
	Richard Cheng <icheng@nvidia.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	ryan.roberts@arm.com,
	ardb@kernel.org,
	kevin.brodsky@arm.com,
	anshuman.khandual@arm.com,
	yang@os.amperecomputing.com,
	chaitanyas.prakash@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	newtonl@nvidia.com,
	kristinc@nvidia.com,
	mochs@nvidia.com,
	kaihengf@nvidia.com,
	kobak@nvidia.com
Subject: Re: [PATCH v2] arm64/mm: Check the requested PFN range during memory removal
Date: Tue, 21 Jul 2026 18:18:39 +0100
Message-ID: <178464727167.1304664.6289495269821621329.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260721100026.10408-1-icheng@nvidia.com>
References: <20260721100026.10408-1-icheng@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 21 Jul 2026 18:00:26 +0800, Richard Cheng wrote:
> prevent_memory_remove_notifier() advances pfn while scanning the requested
> range for early memory. When the loop completes, pfn is at or beyond
> end_pfn. Passing it to can_unmap_without_split() therefore checks a range
> after the one being offlined.
> 
> Consequently, a valid request can be rejected based on the following
> range, while a request that would split a leaf mapping can be accepted if
> the shifted range can be unmapped without a split. This was observed with
> CXL DAX memory, where the final memory block was incorrectly allowed to
> be offlined.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64/mm: Check the requested PFN range during memory removal
      https://git.kernel.org/arm64/c/285f90a4d1141

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

