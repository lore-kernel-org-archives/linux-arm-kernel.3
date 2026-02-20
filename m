Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296B8C531F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 02:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ueUIh90NJCaKnHKC/7S871pMhBZ1bq4EjRF6jq/WCEY=; b=VFsJZApoi04c6kb6avckxpbO7I
	6XvU5H9EWiTSEQPvtDkO1ivwKIDzGxCyfKHFVS3+8tlsTN8cBAZQLk3h88JXzp5pu7PM3htqzBEhR
	KzlPpxaKNQE5S+X0F/74nk2xQ4JjZctmE6oJYkXHxfTspQtB7QDmPN2+uiX+qUei9Pm1ZYsg2eNlF
	5evRmM+e6SE28RbvHaYUeUaizpvJIrHA/I3eHGZ1swdWE/P2h0s+yHIHwLPb/ZQFHdj4SLuE/1yNl
	gm8hsyV6LAyGWjNt0aVb+UTH8D/aL67KrzeKsVdWCekmh9j4L/GXspjUick5+/M9G9fGtV9wOSkcg
	BcH06Zgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtG2B-0000000D2gm-2O1H;
	Fri, 20 Feb 2026 02:14:23 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtG25-0000000D2dE-0Ee4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 02:14:18 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-82361bcbd8fso845675b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 18:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771553656; x=1772158456; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ueUIh90NJCaKnHKC/7S871pMhBZ1bq4EjRF6jq/WCEY=;
        b=MhB2QnVdAr+JxFwuICgxLgaNAeXJoXuDid6eBbjYdHysWKvK7f1ES+sMeHfpstHkPV
         eHbgFxxBuMwLtZJCcdp1O2aQNXBE7LvKuBPerdOKKMBXMRxlbhe1YSYnMdl3Z1Mz8ykK
         K1TJqLEIKK3R0d4sReU8N0L72qDhj+wIQajlc+0MpVrwNb1pYuG92wki3BPfrAAG543e
         SSlDNoF8UIADTulO8BE4ZMH+nMikMh2wpPk/0mPt5oNQusvhT22WsbVoFf4gwL7urzk6
         rA7hgP7Z2E7dqdRw2Vo30hn9AiYoqOx5FO5CaBRSUD6bHpyMyVW3C2dlfnvp6UcR6Mhz
         HFlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771553656; x=1772158456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ueUIh90NJCaKnHKC/7S871pMhBZ1bq4EjRF6jq/WCEY=;
        b=oshvKyLz8wB0J2ocrO4blyJyHnBva9phFp5DGWLy5AfavukhjJ8YCTw5AsgrE2dCEa
         8nEc8hLx6aAwn8cxwr5/IaWx1MUZmnJRl6tCY/5D8zcMQGiPQtRQZ2IkkJ/D8w6PLdHQ
         NaL/XciMwX4oGf0U4S+HgIchrRv15GeITZG/tsSKQW7km0CdGUdTD81bleoxsWOcKlEU
         8zrRBIjcJR62F1nfUixiwfSG2AsfksXDOSqWJkkJloGQ18TY/d8RvfBm7n55hKPMdf37
         iKTLsz/UrHwLNKT7krGEplncpUXY7fzadIqdoEsYTX53In6L0iD8k3GV3QyZhi6laur2
         aKbA==
X-Forwarded-Encrypted: i=1; AJvYcCXUfl/8bsXSP2zo0EHLcy7IUnZRsfAX1C2J0DW2sKThAJNlUX+GkmJHgkFmg33UOKUXYsNl4iNelgo/2qCbeFyC@lists.infradead.org
X-Gm-Message-State: AOJu0YxuCAoVsPPaEUtWMlL9p6sumnwLqwLBurPYpun84TeKbtTsqcgK
	kAsxSHpKlr30BNOzNz0+rxrMK6sTwmnDq+0UY0gq/RUsT7g4TV01r4dm
X-Gm-Gg: AZuq6aKFvvZCD6TxvSoAqXd3/90hupaWUU0OwuELEAhetOCAJNdHTdO6JpxoSZ2fzHc
	HOcnvzWL5pAt2s2TqrR2uQMSAJDwAyPvx2N8Us9XSDmRqog95YoNlg5Gv473ce/08u/GB3Q/Pky
	w4for7yT7MqIbtWMdTgA3CLl0ajsY18x1lZQucbr9ru9s7PKkdpfbMYvlWf3CSPOI1YevNE+a73
	yBSa2IeKK25kkxF9n1qcbRMAFrY7ZIlpbs8sMxKPzKSOEgkgqfd3w3sldwT3FYgF0zbwKMhpCjI
	GKDTtUMlXFgB6AeDPs5ge/hlh7cwhfR9Cj5G74UZmDHODc5uE3aGWEhAQ+PpNNKq8M8EGuPJGDZ
	TCKS3R4BYTHxklZwv/lMASKaoP+8N3XektTeirOoRo3LwcETIoQa80279EybEcswCq35l
X-Received: by 2002:a05:6a00:180f:b0:821:8202:44e3 with SMTP id d2e1a72fcca58-824d95345aemr17126081b3a.30.1771553656087;
        Thu, 19 Feb 2026 18:14:16 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b69b13sm19607225b3a.30.2026.02.19.18.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 18:14:15 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/5] ARM: dts: bcm4709-asus-rt-ac87u: specify switch
Date: Thu, 19 Feb 2026 18:13:51 -0800
Message-ID: <20260220021353.40554-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260220021353.40554-1-rosenp@gmail.com>
References: <20260220021353.40554-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_181417_096789_28C0D790 
X-CRM114-Status: GOOD (  10.39  )
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

bcm-ns.dtsi specifies a default layout that is not correct for the
RT-AC87U. Also allows setting the WAN MAC address properly.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/broadcom/bcm4709-asus-rt-ac87u.dts    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts b/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts
index 59400217f8c3..f48c44ff01c0 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts
@@ -77,6 +77,43 @@ &usb3_phy {
 	status = "okay";
 };
 
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "wan";
+
+			nvmem-cells = <&et1macaddr 1>;
+			nvmem-cell-names = "mac-address";
+		};
+
+		port@1 {
+			label = "lan1";
+		};
+
+		port@2 {
+			label = "lan2";
+		};
+
+		port@3 {
+			label = "lan3";
+		};
+
+		port@5 {
+			status = "disabled";
+		};
+
+		port@7 {
+			label = "cpu";
+		};
+
+		port@8 {
+			status = "disabled";
+		};
+	};
+};
+
 &nandcs {
 	partitions {
 		compatible = "fixed-partitions";
-- 
2.53.0


