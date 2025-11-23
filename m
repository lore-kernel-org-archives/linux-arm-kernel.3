Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3DBCFD312
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Nov 2025 00:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5InH4LAtl8CDeHrHASMmG5Sayd0VJhxUyZTTym7Ptqs=; b=FPLfB2YTdV1GkuXjF+aqbya5+i
	6mCJ2gyhbj3I5lLoJ6I1QptQA240bydrSeJ2juztkwRgDbJK8zyQaw3eIT+ASOR4iEbiIE4HgPCMA
	9j57m2Ct6MWkhvh3qm/ieGZ5hKhD5dVp8HuSueedDtozSJA6rqhJn467KC8sD0jypQtC8G3oUX1ps
	EVzOfezEWEdsPZgyFPwfumojx875oaorbGdOudYHIRgaBnkvOcdTf1r4ZojQXfXi2sFJy239uWXhU
	wMw1OPHy1ioL22/f5sF/nn9EwZXyOlAEO3iOQSv06b/ygxtBOoBlc9mSKMssj0jnDYfLUZ07iQj2b
	H+lSD2SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMy5Q-0000000A07p-0RQ9;
	Sun, 23 Nov 2025 00:36:16 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMy5O-0000000A07R-0jbL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Nov 2025 00:36:15 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-8b2d56eaaceso327399785a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Nov 2025 16:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763858172; x=1764462972; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5InH4LAtl8CDeHrHASMmG5Sayd0VJhxUyZTTym7Ptqs=;
        b=hl3HlFZ3UV3nkyVgI6MsUQa+jZmN8WllFv1A1+aq3c2lF+W4jhVt5DeSm7vUC7+e5I
         eEomAiWnu3S+cfpL1o2rggrSx2e0fpGRV72zG6gEzKnOGPFYGXo3Z8A11kqZKs0CPRFm
         LBnkOOdhgP+2Mz08SJuUaCApUxJMHEhCmjXrEwuXXrqJjy4TtJQL6D2yNtC9Jw8qyvFD
         1PG+lyQiYwiK8jLLofC6p0QOkrNbPFHRCUuN6eLkWNJ3WRmKPvcaC0fEG7mTYfYDAxY5
         rZXSOpRvQHBjKVmXHiLsCin4r/HCFMStDJAG5p5/MeUoj21mSn9cBP73vFHfPn6lAj0I
         qNyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763858172; x=1764462972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5InH4LAtl8CDeHrHASMmG5Sayd0VJhxUyZTTym7Ptqs=;
        b=nNQ4VukJyk4Cdz+uvmIzn8wMJxbobbxvWORyn00xYlludTlwZaY0ZtTyuPyKaWCo23
         NdEuNc0PlSJUorw3gPBzRBlgRWstnAKPlECMfSfzBRvzOk8YTpIaB3MEocBAYXtFkvWy
         vt69+E7q8nlYsCXL6iIWlHkQOJncobwXCp+ovOJQexrbpDOOOvAaP6uw2mc+KS8KYyy5
         bHJlGEjXmMs5DFrlImeObWZQD/kV5ugx2XJHKI2Eg6OnawYq2tXbICluK0Vfto7GIlQM
         0g+j7zSbaPOAC4x2/RS6jpf1qPBCraDjP1bpyDgH5ZICtwAI4vl9O3OE/MVvcryLL1jC
         MjwA==
X-Forwarded-Encrypted: i=1; AJvYcCW0YeIwHb/h3In8JL3pU8KKky7C3BKzTgRNZyG024yBbOxSkTzNh2iz8iqj+Y5zrsG4qbExQdWcz07YNFI8wClP@lists.infradead.org
X-Gm-Message-State: AOJu0YzwPrmvVv1KAO+SJY5Ly8Mvoi1GohGulbvn8I++AHovg5h6gS/H
	dVPQOfC/EfH4bbquOf3eFAvvWAAkBSGTP4SqvT7k2oowAruRRgpT0zof
X-Gm-Gg: ASbGncuAIGQEycPvRFC3GZCvYrwyG0U0/qqJIrV8erDvLhQZHQRV1GsnnnJboM+hyKx
	QeQDaXkM2xuCDe5yvgp8uWhAFFdiD64OCxa10LyCRcgorB2Ymnkx1vdGW9cX4xWwc5BZyYw530s
	P9KHeRFzroq7KFFCp4n4kC5g0sxDvZ4p1zbmVXa3PxrSiPy0N/MYkXSqizVRMYBYwdDvF01BcFT
	2mHnpZ4A5gF3ZlF33rILBSc0qG/3iq6DOmva6a4lGUzYKeOrqk4lciED5JE2e/2i9Td9edeXSm2
	6VYRUWQF+H5Q3gbRQHZvhO4MJ2WFOY8fT5TrGtPBaKoMvodzG4R5gDiaaaetVQYTNGYdJhct71V
	ZjxAbRWXb9MW1nVY6HxfhUvRBJYAHOT/lBmd+mK0UtRxEgsrTU9BUToq9loT16QN3iuEtckh+W7
	Hk37mRNRlpngoCtmtWmx3Wqdu+W1vUIWk=
X-Google-Smtp-Source: AGHT+IELZ8fwCDzMQSnKQNoR9E8KUcPXJ16Bu9cxH/L+PxSpCHeZevHF26bxZFfiNniZZE6RK9ZCPQ==
X-Received: by 2002:a05:620a:4611:b0:8b2:dafb:9089 with SMTP id af79cd13be357-8b33d469027mr939724285a.67.1763858172372;
        Sat, 22 Nov 2025 16:36:12 -0800 (PST)
Received: from localhost.localdomain ([142.188.15.215])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b3294336besm657943885a.19.2025.11.22.16.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 16:36:11 -0800 (PST)
From: Rogerio Pimentel <rpimentel.silva@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	krzk@kernel.org
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	alexander.stein@ew.tq-group.com,
	dario.binacchi@amarulasolutions.com,
	marex@denx.de,
	Markus.Niebel@tq-group.com,
	y.moog@phytec.de,
	joao.goncalves@toradex.com,
	frieder.schrempf@kontron.de,
	josua@solid-run.com,
	francesco.dolcini@toradex.com,
	primoz.fiser@norik.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rogerio Pimentel <rpimentel.silva@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/2] dt-bindings: arm: fsl: Add i.MX8MP FRDM board
Date: Sat, 22 Nov 2025 19:36:02 -0500
Message-Id: <20251123003603.246399-1-rpimentel.silva@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251122_163614_246997_3D08F15F 
X-CRM114-Status: UNSURE (   8.42  )
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

Add device tree compatible string for the i.MX8MP FRDM board.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Rogerio Pimentel <rpimentel.silva@gmail.com>
---

Changes in v5:

 - Include Acked-by tag from Conor Dooley

No changes in v4

No changes in v3

No changes in v2

 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 68a2d5fecc43..960c0ce8d128 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1099,6 +1099,7 @@ properties:
               - emcraft,imx8mp-navqp      # i.MX8MP Emcraft Systems NavQ+ Kit
               - fsl,imx8mp-evk            # i.MX8MP EVK Board
               - fsl,imx8mp-evk-revb4      # i.MX8MP EVK Rev B4 Board
+              - fsl,imx8mp-frdm           # i.MX8MP Freedom Board
               - gateworks,imx8mp-gw71xx-2x # i.MX8MP Gateworks Board
               - gateworks,imx8mp-gw72xx-2x # i.MX8MP Gateworks Board
               - gateworks,imx8mp-gw73xx-2x # i.MX8MP Gateworks Board
-- 
2.25.1


