Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F34606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 04:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Bf/yCyp7;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mSMcCrKX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=cWiKbKgJwx/tU3tSKoTmJCpiwOyxJ2711fH4tsRrR6g=; b=Bf/yCyp7IH1s9YKo9u97L8aYJC
	J4Gd1VLOn09XA4yIK3yTtKywJ1nnL6pmAWd7TsUcO0MM8MPjIYGRsS/p+nJEN35fbO2YYaJT7mbR8
	n8UG7qnoRSOmrc80X0EsIkdNsVVcWxtPKEA2l9UTD4/WRfWffeVKFGPF3ZQNT//8Mj07aYOz0oHFc
	2wHJDavAJPrUneEn6uc9m+tldpUjShEWf3WRFY62V6//OYOifO9Jkvu7nXmN59y3GniRU2rWj4vP7
	DNBHeqD6WDMliwNZjg+LakpvSFXFn9LQNM046OszcUTLgvGvV4Q7Dw6Idjmk0EfGRSPgJcZz7z1OO
	cmiWNCGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOolL-00000007k0o-1FXh;
	Thu, 05 Nov 2026 04:07:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOolJ-00000007k0i-48Ms
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 04:07:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5D33743CA6;
	Thu,  5 Nov 2026 04:07:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793851661;
	b=YekqO9cLddD5fJP6glKpQErHeu3HqktOtlHmjW/53pwwWuczqVxZVlTNWsu8dVGbaOri
	 dPWUkbW0p/OTv+iq5z6VR34l1FuwzKSc+AvihPRImr7waoc0tqoSLiFzgewf5zd7N+Ov7
	 4A0O+twy3iUyOy+LX6auSWPwia86W1qEtw2WpYPAfLfCaAPtOfrcghxYuecIqPqjo8uVO
	 qbgeTTHxZ9UKXcErfI6lRJLZZe0mOV8bdeYOsSbUrbwuL4regeOZFxi1qwNhc53Z/UMl/
	 Wm3AywffpyMnSfL6p1liGygBMYEA16gZAVkTzCBy/hX+9klOAG8jhUTnEk7aptxRTNA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793851661;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=cWiKbKgJwx/tU3tSKoTmJCpiwOyxJ2711fH4tsRrR6g=;
	b=Oiqtjc4do4CHGHPFOFt0OBut8AziZuobgEjAvz4290lamkHAbNlxpWccmR0Lo7zzEorw
	 Qd25LQMNqgx3hlIfM/KrsWkmENY761VuxxkRn2qPIA/eCWBzhXXnO1nfYHbQ2ivmJuA0c
	 Fepn/VtFwz3ydTc3PDlxMDEq/P29oXD8qmgzgH87zuXafAMShRFrVBTXpL+JJCEcXpzjx
	 DQeHjHttdsUo+MbbMQm38KdrVAgRtSJ8atxVrNbKN1OGSB9YRqhr6y+6NImU2Thr0CODV
	 b4RPfzIcuEQUkowkYLjIA9ldBWiCBg4pM5S/mRXOXY4HkliHXa2JarjRyirLNi8OVOg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C27951F000C1;
	Thu,  5 Nov 2026 04:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793851661;
	bh=cWiKbKgJwx/tU3tSKoTmJCpiwOyxJ2711fH4tsRrR6g=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=mSMcCrKXRuQTgvFCCbTVjrPfB86fsS/aP5Jw5/LExmP9hniTIaeyrBlodTl/IY2+h
	 46oXyVWxvlrEptvFyLtjQNgzMrKOX3S8CpaFcpOkaAEhKDRBF7K6gRvsC6PU7n9Nhm
	 O/kVUQPg1OHlEX3158xtU7yryM2QmvQm07Loi0y4WJyi6EEMLrjCrJsawyHxcrj6c8
	 sG3rk9fBjO9vS8sA4294eu8xxeAfRsqAx5KiqdLjJywofQ7HFwZzp+OmQ5s0p4gdAQ
	 hfDGF46AZqW6Nd85bX2UYADrWlD5hKI8mL/Q9u92aFVVDSbmNsOVHRFuba/2yMWHac
	 JM26kmSbHsqGA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2242C4707F;
	Thu,  5 Nov 2026 04:07:40 +0000 (UTC)
