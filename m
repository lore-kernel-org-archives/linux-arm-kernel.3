Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA23C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 06:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NhlS5DCvXMRcCc3UaPNyrbXwvBz9PYUN+5lwYOhBUzE=; b=NkbdyFGz+CzZGitOjAgwmrkGt8
	LrVtWQrIvGZTeMkae863tKcmeO62TM1lk2NDPBUW8w6jaXZHywD/JfmmrysIGj1CAhH9JVHo6zbvD
	U4CRNTcxWp5p+y1fx6uptpHjvUKv2FQqyomsjgmWOaBOV9hhxNuI5rRiPpZlqD5nVgw6nq9MJusQH
	h9nD+pkduj4SDBCHrtg1QCq7I6XF3/YnEta2TB1ByjMECBW0nLyZzFFjZLdqMe7pQXnWf/RzNqtDv
	lQKjs0p2bGOz1uWRG15m8ZRdOery556t2sOTh99ddYveNUU2z5XvgqSX4QtSQwc6eZ+J+zEVlRRuh
	HlzUD3cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfZ7-0000000DMXZ-1n3b;
	Tue, 11 Aug 2026 06:02:21 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfZ4-0000000DMTq-0jRP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 06:02:20 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-6aea94f96c4so1516211eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 23:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786428137; x=1787032937; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NhlS5DCvXMRcCc3UaPNyrbXwvBz9PYUN+5lwYOhBUzE=;
        b=J60E70rmA4ekKChEpG0g0RTu17f+IFJFz0kBS1kH8NAAR1g7D4YI3X00bPKeeYb6+8
         BWebfnJn0N0OuVcajrsOAXR248020XOtZOfOpJ3nFkjhqUSKn7kZgElLbfq5OYXAiV4i
         ApbjBPFbFGT/pFYwc9vo2kYPyyyEwU07w5JPtsuiYjN3vT9j1+qs2aagHREkKs6gs8gd
         e095j2xqTMtHqWsZT4gwLAVScmkuW1tBe4/OGnT0de+akydbKfej9tJatoasqTK9oMdX
         OerygT3UDgHvx9uBCWvVxbKtTacYa1BJs8Bol+KiZlO3+A4+wGMs2OFUUcXmbcapuLQw
         LLBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786428137; x=1787032937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NhlS5DCvXMRcCc3UaPNyrbXwvBz9PYUN+5lwYOhBUzE=;
        b=WXDGs7yxAweoLAbSN4J7QfaclxdDeCQY9d6fI6HSS2ZIMxDVzTEMbph4wWgs2Fr0Nv
         k4nu6GhdlzgnHt5WlaWL22Tk32h6gMFxsedFYc8lAtqq8GW+v4dxug+iDS1K7PRl/9h2
         WQTVDvYjzQuwaKeEf/t/bP6VbZkMdUUFZ+toWIv00n6yUhCD/HTy9jMfrAKu0/IzYCMX
         WxFzJjboXz+IUfPRpGwJcAMD+cjImZOG3uVuaLO4nFEe1okDJwsyy0zaT7xFDY249ZGM
         gP9Hc+SoKdnUkAjmav+aQHUnV3j6kHOidijbTkdgrrgryP9d5Mu2S3tF7845Q+k9ZtxD
         LmWQ==
X-Forwarded-Encrypted: i=1; AHgh+RpiIiEh7FdfHEyzOu1Qqwt8OPdYjZhtDaUMVwgH8RgUeJQcoB2KHiALdqvXzi+oBQ/SmfXkI6ZRdjfb2ecj9yEd@lists.infradead.org
X-Gm-Message-State: AOJu0Yw74Vqopv9DVObXhNvbsnUC4tJXf+rExKUXjJQMZcJk8Td4HK3K
	Qc+R1whAYfci8NY7EWl429j7CkvnjhaAxykp6X9nIUR/ewv8161cJS/Q
