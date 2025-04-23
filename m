Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E5D4C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 18:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zSN8LA1qXE8sSMrIXXGWvP/A1XS/xD/J162Xg5jQH2M=; b=1R23jKXbmAD17rNv9UmHm9OZLF
	DaLgIJZCGH3tryjC36veuo7FUgSSu9UZF/dizwGnuFc9/gPi9e1XdDjoHrsZe4qRfSXcrhJc9iNT/
	iwvogphWWHDURS7Zv93hdMleAZtUe1dxX3LKUeop9+TIbhwaPG7DWbroTqiBu9ek+DdF8H9Qzzv6R
	q29doEKiMhZdnoFdgWB+qzMz6SE6VG8cZIjs6bmvxY8Hu4aexMCcwxmn1qprSDhtNn2J757GGb7u5
	IvtC7TUXRPi4dn65UsbEfVS8qcyfjcvkgx6srieF4OhYz+skUrLg0j+LjxJ8wBeS2kVTTNNOgDwhf
	bWsH/mZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7eSy-0000000BTcZ-3yMK;
	Wed, 23 Apr 2025 18:05:00 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7cOM-0000000B1kR-2j4C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 15:52:07 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso8902206b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 08:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745423525; x=1746028325; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zSN8LA1qXE8sSMrIXXGWvP/A1XS/xD/J162Xg5jQH2M=;
        b=hP67Jp1ooUKVzU95MUQP+wJiJnCCvEOe1PXQHARxZDnRoN3Ow86wQfbZ/7X7vON6N/
         EOqQsGd0PKaf26JA4/4b45lLakIuTNYX0kWnCJj2giRWcIkRothRZyQSGSUkNC47W3ES
         KXDZ/ylvwkNRGXrBYW2cbNgehRGC1WEjFphZWdMTO9fYjw/7NONCDU6YVbqo3PmJCsgj
         NhFZ3HVkLweu1yAYAMo1gOJh1N+b2TeOmrKl3mLCn+EbPZshrjpE9mZNGNlRF6v8cyuh
         rf3gB9lDAclREwuooKF2cwTplnXkWzbclyca8AVkk+enGmN4XMTCFdXK3XKNyPBY1Alk
         zS4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745423525; x=1746028325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zSN8LA1qXE8sSMrIXXGWvP/A1XS/xD/J162Xg5jQH2M=;
        b=LphHvA4SLAzGE+mmSWPe1MYaZnzCwXKpB/HNDHJGPvAotxqujBBcZiP3HBkHwarfiU
         NaydxG3oFTV24Ot0FPTItkGAyjhNuafjXh0lPJwJ2Rc1CfgcYyvnpk1VstmyVd8yEgp3
         gboAMzgkHgvcl3S+EYgCQA+7QaStDxR6eOm8kruK5RW5DYp+Vj7kNRnCu4RbvC27oXua
         +72Cdf/PBVaZq/RQaIf36QO7+E+vCM1Fg7y1V2M6axfHRqBL3M6I51OgZ+PvyBKlp7Zg
         CqelRVb5IFMmK5HEO//e3dOmItv07iwA3a7KkazMbg0VvEsYv/NoaQqATWfQ8Hu4kwZ2
         huXA==
X-Forwarded-Encrypted: i=1; AJvYcCUmRVOZGWP7Bz3fFpT1S05vPsveAGlWTuraEzCTZUSMiSbBLOncf4LHu215EcC5i3R9NSzRUyVDzf/Mm+UgBjtN@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+BNyeUeo0G1NgKCjRgKvH4T0uY/MbSWGP6Z2yeMLsWDjSLQ4r
	KgDeJIHLmfPns8skylQ1CsgZItWcoYGuRaznDyP6ltFMwDltnzRc
X-Gm-Gg: ASbGncsbq2gJZN47vsC7Pw028bMJureU9soEOyvdeXuAbhW6bQpWCByV72/eGyfb/wz
	DeIJolRYo5JXJESl7UtJqnLudFyN6B3x4x19LpY0YX+yPPIMkBXepX417hXoJfbTI5j88kwUoJL
	noKY47qUz3dAbmbl1wXDpCPSp86zN8U2e3uw9KshOiT5NH1Q5iEqMElFSWqPnV51YwSgonaRwM9
	zEHPSti/q00TFokxoOwsfp4B/rs4Nu4RxocvMCav2Q+eVE48zKkQ9Yx1MrDyXJHACGXmXXd6++x
	19E7a2caIvlpfawVpGPoPTtDr7EsNukhXIOdkYbRpmU34bj1DcA4Ew3hLoYd6Pk=
X-Google-Smtp-Source: AGHT+IH9NXu1Zh4il4mX+tmqFO/fGM0azr6O1PCj5OfemeTOeltYbazHILrLFl2ZpdVQAwyq5Vkrfg==
X-Received: by 2002:a05:6a20:12cd:b0:1f5:92ac:d6b7 with SMTP id adf61e73a8af0-203cbc05557mr29541583637.4.1745423525288;
        Wed, 23 Apr 2025 08:52:05 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8c0228sm10598640b3a.25.2025.04.23.08.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 08:52:04 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: linux-remoteproc@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: [PATCH] remoteproc: imx_rproc: replace devm_clk_get() with devm_clk_get_optional()
Date: Wed, 23 Apr 2025 12:51:31 -0300
Message-Id: <20250423155131.101473-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_085206_690490_E461554C 
X-CRM114-Status: GOOD (  11.50  )
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

From: Hiago De Franco <hiago.franco@toradex.com>

The "clocks" device tree property is not mandatory, and if not provided
Linux will shut down the remote processor power domain during boot if it
is not present, even if it is running (e.g. it was started by U-Boot's
bootaux command).

Use the optional devm_clk_get instead.

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
 drivers/remoteproc/imx_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 74299af1d7f1..45b5b23980ec 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1033,7 +1033,7 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
 	if (dcfg->method == IMX_RPROC_NONE)
 		return 0;
 
-	priv->clk = devm_clk_get(dev, NULL);
+	priv->clk = devm_clk_get_optional(dev, NULL);
 	if (IS_ERR(priv->clk)) {
 		dev_err(dev, "Failed to get clock\n");
 		return PTR_ERR(priv->clk);
-- 
2.39.5


