Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D321D116EA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 18:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nDiV3118Hte3SNzGBVwirCjWNJgjWTUakpmOLo5vZJU=; b=Puo8PZZSvk0jJHNp2VjiocPMxj
	a+b79dyaELiPnKD8XMY44nXRmm7tu9GYzxabbXZ0nAknVMS3kv3B7/SjECUolXXiACZGHjSmGSG2z
	+F/cE0rW9WPrgp56aaPMFj1QImyav8P2P9oCqLWL9Tluj+Mffw/SDZwKoFOcjio8rArCKsNaQoAFi
	mayC8O1iPf8osGXeMQiPQxTTCCMUeYkFgnn568cALKUlO3j5+VH6NZth1TaBSWRefYRAny9ic7xpY
	ZGuymNjVltJN2sHSJQ4XQ87OXPlUeyjgpEpDki2LfSCll6tyAFBlQw/6WXkUgYuMeCTM+lMt+oEQA
	o6YmtO+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP3Yh-00000000nUX-1DZJ;
	Fri, 28 Nov 2025 18:51:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP3Yg-00000000nUF-0NQS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 18:51:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 269C860193;
	Fri, 28 Nov 2025 18:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6DEBC116C6;
	Fri, 28 Nov 2025 18:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764355864;
	bh=SIi6xlzvsm8cMl61j4v56v1YyXD+xeqIVgA2tZCE8FA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qCEKmkIVtUHcHpsTbA/9xDVHBfWqtGGDZFW7aADLzdXaP7SiKGI+tZB5dYtDASWNY
	 UAR0wsSRrGuznwOnwztPSSKepCmMWtNGqkC3V4DA3LuAFbP1KGzDAvYLyTEuhiPQWh
	 TJa+DZARP2iOVDoDiY4qmHpN5OZ8vWUv8kXnPur14HrkuoKaQg+F9cb6SI/WNntYJB
	 lj/piguOGTYp16Z9HouP+LC3j99mHKMssEmr0v9Acohp+hyL8ELMrvWUtlKkGuxP7i
	 GanGD9IMcM/sGT0240ClA1RgM+EWGAbxJfMh3tLHWTsBscUIZfG/JRmebVzYgckCpg
	 GLbBI5QvLMwcg==
From: Oliver Upton <oupton@kernel.org>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	yuzenghui@huawei.com,
	suzuki.poulose@arm.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	Alexandru Elisei <alexandru.elisei@arm.com>
Cc: Oliver Upton <oupton@kernel.org>
Subject: Re: [PATCH 0/4] KVM: arm64: nv: HAF fixes
Date: Fri, 28 Nov 2025 10:51:00 -0800
Message-ID: <176435583514.14290.17319946187047529579.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251128100946.74210-1-alexandru.elisei@arm.com>
References: <20251128100946.74210-1-alexandru.elisei@arm.com>
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

On Fri, 28 Nov 2025 10:09:42 +0000, Alexandru Elisei wrote:
> Based on kvmarm's next branch.
> 
> HAF support for the software translation table walker was merged while I
> was in the process of reading the patches, so instead of comments I have
> these few fixes.
> 
> One thing I didn't touch is this sequence in hyp_set_prot_attr():
> 
> [...]

Applied to next, thanks!

[1/4] KVM: arm64: Document KVM_PGTABLE_PROT_{UX,PX}
      https://git.kernel.org/kvmarm/kvmarm/c/a3e927e1432a
[2/4] KVM: arm64: at: Use correct HA bit in TCR_EL2 when regime is EL2
      https://git.kernel.org/kvmarm/kvmarm/c/c560b0121d02

--
Best,
Oliver

