Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D0A10A62D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 13:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7fXVO0yjYKTkqweEO6PgXX0KRJ/sPHoV4L2y+iE8+38=; b=fDnsp09SjMrcZ8vx97qmvxn9GI
	BZmipHO15TdBnaj+oTpN8xhdSBDOcNBod1NlRO668e7StTMwDyRmL9Y5/N1JkMEh05G2bx/jG67T5
	IBBDFjvC8KHP2jOyjMVFVpG+RC7Rr+6JIqpLkq+YniNLW64uGbQYWlrXgT2lJe4dYxne+z2pCjR34
	gPFqp9O7LsCRreiC0MX77c/rsOdWIMyM0hy7sPDNx0WmVe3jPdjqtsG+0TI5dXdcemndmu50x/77F
	hVDPGEMqyI27bLd49NAVUpytgX6KL8DzZxYrcc30lhlUPYl2OO3NksrXnWHpkjZdUJ2gmkJa+ZDj2
	4f5E6JBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5l1U-00000005ZdD-2BRK;
	Thu, 26 Mar 2026 13:45:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5l1T-00000005Zd7-2fdJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 13:45:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BD88D600C4;
	Thu, 26 Mar 2026 13:45:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8933C116C6;
	Thu, 26 Mar 2026 13:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774532718;
	bh=1RUDs/9GC+fFfkZ7Xw9OHg2v+oefEPRSauOQRqYim1g=;
	h=From:To:Cc:Subject:Date:From;
	b=pT23BNEfK2FUxlSWXAMp4SOiPypuCj5X7I7l1FTyiUwCAQSVMi5SqVpGidmm1/VaM
	 3BI+uKWuye9nq3XUyhU/Fdw9iK+34qj20Wt0eSNaE1BosFowO1KGC5xnLa74OrdOwA
	 GX/+v/8TE19IEe4tmLpySIf7XyTv6qIqacOmMs8+bOqBa7BOlrY8zEnadlTpJqkl2w
	 8qqjBMcCdugplAqykfnqzXNs/bcduAFwWkEdLrBHv1eyOGVABYs3qLliSeLp0JM4Lq
	 74IqmSfogtr/aziWHgQD7J15PFl0RWf5hQETT9HYKT3UU3pb86nNnjfs13K6LyKqdN
	 6XG9C6TqBjArQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm clock fix for v7.0
Date: Thu, 26 Mar 2026 08:45:15 -0500
Message-ID: <20260326134515.67326-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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


The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-fixes-for-7.0

for you to fetch changes up to 141af1be817c42c7f1e1605348d4b1983d319bea:

  clk: qcom: dispcc-sm8450: use RCG2 ops for DPTX1 AUX clock source (2026-02-23 10:45:35 -0600)

----------------------------------------------------------------
Qualcomm clock fix for v7.0

Fix the clock ops for SM8450 DPTX1 aux clock src to ensure DisplayPort
works.

----------------------------------------------------------------
Dmitry Baryshkov (1):
      clk: qcom: dispcc-sm8450: use RCG2 ops for DPTX1 AUX clock source

 drivers/clk/qcom/dispcc-sm8450.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

