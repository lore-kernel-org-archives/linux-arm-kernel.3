Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D09D8F53D65
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 15:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/nZIQpsgZ5SCH+N0Q7FFtSxplZdwysPVPvTmz5hy+dA=; b=rt5DtKUqpv0dKreYSnM4lBRzdS
	sQn6UeHBUWWZn4wGCtuSy5OlfKpMiV3PFJ9NM19BxDXIeTaqXkzCZQ3AgeF8Ocb/g4kdSeKMxuzOM
	vCbh0+m0XNAuzVS6LNBH/IReieeAJ+ZqDfXH/M84O+uAIL8Dj81dFVdS8GactM60zoXGoheLCn+0D
	PhH6P1bzwiUSvYpW3MhcPM+QLLJfhK5peVImSlgR9RV03haDHUjqFhPCajLahRxEzWdlE9SlZOyoN
	WOr6ftG74X/G6D6UGCHcBtECXGK+8JvragKwvbGo46sNy01lDng4Wp+Ciad8ManGNQhSMQeIrC3yR
	gAzM6T8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29y1-00000004LT7-1Js4;
	Mon, 16 Mar 2026 15:34:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29y0-00000004LT1-3hcS
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Mar 2026 15:34:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=/nZIQpsgZ5SCH+N0Q7FFtSxplZdwysPVPvTmz5hy+dA=; b=DQcacn3NITaK/2H8VlYSmo8RoB
	4DuS8KqND1hBlYbBLW1ToCvlJLsz0eAO/bg3Du2YZYh8J8PjRgLk0q5lbzitA8uZ6s5QARruyzf8K
	w+wQA9GzqMam76h0yNLxw7yLsGgEP5kbswxjJSjQsmjK5uBmK48MhP/DfHZutdpNqn+05cEFwDvTz
	R0H0eazvQnNTN9jlHUKSeRCma3Kijs3TBVIgazJxJU97u4FR4VoqReq0CM5cKwEeip0JYH3hYL01C
	Ejvl9STLyRQDFhr6KqgPV+aZOkjfFvta7Hqv9WasbSFYNk48nBj/wjW+la5JyPw2oKyoRhdKSb6c/
	9W8tq13w==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29xx-00000007604-24SP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 15:34:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 64C5340A69;
	Mon, 16 Mar 2026 15:34:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 011E5C19421;
	Mon, 16 Mar 2026 15:34:43 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] firmware: arm_scmi: Support loop control in quirk code snippets
Date: Mon, 16 Mar 2026 16:34:40 +0100
Message-ID: <51de914cddef8fa86c2e7dd5397e5df759c45464.1773675224.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_153449_767046_7DFE279C 
X-CRM114-Status: GOOD (  13.09  )
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

Each SCMI firmware quirk contains a code snippet, which handles the
quirk, and has full access to the surrounding context.  When this
context is (part of) a loop body, the code snippet may want to use loop
control statements like "break" and "continue".  Unfortunately the
SCMI_QUIRK() macro implementation contains a dummy loop, taking
precedence over any outer loops.  Hence quirk code cannot use loop
control statements, but has to resort to polluting the surrounding
context with a label, and use goto.

Fix this by replacing the "do { ... } while (0)" construct in the
SCMI_QUIRK() implementation by "({ ... })".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Example:

    #define QUIRK_EXAMPLE					\
	    ({							\
		    if (ret == -EOPNOTSUPP)			\
			    continue;				\
	    })

    for (unsigned int i = 0; i < n; i++) {
	    ret = foo(handle, i);
	    SCMI_QUIRK(example_quirk, QUIRK_EXAMPLE);
	    if (ret)
		    return ret;

	    ret = bar(handle, i);
	    if (ret)
		    return ret;
    }
---
 drivers/firmware/arm_scmi/quirks.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/quirks.h b/drivers/firmware/arm_scmi/quirks.h
index a71fde85a5272aff..d8ba60b956522d04 100644
--- a/drivers/firmware/arm_scmi/quirks.h
+++ b/drivers/firmware/arm_scmi/quirks.h
@@ -20,10 +20,10 @@
  * named as _qn.
  */
 #define SCMI_QUIRK(_qn, _blk)						\
-	do {								\
+	({								\
 		if (static_branch_unlikely(&(scmi_quirk_ ## _qn)))	\
 			(_blk);						\
-	} while (0)
+	})
 
 void scmi_quirks_initialize(void);
 void scmi_quirks_enable(struct device *dev, const char *vend,
@@ -34,10 +34,10 @@ void scmi_quirks_enable(struct device *dev, const char *vend,
 #define DECLARE_SCMI_QUIRK(_qn)
 /* Force quirks compilation even when SCMI Quirks are disabled */
 #define SCMI_QUIRK(_qn, _blk)						\
-	do {								\
+	({								\
 		if (0)							\
 			(_blk);						\
-	} while (0)
+	})
 
 static inline void scmi_quirks_initialize(void) { }
 static inline void scmi_quirks_enable(struct device *dev, const char *vend,
-- 
2.43.0


