Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0678C55179
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 14:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iWp6MzQC1qDygJL4OCtM1qnllOHL0djYegVbWv/i/KI=; b=UN8HS2cbiaUJtAte8LpO6jw8Ez
	aZK0uVZacrpIEloIWxFkFC540ycSoKLqS1rPOSKsfQ5Ytag42q+Nqj5h1AjX+l4qORfZYUd/a0JyP
	9kZwJOUki34gGzbZLvMe6XokgWlK9sFxira4S+CjGrx5SCFrmCWgN2DrdTTnATnPsO2EwMCR44FHG
	UYhFTZN/kORY346FUts4mclHOsHQKLELnPCq1eaRbZyjRj8SY/+Mzpb72h1MqxMr+pJvG8+MJFfcW
	Pi2N3rpWCtqx+EGHh4dm75MjQMNCEOlJ6HW3RMZMsdqDy5nQVPpThm5JBcCs7j0yLHKIgKRCGYmvN
	yXN9wUFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtUG-0000000HJxS-0x3m;
	Mon, 03 Aug 2026 14:17:52 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtUE-0000000HJuO-0Gwf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 14:17:51 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-38e58034d05so3406566a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 07:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766669; x=1786371469; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iWp6MzQC1qDygJL4OCtM1qnllOHL0djYegVbWv/i/KI=;
        b=jV+gnxiXGQyJ5X0WFyt53VfwxGsQ9H9B2nXALUWgTLI7OLKC8Pi7WzTf2vEb/jG51H
         1bb6ehis1e323Y7X3FKxkw8na2ezXl21/3tMh7DmWy855im0aYBAMmNUtEtW4Pdw0GYb
         2M3kH//HAOgFiWN2N0VIzhIASDfSUKeLFK+IHt0qUPI6q3VmUp+tERlH0eHo85gh9vm9
         5Xcje+VkR3DvKxTDhFpzpT8KCaRRLMoiEBPi2wrxPJ3h+irp2+PfbQ9WprdCc+v9wuz3
         8uW48RGxyg9/2TdH9j0FwQh/8PCOtumGByD51iDqUCBPs4QmW3Ub+NbAgEC+deMz4M3v
         L1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766669; x=1786371469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iWp6MzQC1qDygJL4OCtM1qnllOHL0djYegVbWv/i/KI=;
        b=Fd4q3TwhUEJ3UYfWabpskcR9/jwvCz07xLZ3uvOIS3dn/LWyk89+s9XhMqInNIVFcJ
         o7qUbce3kNc+rWYA9xufql7T/2qe1WAaqaS4m9ZCxVY0Kfp12CyckgedW+BKvggKZuvG
         ngCE4SV1O6JZs/P5Pawww40+1eio7GyUajZ8U1PVfCrvh0Z60GvM3t28nRGXlPzRN/+2
         3e3RCag1RcNMpdx+yxey7q0h1O+n/0M5eQmhaBR950+48apUe/P1HLlrdUBAKmyp7C/v
         KkDQV967avl9m1sSncBHrTgRv1WHSOBdmb+NR1Spz6zxSRH2PtClbr16UDTwhPkH0OTw
         iwLg==
X-Forwarded-Encrypted: i=1; AHgh+Rqap8IGkCdMAC7qFErUAaYraIab66dMNwiye0kOyau0FR4BhxwIVFxzlSokkG5czHqo0UI4j7KfOftcLl4dDxLH@lists.infradead.org
X-Gm-Message-State: AOJu0YwEYYdQuKNKyor2hCN7014/HaQlF6VPKNPq2KDnxxDFBPT36FVB
	LbxYavt9xR02k/xPO4m7ro8MHod6SwLy+vA7u5r24a2q+pA2z8xzOxTD
X-Gm-Gg: AR+sD11dzLAx3dZ8itlDJGlamoVmkeKeY45F1jC5o5G8Dg8rhS3qxAYBYRddKLJntro
	mhm+bf+dcF3YRDitjvWRZJLY+ONmySgIaPbwrb2AfOK+vPRLWgQNUk6s7B3d81TOimamUtBkoiD
	PjGG0HygjLwrM/zOY4/4GkuDEsqM2hpc6FDJp74F7uXFwFlMduKfgdKwRweflRCyKcAsN+jxn3t
	CYYpkRWOD/vQuiKvx8C7Li2o5UHzpm2H5WsqWFcq7FbX+aeAeZhGBwHpEc4J1fg0/N2AgXDGdjF
	jRzu8dpGmCc2KDyr9Y7+wH/MHEDeR1+nPX3x7juhXUUty9EPlx5rtCQu9EwKosqYRJG7OqPxILe
	sXapgEqMy6nNwqG7Apra4EqGRz4J1GGjN4bCV9aDYSTqiCvyPQ7GNtqSdBXA6yOyz7+jxxZjJ/B
	dYztU67NYKnFWAgQuGEZ3d7Ri68bGZwT+GOqEcf6Gj4sku3Ck9aGM8Dmf8pyF1AAvlkyIlG6Crs
	Pyf+HdsajaCbCREwKy0
X-Received: by 2002:a17:90b:528c:b0:37f:9ce1:7364 with SMTP id 98e67ed59e1d1-38fbc4d5e09mr9059524a91.26.1785766669331;
        Mon, 03 Aug 2026 07:17:49 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:17:49 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Kees Cook <kees@kernel.org>,
	Miles Chen <miles.chen@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Sam Shih <sam.shih@mediatek.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	netdev@vger.kernel.org (open list:PTP HARDWARE CLOCK SUPPORT:Keyword:(?:\b|_)ptp(?:\b|_)),
	stable@vger.kernel.org
Subject: [PATCH 05/32] clk: mediatek: mt8173: fix memory leak on module removal
Date: Mon,  3 Aug 2026 23:16:32 +0900
Message-ID: <20260803141659.559129-6-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_071750_114399_6E52B83A 
X-CRM114-Status: GOOD (  12.33  )
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

clk-mt8173-apmixedsys.c and clk-mt8173-infracfg.c do not call
platform_set_drvdata() during their driver probe callback,
but their remove callback calls platform_get_drvdata().
This results in platform_get_drvdata() returning NULL,
which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
This leaves clk_data unreleased, causing a memory leak.

Fix this by calling platform_set_drvdata() during probe.

Fixes: 4c02c9af3cb9 ("clk: mediatek: mt8173: Break down clock drivers and allow module build")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 2 ++
 drivers/clk/mediatek/clk-mt8173-infracfg.c   | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
index d7d416172ab3..65dc4489a09c 100644
--- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
@@ -179,6 +179,8 @@ static int clk_mt8173_apmixed_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_ref2usb;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_ref2usb:
diff --git a/drivers/clk/mediatek/clk-mt8173-infracfg.c b/drivers/clk/mediatek/clk-mt8173-infracfg.c
index fa2d1d557e04..9b8c35897789 100644
--- a/drivers/clk/mediatek/clk-mt8173-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt8173-infracfg.c
@@ -128,6 +128,8 @@ static int clk_mt8173_infracfg_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_clk_hw;
 
+	platform_set_drvdata(pdev, infra_clk_data);
+
 	return 0;
 
 unregister_clk_hw:
-- 
2.55.0


