Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8DC60A3812
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 12:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xFP+ktqU;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d4w8gOM9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+HC72Y1jKdcbuWDLnQBb8Fp4fKK/OIykYftoe6H0k2o=; b=xFP+ktqUHLx3dn
	lC04p0GODYpepwM+RfzL36X6igwrc2BkcqAKw4WxiZdLj+/sqei0T3rdUCoqByjNCCGHWRVF9x/EU
	TwPyEh/CxgB8PmaETK/Ddu+kd1Ru/d2r9erbT5fOqQH4SHTTwDBngfESq7fXnLRNhAlf3JcB9AXvG
	suYaNQhTQtq+n9fkS+/+DktvDOPw+c6nJ5uisGHzvTt6vH4iaR2KZ+IpIKy75kWJXvUAs4HU5K6DX
	sSWqUwQT/KT8BY1MEY6K6bRtXpyRF7QnVe4VoQwFjSHNpf4x7PWOSXZfLyYRL0XZXgGkocGlomujv
	0zM+DTU5YPdCIFf4ekug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJOB-00000002RIz-3cX3;
	Mon, 26 Oct 2026 12:01:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJOA-00000002RI7-2D5W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 12:01:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 08E7041285;
	Mon, 26 Oct 2026 12:01:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD1751F01825;
	Mon, 26 Oct 2026 12:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793016077;
	bh=+HC72Y1jKdcbuWDLnQBb8Fp4fKK/OIykYftoe6H0k2o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=d4w8gOM9JmL0XNVTh4Q53d7oRI5ss1U4vYzcbfoJvM8QcKcNnrYW4DDaur8Me2LpX
	 kqVbb0xenDVMDlPVR++8Qo3VyCYxi9U/YQ7Uob3rdjEUdFa8t/lQpk/WLN5c7p2l4g
	 F38TxfpzaCnnyLi3vF/Q6N/PdYORpb7hVJhq+ivHCgHfkRWRLbCkv1OuG1L+XbYNGc
	 7kayykz7VYnhinzVcYyTQa+ddxhRGKK44T7DP/fZJKjKj8QqmGYAqrqhWEcrxZ2ZtE
	 o1v0N2Pn0tQI8diuCvb5PAKTj4flWbairPg/h/QcYA7jV50ElUkJORWKlLOp2hg0qG
	 tfTD6SG3Zs3Eg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xLJO8-00000007Fr6-0u1z;
	Mon, 26 Oct 2026 12:01:16 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] KVM: arm64: vgic-its: Fix LPI double mapping and DISCARD
Date: Mon, 26 Oct 2026 12:00:59 +0000
Message-ID: <179301587180.2527370.8777107405308568501.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261013081646.933312-1-fuad.tabba@linux.dev>
References: <20261013081646.933312-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, fuad.tabba@linux.dev, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, andre.przywara@arm.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 13 Oct 2026 09:16:44 +0100, Fuad Tabba wrote:
> Changes since v1 [1]:
>   - Dropped the second mapping of an LPI at MAPTI, instead of keeping a
>     doubly mapped LPI out of GICv4 forwarding. (Marc)
>   - Keyed that check on whether an ITE maps the LPI, not on whether its
>     vgic_irq exists.
>   - Added a patch that makes DISCARD remove the pending state. (Marc)
> 
> [...]

Applied to fixes, thanks!

[1/2] KVM: arm64: vgic-its: Don't map an LPI from more than one event
      commit: de81b28f0b83b22163d7d9a9b708d7aa912e0ef7
[2/2] KVM: arm64: vgic-its: Remove the pending state of a discarded LPI
      commit: e99ff76f4a02be8542e2c3ecc8843d7339a0200d

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



