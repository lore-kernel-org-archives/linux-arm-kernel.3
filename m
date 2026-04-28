Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C888FF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 20:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gK+EAT4GmZMdYdv/TPcw5cMAUzBnAuCqdYs+Qlpxwc0=; b=MiHZl2ALkMF+JtqNLLtYcM0vhH
	yJyjdtGMyBoN1iraeYi3DdU63o7Ws9v9R2OzIE0mLNiemp979qWVhMJUuosKaxwDRpvAhO5Jm3SkB
	sbYq/wxRmN6IkznpHzAqRWTAvj/z4hBq95XQl50XW/VWvUDnIHn8N7zfIFCw4kEGA//TePxtFQ2ER
	tbczwOseZcV50KhqD2yP+FHmMYkV7/t4i5LMr7uRHfMOhQmueS+Gw+NduDnFfDL+Ye5KgeI5qk5IH
	H/loavh9lUED2o6W5vQV83RWsk2DmnCCYgdhVgL2wGVE6NYKR/z7otT0vTpLSmQCfIMGwrk7Vnkzt
	Tm1Qa65g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHolS-00000002GTi-3qHI;
	Tue, 28 Apr 2026 20:10:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHojV-00000002DoE-269m
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 28 Apr 2026 20:08:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=gK+EAT4GmZMdYdv/TPcw5cMAUzBnAuCqdYs+Qlpxwc0=; b=NefLaCP6odjWrFxg8rhreyGJPI
	h1Q3lLbb/4Iv8UdTxqhu4TNxNZnp5iCA3JPJqn2GuT5uUHp5rfU9krxcPSqqGNY8HK98WrnffWXe5
	sUtgsjOOQEKVynC/NzkLC3OcUEresBA0yjXAhivNZ74s4SOZsrxuQLpOTvt7JrYKLoQnqMqXY77NG
	kvBPtlbkAlvZmrWftWxQJEBvzqf4bmyKOUuex+K2jABLj/kkfxB8PU/hMgZtO04bnk77y2VWAqECu
	U09B+XDYDUtCCin2UHQ8nK9lt60cDMYae4LSvYhR0rzq8QZ6f+bRUuqoeA9/L9GZVUEIk0AzDPr4A
	mELus7Dg==;
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHojG-00000003ySp-3nAP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 20:08:31 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-12c7212836bso3361387c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 13:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777406873; x=1778011673; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gK+EAT4GmZMdYdv/TPcw5cMAUzBnAuCqdYs+Qlpxwc0=;
        b=VCvMqQFwZoQcfPVE3fti+FE4BcthXP0e1bKn+T2zglolcwH1aevK4RDsDab96nDmke
         1ryfwb15I0PYfDiRh4HToXkDzPCLsfgCkE03u7QLG2mzLSsjLMnGchtmjaueyAsDvCCq
         LZS4xgkXKBcBRQf7MkKKok2RRzE2CCOx1W50Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777406873; x=1778011673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gK+EAT4GmZMdYdv/TPcw5cMAUzBnAuCqdYs+Qlpxwc0=;
        b=esY051FhBkJrZHCiZQkO4Zosevj+zcoZjKM95zGa/eG32zj84Kc4BqPzddjmyR41Hl
         YJfoqhbzsYCKxB4Tqf0QypFgP0En2UWeMcpWO6VZBLXfzyhMbwHOUei4TyXkKpFsJczB
         6cg76FijDmzuCQKYFwvP0u9nAcpyX6VOpHUEicgAy4CXn/7w3wreoqQGLJQuF/Y6J2RW
         35RQHBZtRBK9OoiMYhPJxxnekjngxTBHOx7xRG1/1EW5/oemRjr8Ir8tSxlJsFjWOfS1
         L7uS6Asc/Mc0ZB9reX61o1c3VvfNbx8mvoF+A6LZAfZLmkaz7OJ86eK9wMs4hgulaW6Z
         oDug==
X-Forwarded-Encrypted: i=1; AFNElJ8y4OjTVT8EdeGlf7oFRyfPtnQdssxf2ax+vCz1f3mjKZXYmIOpKv8Ls0pyFCR/870A5QgGfoaqJYGGT3X/F8LZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzV/kTqtYvlkZFU1yFVrxCqLAdm7V3C1e7QmSxZ+PnwC0RAXcdm
	+pSgA12X4ds7j3YtmCAqdWx10D9ApXR33aaJMijtt9MrzOmDBwYtZ/dTO/HpIp8WVg==
