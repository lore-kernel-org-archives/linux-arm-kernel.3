Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE908606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 19:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gJ7xcIFl;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=fbhdUG1r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Qhg6qVfP+OrKVzTFTCDbEiFCVzMgrQLLwSIrUvrN/sw=; b=gJ7xcIFlqr/fc+
	mOsAEeuJR3M3H+IBFwB6DPBXoapwVYHRWJZSGamKjjfesvu18cOVzRkB0+foE4yn6nYsJa+LhKEXH
	m4XRhKoNe+iJSOSdiQs5XLpn/7Gs6nPdxk0giKC89zKdXX5jZs/N6fsqCRWTWR+0cRFMhKi2HiA64
	iPwM7zSu09DvrXqhTqQQhn8XzcG8zrq1sfsaZIIMKarqo08rQDS07FMX/Eavkz9Kk7fcAWw1yYg/e
	59Z2abt/IPm/vVeDjENOh+matiJldfr3Eo8DCbQrL1QvbxT9Yb+JspfGgwX8rnN24+w63yb7CLT9I
	C/M0lmLP9WB7R43piwrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM98n-00000007qaY-4AQz;
	Wed, 28 Oct 2026 19:16:54 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM98l-00000007qZF-2klC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 19:16:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:In-Reply-To:References:Subject:From:
	Reply-To:Content-ID:Content-Description;
	bh=Qhg6qVfP+OrKVzTFTCDbEiFCVzMgrQLLwSIrUvrN/sw=; t=1793215011; x=1794424611; 
	b=fbhdUG1rMSQCvNSXE3e8r4MhM0u/vMhbFr/LR7Aj8NDjcj4jLUiGm9Xj/fnRbYb0FI4mIIkUh8c
	LPfcaPyqp9U26AaUd66gBZYw91mC5Eufx1dcsydZ0WrM8gbpmC4OhO3ZXhyv6yxsGNTv9iIlHrimX
	gEl/evvVhOd9mNWkiKMFOfs9RBZZRAdpxDoQOPA4a3TvMXYiX1jwym0DLHhGIzEiu6Jmk12GX0lq1
	v23Rj6sM51Lignh6yBzcQqUrDV1SJhKPhZJhUl+3yTWjHuYbtNNNOcM49v5gJoSPj2atliAUJ06WW
	kCQyBdVzxKwHZJn0UOsgHrxG+dP/hMkFE2VQ==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Wed, 28 Oct 2026 20:15:11 +0100
Subject: [PATCH 1/2] ARM: omap: cpuidle34xx: balance cpu_pm_enter/exit()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-susp2-v1-1-174b52857d89@kemnade.info>
References: <20261028-susp2-v1-0-174b52857d89@kemnade.info>
In-Reply-To: <20261028-susp2-v1-0-174b52857d89@kemnade.info>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=909; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=R7GRL/JPbnVUdDmvZmTFKL9hbrDXzgpie3WTHAN4OxU=;
 b=owEBbQKS/ZANAwAKAYRhRfpAKNzxAcsmYgBq4knLJKv6u8SOZFcFmtL3ea0T8w4PY3i9hkD4/
 M6FFuznZcKJAjMEAAEKAB0WIQTY6xCZL0TEE1XHfFiEYUX6QCjc8QUCauJJywAKCRCEYUX6QCjc
 8UptD/9WC/pwZ/n78cSwkwE8nfv6kQpN82JYWM6RRYa0LPzz8IC3Q+c+CfINnwr93Z5WImLYQ6h
 oRDDvnhNPsBgP0jdmdgF07pYxEMxRJPvdsNGW59YxgOE+EBH3928/Df6dyZOzta9woYkpb5JX9q
 nCPfgU+atq5qHMUCJFJTcHX4A8XJzYFSN+/OCE41imd4uCZpg+/PtFPhGLLqbJk8MMo+HL7JIu0
 IEpXYSDKRv2dzdcvkTDebljab3dbjJcZu9wdrRyCrIy5inGIRjsh8eRc5S4kPVBg40kRjHAblak
 R6YsSR+qXbGPb7d2sxSVhD6G8zpA7Yl/ZQnjfZjqVLXPP8aevbdyQKW7O/W8MmL3DP1iznmw85E
 XND8lEChVWms8XUrIBaNKlB6r352WO6RXdG6bDPXkdu43uIVSy7nGZfCmg35eJpPZYkv9PNS/Yg
 f6NGQhC6CaWoI9uvPWf9palweyQEfMtcGQfkJ9jfGhRj7cETyrKEfUGWnbSniCyPK2eCxKBUQtp
 Yei65FYg/iuCp8tgYCJfgYRTk5LuhePUAusNNEcZSDqtWAWvY28taxn8eZy4RmCkmWRd2zfviXm
 46SOCOVy0YwT1khLk2zgRnwTBYrBjHk6N/LJiRRruO+LIsmrqDF2d15m0I0uu4uEwxTdk9EbXXx
 N1IX+IHhp1vCBfw==
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_121651_699603_F1ED8C4D 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

These calls are usually done in a balanced way, so allow notifiers to
assume that these calls are balanced under all circumstances.
Seen some spurios vfp issues probably connected to this.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/mach-omap2/cpuidle34xx.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/mach-omap2/cpuidle34xx.c b/arch/arm/mach-omap2/cpuidle34xx.c
index 2ab5dcbfb7f6..e42dcf8c03a3 100644
--- a/arch/arm/mach-omap2/cpuidle34xx.c
+++ b/arch/arm/mach-omap2/cpuidle34xx.c
@@ -139,8 +139,7 @@ static int omap3_enter_idle(struct cpuidle_device *dev,
 	 * Call idle CPU PM enter notifier chain to restore
 	 * VFP context.
 	 */
-	if (cx->mpu_state == PWRDM_POWER_OFF &&
-	    pwrdm_read_prev_pwrst(mpu_pd) == PWRDM_POWER_OFF)
+	if (cx->mpu_state == PWRDM_POWER_OFF)
 		cpu_pm_exit();
 
 out_clkdm_set:

-- 
2.47.3


