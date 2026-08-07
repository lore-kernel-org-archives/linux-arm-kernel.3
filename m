Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63ECFC5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 11:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Pnu3iLD2kYSjbeTomVdCVLxo+qs2c03NdwMIpYQOFt8=; b=JwyHiHltzKAd5Mpw8ox1MVkGSp
	aV5fqxJf2nsLVCkUiYAGItmvQqttbItHyLjfgxtKCMtkLlNHIQg0L2G2Iaj7oavAskGDSCet9EWa8
	6UYkR0ryiZ8MkaWH5egjr+6n/f6gjRR3MHDj1TzH8KZWhpNgemaLAt1gj2VtTU65XgKqz+yDN97Wg
	7yR0pvTfBcMiRchaoM+p4eva9BxsCvDBP9/Haxw0BeN7vXwdz6egCxf7hREemcdeV74mPrD9QnrpD
	ZC3I3wZx/HN+24kQiaWv09DDW9IWPMHKrFAszejY42ATZoyAe0IR2qJ+BbZZv35JxSuad56SxzAaK
	vsl/aQNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsIh0-00000007rew-01do;
	Fri, 07 Aug 2026 11:24:50 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsIgw-00000007rd3-2JnX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 11:24:48 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso4058129b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 04:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786101886; x=1786706686; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pnu3iLD2kYSjbeTomVdCVLxo+qs2c03NdwMIpYQOFt8=;
        b=PBrIad+DPJyi8TMmzdNKN4nL7V8fHXzDlRCruNK5DoVYktVzYcpsc1pm+wE5FCLh/S
         J76LcMJZ9sg+7OSBfami5gu5rGI2QWOcAnWJ4HnDGGQXj0uiPEYgj6mxADMRd7kXN1J0
         IgZZsfAcXFe2WbhGz9Z5xUbx1s/bhLMj1XEfw8odauUBjCjbdLBrvFf03O3VC/KU41jH
         GFI3o5BrVGJZ8pQeEsCfI41Okq0vJU49D9AEJm3jLkBPvK1GcYZiw/uEAk/yIQWpQYBU
         ReQp8dEzW8SypkwHadwl2iK+7MDwPBi7jP1cyZCRn5OzDm5TOEVH0iGHBSt4pMXUvnwW
         tOzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786101886; x=1786706686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pnu3iLD2kYSjbeTomVdCVLxo+qs2c03NdwMIpYQOFt8=;
        b=fmEtfxXRD3rf/F3OY4+p9tKxyGKbFSgoku7hUlRXLw0PwcRPz8H9h5ABvPnCPqRfQO
         akjtggHo8B4EvKCGozh46VZZzSXPcroWuY0MVSqhMeDr77N6n1ax5KwWwFGXsnQPhOQG
         vXvBSYFHG3D66T1BSg0rqDr0zkGDK0VPTH64R385KvuowsddpxC459UjDRoKhHXruHvy
         NXrdm1monb6P0aMTyX/l2q764fndduIVX7UjTqIyqYK6Jd2tTyHjFXATv90RmBOWmzci
         HFhIIIxHfB2ni7bOgeuX3m9KZqtltRSfK1vtOM3ifnxZwqZ9iPsBOabr89x5lDDsMNdw
         8IAA==
X-Forwarded-Encrypted: i=1; AHgh+Rr929P60aRvn7iwMMNJGlrCfdBvXGGt8igAshOBpzjPhbi8NHsU1G80N/1RbcVVZceakB2BhQvJzckiVevg21tD@lists.infradead.org
X-Gm-Message-State: AOJu0YziKXzuiPg2VRx0uHWpwbt3/TqHD4x7o5H6gScXeBADrNkNP4fX
	9Irj0Xm07zwn4+LQNKV/g+tvETna2q3iiLXYtlpUwpIy6R6U0geb4RjyjF6k/A==
X-Gm-Gg: AR+sD11gMig5zSnGDZH85N0GzedyU7wl7YB+t4MQlqJy6Eb/Trz0gNs/TZKLhOAMoPf
	OEaUScfv5qZ2A/XxTuEuAwDyNCb3hMyPm0SBVB9ZW5VmBO0WAo8DlpHJ5IcizHkTey6ibbscQS8
	LV9VihCNI/RvS1PEZlUcMxMQPKTOmfZekM1knjCj3ISy5GnzNdlTe93dY9MV5YFNXezJKO2gCRr
	RprUIwJ6vbQt9ih3+A5XVGLBPch5DuEsPZKFibePZRJ+reKurXpxzOa1UR85Yla8BUG2ZeKC643
	0tEOEGHq1dLR2Pe82cT6KHwjpNK+tTzpDbseA16aJULEbVez0nsF7IGMblWg7j8FWk477pwMdij
	nQTTc5J6LQWQEdbBnk3HPLctDFzNDSw5p7K3wzXN+Yf8N8vVZeFCR//aoybdTnTJ2FJzS4afomu
	l4NpDWx2MswHBtiUfTOb9pjPq/3p7HTrWVkTkEOAsbuDNgh6NGhC71jpCFAagRcZBxUNrrY6BVx
	Mo/EGUGQb+TztRFE2j3eiMro0BlpkrVjI4u+w==
X-Received: by 2002:a05:6a20:cfa2:b0:3c3:875d:c52f with SMTP id adf61e73a8af0-3cb85dc28femr29154698637.10.1786101885389;
        Fri, 07 Aug 2026 04:24:45 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:e1cd:daf4:8fac:b7e6:4f37])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1410199bfd8sm6349351c88.2.2026.08.07.04.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 04:24:44 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 1/2] arm64: dts: rockchip: Fix the BT clock-names on rk3399-hugsun-x99
Date: Fri,  7 Aug 2026 08:24:31 -0300
Message-ID: <20260807112432.49685-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_042446_592702_2C006552 
X-CRM114-Status: GOOD (  11.99  )
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

According to brcm,bluetooth.yaml, the correct clock-names to describe
the 32768kHz Low Power Oscillator is "lpo".

Change it accordingly to fix the following dt-schema warning:

clock-names: 'oneOf' conditional failed, one must be fixed:
        ['ext_clock'] is too short
        'extclk' was expected
        'txco' was expected
        'lpo' was expected

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Use "lpo" name instead. (Sashiko)

 arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts b/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts
index 352c8efb37e0..27ebbbc66633 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts
@@ -703,7 +703,7 @@ &uart0 {
 	bluetooth {
 		compatible = "brcm,bcm43438-bt";
 		clocks = <&rk808 1>;
-		clock-names = "ext_clock";
+		clock-names = "lpo";
 		device-wakeup-gpios = <&gpio2 RK_PD2 GPIO_ACTIVE_HIGH>;
 		host-wakeup-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_HIGH>;
 		shutdown-gpios = <&gpio0 RK_PB1 GPIO_ACTIVE_HIGH>;
-- 
2.43.0


