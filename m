Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8DBCAC598
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 09:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XmU969/Ie3arL5eIHosZz/xZVju1gPBqUEjDt+zem8w=; b=Zo80l6w+oXlEV+E4CbveTWH3iK
	/xFjyvjzNzAxZ2xWbxXTTax4E3MaAhPlmIcSa9Dg2SdLKjsr2LcCH6Pm+DjXE0x9zsfxk8iypNRT+
	uwZeZraZDZa0O19qDmMDfP7KGGwUtMKI3x+OQAnmDldsAqZGU7gTctSx3NSn5htct8v9oZDq6LYBH
	MsxOfbmno85YghxzScGRGTUUiv0VKtehHJE8aJiVMcsDd0NC3RMlE06SeeICkudawSOmoVlS+z//k
	4sD7pfqnfdH/BfHfonHoWOralNdpO4jihzNJbfAJ0qH5Kd5QlXjtkp2oJ/vP/8Gn1BbaIaq+nj712
	wraN/jPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5se-00000003X87-0o7S;
	Mon, 15 Sep 2025 09:52:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5sc-00000003X7g-3d6z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 09:52:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F0A460191;
	Mon, 15 Sep 2025 09:52:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBF4BC4CEF1;
	Mon, 15 Sep 2025 09:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757929933;
	bh=GjsbRcQ1rdxsj6BWFVjK+U7PKN7gG/WTi1mQQDE8eW0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XgAMqD5LBxWWoMnDPGyehZfx3mwCIVEBp227sZI8Bps+DLRwRCf7EjlySL6TkXYHu
	 RAN8tG0mZDilVFHBgATHxz5VQTi+zhdstpNWX3fgHLW7e5Euj2HDnv4cDIv444nd5P
	 IJGQ5Yy9OCzpiGCz9SlQVMvEPPT7/iZ6k89Z486a2B9YLLb01y1POsr3NM+6PWrFiT
	 KbvQRoQuLwoM72R+37FgV/ZEF8DphUiZz86yz2HCEsFf49dMtxUrVaDrt8V3zQ4yog
	 GzVMXByJgjcxqRXk1DMxKnGB4TnR+/FlXHMlt4APAlMDXzXbweNjnMLvjn9qbKGMyM
	 iw9wjC6BMYBmg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uy5sZ-00000006JY2-3pOS;
	Mon, 15 Sep 2025 09:52:11 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Sebastian Ene <sebastianene@google.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2] KVM: arm64: ptdump: Don't test PTE_VALID alongside other attributes
Date: Mon, 15 Sep 2025 10:52:09 +0100
Message-Id: <175792991797.521490.13445837593336164540.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250809135356.1003520-1-r09922117@csie.ntu.edu.tw>
References: <20250809135356.1003520-1-r09922117@csie.ntu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, r09922117@csie.ntu.edu.tw, oliver.upton@linux.dev, joey.gouly@arm.com, sebastianene@google.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, anshuman.khandual@arm.com, mark.rutland@arm.com
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

On Sat, 09 Aug 2025 21:53:56 +0800, Wei-Lin Chang wrote:
> The attribute masks and test values in the ptdump code are meant for
> individual attributes, however for stage-2 ptdump we included PTE_VALID
> while testing for R, W, X, and AF. This led to some confusion and the
> flipped output for the executable attribute.
> 
> Remove PTE_VALID from all attribute masks and values so that each test
> matches only the relevant bits.
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: ptdump: Don't test PTE_VALID alongside other attributes
      commit: 8673e5b22e1e114213d3ca74f415034aed45e528

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



