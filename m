Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F27CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 09:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=69DclAwuUnHWVkyy/U5ahKJbr5IsT7bTPMrznQrv5tA=; b=EQLZ86QjW+7KT02zvbXVzUmMe6
	txK9sZnrEJx9JA1gBhScei0PK1u2QADG11xCNr/kgWyYpPGJMjaTbvCNIPUzOH4w8basajIbUCugX
	LJh99ILXx7dWn+qqn6x+FSzg863HshMBrtgV9jLneDQgmJBcBDymNrnfbshw9e1o1Bml1yr++8WQf
	To1S//t5MhoQuT++ho+V1Eh1rai5B/mG4TmoE2xiOr45YhvLbVUWzNd8H5KT7v2veyzzLEMNq2Cq7
	CfZrLKo1h0kidmrEkbipWM8IDvnbTiCs5nho/gHJC5OZ/EYlF6cj7ZDbidKqJPNcUuhnR8yOAyPq7
	ObDoPLuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV4i8-0000000GWk4-2L7t;
	Thu, 04 Jun 2026 09:50:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV4i7-0000000GWjg-1xM5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 09:49:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 84C2A60219;
	Thu,  4 Jun 2026 09:49:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70ADD1F00893;
	Thu,  4 Jun 2026 09:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780566598;
	bh=69DclAwuUnHWVkyy/U5ahKJbr5IsT7bTPMrznQrv5tA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=fY6EN1Yrc0kbAdsyCX33DJn06AAVMu2OXaCG7SjcHDa7P+TA8G4glswpcNII2gYiD
	 6b3APQ3PPkm55+Lyq5NxuInWAWRY+G1dKOrUtU+QxhVEaKvSbAW3ZChJi4adOFRktQ
	 lz70Y43KrC0vh5NGMWiwh8M88IdqHW1EbGsCse3I7Q3sfOV43sqI25WUHzwHVGCR6j
	 cZdaATeoTEsjU5IWZzTa2DbV+TU/AkzFdx/Rsiy98fsCfyGid9OJGjUtD8b6DmTgt/
	 ASYX6cf8axzgrzGwra/K+U6gRYhPPF7xNMzSCeMXno6aO+oid8lxM56Z9uxfeVID+E
	 GLfSFdcjuCF5g==
From: Thomas Gleixner <tglx@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Marc Zyngier
 <maz@kernel.org>,
 Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>, David
 Woodhouse <dwmw@amazon.co.uk>, Vincent Donnefort <vdonnefort@google.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Fix order of arguments to
 ktime_get_snapshot_id()
In-Reply-To: <20260604092714.1537457-2-ukleinek@kernel.org>
References: <20260604092714.1537457-2-ukleinek@kernel.org>
Date: Thu, 04 Jun 2026 11:49:54 +0200
Message-ID: <87cxy663el.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, Jun 04 2026 at 11:27, Uwe Kleine-K=C3=B6nig wrote:
> The first argument to ktime_get_snapshot_id() is the clock ID and the
> second output parameter. Fix the caller that reversed the order and thus
> fix a compiler error.

I've already squashed a fix earlier today

