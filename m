Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F0EE7848A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 19:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hFeQTIwLkBLFut8gN/A9s3LInDi6qLPdDqt2N/5R9vc=; b=BpAuIxU9178VCWWg+LbTyLVAIv
	nfGcdeF1r3ZnNxrdGqlWgmYVJS+opfSSfvUAN9XsfGovS+W21EGKvrNyTpoVg3KTtHA3rgPEnyVH+
	JC6iwZD7WgghvRE3Uic9nPG8MFr7HG0D0gAPOCqq+CnjwSgg0sXAtczIqwMScNqpUAmK3hapGAawa
	tvKbSOd0hjtXlAekyq2m+Ub3aLW6fXv2BZ6/tVO3fhaGIK5yY3mBJSF4DIGQ3U6yTDK6QK30oCZ1o
	jU4kUzJTLfAgRZ0YnhdlD3g8wOW99Zqn1Oo96CWjQa60S1xd9smnfL1mmS6/ooyVxCItiTeBSg2hc
	lLYAfIwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYUhe-0000000HMfs-3nMX;
	Wed, 24 Dec 2025 19:39:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYUhb-0000000HMfU-3UZ2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 19:39:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BD49143802;
	Wed, 24 Dec 2025 19:39:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12E12C4CEF7;
	Wed, 24 Dec 2025 19:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766605158;
	bh=SFNVJjMGA+Rw1CX7XZX/bsK0mjL7TEWtQKvqmufwgVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dWFhUSQVAHFYLWsFLPwpjObKqwdbeNaYbM+sKwtzlMhAXT7ohO8B4hZMYXMY1QS7A
	 HygfczNsC18Cy8J5GWq8tJEzK8EWzyH32XAHNbTYTAmyzsHnxgZEZnEDsc2ATnUDIr
	 6xxu+Y5ZMuYdRQwU7EsBuRo7RGDAcyC9PXDRrnPJUlNy9s+GFi9CvYeLkHTYqSXYQA
	 F8EyTA0CMLbBQs41yUGLw0LsRrL+IyQkZt79y0a+dxUtcEaf7jL7PEO3sd7OUxzxjB
	 nq6O0pjsO3hN0a8vdK92JzDy19ZUOwU57IY3DkOfA/sWMjQCMZn2MbR0M+uaUvtDZn
	 X38LTc4S7oiKA==
Date: Wed, 24 Dec 2025 11:39:15 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Besar Wicaksono <bwicaksono@nvidia.com>
Cc: acme@redhat.com, leo.yan@arm.com, james.clark@arm.com,
	irogers@google.com, mark.rutland@arm.com, jolsa@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-tegra@vger.kernel.org,
	vsethi@nvidia.com, rwiley@nvidia.com, skelley@nvidia.com,
	ywan@nvidia.com, treding@nvidia.com, jonathanh@nvidia.com
Subject: Re: [PATCH 0/2] arm64: Support NVIDIA Olympus for Perf Arm SPE
Message-ID: <aUxBY01uNp8gnEPq@google.com>
References: <20251219231325.2742580-1-bwicaksono@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251219231325.2742580-1-bwicaksono@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_113919_915961_DC1E7EBC 
X-CRM114-Status: UNSURE (   8.05  )
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

On Fri, Dec 19, 2025 at 11:13:23PM +0000, Besar Wicaksono wrote:
> This series support NVIDIA Olympus CPU in Perf Arm SPE.
> The first patch syncs the kernel header to the tools header.
> The second patch adds NVIDIA Olympus into perf's Neoverse SPE data source list.
> 
> Besar Wicaksono (2):
>   tools headers arm64: Add NVIDIA Olympus part
>   perf arm-spe: Add NVIDIA Olympus to neoverse list

Applied to perf-tools, thanks!

Best regards,
Namhyung


