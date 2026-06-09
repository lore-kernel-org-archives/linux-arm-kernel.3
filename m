Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40DFACD98C9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 17:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LO818/ID+4f5iFNHp7OoRCd/tE5378VXxX0IuTr0NL0=; b=jRg3TSMCU0piaqxQiAq4Cs6gvh
	lSz7o4M6m38oBEb9tVcXZqNYQS2gQN0CFrFCB0UbtemJ/9gS/ggkJ3b/tzMqz+Dqey5Cy1tQqp236
	8XXFVYpos47Okb4LWHLZzGMA5GTaTjwVliNY3WthJyJp4xj7CBALP2GINgz6kmT/HCpXkbpz5i6kZ
	jy543MqGhkN5K7lhV1rjPlzWKBwWTxq4gs/UP4KZ4rfbRIAwXSxQ0f/113FvmjsNf+rWR5+AVEbHZ
	dyWhf531aM8yndWyPet/+VsLL8KpMTQLmVN/I4mVnNL4GHerDI8kk2MPfu7Ewtl87yCwG4g15FCVI
	0svWGzuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX0QR-000000068Pf-2mjk;
	Tue, 09 Jun 2026 17:39:43 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX0QO-000000068MQ-2NkV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 17:39:42 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-490b8a97b11so64460035e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 10:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781026779; x=1781631579; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LO818/ID+4f5iFNHp7OoRCd/tE5378VXxX0IuTr0NL0=;
        b=InPjD3vvz9e7fscytSyh8H8PmSvO1BRn9g3+SoMjY+txflRhCsN56X1+Ag98tLie1E
         UTPR5HOKUesJnTkMp9gQqQTQQfB7ieObBkuwlbKW1xue/J+WYxUd9NpDcRJjU0o9A4jg
         ATLt+8telKI+U2l43mcSSKkxbeifx0bEN9TJ1NYDn/uc6xbG6qpisakaitvp5Bafya1T
         yp8iJmnVnoutar0PP/yM+m82bfRsh0DZhdIOFqYeJKz4Ci8qfv0dNQvVgifEyr8haiXn
         9cyH4P7wTEvUleIgQ1tXmTIylbeQzdVxVyIcmo2f4bvUF8huehxW8DxzXdQmpW5FTMeL
         8QVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781026779; x=1781631579;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LO818/ID+4f5iFNHp7OoRCd/tE5378VXxX0IuTr0NL0=;
        b=DaTszpTZ6tPgG6kISWJSBB/eJeNYv/1HkWqydBICJdWp/5GTvh+URqI0al2n8YerTQ
         nR8YD4m73xHKhX4l1Mj+1MpeF/WEaHWcpl6ZXbmcdflZBJFL+lr6PY4mTaEtG6YMLahh
         rwLQJqf5JpfZqrlRUCbOGzfalgoGm8BJas5BtnYUc18fIJENgOooubpoNv901zibVQRp
         i12DYPLCvWl7Ym9wcGgqeeC8dqyeMWC2rVtIfouKN73wMlXL+15N6meD/sIfW/55WUrJ
         PBJWgExVX0sJUXy/qNYq0oHPt3hVRoBaIjwv2tUcnYXgyuWHxlawcCImNtOjFjs+huvl
         od/w==
X-Forwarded-Encrypted: i=1; AFNElJ+a4/m3hXNM0NOYG6YUpT7cn1JzgYe3pL7i3LWJaQGsPDSNLEZcbWRO6wDT3hnDsETTc8Y8KPg22k9T3r1hoo1U@lists.infradead.org
X-Gm-Message-State: AOJu0YzIgQ7jIU/pntySGrWRfn2fIYAXz3kt7mrnJrH+DnTA+6c0A1iB
	JrV5h52Jdq9JnEkHizzEsPIz0Xho1IC0W4bC6WWlfRirCOa4cKQVPvHpi/EJosJ0hy4=
X-Gm-Gg: Acq92OHT9GEHhECFEFXUIHUBJXL0T8JU5Glw9duFfeFxm7K8HmecaDjzmK7IU+R3CLL
	Ex//Rs3Yrxnj82uxBSZ2DRCu4eiGBCJ3tX//LuoWzJjt9sjWCOK8PDLszIz7sH2IE5i9rW1rk4D
	drtq+SP5UnOfoo3Gp5Nq291xzJrOeW2yFONC/Y1QtcdUcb/WQDsKvVCsdOaG4VHwQTpA9rmKaoe
	7BvFficOwaof3kDP/8xUhtjVnDoVWBiiNtnWpDBHV5lRXQpGmAqKKdg4BhNrfTBkX470gVACHYG
	y+1Nz4+gKtu43FtnMKzyy3JuFZayBb+DHGIotu79k1dBBOpH7VDwRfge5AdD3z0HpUlKcaFy1mL
	MX9cxQR6Qf5sVhS/1uF66ACJEKiJ/tldJHQLrU/ebehYSyUUZ5uQLUSVaSepcuQkjYyAy4yD59C
	uopIQ3XeZboftx6/sTCBnjRgrY6eRVcxY8+BUhKHbb0YwpskmPm4A/eLICXJacRtVqL4sDmLABA
	TbPoFcDfyUBJ3brnAPXn9ImczE=
X-Received: by 2002:a05:600c:a011:b0:490:58ef:cea7 with SMTP id 5b1f17b1804b1-490c25ee058mr358565295e9.22.1781026778657;
        Tue, 09 Jun 2026 10:39:38 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3fcf5bsm593605215e9.9.2026.06.09.10.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 10:39:38 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 09 Jun 2026 18:39:28 +0100
Subject: [PATCH v5 6/6] arm64: dts: exynos850: add PMU interrupt generation
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-exynos850-cpuhotplug-v5-6-8422cf80d43b@linaro.org>
References: <20260609-exynos850-cpuhotplug-v5-0-8422cf80d43b@linaro.org>
In-Reply-To: <20260609-exynos850-cpuhotplug-v5-0-8422cf80d43b@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Henrik Grimler <henrik@grimler.se>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_103941_187034_7E91E526 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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

Add pmu_intr_gen node for Exynos850. This hw block is required
for different power management routines like CPU hotplug and
different sleep and idle states.
Also reference this node from main PMU node.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 3881f573ec08..04662b1c5458 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -214,6 +214,7 @@ gic: interrupt-controller@12a01000 {
 		pmu_system_controller: system-controller@11860000 {
 			compatible = "samsung,exynos850-pmu", "syscon";
 			reg = <0x11860000 0x10000>;
+			google,pmu-intr-gen-syscon = <&pmu_intr_gen>;
 
 			poweroff: syscon-poweroff {
 				compatible = "syscon-poweroff";
@@ -231,6 +232,11 @@ reboot: syscon-reboot {
 			};
 		};
 
+		pmu_intr_gen: syscon@11870000 {
+			compatible = "samsung,exynos850-pmu-intr-gen", "syscon";
+			reg = <0x11870000 0x10000>;
+		};
+
 		watchdog_cl0: watchdog@10050000 {
 			compatible = "samsung,exynos850-wdt";
 			reg = <0x10050000 0x100>;

-- 
2.51.0


