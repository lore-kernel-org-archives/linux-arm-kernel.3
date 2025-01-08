Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D82DE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 17:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L6gXywkEdTAAy6NeJ3N7Lq537AGb6wNXiHu6b8ysW7Q=; b=zG2kheZSoNTsXSeNIm0s6Zxn6e
	uuOxYkQvQk/rQc0c6L9GYqEljP6b13HTbdcl2z1aqLgjCATMUUE7wozmEzsy5VIrnxgg8CGrm4eJ5
	aLsVCauAqNar53tnAETVfV+BSv3ZZQpT5STFUrPM4a8IHJWHHJQ7mPGkqM8KyEugwHpdp/jFs1Pth
	qd9CeVywxh9K4lNQK1Po4ESd2HuDuB8gO9/H6FgttW/wGMiXj97YdPAVD7lY6QM2zMLKQqb5JEjEl
	yZrXMOlem8WSl6eeEu66VN3M0Wfuw71FXhMYcXhK6Md153Kb2q5io1JTO0jUkzfzuAHCxOSZhKM+x
	9aT35rhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVZRh-00000009Idi-1MJH;
	Wed, 08 Jan 2025 17:02:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVZ5W-00000009DKh-3Yxi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 16:39:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 331F85C53A5;
	Wed,  8 Jan 2025 16:38:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D282DC4CEE7;
	Wed,  8 Jan 2025 16:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736354361;
	bh=J+EYpiBJHuyX5aAaI9Iol6ouFLxTwtCCoUhfJ7IJjTQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UsAD6jOaC1d4hf8gkheX9pxukZ83bh7EJ+AMitQh8ZT5F9+7KTZawaP+tD6qYYjjC
	 tIpBt6T2acW12lXWl9eJ1FZB9cGqJpv/nF6K9hkMpinW/vtfqEdbaLZpZRiiXjxdoG
	 iAUPqb5xrEiukEM0K28dvThS3GYTVmDEcRjD3U+CdpzeDCTEwi92exntqcAIbqTfV5
	 NUgvkwUkdyNZ6YN3CJo0IyxNqdKaHV50nUJchR9xU6lBRRY1OojyFJGVdPm6LB3QQv
	 plyGSItzIh2zWXT9gbDNeVe66hpCOeza2y9G3WmrypnwWWBHvqKPdvQqLuw/qSeGWO
	 iwcVeGasRGnAw==
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
	yangyicong@hisilicon.com
Subject: Re: [PATCH] drivers/perf: hisi: Set correct IRQ affinity for PMUs with no association
Date: Wed,  8 Jan 2025 16:38:57 +0000
Message-Id: <173627025346.295116.5863869511098804565.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241223125134.57885-1-yangyicong@huawei.com>
References: <20241223125134.57885-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_083922_928611_A9E7EAB7 
X-CRM114-Status: UNSURE (   9.31  )
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

On Mon, 23 Dec 2024 20:51:34 +0800, Yicong Yang wrote:
> For PMUs with no association, the hisi_pmu->on_cpu is initialized
> according to the NUMA locality but use a wrong CPU for the interrupt
> affinity. The CPU selected from cpumask_local_spread() can be different
> from the CPU by the cpuhp callback. Fix this by setting the IRQ affinity
> to hisi_pmu->on_cpu.
> 
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/1] drivers/perf: hisi: Set correct IRQ affinity for PMUs with no association
      https://git.kernel.org/will/c/555c6e9b03c1

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

