Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C92CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 21:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3f0+4Vh1MwZCJAgeds3L4wK1Y2nN5MFSu2EhurxFoGY=; b=4cd0FX4Ot8E3sIliN3Iz8WeTYM
	FrS2OJmkkz1qMKtWZyqIFsBpMklcbjbQqati2kDFXKeyutDDXP2P44+eiXNyzpnUnFiiDyy0A4OaR
	5u2WEXSBGkdzmkkQSrWF6+tkCoRtDsHvvyUDPYSYtWpTeaLu1K6SyIsAQPIJ0eLHT+tBzcoxMHxrd
	569ng8X5bW87LHBH212+kmkQ9f2d1yZg8+x8GTNbkSP/CnZCTPLWaBq6pCRwhgonkBCv5IDo+n/2X
	/MXNbToYh9nOJkyyhzVTBzh77rq06cTKp7DLUhfJ9jiVzYI1x8dpRvMYCHipoqZx1j3/dndzcEKso
	Wxr5iAwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upvog-00000005IqM-2DGs;
	Sat, 23 Aug 2025 21:30:26 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upvm3-00000005IkW-2Tty
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 21:27:44 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b49d98691faso163653a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 23 Aug 2025 14:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755984462; x=1756589262; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3f0+4Vh1MwZCJAgeds3L4wK1Y2nN5MFSu2EhurxFoGY=;
        b=R5K6zgi8YOMFoYMhMo47WHPC9kzPHCUR6A8t7nBliaIKG0KuEY/Z5f6ZtKTq+c9YUR
         UDxjDSTk00JekHXi8WrOgAjrxY4HaBUFVchVUpX9unXxlnvwBZL4xRYAnMaxUHEBfCR+
         d8MY7xFYCZxc7CnzSpOokjqwrVfEg698QiqVflYBEm/WwbWXVksfUsFDe3SsyNUB6zTA
         mrppLh/hKd/1LKBZQi8P31lBD0GppDL2UGb7ySd8XW8rit9762KwLCgq1kEuvjTCQqMo
         K8oorqeDK6TnQUtscWna1t6dsjqImFlVsTR0XrOEZkyRFY2CZtUd8TFXSyXENwNG3/9t
         Y64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755984462; x=1756589262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3f0+4Vh1MwZCJAgeds3L4wK1Y2nN5MFSu2EhurxFoGY=;
        b=JWTigodqf1NodoOsxR8B8q24waOTUCMZOMQ69CBW9DL5IX79cRf+YidhNBRhx2kVyg
         Y7jjrql/neWuROPxuWlIAE8A9ljtoeGvrcFXWEfwS4ss+9Tv9nnZZPUjTXkyGupEjZVX
         Aa4ZQT+BNi9ydNcY86qbOuwX3081dzIp2dsr/gbSeU2FFdfR8bWg5lYPHeplP8zJMnCX
         CcerzC6Y6K4faIxZCLr9i6r4aHkh26PcHRJDMpt+l2mgAR9UHoopVHhYQo991HYoJLbX
         Q0s7Fjk0RSQZYYzsv50MyIT+8I01F7V99L0KpSQcl5So7B9feAKtxw88lbhm+bwVm/wl
         /jtw==
X-Forwarded-Encrypted: i=1; AJvYcCWoRwoQtrDJsdtvMEI8V+0wfg7XbOnlDtm2Wew1sRJel6S/dfBV6++3qeCfacoPKvthnHDTUlNTnlKVUgg2nQ3/@lists.infradead.org
X-Gm-Message-State: AOJu0YwGAPVnMDgS9JTZo+UWKe0fnB2305i8pIvZNBTIvO+We4na742l
	L55aMXyllzM5ypox748Wiv4wsm38XdUZuyPU+11w+S8GHG7YuXBAg0QZ
X-Gm-Gg: ASbGncuwYeUWIRsbmOba7gWu6gCpm8BKckSRB8UYY/5Fr3srdfBVL8b3etjBDu6zQvS
	VHYwv/o+w1upHijKTooBvQ8fS8xMh+OnCxNssnpaL2IACAPmRM9nP/PPhh4A2df3VqHh0pgWnkJ
	ROY6P2Wx0HEqltTqwvYxkbO5PAfK+7gYZyn5RTzvpDXNtWNLA0z/RYUscAeEnnJFnl1PKvApJI+
	Kd73R0hV+ae4hobhj8UPB4UKQmeVhE6tutafT1B+0D0zbG2olD+yE51nO4znjpSprbZSRL7GsJU
	k+uoZSXWxxotppGPwVxmn/3k0uJjWv27A1Djmnz25Y16dYUyvxlFKOAbkjM44w3E0YPbsBe1NAA
	tcUBsujQhbpr4ie0VgBbwm+/StnVaBd4/M3U6x+UklH3B3T1onJCY
