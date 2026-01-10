Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98228D277DE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 10:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rQlYSGFb5hJ6a3llm+0TtCykFC6CFHVDBR1K2yTeY+I=; b=zW/J3xy10KuzS3ajZzSt2G9dVZ
	aX5XioJFbR8cfnPsnEApksUjdWnvdtQgvX1mhZvezVSWoHq9O2DwQ0LfZTz8z2itpHtwgBjKMuOHP
	n/meyqD/i/oCu+JUQAzFSDcwaP6GbB7/mIPy4mR0fXhCVk2uxOw7xX70SNSShKD3wJdO0034caVfa
	f7leQ7CHZWzJvA2JcVTo4fY9QMCbfLbJyHwwndPeVV3JZcADFZsdUCIjEgaawagRTWkEX/mfghypG
	8ubTZLl6Qpb+zIWNhQdMqdJRdq5oXa9+PpkN0pKptwQAZ7T/RG1DVvQ0llso9vpzJ8aq8p/gAtztQ
	44WdBoGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veW7u-00000003OTC-348W;
	Sat, 10 Jan 2026 10:23:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veW7k-00000003OOR-3Y6q
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 10:23:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BE4214434A;
	Sat, 10 Jan 2026 10:23:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70F02C4CEF7;
	Sat, 10 Jan 2026 10:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768040590;
	bh=7YgEmuODkBdJ5vTtg9+ZT6aVkPL7hovfppJ5JjIij54=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mMeE8jODVxkRq88ihk5l60Yxi/YV8/uPou3Ui00izndWUUTeVIaIPgTGLL/jjex0w
	 CttTfPII0sA8LQwPvBr08zU/+zJM5Eq1qw7Z7mluBsLQfcBwDZysOG8BB3D+5juqmq
	 /ny9ZWkE2tjwBMu3w8+3MoD1KTLSU6UkJp7JXi7VYKZam2QtZrx8PRiasrp81ObYRl
	 EuFVRqFpcOlZPjtuE3UtHg0ARk0gVFvusmUI1/QLlh+xPfP2jk16woUgr/PttbNBT0
	 H+gheW86Nq4gKxSILqaz+cOn0iBvJZywcQ5ytAq/JMePnWDa5QIgPh5eH24ZZRYB+R
	 TFoxdMYR3Bz6w==
From: Oliver Upton <oupton@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Sebastian Ene <sebastianene@google.com>
Subject: Re: (subset) [PATCH v2 1/6] KVM: arm64: Fix EL2 S1 XN handling for hVHE setups
Date: Sat, 10 Jan 2026 02:22:44 -0800
Message-ID: <176804045754.916140.2575057766830377707.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251210173024.561160-2-maz@kernel.org>
References: <20251210173024.561160-1-maz@kernel.org> <20251210173024.561160-2-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_022312_901336_3C0689AE 
X-CRM114-Status: UNSURE (   7.60  )
X-CRM114-Notice: Please train this message.
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

On Wed, 10 Dec 2025 17:30:19 +0000, Marc Zyngier wrote:
> The current XN implementation is tied to the EL2 translation regime,
> and fall flat on its face with the EL2&0 one that is used for hVHE,
> as the permission bit for privileged execution is a different one.
> 
> 

Applied to fixes, thanks!

[1/6] KVM: arm64: Fix EL2 S1 XN handling for hVHE setups
      https://git.kernel.org/kvmarm/kvmarm/c/8d8e882c2b4b

--
Best,
Oliver

