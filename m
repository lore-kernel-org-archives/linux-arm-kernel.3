Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDBA6E77182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 12:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f/eUtBAHx6MS1dX7eeAudCi0CALBCFNE6mgKA9s28LY=; b=qundz3QZBPiWhaX4TIDT/suiAV
	3YUVoHNvbd/sG0FEK51o9+GQzpzceMk5raZollcZSX7fX+wcSWOsDuVs3XD3qd/aS5mlPHifCM3P7
	g5g7Apq1zwyed7zUuFhDIpGPb38ag/nG3MgiPLDtx5WUqVjWVtWp3b+ApbmQ/FGTf8ztQ/7zn5/o3
	zaY1LfsxyvGAJqqiB6H1TdH1jltztq/WwLGG3c1Xw1qQGEi5enRsv4uOG2Sw0vUV0VigQ2jMlqCUx
	Bi0plMGXdX+pNMPj1JsjLDH7WnzF09+FUef3Kg+ClOuQPjm/t0RMjjSgTtAQn43d7puvkTK1z8ZBb
	KYjccMfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKzL2-0000000BQRW-3zc4;
	Tue, 10 Dec 2024 12:27:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKzHT-0000000BPlY-3hDM
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Dec 2024 12:23:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=f/eUtBAHx6MS1dX7eeAudCi0CALBCFNE6mgKA9s28LY=; b=qdfGUwAvEEQV2wUx348q6k4+P9
	VCkjJ7pobieCqHDS74H/oP4A6dG3+QbaIJB7hrqGzA8iynjLbRkjSrMSVu3U6YeTsH+LJFo0b8XMe
	7wSDCiuHwKTcIZEstwTFf/2dX7bnDTeQ6tsdGnxpAAP+4YrguPKw9vi1RANyIPzpqi8YyfZWXDOXi
	nYz68Gi833sXAbtAYn8DHqTr6b02NpKIy+aeX2r2e7G/oZjdUn6XQ4zQXpmnHNvOO/mbeAmIMi6qz
	McIYLZeit79p2zVsxFhWP6Gyk7DxAyUrSBPmPks9wuocCjvCEqN7W8BEGfLzb2dYwvGfpFYnAYCsC
	R+7uT24Q==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tKzHQ-00000003fnB-0fBo;
	Tue, 10 Dec 2024 12:23:56 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id AB96230035F; Tue, 10 Dec 2024 13:23:55 +0100 (CET)
Date: Tue, 10 Dec 2024 13:23:55 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	aruna.ramakrishna@oracle.com, broonie@kernel.org,
	catalin.marinas@arm.com, dave.hansen@linux.intel.com,
	jannh@google.com, jeffxu@chromium.org, joey.gouly@arm.com,
	kees@kernel.org, maz@kernel.org, pierre.langlois@arm.com,
	qperret@google.com, ryan.roberts@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org
Subject: Re: [RFC PATCH 12/16] arm64: mm: Map p4d/pgd with privileged pkey
Message-ID: <20241210122355.GN8562@noisy.programming.kicks-ass.net>
References: <20241206101110.1646108-1-kevin.brodsky@arm.com>
 <20241206101110.1646108-13-kevin.brodsky@arm.com>
 <20241209102440.GI21636@noisy.programming.kicks-ass.net>
 <75a345d4-78ea-4434-a4cd-3f2095ce2b31@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75a345d4-78ea-4434-a4cd-3f2095ce2b31@arm.com>
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

On Tue, Dec 10, 2024 at 10:27:56AM +0100, Kevin Brodsky wrote:
> On 09/12/2024 11:24, Peter Zijlstra wrote:
> > On Fri, Dec 06, 2024 at 10:11:06AM +0000, Kevin Brodsky wrote:
> >> If CONFIG_KPKEYS_HARDENED_PGTABLES is enabled, map p4d/pgd pages
> >> using a privileged pkey (KPKEYS_PKEY_PGTABLES), so that they can
> >> only be written under guard(kpkeys_hardened_pgtables).
> >>
> >> The case where pgd is not page-sized is not currently handled -
> >> this is pending support for pkeys in kmem_cache.
> >>
> >> This patch is a no-op if CONFIG_KPKEYS_HARDENED_PGTABLES is disabled
> >> (default).
> > Should not this live in pagetable_*_[cd]tor() in generic code?
> 
> This would certainly be preferable but it doesn't look like such helpers
> exist for p4d/pgd. For p4d, we could potentially handle this in the
> generic __p4d_alloc(), but I'm not sure we can assume that
> p4d_alloc_one() won't be called from somewhere else. pgd_alloc() is
> entirely arch-specific so not much we can do there.

Can't we add the missing pagetable_{p4d,pgd}_[cd]tor() functions. Yes,
it will mean touching a bunch of arch code, but it shouldn't be hard.

