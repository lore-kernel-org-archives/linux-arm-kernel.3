Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF16CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 16:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ev2+FUTH1pICvWDCCZ+poTt7/FhAZZYkpPGkvxxJEP0=; b=G/0Tm/xfemtM33P/cQAHqK2XuD
	MLqWCfEK5cK9ecIYEufWx7zsp03D9IJlpmfhYPNpmaXKTxy0PE3755pALhgSXsVqzxlq/NtKIatHy
	HIGixRrMSUxoD+TfENb5f0QuhIb19yN/eXg5FtwTLUJBmnERc5R/klTbCYiuPQMFS5d7RClPUQvLP
	ZoOxem9ld/jGZeJpQxmG2MauFNwpaFYTR5KO1mliiiztRHGOdzm4ve7n2ZABzeB2fZPeN9uFQ6yhQ
	CXbRYjVB6/agDI6S2GbA9Z/Xpz6CovE/+5tRh1/HkartTvhRde+RnfV5UAWJM1Y+9RzYJPJsnY28/
	gdiTZ8yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuvfP-000000086Xj-23IG;
	Sat, 06 Sep 2025 16:21:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuv4o-000000081i0-3uHf;
	Sat, 06 Sep 2025 15:43:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3BE7745230;
	Sat,  6 Sep 2025 15:43:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1C70DC113CF;
	Sat,  6 Sep 2025 15:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757173420;
	bh=da0nPHLb+kjJFizEGwI7X27ZL2AoDem8fuVWASExNUk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YtWb0fpGpaC5RQFl1oG57UBX04lywvgRfn7jPwrdJFTkMWs+DQhLOTMe0gqjuUotY
	 DNtdIBxgOCis28lb+2W+fIu/SbXE0DewOHj2Nf+IoHt179LCMUfTiwRC6jMWY76wQB
	 4s3cDO4mFLINRHNAdlLDw+pQ9UuIDCYqgbSHgYZWIq0xccrgzyDPaHMD7sa6/tB3AU
	 dlTYUjPdLL3gs7YUCb8cy76eeFc2tU8zN4833pn6njP4yNkWI9D2PCqThSNk0OntcV
	 nrC1XbBmwO6X8o+cxyO24FHmH3IZ8PCH5XxLfI4MO9qRv0oFNwlVVQNX80q8q2Y78r
	 iNmibGXZmEpyw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13A5CCA1002;
	Sat,  6 Sep 2025 15:43:40 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sat, 06 Sep 2025 15:43:27 +0000
Subject: [PATCH v2 14/22] usb: typec: tipd: Read data status in probe and
 cache its value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250906-atcphy-6-17-v2-14-52c348623ef6@kernel.org>
References: <20250906-atcphy-6-17-v2-0-52c348623ef6@kernel.org>
In-Reply-To: <20250906-atcphy-6-17-v2-0-52c348623ef6@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
 Ran Wang <ran.wang_1@nxp.com>, Peter Chen <peter.chen@nxp.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 Sven Peter <sven@kernel.org>, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1479; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=apIjO4uQjpk9TWGcbO53K/zBq9zHh6dxC3iJN9qbzAg=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ8aesEWvvkpfDdwbIq58dkrs5JWbO3Nq4j/uNK7eMb9P2
 nWR0XT1jlIWBjEOBlkxRZbt++1Nnzx8I7h006X3MHNYmUCGMHBxCsBEzigy/C9iTP1zclKuQOgN
 HQa1o2vmyBk161wzFDCcO8vjY/S+gJWMDMdfcIcKb9p3e2Ko995NBRkib2UeFs6zcP9z5umx0p7
 F+pwA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_084343_032603_80ECBC68 
X-CRM114-Status: GOOD (  11.52  )
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

From: Hector Martin <marcan@marcan.st>

Just like for power status we also need to keep track of data status to
be able to detect mode changes once we introduce de-bouncing for CD321x.
Read it during probe and keep a cached copy of its value.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/usb/typec/tipd/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index e6e9730ee6dacd8c1271b1d52a02da49ff248d3e..b558fc5ecbc35a9dabbf33c444f38173740af7c3 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -176,6 +176,7 @@ struct tps6598x {
 
 	int wakeup;
 	u32 status; /* status reg */
+	u32 data_status;
 	u16 pwr_status;
 	struct delayed_work	wq_poll;
 
@@ -538,6 +539,7 @@ static bool tps6598x_read_data_status(struct tps6598x *tps)
 		dev_err(tps->dev, "failed to read data status: %d\n", ret);
 		return false;
 	}
+	tps->data_status = data_status;
 
 	if (tps->data->trace_data_status)
 		tps->data->trace_data_status(data_status);
@@ -1551,6 +1553,8 @@ static int tps6598x_probe(struct i2c_client *client)
 	if (status & TPS_STATUS_PLUG_PRESENT) {
 		if (!tps6598x_read_power_status(tps))
 			goto err_unregister_port;
+		if (!tps->data->read_data_status(tps))
+			goto err_unregister_port;
 		ret = tps6598x_connect(tps, status);
 		if (ret)
 			dev_err(&client->dev, "failed to register partner\n");

-- 
2.34.1