From: Rajan Yadav via B4 Relay <devnull+rajanyadav0307.gmail.com@kernel.org>
Date: Wed, 04 Nov 2026 22:07:40 -0600
Subject: [PATCH] cpufreq: sun50i: Handle boards with the
 allwinner,sun50i-a133 compatible
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261104-a133-fix-v1-1-d0b5ad3d4c5d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAsB7GoC/yXMwQ5AMBAE0F+RPWvSVVH8ijgUi3UoaRFJ498Vx
 zeZmQCeHJOHOgng6GTPq43ANIF+NnYiwUM0ZDIrEGUuDColRr4Eaa10KSscKIdY3xzF+Ltq2t/
 +6Bbq93cP9/0AbGKilWwAAAA=
X-Change-ID: 20261104-a133-fix-e77378091de4
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Yangtao Li <tiny.windzz@gmail.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Rajan Yadav <rajanyadav0307@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793851659; l=2906;
 i=rajanyadav0307@gmail.com; s=20261103; h=from:subject:message-id;
 bh=4A7N9YN5wiX+ZykiP94lXzZf0+Fik83P+lyG8T8jS7g=;
 b=p+QFXeDZgAVLOudiBWC8+l6munkc1+dSGo/H5Tu3dx+asH/x36G4WB9M63AsGRKC1z7f6zyMW
 N8dAO+vX0x2DVlqSLbC9ZZhF5cHmo5aCniUjFwn45Ycc6tNyUp2rca1
X-Developer-Key: i=rajanyadav0307@gmail.com; a=ed25519;
 pk=4ZPeiP5qrv2b44q/Obxi2koUS70Q6npbttJnpUoTlgg=
X-Endpoint-Received: by B4 Relay for rajanyadav0307@gmail.com/20261103 with
 auth_id=1391
X-Original-From: Rajan Yadav <rajanyadav0307@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: rajanyadav0307@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Rajan Yadav <rajanyadav0307@gmail.com>

The Teclast P80 uses "allwinner,sun50i-a133" as its only SoC
compatible, as documented in the arm/sunxi.yaml binding. Neither the
sun50i cpufreq driver nor the cpufreq-dt-platdev blocklist lists it.
cpufreq-dt then probes on its own, finds only opp-microvolt-speedN
properties and fails:

  cpu cpu0: opp_parse_microvolt: opp-microvolt missing although OPP managing regulators
  cpu cpu0: _of_add_opp_table_v2: Failed to add OPP, -22
  cpu cpu0: OPP table can't be empty

so the board runs without CPU frequency scaling.

Add the compatible to both lists.

Tested on a KickPi K5C (A133) with its root compatible changed to
"allwinner,sun50i-a133" only: on v7.4-rc1 cpufreq fails as above, with
this change the sun50i driver probes and the A100 speed1 OPPs are used.
v6.18 fails the same way, also with "kickpi,k5c" listed first.

Claude Code (Anthropic) drafted this change and its message from my test
logs; I reviewed and tested it.

Fixes: 60b064eb82e6 ("arm64: dts: allwinner: A133: add basic support for Teclast P80 tablet")
Signed-off-by: Rajan Yadav <rajanyadav0307@gmail.com>
---
This fixes the Teclast P80 support added in v7.4-rc1, so I think it can
go in as a fix for 7.4. I do not have a Teclast P80; I reproduced the
failure on a KickPi K5C as described above. A series with A133 speed
grade support, which Andre asked for, follows separately.
---
 drivers/cpufreq/cpufreq-dt-platdev.c   | 1 +
 drivers/cpufreq/sun50i-cpufreq-nvmem.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index bce4c87573a..6bdeba47749 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -110,6 +110,7 @@ static const struct of_device_id blocklist[] __initconst = {
 	{ .compatible = "airoha,en7581", },
 
 	{ .compatible = "allwinner,sun50i-a100" },
+	{ .compatible = "allwinner,sun50i-a133", },
 	{ .compatible = "allwinner,sun50i-h6", },
 	{ .compatible = "allwinner,sun50i-h616", },
 	{ .compatible = "allwinner,sun50i-h618", },
diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
index 9261d148a16..5d4ff192e99 100644
--- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
+++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
@@ -324,6 +324,7 @@ static struct platform_driver sun50i_cpufreq_driver = {
 static const struct of_device_id sun50i_cpufreq_match_list[] = {
 	{ .compatible = "allwinner,sun50i-h6" },
 	{ .compatible = "allwinner,sun50i-a100" },
+	{ .compatible = "allwinner,sun50i-a133" },
 	{ .compatible = "allwinner,sun50i-h616" },
 	{ .compatible = "allwinner,sun50i-h618" },
 	{ .compatible = "allwinner,sun50i-h700" },

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261104-a133-fix-e77378091de4

Best regards,
--  
Rajan Yadav <rajanyadav0307@gmail.com>