X-Gm-Gg: AeBDiesErNB7FZBZDX5FMKUIvwLPtM4IyqtAL2PQRh+T1UiI9w5LQzKm48WFwDsm/If
	I3aJd9Vhv+5VXBIBfMky3iqgsJNK3X+vOTrzGaEJjR/Y1h9VInOnIRUqrGewBAdHMj7aZw3qec1
	4emYxi++/wNYrSPWte05o9PVREb+Wqih4AmIP4803s8Q0Hf4NJQhAbeh9mDMU+sTCpy3zSXopw5
	pMyhRm2CF/xVqWj0/Nsw6Bul3unlOdqOZVrZJ4XJy/tedua3ajZslB/biECBiiDOPx4nfrQB+cq
	YDJ7IeXb94QMzq86vCufNu38u5pbpFBjTfvJ2Ck8o7WeRoeYRhhkENjR8rKRUbSJzUEua3S+nPV
	iFTs4eWJHenz8zenql1DE2yqUzNzrKO1scV+R1Ic5gDMOzMQ0RUzUXpgWtTZefbgf8VcKZLj1Hp
	mMyW8LDU6ji4oIB62CZLyGyYtRJmaZzxfg9fDR4bqFWS0Br2cl+PKtcIG3TICeiKsMlTgUlRfR
X-Received: by 2002:a05:7022:b96:b0:128:ccaf:85d5 with SMTP id a92af1059eb24-12ddd959d36mr2219620c88.15.1777406872635;
        Tue, 28 Apr 2026 13:07:52 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:4ff5:9607:c7e5:48f3])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2ed0a10678csm3167991eec.24.2026.04.28.13.07.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 13:07:52 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org,
	Doug Anderson <dianders@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	chrome-platform@lists.linux.dev,
	Brian Norris <briannorris@chromium.org>,
	linux-rockchip@lists.infradead.org,
	Julius Werner <jwerner@chromium.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	cros-qcom-dts-watchers@chromium.org,
	linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] arm64: dts: qcom: Add #{address,size}-cells to Chromium-based /firmware
Date: Tue, 28 Apr 2026 13:06:59 -0700
Message-ID: <20260428200712.2660635-8-briannorris@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260428200712.2660635-1-briannorris@chromium.org>
References: <20260428200712.2660635-1-briannorris@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_210829_702015_1A16574A 
X-CRM114-Status: GOOD (  15.73  )
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

Chromium/Depthcharge bootloaders may dynamically add a few device nodes
to a system's DTB under a /firmware node. A typical DT looks something
like the following:

/ {
        firmware {
                ranges;

                coreboot {
                        compatible = "coreboot";
                        reg = <...>;
                        ...;
                };
        };
};

Notably, the /firmware node has an empty 'ranges', but does not have
address/size-cells.

Commit 6e5773d52f4a ("of/address: Fix WARN when attempting translating
non-translatable addresses") started requiring #address-cells for a
device's parent if we want to use the reg resource in a device node.
This leads to errors like the following:

[    7.763870] coreboot_table firmware:coreboot: probe with driver coreboot_table failed with error -22

Add appropriate #{address,size}-cells to work around the problem.

Note that Google has also patched the Depthcharge bootloader source to
add {address,size}-cells [1], but bootloader updates are typically
delivered only via Google OS updates. Not all users install Google
software updates, and even if they do, Google may not produce updated
binaries for all/older devices.

[1] https://lore.kernel.org/all/20241209092809.GA3246424@google.com/
    https://crrev.com/c/6051580 ("coreboot: Insert #address-cells and
    #size-cells for firmware node")

Closes: https://lore.kernel.org/all/aeKlYzTiL0OB1y3g@google.com/
Fixes: 6e5773d52f4a ("of/address: Fix WARN when attempting translating non-translatable addresses")
Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi   | 5 +++++
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index b398f69917f0..cd4a0e281cf8 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -99,6 +99,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	/* FIXED REGULATORS - parents above children */
 
 	/* This is the top level supply and variable voltage */
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
index 5c5e4f1dd221..58ea0532c0fb 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
@@ -25,6 +25,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	/*
 	 * FIXED REGULATORS
 	 *
-- 
2.54.0.545.g6539524ca2-goog


