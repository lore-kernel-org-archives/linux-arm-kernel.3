Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 468C0C79FB8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 08:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wvg8aSvAJDl+PROcGB7AxVuyh80XuZxIbfxWbHKxpV8=; b=J71Ayz8W6LqkEvHdH96Mq8bJjm
	ec/kmfv3W7MeJ2KQPOEuZsTi53z9cOemPHKlw7H616VyW0r8NZbLU10HpRZ3cFyPZwg3JpimGrjCE
	GkIU7qanQ7CWUP6hV2dht+GK8hOaWt6i91E/ShBVhIq0P4MJ+ABxDHmcmDjrdTon0/WdYhLvZMlxq
	qV515xzLslHw+pRm0q8O7R9ZhrB8dZp+RK8jA7bIIeljvKOGWHTZwKw68cTlty2M8H7yd/nQDJJUI
	pNGNucrgM6WYRcIe4u+z3VENcawUoT7A89/Vo7Xbvl6+Kx0K3r66xvQpmskLhPXh+2FNwur8qHT9n
	tAykOqMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Did-0000000B6v4-1V7j;
	Wed, 09 Sep 2026 08:31:50 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Dhu-0000000B6LV-014p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 08:31:04 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-801b48c329eso140408a34.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 01:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942661; x=1789547461; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wvg8aSvAJDl+PROcGB7AxVuyh80XuZxIbfxWbHKxpV8=;
        b=BIJ5E40E+K8kHXNk4mqSVTHOjrjKp4Et1gv+vA4QhhXQ0imNtJODcRcABxSmeQzGvP
         TVBkohpPK3a18siRwabTEt5zdzf3ljkTpdsSzDzveUhjiZz0af1MG8Bww2rAX72GhqM2
         bbCH7YIRhncGGgD/m/XUAHQKMdgy6S/MB7yxLjwo51UIutUxEiVfwUtuSOoYHf43dmk3
         bO1qpSA4FFad6QA/oNrNMTENxszUvf7RnS2Pt5GXjNM1sd+6w/u02orpdQXtwfFXtwu4
         oQ+H/5TJAOv8EI6naHiSBYCJH5qrJFtzZ1pHIShijRXXvHY/SGPk7F8+7bIre/yqqAp+
         MU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942661; x=1789547461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wvg8aSvAJDl+PROcGB7AxVuyh80XuZxIbfxWbHKxpV8=;
        b=lTHPE6wUe0jyFiP9ZZj4mRZ/qA2Xd1tJFNmWzVJJD/VG4anFEzvdDRIrl8i5LtatXL
         Poi/29pC+hO5iVxgM9fM14RhR+9yPv6Z8lvUuVDI/mT3MTzZUgJu82UrbnNZslfv2yeW
         09zq3SXeLrOjhLUtLXN9tziX2kbtkDmK+6UumgtPewhSh6eyoFf4Kqs1ED9qJbNW6F4q
         MwEO0EzHYqvSqye16W9AArF/n3ordbVRjGx4UPcIhAXOy3xRY533HvV2MjOgm44G4W+v
         4nsXX0J3Cvdiv74ePN5Nf2cmneKsptB5Mk15PpyLWYCsUHc61svqaY6yEJrU0ScdpPXN
         vgzA==
X-Forwarded-Encrypted: i=1; AKwUvBw4WTJ5oL4mm4jpk6umOpbgFb6IuLlTUC2Ps1iP+bGtNTGCnjL2cCTUfbTdIbj3Twq/WGhi6KHH/YswlyYoephU@lists.infradead.org
X-Gm-Message-State: AFuF++m9e5RLt7NIx9sLGhdUCJh6Llkn+D6B7bv95xEx+SciPDrdyDIg
	afj/zqwZakQpK9o3mVPvkztBomJ9zdx2nsy94Jc1cekQ30wRo15DI7rv
X-Gm-Gg: AYBFou0MVQo8j/8yO3lsEhItpsxluKB8W2tb8gjELxk9WyFlcLos+5g225reHkgRDLZ
	kg7kw22MGTn+m2zpA1ri3ruJs+sCoE3IHsvGOfkWk9+gOpGKwLSpaYDNB6dThRnRIECTOMJA0o+
	XvCr5Dpk8Mg+Ef6P0vfLaGpHvNjpuGjNX3f5OuF/LAAeaj19CUNR2gxm38cdxPMuOpv0s0UB0pn
	6lRUNms+VIZIqszZYIzfoZljJU5MgE/KgLhrmB2goyRJYlWVyMSHJlzANN939s6dcTCtVdd9NEw
	32AXOPKaXBODaBqclY/qlLcNKtoG7IcJok+mKk1em39Pm+UV1ImXa8EfLrwpWrjxQF8xidJpJpB
	euSnHT17z0czS+aYinqQol+9Ag4///D1Js0HjTyCdY5bgoclJjd9GrV9N4BfYILcFLNcn7b/J22
	e6SBiPgcwt++oh1WfKOtw9BGbiu7O6SO/LbxPDg2i9CbxCdiQsQO5xKwULMk95Qdg/BeE91O2+R
	aPByQ9cF0WnRtJh8KGbyZwh9z7q8ZsojONKkzuMzGifnuwxJaQrELhjf/CMgQG5xTrkD7XSb6aV
	c+s5M0oUcgoZ1up84ZO/ZIlLa/7CaltMwii5HhW2CwV8SHFIrv/Z364pKvx0lJ+lmk4HIVdyDR5
	ywPTrdJrZqOnFLgWoXio29NdIbrr0
X-Received: by 2002:a05:6820:1613:b0:6aa:da04:b56f with SMTP id 006d021491bc7-6b6fa7e183amr19522399eaf.3.1788942660818;
        Wed, 09 Sep 2026 01:31:00 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:31:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 02:30:39 -0600
Subject: [PATCH v3 06/15] mtd: rawnand: sunxi: avoid a second program
 confirm for OOB writes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-6-838cb0ba1547@gmail.com>
References: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
In-Reply-To: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
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
X-CRM114-CacheID: sfid-20260909_013102_373073_7050F186 
X-CRM114-Status: GOOD (  14.32  )
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

The hardware-ECC OOB writer delegates to the page writer, which already
issues PAGEPROG, waits for completion and checks the NAND status. The OOB
wrapper then calls nand_prog_page_end_op() again, sending an extra program
confirm without a corresponding program setup. An error on this redundant
operation is returned even though the page writer has already succeeded.

Return the page writer's result directly. This leaves both PIO and DMA
responsible for completing their own program operation and preserves their
error results, including for bad-block-marker writes.

Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 7081df77f63e..545da54b8908 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1831,15 +1831,10 @@ static int sunxi_nfc_hw_ecc_write_oob(struct nand_chip *nand, int page)
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	u8 *buf = nand_get_data_buf(nand);
-	int ret;
 
 	memset(buf, 0xff, mtd->writesize);
-	ret = nand->ecc.write_page(nand, buf, 1, page);
-	if (ret)
-		return ret;
 
-	/* Send command to program the OOB data */
-	return nand_prog_page_end_op(nand);
+	return nand->ecc.write_page(nand, buf, 1, page);
 }
 
 static const struct sunxi_nfc_timings sun4i_a10_nfc_timings = {

-- 
2.53.0


