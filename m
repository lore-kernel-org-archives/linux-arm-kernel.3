Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34055C71135
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 21:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RYv6fuwYSx+Nj0tD9GequmpjI+T70DSn4qg9hmVoiWw=; b=mi5ga6qAahNiW/kvnMDVxcDK1E
	ZgxInu1WoQ4fnnOEREJZBll+s+AlyfnHZ8MIRJm3wOAq/Cxt0xWc2wzVXpWIi0+bJvPv+W+89GZzW
	W7IJmJpfx1f0j1J+oLXKpkQJHsv2JFp1MF4QiJJkoB0gxCRkHj+gNOT0xGTTPNap3Fj2vBIYOE2j5
	ffgejg8Esk/GZUmZrCWB0gdDB7r6e3S9L+qFI3Y6qf9bt/CU89HVMgTwkmChYeh3WpD+r3MiOsBlS
	8VFI8cwKXhBQ7ysDKGVX9CVkppYxkjOcPVFXsV2G3ZB+NhnlzYVu5968eukSSqoZbnKCtPrTpNppe
	I63X8Q0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPTBL-0000000BMk9-11nR;
	Wed, 11 Jun 2025 21:40:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPOhr-0000000Afix-30q4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 16:53:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E7A244069;
	Wed, 11 Jun 2025 16:53:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FC1EC4CEE3;
	Wed, 11 Jun 2025 16:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749660823;
	bh=RnyH9auVBNB2aIaoFpYtwzDjMiTSZDk0KXkdiyuzoDo=;
	h=From:Date:Subject:To:Cc:From;
	b=u91w3VkLCt1rlBnTOloWF8usZKzkddwlPH3q4I0GQ8NxOEU1YZUpN5F04p6sl56LY
	 TVegEtv5YIjBT/gkAbIvhr089ymt3nj2ia8wz/4AGt+1iXxn2KxijgZCeS2G6ALYSf
	 Z+q0GPPZcVBiEeuiDmHAYHTlZTK+iDMac0N3Gua+56J9bdnCkoroCgw7wExOTMSRMm
	 CO6rBMukynKIr8IkoLoQRmrhAoQwYyollgO9wZUqeUy/hGBDPZHbiPjj9gsL7UVbuZ
	 JM0KrT5rb1MLISLi4jZJksz8TrYjnHBL6JjrSvfCKWZhZ6F6aLgxQxZPCfZlIAe5U8
	 Pj7B9NZIe44Ig==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 11 Jun 2025 17:28:13 +0100
Subject: [PATCH] arm64/gcs: Don't call gcs_free() during flush_gcs()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-arm64-gcs-flush-thread-v1-1-cc26feeddabd@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJyuSWgC/x3MSQrDMAxA0asErStwTMZepXQhbDkWZChSUgIhd
 6/p8i3+v8BYhQ2e1QXKXzHZ1oL6UUHItE6MEovBO9+6zo1IunQNTsEwzYdl3LMyRRyIU/LU17G
 NUOKPcpLzP3697/sH2SqF8GgAAAA=
X-Change-ID: 20250609-arm64-gcs-flush-thread-8aeff2a71d5d
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=broonie@kernel.org;
 h=from:subject:message-id; bh=RnyH9auVBNB2aIaoFpYtwzDjMiTSZDk0KXkdiyuzoDo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoSbSV6KcW+wzdUNdaAVIdHETuBky51uFryppRol00
 PuB3vJqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaEm0lQAKCRAk1otyXVSH0CCGB/
 9mEMaB4ctpK7VcA2rMXXi1cHbOgcOAf5Fy8UyDkAx+ziIJ0ALWLvuqNpcNPULbloW8eWcSU7D9qUiF
 sCoozylGtf6zJ/+nv7inDzmfKr9TKpD0yfZQnPMyWiwUtoYtpQuqqhHubFwXPOGrnoqWoYW7yj6Lh3
 gF8boGBdvG7wzcKE51zs/s2vO0W1GgTsb6RH0K9KKqOT/Y+qb/QIie/QoSercPJAd/92m7X8/PSyNw
 1JVe5y4ceEEeRlUQxY6iovKfkKnWyPTmU9pZGbS+TP8ROazpfUQe96q0JOSTvDEFt2z55Q4Q2J+pQe
 5/xbY/nc0orrDX2liWfcgXIe02LyLb
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_095343_777665_B2EBAC9F 
X-CRM114-Status: GOOD (  10.55  )
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

Currently we call gcs_free() during flush_gcs() to reset the thread state
for GCS. This includes unmapping any kernel allocated GCS, but this is
redundant when doing a flush_thread() since we are reinitialisng the thread
memory too. Inline the reinitialisaton of the thread struct.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kernel/process.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index a5ca15daeb8a..5954cec19660 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -288,7 +288,9 @@ static void flush_gcs(void)
 	if (!system_supports_gcs())
 		return;
 
-	gcs_free(current);
+	current->thread.gcspr_el0 = 0;
+	current->thread.gcs_base = 0;
+	current->thread.gcs_size = 0;
 	current->thread.gcs_el0_mode = 0;
 	write_sysreg_s(GCSCRE0_EL1_nTR, SYS_GCSCRE0_EL1);
 	write_sysreg_s(0, SYS_GCSPR_EL0);

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250609-arm64-gcs-flush-thread-8aeff2a71d5d

Best regards,
-- 
Mark Brown <broonie@kernel.org>


