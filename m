Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1732F46C45
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 15:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jV4I2fI3EF4zhvz1GVrW7MNmD9EztnInVyA4Sb+eevo=; b=EwEv7RHEjcJg4p2blm+dhWX6dC
	iWaln1pLAWFbRRH1jY7ISdjaKhAtnD9EQN/G/Z8SMorX33TfbLWl476P9Z4O2EsArMt+RBO8jNiYS
	xfkNGeM5jImzL/o4osTXVAFT2u62btX9cAQhB8ljvEnDHzSWhC5SnD6tiOeWNnGmlM3wiWu2szmSd
	TMH+Mc40cltRadMZ5o3dP7IF1Thyfzzck/0a+3xf8l90+Uom4dlOtwqXUSUUalam2NtHBm1bz9sgc
	CXlmN+TX2buyA4SUKN7Rqq0uOz6Tfbbv0/gEzz7nk6efd3A6ARRNp33N44YdMdG5qJK7NLuEUGUEC
	H6zpdm/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9lal-00000005FYS-0OAN;
	Mon, 06 Apr 2026 15:10:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9lah-00000005FX0-2PJf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 15:10:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4C801444F9;
	Mon,  6 Apr 2026 15:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C639C19421;
	Mon,  6 Apr 2026 15:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775488215;
	bh=a9H95euzRHSCYqHgPIKYZyOiiucO5jELRBgLVxoXIgY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jmVNkwOw+0XuK/ojHgJRLspSi+3NXHnHEburM0NaEpodNfnuxkTWDJwSt5ZYktbdJ
	 M2xPOY28+tgaCCm7Ihfc4jbCZtdgtQ9JOHnLkH5rNPYQW5hW2dkr9vHnfyebPFNUHs
	 W6Wj1Tf1S7Hrjju2x7LX5TfEUdbhW/Y6/Q2QJHBrydqhKKpd3dNvxuThHvYfoCY93P
	 BSai2ZaNnw6ZPeNoGtO56uwPmIj4QaxdZm0x6GC3QDEgsayK05jaOXo10QoJJvz+ab
	 bVf/BRpyDx2T1PZskdjPd32Y0w3dl+r4ve5sfPTC1gg+vGB/URkRHnY/jGCYaQ3kmc
	 eSzwGSDUUTUJA==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH 0/2] hwspinlock: remove platform_data from subsystem
Date: Mon,  6 Apr 2026 10:10:04 -0500
Message-ID: <177548820152.2290739.409993519549727146.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401071141.4718-1-wsa+renesas@sang-engineering.com>
References: <20260401071141.4718-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_081015_700240_A1B5D802 
X-CRM114-Status: GOOD (  10.57  )
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


On Wed, 01 Apr 2026 09:11:38 +0200, Wolfram Sang wrote:
> This series removes the use of platform_data from the hwspinlock
> subsystem. First, the last user is removed because it turned out to be
> obsolete. Then, platform_data support is removed from the header.
> 
> This has been in a larger refactoring series before. But this
> refactoring turns out to be a rabbit hole where more and more fixes are
> needed before I can do the actual refactoring.
> 
> [...]

Applied, thanks!

[1/2] hwspinlock: u8500: delete driver
      commit: 392035c8b88b0198721e3b273f0a19ec2150710f
[2/2] hwspinlock: remove now unused pdata from header file
      commit: ad5fd5aeb65a4426635cf55ef06c96e60a66e648

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

