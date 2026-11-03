Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E26606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 21:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R3omNKxK;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NVBgVzxk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KBiAFwJBjOECAsi6lOaXohAXyvd5VSKVrxjrzr7WTOQ=; b=R3omNKxKeJy0tL
	vdtv5aBiEmAfh7nb8NtfPQ8DAPtsYoZKbmoxCENd3FDLDmDClJ/MSNf1hgBwzlHSK/abHYqR4CwWV
	CwyuDzczkLUgSnlrkEd2UntKRcIfSja7qHge+xlqz9ehzb93jF8bCfVfT05ptzGg3V9/k3EjCU0Ju
	W2dMS8qGrwkiAa0Mv8w6z09hCassnnEwnB563PT479DHp7gdxfj5kU/0gP6WdIqmqgAVYAEZU8XoH
	t+OWam1O+1MywqbM4nt200GNilfo4J44TMojX6hYTCZATQODGuFjliKlFDsQQcZqwJnuYoajWykLi
	YcVCkl0W51kkpMLT6lXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOM5f-00000003hcE-0GWQ;
	Tue, 03 Nov 2026 21:30:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOM5e-00000003hbg-0bRR;
	Tue, 03 Nov 2026 21:30:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D467743B58;
	Tue,  3 Nov 2026 21:30:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E77531F000C1;
	Tue,  3 Nov 2026 21:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793741445;
	bh=KBiAFwJBjOECAsi6lOaXohAXyvd5VSKVrxjrzr7WTOQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NVBgVzxkOHue8Bg8JZMVboN8UaAg+gjtemfKI+FdOkT7atn0v5vN2e9Fm67rCiD32
	 cYKDgbjBaFAD6SoS5R9qVbTl/nLZVR0MWI5qtlYlRey/oBI05VPAUfUU7uAbB5oa6Q
	 UH9GRuAA0idLh31GkoGdWpWZDW8kZt2wLKIRepoKrt00lC20JGhw0RUEWDsaGGGNaH
	 nZNupU8pZM2rBvzt7agksL8BoHDoJJGAhcVDJX31O0u/GpFq0bcpy+kF97rMX50mvf
	 /GTcmFrqnyOD3FZLJfKl3jOqT/cnSGur4nevvqukBL/uJRoz6+E+IBgi6DjOtDJx0Y
	 jH3VSMCq49BXQ==
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
Subject: [PATCH 05/10] pinctrl: realtek: Prevent out-of-bounds access in rtd_pinctrl_find_config()
Date: Tue,  3 Nov 2026 21:29:10 +0000
Message-ID: <20261103213002.1673560-6-lee@kernel.org>
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

Several Realtek SoC pin configuration tables (such as rtd1319d_iso_configs,
rtd1619b_iso_configs, and the rtd1625 config tables) omit trailing pins
that do not support pin configuration, making data->info->num_configs
smaller than data->info->num_pins.  Because rtd_pinctrl_find_config()
indexes data->info->configs[pin] without checking data->info->num_configs,
requesting pin configuration on a trailing pin reads out-of-bounds memory.

Check that pin is less than data->info->num_configs before indexing
data->info->configs[].

Fixes: e99ce78030db ("pinctrl: realtek: Add common pinctrl driver for Realtek DHC RTD SoCs")
Closes: https://sashiko.dev/#/bug/linux-60e13761-fd9e-4fd3-826a-47344f36d4fa
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/pinctrl/realtek/pinctrl-rtd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/realtek/pinctrl-rtd.c b/drivers/pinctrl/realtek/pinctrl-rtd.c
index 60222339726b..2b877099ec85 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd.c
+++ b/drivers/pinctrl/realtek/pinctrl-rtd.c
@@ -252,6 +252,9 @@ static const struct pinctrl_pin_desc
 static const struct rtd_pin_config_desc
 	*rtd_pinctrl_find_config(struct rtd_pinctrl *data, unsigned int pin)
 {
+	if (pin >= data->info->num_configs)
+		return NULL;
+
 	if (data->info->configs[pin].name)
 		return &data->info->configs[pin];
 
-- 
2.56.0.385.gac671c819a-goog


