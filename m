Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD23E66891
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 21:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZV5l3aK94WjBMd234KR2t67rjid2aTdUenY4d4w/l6o=; b=ZY7SJ4hzUo+YrUyuujuyqT5dde
	B3mLB1cYfu8SzYV/2MkZlmYOcNSy0XS9rtcBQRS6RXK1sMbdsTgZqctlh0ZgbyifV1rBB7Cg0j/y5
	TfVcXCJfXS+tyEodW+8FBSAAPxmvoG2gZU0uGipzXRV8A9JPayZcYie/6UcmbraazLQK0cr337zuP
	mMYYoMttFNZK1QT0YC9dbG8xcBmIjDr0hAiQ1MG50GpVSMXRPdjiuPkIeneOdlnxtH2gG1jFQaAsF
	PZickRB97VP/VJdhQ1avjlpKYPKd4BdryXBF8LvVHehEbL8K0cbP3yescgQojrwoU2f/KeN5vEHwW
	k+02KCVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWiI1-0000000B0z8-49W0;
	Fri, 19 Dec 2025 21:45:34 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWiHx-0000000B0yF-3fep
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 21:45:30 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-430f57cd471so1269030f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 13:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766180727; x=1766785527; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZV5l3aK94WjBMd234KR2t67rjid2aTdUenY4d4w/l6o=;
        b=KBMxzYNlyvZbsX32nCLlHOFWHo8x18C3p0ilunV0n4FWrJU0gTh5c5USS1ZDSZzXU+
         +CxZ//w6x1+1mGfesoIlAo8a85EXIJbkpTWy4RTDicZtwPhndJbB+k1lyrU7MAGNs/mN
         kUdwy0i36J/dMe5O2BRQ0nOLXO/6Z/4pXvmUbdzDxz4ol2qYLYgYphvhcWKXecRRu2sH
         fXryuABWu1UloHNFI1DlBuj4QozX/yRgpWDky4wuU5jpRPd5Dm9l4AEqLlq0HRgfXSBA
         v4+k5GF076xb3LBH4QcfCt++6eGWiW8yRZuNXwkkjlMF1vxt8HGmV3J3uH3e/VGspdj6
         vXOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766180727; x=1766785527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZV5l3aK94WjBMd234KR2t67rjid2aTdUenY4d4w/l6o=;
        b=T3vZPCvytdvOJvPU+x0yKQJiiqQy2k0aJw+Zb3vUAHCRU/5CmBS1snT7cOrtAd7dDZ
         csAxb7njevAPmXlt/QaIWS1QXdt89FaVjiZnBq7p+GPRvfU/SOlv/Zx3bRbwfErSYzeT
         e3QLcZB1clhK3GZ9+SFL+RiJ2KwN0cZ27BhigcPt3xk+YtmwDx3c8428Rp9HhIf+b9Wt
         8WA8+1fbvvQ9laM3/lEiEnuSF4gyYrMQ10UXS2v4VL7hfwibf/I5NC+O7QT1dTFZwBoD
         PzGvrC3g4bDynN/XklBzKfCyVBQxVK+rll3tqM+v+nBmH1g6z6RreqES3N+6hkZgspbF
         qOEw==
X-Forwarded-Encrypted: i=1; AJvYcCUp3oekOkDxXt8HtZufF0e22fB+rZj6DESXv183oPe3h73NVsxmaGaRJVaRSV8TGKzD5d4ZeRGqDDHz5vCccckI@lists.infradead.org
X-Gm-Message-State: AOJu0YwbfbZh4FHo7ZvFIjWP6LqnCo6DPwUceewm1j57w08FGA+5136c
	MFYeNluIKGdDXM2ehZQrMMFk529phzl/kATnuOH8pqKDPXXAd+TEJVht
X-Gm-Gg: AY/fxX7ZjjOhzt+b6Chbz/5PAYiTrhjzuTFPcTeSXrUGbpcLtuC26zgoTsAbYr127Bg
	+Rj7GUba2CPRrTSETO3SlAa/2xr36pxVzWA8gPXwN406ZdW54OHQWlnERwfj/GVTMDByeUO8axr
	KUuzYZG3O9GO4pUQHXr1s1jIhNvGwQzWCcHs1TWeZFH1EmE9wwtlnQXK1r4/eHt94SVfqCxty8t
	bLxLbbAf6MIqPDL3jCJbIWzg5N7Y4Hz2wHFFvzygbqGdhDvA1UkCnd813QGYjkrpJH34H1CyeCD
	I1G9PGSWkAk0bO+prMcoVQ5hPcHq3SIcxJDGxCJ6RY4owqXE1Q9U6JEdxkABwrV8F6C+51xY9Vk
	dbcNEhQPCjI3VNdyNxyuhFKOiKCVKrfyK42k7uksBiaxwlVoS3XTcbInn4VNBMuYNorF4Gw1N9w
	PAAGWo7prkP7SRAQO52Ppi
X-Google-Smtp-Source: AGHT+IH6/ztrcn+SlJfyVJT63am/rH1xZvx6X/K4m0kF1MT0B91G4kSCAcxAARG8TFZiP/ksh381nw==
X-Received: by 2002:a05:6000:2211:b0:42f:bbc6:edab with SMTP id ffacd0b85a97d-4324e4fb405mr5082384f8f.29.1766180727224;
        Fri, 19 Dec 2025 13:45:27 -0800 (PST)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324e9ba877sm7013078f8f.0.2025.12.19.13.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 13:45:26 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Peter Wang <peter.wang@mediatek.com>,
	Chaotian Jing <chaotian.jing@mediatek.com>,
	Stanley Jhu <chu.stanley@gmail.com>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-scsi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] scsi: ufs: host: mediatek: make read-only array scale_us static const
Date: Fri, 19 Dec 2025 21:44:28 +0000
Message-ID: <20251219214428.492744-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_134529_921632_1E6366C2 
X-CRM114-Status: GOOD (  12.52  )
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

Don't populate the read-only array scale_us on the stack at run time,
instead make it static const.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/ufs/host/ufs-mediatek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index ecbbf52bf734..66b11cc0703b 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -1112,7 +1112,7 @@ static void ufs_mtk_setup_clk_gating(struct ufs_hba *hba)
 	unsigned long flags;
 	u32 ah_ms = 10;
 	u32 ah_scale, ah_timer;
-	u32 scale_us[] = {1, 10, 100, 1000, 10000, 100000};
+	static const u32 scale_us[] = {1, 10, 100, 1000, 10000, 100000};
 
 	if (ufshcd_is_clkgating_allowed(hba)) {
 		if (ufshcd_is_auto_hibern8_supported(hba) && hba->ahit) {
-- 
2.51.0


