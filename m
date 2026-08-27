Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 398E5C61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 01:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n/+j8GRAZA/QZODmB/777GdoiTUk16s/0lLReDxBEmI=; b=pOsaXR4KF276tSPl4bFCaBIZIn
	wHuSJva2zDVl5XcTl8MgQLesoc26/WPkPt1WXRoRB4naVC2HVzxRCoUYDXXz7HwRikillubcqQSBV
	PAMUTZHSnzHfNyuQHhpjn1D1fwKr721NrFoSpmsEh09Y8MWvEt360NdR95ZCulqY/RAGZZ1+eGblD
	oougUBXBEUlCiES/EwfKoTnZ6uiggfrsdJYnJBpQmjForfymJJDaJidHdtMTOiHVX/dX6kct/K0hB
	fkhJvBt5VNfdtdYwj1wxN7KvcEU6NDWoEsOpP0X+1WZa5oPdErABz8TrBmk0clFQ5nCrgE81QtUNQ
	3urIYaeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzOrG-00000003GhC-1Co9;
	Thu, 27 Aug 2026 01:24:46 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzOrD-00000003Gf1-0vsa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 01:24:44 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-cc1bcdb3c4cso127237a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 18:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787793882; x=1788398682; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n/+j8GRAZA/QZODmB/777GdoiTUk16s/0lLReDxBEmI=;
        b=pO7S4kCWocTD/WptnZ0PNowwlAZptKo4BZOzpFLMWmGs/W+IGCysiVOtvLXug5Q/AK
         MvUJG8cA1/z/JsrONo00SbNEq4+biZqgwQgkJgalF6LhctTgKcRa8Q5jv7BVjPQfFTpl
         MnGRRbpHYaqY2SQsHiWHkCUpo8is8Oxak1/tbbbXq8ciDJibhDekVKPPyk1Nb7LpFXnE
         M6vTWflMIilAqOGolp211RZ7PJAibFV9wnznja/Ny9f0m4WLZItt2mg0tepj636D4yma
         EAo/jNYDgYNIwaQC7uuRRbnPPj52cg9SD9QfplEnRaiSMexquLaLyI/KRTA5svmzwbR5
         OHsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787793882; x=1788398682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n/+j8GRAZA/QZODmB/777GdoiTUk16s/0lLReDxBEmI=;
        b=AQoZ4FsJ6eCupwjXGxZnMrsYnF19ehAhSmfLHd4ifzEHDVYn5yNAnzeTDnH1f5pAlQ
         /AclTsv6bG8rxP4FvEZ0YoWH6TGvigbYPwtTdEZOoxC/rc7Oo/USdmW9pNNDpBihk7cH
         HJCownaeQOSN9+zgJu6kQ3C9SvZKmTJAw24pv6HsxXNADxBIdEY09iit0IJDk+QRPVq4
         2Jup041+8cFC1P1i5V/RDZgQuVWzwDvsnFDtrWD7m1zc/nI7604auHhWq/5KfRO61Y3e
         enlVNJcyeea56otYx/PCGRhHb46rLBcY8gQZ8xhLBGXU5jw8SH5KQtgMzCqRG4i7nQUT
         PbaQ==
X-Forwarded-Encrypted: i=1; AHgh+RrnOJD4Unk1rln5K6aFWRnN7AG6yTCzDzOL0YVcyzsQV7mXvaUOFLCHQEb0S7VZqkld0FLV1LtiX768h1P+ML9e@lists.infradead.org
X-Gm-Message-State: AFuF++n4W9Na5B26KdyT78z70/K1ola++b0fPymuVi72optriiL1tnvV
	vWjUYACnevqjeNCd2a6Vz5/KT2n2lyTh/5orDDADW/TUshdorIGerAkl
X-Gm-Gg: AR+sD10lewPWn6/Tu4MOmJsw6F5YW8YT6dmqon2ylBV/EmlVuzg9BOc0UUpndrF0lGP
	y/1CT1bod8uNUMbpXtW68fe+DQhRug4/CcilP2q0sXyo6k6Ee9RIf5eKdS52MeDGoMD2zZenzpO
	5v5Bn88NXW6Rw3uR9JIr8xfUOB/oxDtvBwIq75nsqxL4l1OfboAKb4bBCPzdGLtIaLDt7zR3ZZX
	q8BFRjiCosOzLg5AxB7rLc55Bb9hm897dzp+pSyoQrh5lhskN0r8c8fA5QB2+AyavR+wPhpI4r+
	ZHVSPXcTUWs5Dske4jZCaG0vX/JbDKn47IKAiAhWzy69lxRsZO8tuYJA+os48lgkR28B8AvFP/E
	01F5Nz5maHdFQKPHPXBbmLqAM6aHL5jnoTdd3v3Harb7vZB55o4HaVEKJxVJEQ1ijgjlgPhoynO
	zKciQUg0ULFNntq7HsNe/Jfm4PPZTfCE08LFAOMbiedeUN1Q32V5gYpKoPwMsj1s6j3RF5l+f/t
	LhY07JrsfdQcp0DDviekOLrzZcofMA+uzd7+gIMjybOh/Zahp3CjRTxDKa9tC7Eb+jL2A1ya3XQ
	NgsKKnpl50WsiNgK+VyTqvu4y9BSjcs7oQBuKw==
X-Received: by 2002:a17:90b:1649:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-3966d3fe36bmr22244416a91.2.1787793881655;
        Wed, 26 Aug 2026 18:24:41 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-328593b6b7csm1321890eec.19.2026.08.26.18.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 18:24:40 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>,
	Esben Haabendal <esben@geanix.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net] net: ll_temac: Return actual error from of_get_mac_address()
Date: Wed, 26 Aug 2026 18:24:39 -0700
Message-ID: <20260827012439.162651-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_182443_272777_0499540A 
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

When of_get_mac_address() fails, return the actual error code (rc)
instead of the hardcoded -ENODEV. This preserves the original error
information, which may be more specific (e.g., -EINVAL, -EPROBE_DEFER)
and helps callers handle the failure appropriately.

Fixes: 8425c41d1ef7 ("net: ll_temac: Extend support to non-device-tree platforms")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/ethernet/xilinx/ll_temac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/xilinx/ll_temac_main.c b/drivers/net/ethernet/xilinx/ll_temac_main.c
index 711ed9c2631b..81ec73e6e4c1 100644
--- a/drivers/net/ethernet/xilinx/ll_temac_main.c
+++ b/drivers/net/ethernet/xilinx/ll_temac_main.c
@@ -1581,7 +1581,7 @@ static int temac_probe(struct platform_device *pdev)
 		rc = of_get_mac_address(temac_np, addr);
 		if (rc) {
 			dev_err(&pdev->dev, "could not find MAC address\n");
-			return -ENODEV;
+			return rc;
 		}
 		temac_init_mac_address(ndev, addr);
 	} else if (pdata) {
-- 
2.55.0


