Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5722E77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 14:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AvpBceayWT2N/8YzqJP7JRLWTkHepNSRzDJHee7wcnE=; b=y0k9xW1UPyFMYw8pvAfPcMNxSN
	6Uihbv1RRCbCTtl2BlcgTVuPjhloORVnPDE4plTs/s+g8tFHpWH90N8eVmjSNR+W4Z6gmoKNSXxsU
	8OyL9f3jcSKxMaVCAfHr7RzGZ6jHYH5gxDlVgFhdCjQfNFTSzH9fJuRmvGDaDBl48XeZNz1zarpan
	QlmLrGs4iRnQPywu0rwS+zsrOPJzPrjQwsg/Gm/IweRgSJoh/5ODXlwYCZ5sWxgm7+PrNxR7qYYWx
	yPpiV+QCIriHzxeFqDeWhzHUgbia2mnO8b9XxKGXvG9KMY1bTviCOcubVQOMHceg+oBmWAB48lNYk
	KnxByxrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLNNz-0000000F5pd-1hs2;
	Wed, 11 Dec 2024 14:08:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLNMv-0000000F5fM-0i34
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 14:07:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1511E1063;
	Wed, 11 Dec 2024 06:07:39 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E834E3F720;
	Wed, 11 Dec 2024 06:07:09 -0800 (PST)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aishwarya.tcv@arm.com,
	catalin.marinas@arm.com,
	keescook@chromium.org,
	kent.overstreet@linux.dev,
	mark.rutland@arm.com,
	peterz@infradead.org,
	will@kernel.org
Subject: [PATCH 0/2] arm64: stacktrace: Fixes
Date: Wed, 11 Dec 2024 14:07:02 +0000
Message-Id: <20241211140704.2498712-1-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_060713_246360_59FD48DD 
X-CRM114-Status: UNSURE (   9.10  )
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

These patches fix a couple of issues in the arm64 stacktrace code. Both
address some fallout from the recent changes to unwinding across
exception boundaries, though the issue in the second patch has been
latent in the code for a while.

The first patch was previously posted independently at:

  https://lore.kernel.org/linux-arm-kernel/20241209110351.1876804-1-mark.rutland@arm.com/

... the version here has a better commit message, but is otherwise
unchanged.

The patches are based on v6.13-rc2, and I've given them some light
functional testing (booting them and running the test cases in the
commit messages).

Mark.

Mark Rutland (2):
  arm64: stacktrace: Skip reporting LR at exception boundaries
  arm64: stacktrace: Don't WARN when unwinding other tasks

 arch/arm64/kernel/stacktrace.c | 32 +++++++-------------------------
 1 file changed, 7 insertions(+), 25 deletions(-)

-- 
2.30.2


