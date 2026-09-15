Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5C8C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 22:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bYnUPdhAHL+R5VtXzqTnTSjG/gjtRhgRQcO4zt1laKE=; b=S7h+F/JVrdabZPQgWreE8kyYwi
	j8t5TL2yIFyAvJjpr3aN4Ddsbv318CH4nogM39X3IrLpIGViFj/S1nQmHgeuKin1AgMKgl/aVPhks
	YAGZ/52cQgUY+HpAgQGtP4IpkuftHrxz5njfKQkFBInhtk4yngs4jVBdHnef2oKBrlGZKAT7TzO3I
	Bdi9j8NkbJX2+h+/Z7eBhWXzX/VveLwH44LKGXKDDRwbQf/K3Cst3l6Ybh4AKWFMaG9d+SY3wRCEB
	EGPED82eX9svp8hiINr0EJ3gqgK4AMOHYRIIwoyhC2HSolluwqDlU6PNXyQ3qzS/lEow2hWBg1BAK
	Tj5Q26hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6bbW-000000080Np-0tF6;
	Tue, 15 Sep 2026 22:26:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6bb2-000000080Jo-1eCW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 22:25:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 14B5543E64;
	Tue, 15 Sep 2026 22:25:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB8D91F000FF;
	Tue, 15 Sep 2026 22:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789511148;
	bh=bYnUPdhAHL+R5VtXzqTnTSjG/gjtRhgRQcO4zt1laKE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YmOrM34X8kSXcJ3Pk4wsrMaEHXW4Xf2x/ujTuvKqFWAX1Hsi8QafoM3nvwJgCboTY
	 K5XauLr1F6se4Gb9JkJQbzvx/mHQuSaT9IYaKuauVzTWafaLelvbwheotu7psm+ACd
	 xWnEjrj0ZCt5vbBB1AkJ1x5hs90K+WGUFjQ+8dyekMJjxPGrZTXB6NF6S5QVyADmvC
	 bCeq9ozVk4RxV+IUoFYzKbXAfwDv4Sf2tkACqTHz+0zhTWX5c/UodqBd2xYzcX+AjU
	 9b4dpteRi/aAL0paGT+XCnqi8v/iIBiRles2MKpO02pa1pnCrquI5CcUz24UosX14i
	 GwrjecUpbXN5w==
From: Oliver Upton <oupton@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	ljs@kernel.org,
	Shen Yongchao <grayhat@foxmail.com>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: Re: [PATCH v4 0/2] KVM: arm64: nv: Shadow S2 life-cycle fixes
Date: Tue, 15 Sep 2026 15:25:39 -0700
Message-ID: <178951103695.10790.16480585864546668236.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260911162203.1919330-1-maz@kernel.org>
References: <20260911162203.1919330-1-maz@kernel.org>
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

On Fri, 11 Sep 2026 17:22:01 +0100, Marc Zyngier wrote:
> 7.3-rc2 has introduced annoying conflicts with this, so in the spirit
> of making things a bit easier for Oliver, here's the version rebased
> on -rc2!
> 
> * From v3 [1]
> 
>   - Fixed spacing (Wei-Lin)
> 
> [...]

Applied to fixes, thanks!

[1/2] KVM: arm64: nv: Fix life cycle of the nested_mmus array
      https://git.kernel.org/kvmarm/kvmarm/c/33346f8960c7
[2/2] KVM: arm64: nv: Delay freeing of shadow S2 structures until VM destruction
      https://git.kernel.org/kvmarm/kvmarm/c/e5843f4effaa

--
Best,
Oliver

