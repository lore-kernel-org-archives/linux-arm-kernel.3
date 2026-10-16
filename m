Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A7AFCC6B2D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 04:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2rczNXeActkyUZxhNs2zIIuhfq4VixMAxBK569RVDfs=; b=l/7NWSoANwzrOOUGbiHvXVCbXa
	K+wTi4j9Ir5uKO4ONwI4PAaarU/i/MG+Wknpm0zlgMjTbslP1z5GeM7SRU8qgpfTFogLHEhgaWTN8
	zRJlri6KN1z7nFRkp3Qhnn2rj0dSHOSxGplmRJjeaP5OzoFVcnm4/mFtmDooNVnbr9d3t3XKtLEVE
	4eHLSVQG8cZvWEjVyfDeG5NY6Gy7UbXCV92akvJr8+XNDY1pbA0NNFv+vXhJtn33c7TuwRZiQ7alL
	7BerOTpFmDaUU6lhuV5F0NOpYk5dF/tVliQE9315Rb65DbbpO8hF2upssjFQPuPmaWaGqys0XEHzR
	rYH2pxqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYtT-00000001t73-2XKm;
	Fri, 16 Oct 2026 03:46:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYtH-00000001sh9-3GQ5
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 03:45:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=2rczNXeActkyUZxhNs2zIIuhfq4VixMAxBK569RVDfs=; b=N91SbyOM8T7BrqcPXCNcpWYQV6
	9ap3RlfYtySv6pBgTZ7F8I5evFQAVVPntgJ/cZ/K7LwwLZUs9q5Bu9coWQ/qYt/wjLsJfxOkDe8lP
	VVKIkg356gLhoxSd++2zblAkgRs/mILT/Ff0zzctW5wMdYRkhOK53zDojMcb1/dndxoow0fC/nPNg
	grXCwBTiUzmE/RygoyGUxLua8tyQkAnfwn0bS5sMqmLrPsEBxsUgK6JcUp7DHNGp+8vNI/R77ppkC
	hdAWsXUAetBBgq7TY1DxY4KNkSBAqaE59ZvcyOcDSqxhVJ5L1OnhvYDmzs5D674lXZQevjyifF96o
	pBIFhJNQ==;
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHYtD-00000001488-3faT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 03:45:54 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-824e6e6ed71so2262359a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 20:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792122350; x=1792727150; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2rczNXeActkyUZxhNs2zIIuhfq4VixMAxBK569RVDfs=;
        b=Cj4bZ1O6gnQaJYDhc6O3x7FA8qzF2e+OEQm7kaB+xi16pYS/G57NKaoMLpyWB0WYhW
         cbgiYPX/1pspuHmTeVwhQv/+IlD8I67CU7GBrq+BHZuqca3NYZm1SV+O4dty9jXv5VSi
         yZs3cRJ/kq6xmjmXkfrcMLtguwq36wOkkFkc48X01M1P6jdzvuYv98W3TpcUIy/MrDHN
         LMUvel2eF36Nh73KDWqsfFxOpg58TUS9I41uHFR9dqyAiWH4gLDgcXSGQHr+oVRPH8v1
         iVZE0d8u+Sge3wPO6ZV9oIeTxB4LJrb+DdtnrJZuikSCpS79+C/38jzEVWcqVFoTfzMc
         E2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792122350; x=1792727150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2rczNXeActkyUZxhNs2zIIuhfq4VixMAxBK569RVDfs=;
        b=xfKYm6lPSXveV+s1yLyhJSos66RlC/1B5+rdUOn72Fj+VP3YHz3NGxltmjQi1FDgge
         eyx8Sl8/KAFtPKEk52lCL95JdKFxtqMniFUwHrSJIQsiivRbAo5Q0WeR4s03aMiILd+e
         d7o4huTNWJZedjnUGuyzklFvH7Nn35KlUeIgoWag/QOR8knJfLZ7Vo4ECXDV7RaDVlEZ
         EXOEp449Gowv1UgsM1ajvQvjr5mTUXbuAuf0p8LBmMTcam3l+PY1r5fppZWorqdkvplw
         6Q9sw5SKglEbgv7WaaHEChGgwpxcGHcLbDWU7yDaQ04r4VEIBZlzIkIOgKxijv5/38+H
         o1GA==
X-Forwarded-Encrypted: i=1; AKwUvBxY09oq8a2BRqtxKO+bn4VDxH/SUgfZF2LQgoi6F2liZ+Xj5EPylQ0WkknyAfHKfSUv6QFnWWoVwgZNkgeQYR+E@lists.infradead.org
X-Gm-Message-State: AFq9FYIqA9mRjwD2AMf9eDWKQqrc2fhusKKgrlY2jY6VDj11v3kUs133
	gNh/M6Us3zXwOPwpSwVL+hWgqz7O9MQpHFOIeXGxmUBG1Dhk+yJ6YBiC
X-Gm-Gg: AYBFou0Eu5X6lZ0gYURqPzBCV6eAkt/bcgO4Hq3XtDUJa9Z+kcBft9cHRk2PLt9Kr5I
	HDkc+y6BSXhrrMPp72I/jJU4nyGttuhmcyMfOiZinjYSNU3zaupBSk5On1WDL0n7ZbQvJs2UWza
	OXLMPv1D7G95jVhDF2/Wz7tsrzTf/y5ULHIRQZ2gcqo+6j8Bi9Ou42auTbJUkuStaSFnVW7B2sO
	sL0XC6Lcil1OboSRng4tKNEk6wO1uIesVg3iLhoDVov5I3e8NMgbD+grCxDOY/UX3f6DiHdQWDa
	u/eQcnZvIdUdTTr9gfTP/ZH4BNMGfZIG0m8JfZrsTNAKLvDSAwWuK/5MzHk6TD0yn3Krd0knEtA
	ze/qd4KNNFH3TnmQ0GS4j7AD4QM3zBQepyNc2KUu/dSGePOChRznyWVwjeJnhL4KslDMMQwp+pf
	EITE4QGxx544+kiXxk69r7pvg6EVxpnRbTlYFaP05hfZIM8gHnIMx2O4V83pyAiOit98IkLQUwx
	t3Oic6MXUMZb27ZmjWjI2ykUw4qoHrS/hFxgOdA+YY3JoCvDoSb07No+/fO3BqLzcUftX1Hh3ow
	yo03WEYt+qv6kCTcLvFWt4za2YF57Qgf/R5cOJ4/zDsXUmPnGN4eUeIrik45x6PPvqWPKazeHKx
	G5REwTHCjKn0j8qo7EpOjqA==
X-Received: by 2002:a05:6830:640d:b0:804:ca33:4aff with SMTP id 46e09a7af769-83094e783f6mr19887903a34.9.1792122350229;
        Thu, 15 Oct 2026 20:45:50 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm834402a34.0.2026.10.15.20.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:45:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 21:45:28 -0600
Subject: [PATCH v8 13/17] mtd: rawnand: sunxi: avoid redundant column
 changes for extra OOB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-13-8ba4881fbee8@gmail.com>
References: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
In-Reply-To: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_044552_375395_808612DE 
X-CRM114-Status: GOOD (  16.74  )
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
index 105374e93b37..dfb2a64c6b50 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1620,7 +1620,7 @@ static int sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
 	if (len <= 0)
 		return 0;
 
-	if (!cur_off || *cur_off != offset) {
+	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
 		ret = nand_change_write_column_op(nand, offset + mtd->writesize,
 						  NULL, 0, false);
 		if (ret)

-- 
2.53.0


