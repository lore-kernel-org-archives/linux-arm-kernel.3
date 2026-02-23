Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78D4EA4FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 11:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DDyXUHId1Z/nYWBwHmfSalP2sAsbJktA9TnrtpJPbyI=; b=csLiUSyY8kbo/SkZJmy28J0ACP
	COIOOqMS7YsEABFOFEqkgOVJOuAltujzAxYFjNAS9pTj7ILZKdGbMx/IUK5ggXcSXdWJNb01qzqVi
	J+3nCiEMzoR6ajFE17MEKeqJwTYBSZrAuxxuVPGrmg2HbWHAxAlmCxArauqesBDkkzqOAMlJ3iykv
	nJxL/eGVZsy3PglPlS/0R6Kv1c0E8EZFsBJTblTcOmubkOX17mk89Sh4axsGYsDJKwHxGSVx5Kgu1
	bE7wxbQUfCLAfFjkDPQ1o1NzHvZfgxr3IfxY6PHOadOSgNfZfjFSwC6fWMc2ZQXQNdDKpGYuEiJ5b
	6E1JrFCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTx3-000000009RM-0XN5;
	Mon, 23 Feb 2026 11:18:09 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTwv-000000009Hd-1LG6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 11:18:02 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-2ab46931cf1so31585005ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 03:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771845480; x=1772450280; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DDyXUHId1Z/nYWBwHmfSalP2sAsbJktA9TnrtpJPbyI=;
        b=mdR0mtn3FIQ3GnF5ttLcxCMDchzDNeKZLRYgbaXTHllPBOjY8PijdVy/7ZzvsSRE5f
         xyCTrpDS+vupswH4nkXxGOIzVqZLEakR18Y5QQfG4FWlJZU2SiuVdOpTeVcxsnrU2vsC
         tzi/sbPWa46x3Y8KZ3dmAcuuovDj9ebxX4r8MPxKWEVEzKOPFbJl/uuq68Fg0Om41ram
         DK4+olIQz901pvHJjOmreLgZpuSLA4m3vsqwbYPpDUFy+L7xBhg3jrxtWJfiD6zM0LV2
         EldkmBJOTPYVdMHe6/1Bl2ES1BRmlFO9QmGAXsmFtq70iV6BuFCYqnnAm1qvMvdYDsW1
         Aizg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771845480; x=1772450280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DDyXUHId1Z/nYWBwHmfSalP2sAsbJktA9TnrtpJPbyI=;
        b=fzw3/gsgoC5vyHkJ8fqDy0NlomRiJEMatlxyBVsK1O9atWJyU8OmRzSfNQNCid1PnB
         +biDpKKoSpFlRtCG6uUi3N6CwYz91orOcWsl0TxIJwF3HCmA7ER/PC3A6utUGcFj0P76
         OYvmYkOnM94km0sGUkmAJGzsqR7VPQVaiKpk+df6+vOun1KQt4qZcqWX5GlsmRmQUHpi
         XVbfUouY+Mshu6Wu4fI1bQgu/dKEc6DojdDUmrVKq6O5L4tJ05n9riUBiumOifmTML1h
         DfYtPkfTRVnUNVlPdBzuU7CuHlxqdxTaN/noHVd5sQ70UbMk4H5Xvwp6feL1CqgAYC5P
         YCTw==
X-Forwarded-Encrypted: i=1; AJvYcCWNjM4GpkQ7qD4cPGb4Z5HHzFD1cB0E0MvlBv05f2wCW9wEXzVTSol4tkHxZj8zNvwK9ur2EtNzR9f+HIDz7RrW@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7PaA6sQD7+ePs2rQ1BhXxP7mrBVGU9qjYYWbdmD4euHN+3+x6
	Tcpy8wkTfjXDdkDjOz04SqgeANvQmqxCBDRG7NWROnbXiqtul+sUHwlG
X-Gm-Gg: ATEYQzxzDOn7KRorD72u1GWQjAM8/dMTbuvE2Qw5YK44rRgwYCVAWc8YSg9z/r0hWCV
	gm7ziL2ktP5G6SwKVBVY+Kelz5eDKOBhiN5h+TjbKkWTsW97VA/qKOLcV6aFTY0V66QQw4Lmz5h
	Mz6Laa/lIg8UZJGiB6tiVXGC2/5eT7tulLAB4g54v83eAckUSeiTYv0exNuEcx/eDXE2Ut75oU4
	2VPynUu1IC8b+gI4bVGZzeDS0TL5AU23tuhApH+VYl4SGkyGt9VHIEVJBBX4QCEtBbc+3yql0R/
	kGLtG2a+Q1SlmDn62VRGHrf2DXxx9Ib+REfQBjbhBIZAwKIEwIqtY9RkV6eYG8lFxQ2tsOBxgKW
	gBPagCKUN9Cz9LaY6wKYqDAzlnxZW8TMW/7RqJrYqej4DcEfbtpwiyFuZITxVM/ohiBnjhmbOX5
	PNCMQF3Ec1fuFQUya8S3Ym/BBx/y5OlH9ZuXhYJLQZBPUwg9OAI3PTqiK4Dlq5fJ2UfRa+AXfoA
	Jbil2k9oZYUuZxBvAzM0mtC2B0IsqZ80n6wvaETzueD9XKwXbXkcCFzsEyA+H9Usk5tfLhjIF7s
	hC60dVNPxJQr8HBsbD6h1U0pK4AvawQ=
