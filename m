Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 432D7E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 20:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P7TbOAl0J1+553i2D7Hvckux88gOuL0DZy0CmTdqsmc=; b=lBV3Rasstwhwy+ZoaZxi6jT5bS
	38ZovqhtNxs8BsnE6F2kvwMoZ+Ts/JF1fpVBe/4EAMuUbt6dF4AncvRWvQLiGqKNJlALfETtHUFZf
	0wkhKpz6M2LXOYP6pkt4dgW4e2LKBDeCMV6QFwa7+qXSjxOsKTOQinSCVp5ey7ZJ7boG9t47nxsNb
	aa8muvk42ZD/cCoMGGqF/RMVOmWH5BklZzU15lvX9v8dCAzctCuVZE9nXa/EHV0Gwj7x1zVhtMHfA
	UrCuk3i6EirR0XVhkPP/nQb+fpWYCCsscOhpCIcocyCrvA9pJtwoNUkGA7HmvC3bppF5kdLlR0Lc4
	1l91zpew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMsT-00000002zBJ-3TnH;
	Thu, 19 Dec 2024 20:12:09 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMkM-00000002xZH-3xL0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 20:03:48 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-aa66ead88b3so217779666b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 12:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734638625; x=1735243425; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P7TbOAl0J1+553i2D7Hvckux88gOuL0DZy0CmTdqsmc=;
        b=zSeecQ/wKMbmOx+0+9ioc1nTJ/uyN6HCZrC4e1AHJq1Bybj3spowk9Eqbu1+TyzqZO
         Cij80u9uAc9LZpMtKGgxnaz+TxyqTNbtF7NsW1GEJmzbqkkINTMplObjX0X3W5DlOAgn
         frrx4kcRYgjdxuFwjA/xzXCV03rlVlW2PQhrJmmuwn0iIf+IWNRgKomSM99n/6WVzZLa
         A0GGbZUF3DgzHELVIdmXPYKttm6BU6KrmeCWQ3sHo3ljKRl+FY2I6HahEgUYx53UlUZ4
         4eO3TC8MbE6Y+2y5Mi1Hb/UwMj8TROYsn+B+rhdgib6q7+QJF0mb6bMVKbjcSWXwtMM4
         f6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734638625; x=1735243425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P7TbOAl0J1+553i2D7Hvckux88gOuL0DZy0CmTdqsmc=;
        b=OhWKkzHxaysSTgF3ar2RWsauRwr755o0dQigU0S+IP4H7cDmpr2Ep6iJ1wk67Rjc0R
         Su9xiZsvnskdxyA94SdaNIlV0iOyivCdN1oco/JSYb4+P36PjqATEGcpprM1Kg6ruwCu
         t8cvpVJHx8kHpEDH4j/nOLTqhJWkuBYZ3DVKpNyw7HkkG/zf8OpBYgAWQV2q9rE//iQV
         4A7p7uaIfvdpOy3L3IWhndI5BDASIrDGdRQ5A717UPQBkrwSC5d9JTmLgKDhz1S+caSW
         XROS4K8SwoIUVi61iwi3ErorXrz8usLF5t3MYKKFX/z7klIwAzx76B3eVoexXgTJnLX0
         As/w==
X-Gm-Message-State: AOJu0YzHcMiApA7uCXuPIfTwpq8soVxe9uht5x8RKyMJ1tt661QgS/eG
	bEx6SkVYGguLygiDvFaqyG9z3UhQvDFFP6mDFUgy7428OTh0NH+QxpaXA6QkN8Y=
X-Gm-Gg: ASbGncvvQIW+lLnFgfxd5m+YTSxhKiQ5KfCvWq0WOFS+vUkWBI/z7z/M32UPZddwpb7
	TxzFpArGsrfC+tfVHzLtMxLYvVR2GWgsPXNqOoQfPqB9UUullSnF+MbJ6RDl4YaDSdDXHMmYbYg
	v6EHzUqzWtUH+jOeS1L5zq+hCEMxfOIerWqmmCYqiTNrWaSTiGZR/8yTrVIQYuEABnxPCYrAB4B
	UpXwZWTfXugh7F51xt2xJInSKnqRQ+w7aOu0WKFdqT8fr9sTg==
