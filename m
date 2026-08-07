Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEAC6C5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 08:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6soMHfgqRF4/fxzi3W7/7Wz7EMGwWasAIJftZ/Eo2FA=; b=vryoYh+dLUAnYzxGyENKd1ail1
	VMrGJHXbNfXfbUbhpWa+7nHZduRSIdKc/U68/nGOCax8IcbNbtpBeSBLFouku9/NWn7hPrr3az2YM
	GFHjs8QR9vih/XmkYHNZ91ExRsXhM5qB4DrwIMnGQ6QR2Ssw20GvIjkP6YOwbl5a/i+aeaKjbuez3
	dGdeNoGZ3GhHDZ/7QY4+j3DCY1BvkIOnGY1NcfZPjLeFi7bs6q/j+bVEzskixpcrj9RuXcG7lIqmV
	chnhmpygMkADaq0/dpUvVp89u71vHfVe3/lf2AWmiuo7qbEKXSOcQTrcSuc9PVX07i86BV/T9MJL2
	g41m3wVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFzs-00000007QFZ-0rIh;
	Fri, 07 Aug 2026 08:32:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFzr-00000007QEj-1TBU
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Aug 2026 08:32:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=6soMHfgqRF4/fxzi3W7/7Wz7EMGwWasAIJftZ/Eo2FA=; b=SwyKf5DyKq/uqa8i7cZhFopZgs
	TbO1Y6rGb7K0WHeNDaQ1gwxWVYeVQ0MZB7ehzJ4+GcgY2ZMXGxzdVvCP/O+F3lzwSVSdQLLKcZydQ
	c5dJd0bYHCHgd//bElC+XvIC+FV8B8PAPavdrMTCKk2fpvSz9grBsjzbjQYDqAbIczANrS1T7Y75z
	FujpX68LCnBYkj4GtH/OvLBHbyfbX5wNqb45fegptQN+xV9Fn8Eq/pu3ewmdlSX7L/qOoJBniFDDr
	jcreBFbAwTdITdgjl3nIQfjMVClOgXfpcQi0cCiOA2+AuWrlRO4Lhxx9D+N+onxz7bVsJ8+Vvl/fa
	QrVw81gA==;
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsFzo-0000000CCSq-2b2W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 08:32:06 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso3644883b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 01:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786091522; x=1786696322; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6soMHfgqRF4/fxzi3W7/7Wz7EMGwWasAIJftZ/Eo2FA=;
        b=h7h4IRpKMMlGL+9ADETDL9Lkf4VMssFxiCuogSEsgtEuWollcJFa2hpbf3UbP2lazO
         CcFjNgfOJ3oD8d46+rZYW+RY2ZIo1PskGhRAEClFIIJhWmkX7nTO6/txRWG1Q4x1NwWz
         UAR8mezXLEdm2DbbZuc00GMIrxbtEfChRRwShCdZY9wmsHPazSz72MP1jkHXQb/pSRzY
         SS1KidxLSyU5rTLM1nzx53fxxV9jAKhkwxq2TMHCw6sf4T26cKhg0awfzFHMwi61JsyQ
         8eWfgDQ6aVedPJ9acb+3oHyp6bNpU229SgyAPHOaGho09N3srkVz+7VwFrhocw/pLW2z
         o4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091522; x=1786696322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6soMHfgqRF4/fxzi3W7/7Wz7EMGwWasAIJftZ/Eo2FA=;
        b=Qw/2Cs0zhFx/5lBiLg76E9sHJ60V+yA2Msq9UZ65aw5kyinK8Zs/3i8JLjLi/BmTcS
         nwaFfkAGjnIBSfc8qI17Tq6IaY/8ZoL/uKiFwwFpVrFXF6jKEKB+zHPqTOSLQFOWAol4
         p6oEpmGVgFI7ukGvTk22y2ed7oOPE4AOsgaDimgo1Eyw9AoLfTlR8pBoYAhGqdkrMKSC
         MRKYspKz44b3ePbn2zvemN4vctxoP8SoQ2pGEqi6whhKiH4zOtedj13moxvWNOZTQXC8
         tuFvTf7yPwF+FeNv8a23hJ//zcAdHxvuF5z4SZT1ABTXtDRoTvp61vcF+luY6JrjwQJb
         upqw==
