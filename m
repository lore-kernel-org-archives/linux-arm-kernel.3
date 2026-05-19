Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F3ECD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6mXu1FH/Aw1PvVMwnfo1s0uUcahyud8na+pl3qvboPU=; b=TyALRaFLiQK1oH3Y1RRM1vWC/J
	UdwZSUfgwZt9RSc8qu8CTn4AWRHln92XzZPGYyu9CDB78dIVmpq29Tvu/NuJzxgP7mWq/5X8ZGQz+
	hFM3NyGUlVhkIaT8A2VBg+exp+FLtRtbfAF10aNI7zDcO8DN00APJFSiJVoI7YHb+Iqqc2ycA/9Ap
	hi1bgLXn1vy7+P9703VgLhRqRSaE5x0fE+U6xRmav5g3DykWKo0ls0PU+U4FN8XnzdqNkocerNOQT
	2w7eaZP9Ypfc6VNpCGg5WEVjbLW4dVOeajQpPMl1dPCHX3Jc4PgN192HxREm76kpgrV30l4hT5+e3
	d1O6C/nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMJW-000000021dz-0z17;
	Tue, 19 May 2026 15:24:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMJ0-000000021DU-30js
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:24:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2DBA960224;
	Tue, 19 May 2026 15:24:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96B56C2BCC6;
	Tue, 19 May 2026 15:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779204265;
	bh=NdOUL5avdJ53YrYyOtF2DkkZOJM8fSDtqHFyLACNZKM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uYkDp7FgO3eDMJMDt9NOaoOPK5G6pmBotNf9bwWQnDePS0zLSCob0T4nGQOXU3+bB
	 KyNQoGl/U2k4KvppE5Gk5o/wTCA1m0wZ7gNcbooH5PHVI3GYIGLnqbzpHqYgREXy0C
	 I9LMXntzdZkfhyet3IzFL1V8W1EwojSUVxVGabKyW53LoXOMG/k8/VEkDqrkrm6L7D
	 ddONNzlbdk0IkzZ2YzHPSd77xoHNTrlE/J1eP3reriu0YNJW9Ldgd0OaBOabPrOgcc
	 0ofHfHXQnsqJw2guab1Ud437eQdj7/1hebj6RTacT5Sx9+F8srT279CKGd0at08MY8
	 VlnemLO4+SZEQ==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	shechenglong <shechenglong@xfusion.com>,
	Zenghui Yu <zenghui.yu@linux.dev>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Jonathan Marek <jonathan@marek.ca>,
	Jinqian Yang <yangjinqian1@huawei.com>,
	Thorsten Blum <thorsten.blum@linux.dev>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: proton-pack: use sysfs_emit in sysfs show functions
Date: Tue, 19 May 2026 16:23:10 +0100
Message-ID: <177918937253.754805.7037838371679179364.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260513115756.447661-2-thorsten.blum@linux.dev>
References: <20260513115756.447661-2-thorsten.blum@linux.dev>
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

On Wed, 13 May 2026 13:57:55 +0200, Thorsten Blum wrote:
> Replace sprintf() with sysfs_emit() in sysfs show functions, which is
> preferred for formatting sysfs output because it provides safer bounds
> checking.
> 
> While the current code only emits fixed strings that fit easily within
> PAGE_SIZE, use sysfs_emit() to follow secure coding best practices.
> 
> [...]

Applied to arm64 (for-next/errata), thanks!

[1/1] arm64: proton-pack: use sysfs_emit in sysfs show functions
      https://git.kernel.org/arm64/c/243c1d75a01e

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

