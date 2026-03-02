Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A18DE9B37E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 13:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=19etRSJE9t4MqtgRfKOwWBsjZmOQTD0TaU9pT3V0aNA=; b=mPpf3UGIweVu3i2LnrucFD+UtX
	WV7ymcMV1IIssigeLLoZWtJuMCZ9PkxCAz1N5GGAHxTUb6IigFxjmT/F9nbNe2jMclHnDsTcbEyEr
	vPAXiSSUozcDN//ODt9PwI+Bikr7+tTSvE9jx99XbSRU9i/l9e+sHBXkGf1pchA3TRS0gBh9Bh7Fh
	DUK0ZgVEbYxbD+kxg3RXxomwj802r/yPWYWyJlEb60QvxK8oHl57FFjWcU4ni7vT6/II8yee3zGdW
	hBCC9ByQpo4NTdkaeWWJTllpQjNYwiKIUMmZgyA8Bxn9ul5flUzZl8DxH+9UebSq2SmUfUU3duWpN
	MlCW3ILw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3cL-0000000D9QG-1WMT;
	Mon, 02 Mar 2026 13:47:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3cJ-0000000D9Oz-3Ysv
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Mar 2026 13:47:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=19etRSJE9t4MqtgRfKOwWBsjZmOQTD0TaU9pT3V0aNA=; b=GVPhtk74G12CZB6saSlUJuE0E8
	ej5DJrLHwkH2QcR05JLuvUMLdbsBDCsph9jEGo2C2hJuypoqX6pN3zxuRbwZN7eMq6BsPCQFE4XhN
	mROmTllPtGN71GtwpIWyk5j1xWYkVGsRa8srsTgcaVKHDgrDHbj5GsnAccxvCp2mMeXP9ZKI3N100
	Hej59ZlGBbis31BV/qKC88hmQbGicdsu6HLjhqfOJ3s+H2rSeGroOJwd6BvxBiqCoDwSrOJCk0+s0
	GwaNvOBseL9iXAq24lziB0AUaomRgLPgx92vTo1ayHbFUWzwvlG5br84ignA3Te6RHpwAKYfHHj1Q
	OAZn+Nhg==;
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3cG-00000000Ctm-2YK8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 13:47:22 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2addb31945aso33450585ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 05:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772459238; x=1773064038; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=19etRSJE9t4MqtgRfKOwWBsjZmOQTD0TaU9pT3V0aNA=;
        b=InMErIYncVoG62Ybhhfvp4ISTRK5r0uz5ahWsgZUcZEPzevZWOIzrXE6WDtKZqfFsx
         GNapj9nMItlg+GBAknGyR13UaCQjrt7E7faBIvMMJ4ZxUPCykaOa1bShyeYxQ+rF7vhB
         /6Jc2Aq+vey9Hnc2JaNJORL08MB50IrqQVZwUCk+lzHIJEka4x+821OC5x0XV4DnJZdx
         GRvFU8Ggkpb+BZxQ3Hw0PPSrJrN2/2vA3nrVhbmuyJZQ+PAf9wjJZf0o8xCCeDmlsiKm
         bPYiaTAOmaNl3IK8ray5RnlKes0v0QVnqDjcKCJKovzMW4U2ccoBBOlvxLNTv862Ndot
         qLrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772459238; x=1773064038;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19etRSJE9t4MqtgRfKOwWBsjZmOQTD0TaU9pT3V0aNA=;
        b=cKCKaQuTgXHAfsXz8vICQQDXk9PZY1tsBkeK4Wpv1Hg2uLHh+/Y4qI4cDcWTqe91S5
         dPbNCpu4L7GoY1zELpTXpwstEpi0n7wpYVljGCytuNoCGphHKjjT/RxMTHorwYIeg78m
         JTQIFzm+QdjbkHrYwWxbTny82fwPtMe9po6kwk+J5fNQxxgguxZd7zAAzRtntiVcjzy4
         pJqPDMkdTDYXO7x6t1tlUxsO7kLW58MowSqmc3Zhc9nRwFARnoOBo+8zPzgPQdogV/2s
         iVUAvs9fce2uIQ0F84FghIGpbvVt7wMk4hLEXQ/dDutyw6fJj+iTczTVU3FuXI3aoEuU
         VHRQ==
X-Gm-Message-State: AOJu0YwgkMeYUpe4Ovd2RKNec2uuEceIGuqs+UQupofBrQWr3XQRWC0D
	54H6/+Fktpqg7ekLqghoG3EI5hVMQCEzxWS40bFuUc3CKzpzuxdKdAS5
