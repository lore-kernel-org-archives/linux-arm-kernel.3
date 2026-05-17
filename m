Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A85CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 11:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TepbalFreMdEFYnju/atDmgH69ftY0OuR+bDFY72TxQ=; b=0gDDc4+1BO03k8WdQZdoZoW+Bo
	Ap+Pqd5+fOQSqiXSwwrRLvVZU4+KNbn4c3FlWfLY56KQsKTTaYlLF6Unc80cb4PAq2LnsnhPYZKoA
	skULL0uOdQMr6rRKlspj/NAcPydvOiC67PXIn7pjlv1MHv/dvGYNFERdy53o/VFHSwvFctMBksG0h
	raKaiJb8+1SZ+5dRi2OYysJjGDSQnrQcymxxVHwr4ZvhrdjcaIDdf8zmrE3e870jkDvzpetgJY8uR
	tux9Jo+Y3iRWXWgk0f1R4C+oRwqvBR65MpT7d/G+TISBwu2YHlNpvAW6pkGos/a4rVoRlB5CGAd7J
	/cSGoeZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOZnk-0000000CcJZ-3sNo;
	Sun, 17 May 2026 11:36:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOZnj-0000000CcJQ-2m7H
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 11:36:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BD7C3600BB;
	Sun, 17 May 2026 11:36:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A606C2BCB0;
	Sun, 17 May 2026 11:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779017813;
	bh=g6Apzn4u313EzukCA+wWP7lCh0YVZoSdF8h+35KQL/U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kqmvU2NL5Rp83xGHXR0ltA7kmyoAtvN3jP6pY5W/Uqq7vVWoh5XuydouURN7Q5qe/
	 NvVRcv+uYqCg4b82co8kQ3k93DYXsEOMASC8m89W6BKeBY5HZyd5AlovaqY3OW4lk8
	 18vNWOgYt16UTG6ykqdkkq1TwEIuBcDb+zwu30XMamoidgdQXHiOss1R1JtsaPqdkS
	 Mpyk8eZWj+3M8Sl3YgEgFkK/RpF2eQE87jLIwwLMuUzwlBgScV3rM60wzd3aNqorDD
	 zspTFaSIiZtXPo9e86Jyp0+6EvxkIuhItlPJ/1hKPTQ7CBL7dYts2b3HxhskW5bUgI
	 kCkViuACEXBVw==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>
Subject: Re: [PATCH 0/4] firmware: arm_ffa: Move core init to platform driver probe
Date: Sun, 17 May 2026 12:36:45 +0100
Message-ID: <177901775932.3835515.4484747964630642694.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260508-b4-ffa_plat_dev-v1-0-c5a30f8cf7b8@kernel.org>
References: <20260508-b4-ffa_plat_dev-v1-0-c5a30f8cf7b8@kernel.org>
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

On Fri, 08 May 2026 18:54:14 +0100, Sudeep Holla wrote:
> This series moves the Arm FF-A core initialisation into the driver model by
> converting the core bring-up path to a platform driver probe/remove flow.
> 
> The first patch reverts the earlier rootfs_initcall change. That initcall
> ordering workaround is not a proper solution and potentially conflicts with
> pKVM FF-A proxy requirement.
> 
> [...]

Applied to sudeep.holla/linux (for-next/ffa/updates), thanks!

[1/4] Revert "firmware: arm_ffa: Change initcall level of ffa_init() to rootfs_initcall"
      https://git.kernel.org/sudeep.holla/c/1b4c1c4d75a8
[2/4] firmware: arm_ffa: Register core as a platform driver
      https://git.kernel.org/sudeep.holla/c/d10175dd517a
[3/4] firmware: arm_ffa: Set the core device as FF-A device parent
      https://git.kernel.org/sudeep.holla/c/8bdff2dda405
[4/4] firmware: arm_ffa: Defer probe until pKVM is initialized
      https://git.kernel.org/sudeep.holla/c/216d4772b411
--
Regards,
Sudeep


