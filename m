Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A30E6CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 07:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4VdrnFXMa9rFd83Zher/BcNQQzlodlm+IkoVXej7FCs=; b=HniNny80YIRQ4nIma/wKq4WASM
	R+4a6A+YBvcFlG9sNO/ypzChtzafeYUafzIFOdAQQxLiciFxu8Zr4Q5rhOK9V2s7Po1pTkHhNO7ZZ
	fg+zbpsFn+CWXdERK01tY1Bk6eNMpF4462EcvwFGAoNRDLZ17h4h+heyqCAgRqv8Co64zUG3yKWj9
	63RBPKux0V/Z99JUJXHBf/rTvlpp/vWzxOdZqDjtkzXzQ8ayEc1UvcqGg+c9szprgQGRirYrLNbBj
	IWg0ho3hwQePyMv8D3T5kVOdKPpYJih7JLgo5t7Nsdkg1x0Dz6k3192nIOo1jx2o57Tud6ziqMsJz
	R2kB4CSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0aZt-000000092qd-2UfE;
	Mon, 22 Sep 2025 07:03:13 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0aZq-000000092o9-1aAb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 07:03:11 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b55197907d1so1868947a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 00:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758524589; x=1759129389; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4VdrnFXMa9rFd83Zher/BcNQQzlodlm+IkoVXej7FCs=;
        b=bXvyGCMeYFGWyhp5aQicrv7w32/lkL5xW9D5JTnliyyWoZsLMmIWdxAsur5ea7c4DG
         RLhL8ZsZc6z9EqWER5nL/lhJff54YGEhqDbjuWNllXl932ik79CMkV+BMN0zMgXFJWoJ
         ucX5Jszj6CrYSJwEkVsX8QgblAcdxhc16q4f91pwNopub0AxLCIOJZgmiUIgNOATk8bN
         uTh/hrb/qshR8V7BhTxA9txg6gC+b11nc50OPyZEPkE3TVDi7pSSP9wd6YiiSGZERaZS
         xZA/D5J+N+9j4cL6Q0tDRF7OIa06Ib0dli2xerBcLwv8k+XWlEOEhv84+S3THjKuM2Up
         /tIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758524589; x=1759129389;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4VdrnFXMa9rFd83Zher/BcNQQzlodlm+IkoVXej7FCs=;
        b=MZMsVV+hZ/kscpcH1O6YIZbZdG9TtrTdip1u0GcFiEEXeE4zZcg+PFLav5aVcouP8I
         2N4nEskQKe7aiaIY7ZN986EkZIbZoAESr10/lhORPYqPpDqGtAyWCoiDrtxeJN0kZ1my
         266IfeSIxkeT1dlgO+w74k9TIvoc5HlGWOUpaKu6RkIYC/ucJIZKYKMI4PSYGFV/Qp81
         rbsyXoJwryZfzTOKd5jYcoxy0ragg6n3G7fqHqR9syE7rhK6efaDrpYEjm+uhK72iLPn
         TLKHbtDI2sSIcTYeEOk3ec7cuSS3iCV1OlZMzui9W1KyR2UvxNSm3Nl14Rlv4f/KptH8
         yO+w==
X-Forwarded-Encrypted: i=1; AJvYcCVYFn4Ao2/iazwLXiXkH01rkFZ0ytE6/d11cFTo6qtISCErhEa2tIyhRNYPLguuHe7u1x7xxc0YzoqvtP8S46Uh@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+mghRjbMr4jXMXCx5IzQmteTgkaovuF3mUV5xfPb+0mA7TkqD
	tX8SuC6I+ewi+FWwy1rd5DTQNb5VS5/0+aZoeef10SRo+dNsA3Db+S5T
X-Gm-Gg: ASbGncuoyCXEIZl+vyGJlZwszOAlZX0EZAkxc8p1z3m8oUPzkjISauwL0kex9VD7hKi
	zPJE5h1v7rti0vKB2r220m2E+1LwR//lTcW07vF61HWCs1T4biaKCaaPSLPwmAefylb+7r1Q7pN
	19z/IPp/4O+yHHOFT8inCiz89d37op53sPeCidxDQgxeHEuEgNzYCHBGkCY688OZdnU4RWGbrlJ
	uydRNdI2s1fNZbrphfz9ZIgc6nI+y7BmfQcoI+3fBulpf4S1kXkvbLaJGz6DU9qh1X98Jf3hl9g
	k/R6G1CjwBhQY6F6+DMekYuOPDV6ieMN+cLuPfGCAXxP9pq/HtaWFSNKPWsr5ptN75/B35LeFnV
	4zZMWvyoeBmIbE3KDQsc3txFc7xR3ByWA0PcsaXctgRTi9mkdv/ilh94/ZpOBYvHy5nY=