X-Gm-Gg: ATEYQzzz2PxyHCZCa2iIHLMqULAIIFcpE5am3pXuyTRQDjYMgYFSTdAbLu+tfKzdEwZ
	8qLxjBiunFAMZuGBJEMTdbgvdm3ILrKK6IaX/Cw2uLBOiTYblu+3roaNeIkn9BKF0nluqaC5f0W
	RnXxgCyikSoE8ds1lyCDa83zDVZcqKzbsGg6gIM47ZWQWe20wo1wEgLw5fEXitLukupbfuemOE5
	Zfg9b4M1g8BeNwNjKgz3JTN4Jg84EjGB3eVCMv86rM81iO0sHJZy3MRAXH3EYg3J13E93V3eF+6
	ZL45gdlUls8eKNu2FmRog8dVJNwuRVSVQ3mUfvN4pg+lFI58twf2bhqTloSVQoRpu/hfVVCDzZ9
	lH3q5djhSbPF1/jrecCsYwJp7G2vUADr6BgG/tjNgYrvnLVSI67J0OImsufoEbwo6+XHpQPtzI8
	5SoeQux3Ai29aHBX1TG4X7MuBkF3BeT/kcSJaE
X-Received: by 2002:a17:902:e550:b0:2aa:d287:693d with SMTP id d9443c01a7336-2ae2e402022mr117574295ad.20.1772459237982;
        Mon, 02 Mar 2026 05:47:17 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9009:3f2:4c92:fc5c:54e5:712e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae4e571b90sm37553965ad.62.2026.03.02.05.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 05:47:17 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Mon, 02 Mar 2026 21:47:12 +0800
Subject: [PATCH v2] mmc: sdhci-of-bst: Fix memory leak in
 sdhci_bst_alloc_bounce_buffer()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-bst-v2-1-c7bfbed68d10@gmail.com>
X-B4-Tracking: v=1; b=H4sIAN+UpWkC/1WMywqDMBBFf0Vm3ZQ8IMGu+h/FhUmmOlBNyUiwS
 P69qbsuz+WecwBjJmS4dQdkLMSU1gb60kGYx3VCQbExaKmtNFIJz5tw1nsXbHS9UdCe74xP2s/
 KY2g8E28pf85oUb/13y9KKBGjD1pjMBj7+7SM9LqGtMBQa/0CSp/Zc5YAAAA=
X-Change-ID: 20260301-bst-76bb7c6d7931
To: Adrian Hunter <adrian.hunter@intel.com>, Ge Gordon <gordon.ge@bst.ai>, 
 BST Linux Kernel Upstream Group <bst-upstream@bstai.top>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Albert Yang <yangzh0906@thundersoft.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772459234; l=1415;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=xCJrwcDDyo8LLH18A68PDQVaRjBZZCLL4CceXSPjnU4=;
 b=0DCQ9xxPJewQ/HpTkeeyfaNTm8Jm/WD7oQHkoQgp71kyn27fZMrrkq0Hz3P8CN4TuwKvRyLY2
 llzB6hbF953D69a6QL+fnDpluz9AFWpdUnI1NVDVlFYcTMwFNtxh5S6
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_134720_788306_8ACE8AC5 
X-CRM114-Status: GOOD (  12.92  )
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

In sdhci_bst_alloc_bounce_buffer(), if dma_alloc_coherent() fails, the
function immediately returns -ENOMEM without releasing the reserved
memory, which results in a memory leak.

Add the missing of_reserved_mem_device_release() call before returning
-ENOMEM to properly clean up the reserved memory.

Fixes: 695824f45629 ("mmc: sdhci: add Black Sesame Technologies BST C1200 controller driver")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Changes in v2:
- Fix Adrian's comment.
- Link to v1: https://lore.kernel.org/r/20260301-bst-v1-1-ddbc22ec3ed9@gmail.com
---
 drivers/mmc/host/sdhci-of-bst.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-of-bst.c b/drivers/mmc/host/sdhci-of-bst.c
index c124990a64f4..f8d3df715e1a 100644
--- a/drivers/mmc/host/sdhci-of-bst.c
+++ b/drivers/mmc/host/sdhci-of-bst.c
@@ -425,8 +425,10 @@ static int sdhci_bst_alloc_bounce_buffer(struct sdhci_host *host)
 
 	host->bounce_buffer = dma_alloc_coherent(mmc_dev(mmc), bounce_size,
 						 &host->bounce_addr, GFP_KERNEL);
-	if (!host->bounce_buffer)
+	if (!host->bounce_buffer) {
+		of_reserved_mem_device_release(mmc_dev(mmc));
 		return -ENOMEM;
+	}
 
 	host->bounce_buffer_size = bounce_size;
 

---
base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
change-id: 20260301-bst-76bb7c6d7931

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