X-Forwarded-Encrypted: i=1; AHgh+Ro5KiSuZuZUW1stfeT74D0TIq4echlJBIAfvI1pNiRUtSzUr4YOUhQdLojXtrgTUEELyNDcN7m/ofg63b5OflwD@lists.infradead.org
X-Gm-Message-State: AOJu0YwFZ7vPFCIAEsNXLeshf/Klvu/Eos6GQilJ6YcsH/qWDHbZz0us
	y9TG1JL+eHNNv5cOd6b1OKnXReUqZ35Ic7FhJaIbv+JsZOztV9LxWXE9
X-Gm-Gg: AR+sD12Blg9gW/sZot8kncuzqMiK3nKLWVc+DEwhO/T8A8Pz2Vs+yzlNNqSCWqBS+AG
	FrxwYxUc4tVL/EnphDe7dUd1VesoNhBWexd4+kPKGAIwFniTGvViHFUXNmWKjYWhbb8PZVyO4Re
	VriRdUR/gaq87TNlpVIvywCVdQd+Kal6jSPmMJvaJy694MpWoUaEPhuvnTLbSBtg8UElGpd94+s
	vauEKGGoPeujNIA0tG6NkEL/JFMLsios9Fz9XX5GqngxFRXWic7UHcha89/yBxg6zetHLNbpqqk
	gwMtgHmnJ9dXEhrJ4+92jBvzWHbFh6TnOXW+V7HvqKan3tJQvCPc0NJ58RcBfXskDAcRb1cd8w9
	mPD7NnYTMW5CsS4kgCbORXzEEZCMXnFSwU5zXzcvPARjEWkMyS1Hp+bWbXZK7WkKsNTSpruhH4V
	nW0mZsL8Qq38H5EJ7uOnR9rbReH+KHj1LWgC3jnUwtbtGOIs1I/6dPHsICXaeIP1q/9E9sFDG/W
	prBoxTLBazWT3eHe5ce8nlpOMX0pOlQ24IxHag/TtaEfDsb7g==
X-Received: by 2002:a05:6a00:808:b0:847:973b:3cf6 with SMTP id d2e1a72fcca58-84f2de720c9mr22542758b3a.0.1786091521938;
        Fri, 07 Aug 2026 01:32:01 -0700 (PDT)
Received: from fred-System-Product-Name (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a553071sm627409b3a.43.2026.08.07.01.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:32:01 -0700 (PDT)
From: Fred Chen <fredchen.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/5] ARM: dts: aspeed: santabarbara: Add JTAG GPIO line names
Date: Fri,  7 Aug 2026 16:34:06 +0800
Message-ID: <20260807083415.672008-4-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260807083415.672008-1-fredchen.openbmc@gmail.com>
References: <20260807083415.672008-1-fredchen.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_093204_777553_179881AE 
X-CRM114-Status: GOOD (  10.63  )
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

Label the GPIO lines used for the CPU JTAG debug interface
(TDI/TCK/TMS/TDO and CPLD DBREQ/TRST). These lines are driven from
userspace via GPIO bit-banging to emulate JTAG signals for CPU
debugging, so naming them lets userspace request the lines by name.

Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts  | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
index 04fa9a5e0d04..9d334a01d407 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
@@ -199,7 +199,9 @@ &gpio0 {
 	/*F0-F7*/	"","","","","","","","",
 	/*G0-G7*/	"FM_MUX1_SEL_R","","","","","","","",
 	/*H0-H7*/	"","","","","","","","",
-	/*I0-I7*/	"","","","","","","","",
+	/*I0-I7*/	"","JTAG_1_BMC_TDI",
+			"JTAG_1_BMC_TCK","JTAG_1_BMC_TMS",
+			"JTAG_1_BMC_TDO","","","",
 	/*J0-J7*/	"","","","","","","","",
 	/*K0-K7*/	"","","","","","","","",
 	/*L0-L7*/	"","","","","","","","",
@@ -1911,8 +1913,8 @@ &sgpiom0 {
 	"FM_IOEXP_U541_INT_N","FM_MODULE_PWR_EN_N_3B",
 	/*H4-H7 line 120-127*/
 	"FM_IOEXP_PDB2_U1003_INT_N","FM_MODULE_PWR_EN_N_4B",
-	"","",
-	"","",
+	"","JTAG_CPLD_DBREQ",
+	"","JTAG_CPLD_TRST",
 	"FM_MAIN_PWREN_RMC_EN_ISO_R","",
 	/*I0-I3 line 128-135*/
 	"","","","",
-- 
2.52.0


