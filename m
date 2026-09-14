Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A0BFC88E73
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 21:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=; b=o5bNGecB1tRWOYPPJJjvlAT7y6
	pwNQYXI7moosVV4PEnFWenD0vO8xv4c8AXRqx3SYU6cHaw55yDzGDDw3eWGjO2ZgvE/atTWNxc+av
	0B+FdFOrPEPEmmgLcaxKfAwyzrDw2ffSSZQI84cKqxhV3HCXNr53CnZgsi686vWJDUgQIXunUE/XI
	vUCNgbZUOTcVW+KAWAsVYyfaaVcfzcykuhxEpW3Lg91PWsCe6WGTBmPjnlgS1jXuVmd5qh+LvuGMg
	v1fNDzseWX59+Soet70gFuYW1S10EYXz4AT8JFf0cjnRwsKOA0BKd5KKWVNnmztqkn8eaQ9X6/Gzv
	2jFrQ0Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Dy1-00000004hIt-06BJ;
	Mon, 14 Sep 2026 21:11:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DxN-00000004h57-0z42
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 14 Sep 2026 21:11:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=; b=dWNwRvouRhmjcah3QR55hZ6FkE
	tqnFi7KY5DQ7zZyWi5ydpeUyZmYzTB707cHlap3tEdRZdOnCdL9MNgtyDKwCd2PtDndhQspawX67T
	uZfi/NzNndkYQ3KTVsr7gNLoqZ139gpLty95Zd05bfOGIrFyVZgHnggf4vgt47aYxnK2d05i7aTiH
	2HrnZ2/SMT6cDmEX7TFyyXDggNg+nVj5OJSQDRfN9Lr1AqzE6uxa5o46Fhcl2kdie0k/72apS5DWY
	hTo1yz5npUQnM+uComtbngPkpSkoOtb+JR8ZiTDkrWpuhXLNOQl2etaWVV9zCJKJfQRkMBlwkOwEA
	v20IdKRg==;
