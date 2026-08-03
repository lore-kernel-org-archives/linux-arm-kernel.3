Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6282BC55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 07:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hx6mTKuXWw3d477PSiktf49/edj4ItsDaCK8YLkJo3A=; b=jn3b+QylEpKjRPxDWAcX8IG1F/
	WrfyeAYknASK3QDQFSINskOmNYNHKN5nY/L4HL05+O37L3cUUVRRg8MW51oBm0CktJ1PzbaNLtiXG
	ddXIOZqJ3ooSapiINu5BdpT3DZrIiyjrvpCgQh2I7kGGdk4T6oOkwJWxLL4CkmJkgL8EQSVH0scHp
	73KgWklZMDEx5+zl3sXfZ7MTJYUDzvD7tt2fxAAin/IMV3xjEtbhhYtekkD6qyFAJN8lQ7QLGy/Sh
	WtHHseZSY7rRpaMgHVKWTjG/Yo9bzRY5IBEfmTqU3vmgOtG58ENc/kwzy7hAxZL9hyFwvop5WR/ko
	Nm0hyUeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnVT-0000000GZGq-3dyy;
	Mon, 03 Aug 2026 07:54:43 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnVR-0000000GZEx-1LbY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 07:54:42 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-47fdd674e17so603238f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 00:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1785743679; x=1786348479; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hx6mTKuXWw3d477PSiktf49/edj4ItsDaCK8YLkJo3A=;
        b=nw0xf9dPEGT9hDRYmBmDLSMmjo/K5PCmc7C8OTx8KHqDc2VM2EhFMdACIrzEcDu8/j
         vIDk6aU/sk5qgE3rPcn9b0xf6kmvdImky3P/Rwa2G45S3BUfkf3p35MrzHxX6c0aFxaY
         DttsmmI2MHPivH/FbHrFcPbNJR1+XX0a2iRZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785743679; x=1786348479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hx6mTKuXWw3d477PSiktf49/edj4ItsDaCK8YLkJo3A=;
        b=WAKQBRfTnjgUXwvgxmtaQ1yM+hZ0zY4UE1unMfoshTF/CQJXD+OGheL4XpYO5K/5c7
         kBoRQdWuSoh6c02MKg519k2VlPPuWH0UWVJtc1E7lVpaOom2584iXx19HyIQ3AJ8NCC7
         5ym+kRstcBJvhoj+nNsRHsQr8q4BwNzrAsGzVjTVJqXWNvakRKNiSB432gJ9+d71JACE
         icz8/1ANXu7PGWCul5AxmJl2e5jCV9a+pTdJC0I3pXq6prDD/S/oR6N6w9OPcDrCgK9L
         qa8oKrEEpyM6ZlMS+7/Z/mBD7Imu6lxRmMWJ47SOOrrdL1vT6sO2yfNWJ8odVGfh7axO
         S6aQ==
X-Forwarded-Encrypted: i=1; AHgh+RrpEjTWcFAyvv1bHyYyV/kDH3RQXQps0zSUcWTCDXVCuUJ4OPoTJ2SWn2KpS8WaRT7DSk1QQZynd1haUWR8uH/a@lists.infradead.org
X-Gm-Message-State: AOJu0YxNC8Xq8LtZJddpte5+zygBQ4qBI6dj70nQmZVzz/Cdu99Z2HDX
	oI4qmtSG3oSVUPja5qc05Z5xns4hStUc15ZFjSXAt0q54CT0QpIvMxTI5q1p1NomM6E=
X-Gm-Gg: AR+sD10G0kMT8tW2FjIGpK5JQIQW4QmRP79lpg5NMD4k2uWc+f+uWQMR9/qXBkmn3Ha
	iqXashLf9/nIkN8Im1DxtQH8SiaEyTYhXDbOfgQrWvK55QjzAXzIdmo9V02CJhStzw8cUsvWFPE
	cXMeLKVDdlDga5HFymqoFI5RRxYQrCDa2D37kQ3+tnRShD0mkgSa4EINuejeQK5syO+S37Pt9zy
	oZvNZGiUQI6HBlQb5sjFVT1m9m5tM7K5LArtXUNUT6V+SljrH1a3bEdtVJ3Jg6xr6D4NrLqz6E1
	HqeBOKqvibnduHtkl1A5JAy05lc3t1c4KzTDvOkbV/BUm6n74bflh2/dUBdO5RRduAS/BEt8F9P
	S34xm85uN/wNIVwrQG7q1p1w31BA7Y6co9tvIUV+5d6D4A6hpTKSK0BKLwfAyTgdJB0Bh28g6Gx
	mDsZ4foFaqDwktFmHAvdqna8qs5krjzO84hda8N0b/ArNULRiEVfJu7btayW5nz2QDY9gMALjYB
	gfkV/PkJmElVMs1HDFGn/u5zL1uzxemfK09RCQt4vckbxTZMZgMEkqS93R5RfJ7/Zupi66hw0u+
	M6Dtg9a8+I0SGMaQlZJVQnhGH5Y/Dm4QCQ5zikLSusHElO30aV4dThgJm/JItbx1
X-Received: by 2002:a05:6000:26d3:b0:47f:8fc8:a8b1 with SMTP id ffacd0b85a97d-47fd72d3112mr22031528f8f.14.1785743679359;
        Mon, 03 Aug 2026 00:54:39 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0c8bsm29411990f8f.34.2026.08.03.00.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:54:38 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RESEND PATCH 2/3] ARM: dts: stm32: add missed arm,num-irq-priority-bits for stm32f746
Date: Mon,  3 Aug 2026 09:54:27 +0200
Message-ID: <20260803075435.3825122-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803075435.3825122-1-dario.binacchi@amarulasolutions.com>
References: <20260803075435.3825122-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_005441_387122_BCFA4D1E 
X-CRM114-Status: GOOD (  10.30  )
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

Add missed arm,num-irq-priority-bits to fix below CHECK_DTBS warning:

arch/arm/boot/dts/st/stm32f746-disco.dtb: interrupt-controller@e000e100 (arm,armv7m-nvic): 'arm,num-irq-priority-bits' is a required property
	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,nvic.yaml

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/st/stm32f746.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32f746.dtsi b/arch/arm/boot/dts/st/stm32f746.dtsi
index 208f8c6dfc9d..82912cf9c4e2 100644
--- a/arch/arm/boot/dts/st/stm32f746.dtsi
+++ b/arch/arm/boot/dts/st/stm32f746.dtsi
@@ -721,6 +721,10 @@ usbotg_fs: usb@50000000 {
 	};
 };
 
+&nvic {
+	arm,num-irq-priority-bits = <4>;
+};
+
 &systick {
 	clocks = <&rcc 1 0>;
 	status = "okay";
---
base-commit: 075b74841bd0065a3bda3440873c747938e69b68
branch: stm32-nvic-irq-priority-bits

-- 
2.43.0


