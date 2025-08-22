Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C50CA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 09:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dATF9pVYzR6PVe5YTtaWkcMACjJixdOaKzuNOuuEyYU=; b=EGV2MuY/S5dp9hfuvRTlYuGdGO
	MSmi7AAMtsOUg8nOeUvWZEBAIQr+97i4xU0QwaFpxA5T3ddv6WicGsNytSMoyQYIKP/ZJIUK7ZW8g
	OPOlq7LFPSGO/zZT7WCgcgRk3FU4L1bWR4vcyWgNHjWkiBH9p/6+fvouQcvDKfXcocSOKH6X2sTkA
	amHHUyARuwlVBOq+RQf6b4jdfS39PfUqGklVNIm6kdko8pnKDLyeGNjfHVjo/wTXQOH7f+J8LvQAX
	mAamqX3IGaceXq09gBHVKhKY7KKdk46eMgs0//8mhhG5vB2w+AynnnvnHJnVvAqA+XxcrEEF8gQHw
	liCs5XQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkdy-00000004SLJ-1MAV;
	Sat, 23 Aug 2025 09:34:38 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRtf-00000002dgY-2E4i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:33:36 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-afcb79fb221so27971266b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 06:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755869614; x=1756474414; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dATF9pVYzR6PVe5YTtaWkcMACjJixdOaKzuNOuuEyYU=;
        b=vAvqVSQ6ScMRxw0557C4PU0vkb7tb0PrC9gj9VnV8Xk08IklnQSyRZgnqBUL3XIIRE
         iwmyYgTURKWpnjVPjWWixwmmVgc+RHzGx8YVven7ww73rZ8FgMOi7STwxoCWySPd/M3r
         kuE3/b0WQfK0xPFvEMDVMgF0WLyu93sF6oxK5JYj4xbcdR0iA9HUQZWngHrSDbFfA1Lq
         QuxVnAU7nZpL3MZWA1L2EEQCZu0grqO6cVjgbdIbh8lUQnSsHPfaWH29vBdGDpHLDYRu
         hB0kWJUx6OVVH/GfffhRVY0Juo12GcUGGqKOMijsz2EIQ00nHsTnf7AiE5NGJE5Ffcgx
         /vZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755869614; x=1756474414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dATF9pVYzR6PVe5YTtaWkcMACjJixdOaKzuNOuuEyYU=;
        b=N5DVCvLeGZfPQHkp57bWU9i9t7diwEByBDP5QXKAg+ZaKm3y7wwn+TEYIzwiQcYtc5
         JRx35peooNS+bSjvJnQQNQoT/GyuEAZO86wOULoYZ46ObYtr6At/+WRUelAhD2hsEjh9
         VlWxDTt4f5aP/O/E7yY13DsurLPxhl+dij99XyIV/M4pK/ghdYGiNxaxah1r00JeMBFp
         IupMBPoR8HSg+yg+0JSQ9TvUDjmjJ4v+EODD+kD/EcHCsestDNtxT9ruLlaXRidZJAnk
         pJtwobCgnqhpUR2qQnYDXjWqCyV8WPhh3RrJBUyEpvqDLgLbdKyiZW2C+nI/MDCxXvro
         pk2g==
X-Forwarded-Encrypted: i=1; AJvYcCU4L0JVy2uu7g/5EU0XqszkBTuq7G7u0ybg3BikxYAUwXCjdb6H1YYa1V8xLn3vDfeGdoQeLnQ2fmlgR4/PNZMk@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6aTiV/D8DLQexq+fpLqqcHKTa39ZhO6kOIaF4fojSxNPKhiz9
	aCnsZBJvCLgpNtsSM7l30Bka7A2d4zIYvlgqtg5lC5DrzJwbi7tybEOoGMaJNkV7Wgo=
