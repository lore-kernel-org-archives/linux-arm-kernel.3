Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89705CD6E6B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 21:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NpR+7wiWD/rAqFXwbqkFvRjwiyFhI/b0gfggdBOcQ88=; b=avLui+oSsDLS3Xg+82dMekdwp7
	tFyPPNP1ZIdzDdgtAyYqq/7ItA73HSDvBMaMDSPf/cft+hHOGgHiVxv+1xJbIH4KFYlquiZReXBnm
	tu166MonwCw1bcHzLUjdhvegfzxHHLQw+c/xabjgkoUyCejGOQCA2j3gADm0+QycoWCsuP+4w2rsM
	VdHxVeimIYVl/UQPoSdkPw5IftwAgxieziDS0CPtWKghiTZ/ntxo8EIZuXSY2CStt13IZ4zAdN9E8
	Howktx4pGf0qcmyYj5ODilc4uqleTA/P/448cCYUqkwikDe3IA8Up0btTy1oWJ6NAjreMZlsiNzc4
	v7uHCLrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUsnl-0000000FpXu-2pWY;
	Wed, 03 Jun 2026 21:07:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUsni-0000000FpWw-3Adk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 21:06:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0248160136;
	Wed,  3 Jun 2026 21:06:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 121991F00893;
	Wed,  3 Jun 2026 21:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780520817;
	bh=NpR+7wiWD/rAqFXwbqkFvRjwiyFhI/b0gfggdBOcQ88=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bMhURuLlHGDlvB6QpQTxQx5S9YrNGHnchwVLyYwGFIsRglLGagiWh+UzdrxJhbusX
	 hgyhmVSI4oRVvwLME9RPwi9D/i/qY39jQXCmIt2xFOI97GxoJIDAuLmhMK9IWYYaEy
	 Mg/guVntqWuMU0PvYosopL4pZ2VvCEpkgvNmVZsH2U0zwEwiVamCXKdtiBlllQqTMO
	 D8LIqrT+1IVf8Ye1HR3usgc+r1yJL+/JFqLaTazRGS6vUVTV55GvH+rGie0FUdN7yr
	 naRA6colzZeXFJDjmTjJyHO/PkMVbtI7TJUeFhn3Wpaf9tBFfUOp/bBLamQ/Rmmisb
	 QIYsNXsJn47cw==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	mark.rutland@arm.com,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] perf/arm-cmn: Fix DVM node events
Date: Wed,  3 Jun 2026 22:06:29 +0100
Message-ID: <178051622492.438149.8722719507583787401.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <1af20ba3fb35cc507e0d74408675b50340feca39.1780065225.git.robin.murphy@arm.com>
References: <1af20ba3fb35cc507e0d74408675b50340feca39.1780065225.git.robin.murphy@arm.com>
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

On Fri, 29 May 2026 15:33:45 +0100, Robin Murphy wrote:
> The new DVM node events added in CMN-700 also apply to CMN S3; fix
> the model encoding so that we can expose the aliases and handle
> occupancy filtering on newer CMNs too.
> 
> 

Applied to will (for-next/perf), thanks!

[1/1] perf/arm-cmn: Fix DVM node events
      https://git.kernel.org/will/c/5936245125f7

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

