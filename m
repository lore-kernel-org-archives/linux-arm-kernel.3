Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B98E6CDE00B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 21:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E49Adk+rz41ma/ZabM7UStJxIriNv9H3xlG3UDtods8=; b=B2ONn0PUuLyV6Wh9HulSXD1uh9
	ZO9PMphDnjOLPSlZm/hQnBYCvW+PJkVnYnFcr6e6GG9SZSjL3N7gtVzAHR7+4hjAc3h8KT/01rFge
	aEhGkHfThIlqPj3HHyGriBOwLwzl67WM/U5WFLRoOUdrqB3qfoO1pZFX7whp/OluTpGF6uwpibkL8
	jrTVjtt+OP0KxtUVbxpliRGfYVw9Z+VJcLh6fieUUCq+lAU+WdpbOST5P4R5Sy3AAcax5eQ5Z5kx/
	ul0ufhJVy5Revd6T2NLXZ7fxFrjLw9tsWndx1A+3MMgSzIkgvJbcSgZWC58SfL4RP/ULU+BGPq2cc
	PS9gBQ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcs5G-00000009tgj-0n6A;
	Thu, 25 Jun 2026 21:58:06 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcs5A-00000009tcI-2j0g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 21:58:01 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-49261a64cf4so2124275e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 14:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782424679; x=1783029479; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E49Adk+rz41ma/ZabM7UStJxIriNv9H3xlG3UDtods8=;
        b=IE5a4TC7nWBNeVSnvmbVX1C3KDBun1Ns22xAxtTou6eZ6EgbdltkHWAyZtlWTPAopr
         e70n0g6xMb04R0hCeqiOEXNDiczXVmzvUQUzVkf5ZNtxeuRL/uH1jTdv67XTcwsUJsUu
         LR3XdILFXXJvPPt0eo9lpWHVjiOcHQgHfbVNFXQRVEsuqOmju2sOfQ+7wuPwxnnwMw8N
         VIHyvzlL+PxZgcNJa5VegMmfkZA/NjTSHqDerjkj+6OIbOthBbJDbjYoo191eofbqxvr
         Bj1FiwoEJfIvV28ei763CRkSAbVExWwd6OE8lfO5G8OHUGKsq9HHBldoLtLnSUqb9Wib
         IWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782424679; x=1783029479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E49Adk+rz41ma/ZabM7UStJxIriNv9H3xlG3UDtods8=;
        b=OtDA4ZwHi+gFgtSgE3kQgKouBLpECMUhBatveRx62hzwbvjRftz/QfYUIDufe7sbQ6
         6XiqlR7eqzOaPJhdoIjyQlg4K7cdij85X5bniQCCHWh7/79V9I6oQpSXHXteYF8gCXkk
         lcJ4DEj5H/0E7BEyQ5U7Utm9WPg+41MaOUpXK9j+VTRkBrC6abRIPePglt+jzGzZQH+E
         fv/YKRRLxhI/IDX/bvdkhtic4kTW9v1TuMU6I1NQuPwhRQOYYlth45YQJjPZs8+DpQVw
         mrEx1dQKtthxb/5LagVfLRjbVME6tDLEGd72fk3kNYpCDM4muw+7q3KE0XUcwDJTmSu8
         cTMA==
X-Forwarded-Encrypted: i=1; AFNElJ/MLoTY+4Jhq8DsVUIjAc6g1auKbiTmeNMJgQ2AdsUE1gkH0NIMJ0vAXIfTG3iidkS1dyUEfAkOPlIs+tXfzCI3@lists.infradead.org
X-Gm-Message-State: AOJu0YypJWddmHPK452Q2mJw/mA4kJNeA+W7arPB1W8g4Ps3jltoz93N
	i9uwFVRMJ2naOhD8CBXQ7whtYwWex/EuYo0pm4PfX9N1IM0D1IA+z0mT
X-Gm-Gg: AfdE7cmgIhcRF8oL2OiQwhbtSoadI0FR+epTFCEZlI3thEzn2+AUDH+o3YsmioBQ8jB
	xjJpGEtV9utndH04314Lf0+Sq+JfJoms32zUKKTnbAfNWTmM6n+cgGRaPJnfapi3M5XD3+nsOAO
	+1j3ZQlPGfN7TT9hUx5zi4Kj2KQkYmyMAqj7wOJYYPV5WGn6lZVmiJkVg5mcEhTJ5LNKbXhBzZ6
	hWL2iVsGKRNlbWUU76Bwr3oRIueubjiNtAa32ofZq+uTqWXyG4NSXv+w4NhgfJMS58dbQn+TtS6
	C3ZQGz6sTqZYcdZ5p54AoYqJp9qYnXTxgf83gHsdNj1597/Ew9jKaLexJkiR+54eEEQWLmRKyLe
	cKbYuYmiWUiDpqwVknEldkes2GxStrdMBx0Pcx7goM1pDxJq7z6HEEfd8SW/S7fllGIYUOurUA/
	N7cUv4CDrB1xIprLt+ZMvFZD1IJipb6A3VNEQ4lJRfpbMOPTMouGHlkVkqrphL8E5ilx9lAS3fF
	M1q7F1d2CAaYdWo5s8x6Cw=
X-Received: by 2002:a05:600c:154a:b0:490:b8e6:be40 with SMTP id 5b1f17b1804b1-49266881b0dmr61623945e9.21.1782424678463;
        Thu, 25 Jun 2026 14:57:58 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-80-183-219-152.pool80183.interbusiness.it. [80.183.219.152])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-492690988e0sm27339185e9.14.2026.06.25.14.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 14:57:58 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
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
Subject: [PATCH 1/4] dt-bindings: clock: airoha: Add additional reset for PCIe PERSTOUT
Date: Thu, 25 Jun 2026 23:57:34 +0200
Message-ID: <20260625215741.3253212-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260625215741.3253212-1-ansuelsmth@gmail.com>
References: <20260625215741.3253212-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_145800_711727_406400D4 
X-CRM114-Status: GOOD (  11.48  )
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


