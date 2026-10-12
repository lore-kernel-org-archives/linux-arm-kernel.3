Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358DDCA9ED6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 05:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WUHR+jwX20wnPasopncz+EdY4KBemgqmO+gzErpgMVo=; b=W/E1bQclLa6f9/mJpuOioIpdZt
	ufhacv5tOmUOrfvQM/cTrxaXwateWg6rKHOtSHGg/0IPoVGrbb8SZUFaY6C9IlaDiAjcIXsln1r5T
	2VCotnugpB2OsZ2tjcz2caeKCN2NsjQSCPpw5Hpm2HzG+xPaEkgOSDt8509eMdZzbjhuOTwKZmhfi
	OrzBJV1PMn0reCvbYAGSgMIBzhoKAF6dWFki1MiaZZrTMN0cmE8eBrgm7B8bcwtBwb7a2qpvJ5pPv
	gSQNzrF2hKJduxIGnsvRMid4l5rYLG5ke1imPaEzUkNSqE2ajycepPXCpkgHHTnKKVjHj6i+1xDgK
	+exH92fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG8dc-00000009gPF-2FKq;
	Mon, 12 Oct 2026 05:31:52 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG8da-00000009gOc-1nNF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 05:31:51 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-15943c9c005so2007883c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 22:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791783109; x=1792387909; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WUHR+jwX20wnPasopncz+EdY4KBemgqmO+gzErpgMVo=;
        b=euDblYUZy1Sp9V4C4arZmCj6RMmGeFQdEOK4tOcFv2+WPVGkDR+SdB8Thqy4mO6LPa
         1ggJpIluqfl37WZSXlOQBpBntlnp2l9owN7FdESw0ZcxWeiTEePiUG70EaBkGaMHBWRq
         EkSWrAnOlVlyr94in/ubqYJxG3s6Wz7n+4VuRSl6YjWqUr2KFhjkVQDO66tqwUrUXaLd
         O1jR5VOgeRqySAdZX1sSGKhbgNeCRIUtYn8hYcdWgoz4XgHZkRNkcP6sj51Jmh4uybmA
         wdw7UPj6prNcc8F035GMp1sMcQSHQg4RlXq4V8INQJrhpMyMVSQNHanA+bYWDfKs/ecX
         ecRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791783109; x=1792387909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WUHR+jwX20wnPasopncz+EdY4KBemgqmO+gzErpgMVo=;
        b=yLMqFEnAypODAHUAm5qpDybXGkjCCso5BWs5rybgjjctd+4mISIZRY+XgxSZ4ls4sX
         t2clw/9Ne89FQLlKt974VRG9/7720y2RIEK16zhFXpqV8Ynbp1cej7MQ4DxzHPSxFAZS
         HLKa0zx4uU5gGBcZ0lfGt33IQRe3JepzripdzyxYvDsNVNDEE1cJFy2p3+TJkR/l5Fyv
         Wz5sSq2cHP8nueMsPJpXTk3SEnPzeNStkNib+qIiURyLcR+CIftMlrJ3r426R2kLcMEz
         xs1liRYIUmAe8/Ydig+TTcUd/M6JVQvzcMf5d5pkpLVw7v/C5Wi/M00uARs5Z4U2xl+8
         K/DA==
X-Forwarded-Encrypted: i=1; AKwUvByyYwcW7Wc6ZQKj1dwLFteKFjDkqO8mnZy/C97Wm/+OUYSw+tOhPWKDSIk/vqCrAkDgj+bAP2qYS0TMw+TfHoEJ@lists.infradead.org
X-Gm-Message-State: AFq9FYIYzmkeWXOi+YlwLmhE1roiA7O9mh3TgpJ/iH9UJQgYlMI/B4SZ
	G5Cnjcu6x+YqMr2eCMoA+WX/UjuXMvQf4k8bpCa8HPMfdS26zi/aF8cbDcrl7HWO
