Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA55C79F85
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 12:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RBQDJXUvrfsElnYU1sGgm0rYGUTrAevC7wR86kwakV4=; b=YF+JpX5JEbJ5UW253e59rpC7bK
	kKZ6mvE6Bye4keoTB6T5OxXB/3/ewEwbQd1mgb0Zmrywx2rLwjBYwIcKE531cFh0h6CCXuxN1k2EJ
	8esBhgE+srmH+IP664D1fXj3YkmjIH4wWoNC+RJjBwaa0Pkga7f5vB0HrzjZsWRln4dZGt5AvPPA/
	An0bCNPOfLm+O8QFOhaFheiNGdcjoC8jrVxcyznZqRV2uj49QlqhHARqyi0feq3quTRJ6HPwtwuXm
	JKW19rGIsHhjL5X1Ie59OCcodLZfgti9iMAnKxXVqa0m9TtX2+0g84N3qSkSt4kpmYJPmnTG3lZBu
	n7rXYIOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Sxc-000000021EY-3rbG;
	Fri, 04 Sep 2026 12:24:01 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Sxa-000000021DM-1MCX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 12:23:59 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-6aa9606ddadso675265eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 05:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788524637; x=1789129437; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RBQDJXUvrfsElnYU1sGgm0rYGUTrAevC7wR86kwakV4=;
        b=awcchDQD/fQPCsMjG+mpKgTbJstLeUpSO0yWUzUYv8lvSkOFmAiuRzwl1S2rG4XKlh
         wpd4TQhH4N75n9MEWSi7fQ6ldkrHDG7vrmwUWcQ4tq49i1lesmb7ow55si8QQzcL4eXT
         TkSUuHTLERpSIuYLcnVambGM56LdRrHxe/bI5Yn2/bAcwVmn1IlP3Ow0vt7J5UYlngj9
         Kv9iTrMuHI2ax7b5xVjCWN75kwJg70My5ZkclXq6fGUaugHWTjy3WnFPVUkQfczygJCh
         sN9efqbOOdVOcVBSdJMiUX+Yc7W504MEjKxtNY2jwlN5S7ZwYh3AkJX3mtLDCgiMjgJr
         nyBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524637; x=1789129437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RBQDJXUvrfsElnYU1sGgm0rYGUTrAevC7wR86kwakV4=;
        b=LfcPI/7mrUVioJcNfJLFe1KM/aOpH2q928e+PTf5uXOLgc7YJTw26Mo6pQoey4DFHa
         C6R1tuxp1PZE1CJNadVNvsM/y2chsdDB4O9iSn3FtorpxQ93Yfmfm0eC/mrDEQPzjXzt
         sup8MTQmMZSlCOdiZpEZvu2/DQyP6zdWMksZKSsARQCPWmuJTjFo1d39DzTN/wPyTnij
         4zVM2iyxceUSB2y6B6vkx9TtgivxXZjmk35Ub2dtGgjncrx2Zv3LD13Elg6tBCJb1Otb
         TpfflC4TM41+HwDYLA0C+RgdMTaHS+PpRlz1qlEEOBhug+ijrl4Edc9rRLq6OMb1iiKj
         WejQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbNaj3gXnGtwqMnRhEG3gdsxOVQBoVjAhLGNSbUqKZYJ7s3jlikpz+sReMR2n8LhkXL6BNFNPKQcaqOEDNPUai@lists.infradead.org
X-Gm-Message-State: AFuF++nWP8tpBfDwiUGn1MaNV/XcX/VoUJSFMILogKlIy3F0rBKC60kX
	LPewmX8fA81Fh0wfEHVvPWvHWXw8zCzstuZw4VsMDdNAtH/Tso9JhN4P
X-Gm-Gg: AYBFou2/AjjrDi4czhpkkYD4+RCDZyQP1hn7APQfcxiwbO4hzLivUGn1qagtZCfykVs
	vlUzCjROkS/awNXlZIKaCUkdk9orUazOTdaufIbU9Mfed1NbdeW0FzUITYaK3Q6N7+FPmr+5bVB
	LvGgRjjtyiIPz3xdyXMbu6+uHs0b9gXZpPBtsXZGUHFkSKVxt1Ko+xtgZYjCrExKAZzZbaDDjJ/
	Vd8qxkgRhqYofrW7URrepLkH//anqjpUx8ievAp6SlvlrBBDnIQIINItgv6OS+DQMK43i6FNxaX
	dTddXnDxohAkt5jzoCYSak0qj0F+YrsRfX6g5f0in642d0tdjUQVKab4bELv2ZkFCNekxd51TKg
	2BlHDM5ynNgjRQJHCz2tHmkkxB6rp5oVoygUuq4Kg1QmA4jSTP4YDV1elLNk2BCpdG9jm+tM4bP
	KgML9jcPueqSEONlVXpdDUJtqGmV6uLL1wguLM5iAQzpTXIu+8NGhmz87iD3ZayutecZ8kpQ78W
	ZgwJDzaPIwipOM=
X-Received: by 2002:a05:6820:162b:b0:6b6:8fb3:5841 with SMTP id 006d021491bc7-6b6fa4e05e7mr4184999eaf.6.1788524637290;
        Fri, 04 Sep 2026 05:23:57 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143240d86c3sm6209359c88.0.2026.09.04.05.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:23:56 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH 2/2] i2c: busses: fix typo "retreive" in comment
Date: Fri,  4 Sep 2026 17:53:41 +0530
Message-ID: <20260904122342.30456-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904122342.30456-1-hemanth.selam@gmail.com>
References: <20260904122342.30456-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_052358_361795_99C6ABE0 
X-CRM114-Status: GOOD (  12.89  )
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

Correct "retreive" to "retrieve", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/i2c/busses/i2c-s3c2410.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 15e14a6fe6dc..b52f09048055 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -968,7 +968,7 @@ static int s3c24xx_i2c_init(struct s3c24xx_i2c *i2c)
 
 #ifdef CONFIG_OF
 /*
- * Parse the device tree node and retreive the platform data.
+ * Parse the device tree node and retrieve the platform data.
  */
 static void
 s3c24xx_i2c_parse_dt(struct device_node *np, struct s3c24xx_i2c *i2c)
-- 
2.48.1


