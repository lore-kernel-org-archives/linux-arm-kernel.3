Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2674960A260B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0S3gIloj;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T3NSq3n3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jrvB2uhiOlJMrSsnK6E2dIxlOOfI+P99rLJr/kY+hxU=; b=0S3gIlojiFsLLI
	7Xu7feIsulRxRfQBA0UUv2De4Zw3Tg1grZ/cn7QBXCCG32rADQ/OXVxeaHccsneJtpvI7tm9cx6Yb
	Ytrgpw3zoSgHK6kubn8c1UIE0YIMm3Jg3eI2a3HzsJPLXpenFb05UCz+S6PzMjp0YBwHPLSmdCwo1
	tJOsrC/2+kNRlT+6oQ7DwSsB5UcaC5S/pd5r7Z8aNC33ULRYXEyAAuWC9fyx/fcdRJVopapBgEYm3
	PMnMIgxOXutsjOWhVZdMVjnwzqKNF1WIA+r1QKbM2hKmfrYBlnwkNa4jHOoaILy+06s7PTD9FxK4o
	0kSNH+fcmHXPFU3birbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEDZ-00000002T2B-06Pp;
	Tue, 03 Nov 2026 13:06:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEDV-00000002Swe-0pU0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:06:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F028343F62;
	Tue,  3 Nov 2026 13:06:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF5221F00A20;
	Tue,  3 Nov 2026 13:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793711180;
	bh=jrvB2uhiOlJMrSsnK6E2dIxlOOfI+P99rLJr/kY+hxU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=T3NSq3n3lfS8W4VM0IM77JvlyxS3E3lkY/GvyHOFmBbyBf5FkSIdSv4wGMz+vZSIK
	 EcLghOEYATx8t/Nnyufi3hU9RLY0c7kHD6OJp4zgfw7zZz8ntFonkmKdt3d8V1dQeN
	 XdD21Ino2zH92767FVbwWzmh8eOZDZFSe1qJSJZTDoB+Er4NP29R+U2v6kZrMU1Eio
	 0Ui/24Tn1lJxyIUOuharQsOqvBdeeU2yomI/lla/TKpLVLhs6diPgI+FnkzzXMgpsV
	 oiA9tAHrlS4IyrDdykSb46tqYO9jtb9ui3d8g4GqcBdhRH5gZJq9rSCjrVvD8s/k/q
	 13Y29B9g9X+7w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xOEDT-0000000ATWs-0AHP;
	Tue, 03 Nov 2026 13:06:19 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: Hyunwoo Kim <imv4bel@gmail.com>,
	Eric Auger <eauger@redhat.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Sebastian Ene <sebastianene@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] KVM: arm64: vgic-its: Update GITS_CTLR.Enabled under its_lock
Date: Tue,  3 Nov 2026 13:05:36 +0000
Message-ID: <179371111247.2844725.15148154363267227953.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102082933.2673799-1-fuad.tabba@linux.dev>
References: <20261102082933.2673799-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, fuad.tabba@linux.dev, imv4bel@gmail.com, eauger@redhat.com, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, will@kernel.org, sascha.bischoff@arm.com, sebastianene@google.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

On Mon, 02 Nov 2026 08:29:33 +0000, Fuad Tabba wrote:
> A GITS_CTLR write that disables the ITS clears its->enabled and
> invalidates the translation cache under cmd_lock, while an MSI
> injection tests the enable bit and populates the cache under its_lock.
> An injection that passed the test before the disable can cache its
> translation after the invalidation, and the cached path then injects
> the LPI from the disabled ITS on every later MSI for that event.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: vgic-its: Update GITS_CTLR.Enabled under its_lock
      commit: 61d4f8c3d02cf936cfb91f7b72516b17febf74d3

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



