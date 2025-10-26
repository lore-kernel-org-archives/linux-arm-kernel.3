Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87660CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 14:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pLsdOVxnHUgb3SiAyB9aqm4k5OwCQeWybuMs0L7ZoLI=; b=g3iOa3Ycc25yMHLSFYN5T36btW
	y4d+QcvLI0+BFjW4a6fTuMozv1OWzv5oW1OAgeprT27J9dofHTU7H48iXQziautXLWsdiumHF9uCQ
	pDRcOnDYchIQqxtMHSFFxIFO8JkOaIY+ttDd9fRs2aosb9t5WP7SE7ZJZQNZRt/aAzGhDJVm5+kIN
	nvJusrK/bz2rUWzcn06Nwnkh5wn8YkTdcX7T53m3VvWFdN9Xz++v4427e+wOQP7MDc8DjJ0ObLfH0
	bcz+d0XrRY62HvFV4DUwk6tM7M/aUsFUefcwEYSz5iCcbYG4m46UlW/+aJ+9bY+kzcer0wjJDO35e
	pZTsh+8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD25B-0000000CS8T-1jWs;
	Sun, 26 Oct 2025 14:50:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD24y-0000000CS0x-48M0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 14:50:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 97D8D4496B;
	Sun, 26 Oct 2025 14:50:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E2F3C4CEE7;
	Sun, 26 Oct 2025 14:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761490244;
	bh=hItZ/nQ92TYBe6pBH4hVPjO4G4EKPIeoQBm01mngkUI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Spr1Z5PU84EpzX657iBqm6cwWik5vbViMndsC0Q25wvuZBxlwXuGf7VeoKegI5DSZ
	 ny56iNpul/+OOUuafebJv+tUmXt4eJktAqL6UzdLg8W7SfFW5Ms+Mm33MKoipp2zOJ
	 7xSP4uL2ZadYKAPdXrz556tflK+X0aUOWwyRO18m8WWMMoX1Rsy/9eyWPLtn6I3pRK
	 LaGRz9FKNTj3oRFWyY6fCpVhmABStkavwUzgEFA9oWxxJyLWmt3Ggyuu7K8OyRpQ6P
	 U69n7CX13DCvKJVSs2NEHkCzFOqxjSRoSkvbyAHalmcf1rkveZyE0S/ISezlXhZPm5
	 i/yNMkCWYufUw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Ryan Wanner <Ryan.Wanner@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Sasha Levin <sashal@kernel.org>,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	alexandre.f.demers@gmail.com,
	alexander.deucher@amd.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.17-5.15] clk: at91: clk-master: Add check for divide by 3
Date: Sun, 26 Oct 2025 10:48:57 -0400
Message-ID: <20251026144958.26750-19-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251026144958.26750-1-sashal@kernel.org>
References: <20251026144958.26750-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_075045_114893_E6906BE8 
X-CRM114-Status: GOOD (  14.28  )
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

[ Upstream commit e0237f5635727d64635ec6665e1de9f4cacce35c ]

A potential divider for the master clock is div/3. The register
configuration for div/3 is MASTER_PRES_MAX. The current bit shifting
method does not work for this case. Checking for MASTER_PRES_MAX will
ensure the correct decimal value is stored in the system.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES – the change fixes a real bug in the sama7g5 master clock code with
minimal risk.

- `clk_sama7g5_master_recalc_rate()` now treats the special register
  value used for divide-by-3, returning `parent_rate / 3` instead of
  wrongly shifting by `1 << 7` and reporting a 1/128 rate
  (drivers/clk/at91/clk-master.c:583). This corrects `clk_get_rate()`
  for every consumer of the master clock when that divider is active.
- The rest of the sama7g5 clock logic already maps the same register
  value to divide-by-3 (e.g. `clk_sama7g5_master_set_rate()` stores
  `MASTER_PRES_MAX` for a /3 request), so the fix restores consistency
  in the clock framework and prevents child clocks from inheriting a
  bogus rate (drivers/clk/at91/clk-master.c:732).
- Other SoCs using the generic master clock ops are unaffected; the new
  branch lives only in the sama7g5-specific implementation and matches
  existing handling of this divider elsewhere in the driver
  (drivers/clk/at91/clk-master.c:392).

Because the bug misreports hardware frequencies and can break downstream
rate selection, and the fix is self-contained and low risk, this commit
is a good candidate for stable backporting.

 drivers/clk/at91/clk-master.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/at91/clk-master.c b/drivers/clk/at91/clk-master.c
index 7a544e429d34e..d5ea2069ec83a 100644
--- a/drivers/clk/at91/clk-master.c
+++ b/drivers/clk/at91/clk-master.c
@@ -580,6 +580,9 @@ clk_sama7g5_master_recalc_rate(struct clk_hw *hw,
 {
 	struct clk_master *master = to_clk_master(hw);
 
+	if (master->div == MASTER_PRES_MAX)
+		return DIV_ROUND_CLOSEST_ULL(parent_rate, 3);
+
 	return DIV_ROUND_CLOSEST_ULL(parent_rate, (1 << master->div));
 }
 
-- 
2.51.0


