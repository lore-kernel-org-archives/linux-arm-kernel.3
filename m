Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37CF2CCF9FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 09:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vJtNJzCB1CGSdLRVMxytOpqGOSIy7bSfDb3jg/B2Q/w=; b=GPxLyTblYrGUADgDZ+Mszwhl46
	BwUc90UFeBBO2O7tF8C+0jMeyp22+ufCjmEKaQu/li+lopxPkd11R7/ztdIr0R07Q8cxM64Lo0K6r
	nhhEZHXpg5b/bIDAzixV4YGztvi9keNUEHVGAJKnaSMcl1QQBFU623jwGqc3wN5LgGeWfJANHQQTi
	eyXLNCytr9Blzw8i/H9QmZTjN13xbtlb+IGadEKvCgZPZN6pMxIyb85xbSoRAdp/NIHdbRD2Eo4Zn
	HYY0rz5lbOnMvJzy1a7qXYfL96Qu4zhD1XNBtDjtXGtDPz/ovQZEHkQofuhdsNrZAU7syk0ZrnOfL
	GU4aqewg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vElF6-00000005nFj-2jXK;
	Fri, 31 Oct 2025 09:16:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vElF5-00000005nF2-2Rv4
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 31 Oct 2025 09:16:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vJtNJzCB1CGSdLRVMxytOpqGOSIy7bSfDb3jg/B2Q/w=; b=Cqg4fuBsks/x3dEq1zYb1pMIPw
	UYiquEPzspmmwomvBH7YURKVULqjmQk74zSDK+U3tls4mcUEpGjMZVztXv6aOkBPJZ+eQcZ3QFCN/
	fbCWgaAvIofnMY8sBl8V370eNHWSzzr4Ao3DFwLclCjKChjjkn8IHyMvLXCcqnwnifdVFsNfiE4T/
	dJWvzwA7rBnmyhlpzhbQpfTwL0MN6VOyQLbfItyvdnE7FcOkHNHaFmagzgca5nrGveuNHqXw2UUWC
	LvOfqdnX9SfNJC3QtZx2z7hkjnft+sXdv72VJeME3daV/6UTvJ8COeIq279oIOIxRlYLSc/5YvEpS
	1S0P12hw==;
Received: from wxsgout04.xfusion.com ([36.139.87.180])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkN8-0000000Asdz-1OFu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 08:20:38 +0000
Received: from wuxpheds03048.xfusion.com (unknown [10.32.143.30])
	by wxsgout04.xfusion.com (SkyGuard) with ESMTPS id 4cyZyg578fzB8NPw;
	Fri, 31 Oct 2025 17:13:15 +0800 (CST)
Received: from DESKTOP-Q8I2N5U.xfusion.com (10.82.130.100) by
 wuxpheds03048.xfusion.com (10.32.143.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_RSA_WITH_AES_128_CBC_SHA256) id 15.2.2562.20;
 Fri, 31 Oct 2025 17:15:38 +0800
From: shechenglong <shechenglong@xfusion.com>
To: <mark.rutland@arm.com>, <catalin.marinas@arm.com>, <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<stone.xulei@xfusion.com>, <chenjialong@xfusion.com>,
	<yuxiating@xfusion.com>, shechenglong <shechenglong@xfusion.com>
Subject: [PATCH v3 0/2] arm64: spectre: Fix hard lockup and cleanup mitigation messages
Date: Fri, 31 Oct 2025 17:15:04 +0800
Message-ID: <20251031091507.1896-1-shechenglong@xfusion.com>
X-Mailer: git-send-email 2.37.1.windows.1
In-Reply-To: <20250918064907.1832-1-shechenglong@xfusion.com>
References: <20250918064907.1832-1-shechenglong@xfusion.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.82.130.100]
X-ClientProxiedBy: wuxpheds03047.xfusion.com (10.32.141.63) To
 wuxpheds03048.xfusion.com (10.32.143.30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_082034_997804_ED5D8870 
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


On Wed, Oct 29, 2025 at 11:45:54AM +0800, Will Deacon wrote:
> Is the compiler smart enough to store a single string for the
> "mitigation disabled by command-line option\n" part? If not,
> you might want to use %s to avoid wasting memory. (I was going to
> check with llvm but I'm unable to apply your changes due to whitespace
> corruption).

Thanks, Will, for the helpful review. v3 incorporates your suggestion by
factoring the common suffix into a single const string and switching the
pr_info() calls to use "%s". The whitespace corruption has also been fixed
(restore tabs, no line-wrapped literals), so this version should apply
cleanly.


This series addresses one main issues around Spectre mitigation messages:

  1) Avoid multiple copies of the common suffix
     "mitigation disabled by command-line option\n" by using a single
     constant string and "%s" in pr_info().

v3 changes:
  - Fix whitespace corruption (tabs vs spaces).
  - Factor out the common suffix into a single static const and
    use "%s" as suggested.

shechenglong (2):
  cpu:Remove the print when the CONFIG_MITIGATE_SPECTRE_BRANCH_HISTORY
    Kconfig option is disabled.
  cpu: fix hard lockup triggered by printk calls within scheduling
    context

 arch/arm64/include/asm/spectre.h |  1 +
 arch/arm64/kernel/cpufeature.c   |  6 ++++++
 arch/arm64/kernel/proton-pack.c  | 37 +++++++++++++++++---------------
 3 files changed, 27 insertions(+), 17 deletions(-)

-- 
2.33.0