X-Gm-Gg: AR+sD12lguLx/bgR+hCyLWSRaaXyM07I2aoVORmPQb1o6RqOVs3ClTaBBP842VjlHMd
	MXVIs9V1OvOyV07QStxsnQ6yBSHMPMe2mCkSf+Fduz5bp/cQGiAx3HkVExDUxN1UY8lCAptbXHk
	3a70SHGmHIg5b9s+K686mpTp+NXNJXEiIE6VaA1WvD7/M49z5593rLa/z2moEk06g1WS0KIp65n
	VdBqXpWrvW6GWgEfIJwgKu/3pYR2zdzKJ8qnc6JWkDjQ4y0isX8jwNRBHl8g5GDglnKaU9SYrwr
	RsZ3HZGKV3RlYBNVWgx3+3+R+0qXjXWC72kui5falThGNfphzLW8ZA64YBLpEfd+xu84uX17LLQ
	rpo7fiDagAIRRKlQaI3xP9x/7RadIy1ZyVzQXMaV4mCDw5hBkY46GT9k9OLcn+TZHEdc/3tzJSz
	TU0+9K/9jNggFLRXZcMFUW3kOS+RVbBPRh/OkafQ/mz+yZmZNAqqTFjdc0Y5LfTVte+LzuG6/7l
	PDVwXwY5lXT5tb7yQO3q+gLxe+JrJxrmTjadjzrg8qJ4Lo4jX+RkqIinma+dbXU34vqnzhpa4aO
	5nUj+uFQv98ThTLudYz6ln/srkZij+ktDLo96LCb9q+EonrxAWI83lsh3CFiDZrU8qxsjjmCHQ9
	fifrOijU6HbVptMZTmAoPmEB2HO8=
X-Received: by 2002:a05:6820:198f:b0:6aa:d792:e078 with SMTP id 006d021491bc7-6b0a31e2b23mr332881eaf.27.1786428137224;
        Mon, 10 Aug 2026 23:02:17 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b09fa1ef9esm676004eaf.0.2026.08.10.23.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 23:02:13 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 11 Aug 2026 00:02:01 -0600
Subject: [PATCH 3/3] mtd: rawnand: sunxi: use a stack buffer for BBM
 randomization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-sunxi-nand-protected-oob-fixes-v1-3-412e50444673@gmail.com>
References: <20260811-sunxi-nand-protected-oob-fixes-v1-0-412e50444673@gmail.com>
In-Reply-To: <20260811-sunxi-nand-protected-oob-fixes-v1-0-412e50444673@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Richard Genoud <richard.genoud@bootlin.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_230219_186246_3771CAF2 
X-CRM114-Status: GOOD (  14.08  )
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

Variable protected user-data lengths replaced the original four-byte
stack buffer with a heap allocation before compensating the bad block
marker. The allocation is unchecked, and a zero length returns
ZERO_SIZE_PTR which sunxi_nfc_randomize_bbm() dereferences.

The controller supports at most 32 protected user-data bytes per ECC
step, so use a zero-initialized buffer of that bounded size. This
removes the allocation failure path and keeps zero-sized invalid layouts
from dereferencing ZERO_SIZE_PTR.

Fixes: 54dcd6aa69db ("mtd: rawnand: sunxi: introduce maximize variable user data length")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 01a0d0fa7b62..83666dd6cb2a 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -222,6 +222,7 @@
  * USER_DATA_LEN registers.
  */
 #define USER_DATA_SZ 4
+#define SUNXI_NFC_MAX_USER_DATA_SZ 32
 
 /**
  * struct sunxi_nand_chip_sel - stores information related to NAND Chip Select
@@ -1003,11 +1004,10 @@ static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
-	u8 *user_data = NULL;
+	u8 user_data[SUNXI_NFC_MAX_USER_DATA_SZ] = {};
 
 	/* Randomize the Bad Block Marker. */
 	if (bbm && (nand->options & NAND_NEED_SCRAMBLING)) {
-		user_data = kmalloc(user_data_sz, GFP_KERNEL);
 		memcpy(user_data, oob, user_data_sz);
 		sunxi_nfc_randomize_bbm(nand, page, user_data);
 		oob = user_data;
@@ -1040,7 +1040,6 @@ static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
 		}
 	}
 
-	kfree(user_data);
 }
 
 static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,

-- 
2.53.0


