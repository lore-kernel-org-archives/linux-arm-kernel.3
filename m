Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E722D6082BC2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 10:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PiBhgG5E;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=oncnZ1qS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=82iJO7WRa04zutkAoZphTeLb3e8+2bJ7l1tF4w09Ihc=; b=PiBhgG5ERKWuEe
	8OlhyPsJS0nV+aiZN2qf+oO4A02vgCoCe0sYEhvHBuMwB7Z+0E9E4G/j+/EnrBURUalZaG+9hYIzL
	gXa+biWOSoqVllhYon6kOEtyocEvC6810EEDSRqZyCKBV4dMEFR8jgNS2eV/n7NrM2WRT+yjsn9oD
	gBnmKADryCchdG8pLhyKkHO4pzgkupV1JXAaVmfkPEh+BOIZZV5jdwfA+RnEQN/ceEypvseZ2P4z7
	sk74/Sv602hW0Bl9l5+DgLc+QtnfpZpUKO+vbF3CCCCwasSSKObSKp/7xgMxQIoQ2Kf6IumCUlCSW
	wRvYhjrKHilQhRT1qvsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHTd-0000000C0Ic-1qGn;
	Fri, 06 Nov 2026 10:47:21 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHTX-0000000C05r-2HwA;
	Fri, 06 Nov 2026 10:47:17 +0000
Received: from surface-pro-5.uibk.ac.at (ydWLT-U1-3-167.uibk.ac.at [172.25.3.167])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6Al07J1953426
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 11:47:08 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6Al07J1953426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793962028;
	bh=82iJO7WRa04zutkAoZphTeLb3e8+2bJ7l1tF4w09Ihc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oncnZ1qSDRZOdVEusRVZDdnhTra8wKQ1Z3CJTGEiVhUDEhX0BC1f9VJo/brhcY0KL
	 Ze6XC0dDT53QB6SReVUcnrJ032fks7HXdGXdPxw/ZUSFcOurosS0WZLqxwnYr0UDnU
	 N1tTPXOw4D2MptDPDPHkghCn0vHaTlBGmqySeiLo=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 04/10] arm64: dts: amlogic: meson-s4: use the S4 secure monitor compatible
Date: Fri,  6 Nov 2026 11:46:53 +0100
Message-ID: <20261106104659.54656-5-christian.koever-draxl@student.uibk.ac.at>
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
X-CRM114-CacheID: sfid-20261106_024715_952295_25060525 
X-CRM114-Status: GOOD (  10.64  )
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

Use the S4 specific compatible for the secure monitor, so that the
driver can apply the S4 power-off sequence.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 57270fbfb4a7..793c7bb9512e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -135,7 +135,7 @@ xtal: xtal-clk {
 
 	firmware {
 		sm: secure-monitor {
-			compatible = "amlogic,meson-gxbb-sm";
+			compatible = "amlogic,meson-s4-sm", "amlogic,meson-gxbb-sm";
 
 			pwrc: power-controller {
 				compatible = "amlogic,meson-s4-pwrc";
-- 
2.56.0


