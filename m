Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC25CD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CW/lrAgYk61lG9ag4Ef0HvbDL1a3zLfQaXIYjfFrIeI=; b=D0xWZUYXmhD9CrUJsc0sfWjrD5
	rmDbsSrEMr+ELX7fuZRB6Sz9gkVmjIpf+2o6mwZirOP6IfauVXY2n6fqA9ylDl2mZVMHeMj4Qn8gK
	vvp96r3yqzNmMIAqpRE5ETqQCJ2RUsHHB3aAbeRt7F4HvJxL/ZMqlyRMOcp/1v0wViT8ZkJHeQbUm
	QxkHvcm0EMmOqWwQ3nmXdXORizqd/iNuYjjS3dfoj9hCiuNtTxJo/TdHtNZqfRyQHGDHuTnYINxPq
	FZvYop8Sa5hoWS/fMJXxpQGbE2pP6rtJ4rPU9lnUkWzCEjBtuU754FAY67nufyU9MnJAIG/OWKc0H
	h94X+ENg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMJW-000000021ea-2cgK;
	Tue, 19 May 2026 15:24:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMJ4-000000021Gl-36oD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:24:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 319176021D;
	Tue, 19 May 2026 15:24:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7599CC2BCB3;
	Tue, 19 May 2026 15:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779204269;
	bh=8z7k034Wot3SqgEu3+YNc9BK7PqMLLYZSl2Ht0QQotE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=thU8s0JEYC1xNIbAt+KY+oKX5Y4eEo47AZDsH+GjjmprXl8ui25XzQJ1ZWhAn6a+d
	 g9AjFyGEtamXcgOjgltIltM760M9HvKcuQjpACqcsV/m7dxf+swrtfoA4lAVhzkP2Y
	 3Ewtp1pzcWur0gQPLfRNrtJB4fZREOCTJQsvk/+paZa+vnXKim97XEkJbPq4rJLuoD
	 XcutZb+5TArbxd1vyGW5pxFGnqUx7gqgQ381dlKFfakloD2LfPmVHxkL5IBf7cQ59Y
	 bghZrUuEB3l+RsIoaMpIRRix5KKgHPKSpul9Y35YiGibEUAqzBZDSEupjS8OqwOBh8
	 lDvFKcqOH6sNw==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	Pengjie Zhang <zhangpengjie2@huawei.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	maz@kernel.org,
	timothy.hayes@arm.com,
	lpieralisi@kernel.org,
	mrigendra.chaubey@gmail.com,
	arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	zhanjie9@hisilicon.com,
	zhenglifeng1@huawei.com,
	lihuisong@huawei.com,
	yubowen8@huawei.com,
	linhongye@h-partners.com,
	linuxarm@huawei.com,
	wangzhi12@huawei.com
Subject: Re: [PATCH v3] arm64: smp: Do not mark secondary CPUs possible under nosmp
Date: Tue, 19 May 2026 16:23:11 +0100
Message-ID: <177918943007.755487.16810413573676566822.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260506090851.1858467-1-zhangpengjie2@huawei.com>
References: <20260506090851.1858467-1-zhangpengjie2@huawei.com>
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

On Wed, 06 May 2026 17:08:51 +0800, Pengjie Zhang wrote:
> Under nosmp (maxcpus=0), arm64 never brings up secondary CPUs.
> 
> smp_prepare_cpus() already treats this as a UP-mandated boot and returns
> before marking secondary CPUs present. However, smp_init_cpus() may still
> enumerate firmware-described secondary CPUs and mark them possible before
> that point.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: smp: Do not mark secondary CPUs possible under nosmp
      https://git.kernel.org/arm64/c/e7cec385d2c6

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

