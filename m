Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17078C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 11:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=su/pv3iYAht5ogkGgF2P0degCEAQbGRgDBNWGy4Uw6U=; b=E752UG0YxZbHnFxRiPvZQeSGvI
	uNnoO2XSaB5s5GRG6Hapiwpsmq1BwYht/4IcXxWmRJDNPujmoRSXZGe3ENwPJSe+bg468QbTCbDW/
	0aYA2YQma4ZfAUdjoXW+4mB3WXXAr5d7Xa5u1+3XdaZ8hQiXpt6wFZ6p4K7Ig6tEtrPFkbEjqqRjH
	killrBlUHvShamyy3ihrjTZAOiEj/Q0HD1N9CWmq0A9jA1+7fG3QLK78Rbyu56C/E203LckseizFZ
	hiArwBnpnfhfDWzqpn0hHOYEsXbIWuYTQ6kmkxukz3yvQ+4sBPh4gMbtVfq/LL3Xa2vc8LntZKpyL
	hReiOdmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2STp-00000001wtV-00CL;
	Fri, 04 Sep 2026 11:53:13 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2STh-00000001woG-41Gr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 11:53:11 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso1142130a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 04:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788522785; x=1789127585; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=su/pv3iYAht5ogkGgF2P0degCEAQbGRgDBNWGy4Uw6U=;
        b=ja57GTGEfJyR0fvyP2c/Zp/SFopaPoGtr/ZRPHj8vSm5qQUfIR5SG782dSo12fm48O
         5LarTd+dZhN9lShSsOOHZX4VuEvn1FTstplrq4ITJHRZkXEjxjkd2r12b6TXV8yLRbds
         5AyjxiTFB1QSsKf6I/frkSjsyKhK747ydGs93hnrzdDbfZzV5ZDrgXr0ipF7H+1fuM+l
         aEX0Rhday5m6pvPaRydCn//vaJqmJeHLuDhpujYaCMAixKyGkt+m311YH3vlsHq6A2hJ
         FzqEnAD4QnNM5d1Yvv85pWLREBgeXRRN5H8Q1hyD6oPrKycJDS1ZHCDkkSiGCUOrNmb5
         /pTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788522785; x=1789127585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=su/pv3iYAht5ogkGgF2P0degCEAQbGRgDBNWGy4Uw6U=;
        b=gmrkuBLVmaI75JiCsFpXIr+G2e4HRQZfcmd0R6QYgderNEuz4x3ukFkUI0/U57ndjr
         idXQni9HSGd6N4iV0reeaVGaNbTRt1MSoaCU83DLsjTfRlVrOdr86Hg2UqZ+xHYRCZwf
         g3Hz3pG6I7nAQgaXnnl6HOErblZaGcwai1Bbfo/nktwQrdwdrUrAmVRuKx5ZIkRLNWC8
         9LXzZFExoXE/k0aDY26I5FSDbDlpc/9Y4AWETP+s/U33U0cCgcN8Cr/G5qdVuFnnYGS1
         77/5BVomdd9Of28toS3foqo0NhLENXMtaz8Wwc9KIAgLjVOpA81f5Bqo14Sgu37SCELU
         GlFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwoWT5LHfHc8khC6WxziDZUV9WiuFJ7RpN89z5/NsljkT2UBbkQuRitoUT8T1LAj9o3Oi8kKybo8LHbeVtC+kQg@lists.infradead.org
X-Gm-Message-State: AFuF++lBKRw7oF47fryGXonYldDms0u32xKGtixYFhbbXIuxRifE3FpF
	KE0U0zfDgAyZdIoHIDQRRM9Uj7YEo9F+P6x3oQewr5AgX55uha/+xPEL
X-Gm-Gg: AYBFou1hnKCCEq1pqet/UXfjkJbCznZTOb0yVOmI6ECycc8HqGuvO2GmQ3ltdOe9RfC
	Y5WFyYdmt8hJlvo+eRR3EhWreUvROib4UqRYk8JYy8elKqpz5oOgm/AqLIJQDwujVtdX+gw/hnA
	2sOaHOMJ8uCwDxwBHAiuPuefKTmBqef7+XsBMULKkpqfe6ogyvf+VwGIVtGhIHhK1AfU5N8onUH
	ZOF0EYeekOpVzcDbGWMkLKVGDVqkriLveJ7y/pjkQH1MrONAAlxkh5VwJ0KFkP1B3y6CkuXbdfk
	iz8KMT+NnpKydAVQjLhnm+OoMcq7mYB6Z6F1WNKwrPPGuGbtO3ydmwSjp2RPap/8ObOJ1BclXzd
	V1GJKxZcIxUD5Yq04Fqy3NGUmN5DrOsd7AFxYkvF6nM6qzBsBySfpcLibv6epjXLufYpShlicaj
	vSAQam9S+NQTeDeKgY7e9/cUc3IbVG1jr1OCyzK1eovW2032K8tPR8i6Db/z0WSYpJ7J1+5ipqA
	heDovM4QJcvsKw=
X-Received: by 2002:a17:90b:538c:b0:38e:b400:a860 with SMTP id 98e67ed59e1d1-39b26204a3emr9193570a91.13.1788522785070;
        Fri, 04 Sep 2026 04:53:05 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm9221726eec.16.2026.09.04.04.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:53:04 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH] usb: gadget: fix typo "harware" in comments
Date: Fri,  4 Sep 2026 17:22:58 +0530
Message-ID: <20260904115259.8346-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_045306_001174_33429293 
X-CRM114-Status: GOOD (  12.36  )
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

Correct "harware" to "hardware", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/usb/gadget/udc/pxa27x_udc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/udc/pxa27x_udc.c
index df5cca43afbe..f6352e814598 100644
--- a/drivers/usb/gadget/udc/pxa27x_udc.c
+++ b/drivers/usb/gadget/udc/pxa27x_udc.c
@@ -2091,7 +2091,7 @@ static void handle_ep(struct pxa_ep *ep)
  * @config: usb configuration
  *
  * Post the request to upper level.
- * Don't use any pxa specific harware configuration capabilities
+ * Don't use any pxa specific hardware configuration capabilities
  */
 static void pxa27x_change_configuration(struct pxa_udc *udc, int config)
 {
@@ -2121,7 +2121,7 @@ static void pxa27x_change_configuration(struct pxa_udc *udc, int config)
  * @alt: alternate setting number
  *
  * Post the request to upper level.
- * Don't use any pxa specific harware configuration capabilities
+ * Don't use any pxa specific hardware configuration capabilities
  */
 static void pxa27x_change_interface(struct pxa_udc *udc, int iface, int alt)
 {
-- 
2.48.1


