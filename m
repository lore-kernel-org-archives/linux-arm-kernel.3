Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92AFACCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 14:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QmA+fxDwXNd4r2km4orWOLxYXAzQdDkMb/ExdCUz6S4=; b=qnYMoBi2S+Xr4DkFM8r5uiH2tW
	wGU6ofIrAKLypwQQNH3U8trAUHaByx8QiuQaRbFwlmnmqvxWSsY3lsNFnAuALVwgALVmxSK6LdRIf
	MYjsaEee3AOmnz9OYRa3J7zGVFmgf0LXupSRVUwJ+R8xIhsDqMf/SHd+iMOQNzItJ8OGxZkxrd7gM
	S5h6dMR/92Zmh6P+CM5/26fyj87E2Mo9rN7UP/4JoslBJBpxKVMWvOCABBOwlHAWmMDBE3tZIWJSl
	9Xs5xyFF2bl2OhdKLXSvmji59/OBS0K9p5ik0UH/anWu6z6THaRU7z0GHAPjhDyBdG6R++sdEJ3qn
	G8Rpqe6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3xyD-00000008DVl-26zJ;
	Wed, 01 Oct 2025 14:38:17 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3xyB-00000008DTw-3aXV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 14:38:16 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b3e234fcd4bso634805666b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 07:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1759329494; x=1759934294; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QmA+fxDwXNd4r2km4orWOLxYXAzQdDkMb/ExdCUz6S4=;
        b=qo8fFq+YiWomRuL8JWKo+DRmjdwgNvvZzmmTugoNRD0Pebg3HRSn9bsRc0kkWKJwDl
         Qhb6kEWw7slKcG+13wDL0dlnWRSV5tYvlDNIcXYpPzdlMPpIe60j7ka8/9OEA1xVsiLZ
         DKq0gG9TYNoLI4aXnb3kLqQYX91enr/Q7piW11aP8E2Zb7z0gW/yG+yWlB3jPrXhVJzf
         LflpaOJXc2V/TDGmcTu9OfFzbJ47ZcDNptQCZxOyahhUAyFtjuxlq5LEchSuAFk1eQTd
         SZ/OroBSlm/EMod3IE2cQXfceo8ioLj9TtQlJ3VhOop7jwi2/FowhOpvfchDW05JFvoS
         tVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759329494; x=1759934294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QmA+fxDwXNd4r2km4orWOLxYXAzQdDkMb/ExdCUz6S4=;
        b=itJUA5pROTlQM9TznRdgcx54KjWfxHYBHylk38Jfx6b1m5x+FnZcAFgIDA61uebhU+
         AReWS5Lc1zwyUMbV8lMfoIEvPivH777EYkWSSltsXA9zzHNAv5nalSrwcbWTxh6Cwh1O
         soGzOBcatclYnrmZekLt2Di2kb7RLSFT5us8iUGk3dCn898tmCkJrsPh7RwRAuQT3llr
         qe5jnpr2tAgajNHkMEBAomTzVux3LekB3LBE7ohj/pHUvznIkgDj2fXoC9y7mHTlIKrM
         G6U2EKHVwHesa6pkn05mTbsEdgP5/iwIjSU3EkoedA3NKNEu1xuQRxVIOAsNewNtkwKU
         ZmyA==
X-Forwarded-Encrypted: i=1; AJvYcCX6pnlvyHI6WgvhGE1P+/Bkq6PQYJ78OEHLZwQQTzSMJRHgZGq6yI90EAodPx4jciUqwVjjrN7Nkw5PgCsnWBi2@lists.infradead.org
X-Gm-Message-State: AOJu0YzAwO95nC1ROS5griiS1ZrE69ismrfnfHfGpsZfvnTNpbGL6If3
	evbrsYomHFEwqxkEIXd9W9/5ztaoxLdnzgak90QlbuWCqCLkbukKQevNkr2/IBROJ+Q=
