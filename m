Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42A4606EE8E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 10:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l0OHEiYu;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=SVo8vv/G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dS207nY+vKk8rnxpzl45dHmOZIC6VTVoDl1e+9+ycpI=; b=l0OHEiYu3VMz0n
	U8oQjrPhHozU806b5D9XNiUStyrhw2B6No5yQoJVoJJAmPRZDVZYt5kd51zX0yVVpiwV/PEEZx1Xf
	urxsEQSLq5lcLkDGDXKouY0kTZZ5VF3Db4w5TsjWVb9G4J20WrHdXlwYNNM1v6nGBn/jHk9Z6eUeW
	7CtdE1vUd5nHg/k6saDCR4EoauxwqPg6dvgQ9Nk6CRNlJ0mNJkOqmjQJWWS/izehp8OvKwezT8hsi
	i9NcpgDIo4toie5kpssSpUtmTHDX0O2DeN6LW941NssTfOz9pzSjDZaCsVEOBIQa+tBzqs+d7Iykk
	4wONoN4OSy0KWGR3NFww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHTb-0000000C0F3-3fR7;
	Fri, 06 Nov 2026 10:47:19 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHTV-0000000C05m-3XDm;
	Fri, 06 Nov 2026 10:47:15 +0000
Received: from surface-pro-5.uibk.ac.at (ydWLT-U1-3-167.uibk.ac.at [172.25.3.167])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6Al07I1953426
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 11:47:07 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6Al07I1953426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793962027;
	bh=dS207nY+vKk8rnxpzl45dHmOZIC6VTVoDl1e+9+ycpI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SVo8vv/GKms+n1faf6VXArc34kbT40bmzWU+cpItCaCxFgc/IjgHVqwJUyvZdi80K
	 Tf1wIDVJZRpyYQpYgmCO9KYfCou70gY88OeW+Ej5dFXbQXljBkYlCXvZM4+KphL0Yq
	 QSHq3PNhQ/fWkoJRLhJYyuJDpqQxIyx1uAMX3KEo=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 03/10] arm64: dts: amlogic: meson-s4: add the PSCI CPU idle state
Date: Fri,  6 Nov 2026 11:46:52 +0100
Message-ID: <20261106104659.54656-4-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_024714_620080_8F9912A4 
X-CRM114-Status: GOOD (  11.46  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

The firmware implements PSCI 1.0 without OS-initiated mode. Add the
core power-down state the vendor kernel uses (power state 0x10000).

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 24 +++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 675db02a8d5e..57270fbfb4a7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -22,6 +22,7 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a35";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep>;
 			d-cache-line-size = <64>;
 			d-cache-size = <0x8000>;
 			d-cache-sets = <128>;
@@ -36,6 +37,7 @@ cpu1: cpu@1 {
 			compatible = "arm,cortex-a35";
 			reg = <0x0 0x1>;
 			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep>;
 			d-cache-line-size = <64>;
 			d-cache-size = <0x8000>;
 			d-cache-sets = <128>;
@@ -50,6 +52,7 @@ cpu2: cpu@2 {
 			compatible = "arm,cortex-a35";
 			reg = <0x0 0x2>;
 			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep>;
 			d-cache-line-size = <64>;
 			d-cache-size = <0x8000>;
 			d-cache-sets = <128>;
@@ -64,6 +67,7 @@ cpu3: cpu@3 {
 			compatible = "arm,cortex-a35";
 			reg = <0x0 0x3>;
 			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep>;
 			d-cache-line-size = <64>;
 			d-cache-size = <0x8000>;
 			d-cache-sets = <128>;
@@ -82,6 +86,26 @@ l2: l2-cache0 {
 			cache-line-size = <64>;
 			cache-sets = <1024>;
 		};
+
+		/*
+		 * The firmware reports PSCI 1.0 without OSI, so the platform
+		 * itself decides how deep to go and the kernel only has this
+		 * one core state to offer. The suspend parameter is in the
+		 * original format - bit 16 asks for a power down at affinity
+		 * level 0 - and matches what the vendor kernel passes.
+		 */
+		idle-states {
+			entry-method = "psci";
+
+			cpu_sleep: cpu-sleep {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x00010000>;
+				local-timer-stop;
+				entry-latency-us = <4000>;
+				exit-latency-us = <5000>;
+				min-residency-us = <10000>;
+			};
+		};
 	};
 
 	timer {
-- 
2.56.0


