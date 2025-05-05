Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F00C3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 01:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WrtC28aW3nqxO9x5uLrHobIKo1DmeQOnlP5+B7XjAYg=; b=TRw42qx3hhmhWQ4HOotqw2Yj5F
	6oDQhma+IhJn2hq1SbWUf50CCfNZbI9i2GH3za18qexyLACucLwO+ozb8oyfwfPA0I5Sd98geUYkG
	3NXc0bGXoMPqwAirKwGEx/wUDdeSc+Ya3U+A9WuV994n0Vu7pq0bo66Dx8jEEqOhl/EtsyQ3xYeGW
	HZqstTL+Fz3LiTmowuPZpPLHvebMLrxiBI3A/WS0FP9Aow0j5yxYMNtFf7glvg1rjYlN2KpZgONCj
	b7mZp4YNcWVCvfuvwVChzggSdjOOmGVBAyMROuaaltlU+OOiKt+Pn1+N36HibO9+gkVO8lqeeb198
	14ngiI0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC6z2-00000009UPE-0Xwl;
	Tue, 06 May 2025 01:20:32 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4Yu-00000008qn4-1fxT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 22:45:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 15B49A4D06C;
	Mon,  5 May 2025 22:39:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 415EDC4CEED;
	Mon,  5 May 2025 22:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485123;
	bh=3w4xnCa7yz2sFPD98buYOotV9SZTKXDZt93rf+QO1JA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oC0c4UX5uPqWKtljH+jWg2JICB2WIhRlw69pXRy/G+DscE4PXU4xYZBQoPp8XqWKB
	 Eo3Okjf2WLtghDbSm0AehsnXw6vkq+5qrTHTZMSiQNyB3fgpjRKQ9d33zAQhNT6Vxz
	 fkQt6syV+jB7bSNhxwqF9C0ASgnPpjLXVXJyLSIKcBup8bjIWZg2OgMaPD+gEdsRmg
	 oLRuMXdic4n0/Hc3zaeR02u2/DiKl/7nEpsdEbrGF8N7J0+lzdHbK3iJFHwodbgMPm
	 KS2cS55LNXEKacUrL1c9QfSbkax+xMgi7aHSUXgrkuDdghYhxIUHN5aUYXR57nKmT8
	 +SpchrKgU50/w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Sven Schwermer <sven@svenschwermer.de>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Sasha Levin <sashal@kernel.org>,
	davem@davemloft.net,
	shawnguo@kernel.org,
	linux-crypto@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.12 172/486] crypto: mxs-dcp - Only set OTP_KEY bit for OTP key
Date: Mon,  5 May 2025 18:34:08 -0400
Message-Id: <20250505223922.2682012-172-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_154524_505903_BB75AD3D 
X-CRM114-Status: GOOD (  11.78  )
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

From: Sven Schwermer <sven@svenschwermer.de>

[ Upstream commit caa9dbb76ff52ec848a57245062aaeaa07740adc ]

While MXS_DCP_CONTROL0_OTP_KEY is set, the CRYPTO_KEY (DCP_PAES_KEY_OTP)
is used even if the UNIQUE_KEY (DCP_PAES_KEY_UNIQUE) is selected. This
is not clearly documented, but this implementation is consistent with
NXP's downstream kernel fork and optee_os.

Signed-off-by: Sven Schwermer <sven@svenschwermer.de>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/crypto/mxs-dcp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/mxs-dcp.c b/drivers/crypto/mxs-dcp.c
index 77a6301f37f0a..29c0c69d5905d 100644
--- a/drivers/crypto/mxs-dcp.c
+++ b/drivers/crypto/mxs-dcp.c
@@ -265,12 +265,12 @@ static int mxs_dcp_run_aes(struct dcp_async_ctx *actx,
 		    MXS_DCP_CONTROL0_INTERRUPT |
 		    MXS_DCP_CONTROL0_ENABLE_CIPHER;
 
-	if (key_referenced)
-		/* Set OTP key bit to select the key via KEY_SELECT. */
-		desc->control0 |= MXS_DCP_CONTROL0_OTP_KEY;
-	else
+	if (!key_referenced)
 		/* Payload contains the key. */
 		desc->control0 |= MXS_DCP_CONTROL0_PAYLOAD_KEY;
+	else if (actx->key[0] == DCP_PAES_KEY_OTP)
+		/* Set OTP key bit to select the key via KEY_SELECT. */
+		desc->control0 |= MXS_DCP_CONTROL0_OTP_KEY;
 
 	if (rctx->enc)
 		desc->control0 |= MXS_DCP_CONTROL0_CIPHER_ENCRYPT;
-- 
2.39.5


