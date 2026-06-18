Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA99CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 14:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WFQnNTOYhtvDC41BGM0bxTP54ugtmHtJK1nGpmbfAd8=; b=xxbImDOSv3Dxr3pmV4NekPkehp
	W8pbcJ6qhscvlNTktsRZuI8xr2Xg5+aHUz3mNv7ufXi6vVHStCB9zfLQSfw1CeD6oAR7KbJo1F9zy
	zSrslrxTgiX2FlquW82wUYKyuehLc6XrxLgsmQslzlOYRpcR3ibLk1QxN9P2rwhQ+oUK4u4G7jmgD
	amrytv9JGyleIIQlpbt+IttdtPccBa9/P8Wu2QiSslVLUFro9U2AIPAioInWRuFEBkjsVKPVx2rdc
	vtqF24A+SNVNFuRV4KLUTfZEQLb3FdzUem7UWqATNyfSYFsi0H2ESrInNQln2Q5KzJJemw+JFGND0
	UcYT9o9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waDNC-00000001PIf-3hZL;
	Thu, 18 Jun 2026 14:05:38 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waDNA-00000001PIF-16T2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 14:05:37 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-36d98b68d68so565620a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 07:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781791535; x=1782396335; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WFQnNTOYhtvDC41BGM0bxTP54ugtmHtJK1nGpmbfAd8=;
        b=IXCS/fSqFwu5mIolPdbIzbtcgIrMmDXLHAcQpIhqh4yNTp3go+D3Z8wsgzBo9sHwTK
         puKUEZ5EZRkl6QTzDBsVek6tcBhH8m0FtnJ95SI930874nXpC5Qn/bDn0vi3Gl+rZnXW
         ZYfhLpnossJi+gJ84tcGByoWyzpBu7xutAaOh8YDb2mfK+sItToIDhEFeyEkGIh9ZzlT
         DCW9byJkv99zP6MX0wReo8HG6K2lWFOnzQrKM85Cx8J028xH/nmVjFaVra/Em5hUVtW9
         feWkPcSDfn7k/wSHoTDz3sMgr2wSwvDSyY4gBHKCfh4RaDBCHVsfsn+JP1YVsZDkGQri
         MyfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781791535; x=1782396335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WFQnNTOYhtvDC41BGM0bxTP54ugtmHtJK1nGpmbfAd8=;
        b=cjBYk275md7Zqfw3zBsLWfI7f6cg9LK3o1aqrnpc3qkrc1APm3VVbSXSXLdbxESB9g
         BduG7KKV1yqyy66l0YKyQSgbEptOnB2ul2ek0qgNiAPvzHtCghNg7zbY1qn6mD0ylymn
         rWYSRT3rAAvZDYLC3+TDwa1eZT0OgZsF1rEYrMPzg/EOUQSmRBLP79RnqUWZNK/6blFG
         ZA3QE5Kk50/VHHsu+buGtLHVAsPN1YksnPhFIGqYjmcviHm6EhzfJOBFKwXztFTvDE/g
         lzZLk1YMYBfdjedlJzdWL/S42uw+uD78J/VTgWGSBdclFu6Cvcpg5xbKkqmYKlK3DMpc
         mj9Q==
X-Forwarded-Encrypted: i=1; AFNElJ8NmHxsrVqDOvm8E3Y/dUbyjiGIEOJXlS3vtFBx12s189LkuTi77WarLZKrXRkuras+c/g/t8MJYpto3g9j8S8X@lists.infradead.org
X-Gm-Message-State: AOJu0YzJQZj9UoqMjVAgoJjx3vrRGMRp2aCUV2FCiW0v8tPuhnjWRhyn
	7Bt0fNaLeDalj4O8fJ3RTecZIFifmbdOBuTKdO8gpKKsxU/I8iD6a58h