X-Gm-Gg: ASbGncspd9FHvliDgq0fL2FpABK6Mt746Ut5VC7aeb6HBptmHy3unOCHvPvgQZ1D7OV
	blIt2qtpfhCL8QslR73BroAhTnqqg+7E2lTfRNP61zgV5CEuuyoGlMygxyobxo/tlinTY/fv0QB
	6pkaw1mzMFJkgLrVVMp4rMxbgFdd7vg4Z2nVH/6/kfnAuxOSzMDriJpnI3LEdSMtAZ1s9VaML4e
	giCnytZ/ewyHAh70G96Xz6OIM+9qhlIgcpv8tc2IU7KyOHqrWy/4E9vQsh1qp4dq9xLa4BUlkFO
	6LRRD91vBhgG9LgfRKoVOXqtsiVMhHtCcPXhvQo/r0vtJESMzBMi5kwXoHOw5CPJDAvCnPB3d/z
	y7MXDRCyX+0xpv8yNPU8sCCzzXoQNfME9yu7kEwRjnWSC
X-Google-Smtp-Source: AGHT+IH6qN1ECW4QhALM/CQ2NPhMzvX4p6uWPEhQ/UIi/ACqTxT43/7Yi0lQIdrNUOwBtpfwLUzTRw==
X-Received: by 2002:a17:907:3c84:b0:af9:8748:2bb0 with SMTP id a640c23a62f3a-afe29513efcmr141558866b.10.1755869614096;
        Fri, 22 Aug 2025 06:33:34 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded2bc305sm599477566b.18.2025.08.22.06.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:33:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] arm64: dts: marvell: armada-37xx: Add default PCI interrup controller address cells
Date: Fri, 22 Aug 2025 15:33:30 +0200
Message-ID: <20250822133329.312326-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1233; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=bYTViSflE79ust8qCI2yDDQ/7mxRvAWLwJ0TYax5i3U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqHGpSFTnv6/ZCbMEgpskXgih8YmZE9bFTXExE
 TbqLeUQ6+mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhxqQAKCRDBN2bmhouD
 1/h4EACGmhvfHw298PPgaoyMuUONYIZb7OIY6Hxa+VVRj7HsQUDJxh3f1xDS5l/iph70RiN19sB
 Kk0+LSi5o5I9h7mlvKPVi0IgyW3FdFCZeh3tBR+Y8R46DWEX1Am1nIyWvY6yp/aqE0LtteiR3QB
 YKRhq83zCDQyIIsLFWB3KzIJkyG3U9zv++wDyh2lwVC8WSlxjbaPb78ZHlijIwDUnWuf/g/VgiG
 4UStLpkvFuq8+5uHk+i3krKNIebHhDbZzflBBIsi82BdJWKyqRAJCb9NJ9wL1nrCqgB853oDI0v
 5Pnr2OntXmT/lZIburftXiEw74NHd3JPF6BFubFmOdJAmi7CLXz0EWNcaN9K1pR864A5O8Yz3xd
 dMr8jpAK9yfldJ0mxqoZL/TpJeZo6NNBKK3emOhj9DQJU0k7Q7caixecUcTc16eFgJQ2jYbLCBx
 cUlzKY7ECvVkCPK2vf0+/QNdQRFQO1IsgZVmdt2OnrVlpGHQnS9kvruScv1KqQFeHTayOplag4S
 WSkAwpbLhGYY7WZSbxY5A2kTX0cLJboYQgyHvud0w1nBCl6T69OktFRSE72PSEOOKNyqaza91Db
 O8hypdE6X6G2xxfFtWE63z5gIwBkEwQ5kew7ffBpfx6L0MdxtelNYePEqT5jHAj3GvOQq/FuwKb jvDBV47J8p3fYUQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_063335_566157_4C8D225D 
X-CRM114-Status: GOOD (  11.14  )
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

Add missing address-cells 0 to the PCI interrupt node to silence W=1
warning:

  armada-37xx.dtsi:518.4-521.29: Warning (interrupt_map): /soc/pcie@d0070000:interrupt-map:
    Missing property '#address-cells' in node /soc/pcie@d0070000/interrupt-controller, using 0 as fallback

Value '0' is correct because:
1. GIC interrupt controller does not have children,
2. interrupt-map property (in PCI node) consists of five components and
   the fourth component "parent unit address", which size is defined by
   '#address-cells' of the node pointed to by the interrupt-parent
   component, is not used (=0)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
index 75b0fdc3efb2..c612317043ea 100644
--- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
@@ -524,6 +524,7 @@ pcie0: pcie@d0070000 {
 			pcie_intc: interrupt-controller {
 				interrupt-controller;
 				#interrupt-cells = <1>;
+				#address-cells = <0>;
 			};
 		};
 	};
-- 
2.48.1


