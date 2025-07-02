Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C314CC8303F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 12:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x9pvwsjMWPA9nQD+iBKKTHpsU97t1wWZ+fWjmxW/6k4=; b=ajCS22FnDASPuWZ/BNT0wfdq1b
	s5OOvYadS9ik+4H7y1X1DMT77sVlnOpEM+JzwuG3MMXYeS4pm8Nch/UPNqjGENMWSGK3zM2p2EcUu
	K/KgAYuLv6ujiDh/PglCmLFvrbB95a3bFvN7qgeG58LdPHoKEOD6B59oGFlH45cisCuoqjl8hv2N7
	r3GOLDE5+DwvZa3h3YoDmtlNlRJkNyee2dqyGqs8k4Jmz4h9/StjEB+jYMrIgf5vlimEKemrz+Cw+
	VFEEuuMvBNK4TD0e6U/qF0CFZyJHbMQJDQnZy7FdYBhPxc6ciNJ/OssoKFF+I5h0dIGNSERmlFJ5i
	WAdb++3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwqQ-00000008LYR-1RFE;
	Wed, 02 Jul 2025 12:45:46 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwN8-00000008GyZ-1jT6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 12:15:31 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-453398e90e9so35812435e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 05:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751458528; x=1752063328; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x9pvwsjMWPA9nQD+iBKKTHpsU97t1wWZ+fWjmxW/6k4=;
        b=XeJGjs+8ncTuIpuSviSXdF8xJF/QZmhrnAxyYnhQ77mrCddeJUkkjbOSBCLGoBfNdb
         6IsNn+AcQIZoJdpsynMlG/92XTbNcykSoN9XpBY/T1Jz68Kt23bX2FxH5VXHK6G1Fzsl
         TzxjXNb8+xxAl6UxMJ6Ij7DHQCBnC9JiTjKsgbUCv7ttEIL6n6EXTapryysi5iQp7H0h
         SnoNGGRmgRRIzmvih7XYwBoyPv2n0PSoQx+KlfClB0EWFub1fCKby5c+YXma7kRFIwEh
         44X0Dk31uA0f+EEeUBuCD05eNFD+0XkwwYW5XVlbwRs5ZoTesYec41vRu1T+Nv0HLxZh
         5xkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751458528; x=1752063328;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x9pvwsjMWPA9nQD+iBKKTHpsU97t1wWZ+fWjmxW/6k4=;
        b=Wlb4cn5qMPVRFlyWFiGq07vR2+Vcv4EQkzPKrwfcVrdsXdSJEbGambfmMTV5AuIElq
         XDKCqtdsPC0/xXTR4pvVrYL7GqK1tBNnJ2n1Q3lr8twkerZTeUwoNSs8mXRVlUvIec1T
         ceedtsNHds0EnhorViaWwMwaP+BPJPpVZFxzXvGz8emieFEw+6um1HpyajHjzL6CquSZ
         GFFGk86cS7+dxK85ImCi9UUjFkoWNXpTsuTrEKxKPb2ebv2WoGSDfvmtjSv/i4ic/iVs
         r9eCo3PbgoS0+KlRucP+oWZytxp+tLrjZS9vIXDgAWALJNLXE0SyM0PzttjJ64Ny5jBD
         PBYA==
X-Forwarded-Encrypted: i=1; AJvYcCWEXYrLKu7vbkJGptxSCwtCTfv9MJn2oise3w1EA63UxKXjzA/aMUkO3EzTQyjNASmx5OdOmcdUeX71A17b4WAW@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1mMDV+Ypkv75wFk7JdqtSjh6MEOXf0O6+XpaijeTYhSZD+l7m
	KLzS7Vky0tAJJs+aj4x3dl2MkYIQa/7aH31NH1IkYMhfBMaG/j5UrWtT+lIybt73UII=
X-Gm-Gg: ASbGncsvq665JDfZB8z0LYDo90ip/de9ZiY/eSG0BUVPrIgbq5L6ycrI6fZR5HDHCVz
	W8++oR5zy5ZZIEf+ucl3CvrT3poRQsf5KfKtGosrP1hilsM4yZju2JL3n0yqU/p8gEc0aOONIxg
	vbuE3tjDbgP1kzzoDaan8giIeRbrpv1lOveMldV6PnLAPI+xWvNrS61xanAvgNDiz6+1P1Qe5e+
	rtFFym+aCB6EzJkdiMyHD7HW1M07WKJcCHIC3gaPhsWC9hqOLO7Lx3rCDNFmxy/VdfZwdujF10T
	eBTC+gO17F9V9HMZzFpSXWTHusoZiwIpSq1gCnRfJMu97I7cHWgy28lL9gVvwMbvggA54v51aJ/
	gX9PTJIrFLLnr4ZQy
