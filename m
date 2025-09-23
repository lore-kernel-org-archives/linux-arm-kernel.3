Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 590C1CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 14:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OUcTQ2up2eOa5np9juHes8kBZBD61IeSVgwAmot8YUQ=; b=sDjNpqDut9YNi9cz+2zGXPvdEZ
	fXI3uZCsTmrMhTNAUFMEGVYKngXa/52cEbbYaXQnGAxrox7lgtZEoLdHRUQesBKxENOVBIdODp6Ge
	D2NrkxLdamxKjMGhxP57eC/XJGl0odqngSBebiUc/dTMl9VTrHabgXB4IlHng5+wNmAI/isFU7U3H
	UcoLOlaiBaZGZS31Fm+PdLuaDnfaWVC61nlf29c8HIxLF8S25BIRts/nmcQrh0LI2rvUiakSNQjSb
	CfesA8yaxtZwBwP2+ittJLwuTXCqOJwSSM8RNi3hOJJJo3r/prfqYx4xGpf5c24VqVLXR0QiAyAM5
	GjTevgXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v149Z-0000000DpNO-0ITA;
	Tue, 23 Sep 2025 14:38:01 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v149V-0000000DpIl-2Eiv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 14:37:58 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b0b6bf0097aso1027430666b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 07:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758638276; x=1759243076; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUcTQ2up2eOa5np9juHes8kBZBD61IeSVgwAmot8YUQ=;
        b=K5ISesdlTafctxVWjacNYSj2IIrF0BxzI+/va7SABi6bkbSy7tBfaFuVA3YTSccZYW
         fn6IUEUT9/eB+cffbDHanTTzwL/T6qeyqnfF1E0++9ns7+xXx48/E6cuURl/aMJH/nNv
         LH6qv23/YQANWhGvxDJKNgPD2I/fWzGQm/xLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638276; x=1759243076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OUcTQ2up2eOa5np9juHes8kBZBD61IeSVgwAmot8YUQ=;
        b=SOS2KFYEecbcXDWcH3JTS+PIDN6EbAXa7q9QyXPaGTCQQwKwZ7HztKDho5j3JvYBjg
         HkAFDI4M9rnATilhJyKMCgJXCktEEIne2eeozcqlsYlF4szfUET/JMCSjBD2rzZ4SWHZ
         GbTNv4ZKSFuTUdwQ52wVqMyh2x75XkC2ARpeoGXv3hYWR7Ne0vqiwFi1vrFGxZSTEYqn
         sK1dMP1oTycLyl6vfeHg9yMytYI8qdj4P0xlJ2YKTbow52YXE+PWX1pIpoafablMS9Ir
         ohh+Z9lEBvU6pa+AiyKTXXfk+fdr70dF+FNEQ9lQORTTyF0UGy8hqdR9qiRWufX2lsr2
         18bQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQK7ivLUkbhgK6BVJxeIHoWkPG/AEaMBXksC2pmyZ1CsbBYatyy+dV3XuBvRBGW+N416YDiL1bPoP+D9sQ4sj2@lists.infradead.org
X-Gm-Message-State: AOJu0YwNgs7FfPCUEZ8DD1mZPuKJ4ViJwDYYry+rnBe7i8XZD9h5S/5T
	8W90N0D4ZqEq/vm/y+vb39u9zm/fKyr0Go+pgEfnHEvpBKt7uqf45lALElrJrzoFgq4=
X-Gm-Gg: ASbGncvEyue5aY+fyDIALXs9K4jBgCd0/ziaaOSHM9DTn2RIbwjdvB7RaWA/1cebonR
	weFxBTVOkDzcie8nh1ISy520FTgQ47Lssh961CkMycKKK2etGlxKPSLYN+vb5X+GauGoGmM4plz
	dImx058ro+ldetTH6SMzkGIQ8TYnVQZ+d2ztgWVPyPC2SNzCzyEgQhlpopHBy0z11JBQQ8MsEly
	LX6tMja/IZb0YN/PIOfkVyCQJrL+O0nIeimiSn5jmJhyMYu35EBWo1UjIzTDBB/z3l7sIa/xRZo
	4z+dhpuirPlMflK3ZZ18w4XNKDFB2NpCkZYwmXGCbbz5w79Fm7tbac1tfkb3XP4eTD3pPtENl0Q
	ZFZCbuWf7ysfrwIuY1tzxvUDTPbkG2uulPkOsuQXXhgFvoy+PgLr5aP+mYj+PFyXLOwTVQHhLvN
	dKb2kBQGPXs6Q0HGurZGt6A+EBQ2Qq0YDGIW4KsB+9eXCXHjp3tAcLBHx9eQ/STmu6
X-Google-Smtp-Source: AGHT+IGDPnG7HtZZOzHzDzOnTvQCbphPIOssxaWdLijuYXdOKqbHAb1gXG6TbG+I7cy+yOigXJi2Ww==
X-Received: by 2002:a17:906:f58a:b0:b2a:dc08:5914 with SMTP id a640c23a62f3a-b302ad3922bmr273199066b.45.1758638275808;
        Tue, 23 Sep 2025 07:37:55 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2a2a5f6c7asm665204666b.28.2025.09.23.07.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:37:55 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: [PATCH v6 4/6] dt-bindings: touchscreen: fsl,imx6ul-tsc: support glitch thresold
Date: Tue, 23 Sep 2025 16:37:35 +0200
Message-ID: <20250923143746.2857292-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250923143746.2857292-1-dario.binacchi@amarulasolutions.com>
References: <20250923143746.2857292-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_073757_591215_4FA75350 
X-CRM114-Status: GOOD (  11.60  )
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

Support the debounce-delay-us property.

Drivers must convert this value to IPG clock cycles and map it to one of
the four discrete thresholds exposed by the TSC_DEBUG_MODE2 register:

  0: 8191 IPG cycles
  1: 4095 IPG cycles
  2: 2047 IPG cycles
  3: 1023 IPG cycles

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v6:
- Rename the property to debounce-delay-us.
- Update the commit message

Changes in v4:
- Adjust property description following the suggestions of
  Conor Dooley and Frank Li.
- Update the commit description.

Changes in v3:
- Remove the final part of the description that refers to
  implementation details.

 .../bindings/input/touchscreen/fsl,imx6ul-tsc.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
index 678756ad0f92..a99280aefcbe 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
@@ -62,6 +62,20 @@ properties:
     description: Number of data samples which are averaged for each read.
     enum: [ 1, 4, 8, 16, 32 ]
 
+  debounce-delay-us:
+    description: |
+      Minimum duration in microseconds a signal must remain stable
+      to be considered valid.
+
+      Drivers must convert this value to IPG clock cycles and map
+      it to one of the four discrete thresholds exposed by the
+      TSC_DEBUG_MODE2 register:
+
+        0: 8191 IPG cycles
+        1: 4095 IPG cycles
+        2: 2047 IPG cycles
+        3: 1023 IPG cycles
+
 required:
   - compatible
   - reg
-- 
2.43.0


