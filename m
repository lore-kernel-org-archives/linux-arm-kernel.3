Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7693FCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 16:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TFle1BW2Sx8YTaaKp1ZCm3KZCcA6Cki3vSd6z3fVdN8=; b=PGIKYiydNl8YTW1uWGhn2YaM43
	vcBRktG3x19iKrkAH9Ilj4YSAhEVDtjFJkjQED6NjzVYcn5y+g8nsODuzfUR1c95EQf7V6Q11CIQs
	y3ZH41Evc9DHItxH6woQNpRabnO96u4WCddbTE1/durvAMNrNV9E78I0dicrMYonI4qLeoyOy9pOR
	UGvVIYQSUn1DMJiL/p0KETW/z+s/sKYpFcCt+34s40RwpswKH2c1BnbiVvxBHFrUX+lZCz9tNpYHu
	8mvKLXy50BU8EiwPvuPMfHjqhAtp1E6VJRzyC/ztoGaGUN653rs2ZwGqAdY5VoNF/COmMN7kIrRXe
	a6RCdwEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHjZ-00000000fB5-2FAd;
	Thu, 18 Sep 2025 16:43:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHjW-00000000f8t-2Vnh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 16:43:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0998A60207;
	Thu, 18 Sep 2025 16:43:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 614DFC4CEE7;
	Thu, 18 Sep 2025 16:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758213825;
	bh=53e840m3n/a/k8+36ELCSNVhMPXJKux/vYQJuLq6rIQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lvbzvZYNqbo5dVsKqEPtCOifuWE+6YUGR5bO+mXIiwQbXCZu5Pj8w3oQBfmZsIZmK
	 DgGZ5T7s5qikDeWSgJ5J20ymqdy+n0nL9wqkVhJJ4ieJCF6ovXii9V1VGgwTtWHPR4
	 znRp+IdXAvbvpNi7is2T+K21JE08cLYVzoUMXH9bl8Rr8FzXyGk8qx1P6T985oci35
	 q0kX7fEzFTMdA/A/6XjUsmNVO+ZJ6n2JhPrm03GaevDXTqeRXS4W/Rg7+ndkF9pc70
	 DMWYtFi6f2A8v7hVgvoT9Dm4zp630JQOrgu12WgI5rWzC0WWrttpU3SOhqLAEB3wxH
	 SdIK8I2tlCEjg==
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
	hejunhao3@h-partners.com
Subject: Re: [PATCH v6 0/3] drivers/perf: hisi: Add support for HiSilicon NOC and MN PMU driver
Date: Thu, 18 Sep 2025 17:43:12 +0100
Message-Id: <175820367089.3477070.15258053757814970418.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250814091622.23269-1-yangyicong@huawei.com>
References: <20250814091622.23269-1-yangyicong@huawei.com>
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

On Thu, 14 Aug 2025 17:16:19 +0800, Yicong Yang wrote:
> Add support for two new Uncore PMUs to monitor the events of the system bus
> (by NoC PMU) and the DVM operations (by MN PMU).
> 
> Change since v5:
> - Rebase on 6.17-rc1 and update the maintainer entry
> Link: https://lore.kernel.org/linux-arm-kernel/20250717121727.61057-1-yangyicong@huawei.com/
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/3] drivers/perf: hisi: Add support for HiSilicon NoC PMU
      https://git.kernel.org/will/c/e31c0eb10388
[2/3] drivers/perf: hisi: Add support for HiSilicon MN PMU driver
      https://git.kernel.org/will/c/2257798498b3
[3/3] MAINTAINERS: Remove myself from HiSilicon PMU maintainers
      https://git.kernel.org/will/c/542342d27122

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

