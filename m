Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AA1C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f8TxFUiAbtUl01Vtd+0lG4QRVjE1nTHi9LJJqApKIc4=; b=aTDqGySTXvDxDWyh9p8Z71l1Wj
	9ERgDkA96sC+n5SVBpiRI1b+CGlNuuiKBPoHMAJX31RWxMDkbxlyP4b3587WQwniJ5sYOmQzKm10m
	nGziuSEYuNUJgKOBMVIRJPTsG4g+Yt1FgXmHFZzRd9fPyhKyem5kTT12f9CD+tvKTbML2+lJ4Jsk1
	kR5kMZl4EsMSP1ZTE6cY2GQxkfeXCLFyIG58O1wC6h3/Heg8wNlYOolEgLa0zRlQdmCF44q8OZUd5
	yJzIJWKrf85ceIf3+48chtds/7fovTAEieMvCBFkBirBNvLQ8gVvEbS/n94DjA5f6sOXjbUsvquN0
	Be+jBirA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnyP-0000000EQQn-1tn3;
	Thu, 12 Jun 2025 19:52:29 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPliT-0000000E28r-3ryM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 17:27:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4A2CEA51F12;
	Thu, 12 Jun 2025 17:27:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABE75C4CEEA;
	Thu, 12 Jun 2025 17:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749749273;
	bh=2G5qLsKoSR6gAEvjg/D35XEvL5hE7PAgSEn1G2PKRds=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B3w3+mR/xywjW1Rcxz4COG3DBdvODdhW7PbWNJbIIJru+BVBXGOpl9v983WQK7mLh
	 MPW04u2aOZxYplUf/zJVUunXRdwQFYbYEJUnv7yOmWvMkDYBW/9hTsMYFtRl508laA
	 XgMUEuy3za4YrIaVhIOVvr5YfvQoV3h9AbFgGCr8zUEQ83XFakwWwxIVyTPuskoM2b
	 8X93sv2JQ5/sWcBz77cW/UfNYp3W2yHfitTf5LScsQ6mW0i/PN/TEo2evRWdFcTLlv
	 3FT8LpVjeFICbe3UwuNyeV0wQxzkHRhnNAFUUO/g56dGnCmOR/u43pvLbUtnNAlyzi
	 W/JqmlWNMak0A==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/gcs: Don't call gcs_free() during flush_gcs()
Date: Thu, 12 Jun 2025 18:27:45 +0100
Message-Id: <174974508231.2464269.5709825790065106428.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250611-arm64-gcs-flush-thread-v1-1-cc26feeddabd@kernel.org>
References: <20250611-arm64-gcs-flush-thread-v1-1-cc26feeddabd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_102754_018590_46ADF515 
X-CRM114-Status: UNSURE (   8.82  )
X-CRM114-Notice: Please train this message.
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

On Wed, 11 Jun 2025 17:28:13 +0100, Mark Brown wrote:
> Currently we call gcs_free() during flush_gcs() to reset the thread state
> for GCS. This includes unmapping any kernel allocated GCS, but this is
> redundant when doing a flush_thread() since we are reinitialisng the thread
> memory too. Inline the reinitialisaton of the thread struct.
> 
> 

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64/gcs: Don't call gcs_free() during flush_gcs()
      https://git.kernel.org/arm64/c/d2be3270f40b

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

