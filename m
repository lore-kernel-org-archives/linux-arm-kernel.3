Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C2AD68BF9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Nov 2024 10:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Gk+/CzHV3RkQ7mr+TcU9c3T3Tzad8gqPxgxOGgsPZBY=; b=URjap6YPmVkKRGY6s1/nLeiw/H
	2tKBvCO+Ke08DVw7ladvCBeD2BFfV78c0ujPh7F14QdJ/eWikZEOCtiQP7F58jbtDt+MvHPjQpgYA
	1HOijI6oZx5pQn1Zo7xfzxKYJboGQu/Ie/BHSyhz9Rvt/i2LWINTQKa2ajzHlWuQfLH9TCphqOe5q
	Qp1vSN0hSvTNl4MTfqXI0bxp1EH7hd7LRfT3qLgQVHuNdxF73+ENQQqVND6Joqx37QOdchmwDIMBS
	C7Z0YzyM29W2ms1rSuWcrFzJWcb/TxmNeCwhUKBkGQbsvDw5H+zpPQybHfadUz1rLs52H8GE8yo0K
	9O5Y2Xpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCcPP-0000000797r-26bC;
	Sun, 17 Nov 2024 10:21:35 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCcOT-00000007937-2yrV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 Nov 2024 10:20:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1731838830;
	bh=XnwVRnokFrmnC2nPBW2Pi8KvS5rKZccAQiigQhSs2FU=;
	h=From:Date:Subject:To:Cc:From;
	b=awj33hk7yn8l/H81ibggz6xMsjMLtTqqX2JhUJz7RMSZG1FRXkafY1cLjjA+rlVoM
	 lGZ16NyjVDl3L8AR9lAhneKCmxFnSnDDEX8OwPbA+E9C7cInejCO5wl5rsmbwXgczA
	 fHI8tHASIncJDxzmCheRBynpd8CZdN0pqILEZUxY=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 17 Nov 2024 11:20:16 +0100
Subject: [PATCH] perf: arm-ni: Fix attribute_group definition syntax
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241117-arm-ni-syntax-v1-1-1894efca38ac@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAF/DOWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQ0Nz3cSiXN28TN3iyrySxApdI1ODRAtjA1MLUyNLJaCegqLUtMwKsHn
 RsbW1AKAERsxfAAAA
X-Change-ID: 20241117-arm-ni-syntax-250a83058529
To: Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731838830; l=1098;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=XnwVRnokFrmnC2nPBW2Pi8KvS5rKZccAQiigQhSs2FU=;
 b=4vVy3arO72EZfxh5ovfjA9bszsEuseGV5JKPtX1fS44RPOS8gDEWaXZkeE7z0jby1AZj3JhIS
 f+1tpOskReICe/Vr7766JoBLqx/vIkoHgXdED1cLhG/bhK4rbGRrBv+
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_022038_182260_41B1781B 
X-CRM114-Status: UNSURE (   8.81  )
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

The sentinel NULL value does not make sense and is a syntax error in a
structure definition.
Remove it.

Fixes: 4d5a7680f2b4 ("perf: Add driver for Arm NI-700 interconnect PMU")
Cc: stable@vger.kernel.org
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Cc stable because although this commit is not yet released, it most
likely will be by the time it hits mainline.
---
 drivers/perf/arm-ni.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/perf/arm-ni.c b/drivers/perf/arm-ni.c
index 90fcfe693439ef3e18e23c6351433ac3c5ea78b5..fd7a5e60e96302fada29cd44e7bf9c582e93e4ce 100644
--- a/drivers/perf/arm-ni.c
+++ b/drivers/perf/arm-ni.c
@@ -247,7 +247,6 @@ static struct attribute *arm_ni_other_attrs[] = {
 
 static const struct attribute_group arm_ni_other_attr_group = {
 	.attrs = arm_ni_other_attrs,
-	NULL
 };
 
 static const struct attribute_group *arm_ni_attr_groups[] = {

---
base-commit: 4a5df37964673effcd9f84041f7423206a5ae5f2
change-id: 20241117-arm-ni-syntax-250a83058529

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


