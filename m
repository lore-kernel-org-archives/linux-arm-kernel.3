Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFA7C88E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 15:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RmWPw9HQP1XagMM9TGKgOpF0w9bX79g0MmpHkabvFyc=; b=eWN3+sh/vp/xmO3OX01sEipfTr
	/QWPCzN+mZqkHzTpbWtpYYNpMkroYnHZO9n5ZkfYS1Q5jEH2K54OrXOK5j8fkAhULAKDdLru7Aw9C
	+A1MqehOBv5R+tS5Y5Zhha3cFBlSBYnF/oISOKtY4Tq69bhXmiyu2tb/W7h2Vh9BIPrtY9+lN0FAh
	Vlgp4qYywTozr7V5uxVcN0sAZ256DBKAlUlbqPYuj9DFHbVbWga3g8f984+pXXv8RbmuVJ1ZVE5jA
	T8qAiGjk/8BPvR2hutSjTBpGT2D5OWLJ+5DyecfhJnv0PLpzIfyFE1HPLSIxaLsIz1AVpQKCBxeEx
	4xDrgIEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53Ro-0000000H7fZ-3bPb;
	Fri, 11 Sep 2026 15:45:52 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53Rj-0000000H7eC-23Ei
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 15:45:48 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d8fb334ddcso9797595ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 08:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789141546; x=1789746346; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RmWPw9HQP1XagMM9TGKgOpF0w9bX79g0MmpHkabvFyc=;
        b=smV/VPDPOPC4OR3L19fDKJqOUsNx9sOvoTRGZFK37QutQGbUFdHLCfl2lD3AIyU0l7
         PqLCjBb+yVB3D+humwfPPnwzVGDopz5a0aUhGFf66Fe2apFxm5KI9Iab/MfU90gzND3k
         0D+uQ8R7zrrunCiUzBm5c/RGqeIB8ly9vmSedxwQ5Dz+xcxNBiuwDnHAuAbtGZTaINI0
         bPh3yzUibwDy9YHDE5a/64C499RH0fMhUpLMIPvDLGr6ep99HHuREMlNLX9djQKv9kAB
         IBnJVVYjYgM+oPqfWV51wbNdOAbj5XMa7UbYEKrrPnYaepYuL4pFiceVTUvYPNUoQuij
         sfLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141546; x=1789746346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RmWPw9HQP1XagMM9TGKgOpF0w9bX79g0MmpHkabvFyc=;
        b=FePqOd1ZBHt82Q1lHLaO/w0CeLQxsUEjvAmTKWgv53xf1A7q46KSVoGcVBwHhQzqFX
         WmSQLqiqzBnLkpmNzWGpz32CIQ1ltVG/x+EfQnHwkrgEM1bVmU0i6LR+bCSTAdcYoTVI
         7fzfK0qes9mjHsrVMdRv1FsP5XenrICPL4g5dNGfe5ZGIrMs4ctDQ7PUx8TKzf+tLzzT
         Ga5sGNBh07tD9rUsPFPAoM/ewaJzpC7lgeTXUHSGDPMBGEAumFTmF1aL7safIjzX9B8d
         HzRDHSj/Y+B+KVn20LvmVWjZ1VyUNOYSGFZVIUDi0UO29CCABJu0G/EVcm+GPK4IPgu2
         KWFA==
X-Forwarded-Encrypted: i=1; AKwUvBx1VAr6MUZuV8OziagZ+mFdCaNvG491yQAVup8idfht8C/T/zkcFyb+fTBl4vQ8nx2fuEz6/nXvNGi1YuEuCa5M@lists.infradead.org
X-Gm-Message-State: AFuF++lQWJf9MYS8D8QQ1SR82+fLK6Q4Wvyfq13Ua1UBriGjCjuHc2/H
	VNRKCdhrTJVvT0NJYGvNXZIBIks5EC3A0ctjdegP7f263R/SJEq/eFH2
X-Gm-Gg: AYBFou3nzam+DCYCEtsLuHsP5uNMDmz9YTGIJc2qpCPosnt0m1e5jWyyseAqFkudeR5
	34yJ63BtdXn6pTFJ1y8H7IXnn/yzsqBjalLMItar5csB8OjXPV6hQgVZOP7bAcsP/Bh050ZZdI9
	ysSHZmQ0cVeZTXyN5ltsxzn5XnMrV4W98H3/kslWt5tN+RVJHR5/u64arcjdRmJJjenYU9LabGc
	D+ykwawK39p7JsbBM9ZA2Hk/CDBd2GSioqFnYoYPjRKfxm26UFKyrA1iIx+PNCQ39st7ymo+0Od
	IlvPuYjcYj496SSjqfQUX/qSCM0RxxarHxMUCSqbXPDXEslkxDgRm6nblv3Lr4Dz9HOWX7/4x9E
	QDCETWLnebRfsXfj4x0W+1HNktMpDpwNJ9ACXKrWJY1rY2MIRRXSqmP72KbKU7zk27VAhLU2BG+
	UadkexRKInUrpkPtTnWwzTYWniil3fhTxNWXYeMu4rvL2bjsqcW4b+uE6bz0g1brs4OxEB5Q+s+
	3vKe0nt
X-Received: by 2002:a17:902:f60d:b0:2db:5c0a:f184 with SMTP id d9443c01a7336-2dd2a34fd91mr100447505ad.17.1789141545988;
        Fri, 11 Sep 2026 08:45:45 -0700 (PDT)
Received: from arch.localdomain ([158.101.31.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfc2d3bsm13628145ad.48.2026.09.11.08.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:45:45 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH] drm/bridge: analogix_dp: use devm_phy_optional_get() for the DP PHY
Date: Fri, 11 Sep 2026 23:45:33 +0800
Message-ID: <20260911154535.266121-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_084547_525058_231EEB1C 
X-CRM114-Status: GOOD (  13.74  )
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

The DP PHY is optional: the Rockchip RK3399 eDP controller (used as the
internal eDP port) has no separate PHY device and relies on its built-in
PHY, which is programmed directly through the GRF registers, so its DT
node carries no "phys"/"phy-names" property.

Requesting the PHY with devm_phy_get() therefore returns -ENODEV (or
-ENOSYS when CONFIG_GENERIC_PHY is disabled) and the driver logs a
misleading "no DP phy configured" error at probe time before falling back
to a NULL phy.

Use devm_phy_optional_get() instead, which returns NULL when the PHY is
absent and otherwise behaves identically, and drop the manual -ENODEV/
-ENOSYS handling. This also removes the spurious error message.

Assisted-by: Claude:deepseek-v4-flash
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 .../gpu/drm/bridge/analogix/analogix_dp_core.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 18e76d1e78e1..28eb668d3e3f 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1427,21 +1427,9 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 	if (ret)
 		return ERR_PTR(ret);
 
-	dp->phy = devm_phy_get(dp->dev, "dp");
-	if (IS_ERR(dp->phy)) {
-		dev_err(dp->dev, "no DP phy configured\n");
-		ret = PTR_ERR(dp->phy);
-		if (ret) {
-			/*
-			 * phy itself is not enabled, so we can move forward
-			 * assigning NULL to phy pointer.
-			 */
-			if (ret == -ENOSYS || ret == -ENODEV)
-				dp->phy = NULL;
-			else
-				return ERR_PTR(ret);
-		}
-	}
+	dp->phy = devm_phy_optional_get(dp->dev, "dp");
+	if (IS_ERR(dp->phy))
+		return ERR_CAST(dp->phy);
 
 	dp->clock = devm_clk_get(&pdev->dev, "dp");
 	if (IS_ERR(dp->clock)) {
-- 
2.55.0