Received: from mail-oi2-x11.google.com ([2607:f8b0:4864:32::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6DwR-000000061hM-0Cm4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 21:10:43 +0000
Received: by mail-oi2-x11.google.com with SMTP id 5614622812f47-4b37a2ffee6so1024444b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 14:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420212; x=1790025012; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=;
        b=IvTatltVOCLMWaO1uZtpfX8PMvc8tg8EGklCzszblo1Kjj1MO8uZa82eq43SVfcGLL
         VnYIS+PY1fy5kHLoZO0Watb6076qYT7Vt0B4MyZ+zsL60pHoZAK/mnp4dHaDcV9huqXS
         jRMKSLQDp1IjKR36tejRBcN92gkmucgQv4NP3x4OPxEmmqojqcjK0IqLzDUtONItSsWl
         1rEKZ5Pg++KWmLgI+4/Qxvvp1PO7nUuu8ou4VhbsgqVrapMwzt5A6D8Uv/OlAW75vIKE
         8jZY5Rzzo1pQOpgZayvYMvE6rZN97S4dF30vzzy2S7fijb+MVFEa45LywyLu83jYx+1h
         jl0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420212; x=1790025012;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=;
        b=z5q9m9zAMPSM7BshOOJGVijLqm3VGALOEDNujIQZ6Kvlp9ba1y8TY0/EefN5kAWZZA
         pkXhztTeFkndTtpORseAlEf7g8ZD2OsKqC8I14BGhLutHcl6RK+L2FmbtPrnxgDXQkpZ
         5/uIXRlVNxD0PsQEJqosUTAN+3buM5dQVPKx9iK6IOWm61o/N9MwTSyFj4A5wWW2wHW/
         /Zs274SaquXjaLjxp5y+PGtzou0ziDBUAoI8FjjHvpLT4jmrwZhJfwk4kODDjhlP9z1z
         5+WFT73P8xKm5YoZbh+LeEMO+RkeZSvfTbB5ipkFuagBNlDwXYKoZwN3K4K7FUJW95Tg
         1nEA==
X-Forwarded-Encrypted: i=1; AKwUvBxxD4IcHlJa0419u5ap+VhaGXT/u7nR86OSsQYDKcX9Sgc0uku2YVFtDAAVt/TdRCgrjF5sbTmnIhKIDjNqRjKt@lists.infradead.org
X-Gm-Message-State: AFuF++m9Ln2mEEqEd+LrbmrCRcCjcpHGDxyWyw3Bf0XsEwjB4k7C6OJn
	nufYXmDx8g38+wOJQtgXIFMhqwpqD3s885A3sbWj21O5yirVUz9Z/OyM
X-Gm-Gg: AYBFou2zswoxExyxRQvzluSAMR0tmbCdZoIiFcoLvCQj1e42xQRDfu4ZkXX/CFEMGs6
	SUK+tEANraCBFUbvX0GTS/SMynczJ0eGlY8gwLrE8KRtQCe8q3cgGqnYoIndKl3Ypo2TfHU/+GS
	Gv6fX5/7HoxYRpci/A0M7dlL0zFrUj3BPPljcHu2stMuYmMJnuDqxuQOK8Opt9lAEZpx20ZwCBI
	na8i8Ghx2bcw9WBQP1fyha9f3FkFG8VGOLFBr/9tEonVvL4GqY+nChSe+GG68XfsxLOlkm86RBw
	HYDgLOtCSO3hevfru+/Qqy6HbNTP44sUVQc5kMIMsWdBHvBHmIkktu6WT0YqMhjtzvlZPdUDSyO
	AcmC4Cw23Ook+qN3jjhUwpsb0gTGarHtSXKWgoQr6/PRs+Y2utpjaobT+MHsg2uphsIMddfsZjg
	TOsaDN9PE1HkC/U5tY69wmrsfsAYgb0vKQGbbw+F42Wc9o3/EDdigQvgxvdAMeTZysQH9wF4PUg
	twtg+x/L1NTOyuL4vnpq6UXWajRor5oisJXmHJndxJzFwrTBFO6I5gYFIsNyJAT5cJX8pAo/CT/
	TINYgudQAmBciqPYpwnc2yKqrOVcl7Y16Y0qP0yGfdP/qLYBM9bEggDsSNn35HvrpbQyJ5GdAaU
	Yoo3DLO4d2ULtZYuP2+KsFLpid+jK
X-Received: by 2002:a05:6820:1609:b0:6b9:4557:2722 with SMTP id 006d021491bc7-6c53f252fa7mr2388952eaf.3.1789420211667;
        Mon, 14 Sep 2026 14:10:11 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:10:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:09:58 -0600
Subject: [PATCH v6 12/18] dt-bindings: mtd: sunxi: Add randomized OOB flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-12-2fb084fe0751@gmail.com>
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
In-Reply-To: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_221026_450193_1E0ABCDF 
X-CRM114-Status: GOOD (  13.18  )
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

Allwinner NAND firmware stores the bad block marker through the
controller randomizer. The mainline driver instead compensates the first
two randomized bytes so that the marker remains plain on flash.

On H6 and H616, the firmware also uses a fixed protected user-data
placement while mainline fills the OOB space left after ECC. Add an
opt-in property selecting the firmware's normal-page format for the
configured controller hardware-ECC geometry. This covers the
vendor-specific randomizer, bad block marker representation and protected
user-data placement needed to access BSP-derived images.

The property does not change raw-access semantics. Raw operations still
bypass ECC and randomization and expose physical main and OOB bytes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
index 9d061e2216cb..8ecafc40ddcb 100644
--- a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
@@ -79,6 +79,16 @@ patternProperties:
           minimum: 0
           maximum: 1
 
+      allwinner,randomized-oob:
+        type: boolean
+        description:
+          Select the normal-page format used by Allwinner NAND firmware for
+          the configured controller hardware-ECC geometry. Normal page
+          transfers use the controller randomizer, the bad block marker remains
+          in its data stream instead of being compensated to stay plain on
+          flash, and protected user data uses the controller-specific placement
+          expected by the firmware.
+
     unevaluatedProperties: false
 
 required:

-- 
2.53.0


