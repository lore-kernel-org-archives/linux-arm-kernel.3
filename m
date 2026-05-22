Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19FF3CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 10:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=78Vi4OavJbre02Pi7gJRdT8U7hvyFu4xORETXxXDTp0=; b=P9vLex3fY9zhZKs4Hkj3Exv9R2
	069QaObr980/JFsXvieqk8N+OLWKRszjD31gOnigQ7trtZAfWSUJsZQi+ES7njIcTyBHUYaPyuQZq
	8UdqjUhJX1J2yOpURtRlzGebya/EK9/z7MlFq217akkFwH5SIrI7qYM28Jyx5kC6Vm+YCb4y6SYpH
	qknKev6TQI0ARjTiToJqspHQPS8KhUufQL4Auio9SNoVrX6OyhIlqs8CEkHE9vCB1kqk0kVIWkLm+
	wrdVYhcw8QpwEZICcT/9O8dqDSPv0ebyermL7xvBsD+m9NKsMzJ1fseD0yfEfnCRHWejrkqXxdm6v
	9zanYKQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMjP-0000000AQcO-4A3a;
	Fri, 22 May 2026 10:03:52 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMjL-0000000AQYG-2Lrt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 10:03:48 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-36936dcf19dso3423856a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 03:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779444227; x=1780049027; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=78Vi4OavJbre02Pi7gJRdT8U7hvyFu4xORETXxXDTp0=;
        b=XMebFBGGh1WK3gJmWK+saolwCOiDZtgX/aGj3RYFTXQLneKmJVQySZ54RQtChED0ET
         zEdd28C37S71rubZQNIdjPCpJbp9aYLCrbu1IY9vbgVDRaUyIbQtBceyvfZ0O+Egfceu
         c2APS+hPDvMsp17Mm1j3ClmBWKO/vyqNoC8B8QTwdB0uJbJBtUWB6gAQ7VWn6rZDmZql
         k2T4LzgApWK665sUSFnw9nZ+a3kaq/qwCnF1ZiTB+WCuilZMrS0NvXE+d/oULaVvM6Rd
         pcvekV8UPcqO/2cX+QBoxLX2gskmR99g0KkgpcovPvHlgtnnBJcaz5P8X6NLq7VxAKkr
         MlUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444227; x=1780049027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=78Vi4OavJbre02Pi7gJRdT8U7hvyFu4xORETXxXDTp0=;
        b=hu4SKSTQHnkaQ56Nr1dIqI+8QQ7pHyB5RbL1e8p+LnujzOvKop/wkAhXIssy3mo5X5
         s8uMzK/MEb9M0P89EZwPlkP9i4oirNm9Y4STeRrgwwWNJoxpT+UL60PtQEZzKrOqiTCE
         XEbDl6OLEJgpvNXftP4Ia1Jl72j3jxzFBSj8dwrBXImmgBKSZNO1Re1zvuZPTT4gaBWk
         jk+C9cGtBCja/nKcsEdM5jjVkcdmbG0ux7zGbd9i7+9ajT8Ua6N/erg42TXEILPt2m82
         uzGbfNxREBWHxHbRMD7M5F7X23doO5SlCXNpZpoYReiNG47qfBoxE/GR+ozBXdLV+Vn7
         9v/A==
X-Forwarded-Encrypted: i=1; AFNElJ+iQFBSA4LntkPQ0GYb+NE6/o6zmWLzFK2I10HZGN3IxI6D8xyMPJLOvE1IoLDa2t4MjzZs5ECKwpYeWnqTZlsB@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1uFRwg97u+yioB2XezgYAD6CwLEzVbAjbqxTuDgK8wWjYMmpF
	wQv9Fg/FRnImG8e6a6LOEb+np9osgWzpx/sOkFVZJJNABTfdyjYxCxi/
X-Gm-Gg: Acq92OEp+X4TJQtLyp5AoKhj2vAD50orzfCCeg4Y+eAFSZyfr/T05E2ht6BS6iFQCQq
	2Ro+YAfXvyF6fVeCSxT4P3qaaU2s1ujN80cVcy6W9AE+wEetnwzZUQ9A/FYcSVFOn/lRnwoPrWK
	VFZ1ZhLRuhJEG36Lx9OxHGhfeIyIx4Tp1ZaVYrs8DrMYp2zacazsohMaDk7ch4oJ0EaB38K1+ws
	zTOhCVEBwJjavm024sw8t2GJ6qFb+ZEm/96fU7e5TA2OuRXXsA/IZC3y1MGdGZvBHHsExYxzNpH
	n6MYi6kgvlHf4NWv3NGEiepjAYAmrEnF6OZ8JZeV4FZeYUf6uoP+Fid652KNKXBfzRv7TthqE3x
	jNdscKVBpL6uC96hwuN1Vv7HlE/EOlGc4jMUYVmenyyzgpJl7z+G94//Oj7R6pkIcFxW5u6iP9U
	0qmRmIV+fUFK7axC8ruI4W9bIuUz0VEeqeSJBtn5jq0kIaFjj9yXffLDAxkgMUeyshq+2k
X-Received: by 2002:a17:902:ce84:b0:2b0:917c:bc4 with SMTP id d9443c01a7336-2beb03661a2mr27377715ad.4.1779444226741;
        Fri, 22 May 2026 03:03:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56f4343sm18683455ad.36.2026.05.22.03.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:03:46 -0700 (PDT)
From: phucduc.bui@gmail.com
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	heiko@sntech.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/3] ASoC: rockchip: spdif: Reorder clock enable sequence
Date: Fri, 22 May 2026 17:03:17 +0700
Message-ID: <20260522100318.73474-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522100318.73474-1-phucduc.bui@gmail.com>
References: <20260522100318.73474-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_030347_608181_156AB13F 
X-CRM114-Status: GOOD (  11.67  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Enable the 'hclk' bus clock before the 'mclk' controller
clock during runtime resume.
The bus clock provides the register access interface and
should be enabled before the controller clock.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rockchip_spdif.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index 581624f2682e..8de5b76cfe79 100644
--- a/sound/soc/rockchip/rockchip_spdif.c
+++ b/sound/soc/rockchip/rockchip_spdif.c
@@ -76,16 +76,16 @@ static int rk_spdif_runtime_resume(struct device *dev)
 	struct rk_spdif_dev *spdif = dev_get_drvdata(dev);
 	int ret;
 
-	ret = clk_prepare_enable(spdif->mclk);
+	ret = clk_prepare_enable(spdif->hclk);
 	if (ret) {
-		dev_err(spdif->dev, "mclk clock enable failed %d\n", ret);
+		dev_err(spdif->dev, "hclk clock enable failed %d\n", ret);
 		return ret;
 	}
 
-	ret = clk_prepare_enable(spdif->hclk);
+	ret = clk_prepare_enable(spdif->mclk);
 	if (ret) {
-		clk_disable_unprepare(spdif->mclk);
-		dev_err(spdif->dev, "hclk clock enable failed %d\n", ret);
+		clk_disable_unprepare(spdif->hclk);
+		dev_err(spdif->dev, "mclk clock enable failed %d\n", ret);
 		return ret;
 	}
 
-- 
2.43.0


