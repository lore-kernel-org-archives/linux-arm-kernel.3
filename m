Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41C4CDB470
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 06:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/VaPoWI6eKXUMMpNd+FGpSI6D9zOLXi9bfeJRqIdo4I=; b=rUyOIbsPgn9hafjweDCBhwT5WI
	pk5nYHn1CH37UfKtBo5yJndXekym7rnNZ601OyhJHs+2jsHsVY1ChhNaZBZQO0enVY5JymrB95LOx
	uMVj7Fcgu0BtD0cbyCvd28BAvvy+hrefxSFmYcU/TrygEYaDrdeCuABgmtsghiVh2quDUvUcV7Tdd
	AOlkoOEO0/A9vG+G4wzeQ6Hw3tsnFdwmM/ZnUrVxAcdYcNJ7wRqDIdAN8e35IEqzxDVgk9Gpz38nv
	tDz9rzhkOHzVJB/BOeV3TIHwOwOpVH3S5oMNnQT0Ssh+2qPbNngLZCgd2ZgXVYcxw8iwSG57dBs9p
	cFZgAETA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcH25-00000007Dyv-3dcQ;
	Wed, 24 Jun 2026 06:24:21 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcH22-00000007DyF-2C5h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 06:24:20 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2c6d31bfc8aso3856485ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 23:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782282257; x=1782887057; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/VaPoWI6eKXUMMpNd+FGpSI6D9zOLXi9bfeJRqIdo4I=;
        b=Ry02xBx3x7/tnpXBe2byvYaGMNUKd0DsMSeZ8TZYQGHU3cQuauCl38DncOdD+NGAPi
         t5/cV3Nt8xiSKg+P+3uvf1u+Nb0klIHqVXXeOBiTSePSfD9VvCy5pupsu0e3H1NwZ8hi
         xWx8IdXdVI5KcWwiy+DW93EpjHEFIb5avQwEWwn7QImr7JjXCzlq0CSEyFHEYjau9h0o
         UARuMN2VuEPyRlWIJ484CQE2owav9RjsI2CTNp4AFBCg4mKkgNPi67Lm63RH8yVoG8Qe
         QApD5I+0USJn7VcPWQ+NvrQUq/v9hlT1Ru84ua0Lb5UiA20ihLxabh7/InyrC12+CunQ
         TeKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782282257; x=1782887057;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/VaPoWI6eKXUMMpNd+FGpSI6D9zOLXi9bfeJRqIdo4I=;
        b=fzrmXi12/DGC0q4KpYVJgOrNy9bDdOQi77GcLnOq0a2XYNzq96OqqM+ETW+Tn5LuUy
         AiOPNxX1IlaazW/yMsb7dgxQAAF5uViYj0wR+TC3mPfNGelqyO8mgCJCr5rKZwVFpH2w
         /SRKBZ8RmiqFnZe0bC1VL/+Acva2I4LnxoXYfPoZDqJRk08RPKr+2IDt4v5gtVjhyhSm
         wVJLEzE4l59yTTOIhFW6fsM6AkYIgjlg/URs6PR/7Ckuyb77782vMgDcxx5o+76BQUiA
         tRh2sqwPcbLbJP57SVLvJ0ZmUZPfeopogt1MpOfXQ/53YjXmGG9E+KEOkVV10+Fo6eaD
         X27w==
X-Forwarded-Encrypted: i=1; AHgh+RoH7CxJm5UcNKGMpCqdg7l+s2irdHCNdjHIazhIm7T7lNK/OXhUDu8F8gfHmt2xmBOfVVJH3Hhw7DoN70jK4z8A@lists.infradead.org
X-Gm-Message-State: AOJu0Ywwm6X0pMTwmP7ymUe34eTg9MDKbdQ+dcBcPSq01dxCPxKtkKMP
	iL8bluaGhiyAPAiEEm5ONZhzbydg56aahr2Nn6gYy9zhzjvzZ7BPZ+M=
X-Gm-Gg: AfdE7cnop9+suoJx1Tz3SCpuAtopj6ZLfqqqIjt/pztH9aDDLuw0Xw9TqLIAPYh5b7g
	1NaDqKNIwfRT5MB5X8KIKr/keGJTPZik3sIkbpkWDdrVY0/93nFfymC595dznx0y9CiTNNzT1uM
	pUIPWCM7axPXvpI80OSs0APmI4GU6XX9k5dxWt0RKrqVq0OxMcJCkm4rGHTA1WDNLpVIwj/dPq/
	qDpetoE6UhBoN7V681Xr//DJaBjoB8Ahhn183pBXTCPXTL9ZwrvCV8/eKDrOHeWImeY8O5cB+0t
	vAqVX1rUsK0GNuzG/aid28oUHwTYezu/LuNWwWnPzFFXRsOqa4hwZF1u2XKevIwppjTuXCfTP7R
	gRVC5FEUxWnjcyNZFTnoadV8ixDQOnJRqvZhJPb8NzxMmqxzXWWcovJYLWysmKrWpaJh5s7xeKe
	YIxpkKJliRwthw5bzZrzRvL47ds2/bbeynw2qaOO1K8Z182YXw0fDo3n6ewmCpV9rh
X-Received: by 2002:a17:902:cf10:b0:2c6:95d1:3bbc with SMTP id d9443c01a7336-2c7e157bf30mr22540055ad.24.1782282257477;
        Tue, 23 Jun 2026 23:24:17 -0700 (PDT)
Received: from localhost.localdomain ([14.5.152.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436af54dsm126042875ad.11.2026.06.23.23.24.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 23 Jun 2026 23:24:16 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Yassine Oudjana <y.oudjana@protonmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2] clk: mediatek: mt6735: Unregister PLLs on probe failure
Date: Wed, 24 Jun 2026 15:23:55 +0900
Message-ID: <20260624062409.45678-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_232419_598975_5709C085 
X-CRM114-Status: GOOD (  15.05  )
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

mtk_clk_register_plls() registers the apmixedsys PLL clocks manually, while
clk_mt6735_apmixed_remove() unregisters them on driver removal.

If devm_of_clk_add_hw_provider() fails after the PLL registration succeeds,
probe returns the error directly and the remove callback is not run. This
leaves the registered PLL clocks behind on the probe failure path.

Unregister the PLLs in that failure branch before returning the error.

Fixes: 43c04ed79189 ("clk: mediatek: Add drivers for MediaTek MT6735 main clock and reset drivers")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

---
Changes in v2:
- Unregister PLLs directly in the provider-registration failure branch.
- Wrap the commit message line flagged by checkpatch.

 drivers/clk/mediatek/clk-mt6735-apmixedsys.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt6735-apmixedsys.c b/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
index 9e30c089a2..69d9ce1210 100644
--- a/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
@@ -102,9 +102,12 @@ static int clk_mt6735_apmixed_probe(struct platform_device *pdev)
 
 	ret = devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_onecell_get,
 					  clk_data);
-	if (ret)
+	if (ret) {
 		dev_err(&pdev->dev,
 			"Failed to register clock provider: %d\n", ret);
+		mtk_clk_unregister_plls(apmixedsys_plls, ARRAY_SIZE(apmixedsys_plls),
+					clk_data);
+	}
 
 	return ret;
 }
-- 
2.47.1

