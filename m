Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28EACCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 22:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E/+WQHbspGhYom6FteVk+Jx/xmGu+BDsXnluhln5vIQ=; b=5FzvQJbf5v00BGYtr6iapMXw7+
	z3O1NHICxukp/mwSL2vp97SYik+avmagGvg/wxKwcecjvhVwsM8r2N2PofDh1eGIFCE99bJPPfZvo
	Y21LmgsOjjXcu8A8eiz9Ovb38jgqEjPtCPAuGUhO/5c2vmnKgoBfq6HvckQmqK/Cb9cSGz5jnUXSz
	5V7XeT3tx3zYjr1pWxz/DTaNbFV3FayHrq8BmNagKtR3HHKltKRazh5touS41fhAaXr1Q41jX0bJ8
	8lWxVnZ05/oMh7Eao/STrM1eWjbNE7q5rLWqI9fUloCmU9F6dphnSrxfCNzkgm5kubvZPxy9iY7ti
	civZzijQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upDuG-00000000mFi-3CX4;
	Thu, 21 Aug 2025 22:37:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7OY-0000000HQaq-3V5H;
	Thu, 21 Aug 2025 15:40:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AD7A85C6442;
	Thu, 21 Aug 2025 15:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 115E3C4DDF1;
	Thu, 21 Aug 2025 15:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755790804;
	bh=983CG/MM3PcL5TC3u/pW2QKWD6qqvQjonF9bKDfHiWU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UtZ4GISrLRQy+Ri5tVkjPwREu68Lb90FYK/T6sOy/+DORJGscW+c+VHx83+bWusmm
	 VXT3O/0JYdI1HVw47UGrfSivi2Zm8xAhotj9q//asJYeaDD/0muDrHvVMpHlu5D1bQ
	 X1YnICf4vH5T0RczalmnVb10mC14y0SrBYGhFMQc2lzhqxMyLUHdj77u54vzL1wOLe
	 CygYzLFroCp4pn4YQfxZLV202+sWERFk9ca9VT7euRgpzTLD5V/ROp9mC0y/3iAtER
	 yRjqWNcSD199syP08bcDwpjNS2r7cKDMlzrZRy5hC1DJRYk/1v3KtY/NwBMGPf3yNa
	 MNZ2CYgCEc50g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 012D9CA0FE2;
	Thu, 21 Aug 2025 15:40:04 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Thu, 21 Aug 2025 15:39:09 +0000
Subject: [PATCH RFC 17/22] usb: typec: tipd: Read data status in probe and
 cache its value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-atcphy-6-17-v1-17-172beda182b8@kernel.org>
References: <20250821-atcphy-6-17-v1-0-172beda182b8@kernel.org>
In-Reply-To: <20250821-atcphy-6-17-v1-0-172beda182b8@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 Sven Peter <sven@kernel.org>, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1479; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=w4gEKin788lV37T7P3ejSzEd1QqxJ5N159RtspJlYHw=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ8Zy293PtrFe1BQWP/vRXeAgT+GkU3W2b+NczGo2eV7zt
 up74nq0o5SFQYyDQVZMkWX7fnvTJw/fCC7ddOk9zBxWJpAhDFycAjAR91kM//O2n1hQUxEYfLGx
 sX7rsSpGabXncYsZP/usTD9rMT9R35iR4bHO0kmcCd/XHDfWuefYe7dzv+05v5lTVv+q/1Ecn7I
 kkRcA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_084006_996089_9AAD9D79 
X-CRM114-Status: GOOD (  11.90  )
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
index 2b7c5017a347d153b50383b34123a2ecc424eb68..bada42fbe59b29a9e864e17644da41908a445102 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -177,6 +177,7 @@ struct tps6598x {
 
 	int wakeup;
 	u32 status; /* status reg */
+	u32 data_status;
 	u16 pwr_status;
 	struct delayed_work	wq_poll;
 
@@ -539,6 +540,7 @@ static bool tps6598x_read_data_status(struct tps6598x *tps)
 		dev_err(tps->dev, "failed to read data status: %d\n", ret);
 		return false;
 	}
+	tps->data_status = data_status;
 
 	if (tps->data->trace_data_status)
 		tps->data->trace_data_status(data_status);
@@ -1554,6 +1556,8 @@ static int tps6598x_probe(struct i2c_client *client)
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