X-Google-Smtp-Source: AGHT+IELgg5UZzqaTlSfiyc6Ytkoj6C/RHdaT40F4scmmqS3AYJLBC3dMjYCI068eBu4lplMXDVdzA==
X-Received: by 2002:a05:600c:4f13:b0:43c:f6c6:578c with SMTP id 5b1f17b1804b1-454a36ec540mr34363525e9.15.1751458528249;
        Wed, 02 Jul 2025 05:15:28 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.66.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ad01csm228256345e9.22.2025.07.02.05.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 05:15:27 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 02 Jul 2025 13:15:24 +0100
Subject: [PATCH] pinctrl: samsung: Fix gs101 irq chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250702-fix-gs101-irqchip-v1-1-ccc84b44ad72@linaro.org>
X-B4-Tracking: v=1; b=H4sIANsiZWgC/x2MywqAIBAAfyX23MJq734lOoRuuhcrhQjCf086D
 szMC4mjcIK5eiHyLUmOUEDVFRi/BccotjBo0h0NpHGXB11SpFDiZbycOFqlbdNPbUsGSndGLtL
 /XNacPzMOKGhjAAAA
X-Change-ID: 20250702-fix-gs101-irqchip-8d12d369440c
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1589;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=Sonnye7hZy2wt/2sdkee8anX7maKzoAKHEmbBG3T8tA=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoZSLecwK0sxfmoygPy9wJSjKSBq78rF5mEbSPI
 jagEn353PyJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaGUi3gAKCRDO6LjWAjRy
 ujWQD/9dX1YTX9ZBnRCltukRwwg2+Ex5ETtEJVtNrSYJtAj6JDjMCK32q+2ExEr8o4nxkdDbNZq
 tcQqwCP3OtUaNf5+cZALlUvIrAB9j7MfFyhCK+4V3um44lc60sulhIZZ9X427vxU6Oy2DovBzpn
 1/22Zjj3t2R9QmskA4AlInV2Rhr3PkPEeQGNS8xa5YGt0kV+oPVPJG94ckz6k0zUh2cvaFeuLfZ
 aPe9UVsynX81YvNMCyFXHB3aH81kI0VBciFnhcky7rL24T7ir+8tADpsIa5rrw9jFYrIWyRv5jy
 AgdOP44wde/WX6EnfhCJHFnQZG8LnefXO9dl0CykpuwsOXzssPy4QjFDm5ZWNHGB/K4t//kezHa
 9Z/xVRjGJrPI3aS5fvcIgx7kDjGkMSLFln7PadJmY2QzYMB8YJqe7IzXbu3jJ/lMBslF8K1RUNB
 6EQNW4j3/5j0SmdweFTVhgH6TmxLbKEYqblLtss4jgFvUI1d4eqTlYKzJyQoVsWOliXDsL1/Pa4
 NZSYa+eSrD0GMcItjGp9a6g4VPJcOG+9JgTcU+9kc5VzedjCQP7RrYcXkS2ysi4emDOh5K1sXrV
 bIYsUU73Un5KFJlI4nJsce3Zg58KY/Lm/r4SWokTVsUB/BaD4BGPkOl4lVPNR2nHk4NFvTe1Lwc
 rrGx4t9wNbgLsJQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_051530_454033_F2B27705 
X-CRM114-Status: GOOD (  11.01  )
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

When adding the dedicated gs101_wkup_irq_chip struct to support the eint
wakeup mask the .eint_con, eint_mask and .eint_pend fields were missed. The
result is that irqs on gs101 for the buttons etc are broken.

Reported-by: André Draszik <andre.draszik@linaro.org>
Fixes: 2642f55d44ce ("pinctrl: samsung: add support for gs101 wakeup mask programming")
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Note: no Closes tag as issue was reported on private chat. Permission has
been obtained for using the Reported-by tag.
---
 drivers/pinctrl/samsung/pinctrl-exynos.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index 5554768d465fe0d8bf6e423b2e835965cde5d8f5..81fe0b08a9af5682421e5a5533a6cb4c9561cd24 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -665,6 +665,9 @@ static const struct exynos_irq_chip gs101_wkup_irq_chip __initconst = {
 		.irq_request_resources = exynos_irq_request_resources,
 		.irq_release_resources = exynos_irq_release_resources,
 	},
+	.eint_con = EXYNOS7_WKUP_ECON_OFFSET,
+	.eint_mask = EXYNOS7_WKUP_EMASK_OFFSET,
+	.eint_pend = EXYNOS7_WKUP_EPEND_OFFSET,
 	.eint_num_wakeup_reg = 3,
 	.eint_wake_mask_reg = GS101_EINT_WAKEUP_MASK,
 	.set_eint_wakeup_mask = gs101_pinctrl_set_eint_wakeup_mask,

---
base-commit: 2aeda9592360c200085898a258c4754bfe879921
change-id: 20250702-fix-gs101-irqchip-8d12d369440c

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>


