Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6DEACCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 19:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SAeoEq6yHDKt64XU8PioOz0s2+K/90/TohU+qG8Q+p0=; b=J9v9flkWvAPovLJlJvAu3c2LoY
	F6v4vb5RLmT/5FKlA60l11VSgRLZjmO44UR9qmlvmEjx95I2Tb/e0zeINqyg7twVmmaEP+MKwj5z6
	6qDPeTlkO8gGvreW7bs2W6Bd5exrOSTvQfZu+qiS3m9Emm+ZE/MWp/gniWlDdxL99tBNwfvtblX5h
	BYC+Pekzmr2ffIW7uOPGV/xWZjklxR8QgmtX24GMtZy0NrGQ94ZCCa4HCvGA9T6B9W/BLtDbv7o7J
	E6U/ywEKQjrQNAjHyCabJliupoizo9/G6HST56VVa/XYSEcWH6isM6xvvH090/4dH1PsIiZO4BRgT
	XdfD5DoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIAT7-00000005Ar4-0Lxi;
	Sat, 17 Oct 2026 19:53:26 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIAT0-00000005Ami-3yig
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 19:53:20 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-6b19e291cc6so1044926eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 12:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792266798; x=1792871598; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SAeoEq6yHDKt64XU8PioOz0s2+K/90/TohU+qG8Q+p0=;
        b=cTeyuWtqbw+XSyV6/1168uuS4I5f5ohJHLHQSiUOKSAVjb+zxi4Oim4niNCYYjFWUX
         kCuz5NYnb9I0zhOQOkcDOrLcTkoMxoHy6r7Qjyd44JabARFGnskIzYqCW3X3XmXi5XMP
         MmZ8tyHzwyJwq1SO+kmyqMymLFsxQ0DG8GxyTXkHLA65cqCPUTeWvWGlkBukCnhOcH9i
         XPLsMVUxUD0hBMNI8bBB8dMfKRyM6zjKF57FQNzrAwezY2m+Pu+DmtcgwddL3fAgNeMf
         SOTSAF71lmNuB5EaCnC73oB+o9jrjBrxYLOBKedahMJGmttCiB4z3Oqj9t30cdsQDrS/
         S3fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792266798; x=1792871598;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SAeoEq6yHDKt64XU8PioOz0s2+K/90/TohU+qG8Q+p0=;
        b=Ire0/lrLZYFiXi7V4l6ubDXpvoGu+wVVVCDqSUkeq4bw97QtuLaAwg+HGyHpsEG5l1
         yie8xMzW89fASUb6etMrZOj59zSqp2ulWVF8fuCWEtE2vvJEu79Prml3RZoEPXqVvEAo
         rxAepoyKG8EJ69PJ8I6ayzQkNpcgwiEbFARKctAe8UtKD5YuYj530F/+hKYItoGPJqLd
         zZEcFavzBwofEcVU7M7XKSkHtkavgBLGvwZz8v+fIRsgfzPF8ZaJr4auQ0WPwzHW+RXc
         OzAPa4IUafFrJjQRUB+xfCifBrD4ZoBIJOVKYQlW22y0Kh3Kr357BgUUnpaaZU/LKnhf
         UXdg==
X-Forwarded-Encrypted: i=1; AKwUvBxP0KtjW113jjNYramJpTuIqQlG7yVW3b+uMeqqZ81VhoIdQQ+6Z08u8UiFMiVJwzbKwEeNY4JKRMK0SxsTS+18@lists.infradead.org
X-Gm-Message-State: AFq9FYIV+4krQ8h4D4NGkGQomAYFH9iCiVfxWEm5q5VBczI7EgTI++Na
	P2bohnvLNVcgFevgG/GxVt8AC/J3ypli2+2Fcak7esXT2YCkuRy4ydjU
X-Gm-Gg: AYBFou1WGqa1pRD7FqqMfWK6zogY1FL3Z07OUZtbWlIsd7CblEnLN1StPNeoa+gZZ0N
	mSj+V/d8MiLNWP/NQXnWX3q3nScG8FgcFksbKyQgtrNAsexMZaQGc4w0ArJVee9iQEZaG+7NJ+B
	GSyLyXSR2LZfxNUUfuYHOy1rXTDoM2PDXFdzZL2pMxkuypLsiD/KRQgaW6SmsH3Jb4gfutQSjXB
	1iNLVoXx6mZoLRyFmHy/8FbXQgYz2ThVKw/87HkiNuGJPPMxW+ZVMFugGQaOznTRFKWvNoy790Y
	clS3GzosmTPf/YGB11pTqVLZxOdzc6e2AIPP507dxnewzdkFcfre4ME0sy5Xg/YmudCyyNQGyNV
	nDjoRJ3tbW0Ew4dnDV4metet7xenFgvg4kGpOHLsdmQYiDQCTdiNQAQORWFtjKCt7DPmn+Da341
	I8z+GNVRUTLfjACBISJFmy8FL3MxisV48dCuysZjrL3Ya6N99N2kn6407ktTQ9kvnac7PErFkwx
	+mQ1uDMyvs53MBmxwfMs+SaB6Fj+DI3VYvAiz3lpdJpinW3nu6jfvszrZZddyoBXGJwB6mQPCzt
	GPCxFsJdRv71+yFq8UbT3RW1jqkwU8BiUw7S/DVn5VVySLrRBsh/a+2A2g6Jgzkb3+DUQmZ3rom
	lePnstvksjmPB2pgaUtMHOUlv6iHhDu03LIuc0xM/kbzeOC3+iUJtxg==
X-Received: by 2002:a05:6820:c2c7:20b0:700:da68:7396 with SMTP id 006d021491bc7-70357791d36mr1496668eaf.67.1792266797756;
        Sat, 17 Oct 2026 12:53:17 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-842a6e12dfasm4829795a34.24.2026.10.17.12.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:53:15 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: James Hilliard <james.hilliard1@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Brian Norris <computersforpeace@gmail.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: [PATCH v9 14/18] mtd: rawnand: sunxi: avoid redundant column changes for extra OOB
Date: Sat, 17 Oct 2026 13:53:03 -0600
Message-ID: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-14-5af9a1be16ef@gmail.com>
In-Reply-To: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
References: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15.2
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_125319_036159_D6C6BC78 
X-CRM114-Status: GOOD (  15.37  )
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

Extra OOB is the spare-area tail after the last ECC step's protected
user data and parity. The PIO write loop tracks cur_off as an absolute
NAND column, starting at zero in the main-data area. The extra-OOB
helper instead compares it with an offset relative to the OOB start. It
therefore requests a column change even when the last step has already
reached the tail.

Add mtd->writesize to the comparison, as the read helper already does.
The comparison and the column-change command then refer to the same
byte. Keep the command when the cursor differs or is unknown, including
the DMA path, which passes no cursor. No transferred data or OOB layout
changes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index a12ec60c63b4..993e2efcee04 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1655,7 +1655,7 @@ static int sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
 	if (len <= 0)
 		return 0;
 
-	if (!cur_off || *cur_off != offset) {
+	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
 		ret = nand_change_write_column_op(nand, offset + mtd->writesize,
 						  NULL, 0, false);
 		if (ret)

-- 
2.53.0


