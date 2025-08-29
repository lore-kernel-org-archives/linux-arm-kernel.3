Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A607CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a6gDTqY8gmR7TLsWTmNR3mVOCvZZAj7fvEDWXer7gWc=; b=Ho3Y2YU2CzUM4c6a93MJF0MM3A
	4ephl4mReLu2932QSIkohKG/CGhxIVkQHQZKPr1ua9L9RU3FwEs/f0CwfwSgvfcovSLfgjl1/oIju
	qdYjL49Oxha5hAlVmSjYaq54KdfHS+xVKiotI7yiHO+p+B5mXKwfSHlPAHMqfVZDxSgGr8ti9gCuw
	t2XZ3XtMxWmHAxyV4ZMwQ8TcELGc50Q4uuOuF+Vw4ubpI8YoeAGXi4jXvieP0khXpZpLI5jRDkyED
	Uj4xsS3zKMua6Gh3ge+0jbFQSLJMSklryiCNVfMqBbEZgUqCi/utjZf5Z2ZnQ124v2b3TKHP0awjj
	wTvaZNfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9kz-000000079qg-3RgJ;
	Sat, 30 Aug 2025 00:47:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us28w-00000006Qfi-0VIf;
	Fri, 29 Aug 2025 16:40:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E279601A9;
	Fri, 29 Aug 2025 16:40:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32F98C4CEF5;
	Fri, 29 Aug 2025 16:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756485601;
	bh=zvnB3Z6Dj3LY/2TUuCgT841hX93QqREtHKDShkn81yU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MKd3xnHKYvT8XbW6rYUQMjx8oJzM4P758YuW8JhXCsvRvYj+6SaSsNlj0Sv/7rt+A
	 tAnTMRrdEET528XVEVmu3g5iOYF22g4M3gEQ8aGL3dqYausrzQwr5kas2sCVcSx+vl
	 6cW9bONA5lR/jwZf+UHfIqcnbpuhq1w+H+z2LR1FNz2vyaQg42KYONkrFsfI2KDXjT
	 4+oNe6EhZ9gVH+qJvsnTxepRi8DjyYGx3xHPaLLz1Z+8fr4I3nc0Qva7tflwTc+QgZ
	 Kyu+cxIMDaNrG/pQjo5gmVFeBvkgu24uC7xdtjxdORZlt+HY1D8CvYMAvWZlMjyX4u
	 SwXCHaR0f/xjQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 340E5383BF75;
	Fri, 29 Aug 2025 16:40:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Bluetooth: remove duplicate h4_recv_buf() in header
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <175648560766.2276001.11700293691359487684.git-patchwork-notify@kernel.org>
Date: Fri, 29 Aug 2025 16:40:07 +0000
References: <be8edf7f8ba8dea6c61272b02fb20a4ac7e1c5a5.1756179634.git.calvin@wbinvd.org>
In-Reply-To: <be8edf7f8ba8dea6c61272b02fb20a4ac7e1c5a5.1756179634.git.calvin@wbinvd.org>
To: Calvin Owens <calvin@wbinvd.org>
Cc: linux-kernel@vger.kernel.org, marcel@holtmann.org, luiz.dentz@gmail.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 sean.wang@mediatek.com, amitkumar.karwar@nxp.com, neeraj.sanjaykale@nxp.com,
 linux-bluetooth@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, johan.hedberg@intel.com
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

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Mon, 25 Aug 2025 21:11:08 -0700 you wrote:
> The "h4_recv.h" header contains a duplicate h4_recv_buf() that is nearly
> but not quite identical to the h4_recv_buf() in hci_h4.c.
> 
> This duplicated header was added in commit 07eb96a5a7b0 ("Bluetooth:
> bpa10x: Use separate h4_recv_buf helper"). I wasn't able to find any
> explanation for duplicating the code in the discussion:
> 
> [...]

Here is the summary with links:
  - Bluetooth: remove duplicate h4_recv_buf() in header
    https://git.kernel.org/bluetooth/bluetooth-next/c/0e272fc7e17d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



