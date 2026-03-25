Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CFE109C03C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 16:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oFiaUt994tgXIcmq5BYOVrSUdNeGQCFgDCIzyi9+nDQ=; b=N+P47yweKcgfvMCgM7sJa3AVH8
	uPjtS5UNq98IiwRUQ2cTocy1KFqC3VNk148ln2Pj2zLwi24G6dA6CP6lSb2/OvEAD+pXcxRrRWxsU
	j2nlAjxDI7kIdjxSKMSazDwIJb0WAtap626xFwjYdx36pJvkGeIWKQVpUS7YNmdF3Sjw1Eu2j3kug
	pI1hCuTokw2+JsnvylJOkRMxRl0bvqklIAGy56xI/CjHo3tLNzWTAhwqGCOEI1vpEdbJnQw/X/UxK
	ILv57vvFNwQDQcuYdOziFLgSuicTJxqxZjQF+Ae7/KbyZF0oBJ/Ytt5ScDwi7WeIYVCTrxZ1CLOlx
	J5R63pqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5RDF-00000003v0m-2orU;
	Wed, 25 Mar 2026 16:36:09 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5RDC-00000003uzE-1lOs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 16:36:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=oFiaUt994tgXIcmq5BYOVrSUdNeGQCFgDCIzyi9+nDQ=; b=OejoQi0Y9i5GenYcn8HFErdIBX
	GYvt8H+ymO1opE5GNEdMgAXW5v+NzosX0Bv68DFT5jVoHdZ7Nm5qqm8MaCZQMHoSQIYtcwJ5jo1kZ
	kLXcv03L/3KEcosEtxaDXWNMVAPgLOdPSHBN+jgmPtlj42QhXObPNQCZxP/pY5w+VlgbGUJq8NlU9
	gl0sH9sG56/xwVVFAA/VBTvUGbWPEGcdoSGumLfP4qO2nWzrVv/1beBxHqn6FKAWvRCROFUm1Dx86
	1VJ0ul2Jt2a3L+BE5aCCIOoft/FialTLMjlknyaY0kRUd69YE6eKvCviwr3Kr7MB820PFy+xb59Pu
	F/F7PNHg==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w5RD5-000Kxr-1f;
	Wed, 25 Mar 2026 17:35:59 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w5RD4-000DdV-2c;
	Wed, 25 Mar 2026 17:35:59 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] clk: scmi: Add error message if SCMI protocol handler could not be found
Date: Wed, 25 Mar 2026 17:35:50 +0100
Message-ID: <20260325163551.1081019-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27951/Wed Mar 25 07:24:10 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_093606_568439_894E31E3 
X-CRM114-Status: GOOD (  10.38  )
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

In case the protocol could not be found an error message is better than
probe just failing with error code -22.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/clk/clk-scmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
index 7c562559ad8bb..c32b15b272ccd 100644
--- a/drivers/clk/clk-scmi.c
+++ b/drivers/clk/clk-scmi.c
@@ -384,7 +384,8 @@ static int scmi_clocks_probe(struct scmi_device *sdev)
 	scmi_proto_clk_ops =
 		handle->devm_protocol_get(sdev, SCMI_PROTOCOL_CLOCK, &ph);
 	if (IS_ERR(scmi_proto_clk_ops))
-		return PTR_ERR(scmi_proto_clk_ops);
+		return dev_err_probe(dev, PTR_ERR(scmi_proto_clk_ops),
+				     "No SCMI protocol handler found\n");
 
 	count = scmi_proto_clk_ops->count_get(ph);
 	if (count < 0) {
-- 
2.43.0


