Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE87C88E41
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 20:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ykVw6AeDq6KgknPvJUHHi9wiyKW1QQ8OFJp7ecp+Ky8=; b=t0C87syTgGLTw1wCZMUvomtY4f
	zOnb7x8o4eaOnPLXrUC0T84xxgObyHLGCwIxLFND4JxTZwaC+X4l/ipqTMh4gUN6htyDTooLS6rjg
	6iUlSttPxMNQe3Ba/NO0QhyWPj5cOy7qHcDUCFEGZsB1+7flc9daUO8ptrC3pEx2gtGdxQg8ZPpWA
	HffjPrUiW8L7xCNu528N0tGRdD7FtAKFO6a0/1Ah1guu3qsZm1puPUNlClIq4lIenf6aP6jE4RcgH
	etECSl2eAFtN3D84qmuiHYy1nF3qsYR9IN0FUdqlUOozxITnZkt9mpetGJ0Hiy7Erl7Kayno4iAfC
	zgeyXhfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4llr-0000000FN9l-3G79;
	Thu, 10 Sep 2026 20:53:23 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4llp-0000000FN8V-0MQg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 20:53:22 +0000
Received: by mail-pz2-x10.google.com with SMTP id d2e1a72fcca58-8620ffc9ec7so12109b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 13:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789073600; x=1789678400; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ykVw6AeDq6KgknPvJUHHi9wiyKW1QQ8OFJp7ecp+Ky8=;
        b=Ou1F8GhLXNyTPkBrUAzv2DydvipAWShev/aFn/XQFCTGLcHOsAckO7v0jZNJxSx2Bz
         ztswyrEPtfLfskGerTKno4txXdgscqhy02C/CSmXbyhfiKpfM5wuIbgA4ACbVocR2A+i
         BGZ3AT06BYXGFMcaFs5X/aCVUIK3dfvlBUJyalbivsV2rzZoaujzE2kZ4iEKOtonXp2U
         N1udMKXVSiCVwKVbIL/vxs3qUXkkYY1v+efdoNC/LlKna4C495yunZpNxwclYjT3omsn
         +fgniYWKK/vrF+xJUy0HZNAGtzGmNgsBLXLD3a4k/tQ1KXdoaBir3ohAOdPQEUDPDpLR
         4oKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789073600; x=1789678400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ykVw6AeDq6KgknPvJUHHi9wiyKW1QQ8OFJp7ecp+Ky8=;
        b=s+yCl4mkvRjPNQGNPLNFXLvwXgUqpEMKVK6NRKvQWnFFnlt7BT8F5jToEhfJbBLEe5
         KFY4n7WNgvw/DYD3ncJkQS4367QluxmIujyi02Sbs8Hy6BCHdl/+TByGBg0IoKYpY5oY
         AR8qpb7raaKGd1g2nOBIZsRpUyOWheOK1MhOi4pvOrcBJAXDa5djj53Utu00Sf02gWoy
         IjA4wRIqDWcqqQZGdtg3JBhVjGTuHAawM+VlycRE6QZkCWR36PUOD1Rtbymu+MECrh0C
         TtkUwLnozWJq5g9CLwPSTt+b8cxw4FdrL1kovCTsn919eDDlItKcWO4wChh2679k6r9g
         1k9Q==
X-Gm-Message-State: AFuF++nGly3YYdIyGcyjJq+LM2fmm8g3VbkKwmRA1fLPjYEj4dlrBGdy
	B5utYyraXV8CadON0sGYo8IpdhAIpAjBLRVFRSeNMX6fqFLGW6UsFDmj0i5YfA==
X-Gm-Gg: AYBFou0cVXv+VEu1/VICRrnDUMFQ3FwM9SYGm88rzG2jQk4HPyfgS141dBxgpz1/Y1c
	dOYevFnEkufn54dZI/W0x9iG1A0LvNzQ3c6jilzP0dQw1zx/LhgcUCE9/KcwPrg/7UvmQ6bPCnw
	MYxUbCqTx0slDTOap8idJhhMsqIuk7NBQse2bG1CMP3irTwJBH3WKmEPkLwZPsBk6ug1fI6evSn
	Qkl6miOtHrsPBFndZxvcoAnqygLQhteQKpFKRaJF5l/VQJaURRUDtPmyySaDbBDJ63OZpOdfpSS
	KYOS14AK1UteVYFmUpNsbVdTHq6QgnmWlQ41zdPT5KphyGEOCAq0cfj1cY4DrHOmzAx3eJZvfMt
	SsDx+6bKfcbfgZc8o8CQkJgs2WrBRk9w9e33P4HTLhfn8OQzXGOnaR1NocM6FSQv/3NdZ/xb2tm
	fEL3fFJlU1hYLsjlxEahLw7SB9e73BWJzgsquHcmob1HaoVugP/mZsPJC978qJHMo1S7g0LBI2O
	zYmFIfwk/cx
X-Received: by 2002:a05:6a00:4791:b0:863:2fc0:4052 with SMTP id d2e1a72fcca58-86b312044bamr433815b3a.2.1789073600411;
        Thu, 10 Sep 2026 13:53:20 -0700 (PDT)
Received: from [172.29.212.252] ([2409:40c2:5431:4168:e542:5202:be02:6ae4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b250bf3e6sm150822b3a.5.2026.09.10.13.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 13:53:20 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Fri, 11 Sep 2026 02:22:50 +0530
Subject: [PATCH 1/2] ARM: dts: keystone-k2g: Add required #phy-cells to
 usb-nop-xceiv nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-ti-keystone-usb-phy-fix-v1-1-9f6e9cd649a3@gmail.com>
References: <20260911-ti-keystone-usb-phy-fix-v1-0-9f6e9cd649a3@gmail.com>
In-Reply-To: <20260911-ti-keystone-usb-phy-fix-v1-0-9f6e9cd649a3@gmail.com>
To: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789073586; l=871;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=U5QxWZAHtLux3C2Ggamr/Ic9Czjgsrz7b+m1iekGsMc=;
 b=qOGeiLDnlzgOqFT3MXPuiSRMBTWGWKuBwOGs2MxGe9HPdKloutW1aOdKnSJ+jrJwLKKvVxTYZ
 vchzeXSi0jBDVZPWuXrGLEyBqiz4eCc+DX7OA6vAcZLsvYjdNEd8FSf
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_135321_156885_FFF62189 
X-CRM114-Status: GOOD (  11.06  )
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

The usb-nop-xceiv binding requires "#phy-cells" with a value of 0.
usb0_phy and usb1_phy are missing it. Add the required property.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi b/arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi
index dafe485dfe19..5a63874090eb 100644
--- a/arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi
+++ b/arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi
@@ -77,12 +77,14 @@ usbphy {
 		usb0_phy: usb-phy@0 {
 			compatible = "usb-nop-xceiv";
 			reg = <0>;
+			#phy-cells = <0>;
 			status = "disabled";
 		};
 
 		usb1_phy: usb-phy@1 {
 			compatible = "usb-nop-xceiv";
 			reg = <1>;
+			#phy-cells = <0>;
 			status = "disabled";
 		};
 	};

-- 
2.55.0


