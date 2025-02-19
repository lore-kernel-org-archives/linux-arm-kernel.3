Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF95DC021B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 23:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dqGmOu/NS7eKBytFNGFBFNPW8aULJSlltgkG1iMsqPY=; b=boL9gbgsWgTdbPCZgmGkjdS5DM
	t6N5VCrw6qEFEtxWBR9unHRZK8/mfmMSKGHv06b1OKi8Zhm3DEbC0mlFMZNTi9KvqEoRRFWI+QZE0
	FNpLc3n29c/iDzRlx2k//UWJHfhf77QFF90OQ+HNJKoBFMAQep/TeeeunEp9uRKv9s8vMsQGViYDH
	kJWEFH8djF7dzmj1KfA2bsnctFsM4TY76OThSKfBgOGCLnxk8SoEQGqtbenAPCdI/17ShO/VSGARV
	0y+Ao9Qh372SQpsIqCQ07KNB4XHHJTVvXLbt+aznUZnRKkJuhFUicevgvAZ1HvCVIiny/arESzg3I
	diPMA8Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tktGE-0000000FdMi-10ok;
	Wed, 19 Feb 2025 23:13:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tktAv-0000000Fbjw-0Cud
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 23:08:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3A50D5C5CC9;
	Wed, 19 Feb 2025 23:07:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD660C4CEE8;
	Wed, 19 Feb 2025 23:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740006496;
	bh=GKZJK7WiIJ2QEvEmtIG14TY2D1FypXvtO6KV8zDv+WU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UFYbPFMiFOqSE/8naPeW55DhBbk3IbChLs/MFqInWDVNFwHXnTYgjxHICVUQbfKWq
	 7en7qZo4SBk70N2dWLI2cRdc7rWoZdAUZmC8q/nO9fL37YMPIirUQ3M/k3tr9ignWL
	 1TtIz1CUsfiddCJgVudWIygbg1VOa17j6z0+RsQt1cAKReaCD+av3gA3vb+BxBMrKN
	 CbYMBs/pcpbDvtSFcd6MSpBu1sfHGpkgvnUoOnYRMFMwKxhbHZ93kAOVLD8kBu9Q72
	 cqBmQ2jIPYjz7mXVKuqZLkkkfHjy2+T9SpQkLPMvh0CD07IWbbZZDKEkKDPQ1mxDUb
	 YFjRt1lLqZupA==
From: Mark Brown <broonie@kernel.org>
To: linux-arm-kernel@lists.infradead.org, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, 
 Frieder Schrempf <frieder@fris.de>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Bo Liu <liubo03@inspur.com>, Frank Li <Frank.Li@nxp.com>, 
 Joy Zou <joy.zou@nxp.com>, Marek Vasut <marex@denx.de>, 
 Robin Gong <yibin.gong@nxp.com>
In-Reply-To: <20250219080152.11883-1-frieder@fris.de>
References: <20250219080152.11883-1-frieder@fris.de>
Subject: Re: [PATCH] regulator: pca9450: Remove duplicate code in probe
Message-Id: <174000649345.2064287.5329691521010417254.b4-ty@kernel.org>
Date: Wed, 19 Feb 2025 23:08:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_150817_146230_79F803F0 
X-CRM114-Status: GOOD (  11.45  )
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

On Wed, 19 Feb 2025 09:01:48 +0100, Frieder Schrempf wrote:
> The SD_VSEL GPIO is fetched twice for no reason. Remove the
> duplicate code.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: pca9450: Remove duplicate code in probe
      commit: 66d8e76e8e85a30fbf9809837e07e15a8c5ccb8b

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


