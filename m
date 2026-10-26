Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4552E606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 12:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WBkyrQhZ;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cjkSKlC3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vxZ84y/v0ROAkqwdYRKaaVq1PVyc3FNXCyfgsxU59Xk=; b=WBkyrQhZ59+dkg
	/hxs3dY32Ql5qZs2H9R+9kMu5ZXXs4vPdYkQF23Z6neUVRx4RY/RjcYe2GbGljFwpnH2OA28izPV0
	nfiQnTiHtMJkvY3yeSPxyPXcL7gG9VVft5gnGxX5qCR94qiur9TJzoL9H40hiDFh42AFmwbfcXifz
	SiN87rlAJ2zUQKAeilHynI3DNrIU8K1JR4dsB4ZGdHiIju89XVltCvU5SsXodSZs/r8IP7C86sUlz
	0TyMxno60xcHdgY0YWVt2I1Cppfy2QJIHVxErh4vQOIeZHv5VFvid0tTJL40V1TkiBUwIB6epgpYg
	Fvx7wpRAZ69O97LaShbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJOe-00000002RYr-05S8;
	Mon, 26 Oct 2026 12:01:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJOB-00000002RIF-1jWR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 12:01:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 55CBC43EB6;
	Mon, 26 Oct 2026 12:01:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C9181F031ED;
	Mon, 26 Oct 2026 12:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793016079;
	bh=vxZ84y/v0ROAkqwdYRKaaVq1PVyc3FNXCyfgsxU59Xk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cjkSKlC398a6ND7aRWe0t4HTOVqLBQ+/gKOZNyt5CXwNimMz5FkvqH+oLXxk/eTAg
	 Eu2Uvzm0ryqGgDjm+m++Sxo6DFIE+iOE3f3OQsIs6egg79rYgAWWJ4WDgPY3JKvC1/
	 BQbrCKBLxp3umJG67ECSRp6isgMB5Z8W7Z50+81s2O2N7sxfDOd39Xtsv7+r8DGiqM
	 tZERtMDdWeIukQIXd9uO0fKs8qmKr0S8xUtXdWLwQK6kDNSLGSFi/+1fK3x4JxIrRc
	 bc09gNfqD0MAomRjvPrFmHadN3JB8mxneDBEYyv2o8CU8sBHS1BMzn+iQqAdEdRfrX
	 amUcxArJGk9sw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xLJO9-00000007Fr6-2ThD;
	Mon, 26 Oct 2026 12:01:17 +0000
From: Marc Zyngier <maz@kernel.org>
To: oupton@kernel.org,
	Sascha Bischoff <sascha.bischoff@arm.com>
Cc: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] KVM: arm64: gic-v5: Drop unused addr variable
Date: Mon, 26 Oct 2026 12:01:05 +0000
Message-ID: <179301587208.2527370.6364647605927514096.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021082204.1494581-1-sascha.bischoff@arm.com>
References: <20261021082204.1494581-1-sascha.bischoff@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, sascha.bischoff@arm.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, lkp@intel.com
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

On Wed, 21 Oct 2026 09:22:04 +0100, Sascha Bischoff wrote:
> vgic_v5_has_attr_regs() assigns reg_attr.addr to addr, but never uses
> addr. Drop the unused local and assignment to avoid a W=1 warning.

Applied to fixes, thanks!

[1/1] KVM: arm64: gic-v5: Drop unused addr variable
      commit: 576a1b5ab4b8be03ab5cf7b41b475850795e3fe2

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



