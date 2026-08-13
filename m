Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB27BC5DF64
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 06:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=esRaKPAk94c43Je7PkJfvEjqoEjhDmofNT29Loe5z14=; b=SrTI5F0J7MfZsThVtjUuQXznJp
	RSbaRG3V4mhVM1WKXqHEYuU+7VbLUlWi0XEkCBtrdu10MhmzbA4GcLy+vNpXvtOD9vyUMjLtsOPGu
	UQkwiNXyTAn7cK91K4TmRJqMoxCJHVziCa4OR7n3bcBN9RfIK4b3FnxBuOSX3Xz53H2LhVTAh6g/Z
	Wsr42xmmRTsJl7qGGoXpYgmGHqCQ60hsANZw6IIeSjnp9DRO47zbuGkwqbZCVHMsAupwYtPLhW2qW
	22Sm/1YSprKRymkEO3VqYTpAdbuTDf+VKXflZRnl5wD+/eyo0hDXDB6H+h0Xd9fevIg/3c9PRiKsi
	A5JaCSnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPGO-0000000HWMt-3jgK;
	Thu, 13 Aug 2026 06:50:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPGB-0000000HWGL-1JNy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 06:49:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C0567601E0;
	Thu, 13 Aug 2026 06:49:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 463CE1F00A3D;
	Thu, 13 Aug 2026 06:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786603790;
	bh=esRaKPAk94c43Je7PkJfvEjqoEjhDmofNT29Loe5z14=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Fh+xHKiJ+qhl6KNCpr9Fxozjyvb/TsRlLgJ42ijX0PPy4dmnqy7DGhz3NvGNzJg19
	 3shrRKC49w1YaFq/fwN7JMrgfHE2cUILaaFgaQLdfgJH8Szlf2lKwjA1vvcnZfvPKU
	 qTUK4ey9Y/0kf8hk0ocyQtyMJksxtvkY5z2ofyG8Vu0U42XqnzthhJUKJ4aQqUYDfv
	 fbWtTNLJzWk2NVmHw2LrO/JPvXTDA+9fBMrJCHwIMSfLkPKFHig4WtfFAHMiD3QsQc
	 H3yJ97gYNLp1uUI3i0fur2VGEtGiXGAQHyMVorrJuA6nuI8l1CSiG6KSgbmu3FJcol
	 SzNeBG6NWrL6w==
From: Oliver Upton <oupton@kernel.org>
To: maz@kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Vincent Donnefort <vdonnefort@google.com>
Cc: Oliver Upton <oupton@kernel.org>,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	kernel-team@android.com,
	fuad.tabba@linux.dev,
	qperret@google.com
Subject: Re: [PATCH v2] KVM: arm64: Drop %pB on nVHE panic when stage-2 is active
Date: Wed, 12 Aug 2026 23:49:46 -0700
Message-ID: <178660378182.666424.15304247402418505023.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260803093906.3531699-1-vdonnefort@google.com>
References: <20260803093906.3531699-1-vdonnefort@google.com>
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

On Mon, 03 Aug 2026 10:39:06 +0100, Vincent Donnefort wrote:
> With pKVM, the host stage-2 is lazily mapped. kallsyms, accessed via
> the modifier %pB is therefore potentially unmapped. If the hyp panic
> occurred while the host stage-2 lock was held, handling this fault
> deadlocks.
> 
> Skip %pB formatting unless the host stage-2 is disabled.
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: Drop %pB on nVHE panic when stage-2 is active
      https://git.kernel.org/kvmarm/kvmarm/c/2ad524c5e257

--
Best,
Oliver

