Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4786BCCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 16:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ho6JJQRwGiXKBOt/Alu7bdbMk7B3pL4UhaTJjWAG4eE=; b=2TGUBP6drz7CHPS1+Q0Oaghf6B
	4vJp7qr8jthyQV9V1BSwzWQa2x18ovdtJy0y5b4NDMCK9Cuv2oabssFTqDZA7ZHCKFF3cFw1U3TTk
	p8GzkZtCtrbVxnkUB7B6TM9JGJ/0jO/C2Z/obUZMdk4qxxdxSgRRT1Uet1OGXgnCUeSiXagTd3GZj
	1EjBZ1+BTd+5A55zHmmQCX/8rttz5uOmpkj96D9zHeL0DATAd1U2ZFiitNxtQROGTfKW3cnXoEr4G
	72WfJ9WvCH9FCPfe6L7bPRfDpuu6D9lXDFo6ZF4/aFu18TeRu23hy2K0kntY6IppkZj7rsQ9uS0L/
	v1/PwJWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDmNT-0000000GIRJ-0ZZO;
	Tue, 28 Oct 2025 16:16:55 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDmNQ-0000000GIQk-1uk1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 16:16:53 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4770e0910e4so20887865e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 09:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761668210; x=1762273010; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ho6JJQRwGiXKBOt/Alu7bdbMk7B3pL4UhaTJjWAG4eE=;
        b=H1Ubrku+PXGccvu4D3TtiZsFzcCZEM4IDy0wcIeDAS/WeEDVrbb5eNEWAcfG70hT5k
         3Y04oQlWKAo9FlFBqARbBCMkrJxje3+HwLJGybj//ZuWEbE8WGSBqvkGhv5Bhv1voeOT
         AC9HS6236wAEfLazRB4n8GXza0Xy+8gqPLgtKIL7ui6ZfhIEeEzJe/l2xvCTv6R5jUnl
         ocVhKZZjCDlbOx7d0npBIvq+JxzZCoMhvTFz2FZqmN38QjACZ7i2PTCcROFULpGG4Vg+
         duDcJHWu5Mo67a7AbGzefudNzmjYGv65sQg82/q9cXsWd6YutAvX9CGj3Il+iXv76bir
         dA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761668210; x=1762273010;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ho6JJQRwGiXKBOt/Alu7bdbMk7B3pL4UhaTJjWAG4eE=;
        b=io0+eIMXXGGpTk5+vZEEK4STMNbMJKi1gaJhTAM1ZS+FX3bHHQQOvi56FOCG37Nayw
         /oHNFTrMCI8uVjrSN61s1sIoNtNCnvNZFb6ecVB/ifiua8343oYMkL2mQ42SZOht75EC
         aStwKDZGp722nXWdzDtMw/p4OYDoCejUA53Htb6C1ikR6mbr7m/lWUvLDeCQXSXtdkfM
         zRhCl99Blvcpgf/+nH33Bwxwchn3t3vibRpG3Mcv57JfQTt+fSgNPzmphveGQhbVSAfJ
         9MZ85q7K0+gTPyhTc3Spl+ONlGoDnqtjg9DOaH62c3pp9wzwCNxXM08B4XUwG8EXjhto
         9HHQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3okJt51pwIVjfy1U5SfuvYqBy6DcdnCm7BkChgJRgbRcmvZ+w7SPAPWBW/ZhYObcL+ujQxG155WDpW4KpfdPl@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6dhUBF/a0EcyknPstZqOgKS6p0cA8ZSc2ZcVKWvXZ5LG/nGx9
	dVAJUWPtNfISvoXpQK+EoHACZI7MMEj9C2ZHZeWoG+/LiYjIIs+GoBAZWOqDCavVnRNIlE/mR2T
	5P11omy4VZg==
X-Google-Smtp-Source: AGHT+IHAhlk02BCJ5Vh9MNlszflfsqyTxmT8WTEnXpCaDZBseldqLR8dNqR6+bg3BKFy28J8Xt8y91Rz4bSz
X-Received: from wmbdn1.prod.google.com ([2002:a05:600c:6541:b0:46e:1f26:9212])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:64c5:b0:475:f16b:bcbf
 with SMTP id 5b1f17b1804b1-4771e177ed5mr584995e9.14.1761668210378; Tue, 28
 Oct 2025 09:16:50 -0700 (PDT)
Date: Tue, 28 Oct 2025 16:16:42 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.1.851.g4ebd6896fd-goog
Message-ID: <20251028161643.1727046-1-abarnas@google.com>
Subject: [PATCH] clk: keystone: Fix discarded const qualifiers
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_091652_499196_A82FEC1A 
X-CRM114-Status: GOOD (  12.30  )
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

Add const qualifiers to the pointers returned from 'container_of' macro
to prevent breaking the const promise on const struct pointers from
parameters.

Once you have a mutable container structure pointer, you can change
structure fields through it, which violates the const guarantee.

Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
---
 drivers/clk/keystone/sci-clk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.=
c
index a4b42811de55..9d5071223f4c 100644
--- a/drivers/clk/keystone/sci-clk.c
+++ b/drivers/clk/keystone/sci-clk.c
@@ -496,8 +496,8 @@ static int ti_sci_scan_clocks_from_fw(struct sci_clk_pr=
ovider *provider)
 static int _cmp_sci_clk_list(void *priv, const struct list_head *a,
 			     const struct list_head *b)
 {
-	struct sci_clk *ca =3D container_of(a, struct sci_clk, node);
-	struct sci_clk *cb =3D container_of(b, struct sci_clk, node);
+	const struct sci_clk *ca =3D container_of(a, struct sci_clk, node);
+	const struct sci_clk *cb =3D container_of(b, struct sci_clk, node);
=20
 	return _cmp_sci_clk(ca, &cb);
 }
--=20
2.51.1.851.g4ebd6896fd-goog


