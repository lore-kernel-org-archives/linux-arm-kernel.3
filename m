Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B659CA9EC0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 19:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pfwEH21ZQ+VyqbpwjBgdY6h7pqqNcOg8os0RKJ44Bc8=; b=ZFqFbUJh+sV2QstO8WzkxMdBKY
	SxrymATIX6duE0YeZuOnqYzU8TVq/09VqWMlkxA0z9i2/Mrm7GqIrJmoaA6rPwNuqSo2o5dlbSOdJ
	oqxlvs1Ly6hGoYG2QuU4V1Q1HB3WSvXxaYVq4iEpFpDM5pqJ3dRkHSJnBVlpC5nXOatyDQh6NI0nz
	tjheDEZnTU+ZP4WPvGCfwJGRZCF/lzPNqMnhHzQTy/1+1AW6nNKfBpjVrGWpjHr7r1u4lrLtjmR0o
	SvJ2eHc6vgWA2QtRxF1k68jya8gMhhAudXNnc6saRpih46tQbhabhv5xDBDiSYfhR3YMiFxcRTPWG
	d4IdG/CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFd0C-00000008PjU-1xHJ;
	Sat, 10 Oct 2026 19:45:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFd0A-00000008PjK-3roc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 19:45:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C596B602CC;
	Sat, 10 Oct 2026 19:45:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA32B1F000FF;
	Sat, 10 Oct 2026 19:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791661501;
	bh=pfwEH21ZQ+VyqbpwjBgdY6h7pqqNcOg8os0RKJ44Bc8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=IgklvrWgq5zL5cWRq1rSvtIcEFJQjUcCu3GXo9Mmj6gFM6Lvhiytk9xAq3+E8SZhM
	 HqeKRt9zwoGlQVnOEExrWwybC1ekvgNtvF005zgS7d2Eb7+DItRC07cB7mD+9t43KJ
	 a9+nZ/73ulUdj2PuQTe8scL3yddtcCD2iHlHnt7Ab3qq7p6+Ywv/ih0wqbU5GK6BNG
	 B4da1FE/RnDhEbuDcrZV/oNDqN+Qmx4LMG/DIPCaC8YwD9O5CKz3cdJRMORsy2nUJF
	 vDC6TgE64LGSZb5veghKvF4Qt/nJ1S8j4fxS2oFLeY3wzvd0PBAvkblypux9+tcg23
	 8cqaB+D8a2UtA==
From: Thomas Gleixner <tglx@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Radu Rendec <radu@rendec.net>, James Morse <james.morse@arm.com>, Will
 Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2 0/3] irqchip/gic-v3: Memory-safety fixes on the probe
 paths
In-Reply-To: <CA+EHjTzCG-vR1MFgMhuVtn3PFfW1rQjhGUBBgQawSw6ptsK-QA@mail.gmail.com>
References: <20260925085000.753400-1-fuad.tabba@linux.dev>
 <CA+EHjTzCG-vR1MFgMhuVtn3PFfW1rQjhGUBBgQawSw6ptsK-QA@mail.gmail.com>
Date: Sat, 10 Oct 2026 21:44:58 +0200
Message-ID: <87mrslfih1.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, Oct 07 2026 at 05:22, Fuad Tabba wrote:

> Hi Thomas,
>
> Gentle ping on this series, which Marc has reviewed, and on the
> lifetime and range fixes [1], which he has also reviewed.

All of that is in my todo list which contains the backlog of vacation
and conference travel. I'll get there in the foreseeable future...

