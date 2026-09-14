Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D720C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 12:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zVYHIMr2xz9qPBrUfIaLsIVaDhVvuAdRJ8zubdosef4=; b=eVjwASonYElVGvatK7G7Xj2ZzL
	Ar1+KlRz14xhVRB0k6Hl7PyDrAIK6wh0uf4rlDFOeF17fPBA8dNwW3v66qIxOC/bOn9oSwXO37raj
	lEEOM66h+T1eT0KUh+ghcYjAE0kpSf+xs3a++ro6fyZyTV3zb064kk6cgoMd4bG6JU6ISG4q/zFzo
	wuy/t9PFuvKDehJTfh7IuhoHUY7HxHgXX7kVwPp0k2lUUtPspf+cwAMwguTa9RM/eu+pKDWyHEenA
	rIQSkZdv1KOIru+GTLNjA/onUd0iwCtQ5qJ9YQJoVxbIC5NJ3Q8po2C5wyyMzGnT1ncIjWvrsw7qF
	KgObpdkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65QM-00000003TAv-1hgu;
	Mon, 14 Sep 2026 12:04:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65Pw-00000003SvQ-2aFS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 12:04:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 14F3C601E4;
	Mon, 14 Sep 2026 12:04:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C12D31F000FF;
	Mon, 14 Sep 2026 12:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789387451;
	bh=zVYHIMr2xz9qPBrUfIaLsIVaDhVvuAdRJ8zubdosef4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=h3hzPDLg3C1XnvSDJ8U7xwm+8Bc7IuBHu3BPG4MBMyF1PwsjD0ntYdbSRlkcOMgx4
	 GXiwsDNeNm78+lEZUJAKhw6NIJWRb8zBn58DEoBcPxUlQ9WECTY0GN92FLE6lvo+9F
	 YxmmduAPCK7DlXgtcdWN6UslTPckhB++lilcp/AnJw4YGKG7yjEoIlrFt6uqOOedFN
	 Zs6503u1UvHAs6EoxrVqfzSY3qCKzQNLEmHIccAOpNzaWocggvhQGxglUUR1qj/o68
	 L7bDjNMtfrTo0s7NzdNqxMsXLdyN2d/SvAdLlwzntIgpExwQKE3C7EyOwXcQNHnkez
	 N5XwcUVPQ1KnA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1x65Pt-00000008bDw-3nd9;
	Mon, 14 Sep 2026 12:04:09 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	Karl Mehltretter <kmehltretter@gmail.com>
Cc: Quentin Perret <qperret@google.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] KVM: arm64: Fix kvm_get_vtcr() kernel-doc
Date: Mon, 14 Sep 2026 13:04:09 +0100
Message-ID: <178938739479.3215146.13473104593022148871.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260910190528.4483-1-kmehltretter@gmail.com>
References: <20260910190528.4483-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, kmehltretter@gmail.com, qperret@google.com, fuad.tabba@linux.dev, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

On Thu, 10 Sep 2026 21:05:28 +0200, Karl Mehltretter wrote:
> kvm_get_vtcr() takes a parameter named phys_shift, but its kernel-doc
> describes phys_shfit. This leaves the real parameter undescribed and
> adds an excess parameter description to the generated documentation.
> 
> Correct the spelling and describe phys_shift as the IPA size in bits.
> The value written to VTCR_EL2.T0SZ is 64 - phys_shift, rather than
> phys_shift itself.
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: Fix kvm_get_vtcr() kernel-doc
      commit: 57a7d86e2aa7ae6508ee8e08f32b42eaa314a2f5

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