X-Gm-Gg: AfdE7cl13Ij4+EI++Ye5mhDU850jO6+KgXDTYwSrfFtG/dNCN14JiPfSoYsMU8r/fJ5
	hDx1NWGlWgPQkpUvrUHfRisiZHgIcLuhZtqGXwGzGWO23kgEMgSjol2oaU4d1GRaYH8aalrxvoU
	xbTEDCh7FKHkW+bftD3k0SwtcgcwClPrfSNtVqxVmPitBAFDQvbzIUaBDd3FGGD6bWWiqQsBiI7
	6zBrnazBs3yWeiBFFw2QT57xU7zbhBWdPobmB4LPze0fsCd8W1yRleso6fnXnskzHixRs9fl6Sk
	DVQcTFNrfqR9MYujYZnIGW0yBtb+etl+s1CnhfAA6xDTEul5nXksuIYvMtJpnxIGuXzy1SbT101
	9B3SM23KuWS7zxwn6V5gtDwrheUMoyX4dommaci5SYVyueQQeU2Hd0xbx80j2/4NoXwsjhGszeJ
	l4l7sUEmjLYs+Qhi8Z7LysI0E9V/Dv9XgnP3uyK2JNyA==
X-Received: by 2002:a17:90b:28c4:b0:37c:b248:1a58 with SMTP id 98e67ed59e1d1-37ce48fcc3bmr3902993a91.24.1781791535352;
        Thu, 18 Jun 2026 07:05:35 -0700 (PDT)
Received: from steellegend.taila75641.ts.net ([2409:40c4:35e:20d7:2ccf:7534:4b88:ba43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c521ca980sm9961202a91.6.2026.06.18.07.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 07:05:34 -0700 (PDT)
From: Uday Khare <udaykhare77@gmail.com>
To: wens@kernel.org,
	andi.shyti@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Uday Khare <udaykhare77@gmail.com>
Subject: [PATCH v2] i2c: sun6i-p2wi: Fix device node reference leak in p2wi_probe
Date: Thu, 18 Jun 2026 19:35:25 +0530
Message-ID: <20260618140525.11526-1-udaykhare77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617194522.114984-1-udaykhare77@gmail.com>
References: <20260617194522.114984-1-udaykhare77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_070536_326344_BCB39B70 
X-CRM114-Status: GOOD (  15.00  )
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

In p2wi_probe(), the device node reference obtained via
of_get_next_available_child() is stored in childnp. This reference is
never released, causing a device node reference leak.

Fix this by declaring childnp with the __free(device_node) cleanup
attribute, which automatically releases the device node reference
when childnp goes out of scope.

Fixes: 3e833490fae5 ("i2c: sunxi: add P2WI (Push/Pull 2 Wire Interface) controller support")
Signed-off-by: Uday Khare <udaykhare77@gmail.com>
---
v2:
- Use __free(device_node) and include <linux/cleanup.h> to automate the device
  node reference cleanup instead of manually calling of_node_put() on error and
  success paths (suggested by Chen-Yu Tsai).

 drivers/i2c/busses/i2c-sun6i-p2wi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c-sun6i-p2wi.c
index dffbe776a195..8469a0ea98d7 100644
--- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
+++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
@@ -21,6 +21,7 @@
  * PMIC).
  *
  */
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/i2c.h>
 #include <linux/io.h>
@@ -184,7 +185,6 @@ static int p2wi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct device_node *childnp;
 	unsigned long parent_clk_freq;
 	u32 clk_freq = I2C_MAX_STANDARD_MODE_FREQ;
 	struct p2wi *p2wi;
@@ -217,7 +217,9 @@ static int p2wi_probe(struct platform_device *pdev)
 	 * In this case the target_addr is set to -1 and won't be checked when
 	 * launching a P2WI transfer.
 	 */
-	childnp = of_get_next_available_child(np, NULL);
+	struct device_node *childnp __free(device_node) =
+		of_get_next_available_child(np, NULL);
+
 	if (childnp) {
 		ret = of_property_read_u32(childnp, "reg", &target_addr);
 		if (ret)
-- 
2.54.0


