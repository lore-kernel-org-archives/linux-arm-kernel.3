Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC773C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 13:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yuJ09dY19nMU5wcxIHt6wddh7HIKlNAVB137+0NMIxA=; b=IL0KACo7iuEc8RaA1YZ3q93DgR
	2dmXLYvRLvdETl1Axy8V9Bp/VKlZmIn8nSMG2CZzCpIlU64QOs0bFdf57yQEfbGjKz7O4brjY9Lw+
	XUeezvy/4He/EVy5N6PL0a7ySbLvD+MGYBDxMvMKgI2S9h9kuRSMIks1e/Maaw75G8s0UPTMldkcV
	p83eC6NH/XakrBQeAvGW5XeoDFdTIRsyJLQQBt/coIl39r1wmJ3eObjhJkdIJpKEG4EWi9ejcT6IL
	ETrO1f3NPvF/yvNdqveZj5dtN+4hswA2phMX/8WVQaEIDIFru/2mAJ8GAhREx1VxJzuAeex4D8gJD
	/kUdrWqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x27yV-0000000HSD5-2bl8;
	Thu, 03 Sep 2026 13:59:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x27yU-0000000HSCO-13Mr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 13:59:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2A2DD6053C;
	Thu,  3 Sep 2026 13:59:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACC191F00A3F;
	Thu,  3 Sep 2026 13:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788443968;
	bh=yuJ09dY19nMU5wcxIHt6wddh7HIKlNAVB137+0NMIxA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fnGrS1+MxAIWviV6xD291f8jK61LVrxNBOzdoQxxJGgEIvDxL/FRxPlLWWb/n6ZAT
	 WZ1vOvKwVxf+D7CvaM47JTSA6EZEWeJFfwVh2NZuoZJ7eIbMhOFi3b5XCvYEsW4D2v
	 eUXhqXo/MTaClj+88RFQvkg4aZnOxFlAKE7IVOFtPLZBaOvjiv/Ix4APwnU7CZ1cdu
	 1i6/rgzivjGhSR0qBVO4Dh8qYGh2wguJXbB/lwGGKxSJQKXpVrBocMIoOoJCHIVsbc
	 CS7HRseUb4ItE3OHlwFwnSTfvBWMsImIVFSH3J0koy0QLCKfXK7wVrRx3a2PjXsn2s
	 OutH9UPO4gwPQ==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Khushit Shah <khushit.shah@nutanix.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Shameer Kolothum <skolothumtho@nvidia.com>,
	Oliver Upton <oupton@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v1] arm64: errata: pass REVIDR when matching target implementation CPUs
Date: Thu,  3 Sep 2026 14:59:16 +0100
Message-ID: <178844052241.4162712.13748055327957568318.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260831105444.4065831-1-khushit.shah@nutanix.com>
References: <20260831105444.4065831-1-khushit.shah@nutanix.com>
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

On Mon, 31 Aug 2026 10:54:44 +0000, Khushit Shah wrote:
> When target implementation CPUs are provided, is_affected_midr_range()
> accidentally passed the MIDR as both arguments to __is_affected_midr_range(),
> so the REVIDR mask check operated on the wrong register.
> 
> Pass REVIDR as intended.
> 
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: errata: pass REVIDR when matching target implementation CPUs
      https://git.kernel.org/arm64/c/5541432e09dc

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

