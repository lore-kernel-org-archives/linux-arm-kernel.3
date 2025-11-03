Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B648CCCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 14:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jh6oRvdQxJAwqX/FL6kclgRUMdVsjQwhl4bwShjb1/4=; b=NuX+8cnbMRtZIAQT8BBBy8H9Vb
	1gwX/iVHTBVMn+lkbe3OlgZWvVHVJjKst8uW90EX8EsFCTBX98bvW4zyAPhl2FnGEBLSWkOEkbK2P
	0ZEaM6e/D91R4KdrF7OnasdWP5uvQZwdAZXOhezgGkh6Z0HYHoGnQ5JE3nxxtrGT2yYk1dn2ISECn
	c8J6ZZusdVuolHZWQHftxzGKpnGaH/30QQSTdH6ELx2sGrlbnafzOjACmJ8Asq9KT0rPBXcArP8pp
	LiImB4tbjV/ULSAxa5+1AN9DIimAZODqTR3Hr2zYWRIRQrTPbUAI9GD5CziEZ2Bn4LzNWhP4FQCM6
	6J2K3uyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFw0T-0000000A3sG-3RO8;
	Mon, 03 Nov 2025 14:58:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFw0R-0000000A3rJ-2Qu9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 14:58:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D9AEB43317;
	Mon,  3 Nov 2025 14:58:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95E27C116C6;
	Mon,  3 Nov 2025 14:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762181882;
	bh=CYDpxBvkVz9w2ysPRImaQH88dnUGKrKx1nckOa0sjFI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lgJKgTx0D1cKQoJDFMjvJqJx6QQPSDfq8+pfzwO5Pa6V8F6hSThZl9cneNLyBu/3t
	 vGVeaOXbGnoj3C9cJBZXYVD0C/hnXEo3J28CHk12gp1/6t2n6pozLUlQO0TRZCWNvd
	 Y7Z8JoQWBYGw58c4a8WUo/ygqCCIZzbwJrcCi8MeI/OxV2NdrAWTx8r1Kb0FvcexeC
	 rK4WoOxTFTn+j4KPiAryG0eevUyClnCjY901PFRGQ/zVmF2gTbr3k4oy4173Eu7yRQ
	 Uo+W4XAVKQ/KmOiXjbmmlrbop8sOlrYQRaA+YwWECtT4Uv5AwUwzr8O7stnIHF1dZZ
	 PpQnOT6kcIiCw==
From: Will Deacon <will@kernel.org>
To: mark.rutland@arm.com,
	robin.murphy@arm.com,
	james.clark@linaro.org,
	ilkka@os.amperecomputing.com,
	u.kleine-koenig@baylibre.com,
	bwicaksono@nvidia.com,
	suzuki.poulose@arm.com,
	Ma Ke <make24@iscas.ac.cn>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	stable@vger.kernel.org
Subject: Re: [PATCH RESEND] perf: arm_cspmu: fix error handling in arm_cspmu_impl_unregister()
Date: Mon,  3 Nov 2025 14:57:47 +0000
Message-Id: <176217960447.2905062.12628399125158047270.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251022115325.25900-1-make24@iscas.ac.cn>
References: <20251022115325.25900-1-make24@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_065803_635238_A54DDCBF 
X-CRM114-Status: UNSURE (   8.31  )
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

On Wed, 22 Oct 2025 19:53:25 +0800, Ma Ke wrote:
> driver_find_device() calls get_device() to increment the reference
> count once a matching device is found. device_release_driver()
> releases the driver, but it does not decrease the reference count that
> was incremented by driver_find_device(). At the end of the loop, there
> is no put_device() to balance the reference count. To avoid reference
> count leakage, add put_device() to decrease the reference count.
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/1] perf: arm_cspmu: fix error handling in arm_cspmu_impl_unregister()
      https://git.kernel.org/will/c/970e1e41805f

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

