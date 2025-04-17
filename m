Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D28F8C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 15:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kszyUr4ORdaD0eRM+rHU28uL/Z8njd02j8Q2IkYfwOM=; b=lgV6yG4AthKFGBJX5vsizfW8S7
	ADLkLcn5texLoAvgRU/sjKNrvY9BHCkC6RjQOmWNGbUx6w31xnXF4T6BTxrh9nymwAa0mXXPAz66F
	oKYs8Uq2LnVr0gygDzdZs22CeXMekfvDYTpP7ktyyYCeF1TZ1bBXRUoZHGsPc1h1RQ9iFK2vTEpO+
	Ou8HUx0g/eDLrhDBouGQL5aMDElQybJknlFf2FbijfhXiM2BPQliV2XKk1CKkeE24KNlwSvDhUArN
	cH9UAK65lyOHOejWrqUS/6T++DtXLqOjsbu7VavHy821cuLFbrm4+WHb0X4F/RUxw3YqSqQykeVFE
	qVxdZuRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QsM-0000000DRhg-37aP;
	Thu, 17 Apr 2025 15:10:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QDi-0000000DJN5-0YVa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 14:28:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B52924A081;
	Thu, 17 Apr 2025 14:28:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C8DAC4CEEA;
	Thu, 17 Apr 2025 14:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744900081;
	bh=4QZa76aQVeUrvv/haODwV1QVCs92C6wzHtacRLOV6Xs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A7X34SRsqWuAsvh1MD93u+CtR0mEzYqn2mPygAB8lpfi8U4GogitbURImVBL362LR
	 xQCqZLUD8UwOTrXT7OnTXQcuBR2lpKaHU1XMwObKbXNIPGHFNPY4q/1yKIhJuRb45d
	 GafiOQcXYRyjKn0UUlF7FH9ocVtXBqEcGWrZPh3F8xGXNYeUZxFrAlHWq4HltGGoXy
	 +q8HkOYWu811vJUTgBBrMlXeJJK+sQ3Wq5Dr5hQ9ALqfRgZQnjS4fHdMtdTrE/Ib9t
	 GgXLiCGVhfqCTpbH3MD2hYEvLZTYB/1kkgvODjSXDCDkkTMf4s4E5AOft4V53lUceG
	 FVzH4eNX5/Ggg==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH Resend] perf/arm-cmn: Remove CMN-600 DTC domain special case
Date: Thu, 17 Apr 2025 15:27:31 +0100
Message-Id: <174489529052.2689886.10372399448394123853.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <67985e39f53b56385d79a4f1264cf7f9cacedb58.1742308248.git.robin.murphy@arm.com>
References: <67985e39f53b56385d79a4f1264cf7f9cacedb58.1742308248.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_072802_187358_88FADB7E 
X-CRM114-Status: UNSURE (   8.57  )
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

On Tue, 18 Mar 2025 14:32:10 +0000, Robin Murphy wrote:
> The special case for trying to infer the DTC domain for DTC-adjacent
> nodes on CMN-600 is fragile and buggy - currently resulting in subtly
> messed up DTC counter allocation - and the theoretical benefit it
> offers to a tiny minority of use-cases arguably doesn't outweigh the
> inconsistency it offers to others anyway. Just get rid of it.
> 
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/1] perf/arm-cmn: Remove CMN-600 DTC domain special case
      https://git.kernel.org/will/c/674cd7740257

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

