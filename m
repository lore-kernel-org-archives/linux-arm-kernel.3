Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5520C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 07:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eb615ALjTbVulyVf15S0gtAT+lk5uC+cU+SKC27GUPI=; b=zi5O4wLLWocoaCt9zKJA9J1u8U
	nq+Cj4m1sSPWlmLklwszKXv2bkHjSfOiE+Pk9lMyStOxgXchzZFHJMGiCLTtyk6DL7g8K7qYVqpIY
	F1kLLZH2tp1ayo/1Ek2zwB3qPRwtzNPuEIhxQ/NayIbyoavEVU0EVmsnjbIoxXpQaMGwbGVPqq5nf
	6yAbGs+5aPy6KnVAFF+gajXTyVQhUgo8BnVfLaQ/dLAsCbkAGf5Zxz0DXwBwey6qhDCqY2oxX0yd1
	SA8I2+t9GE+snjoDoEqBikv6eAlRZz8vm9pfAAatSyhhiSS1olkMBnwTghyBW8RCI8MKFRDPEe/Z1
	ZyMI+0rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDf2s-00000005aUH-0alC;
	Sat, 10 May 2025 07:54:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDetS-00000005ZPA-21pN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 07:45:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3771B5C2EA7;
	Sat, 10 May 2025 07:42:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0F06DC4CEEF;
	Sat, 10 May 2025 07:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746863109;
	bh=GQdySjnU/U2AKITWufHtvENXM8nduTjgzWyCaiFQeTs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lWVyvLObDxpwcHwEzTI0jBgYFiEGQK0JqbemVp5GK9gwcnKcAQjDTyS6IKLB4WwkP
	 gYLkGh4ePlFwykb3i7KxYTjzakN3vjZXA0vJpCNDct3KLqQiKOsTGbYjFRCd2Cyc3n
	 xXWnyPgM+9hH/p9oO19Zhi+1hQN+qknB34QQta2cuo61jXEbRwimQz4HUAINFoZLOt
	 iEwjhJi3f/cTQG+9cKavHU+oL0l+WTv5HKsJ7Yu0FOGFHsFnMWC035UiXYI8QHRn/o
	 sc3lPzGGzxDm+9DwOvlpWSoyD9l7RTglE45vaMxyPnHtvH9bStsv0ObnA6C1k4N4A9
	 tWW4kCisDxAYA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 004CCC3ABBE;
	Sat, 10 May 2025 07:45:09 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Sat, 10 May 2025 07:44:42 +0000
Subject: [PATCH 2/7] nvmem: core: round up to word_size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250510-nvmem-dt-v1-2-eccfa6e33f6a@svenpeter.dev>
References: <20250510-nvmem-dt-v1-0-eccfa6e33f6a@svenpeter.dev>
In-Reply-To: <20250510-nvmem-dt-v1-0-eccfa6e33f6a@svenpeter.dev>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Sven Peter <sven@svenpeter.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1011; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=H4fL+CAaJi5RsVSWx0aHxTvxkzr7MJNevpfVzdnrUaE=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4Y8879pU0vbs4VO/5ijucvz2QEJ3lUxMZOLLk9YufX/+
 XpJM/+nHaUsDGIcDLJiiizb99ubPnn4RnDppkvvYeawMoEMYeDiFICJ/NRj+F/vJXd5iYrr0s4d
 M34U/TTJDHolWdu+20GUVeDk/stvgr4x/A+5W/zSJJ9N6c8Etdg/UqW8ebnKszftrHz0/Up8hcZ
 HGwYA
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_004510_592279_036C6E5D 
X-CRM114-Status: UNSURE (   9.96  )
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
Reply-To: sven@svenpeter.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Sven Peter <sven@svenpeter.dev>

Some nvmem controllers like Apple's eFuses or Nintendo's OTP have a cell
word size that's larger than one byte and cannot read anything smaller.
Round up cell->bytes correctly when accessing a subset of bits.

Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/nvmem/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 1bd39b12c21a86b9b135be95251a52a10543c2ea..02081c93fa467e5448bd78a4920072d437365fb9 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -595,8 +595,8 @@ static int nvmem_cell_info_to_nvmem_cell_entry_nodup(struct nvmem_device *nvmem,
 	cell->np = info->np;
 
 	if (cell->nbits)
-		cell->bytes = DIV_ROUND_UP(cell->nbits + cell->bit_offset,
-					   BITS_PER_BYTE);
+		cell->bytes = round_up(DIV_ROUND_UP(cell->nbits + cell->bit_offset,
+					   BITS_PER_BYTE), nvmem->word_size);
 
 	if (!IS_ALIGNED(cell->offset, nvmem->stride)) {
 		dev_err(&nvmem->dev,

-- 
2.34.1