X-Google-Smtp-Source: AGHT+IGJ48A08lAcVKcYdk0WkcJU/k9veu86ugQxlnRCGNKMTcl5D3T3DnGhbnyIKjGQKizhhH8t5A==
X-Received: by 2002:a17:903:2f4c:b0:263:d6b5:fbe1 with SMTP id d9443c01a7336-269ba56738bmr118340355ad.55.1758524589057;
        Mon, 22 Sep 2025 00:03:09 -0700 (PDT)
Received: from [172.17.0.3] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-270cdb02c3bsm61149115ad.102.2025.09.22.00.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 00:03:08 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Date: Mon, 22 Sep 2025 15:02:48 +0800
Subject: [PATCH v2] ARM: dts: aspeed: clemente: add MCTP over I2C support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250922-leo-dts-transceiver-v2-1-d2dc0e24a70b@fii-foxconn.com>
X-B4-Tracking: v=1; b=H4sIAJf00GgC/32NTQrDIBBGrxJm3Sn+IKRd9R4lC9FJMpBoUZGW4
 N1rc4Au34PvfQdkSkwZ7sMBiSpnjqGDugzgVhsWQvadQQllxE2OuFFEXzKWZEN2xJUSkndaknZ
 K2hn68pVo5vdZfU6dV84lps95UuXP/u9ViRI1KTMKrUyvP5bd8nZ1cYeptfYFSinqOrYAAAA=
X-Change-ID: 20250918-leo-dts-transceiver-edc31e3c21af
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 george.kw.lee@fii-foxconn.com, bruce.jy.hung@fii-foxconn.com, 
 leo.jt.wang@fii-foxconn.com, Leo Wang <leo.jt.wang@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758524586; l=2794;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=9m5R4VJWufe7k7yurqqw3z2y+D8AnXNo6e7S0rTybvc=;
 b=H587RMaWwa8qjdxlMqKskZgP2x92LSHN4XC0VLs+x1k0fF8sSLgQ/oghPLxbeWH2ZTr3udvki
 ykREjgsCdz8A2JTncdm266pra8yLsRJBoZ5qb8m1GYIjQptIuBJiPlC
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_000310_430544_29B7DCD7 
X-CRM114-Status: GOOD (  14.22  )
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

From: Leo Wang <leo.jt.wang@gmail.com>

Enable MCTP communication on the Meta Clemente BMC board:

- Add an MCTP I2C controller node at address 0x10 on I2C0
- Mark selected I2C mux channels as MCTP controllers
- Remove unused "i2c-mux-idle-disconnect" properties

This allows MCTP devices to be discovered and used for
management communication on the Clemente platform.

Signed-off-by: Leo Wang <leo.jt.wang@gmail.com>
---
Please consider the patch "[PATCH v1 1/1] ARM: dts: aspeed: clemente: add MCTP over I2C support"
withdrawn.

After further review we determined that enabling MCTP in the Clemente device-tree is not
required; the affected devices are managed through other mechanisms and adding MCTP nodes
would be unnecessary. To avoid confusion and noise, please ignore the previous patch.

Original patch message-id: <20250918-leo-dts-transceiver-v1-1-3e2580325edc@gmail.com>
---
Changes in v2:
- Withdraw patch; no functional changes
- Link to v1: https://lore.kernel.org/r/20250918-leo-dts-transceiver-v1-1-3e2580325edc@gmail.com
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
index a614f947dafc9a6628c3f3d45b62ff3ca9d2b618..a2f0ed6e7bbefbdcec33f7ddebdf2de62adec164 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
@@ -269,18 +269,23 @@ &gpio1 {
 
 &i2c0 {
 	status = "okay";
+	multi-master;
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
 
 	i2c-mux@71 {
 		compatible = "nxp,pca9546";
 		reg = <0x71>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		i2c-mux-idle-disconnect;
 
 		i2c0mux0ch0: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
+			mctp-controller;
 		};
 
 		i2c0mux0ch1: i2c@1 {
@@ -332,6 +337,7 @@ i2c0mux0ch2: i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <2>;
+			mctp-controller;
 		};
 
 		i2c0mux0ch3: i2c@3 {
@@ -457,12 +463,12 @@ i2c-mux@75 {
 		reg = <0x75>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		i2c-mux-idle-disconnect;
 
 		i2c0mux3ch0: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
+			mctp-controller;
 		};
 
 		i2c0mux3ch1: i2c@1 {
@@ -514,6 +520,7 @@ i2c0mux3ch2: i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <2>;
+			mctp-controller;
 		};
 
 		i2c0mux3ch3: i2c@3 {

---
base-commit: 1937f781fe7fcde26e537e74dfc6097fc08fc9bb
change-id: 20250918-leo-dts-transceiver-edc31e3c21af

Best regards,
-- 
Leo Wang <leo.jt.wang@fii-foxconn.com>


