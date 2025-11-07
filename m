Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF3DCCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 15:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fh9j7k8UqW/gpHPy8PqIYG9VRHE3rG0tmM7DDgFcx/U=; b=2Q7y0RAt1KULevlv7OYlz+afX+
	eqsa29M5gCsYjxxrF2MQMCUcgXWhi4BoV5L6nB8FBmr2kDRHscXzgioUWXvFHngYwoJfZ9Jd8sVVP
	Hhmw04o2W9H66WWTqgfnC7w49rjpnadOuBEzKEXHeUljnjCWWzO9lZPqLA7gfo3iAgXHiMg37ei6k
	zAAuDXgJx0zw5cyQzz6LUXbSmuvRJo/fz29fMMk+XuxdlhzBhnRWQGFVcZmCIHwIPxgoUcA6qp9M2
	/t62pgD+QG9YLRV968e9yt7VanJN84NA9HkAJkGvXth+wi5A5bLI2rp10nn8pUGuhCnmiQhZrLUGZ
	Mfs7E89A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHOn6-000000001E9-3qJu;
	Fri, 07 Nov 2025 15:54:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHOn2-0000000019m-2ZZZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 15:54:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0684B61924;
	Fri,  7 Nov 2025 15:54:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11892C19424;
	Fri,  7 Nov 2025 15:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762530855;
	bh=lb83lhweSkA7BZqrfWpJIk3UrmRPFS6Bj2PpOQYBnzE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U0roxxcuC0rp82gBkccYGU/uLqP4eFR49Edqa3xYRzeoA8k7S9RsbvmCQF9eX4WsN
	 lnRYJUvSLcavQCuh8C1rv76T6I31uwvJb/ogwoI9+RqVU6oyZFb1qXUqRpqZlgMofH
	 Eyw+7eAD0LhB8hLScLPQU1mLtV+HEUvs0/92nnTDJanMfjNQktpYc/WPW1wkSBUkbk
	 RMzpXJjVIcKM02OJAv3u3w/XpYna9lExKm3avmT9dHlTWT2xwURB5t6xhCy+m+Lgxm
	 N5Gy7DI1wA8WKKFolwoP196hMg+svREaoL+TbX1PkKDAoq4ISsVecdt8PGxKLjc++f
	 T1YTqEAq9xDHg==
From: Will Deacon <will@kernel.org>
To: mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	Yicong Yang <yangyccccc@gmail.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	sudeep.holla@arm.com
Subject: Re: [PATCH v2 -next] arch_topology: Provide a stub topology_core_has_smt() for !CONFIG_GENERIC_ARCH_TOPOLOGY
Date: Fri,  7 Nov 2025 15:53:49 +0000
Message-Id: <176252310281.582999.10835429581776892031.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251105103849.4093-1-yangyccccc@gmail.com>
References: <20251105103849.4093-1-yangyccccc@gmail.com>
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

On Wed, 05 Nov 2025 18:38:49 +0800, Yicong Yang wrote:
> The arm_pmu driver is using topology_core_has_smt() for retrieving
> the SMT implementation which depends on CONFIG_GENERIC_ARCH_TOPOLOGY.
> The config is optional on arm platforms so provide a
> !CONFIG_GENERIC_ARCH_TOPOLOGY stub for topology_core_has_smt().
> 
> 

Applied to will (for-next/perf), thanks!

[1/1] arch_topology: Provide a stub topology_core_has_smt() for !CONFIG_GENERIC_ARCH_TOPOLOGY
      https://git.kernel.org/will/c/7ab06ea41af5

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

