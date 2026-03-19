Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF4A1088E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 03:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vj6rcJFTO7DaWtVeHI3TKWH2ayBVnwxQ2FZw6tvwuk8=; b=MgnmI3lE7/ogTEb5n1dck0xXkZ
	+uevwfH3B0glAJPJXCWVtAKdEvT8RlUEhASQIbDmBFormJ8pFISbAqWFymVM88h3FAaUvhi1XPuBT
	0+PxjpJrkFQgdG+jXFsJrTmHZ9mkoEbPV4M2fsTH6BLwe1xOB0ueP898LcjVSM3/oarf4GA4pko7f
	JOMEikyrRhU/O0PhOMO7J7U0Tm6ChRaCxbO3deNOX1zedcPRZmH+sCxiV9RdRIjBkoPFD7nCkoVMt
	/+Xbqi32KmwyVFdgZhjJFZKuULI6kW5T8PIWf/y7vXcaBvvFTNFzytksixqavtktQZWKkD4enFuKr
	UK5oEnbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w34SE-00000009rIZ-3BvX;
	Thu, 19 Mar 2026 03:53:50 +0000
Received: from mail-pj1-f54.google.com ([209.85.216.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w34SA-00000009rGt-1iub
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 03:53:47 +0000
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-35b9fb3f57eso243694a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 20:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773892425; x=1774497225; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vj6rcJFTO7DaWtVeHI3TKWH2ayBVnwxQ2FZw6tvwuk8=;
        b=nWe+V/+8BVYiZUcencyxxt/j3W+jNyeom2vVQ21fb/JOEyrUsPT4H79G0ghlRg0Pw3
         e8EfJvpZ4Y6WlO278LUvXIhBIl2HGsVZqVJnzB7ohUbeIVlsMlSGPEGaFC4DNX7lsOlv
         B7nI9kCYm1p6P/e0x8FAebsmJITsArGM6mMKPtapxIuHVQ8o5MbXFMSAjhhZ0gX7Qg7R
         +NRhqtGViBDljZoBRpjLLxXEgf1lTyhWVEZ1nhZKpEljIp1YizQCQneOZLfiu1PL7hV4
         jzzWDt9uBWSbPSIYPvbxjQ6suDwB8JbfRrvEGCIAmbFzXKjtTw3gDEKgN/HHPrVD+DN0
         awxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773892425; x=1774497225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vj6rcJFTO7DaWtVeHI3TKWH2ayBVnwxQ2FZw6tvwuk8=;
        b=qBYjGnIvRhr07po67AzTMRpsvL0DaKWDWyP210jrExjKAJU9nTjP2YR+4kveiiS0pA
         ZtHBBslb6QBax5lO0lSNoQFJUgWoUCg2nAaN9txfix+L5wF1dZ/ajNJNmXi+aOPJiL8a
         95Pexg8+rkI3i3InvIDyNVb0xakOKAqzK9Y4lc5vAD11VgUwUImuh7FzWzXJR0o1SFF5
         Jf/T70F2d1qiZ9bXBIoiev4uvffr2hiCnzC7GCrbdQcw5D4/kyzeQAz9L/x6TPP6ajn8
         xM/N8E8Jg7aZnESATozotU0nyObvffJzFanZ+lOofkTUfanLC4s1IAmUg82nFg/zwY44
         4B6Q==
X-Forwarded-Encrypted: i=1; AJvYcCW7UT5fVgRUPd0H7oWCXQn7QxONsmpjkrGjU+hxormtvFU8LCqQaEqurI5zm7cxy3xpZreDC4j/H4X83t678XdY@lists.infradead.org
X-Gm-Message-State: AOJu0YwMXxChoa79Dlvqjhmzz8vAY9siDQCJNtHkd5CQOpE0IxuWQJgT
	wKLXTXTxmliN/TvQGrTZdwp6W8zYNh1Sow6nXqZvHz535SmdCdGImoz5
X-Gm-Gg: ATEYQzxyQnxYQVvKHrnaMjoXt1KmjCU4JWM88LovxyKBt5ZVLxcVWIFQCKZDbw1RGhq
	TLUP3oBmlR5vOTkf7Ly6DQ9XX+ayxtob4YwJ8ARPdF/4cI7+wh85dsElObgTyt3uSgmYf4no08O
	v88baMg8mzBf1eoLx566xmK0knULt2gUvoJwwf1SNBWuaqUiRUmNrs7bM2uV7AXMjA0mI6Y8xUe
	dzMXE5WijW7TU7nERg6VHllEIriF39QiF97FzgNckAArBs6BoVw6FcQhHXo0QT3NLvGPGd1Bpvr
	/chyjTcOoncPPMBrvlIrxHo3trRvHnlvLd1veToQSy/NGv3ls2pCrjGu/AM1ShsFXbNPe6ltVsN
	6yhS2U9zVnVPJoRa3qvCVtxt4xeD1DPqfo46nf41m4xQT0vXsOVk+uMTMBP3Ej95wg1QFwU4OUB
	iEpwEKKYhUrxm/dVaCdGjnOVnCwc4MrZESarK34pqlFfIdOV7kflL+/60=
X-Received: by 2002:a17:90a:e70d:b0:35a:275c:4c27 with SMTP id 98e67ed59e1d1-35bb9e3b95amr4766407a91.2.1773892425145;
        Wed, 18 Mar 2026 20:53:45 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc60ecb30sm1159145a91.12.2026.03.18.20.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 20:53:44 -0700 (PDT)
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
Subject: [PATCH 2/6] ARM: dts: BCM5301X: EA9200: add USB GPIOs
Date: Wed, 18 Mar 2026 20:53:20 -0700
Message-ID: <20260319035324.269905-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319035324.269905-1-rosenp@gmail.com>
References: <20260319035324.269905-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_205346_447205_575EB90F 
X-CRM114-Status: GOOD (  10.49  )
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

Allows at least halt to turn the USB ports off.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
index dfbe16d9f354..a579c372d404 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
@@ -58,6 +58,14 @@ &usb3_phy {
 	status = "okay";
 };
 
+&usb2 {
+	vcc-gpios = <&chipcommon 13 GPIO_ACTIVE_HIGH>;
+};
+
+&usb3 {
+	vcc-gpios = <&chipcommon 14 GPIO_ACTIVE_HIGH>;
+};
+
 &srab {
 	status = "okay";
 
-- 
2.53.0


