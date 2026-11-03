Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55579606A333
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 21:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eDJAf2/K;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P8TCBl3P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vINjqp9pvya8axfuBwfbY8HnHtZqyY6Mf4sC6k4LGmg=; b=eDJAf2/K5b05hw
	8cDgZyYH4lnqnmNcYaHQFJ1ue71r4EKRz/QxUSI8mn9cHysPFxMQbofqkHf0UVE21kKTt8ydh6Lil
	PJfzzoGXyH3gqtQCIYmiDWAr+aDiO/GqNrLvdo18UlGK/iFI3WGLFZ86lrePINg8dNshUj4VyTH19
	V8iDAQBplINvLH4ZIFOygfEwux5RQsqH/CpXa/Zk1zGtl/olJLxppxzYtCWLnX/e13LfO0qUW/GO6
	jc4cqV794UXpEA44Ix8wNX3eemwSw4/H3Z/x8uhPXzfREtgJxSNvQeQyXluYoI4Rphz6NI14SkvX3
	lSm+efXssJHLRG8HIgSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOM5l-00000003hhC-18K5;
	Tue, 03 Nov 2026 21:30:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOM5k-00000003hgW-3Q8B;
	Tue, 03 Nov 2026 21:30:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9262D4028A;
	Tue,  3 Nov 2026 21:30:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A288D1F000C1;
	Tue,  3 Nov 2026 21:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793741452;
	bh=vINjqp9pvya8axfuBwfbY8HnHtZqyY6Mf4sC6k4LGmg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=P8TCBl3Pz2aHOP6xh2Rc3AzoVGQ5WnQltf1OxLL5tXtVIuTDgv84J2srOCYwS6WXr
	 OiZaqjb8Ovrzws3CEkiULS1Z6Pfe3iNbivm1QQYW8N21bkn3dl4jjmz6N4kR1yWWzx
	 fJR48SqMzNLFGEOVbBvtIX4Rybu9g4zKBkc0zaaEgh+lmLYeumJjEE2MC+NE0Qye4B
	 FebYcuGsGHuT+UuA2DAntL9BrxQPyRJ4F6UO1Okb3WjgGECYSVf33b7/ickptYIUJV
	 4NgfdqxsUyGTxEqx0tT89jZkM0VrCHwn+w1YnG32pWXLbr213yrrdNCeF4ePIh+VRl
	 LwJ6Q3UeKBqOg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	James Tai <james.tai@realtek.com>,
	Yu-Chun Lin <eleanor.lin@realtek.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.com>,
	Linus Walleij <linusw@kernel.org>,
	Tzuyi Chang <tychang@realtek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 06/10] pinctrl: realtek: Fix bit shift when configuring RTD_HIGH_VIL
Date: Tue,  3 Nov 2026 21:29:11 +0000
Message-ID: <20261103213002.1673560-7-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103213002.1673560-1-lee@kernel.org>
References: <20261103213002.1673560-1-lee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

In rtd_pconf_parse_conf(), the RTD_HIGH_VIL case prepares mask as
BIT(hvil_off) for regmap_update_bits(), but sets val = 1 without
shifting it to hvil_off.  Whenever hvil_off is non-zero,
regmap_update_bits() masks val with BIT(hvil_off) and clears the high
VIL bit instead of setting it.

Set val to BIT(hvil_off) so that the target bit is set as intended.

Fixes: dcc9334435b0 ("pinctrl: realtek: add support for slew rate, input voltage and high VIL")
Closes: https://sashiko.dev/#/bug/linux-e7077311-3f30-4b77-844b-1447519d0c84
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/pinctrl/realtek/pinctrl-rtd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/realtek/pinctrl-rtd.c b/drivers/pinctrl/realtek/pinctrl-rtd.c
index 2b877099ec85..72773600303b 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd.c
+++ b/drivers/pinctrl/realtek/pinctrl-rtd.c
@@ -473,7 +473,7 @@ static int rtd_pconf_parse_conf(struct rtd_pinctrl *data,
 		hvil_off = config_desc->base_bit + config_desc->hvil_offset;
 		reg_off = config_desc->reg_offset;
 		mask = BIT(hvil_off);
-		val = 1;
+		val = BIT(hvil_off);
 		break;
 
 	case RTD_DRIVE_STRENGTH_P:
-- 
2.56.0.385.gac671c819a-goog


