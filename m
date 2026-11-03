Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C588606D839
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OZF7NCn0;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hJoBEkHT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3JuamxyQxu19gK7K2J52HPeF5X4ClmNvTcYsIkXxa2k=; b=OZF7NCn0HMMtMd
	wPAyVcGy2BmHzDGc3Eo/xrzLjtKYy+hHKiTae0ipOSvp9jIEUBWRvPYv8r/rzh9/5h3+TyLckScmy
	CPqlRz6r7ia9rWoVjzJfBkq92uYlQyRZEnuSJQkDfOsJ578jdwz1jEdmIrlA8whmSxtCXxfEAb2Wr
	lN2IhhKB4KEglArlQq6eiHLX8ACXkHZCg7qjO/oiU+33xsaNSPVK7yJmze+mEk+M3dlW+yIjUx4dt
	tQBLZhKKb386GeQnTbPLg9GLXEEj2bcSuoQO0sAxxWwEqPdAVee6ON7CMn1f86o5t2ms6NPRAabaQ
	GaYADq+4k+YzxfOFUZEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEDb-00000002T7m-3QVh;
	Tue, 03 Nov 2026 13:06:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEDW-00000002SxQ-119r
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:06:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 07206434CA;
	Tue,  3 Nov 2026 13:06:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF5681F00A1F;
	Tue,  3 Nov 2026 13:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793711181;
	bh=3JuamxyQxu19gK7K2J52HPeF5X4ClmNvTcYsIkXxa2k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hJoBEkHTLsJStAeM4+S5tYAwvoyqBQk/y8VWaGYAidfKCHGr/Er+/AN4+pmUToqai
	 buDGt/2W5ShglYzroYSpXWAfO9sWuFYCn8kDkk58Mbl3IMXJH2tohTexX4CbpQaB55
	 DBju+3Rrihd/cDvoVcmDwUmvz4zdSIAQYU87R+WCp7b0G31pp8N2eFNI2RtdL/QYTS
	 uAdxFl8xXQ9KSS+hPHitsl/nhnitJ8MCjT4tylohr4Bv340tCb3HnabAzJsSd/Crj7
	 8bmoRQaE+qWn8oUVBHzNKbOwD54OT67y3zOxG6903poq1YuWjG+mxw0LNJg3Ey6ok5
	 tDvPUc6VpezDA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xOEDU-0000000ATWs-0ifC;
	Tue, 03 Nov 2026 13:06:20 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	Matthias Goergens <matthias.goergens@gmail.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org
Subject: Re: [PATCH v2] Documentation/process: Add a maintainer entry profile for KVM/arm64
Date: Tue,  3 Nov 2026 13:05:40 +0000
Message-ID: <179371111286.2844725.14445338385718888809.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030083351.3040604-1-matthias.goergens@gmail.com>
References: <20261030083351.3040604-1-matthias.goergens@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, matthias.goergens@gmail.com, fuad.tabba@linux.dev, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, corbet@lwn.net, skhan@linuxfoundation.org, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, workflows@vger.kernel.org
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

On Fri, 30 Oct 2026 16:33:51 +0800, Matthias Goergens wrote:
> KVM/arm64 has no P: entry in MAINTAINERS, so nothing tells a contributor
> that the kvmarm tree is used for integration only, or what the
> maintainers expect patches to be based on.  Marc Zyngier said a profile
> would help.
> 
> Add one covering the trees, the base for patches, the submit checklist,
> key cycle dates and review cadence, and point the KVM/arm64 entry at it.
> 
> [...]

Applied to fixes, thanks!

[1/1] Documentation/process: Add a maintainer entry profile for KVM/arm64
      commit: 0e086eebb3f38c392789dde6f0731f6555d793c5

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



