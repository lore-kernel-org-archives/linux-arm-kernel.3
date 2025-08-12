Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF9FCA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+wl9/XOTim6WdaL8AG3rz5NZoFmUCOhNpHeMxsAgkas=; b=iCTZGcwVRngKrHozkUMupJYu+w
	oumB0EcjI3070P348r/Ru5SCKRAY+3zgfrOpSJfvXweMtD4mhBp0iO2J97p7eqqiFtXhesLBcaljQ
	+EsR9623moWlfdYG85tyTnIhLobM+oq7EhpcR5I8cefQcepgXRuCbFoUv1eAtgQUigZb3recAen4C
	EaLKCti5rP4rvYU4NBsXPoa37X+EsxgGVkhwl0MEctDmLlBSGs227JXk2iPnJrOU6dTvVem17eu8/
	MTvZwVubPcybup5SXuClHWAjokaIndklU2kXOFHvb1SZf3FIvug0hj+a56b93XehuKpyVM7xlHCxz
	k85KNmVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloIy-0000000AnZY-1uLj;
	Tue, 12 Aug 2025 12:40:40 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ullB2-0000000AMOl-1ZZR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 09:20:18 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-615398dc162so8211250a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 02:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1754990415; x=1755595215; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+wl9/XOTim6WdaL8AG3rz5NZoFmUCOhNpHeMxsAgkas=;
        b=AqcJpI0Sf5LW2eegOiDcMbrX+bzq1eOK0yr7xQJfMYEi8A0SP33aJ1IWuMa22gbsOA
         U/vnkGTv09ynQONxJJ8M5HOHApZUcMed7sggkJ3tXNzYlbAy89iqXi6HL557ZjIptv9f
         5lGxrdRRri/VNnu+QRXKGr0M1D4MpZZcI4wnYIOx0zAq6z2gSppjrUZUzC/ybxPKa00I
         D78K3Q2o+Ff2gNi5SCQJNMMEdfbEfxW2izneI0W+83vosuoqtBr/6oHOR8aeW0SPkeLq
         gd6ZkZfQQ61zauXux7sghBYeZjlKcHd4LlRf8w/WhVayjqTJyJSTbD/tyrcaRnpLEIMJ
         znuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754990415; x=1755595215;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+wl9/XOTim6WdaL8AG3rz5NZoFmUCOhNpHeMxsAgkas=;
        b=CCdWFEvut1l7cmzjV9uUaoVNr8TrabG0MkWRKWm0vPq+n9bS/5isKoGSaC2z5Kfc7U
         7O52pSsExZcdXJhvtQlT7ge9l94OUyifaIplbgVFSBfkTO8FBhVILl+jkguJk0linadm
         5pE5bXNN1E+A/JRVopDFScUsLDMhuJ4GDC0Rd6452y7f99LPYVe9fvjx+ucdhkbpOFsB
         b5L4QVZ2PExL1UesHQPCEW52rB5cJ4aHxnXDZtfksuNk/amA3QBNWXCsY5kxc/Hfy8PK
         RFyUnLpPZrE8gJV2aJG4bMiIQ0d5SvTCx+MW2IgGNibqEM7PgE/+kqbf6EW1juQkdV9I
         4avg==
X-Forwarded-Encrypted: i=1; AJvYcCUx1x2RC/rSgocRRwUXDu4tJpoUS+QfBFmVr/N9taZON+FlH3pR1pvign5Typ/X2DH5uQqmqfU1WGL/42lTUVdh@lists.infradead.org
X-Gm-Message-State: AOJu0Yzvpcppaa8jELiZkLdEk5xiT5rBp20KrAqszCiMHI3Ahqwqu6kc
	Zkk616yRCJzRbdWxfNr5FuJGWuizEZFXGBgxobUS5ptXUPHkZ92XdEXESJZO8RJ0tqA=
X-Gm-Gg: ASbGncv1M9hehIXyLhmeiMHDzFXfyMLg1fn9p+ZU+LdcsS55UEPAVabXv5aeYogbSqs
	DRNt8Y776n9TrF2ftFSyxo5n4uKEFGY6Pj7HOQAIFLAD+ZTOivx578jjxLOG/1KMymK9JU4yUli
	1CdCxjfWTxL/GOb79OzRnXLEdeCUl73NqsL6BoUExw+cGp12dzSaLCZUiSZpDb4N9U3nHPVdF5N
	620RasawXXSJp/K7EbLisLYufGF/KJY8Kqt3i9pzTBq7pGtn5M5lbSWC3KMKLUImZI+o8XKWBuf
	6vOH/XUKd1FxPF78oV4qjMUFmOAjiM+/+I06VcZPweP9+Z/eMhdft9dU+l+c5axlLErlpr5kHEc
	N1GF5p1uvCDsLJqlixA==
X-Google-Smtp-Source: AGHT+IHA0BhQHyhj6+ZMlXR3XdExgEUuPO9rJXkatz86G0wDHNYoLcWjbK57FCnDT1GCyNL7sSjlUw==
X-Received: by 2002:a05:6402:1d4f:b0:618:1835:24b7 with SMTP id 4fb4d7f45d1cf-6184ea2b736mr2051399a12.1.1754990414785;
        Tue, 12 Aug 2025 02:20:14 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8691:4b7a:7bbd:bac:c56e])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-615a8ffbde5sm19677699a12.54.2025.08.12.02.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 02:20:14 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Tue, 12 Aug 2025 11:19:47 +0200
Subject: [PATCH v7 1/2] firmware: ti_sci: Support transfers without
 response
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-topic-am62-partialio-v6-12-b4-v7-1-ac10865c2d87@baylibre.com>
References: <20250812-topic-am62-partialio-v6-12-b4-v7-0-ac10865c2d87@baylibre.com>
In-Reply-To: <20250812-topic-am62-partialio-v6-12-b4-v7-0-ac10865c2d87@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1642; i=msp@baylibre.com;
 h=from:subject:message-id; bh=co/XPjA9AfZM3VBpKGqT50xbxI8+cJCb3D6ouP3h/mc=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhozZ7E5JLpHHVx7xsxS9K5HrekPVf/LcWTZsC6yqZcqse
 fVWiy/qKGVhEONikBVTZOlMDE37L7/zWPKiZZth5rAygQxh4OIUgIm4mzD899QVmsUckMTZFcJW
 vKheo35Xy+ctu9Q+/tK+M93XKmRrMiPDtZedTA/nqFvN4zOae040/8z8qLfRu0sZ9VkmySdqJkv
 yAAA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_022016_425017_A9227FBB 
X-CRM114-Status: GOOD (  15.70  )
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
 drivers/firmware/ti_sci.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index ae5fd1936ad322e5e3a94897cc042f6548f919e6..c187fb714b3a4c658d0593c844716d4b160e4fa9 100644
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
2.50.1


