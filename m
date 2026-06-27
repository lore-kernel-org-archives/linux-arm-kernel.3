Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B3CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 12:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o6TslkgUAWDqod3FQpYnfSZ08UmiNf29gC+HqLWyQ4E=; b=ajS1UyJBvkUdaLXu3Z/c6y1yrU
	gLnF6Rg8N4cSVSPLTctdKsawtDwF5V8DMiCc6BWtZWLlV871nUbEoGSYQH9vP4i2YPx+ynSBpxhKM
	zhSq59X8rlkv99Hk9MsgJRrhB1vGE5H8qhawnNShYtgNXoSPDfLOIl63I+TWUqO66kzfc1k3SphUv
	1Bys3WbEaqLE4v2LruemgQfomU4WxgQQOzpa3EzBnetdroFViBvumViBNekzah6HxYjlmcoZMfyzZ
	M1b+FDGpqJ0BZSiGM9Bb9gzuYMxh4sqiUChl4UsKOjrvc0GKbYm69HpdtBVVvursn7CtyxQRq1/aV
	B9dgEWrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdRwE-0000000CRPx-0rnq;
	Sat, 27 Jun 2026 12:15:10 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdRw7-0000000CRKs-2Gt0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Jun 2026 12:15:05 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-49222fb062bso20431965e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Jun 2026 05:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782562501; x=1783167301; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6TslkgUAWDqod3FQpYnfSZ08UmiNf29gC+HqLWyQ4E=;
        b=FLqJD/QzHfel0SLLK/RO0jZD9dLPH5sy5rVHUXhxNUjz3QJmRxhaWaZxt5X1552IwJ
         Vjg3m6XaDQftnVxfgeYGJT28bzSPVyZdQ3b5ZiDRNJDvH1sGMrBWCGUDCICmsdAAwjNH
         v/ikQSlQGhkECNQYGdwlMklrSQDz3JlXX1u2sEDir/ZsLHhEGy8LQyZP3xT74Tx37OlS
         89i8aAUel0+4rLVlutbkN5zEsb92CUJjKOkIR0Eb1EjsVmYKny7j+iMcA+dVAqLTmrsz
         RZavWTdVOpBHvv7Wx89XKXon4i+63t8jx5YfSrkS16B3Marz/8KdZ5RUh3yGTr7ERQ7P
         /Z8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782562501; x=1783167301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o6TslkgUAWDqod3FQpYnfSZ08UmiNf29gC+HqLWyQ4E=;
        b=afsQBiOlx/z33mRB2dMUwWAO8hvVrF/WSp+975hi+UE9zUl4LX79afTUUU6u5tf7Fu
         dReV2b3yn3KoJsclnfaczKvg5bMYhlY6NBPGWj+f60Doag12XZXfpoOYfkVNaQKps28O
         mC23HEPaujvBpXSfGieF0G7kMJj3Wp7AnYNNtnp11eykYt3pK3A9ZJmnBeKbfA8K60/s
         vQDGgktbggZzecPUSNx9J8vRrVeW2lE7UhuelJKWQJ6ACGpREJEzmM2UqHYXnd12Bj07
         udu2MNn6LgbP7CDngaGOL9VPzvzFZN290hnscV1m2qlqyatqKnYIidtdANFSdTIuVf27
         3Fcg==
X-Forwarded-Encrypted: i=1; AFNElJ/BJ+1zJhemJ/3cJorTUHew3Lnm9d1FtJ9yI51igZb4uNxMssKmUD1xjIcXRUZQBUupOw1xwSznylKLjBpn3lla@lists.infradead.org
X-Gm-Message-State: AOJu0YyEbedRuIOCPVUQxP8cfQ8PYy3etdEml7vQNEe+h4ZYigZUQiVD
	X0AMHhVJRGoJByrJYerDkU/Pw7V0IQYf/MaHChXWvCHlQHoTi6eBbjpi
X-Gm-Gg: AfdE7cl4XrkztLJCsMAh/IIhIrX8xFuNEiXnoK5QhTQA8Ux8DPwBq8KM72vfPdntANp
	xRroRYepao0pnnY7G+GW4JgjBEY1qTwg9Ji4ELVeVTSM5mYVZkAEbJwhZTV8IrdQoSNQ9y1Ino0
	nJeS39ShUsqQKmzhx+YKaED0JN7zUy+f5BEZGY5wlhQ6dcRMJgIFtDNDMujzntOxFtk551OS8Ub
	VmeOToodu9beCfF3HuesB0q/7/UrYU4TSrrOY9JCu2TSBSChotoU7mMC0fEq8rv5/CflmjEsCYy
	H9P9Ztb1Svbpy3ePFbZPynpixiJuowwp7ErAeqxH5sXdufaCWtblkMjsTxN40DutII3V1+0z6sB
	W2CrOeVtsZZd4cfumsNJ2tDxUQh0Xz0ceInSBQUkHCEQmnYdZDSBHCbdShHC6Ef1eQKTN5tU9/k
	kJeP2DQWHzJJNvAV2BGgqo3V6EAJQcrw5LdLhlMRLW5Ds5tPCquimjLHXiqKRYdA==
X-Received: by 2002:a05:600c:3b24:b0:492:3fcb:22fe with SMTP id 5b1f17b1804b1-492668551dbmr160952675e9.1.1782562501557;
        Sat, 27 Jun 2026 05:15:01 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-89-195.ip49.fastwebnet.it. [93.34.89.195])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49269002511sm149028265e9.8.2026.06.27.05.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 05:15:00 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/4] dt-bindings: clock: airoha: Add additional reset for PCIe PERSTOUT
Date: Sat, 27 Jun 2026 14:14:42 +0200
Message-ID: <20260627121450.3529133-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260627121450.3529133-1-ansuelsmth@gmail.com>
References: <20260627121450.3529133-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_051503_626126_DD199D49 
X-CRM114-Status: GOOD (  11.30  )
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

Add additional reset to control PCIe PERSTOUT reset line for each of the 3
PCIe lines.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 include/dt-bindings/reset/airoha,en7581-reset.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/reset/airoha,en7581-reset.h b/include/dt-bindings/reset/airoha,en7581-reset.h
index 6544a1790b83..25e75534daa9 100644
--- a/include/dt-bindings/reset/airoha,en7581-reset.h
+++ b/include/dt-bindings/reset/airoha,en7581-reset.h
@@ -62,5 +62,9 @@
 #define EN7581_CPU_TIMER_RST		50
 #define EN7581_PCIE_HB_RST		51
 #define EN7581_XPON_MAC_RST		52
+/* RST_PCIC */
+#define EN7581_PCIC_PERSTOUT0_RST	53
+#define EN7581_PCIC_PERSTOUT1_RST	54
+#define EN7581_PCIC_PERSTOUT2_RST	55
 
 #endif /* __DT_BINDINGS_RESET_CONTROLLER_AIROHA_EN7581_H_ */
-- 
2.53.0


