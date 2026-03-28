Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65A710F3DED
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 17:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VFUCabvdGzqvWGrT68xYJ/cRIrho5B19yes4+bKMpRE=; b=fjUe0uBh30cP1rAfddYigGJr9Z
	D6llr/zJFva6QSIO1I4tgPGi0IhZSHRQr66+71rj0Le1ldmMIaefuI51FzJ/vwGznbPjZL/xJZWED
	r5nP/x77Wfa1A4sFTJz0u78PbCaz1zZUBHdgVX45+nU2J9vwiZvp8sg9srrTNKkvPykAXFuIrMIsi
	sD48HJocVlg25A5RHGtBFGc6tW3uYpVjASoXltCewmymKxvJJKzv6yrQc3k6V03FJqgNkFUj1mMeS
	6nRqvUuyxhnBIiarB09sd3LXp9T1z+pprLESm6rGj8xuC5ui0dj6wR2Udir7eO6yd8RRYyV0fDlxi
	yi+eVhlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6XEc-000000098SO-0mBn;
	Sat, 28 Mar 2026 17:14:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6XEZ-000000098S1-0Wx5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 17:14:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 62A15407C1;
	Sat, 28 Mar 2026 17:14:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A48EC4CEF7;
	Sat, 28 Mar 2026 17:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774718042;
	bh=mDmQJZ1IBenCzInFd2Kb+fmyIt8tSDMmmiM1p0CHO4w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R9+9oMEzq7UyGPggLEV8EOjhR7vO7ibqVCBumOF3S3hw3I4Ve3Mf04QiBQlGRVpcY
	 eiT4SvdwBDdm9S6S7FIUUDO5HcAxZiN4q7g4D+X4H60J30b8QJBRrW+xVv9bTXw017
	 AFnezxgpCduPy1BRSYselgLfJTJfIVBdHDKR90JOqCIVrnPOOPS2X71ZjMCnNrap4k
	 6o3L2StCgPjk96RnIM27e7+n8/MY2VOPotIKAJ363qL84jNL/rv24iVlznsiwcnveO
	 CoMkwl7EqYdQc9AXVUjz2CoaroJXFlj+AUG3qDqX5dUAcHOTVyaS6r38comg0vT9Ry
	 2Cn72/uh2f9YQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w6XEV-00000006fvb-3lfA;
	Sat, 28 Mar 2026 17:14:00 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	Will Deacon <will@kernel.org>
Cc: mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	Oliver Upton <oupton@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Yabin Cui <yabinc@google.com>
Subject: Re: [PATCH v4 0/3] KVM: arm64: Fix SPE and TRBE nVHE world switch
Date: Sat, 28 Mar 2026 17:13:55 +0000
Message-ID: <177471802478.55481.7594241413365738023.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327130047.21065-1-will@kernel.org>
References: <20260327130047.21065-1-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, will@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, oupton@kernel.org, james.clark@linaro.org, leo.yan@arm.com, suzuki.poulose@arm.com, tabba@google.com, alexandru.elisei@arm.com, yabinc@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_101403_186475_0FA8EE6B 
X-CRM114-Status: GOOD (  10.37  )
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

On Fri, 27 Mar 2026 13:00:43 +0000, Will Deacon wrote:
> I got the Sashiko treatment on v3, so here's a quick respin to address
> the BRBE thinko it found in the last patch.
> 
> Previous versions of the series are available at:
> 
>   v1: https://lore.kernel.org/r/20260216130959.19317-1-will@kernel.org
>   v2: https://lore.kernel.org/r/20260227212136.7660-1-will@kernel.org
>   v3: https://lore.kernel.org/r/20260326141214.18990-1-will@kernel.org
> 
> [...]

Applied to next, thanks!

[1/3] KVM: arm64: Disable TRBE Trace Buffer Unit when running in guest context
      commit: d133aa75e39dd72e0b8577ab1f5fc17c72246536
[2/3] KVM: arm64: Disable SPE Profiling Buffer when running in guest context
      commit: 07695f7dc1e141601254057a00bf4e23301eb0b2
[3/3] KVM: arm64: Don't pass host_debug_state to BRBE world-switch routines
      commit: 7aba10efef1d972fc82b00b84911f07f6afbdb78

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



