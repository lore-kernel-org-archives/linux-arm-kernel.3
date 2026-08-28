Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64007C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 09:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Pj7F7Z2G/3nIEhdoVMN6YBCJ3skqGvS4bF0Hcf8EpXI=; b=HtdT6N3TVq6gQMxSb2wmcAic7a
	c6T0YjV4SmzjraimaUQrQyieKslJKmBizKKX4WpmBVPR171ZK7RoeHrkw+2qgkcCXqPuVC/k9nuVK
	/4DVEABBQYJfYpYPXha/3TZyrfoUamDWcUxdzIJCb1yCWejSuZ1Nw2Fs1O91osw5Q/ZOmFozIcAjp
	h46w9TNL7f38LfcOBJc3YWRpMAQVBKhaU8dPy3A4XdhULfp+Vwz16kjfw0bSP/L7BSZCMa4tHF17h
	hlZRH9Bo7y/WPsBNUs326oUEiiL916Pad/peV0hfWAQaV97sbkgrymuf8PH3FH2DwsRDgJOXzs5o/
	YTnyXjMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzswo-00000005TzL-18t4;
	Fri, 28 Aug 2026 09:32:30 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzswl-00000005Tyd-0fdk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 09:32:29 +0000
X-UUID: 5aa6cab2a2c311f19a56ed5b684f684d-20260828
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:dcb9b930-7f0b-47d0-8b1a-9599af8b65e9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:de7f7b520905538144b6a9cbf562d347,BulkI
	D:nil,BulkQuantity:0,SF:102|136|850|865|898,TC:nil,Content:0|15|50,EDM:-3|
	-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5aa6cab2a2c311f19a56ed5b684f684d-20260828
X-User: lilinmao@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lilinmao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1162320256; Fri, 28 Aug 2026 17:32:14 +0800
From: Linmao Li <lilinmao@kylinos.cn>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Leonard Crestez <cdleonard@gmail.com>,
	Radu Solea <radu.solea@nxp.com>,
	Franck LENORMAND <franck.lenormand@nxp.com>,
	linux-crypto@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linmao Li <lilinmao@kylinos.cn>
Subject: [PATCH] crypto: mxs-dcp: handle zero-length skcipher requests
Date: Fri, 28 Aug 2026 17:32:09 +0800
Message-Id: <20260828093209.3179074-1-lilinmao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_023227_508846_D93795F0 
X-CRM114-Status: UNSURE (   9.22  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Zero-length skcipher requests are valid no-ops, but MXS-DCP queues them.
When such a request reaches the worker, last_out_len remains zero. The
CBC completion path then subtracts AES_BLOCK_SIZE from this unsigned
value when updating the IV, causing the offset to underflow. On
decryption, the resulting source address precedes aes_in_buf.

Return success before enqueueing zero-length requests. This avoids the
invalid source access and leaves the IV unchanged for a no-op.

Fixes: fadd7a6e616b ("crypto: mxs-dcp - Fix AES issues")
Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
---
 drivers/crypto/mxs-dcp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/crypto/mxs-dcp.c b/drivers/crypto/mxs-dcp.c
index 133ebc998236..60794b4d49fa 100644
--- a/drivers/crypto/mxs-dcp.c
+++ b/drivers/crypto/mxs-dcp.c
@@ -473,6 +473,9 @@ static int mxs_dcp_aes_enqueue(struct skcipher_request *req, int enc, int ecb)
 	struct dcp_aes_req_ctx *rctx = skcipher_request_ctx(req);
 	int ret;
 
+	if (!req->cryptlen)
+		return 0;
+
 	if (unlikely(actx->key_len != AES_KEYSIZE_128 && !actx->key_referenced))
 		return mxs_dcp_block_fallback(req, enc);
 

base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
-- 
2.25.1


