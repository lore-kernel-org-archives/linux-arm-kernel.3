Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1D5C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 23:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cAqv1P1B4TM90wllUDLCssk9Mb85PipKZEpoXNiBrbM=; b=XvCRzNCYGjdUcI/50oKn9dz/wp
	bDwvTtmm4fTXIj9OaL1m0Kvl9/YcokYquA3lfY2JhHCRUxYWo7hPRcZ2FxXzW/SjuFt3GTdhiCM1w
	L+8V40dlGWE2cJ+92zhzuLCaYoCIrODB9jQrq086ppMsD9Q6Wzbp54thIZnjjwyandIcWzmpqLh55
	J6tHr0wxYrpqmbcqX9hT0cKg5Fn5yJXNyNrdHtZCKtdI5PMjB8orqbvj6oOCR4pfA9Al6gyUIOSNd
	RTR+72VMIjkIpwpA3wfhsQNxLx4cgfGx8hSxjQZtPEDc7M07nBRlkeHiCr0VFwUzlH6MgiIa0cYYd
	yWzJvNKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC54n-000000090eR-0tsC;
	Mon, 05 May 2025 23:18:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4DL-00000008joY-0dmX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 22:23:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 33DE444199;
	Mon,  5 May 2025 22:23:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A019FC4CEED;
	Mon,  5 May 2025 22:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483786;
	bh=LLJphMoB/scWFhUMq04iybMYcAOBEZhyWhFBrETrC4o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DllBo6kieUN2UWIA/fvl6GXL0gsIEipbnrtIS/KTNgD9ygaRS3M4fw5VQwwHFS8iP
	 JbH5XpgLd5/l3AOdsmXein94PbZurgp5QlxTM9Md4q/KZXr7z4LyqENgHYDTD1+Dv2
	 3u/jmjDz3BhkM2uwgWGWBpfnWzBFErJCuiUuMrOI+n72ZOn5IKnrRad2fDNv8ybyhf
	 7g4VcdGk+S3xketEgLC/7W/ym2I5kZM93IIOjCM8hp6XyS92pOaIAAJLLmX0FFt1OL
	 vqkPojw3OWTQeUOZ1xzqt+6nv1o4NNyyv1Nu9WoCrDVbCzsCR/Xqjf7689Uw/xCCeF
	 SzLF42vqb89AQ==
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
Subject: [PATCH AUTOSEL 6.14 217/642] crypto: mxs-dcp - Only set OTP_KEY bit for OTP key
Date: Mon,  5 May 2025 18:07:13 -0400
Message-Id: <20250505221419.2672473-217-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_152307_214510_A3F8D9E2 
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
index d94a26c3541a0..133ebc9982362 100644
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


