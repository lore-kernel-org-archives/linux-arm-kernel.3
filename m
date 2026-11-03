Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46FC60A260B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ql5xID++;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iRdVuYB8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LyvyqRc0CsiBtv9AFJeJRC/mSnmi8GfQ7gHCAIH28jI=; b=ql5xID++9Nf8rF
	XLSV5Zg8BbV/ZcxXM7lgnMP5RlkFBT37FygXhS8MDkKMLHssIkUSeoQjsp0K8W3r5sapDVphx2rT2
	8RtRtMwOztwY3SpPKqwqpIEyxtL1Y80Arx1AtKHaIWG4Xb6VLvwHuenwNkax8utImB//VGK6kchG2
	6gIBaBfVciY5dGLtmb2uagFzn7d8Jwh7MoPBPEeQSnnEMUVhZ5zL1sdbWJQzVkIeNt0v3KhaYuO/s
	1jM3zRCalzLV0ZNwht9oKDz4I/RK1KyKoyp/Axk5YNewsNHtRegVRuAFZ+TyH9zgXDmxCI6eC3sdu
	o0g14A2YGP0wPccbjmXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEDc-00000002TAH-2k6e;
	Tue, 03 Nov 2026 13:06:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEDX-00000002Sxu-13Yz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:06:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 093CE43FB7;
	Tue,  3 Nov 2026 13:06:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D79901F00A2A;
	Tue,  3 Nov 2026 13:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793711182;
	bh=LyvyqRc0CsiBtv9AFJeJRC/mSnmi8GfQ7gHCAIH28jI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iRdVuYB860boaLF2XHWfKA/JoRpq1+7x5EGMhX+x+WwYvOJjdexCU1VkSxDnkfNnA
	 GYFbGf6LucbzSNDrOXu0OIz5zsB+OrnALPkpibaBxxnFTAtT1/uoqg4iB5xEtnLfI8
	 G5vuz/Rzk/qfiaS9tq+4C3oEFoL/NE5fufAkBggHKxBQvF4rFp8t9NsdISmfsiUTrg
	 Pl/H5RsTFR5Rdqt5UJfXiEMGzN5mSPKytZAMGagIxRLUX2H+5u1OGNWArUphiAgqAa
	 rSJs/tORiXFEZnZ+15fzASCOh5vEBZWJ8YzkQumwv0tRtWZKcyE1Mf8Y3p4a/x/tR/
	 ujiiZN8+tn8BQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xOEDV-0000000ATWs-0XjH;
	Tue, 03 Nov 2026 13:06:21 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Wei-Lin Chang <weilin.chang@arm.com>
Cc: Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Gavin Shan <gshan@redhat.com>,
	Leonardo Bras <leo.bras@arm.com>
Subject: Re: [PATCH v2 0/2] KVM: arm64: Dirty logging fixes/cleanups
Date: Tue,  3 Nov 2026 13:05:44 +0000
Message-ID: <179371111272.2844725.7421436715198308487.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261029175238.3214788-1-weilin.chang@arm.com>
References: <20261029175238.3214788-1-weilin.chang@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, weilin.chang@arm.com, oupton@kernel.org, fuad.tabba@linux.dev, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, gshan@redhat.com, leo.bras@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 29 Oct 2026 17:52:36 +0000, Wei-Lin Chang wrote:
> These are two fixes/cleanups I found when reading the code. It fixes
> dirty logging detection in ring-only mode and updates a stale comment.
> Please view the patches for more detail.
> 
> * Changes from v1 ([1]):
> 
>   - Keep memslot_is_logging() and use kvm_slot_dirty_track_enabled() in
>     it. This preserves the RO memslot check.
> 
> [...]

Applied to fixes, thanks!

[1/2] KVM: arm64: Fix dirty logging detection in ring-only mode
      commit: 98b2eab9345c502cb13ef2e347ab5a6c288db482
[2/2] KVM: arm64: Remove stale remark on canonical IPA alignment
      commit: 4bc0c9cd84767a978046c3b2a73dc932bdb8d9f9

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