X-Google-Smtp-Source: AGHT+IGUjzXtWgTATIKd5bQdVHnA1/eo1JxNSwRoyL3yoIMsS7bxhfApz1VdWzX+tRETXv44jWlE+Q==
X-Received: by 2002:a17:907:3e8c:b0:aa6:abe2:5cb8 with SMTP id a640c23a62f3a-aac3366f16emr5355966b.60.1734638624897;
        Thu, 19 Dec 2024 12:03:44 -0800 (PST)
Received: from localhost ([2001:4090:a244:82f5:6854:cb:184:5d19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e8954adsm99935266b.64.2024.12.19.12.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 12:03:44 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Thu, 19 Dec 2024 21:02:12 +0100
Subject: [PATCH v4 1/4] firmware: ti_sci: Support transfers without
 response
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-topic-am62-partialio-v6-12-b4-v4-1-1cb8eabd407e@baylibre.com>
References: <20241219-topic-am62-partialio-v6-12-b4-v4-0-1cb8eabd407e@baylibre.com>
In-Reply-To: <20241219-topic-am62-partialio-v6-12-b4-v4-0-1cb8eabd407e@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Anand Gadiyar <gadiyar@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, 
 Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1782; i=msp@baylibre.com;
 h=from:subject:message-id; bh=r5ZUm8egrlEYPDoShASduxwkqRTGU1fuNRSx+4vY6C0=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNJTarj39TIrHVuh58/m8JBRxrr1qJ5uREmCxJxbSsaiq
 ZwXu7Z0lLIwiHEwyIopstz9sPBdndz1BRHrHjnCzGFlAhnCwMUpABP5tJ6RYZPROX8WkaCDr54v
 ar7xNHraOY+HXUInGqX2H0xJm9e4Upfhn+otye2fkkWaw2PnSnS2aloe7Hv+uyqESeRU+tFuzap
 8BgA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_120346_983845_88946465 
X-CRM114-Status: GOOD (  14.53  )
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

Check the header flags if an response is expected or not. If it is not
expected skip the receive part of ti_sci_do_xfer(). This prepares the
driver for one-way messages as prepare_sleep for Partial-IO.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 drivers/firmware/ti_sci.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 806a975fff22ae00ecb88587b2c47ba172120bc2..ec0c54935ac0d667323d98b86ac9d288b73be6aa 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -398,10 +398,13 @@ static void ti_sci_put_one_xfer(struct ti_sci_xfers_info *minfo,
 static inline int ti_sci_do_xfer(struct ti_sci_info *info,
 				 struct ti_sci_xfer *xfer)
 {
+	struct ti_sci_msg_hdr *hdr = (struct ti_sci_msg_hdr *)xfer->tx_message.buf;
 	int ret;
 	int timeout;
 	struct device *dev = info->dev;
 	bool done_state = true;
+	bool response_expected = !!(hdr->flags & (TI_SCI_FLAG_REQ_ACK_ON_PROCESSED |
+						  TI_SCI_FLAG_REQ_ACK_ON_RECEIVED));
 
 	ret = mbox_send_message(info->chan_tx, &xfer->tx_message);
 	if (ret < 0)
@@ -409,6 +412,9 @@ static inline int ti_sci_do_xfer(struct ti_sci_info *info,
 
 	ret = 0;
 
+	if (!response_expected)
+		goto no_response;
+
 	if (system_state <= SYSTEM_RUNNING) {
 		/* And we wait for the response. */
 		timeout = msecs_to_jiffies(info->desc->max_rx_timeout_ms);
@@ -429,6 +435,7 @@ static inline int ti_sci_do_xfer(struct ti_sci_info *info,
 		dev_err(dev, "Mbox timedout in resp(caller: %pS)\n",
 			(void *)_RET_IP_);
 
+no_response:
 	/*
 	 * NOTE: we might prefer not to need the mailbox ticker to manage the
 	 * transfer queueing since the protocol layer queues things by itself.

-- 
2.45.2