X-Google-Smtp-Source: AGHT+IG+vW5JGkKEGGGdp4Hd6sF1BS7DCoubVeclZE2QYEcmrjSVeoAj24TqBkympTdtodtDi+cCqg==
X-Received: by 2002:a17:903:17c3:b0:242:cfc7:1fd6 with SMTP id d9443c01a7336-2462ef446cdmr79305085ad.32.1755984462256;
        Sat, 23 Aug 2025 14:27:42 -0700 (PDT)
Received: from fedora ([172.59.162.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2466889de85sm28982615ad.153.2025.08.23.14.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 14:27:41 -0700 (PDT)
From: Alex Tran <alex.t.tran@gmail.com>
To: linus.walleij@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alex Tran <alex.t.tran@gmail.com>
Subject: [PATCH] arch/arm/boot/dts/st/ste-ux500-samsung: dts bluetooth wakeup interrupt
Date: Sat, 23 Aug 2025 14:27:32 -0700
Message-ID: <20250823212732.356620-1-alex.t.tran@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_142743_633045_C46E77D9 
X-CRM114-Status: GOOD (  11.54  )
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

Interrupt support on host wakeup gpio for ste-ux500-samsung bluetooth.

Signed-off-by: Alex Tran <alex.t.tran@gmail.com>
---
 arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts | 5 +++--
 arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts     | 5 +++--
 arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts     | 5 +++--
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts
index c623cc35c5ea..03c679164c11 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts
@@ -383,8 +383,9 @@ bluetooth {
 				/* BT_WAKE on GPIO199 */
 				device-wakeup-gpios = <&gpio6 7 GPIO_ACTIVE_HIGH>;
 				/* BT_HOST_WAKE on GPIO97 */
-				/* FIXME: convert to interrupt */
-				host-wakeup-gpios = <&gpio3 1 GPIO_ACTIVE_HIGH>;
+				interrupt-parent = <&gpio3>;
+				interrupts = <1 IRQ_TYPE_EDGE_RISING>;
+				interrupt-names = "host-wakeup";
 				/* BT_RST_N on GPIO209 */
 				reset-gpios = <&gpio6 17 GPIO_ACTIVE_LOW>;
 				pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts
index 2355ca6e9ad6..bedffd969ec9 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts
@@ -475,8 +475,9 @@ bluetooth {
 				/* BT_WAKE on GPIO199 */
 				device-wakeup-gpios = <&gpio6 7 GPIO_ACTIVE_HIGH>;
 				/* BT_HOST_WAKE on GPIO97 */
-				/* FIXME: convert to interrupt */
-				host-wakeup-gpios = <&gpio3 1 GPIO_ACTIVE_HIGH>;
+				interrupt-parent = <&gpio3>;
+				interrupts = <1 IRQ_TYPE_EDGE_RISING>;
+				interrupt-names = "host-wakeup";
 				/* BT_RST_N on GPIO209 */
 				reset-gpios = <&gpio6 17 GPIO_ACTIVE_LOW>;
 				pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
index 229f7c32103c..64562a3a262c 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
@@ -481,8 +481,9 @@ bluetooth {
 				/* BT_WAKE on GPIO199 */
 				device-wakeup-gpios = <&gpio6 7 GPIO_ACTIVE_HIGH>;
 				/* BT_HOST_WAKE on GPIO97 */
-				/* FIXME: convert to interrupt */
-				host-wakeup-gpios = <&gpio3 1 GPIO_ACTIVE_HIGH>;
+				interrupt-parent = <&gpio3>;
+				interrupts = <1 IRQ_TYPE_EDGE_RISING>;
+				interrupt-names = "host-wakeup";
 				/* BT_RST_N on GPIO209 */
 				reset-gpios = <&gpio6 17 GPIO_ACTIVE_LOW>;
 				pinctrl-names = "default";
-- 
2.51.0


