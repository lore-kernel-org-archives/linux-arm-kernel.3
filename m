Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A95F2E83831
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 20:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LpDrR8v0kz/WXCN7qPUJ4GEgTRa5+ny89JbRvW/gorU=; b=3Gl70OFG5wcwcgkWMokyTeHne2
	h9JvfvEsd1s2rY/wNIzIo9dtoHaLiHRgKS/KrHE5DiWD3ePDCqYhXupsO+IqiclVoNUPQCGzIfrGS
	Mq6Fdi4EPovJJtGqiQFS1T4tDPUqBQthbDy92ha720rbKsf6sMxrfdnZRfJV0i4fmy4D7GEIGrKlC
	0efcxclZL0zSkakrrXmPzYRbZ2Swh/5VAj1eZrE4s/K3qsvJk7q+DW6D1HmLgg/+j/2vRE/UTdbRV
	mnMsesksutevqZGhoO7lJU0lUE3d0I6F28vRB7Pka3I5L7+PFXseoUE+MMSo8nenEVbQIVMVXQHxn
	L4tWIL5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs4wf-00000007ElS-0uqH;
	Mon, 16 Feb 2026 20:11:49 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs4wW-00000007EkM-0OW4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 20:11:48 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2a91215c158so20319195ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 12:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771272698; x=1771877498; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LpDrR8v0kz/WXCN7qPUJ4GEgTRa5+ny89JbRvW/gorU=;
        b=k+m5BmKeVaOI5USIWZ/JDZZWaDnS65GzZ+KFuPMg4YRjEBEXDNtqiEytShcDuNQN6U
         XtMqCBMjfdEhaDI6PQgx+CEkgQlYEfg3EBN0mtolHsFofZ9Lgt/IWl/0RBKw/1wC4P55
         vE4C2qP0vYQxD8KJ9lC3/KfwimTI660Sruo6p6DLaGU6TtnxtRPUqspuIYw6253hBnvi
         lnjn6GdHGCsSh334D0gtI/hX+zRpx6GVg3j+KwHkiGD0ifguQVFmcAwBc3HtfDgQaoCP
         rYeIrLmXI/djpg88YCyjAl6rJCzbWDQL774oEQhvzRP1EwYRWeIOxCpTv1vxyKH+HxRN
         q7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771272698; x=1771877498;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LpDrR8v0kz/WXCN7qPUJ4GEgTRa5+ny89JbRvW/gorU=;
        b=dcUY9fclqDEtFVFm8ZBwGCxAlZMmoKHmQbTP6B/cFxyH8HOeK6vJ3WkMcyEk1LmVWZ
         yvw5DI/70caCbsAoeMigCzQHU2Za6WDu+dP2vWXrddlE0A/yaSYhuwizcrDFtpyhWWgN
         0XTmz5rS3irN68vdsiiDhsAH+o/D93ugaEdEXghvIJkpsqVlw/xrWaEXFIdB+KQk+s9T
         vfrqg1hlJrx7ITzl7jOOWVudAzGprMToNgYkNIpn/UEQrF0rPCxaspvPvettfHf/IwlE
         FmGrfb6kAWNfaxvI3da/T8sqA8Xz+BjllNjCFsLjgSAJ0J2DzZ1roSrdoTC+M2VI3qOZ
         f+Ew==
X-Gm-Message-State: AOJu0YxVMX1iN6g/dgJj97GkMgGbYjflY9Wa37ZvX9uWU1mqkNOxbD2u
	6uR09rtjDlCAfaLowAG0Z5ixzFwUG1OenX3ZNBjg0hlUwwBI+a+QYiYN65HyIGW4
X-Gm-Gg: AZuq6aLoUGNvdUo2OevCA/JAHEnPSUd+tuC6rO3d7nEDz8mWL510wUrwgLCFlK0EwKG
	uEMprkUWwMw1/bUErhhnx6+GXYRzfesc1p5xcAarABtXzMbeCAv8zV10QlMKai1o6Eh+pPWoObX
	AVoepYnciq7bpm/E3uovo5/J1C/GAG16PmZKEsiNfx+dizEnna620JYmpz4NzHgSqrd9o0PIyLo
	XRLQmRyR1WliRQQV1PtpeVBI+K3j14XFsh5n9ox9fremZNxmCtB0LLncG7PCMnsoppTDDIbUN7F
	GdIhKd74nBGiY3BZcCU2TfrJreuvZn0Pnyg2OY+0lnsvklo8Lm4aTubuBzi8LUmeyz1LkvnRkhY
	xC5gijHxCpyvs5UW+X0evVv7DmHZ6lam57kRIV9cxtzxQByzS0YURekDUauV3gAnn5jgTBKjTkL
	OAXFNA56UzEcfUMdex2o3ZhW/Wz7QjbIkaDiuygQ==
X-Received: by 2002:a17:902:d50e:b0:2aa:dee9:dcf4 with SMTP id d9443c01a7336-2ab50568335mr112837925ad.25.1771272697600;
        Mon, 16 Feb 2026 12:11:37 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9008:ba52:c942:b243:87cf:ead3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a9d5cf8sm76178625ad.52.2026.02.16.12.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 12:11:37 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Tue, 17 Feb 2026 04:11:32 +0800
Subject: [PATCH] soc: rockchip: grf: Fix device node reference leak in
 rockchip_grf_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-grf-v1-1-2088c966875d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAPN5k2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDI0Nz3fSiNN20ZHMzAxOztFTTVGMloMqCotS0zAqwKdGxtbUAiDQW8FU
 AAAA=
X-Change-ID: 20260217-grf-fc76046fe5e3
To: Heiko Stuebner <heiko@sntech.de>, Shawn Lin <shawn.lin@rock-chips.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771272693; l=952;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=NkAOBLC6YzKiTIicItVQWCVBJRvcoaFtEfxryDX60As=;
 b=328UsHN33qU2eocu6zhmaD5eVkB3YU0oW5vGQUMHld3SJvNgwssol7QhFNhsKICvLyES7dKLZ
 JtYifvQcdblAwOKU1Ddn6NiK49jx1Ad5fxo0p3a1dIkjHw1VqY99Tfy
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_121147_549753_BF486D6A 
X-CRM114-Status: GOOD (  10.60  )
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

In rockchip_grf_init(), when syscon_node_to_regmap fails, it returns
without calling of_node_put(), which causes a reference leak.

Add the missing of_node_put() call to fix it.

Fixes: 75fb63ae0312 ("soc: rockchip: grf: Support multiple grf to be handled")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/soc/rockchip/grf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/rockchip/grf.c b/drivers/soc/rockchip/grf.c
index 04937c40da47..b459607c118a 100644
--- a/drivers/soc/rockchip/grf.c
+++ b/drivers/soc/rockchip/grf.c
@@ -231,6 +231,7 @@ static int __init rockchip_grf_init(void)
 		grf = syscon_node_to_regmap(np);
 		if (IS_ERR(grf)) {
 			pr_err("%s: could not get grf syscon\n", __func__);
+			of_node_put(np);
 			return PTR_ERR(grf);
 		}
 

---
base-commit: 350adaf7fde9fdbd9aeed6d442a9ae90c6a3ab97
change-id: 20260217-grf-fc76046fe5e3

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


