Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D09CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 18:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kKo7HbfHDALCRSJTnJ2DTLRrw9oEBvNrCmjnRqJaJ9o=; b=crb5Mvlr7PwmNGYiTPNbOQbNBs
	Jtkx+puIfzqU4EYzKB2JvNKPH13WviT80gHGyKI9AyQGSL0uWRNQlubqE4JsfGKgW2m9NcTtMiyIG
	AyVFEf7jsP9KXprOof0y5T2ADeqYMeshvOQC/Vn0FNBrVcCFg0ox3PYwZVPfyMlXyHr+4ox/SGWDq
	FYs9A2sovgh2YIaLCsBDAgBrRo8mV9UtdIHhjw/oRxZ0J9ZKd6A7OUhsjP2g4XXnPTp/7egw/xFCc
	ICro4Kng5+YyDFKHpnbVNXz5n6RYwO9XZZCPDtwVVTCgzGK2eqU1VwW0Ov6S+HsMGZ/oebpb92TvJ
	HESnKLtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCiJa-0000000CIkx-42HZ;
	Fri, 02 Oct 2026 18:49:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCiJY-0000000CIkW-0u6a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 18:49:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 754962F;
	Fri,  2 Oct 2026 11:48:55 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C8D8E3F86F;
	Fri,  2 Oct 2026 11:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790966938; bh=sK5tYxknClWdAbipyaHWWd/2P2JBuzpdG2B3l1itnTM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J5txP/ih8bck06EuRngr+7zB63Fkc7cvc79d44Ech54BBRMQgq/9iRxrLautn8Gcm
	 CWUllr853SSvrS/jswA+HC5OYsctGlnrsNsj36dp28dEkInrRpCdJqkRpGfNpu7YBx
	 5OtLz09foehOym/HF++cccvkWoJWNTIGSNg/CIRA=
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	steven.price@arm.com,
	gshan@redhat.com,
	aneesh.kumar@kernel.org,
	maz@kernel.org,
	oupton@kernel.org,
	mark.rutland@arm.com,
	linux-coco@lists.linux.dev,
	Fuad Tabba <fuad.tabba@linux.dev>
Subject: Re: [PATCH v19] arm64: mm: Handle Granule Protection Faults (GPFs)
Date: Fri,  2 Oct 2026 19:47:14 +0100
Message-ID: <179096683483.2356212.14994831758332175382.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260930164930.1388438-1-suzuki.poulose@arm.com>
References: <20260930164930.1388438-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_114900_376997_2A142338 
X-CRM114-Status: GOOD (  10.48  )
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

On Wed, 30 Sep 2026 17:49:30 +0100, Suzuki K Poulose wrote:
> If the host attempts to access granules that have been delegated to RMM
> (for use as an RMM object or Realm Data), these accesses will be caught
> and will trigger a Granule Protection Fault (GPF).
> 
> A fault during a page walk signals a bug in the kernel and is handled by
> oopsing the kernel. A non-page walk fault could be caused by:
> 
> [...]

Applied to arm64 (for-next/fw-rmi), thanks!

[1/1] arm64: mm: Handle Granule Protection Faults (GPFs)
      https://git.kernel.org/arm64/c/27fececa00df

This is needed since as soon as we add RMM activation, the kernel is
exposed to GPFs via at least load_unaligned_zeropad(), even in the
absence of guest_memfd.