X-Received: by 2002:a17:902:e851:b0:2aa:e238:e20c with SMTP id d9443c01a7336-2ad742acbf0mr72695315ad.19.1771845480316;
        Mon, 23 Feb 2026 03:18:00 -0800 (PST)
Received: from 2001-b400-e3a6-b683-040b-c296-04cb-fbc3.emome-ip6.hinet.net (2001-b400-e3a6-b683-040b-c296-04cb-fbc3.emome-ip6.hinet.net. [2001:b400:e3a6:b683:40b:c296:4cb:fbc3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74d36911sm71799335ad.0.2026.02.23.03.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 03:18:00 -0800 (PST)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Mon, 23 Feb 2026 19:17:39 +0800
Subject: [PATCH v5 7/8] ARM: dts: aspeed: yosemite5: Add debug card bypass
 GPIO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-yv5_revise_dts-v5-7-fc913e902488@gmail.com>
References: <20260223-yv5_revise_dts-v5-0-fc913e902488@gmail.com>
In-Reply-To: <20260223-yv5_revise_dts-v5-0-fc913e902488@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Amithash Prasasd <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, 
 Ken Chen <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, 
 Jackson Liu <Jackson.Liu@quantatw.com>, 
 Daniel Hsu <Daniel-Hsu@quantatw.com>, 
 Kevin Tung <kevin.tung.openbmc@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771845456; l=1580;
 i=kevin.tung.openbmc@gmail.com; s=20250924; h=from:subject:message-id;
 bh=qeVbrH9h2lP2i/7VhrZSt6TtWWoZ4Z6EMuUxjGVFuDU=;
 b=mtYdAN+CZ0MwbFt5rxjjKWwOf6MvRuhPUHRoV3l41gXRNKMx2aSxbUh/32XmK+5CAo20PK5fo
 UkRZzzPDHZVB69NS1UQa42rokr1SCrzd+oEjqC0iUwPy13XEEn8Wneh
X-Developer-Key: i=kevin.tung.openbmc@gmail.com; a=ed25519;
 pk=PjAss0agA0hiuLfIBlA9j/qBmJaPCDP+jmQIUB6SE7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_031801_399634_0531F82D 
X-CRM114-Status: GOOD (  11.38  )
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

On Yv5, the SCM CPLD bypass OCP debug card commands to the BMC.
These commands share the same I2C bus used by the BMC to access the
SCM CPLD for firmware updates, which can cause bus conflicts.

To avoid this, the SCM CPLD provides a bypass control GPIO connected
to GPIOO7. When asserted by the BMC, this GPIO isolates debug card
commands and prevents conflicts during SCM CPLD access.

Add the DEBUG_CARD_BYPASS GPIO to support this behavior.

Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
index 30fb41fdaeb7a2276cdfe98654696a16cf1de5fc..f590ec6e00c48afe4ade1fb98011780ac0570e7c 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
@@ -166,7 +166,8 @@ &gpio0 {
 			"led-postcode-3","led-postcode-4","led-postcode-5",
 			"led-postcode-6","led-postcode-7",
 	/*O0-O7*/	"RUN_POWER_PG","PWR_BRAKE","CHASSIS_AC_LOSS","BSM_PRSNT_N",
-			"PSU_SMB_ALERT","FM_TPM_PRSNT_0_N","PSU_FW_UPDATING_N","",
+			"PSU_SMB_ALERT","FM_TPM_PRSNT_0_N",
+			"PSU_FW_UPDATING_N","DEBUG_CARD_BYPASS",
 	/*P0-P7*/	"PWR_BTN_BMC_N","IPEX_CABLE_PRSNT","ID_RST_BTN_BMC_N",
 			"RST_BMC_RSTBTN_OUT_N","BMC_PWR_LED","RUN_POWER_EN","SHDN_FORCE","",
 	/*Q0-Q7*/	"IRQ_PCH_TPM_SPI_LV3_N","USB_OC0_REAR_N","UART_MUX_SEL",

-- 
2.53.0


