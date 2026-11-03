Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDBA606A335
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 21:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iUuxKb/8;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JxkmBzb6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jz7Ae56TC7O0hDxxX+ampC/iunsONsLTXzxuwvv2ZZc=; b=iUuxKb/8G+OhGv
	+QhqpHqHP6iIqnkTZuq3nhqaas2+JjLI3A+Ho0NAZcO6hpdzDAqG+G0I2FUxFf5lwwJs9jepTBXFA
	Gzscq8fQjWOwzbcyJTnvrf8nsWRlQp5/3VrWpbcR/GJz/W4wkmwNzLze2vVX99A18GYAOBlCCT4R0
	Ccw0XnJns+Qw7j1hn3b9T5kDX/keRvzxnm9Cu6vK/1r+wvKReQo70srOuQJ0mglBQeyg+O96sw+Up
	V2tgXG/fuLjBQ2kUqTIP5acYLc6q7KUZ5gRAwZJqcSfuwWGZWqYUfKSs7Axu7Kbj9WQnt/5sfRbT+
	S86dpCl7LqrQj/B1ui5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOM5Y-00000003hXV-33hw;
	Tue, 03 Nov 2026 21:30:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOM5X-00000003hX1-2RIL;
	Tue, 03 Nov 2026 21:30:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B717415C1;
	Tue,  3 Nov 2026 21:30:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA9EB1F0093A;
	Tue,  3 Nov 2026 21:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793741438;
	bh=jz7Ae56TC7O0hDxxX+ampC/iunsONsLTXzxuwvv2ZZc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JxkmBzb6YZosy4vS1BthRew/1CFSfcQ+hhz3H9mg4GPRq2RMxeVIst4zwIq+RwoVO
	 S7gndZ38aDVeZKoIbR+TkGGE4Wv3Td2uE+AOIiCsBY/FWK+bCYeODYnMDRUDgbW6A4
	 hUpm73aGcy5y6WgtdoFrl53cFt8dRkXawdr64VXkM/WKuKWtWy40v6Ffa8WkBo0OMA
	 mSMjeoMejWOjor0ZFkl5qCRfGFaL79x2eb8YSGW0pJBwzGfY7dBLCleCO/Wf8dXjeI
	 /6n/h2Eoim4jIdXivTt6kPXjZQ4B/0g1whw+17bEU/a2tP2ef/9GQUJLPrnRHCZS7e
	 zxAkMt063jlHg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Rob Herring <robh@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH 04/10] pinctrl: mediatek: mt7981: Add missing entries to mt7981_ant_sel_funcs
Date: Tue,  3 Nov 2026 21:29:09 +0000
Message-ID: <20261103213002.1673560-5-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103213002.1673560-1-lee@kernel.org>
References: <20261103213002.1673560-1-lee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mt7981_ant_sel_pins[] defines 14 pins (pins 14..25, 34, and 35), all of
which select ANT_SEL at function mux mode 6, but mt7981_ant_sel_funcs[]
only contains 12 entries.  When mtk_pinmux_set_mux() iterates over
grp->num_pins (14), it reads two int elements past the end of
mt7981_ant_sel_funcs[].

Add the two missing mode 6 entries to mt7981_ant_sel_funcs[] so its
length matches mt7981_ant_sel_pins[].

Fixes: 6c83b2d94fcc ("pinctrl: add mt7981 pinctrl driver")
Closes: https://sashiko.dev/#/bug/linux-6233f285-1487-4d2d-afe3-d4ce3c445054
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/pinctrl/mediatek/pinctrl-mt7981.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7981.c b/drivers/pinctrl/mediatek/pinctrl-mt7981.c
index 2325cc8b9345..62fec909408b 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7981.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7981.c
@@ -800,7 +800,7 @@ static int mt7981_mt7531_int_funcs[] = { 1, };
 
 /* ANT_SEL */
 static int mt7981_ant_sel_pins[] = { 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 34, 35 };
-static int mt7981_ant_sel_funcs[] = { 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6 };
+static int mt7981_ant_sel_funcs[] = { 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6 };
 
 static const struct group_desc mt7981_groups[] = {
 	/* @GPIO(0,1): WA_AICE(2) */
-- 
2.56.0.385.gac671c819a-goog


