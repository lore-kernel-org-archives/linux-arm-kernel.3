Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC39CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 21:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YygbKk+cKyHRF1LeapDeUiUlyqUapuH9TTwdA3O0XJs=; b=L7TgbDg/he56PQzXs8v8DW3RmZ
	wASTcpYaUb4Ee3P4KkcYm/GN86xpQq2EWL0vCC0fQpNZIAmwIRAF799rWZbDbQ6jDj37nGQA7bRy2
	28RWghdS1A/y3hGOVzT8zDWoP5TMZDzldAOOzVu3TcwhLv2Pf3zXge9XExWKp6vKqQ6aTLR9QrNjK
	bZfKbZTOwdVynZfMY3ubvZMp33R9MNXdABI9KIBZOeqsriUQlE4huMDp6aiqrhk37mnT5UwRIPIQx
	AUOi0N8//AL3oJlWd8q2RBqDZ22PBjU11838th2jkKovRSBP0nMrmaxrl+Cx4dq6Nhy5/+piVDm64
	wGftmFGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzLtY-00000001Avj-0b9S;
	Thu, 18 Sep 2025 21:10:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzLtU-00000001Ash-3b6w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 21:10:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0DA67601EB;
	Thu, 18 Sep 2025 21:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41C3EC4CEE7;
	Thu, 18 Sep 2025 21:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758229819;
	bh=L/0fJfUvECLEcb6+QI5nnYxmkm3fVlEfEg6i5rtgZPM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OpGw0jGRD9kwuFdEm1fzXk65vmgf4R+xGuDbhnIivUESJs1d1+qKqodEeD41Ukl4/
	 UllTfbSHFGPTJIaqwZiEyIQ/1fKPXOWR9I6BUA3j2XBdNS51uzI1JXx/s9wP652ymE
	 o1myDzCN1BPXTojyAYT82kWjzg5VUJHFv4RgWGs6cjJnOtK6yapWrp/wJLLNKkpBwr
	 tPuknM/4JI1jqFDDpjGvtCjCxUrRu2hzkr3OxL15JFPB8il9HTuY9UIcUJ0l9sNHv8
	 geOC0NJTlnKYBd+ETksupKw1HvUO+RtLCV2JqKbxHeA9dL6E+2eVLCfPj5tuXjg+mn
	 o3An2VAmWidBg==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] perf/arm-cmn: Fix CMN S3 DTM offset
Date: Thu, 18 Sep 2025 22:10:06 +0100
Message-Id: <175822310579.3544708.17568166573613612200.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <f1248eedc2d082c80f5299747acedc8decb94c70.1758212731.git.robin.murphy@arm.com>
References: <f1248eedc2d082c80f5299747acedc8decb94c70.1758212731.git.robin.murphy@arm.com>
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

On Thu, 18 Sep 2025 17:25:31 +0100, Robin Murphy wrote:
> CMN S3's DTM offset is different between r0px and r1p0, and it
> turns out this was not a error in the earlier documentation, but
> does actually exist in the design. Lovely.
> 
> 

Applied to will (for-next/perf), thanks!

[1/1] perf/arm-cmn: Fix CMN S3 DTM offset
      https://git.kernel.org/will/c/b3fe1c83a56f

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