X-Gm-Gg: ASbGncsxG/hnRyGktZCVedc1az9gUXQqG8qPVdXWDheA00Iknhe9TULD4s7KX6XVY0E
	2+ISB8HMEwuamBtt7LJ0GFA3eTGw7L/wjjBWJdfj8nCDt2NvX7pzS0h5UaylreOSHoTDf7uoliN
	miUPiCR8k+jzydw4T5twawvUQIlMp0MW54ISUaX+lOpLanrUkUa3E3PwTHMoZ13hSlmlBCgGcpz
	5mtAqG1pDbBngn3X1jSDxCohy0YUykB8ge+ruuBPkCdYvd6jDtIA0vGkI/Cln1gauf8ygs45v1k
	PS/vLoCjVQl7yIwoFABAmb4CppCLhp3tO/TC97FLOKixlGgh1UXvykjAn6KVbDNRUSjU7c+VyTC
	VPFAZNpJU6c1uewbGUlqDw9YoNrBTgvbCnjbXW9EAKjkx
X-Google-Smtp-Source: AGHT+IHfuFiRimcEv1krPbdAWrrcL7XU+qBwY+On7p+dsFTSv0tKvQyoY3KBf0q61CeTK0ABbzD1zg==
X-Received: by 2002:a17:907:869f:b0:b24:7806:b59 with SMTP id a640c23a62f3a-b46e7bba94bmr458201266b.55.1759329493968;
        Wed, 01 Oct 2025 07:38:13 -0700 (PDT)
Received: from localhost ([2001:4090:a245:8496:49da:2c07:5e9a:7fb9])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b353e5d0d0bsm1401521066b.5.2025.10.01.07.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 07:38:13 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
Date: Wed, 01 Oct 2025 16:37:39 +0200
Subject: [PATCH v8 2/3] firmware: ti_sci: Support transfers without
 response
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251001-topic-am62-partialio-v6-12-b4-v8-2-76a742605110@baylibre.com>
References: <20251001-topic-am62-partialio-v6-12-b4-v8-0-76a742605110@baylibre.com>
In-Reply-To: <20251001-topic-am62-partialio-v6-12-b4-v8-0-76a742605110@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1698; i=msp@baylibre.com;
 h=from:subject:message-id; bh=PFszx48unL3OZdOKxZC+O4/dOvgkdgU64h4yg5QoZts=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhoy7Nkf3FAm/tbg/ufOT3QHXX3o13lsu6cyLLuZbKnGq1
 0zKcllcRykLgxgXg6yYIktnYmjaf/mdx5IXLdsMM4eVCWQIAxenAExEfRkjwxr+ehu1Lp7V6+4f
 Nf+w9xDvkw9b1bnvvI/0N9ffzTWjfCIjw5c3S8Q0ZhlOFcg9wJBfUn3wLePtm7sfHSmaHBty98t
 XZh4A
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_073815_915624_9962465B 
X-CRM114-Status: GOOD (  15.83  )
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

Reviewed-by: Kendall Willis <k-willis@ti.com>
Signed-off-by: Markus Schneider-Pargmann (TI.com) <msp@baylibre.com>
---
 drivers/firmware/ti_sci.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 24ab392b4a5d0460153de76fe382371e319d8f2e..4db84a92a517b0aa7bb8d47e809d9848a16e2cc4 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -398,6 +398,9 @@ static void ti_sci_put_one_xfer(struct ti_sci_xfers_info *minfo,
 static inline int ti_sci_do_xfer(struct ti_sci_info *info,
 				 struct ti_sci_xfer *xfer)
 {
+	struct ti_sci_msg_hdr *hdr = (struct ti_sci_msg_hdr *)xfer->tx_message.buf;
+	bool response_expected = !!(hdr->flags & (TI_SCI_FLAG_REQ_ACK_ON_PROCESSED |
+						  TI_SCI_FLAG_REQ_ACK_ON_RECEIVED));
 	int ret;
 	int timeout;
 	struct device *dev = info->dev;
@@ -409,12 +412,12 @@ static inline int ti_sci_do_xfer(struct ti_sci_info *info,
 
 	ret = 0;
 
-	if (system_state <= SYSTEM_RUNNING) {
+	if (response_expected && system_state <= SYSTEM_RUNNING) {
 		/* And we wait for the response. */
 		timeout = msecs_to_jiffies(info->desc->max_rx_timeout_ms);
 		if (!wait_for_completion_timeout(&xfer->done, timeout))
 			ret = -ETIMEDOUT;
-	} else {
+	} else if (response_expected) {
 		/*
 		 * If we are !running, we cannot use wait_for_completion_timeout
 		 * during noirq phase, so we must manually poll the completion.

-- 
2.51.0


