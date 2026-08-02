Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B116EC55171
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 14:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y3oOyzEJqd6PpLuVoK+OLiYrq0YcXHeXdEUT4Q8GRzQ=; b=oV2HKvGDM1ijw8Lc7kh6QuIOKC
	ykMHWnrORro0Ryrlj9uzCRH9ssjmRvwnS3zzHuUqNRzT/Dg5oino35TSNg5NAn3D/32Ap1r2tYOz+
	WqhdsAEP/pH0oxv1mWkWxpo3JOguOJDI964LS55EUBxBYpCP+nZypGR0vUG5+TtbKK3oHcGbRts+s
	1WM7sBgag2RBi3LvO41GBtGJ8aMm9L9/nileu/956dRWKpej0+ybGBCL3DPqZxN6b4Fa2+xaGhl+S
	YmIIM6xxxMpc+3zCmLJq7WD1779LHouOWOJZieOIZPVRMOZYqhjpCrmOnJ/1T6RYF+wAa9tSoRILF
	TfUTKzZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqXXA-0000000FjJS-3YVJ;
	Sun, 02 Aug 2026 14:51:24 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqXX7-0000000FjH9-3ZLa
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 14:51:23 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so13114625e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 07:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785682280; x=1786287080; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y3oOyzEJqd6PpLuVoK+OLiYrq0YcXHeXdEUT4Q8GRzQ=;
        b=QSkWgFXyrmMMt77+i3roJHBk7oORhfHQg6rT3JLSG4AGoSOVwmCjdyZiQpbh4shf7Y
         J8p6XqjL4IZRwJ/CmWhDxjqMuSeu3mUlfky6KANzZS+W9dhA90dO/HPN5JvEkeB/6NQr
         /GaDIY/ZwBkPxCHs0xupm4pxz0dZfzLgnRZNgE7L95v1Ztzbx5aFVUT2sahr9vyHMD4G
         mw9efX7EU9EWg3UEfTNXDwmyZBZdySO4zB/Fw7D/Q9BeWpS8W+JCYbjdO9IKpsRm25Rp
         s4x1yp3YGGDgq6fyPznUIbzY/EyLwWc87MZUYjzLgeKjcNw8P9rVVhGk3ugwahxq8fz7
         5TLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785682280; x=1786287080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y3oOyzEJqd6PpLuVoK+OLiYrq0YcXHeXdEUT4Q8GRzQ=;
        b=cfY8utMQMau2VscHZtMThjO6BQ/77gF4LV2ALRAUDbKW//IacMVT4w0miM+eccS85e
         QEzuxfi/5VvaTawAWYMweG0icgdap75GrN1d2Gd8vJ7tR3b0IVrfhSWbSaQFwmypCp6n
         6QZ07xMWJ/zGBhwH+WGlFk3mshtf68UCeb6O9HXVEuEd8PJB5zWLzRhqklwH2uqbVK+E
         ErMarpk2BoEPHKKobpU/HQhuIZK5NB9uyOFCPz2qB6dS502oV4ibsAcL6TpeqpKTMZqf
         WfLIsxsstzVIzU4DUkajEBf22gBsJHgNed7yzUfvb/BLRTE6i3BVbQCCZs9MY7DFKN/p
         Ogcw==
X-Forwarded-Encrypted: i=1; AHgh+Rq1rjvULvbtJcr2l84rz1nwo1opPAzRWUgwn0EXtq9a0Ql2TuOvUi6NbzTzPfeYWmG7q3aUIMtC4PSpnxL96AUe@lists.infradead.org
X-Gm-Message-State: AOJu0YwjKI2Md8GHv/8V95eDrk07q7niCzeoH+YjgTAAomYesdB9uW9D
	Vli44Ur26TdOc/VQNSIPC2yoxC+KVtMgXlPgp8UFgoJxBOMvLxo0VsoL
X-Gm-Gg: AR+sD10Otzb4YUAAiu8+T3ipMGrw9EfQmS4cY9k9l6gezZC7qGxWCidbubKJcaM5n6o
	rbQ+2hxpS0baoYnauGqJTEN9Um6eRndbecUz1inoJXx/X5kG8vAiQozzZJ8/ZlrnybxM6GAa+1G
	6G5jsR+Qc0N4yj8CO89pbtSTfjJjWTq9yJ4uzBTu2xdNm/e906Cz9SrJwOMcgmWVx+vrxi7DNFI
	xfTJKBXFYhkP0VAkHEsy96cOtYb9qRVwx3RXbWswkT3kQt4ZXWWvclBPZKxxXrbOTEp5Rsdiy6c
	d6FJDa5MefbJim7X8oU4Ov6FnLvSdqf5EHInWoUrK8gmbMcsz92Tg+lKCpatZ/dvBA2UslW+CPk
	diO2WeMjQWt+d4RIfb/5Y5Wg3Q4b1r0oIYvTqnylR0WodEOvP4tpWZ5MU5Ero3fSR/BHGtlwNLL
	qsApiS1zGbqKSelExLZ4Wvr0kSLWMHttB64p/MMSqSBc1In+vkeMZAinJs0nqTrsWXW6lX+uC2q
	MbOLtzmdWUZq0dl6a4FJORRoCpowuyBgIvhJAKWEq6mCUwpRrbqmwpvKlHeQLG84wdJlSP60smi
	GwPKZWZ8wREiXF7LrAjg8Yd5BnyDA229ydlj7KJi5aLMkvnwmXMZkQ04kQDwcNcYInf8wn0ZRLe
	R7atSyLO5gYfmimJPT46wKm8Iv5vKwOfzkQ/8UWUj9i/DSmVZjK6qMoSYV3EBmgc+6zoTK8Q=
X-Received: by 2002:a05:600c:8b33:b0:495:779a:ed33 with SMTP id 5b1f17b1804b1-4980c66c798mr151895165e9.7.1785682279780;
        Sun, 02 Aug 2026 07:51:19 -0700 (PDT)
Received: from cypher.home.roving-it.com (1.e.2.e.9.4.4.d.0.e.6.8.9.8.8.3.0.0.0.0.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:0:3889:86e0:d449:e2e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4980878dcb4sm234526335e9.13.2026.08.02.07.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 07:51:19 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Andrea della Porta <andrea.porta@suse.com>
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH 1/3] arm64: dts: broadcom: bcm2712: add arm PMU
Date: Sun,  2 Aug 2026 15:50:52 +0100
Message-ID: <20260802145109.728793-2-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260802145109.728793-1-pbrobinson@gmail.com>
References: <20260802145109.728793-1-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_075121_901174_211BDF2D 
X-CRM114-Status: GOOD (  12.25  )
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

The bcm2712 SoC in the Raspberry Pi 5 has a standard
arm performance management unit that aligns with the
Cortex-A76 cores that are in the SoC so add the details
in so it can be used.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com
---
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 9b36ecd7bba54..ae1fc9d728c00 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -10,6 +10,15 @@ / {
 
 	interrupt-parent = <&gicv2>;
 
+	arm-pmu {
+		compatible = "arm,cortex-a76-pmu";
+		interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
+	};
+
 	clocks {
 		/* The oscillator is the root of the clock tree. */
 		clk_osc: clk-osc {
-- 
2.55.0


