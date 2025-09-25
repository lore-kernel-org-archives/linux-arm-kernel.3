Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CA3CAC5B3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 15:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u9YA1im3wEOb6KkWmE0LxXVTCU1RLEVMgcacqoHF18s=; b=XKxIo3SMcTRkbU1G+Xf21mJyNQ
	KkIQyecIeFyEg67Unot0QUcKP8wYpapZylyse+gVwU37x7LYNDIfKrjY//XJO+elU/HLI7oUmVZyb
	PBVLhyjbiFXZBdWleIB5AYdYmMq7KJLDsDwbt79kgFeCT37kSVcYdFTSUGvMcEjCNQEcrPcseu25K
	APhE/TMX/yqVXxOgVZiYbfS74CVhIdEsZ3uuGG1+VxZca+JSKdMfE6hZVhx2e6i2JrHk6z/D5zg6j
	977UdRShZgJIh0dgajoZAx0iNfijsOsEG/Q3SPZtHkns8BT0Eb102F0A9L0rCB33micYYnCD+ChD5
	6oA+7mSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1nxI-0000000Aevm-1TIs;
	Thu, 25 Sep 2025 15:32:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1nxC-0000000AerS-03Eu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 15:32:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5EA2C6110C;
	Thu, 25 Sep 2025 15:32:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74F7AC4CEF5;
	Thu, 25 Sep 2025 15:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758814337;
	bh=lOn+sMnUt7bIPp7bcc5ObRMjOMjVuljGt0F5zR+sAQY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=emLiPHCnSA5Cs7xjZUozLm9BjPLfe8KcKq6xpZlQjtIQpI4PrhCJCOMWCK8rUYLAC
	 /nK0eNvRQ4LzvMGt1WTaHOR/dJ1i9cwJasfhfUF8T+IJ0pLCOC5tfwCwxdMn7oC4/o
	 AIbUByDpAjl4kegFbETjHoHvitIpX5JHtrK+8OJ47Js2z4OnCKTRQOOrkntoRMJrXD
	 vfpHFc5WFjq0wkjQBLEn4xtPkQnB6w+PT84AZ3n7/ecdWcWwb9QVqqxjMwHATGjjC4
	 02MkHR+n17hA8t8YkZof0+0pn1Xkfbe9Z3g6+clraom3d8Kp4jRafNB3wZ/gNsJKBu
	 /lEgxl+xygLug==
From: Will Deacon <will@kernel.org>
To: mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yicong Yang <yangyicong@huawei.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	jonathan.cameron@huawei.com,
	prime.zeng@hisilicon.com,
	linuxarm@huawei.com,
	yangyicong@hisilicon.com,
	wangyushan12@huawei.com,
	hejunhao3@h-partners.com,
	yangyccccc@gmail.com
Subject: Re: [PATCH] drivers/perf: hisi: Add tt_core_deprecated for compatibility
Date: Thu, 25 Sep 2025 16:32:03 +0100
Message-Id: <175880472273.3260342.8602469761490497790.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250925033123.5836-1-yangyicong@huawei.com>
References: <20250925033123.5836-1-yangyicong@huawei.com>
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

On Thu, 25 Sep 2025 11:31:23 +0800, Yicong Yang wrote:
> Previously tt_core is defined as config1:0-7 which may not cover all
> the CPUs sharing L3C on platforms with more than 8 CPUs in a L3C. In
> order to support such platforms extend tt_core to 16 bits, since no
> spare space in config1, tt_core was moved to config2:0-15.
> 
> Though linux expects the users to retrieve the control encoding from
> sysfs first for each option, it's possible if user doesn't follow
> this and hardcoded tt_core in config1. So add an option
> tt_core_deprecated for config1:0-7 for backward compatibility.
> 
> [...]

Applied to arm64 (for-next/core), thanks!

[1/1] drivers/perf: hisi: Add tt_core_deprecated for compatibility
      https://git.kernel.org/arm64/c/a084c3c4a267

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