X-Gm-Gg: AYBFou3JcY6W7c8z3rZQi9yLHGbXY8C9r5D4Ma7TXi4gq8PXLOUInPimbsgNlF2yvRn
	Ok3WcPX2UXbY2JVxB4ihShsBhwRoQAWCmq7yh4RTphvzrUtrmCrHKTidMlm5ETBYtQzdN6BfPzU
	s6xuT35fy2sfOPjx5/pSOVmGFSGuQm9w3L5AWdYnbLDtcYAN/GvXAMWwgTF/9onA78cPQkojgEH
	6wwdoKur3DjFqZlozehZlyZArjtvR50AEMrjGdkXvVNowBT0nl6Gl0+pX0dJKd+j7yHvuILZJ8T
	dVhZgvGq8AK/09X1kOfNnU/s7nmzc0k8k9SiWdtiobBV3H9VbFWwNhLEeePrNam9+nxYphATdW9
	mbFccUI9P+1HpN5b/5BoPq40qrLauf5eSZVbjOJwzSBqo0QN9Agxoj4hI+e69v7sG0HcLZWM1JH
	CDIrx2KjcZ71briKBQOI4aIq/LXWxYimVdh5mzGtzXWD/i+A4UBDSSgN0ystl3bg2NvH2gSC+xB
	DqhpdpB
X-Received: by 2002:a05:701b:2510:b0:13f:c85d:17bb with SMTP id a92af1059eb24-16a5888c49cmr12926299c88.1.1791783108925;
        Sun, 11 Oct 2026 22:31:48 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a2f17feasm33513653c88.9.2026.10.11.22.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 22:31:48 -0700 (PDT)
From: Priyanka Mani <priyankamani2100@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-sound@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: mediatek: mt8365: Fix out-of-bounds read in get_iir_coef()
Date: Mon, 12 Oct 2026 05:31:19 +0000
Message-ID: <403cc04bb103dff096edf72b99ae6868ee91f359.1791782072.git.priyankamani2100@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_223150_463108_46368B41 
X-CRM114-Status: GOOD (  16.38  )
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

get_iir_coef() looks up a resampling coefficient set by reading an
index "k" from iir_coef_tbl_matrix[][] and using it to index
iir_coef_tbl_list[], which has 8 entries (valid indices 0..7).

Before the lookup, "k" is only rejected when it is >= IIR_NO_NEED (11),
or equal to IIR_RATIOVER (9) or IIR_INV_COEF (10). The value 8 is
neither a sentinel nor a valid table index, so it falls through to the
else branch and iir_coef_tbl_list[8] is read one element past the end
of the array. The bogus coef pointer and count are then returned to
mt8365_dai_set_config(), which dereferences coef.

The current matrix never produces 8, so this cannot be triggered today,
but the bounds check is wrong: it relies on the matrix contents instead
of the size of the array it guards. Bound the lookup with the actual
array size so only valid indices reach the table.

This was found by Smatch:

  sound/soc/mediatek/mt8365/mt8365-dai-i2s.c:271 get_iir_coef()
  error: buffer overflow 'iir_coef_tbl_list' 8 <= 8

Fixes: 402bbb13a195 ("ASoC: mediatek: mt8365: Add I2S DAI support")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/67af3580-a907-403d-8bfd-76b5c304ab99@stanley.mountain/
Signed-off-by: Priyanka Mani <priyankamani2100@gmail.com>
---
 sound/soc/mediatek/mt8365/mt8365-dai-i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c b/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
index a058973662b3..2e678f4aa4b1 100644
--- a/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
+++ b/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
@@ -267,7 +267,7 @@ static const u32 *get_iir_coef(unsigned int input_fs,
 		if (k >= IIR_NO_NEED) {
 		} else if (k == IIR_RATIOVER) {
 		} else if (k == IIR_INV_COEF) {
-		} else {
+		} else if (k < ARRAY_SIZE(iir_coef_tbl_list)) {
 			coef = iir_coef_tbl_list[k].coef;
 			cnt = iir_coef_tbl_list[k].cnt;
 		}
-- 
2.43.0


