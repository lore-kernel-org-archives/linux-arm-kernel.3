Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E56A0CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 14:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OIwpOVDFTgCdpYRlEoAnwHMTF8SENMpn2jmfekHfaNQ=; b=zgmrTuAbdndcZ3N5z7cjcR2pSE
	VgSV8D6QpGCG/N/xocizsWtkWnL3aQAG0fFHEn7pp/WIerop/AEUppOcNK+tubij9+g7HsvAUlnZ/
	j9uCBkqEH8kneNfrpZsSnZFZuoYy7tynsqm+Ai+Qok6HNK14AfuOZ2GxzsmL+Kmzd1Q4TiSrWyJwe
	CNVLD1JXcvTZ80ojBWqyxOS/rhLdZHFpcJIAvCfvXgsTgP5wdcsCqlC7DHJkKc0pLCSkkZM1Df29/
	kIa2dL2ptvI4ZpQW79VrhPcKjuXmAtfG7rbSJxXIzbTr1maWp/+eC768sEkdVlhoHbWAE5UUo9BOE
	5mDwBUKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzcLC-00000003BxW-496o;
	Fri, 19 Sep 2025 14:44:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzcLB-00000003Bwx-0M5u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 14:44:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 847386013A;
	Fri, 19 Sep 2025 14:44:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BFECC4CEF0;
	Fri, 19 Sep 2025 14:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758293040;
	bh=tgkIwZkXy82iLvUj6D+P1CNw4VBnnKn2FdkseccjCec=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XtctAxttB0At3TcPH73mcchGwf4+wczzFO0nvukNwWi4g4gSEIf1w3kbNi+inY2yu
	 y/n4dZFmRxTdr77RTf/gs1RfrEnVNZXyNHWLdDBBJ13dZeU2oFgyRGaETNRm/cuSrR
	 7YGPqQHU+45rfI5rvD5VIkBdbSeDeN2z6lFyE+SGlVgXC4bKSNpd37cGqFmNDR8oRW
	 mPGePVGGHIjmt2pr1OVL1/42X3QF5YHmIg6zO3rIBZBGbWgZZC05V3hMi9XbyVtwWN
	 5jHd7Nyu+FyPZ0JF4anScbTzNPYFeosEX5sxi2w+WXdRIelu33/WnhGAJk0hniV7Ge
	 0Cv0Bsj/LL7TQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uzcL7-00000007oFw-3HTw;
	Fri, 19 Sep 2025 14:43:57 +0000
From: Marc Zyngier <maz@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org
Subject: Re: (subset) [PATCH v4 1/2] KVM: arm64: Expose FEAT_LSFE to guests
Date: Fri, 19 Sep 2025 15:43:54 +0100
Message-ID: <175829303126.1764550.939188785634158487.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250918-arm64-lsfe-v4-1-0abc712101c7@kernel.org>
References: <20250918-arm64-lsfe-v4-0-0abc712101c7@kernel.org> <20250918-arm64-lsfe-v4-1-0abc712101c7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net, oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, shuah@kernel.org, broonie@kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org
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

On Thu, 18 Sep 2025 20:42:06 +0100, Mark Brown wrote:
> FEAT_LSFE (Large System Float Extension), providing atomic floating point
> memory operations, is optional from v9.5. This feature adds no new
> architectural state, expose the relevant ID register field to guests so
> they can discover it.
> 
> 

Applied to next, thanks!

[1/2] KVM: arm64: Expose FEAT_LSFE to guests
      commit: 5d20605c8e7930254f7bee41336e421be247181c

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



