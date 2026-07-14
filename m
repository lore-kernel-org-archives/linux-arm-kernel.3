Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC731C44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 11:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o6TslkgUAWDqod3FQpYnfSZ08UmiNf29gC+HqLWyQ4E=; b=mkYteKVc6P0tRYZn57SUhqDF2o
	0ZrbCdsHHo/XhacOkpiBVB13VMG4q1W0r9sdGtZjEMrdCk1doXQr7H0Jz0UiF4FbdfBNrOZiRI2wi
	+qPykI94xJK+BkB1HTt/KFhEabNl8lMf8QMNUJaj7nVvAbz9Wj/4yyOLRCaYTq/TriBv+1ji75ErC
	UXvQW6K2tZsAagsXRQVYDMkZdu97IYHd5zh3MsSyAJKdaErM8ihUEShAOy48xYMG6NQuLRmMEAkf5
	CBT2/EurcGxi8h/O442Q8FGsLRLhXPL2fs41nfD54WhU1rRjo12vVrmCp2xg6aAMR0cZNIweAY9hE
	naTGrsOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbn2-0000000Bp03-2OBe;
	Tue, 14 Jul 2026 11:59:08 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbmt-0000000Borr-3CcB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 11:59:02 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-493f45e20cdso25544785e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 04:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784030338; x=1784635138; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o6TslkgUAWDqod3FQpYnfSZ08UmiNf29gC+HqLWyQ4E=;
        b=GxD77cLpo2BYZNDhHMQ/D14HQ1e2rpL8zxNbVcRvRHi4n8sOBV677OPEGIJY41oXT0
         Lr/GOcSZQ14ozCDHW6KJH7/C/ZZslchn56uOMaBRRdH4i0YGPeRYGmUNYfiAYs+JTSXn
         7UBlUO88qfuCSnlQ146tV5rd5JlW3GLZPKNmGF3q/qZY3Gslrd0BOoXwCL4Z0olfeeas
         T2p3B0PEZT6G3spORY7FyZXxu01Sd3IJ+3wxaIhqJVp/UYNxcZm75SWjcwjaZ9k9ek45
         PSUEuOuRvNJTHgIpznf9vwE1TgKTF6KLtxEO4VUmuE/zj+2PY6PwJJnec8E0k67w0VVd
         gNUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784030338; x=1784635138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o6TslkgUAWDqod3FQpYnfSZ08UmiNf29gC+HqLWyQ4E=;
        b=jGQSXxSHkG8aAodnMvbWkvf4EfPnd0VDZ+SoJPCGBdAzIFzuPV8LPJyRMZLAwNd5pS
         HCK93UQVk2PMLuIoPUtPvS4h82/OTcwB48UWEPu8KJuiieDdGnSgi0JgD6ZV41ilveFu
         TQG5BXKWhCS3SRQ/jKqq0OaqXw3yzE+rGOoXG3DoEAbqPt1v+9WGg38U/NQCo1nf8PcH
         6XDnLzCOtYM99MaWC0yTsVQEMeOxNlb4GhK8QoQk2rI6t9aeM5G8HiqD7t5rSvsR10Xi
         N7W61rguqMKg25JTSePKkLccDNODOsrnVHINL4D+2S4Q4wnU0Ql8SrWAolQ47ESzhg0Y
         acrg==
X-Forwarded-Encrypted: i=1; AHgh+Rr/ZbprGMEQ6Ob0Yw34yEQMmJ9WY8r22Qwmdt2c1JkXmAnpNWaljIyg78842C/0Pz1u8uAYIB4IcZRGMOoo0Ifk@lists.infradead.org
X-Gm-Message-State: AOJu0YxQCAJHikbFchXjOdcw/+SLCHBlJSDZvQmN2OUywrJGXVt3J1lS
	mNVlIMxDBYhWJhKoM+ZepOZORYBnBIuDZb2vq1gfmsYA53g85foGzfV9
X-Gm-Gg: AfdE7clvxFtQrKw48Io5UFtRiNyHRuuh92IdyjHVNJVoUeNnzk2xMiLwF75d82LX5wq
	JcRlje5M3S6+ZicDVwQN0qzX5zaPy3f7EaMfFdENmscExG1E8qiUhptSa/bqFltkoQdS0FqVj7H
	1ztV2TXASjOLH7A6FMrpkNNDLJyEUuSgVU9JKmY3vvCXEyvAhC1qSKz5yaYY8QNBMmbPFvB4E11
	AkDUsBS2Zbe9v5ptVGUfEyrUPexR7v+l48D2RM+UyM1rc8LAEAxl1JkzY+SGIipPNCOpr3hPP5P
	46VxwZvntxaCPSS3bCS/n2xXYmxEmd75YqxNoPShMbH7veqZW52OI37gF7i3mm8sY4GhyX2hP9R
	mqWmrA+kbMgMbYoeV0OFRK93KZfAlYs+U592Hj2GqgtlFwkats7YaXH6/91X0LD93AEzp5S4bkZ
	KLqb2V3/7iyIj4Aa7MS9IASfrAytbuC8m/pv0sbiWy3qahB/yT48zSeUVsHiyu+b/aIZ+S5WLRN
	vnrkjLG
X-Received: by 2002:a05:600c:1f94:b0:493:c8c6:4989 with SMTP id 5b1f17b1804b1-4953909f29cmr16692335e9.6.1784030337488;
        Tue, 14 Jul 2026 04:58:57 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-248-227-210.retail.telecomitalia.it. [95.248.227.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493fd3ccfd4sm180531655e9.2.2026.07.14.04.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 04:58:57 -0700 (PDT)
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
Subject: [PATCH v4 1/4] dt-bindings: clock: airoha: Add additional reset for PCIe PERSTOUT
Date: Tue, 14 Jul 2026 13:58:43 +0200
Message-ID: <20260714115848.8537-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260714115848.8537-1-ansuelsmth@gmail.com>
References: <20260714115848.8537-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_045859_840418_D0040237 
X-CRM114-Status: GOOD (  11.81  )
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


