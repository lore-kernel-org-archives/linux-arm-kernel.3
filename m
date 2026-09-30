Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96508CA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 09:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LLtGDvHzD6CrNoA94RNqXZ25K72u4Lfc7xmaaJ1VbZc=; b=iooLh5zb7T0UtK/SQLGGx7W1Xn
	8wF7VrA2dIZ1v7NFAiJv5OpHUxlz932t5/SFsPxk9QqBCJDd2q02USHHmogGIWPPa1O7OE4EYMEWn
	cMaUc1INOh7ZgRSEJXuMg1972L4t6/0vvyZJd7Ti2V0GQydRofbcDSc/36meynksdRePLv8mVYMUG
	EyUFuOA8zdtwFlwA7ZZx5J6fbPNISHPHOcGQAHwXMrSLhAjtDgrmzEwog7Dfw77R0tpRXOblhsnsE
	mufzR1cFfebJsTlF8ZinmU+1E9C00ZHsIX8/A7F/ZrDOqesg1pA1KLPQTnJdnpAUmKb397o2QSUMB
	VnK0e+0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqxR-00000005cDy-23J1;
	Wed, 30 Sep 2026 09:50:37 +0000
Received: from mail-dy2-x0f.google.com ([2607:f8b0:4864:36::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqxP-00000005cD4-0i4R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 09:50:36 +0000
Received: by mail-dy2-x0f.google.com with SMTP id 5a478bee46e88-33e46a15703so4918715eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 02:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790761834; x=1791366634; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LLtGDvHzD6CrNoA94RNqXZ25K72u4Lfc7xmaaJ1VbZc=;
        b=KBa2t1+YU6ypLbcj0+u6n2ZHHNs4td4xj90hc+41QBIRg3AgwlLQFB776vXXvGUWO6
         R0tqmK3kKRK9u8plRkm3qOENnIZMXu+JetAjlM9vMD8xFSNKEowkmhpHC8ChkYjeKs6M
         jQDErIZSYlWHNoGVcnh5n7oQ3thQMSEhHiwVUYN1OX7shI7ghyIDPU8ntFj77+OGWD8c
         oNSXFb9eJzDkn0QxgEzRTRWawk9ilPBWD8+H7vY6SNom9R7MVvjvy//TWkURXD1GUkJO
         IFyI/+ulKd5bfrz6AgJRX+rLOABcHgkCwfYg7zoSKhaogKYcDtwnOPJ33VGudJLlfBVs
         UgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790761834; x=1791366634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LLtGDvHzD6CrNoA94RNqXZ25K72u4Lfc7xmaaJ1VbZc=;
        b=qA5u3cewSAirqGNN3884GslGPiav3eH8rjbQY1UHiHMWwd0hf67D7lrQiCn4u/Br+M
         a2AHB4yZbZ00/gN7iyChGe+K2LV84YlQBDLZVP56/DOrdeIpfocxs+/usDxHtgiaJnI1
         sghs0DwsccPa2Ubyob+aVsjVeT1FqiFeVhwxKXwOVuXoA+9baAWBI0qblTTfcf5i/KAQ
         HeCs20lA5cHPm56nXfKxEXrbMKhDYbk0Twzt9N2nXFQxi8hrCTCrpiTEHCZDUi3J3PEZ
         psVOJvNLBih94+yzGbtn4i0lNFPVvoshvXO2yEG9lVJHYVFIapkktAJ0tY/pGzzSUQP2
         Mgrw==
X-Forwarded-Encrypted: i=1; AKwUvBw9K0FSgc5wP5MBVkuJikypAfylRiXCRFyXkuDCKOs+LgqgBCgmW/EzBCgQBQ4wQ1bgh9TTS87qbWqkf+OZd2VY@lists.infradead.org
X-Gm-Message-State: AFq9FYJLdpztn5aUB76bW1gpB+GsSxL87yEAN0TOtwDHV9nSbIHtcLuR
	Q6Kbe7z+kEx7vs4SPYTdObHGAcWE7CkxdApx942SIVMvhyOl2BE3JsBe
X-Gm-Gg: AYBFou2h4fDAyZDcuHdmv3D6dac4x1O6RKzhbKtB4ya4y+1x0B5ZfLdQiPLbH8naXQ/
	L/FOg5A4vlx5E6RTtAcx9EwjgCkMxE1R7fD9FFATlKedbzdXxEeyksIENVnvkdDB1qI/X4VW3ZQ
	YAsx2E92Bq5l8XTQbmFHWp+s7Z2KrWLKm6hIcmYMp3WDZdRvaMwDPnxzbFAd3jKj7k2gW8sGqgv
	SwIpHoN4mY9oqihvZMYOgyhatnOD8lBvOhzGWw2ITtakrN+l6SdmIBoIhJtPFDv9RpdDOjZXC7U
	+6LZhrPsi9uFpxGbPk5INTt1ZOso3PQvecEnAzr9XGo7f7yCSn47dbkVeBcgENL0k5po4wfckwV
	onJ7CEZMFRuwnyijV7NG9/9c43ue9b4qewxxsOmEGDU+9ZY7qSEOkF9C3TPcEQMV/eUl1M8LsVz
	fhFnnB8VqVUdTgNj4Y/L5BEQdIJ3NBt6JEC/1bOT1PQI5XPpFuyuZ4VXy0ybccGJeL3PkYSaY8r
	sjAQhsZamWoSegHhv8s
X-Received: by 2002:a05:7300:fa07:b0:33c:3134:f45 with SMTP id 5a478bee46e88-34cd907665bmr1266990eec.5.1790761833122;
        Wed, 30 Sep 2026 02:50:33 -0700 (PDT)
Received: from localhost.localdomain ([103.178.205.97])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf50553f8sm4934658eec.14.2026.09.30.02.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 02:50:32 -0700 (PDT)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C3=85=E2=80=9Eski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] PCI: mediatek: Fix integer truncation in fls() for resource size
Date: Wed, 30 Sep 2026 09:49:12 +0000
Message-ID: <20260930094912.3069-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_025035_264496_3212DBB0 
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

resource_size() returns a resource_size_t, which is 64-bit on 64-bit
architectures or 32-bit systems with LPAE/PAE enabled. Passing this
directly to fls(), which accepts an unsigned int, implicitly truncates
the upper 32 bits.

If a memory resource window of 4 GiB or larger is passed, the size
truncates to 0, resulting in invalid AHB-to-PCIe translation window
sizes.

Fix this by using fls64() to safely handle 64-bit resource sizes.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 drivers/pci/controller/pcie-mediatek.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index a60d1ae076f8..61591d0176bc 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/bitops.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/errno.h>
@@ -754,7 +755,7 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
 
 	/* Set AHB to PCIe translation windows */
 	val = lower_32_bits(mem->start) |
-	      AHB2PCIE_SIZE(fls(resource_size(mem)));
+	      AHB2PCIE_SIZE(fls64(resource_size(mem)));
 	writel(val, port->base + PCIE_AHB_TRANS_BASE0_L);
 
 	val = upper_32_bits(mem->start);
@@ -830,7 +831,7 @@ static int mtk_pcie_startup_port_en7528(struct mtk_pcie_port *port)
 
 	/* Set AHB to PCIe translation windows */
 	val = lower_32_bits(mem->start) |
-	      AHB2PCIE_SIZE(fls(resource_size(mem)));
+	      AHB2PCIE_SIZE(fls64(resource_size(mem)));
 	writel(val, port->base + PCIE_AHB_TRANS_BASE0_L);
 
 	val = upper_32_bits(mem->start);
-- 
2.55.0


