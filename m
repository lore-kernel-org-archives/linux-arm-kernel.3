Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594A5C61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 20:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LzIndWq0/FqpEkfBOusZ2cLozUs6J/OAuSOw/9cLgzc=; b=hNFP2CbcQu2EsuQA6tnaFcARed
	icVXSqY7s6hL0wTJf2VaC+ldrw0s97/VKkNFqtUtPH5wLgrTvzb2Bm1DKalEITS/DXioz/7ts4XU6
	dcPmwYBWTVewLVs+JU4tCeBl3OjxZUzBYIc5AqYGnPXRKe5ywBrhm+6WHEvaOymCdKYN0Yn4Gk97+
	7q+hP0RScXQe8gS7R2QICeH8q5ug2+w3veCihyzLTRh6PVHMUD8X9dNJZDX4PDkGTrXiY7eGYXtIu
	0n/Dyo6X58KyEsm3fUtYTk/FjuhG39J+d4ew0fqGHl/G4HxMiPJTNh0X1iP9RSXik5Gtg9CszZsbC
	Nl4P/03A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzK2C-00000002yKO-0mFe;
	Wed, 26 Aug 2026 20:15:44 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.207])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzK26-00000002yIJ-3B18
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 20:15:40 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id B39E4C000C69;
	Wed, 26 Aug 2026 13:15:37 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com B39E4C000C69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1787775337;
	bh=zYr4xm/hZ57XjrhWkYpqW/TwlIUd4MCyuqKjtJCS4so=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IABba8sPB9wCMLvRuFrzzJPUw/+Yl0dxMe7t4ZMYEsGHRtAd+kiB81gCuK7BMH8id
	 rR8FByLK1653yeQb9+OuQGImDAkvITQz5xY6CFMqRw4IZlsYD5ZHBEnuoStq6Oh32v
	 v7wpvSB/o1KB6BFmfFOxpUEkLx/xRF04+pWG090w=
Received: from bse-build-07.ric.broadcom.net (unknown [10.136.28.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 139EBA9A;
	Wed, 26 Aug 2026 13:15:37 -0700 (PDT)
From: Danesh Petigara <danesh.petigara@broadcom.com>
To: mmayer@broadcom.com,
	krzk@kernel.org,
	florian.fainelli@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Justin Chen <justin.chen@broadcom.com>,
	stable@vger.kernel.org,
	Danesh Petigara <danesh.petigara@broadcom.com>
Subject: [PATCH 2/2] memory: brcmstb_dpfe: Bounds check DCPU-supplied MSG_ARG_COUNT
Date: Wed, 26 Aug 2026 13:14:59 -0700
Message-ID: <20260826201500.3000125-3-danesh.petigara@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260826201500.3000125-1-danesh.petigara@broadcom.com>
References: <20260826201500.3000125-1-danesh.petigara@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_131538_868501_414D9A4E 
X-CRM114-Status: GOOD (  11.67  )
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

From: Justin Chen <justin.chen@broadcom.com>

A compromised or buggy DCPU coprocessor can make any user who reads
world-readable /sys/devices/.../dpfe_info|dpfe_dram trigger a kernel
stack out-of-bounds read of arbitrary extent. This bounds checks
chksum_idx against MSG_FIELD_MAX after reading the response from DCPU
message RAM.

Fixes: 5d06f53d9509 ("memory: brcmstb: dpfe: Compute checksum at __send_command() time")
Cc: stable@vger.kernel.org
Signed-off-by: Justin Chen <justin.chen@broadcom.com>
Assisted-by: Gemini:gemini-3.1-pro-preview cursor
Signed-off-by: Danesh Petigara <danesh.petigara@broadcom.com>
---
 drivers/memory/brcmstb_dpfe.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/memory/brcmstb_dpfe.c b/drivers/memory/brcmstb_dpfe.c
index 66343205f585..7b02c36c7fca 100644
--- a/drivers/memory/brcmstb_dpfe.c
+++ b/drivers/memory/brcmstb_dpfe.c
@@ -503,6 +503,8 @@ static int __send_command(struct brcmstb_dpfe_priv *priv, unsigned int cmd,
 		for (i = 0; i < MSG_FIELD_MAX; i++)
 			result[i] = readl_relaxed(regs + DCPU_MSG_RAM(i));
 		chksum_idx = result[MSG_ARG_COUNT] + MSG_ARG_COUNT + 1;
+		if (chksum_idx >= MSG_FIELD_MAX)
+			ret = -EINVAL;
 	}
 
 	/* Tell DCPU we are done */
-- 
2.54.0


