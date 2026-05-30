Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4B5CD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 16:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c+oE8zzIOS3Se+b/rUAfcpZ/DI7FVtS/AJEmeRtHYxE=; b=usJ9ue6oejrY5nD4dmr+wzuBIN
	du3T+FjYToXN5ZVQ4uQuvVxJ90rsjwLKzd/wZC+KRv7rxUhMFcgsjCX8uqxEfUGWh3frpcwe8BLpG
	u+XoaPjXF2/TTRhlUIm9ef0H7UVL+HrgCOj131eSJ9L3z7edml7UVPKN4neN4Ktk5RgF/B8tUPDvP
	lUfKJtrR9UqAzvnPaRj0r2EnbXcD0g3eByp6nrji+LzTMB8gH1K/eCXhflsXSSAt4UeFICxm2kjIp
	Erd20ZLE+7pubjY+dKcQ83D/FVsCK9LLDq6g13v4gkYrCW9E/YzRz5z0aVFMzvhydmARdqhWZNTrH
	evyreGQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTMFY-00000008uh5-1fZw;
	Sat, 30 May 2026 16:09:24 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTMFV-00000008ugJ-1TTN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 16:09:22 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-49048e043e5so68500975e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 May 2026 09:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780157359; x=1780762159; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c+oE8zzIOS3Se+b/rUAfcpZ/DI7FVtS/AJEmeRtHYxE=;
        b=lec0btolFoq3wZuxouNZREoAK61Xk1tuN+Ghgp33Uv89hHwiWOgx3cwXrNUPNAxIrb
         QbzZaJ/kz3hCKzz3tofRGmKfD84NRxQx1vXr6NJhHxsW7SN39YARoMpyDh0kg439/KDs
         JoaRGKUhry8TzoWbW4xrvsbP9D+MTZFHEYF0eXlpaiy2VwaVwfqDLfwGiBXfS2NnqMVo
         Ls2yC0DT7ccBZ+3qNayjK/cb1mXoQvZwIL+FWAZ9RtiCwPW40Ef6aypNRcoqOQXtXb6q
         yeqRuLFVo4w1VdyF18634EilbSSqH5yqD2QEdDw+umqaocIMIev38G2Lcb7FT53s+wYk
         kYpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780157359; x=1780762159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c+oE8zzIOS3Se+b/rUAfcpZ/DI7FVtS/AJEmeRtHYxE=;
        b=VqPaOu7ZTj5tJFSRkacBj9axAlH7uSlpQnxodbcvpgoWpcmKn3rOx2slfBLteYA1dx
         ask5kbMuUxhoQck8+pprNiSGsJ67yYVp67JAm2IzUEP/EO/c0LrmpgyD+zspP2daWeQ4
         qvm0bTAYEIvGAgPklcuWyM27Qla4ZuebOVl2wGf/xhpdFtocGOVxVh7+Ng+/vtyTl5/l
         kaOOSWpf2NprSO3e1a5pppt3pAkKIOsi4fAiybJadST34CR3leapF/TSxeXugmIB6U1M
         qPLYcVIFhUzAbIrdXZEsuXLEIC0IgpgTl8G1wzKifNMNFJsRXANrjdjST9O11muinMtk
         8dNA==
X-Gm-Message-State: AOJu0YyE0kmnoTBTQmB3l4EqUIJaqPuVUUH8wKKla6QD2DxxtzVFcvbd
	4WXz9YfWOwDHS4UYtkuBD7iW4Wq/ecSJ+VhK5rKl4oLohBGGJeg/qvlgOajBRg8oSCI=
X-Gm-Gg: Acq92OEBBOp0ZbZ85S3eyj9BdeuHOvhyPqu94MGLpI4ZKcGAote0NHO0otg8I2CZwER
	OVq7j8j3R+jDJRipbi2rjdz6QGgGXZVJUUq7e8k6YCmzy6x0IuKEoqhXnxVvlFUTE7A//Iv2ogZ
	GL+zXL0ygh41ELX7SJCZKBgqACBZWy2OJho6oz899NXkUAGWADAUroG5WQqPwoVvqrlIitpzKnm
	14kLtWYqbzYBrFXzCnf4VeHxNR3F62aHqD4v68GMYpsk6jDLL+5vD8wZxgPEV/5vLVl77fNAsiS
	cC/qg/w5hD2jrCGRpfC39pmWLFob1K+3H/226SJdk7DiX2+3QHDBqd6OTV1YbWpYbCjWQ1QrGpc
	0HU3W2lxbFHy1GY56ZY7ahWa1IhoswnpdtoXlp3xhsdk4GMIezDjR3Rie7e8D0fWXj1VqHrWN3Y
	LITE6LAEUsAIyYJhpXsBVm28xknPwd28jXfm5YCQ==
X-Received: by 2002:a05:600c:1d86:b0:488:8bdd:cfcc with SMTP id 5b1f17b1804b1-490a28ab3d7mr81162665e9.0.1780157359207;
        Sat, 30 May 2026 09:09:19 -0700 (PDT)
Received: from olympus.. ([2a0a:ef40:ea3:3f01:2e0:4cff:fe68:285])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c110243sm55610615e9.6.2026.05.30.09.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 09:09:18 -0700 (PDT)
From: Dawid Olesinski <dawidro@gmail.com>
To: heiko@sntech.de,
	linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Dawid Olesinski <dawidro@gmail.com>
Subject: [PATCH] clk: rockchip: rk3588: Remove SECURECRU reset definitions
Date: Sat, 30 May 2026 17:08:14 +0100
Message-ID: <20260530160827.3453582-1-dawidro@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_090921_436154_DD3EA3E9 
X-CRM114-Status: GOOD (  12.83  )
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

On RK3588 the SECURECRU register bank (mapped at 0xFD7D0000) is
exclusively accessible to the TrustZone firmware running at EL3.
Any direct MMIO read or write to these addresses from the non-secure
Linux kernel (EL1) triggers an asynchronous bus fault and a fatal
system panic.

The non-secure CRU driver in rst-rk3588.c currently contains 17 reset
entries backed by RK3588_SECURECRU_RESET_OFFSET, which calculates
offsets into this protected range. These definitions are unreachable in
practice — any driver that calls reset_control_assert/deassert on one of
them will fault the system — and their presence is a source of confusion
and latent danger.

Remove the RK3588_SECURECRU_RESET_OFFSET macro and all 17 associated
reset table entries. Peripherals whose reset lines are controlled by
SECURECRU (crypto core, keyladder, TRNG, secure SDMMC, etc.) must
instead obtain their resets through the SCMI firmware protocol, using
the &scmi_reset phandle in device tree.

No existing in-tree driver is affected: none of the removed IDs
(SRST_CRYPTO_CORE, SRST_CRYPTO_PKA, etc.) are referenced outside this
file and its corresponding header.

Signed-off-by: Dawid Olesinski <dawidro@gmail.com>
---
 drivers/clk/rockchip/rst-rk3588.c | 42 -------------------------------
 1 file changed, 42 deletions(-)

diff --git a/drivers/clk/rockchip/rst-rk3588.c b/drivers/clk/rockchip/rst-rk3588.c
index c4ebc01f1c9c..7a856de64d9e 100644
--- a/drivers/clk/rockchip/rst-rk3588.c
+++ b/drivers/clk/rockchip/rst-rk3588.c
@@ -16,9 +16,6 @@
 /* 0xFD7C8000 + 0x0A00 */
 #define RK3588_PHPTOPCRU_RESET_OFFSET(id, reg, bit) [id] = (0x8000*4 + reg * 16 + bit)
 
-/* 0xFD7D0000 + 0x0A00 */
-#define RK3588_SECURECRU_RESET_OFFSET(id, reg, bit) [id] = (0x10000*4 + reg * 16 + bit)
-
 /* 0xFD7F0000 + 0x0A00 */
 #define RK3588_PMU1CRU_RESET_OFFSET(id, reg, bit) [id] = (0x30000*4 + reg * 16 + bit)
 
@@ -807,45 +804,6 @@ static const int rk3588_register_offset[] = {
 	RK3588_PMU1CRU_RESET_OFFSET(SRST_P_PMU0IOC, 5, 4),
 	RK3588_PMU1CRU_RESET_OFFSET(SRST_P_GPIO0, 5, 5),
 	RK3588_PMU1CRU_RESET_OFFSET(SRST_GPIO0, 5, 6),
-
-	/* SECURECRU_SOFTRST_CON00 */
-	RK3588_SECURECRU_RESET_OFFSET(SRST_A_SECURE_NS_BIU, 0, 10),
-	RK3588_SECURECRU_RESET_OFFSET(SRST_H_SECURE_NS_BIU, 0, 11),
-	RK3588_SECURECRU_RESET_OFFSET(SRST_A_SECURE_S_BIU, 0, 12),
-	RK3588_SECURECRU_RESET_OFFSET(SRST_H_SECURE_S_BIU, 0, 13),
-	RK3588_SECURECRU_RESET_OFFSET(SRST_P_SECURE_S_BIU, 0, 14),
-	RK3588_SECURECRU_RESET_OFFSET(SRST_CRYPTO_CORE, 0, 15),
-
-	/* SECURECRU_SOFTRST_CON01 */
-	RK3588_SECURECRU_RESET_OFFSET(SRST_CRYPTO_PKA, 1, 0),
-	RK3588_SECURECRU_RESET_OFFSET(SRST_CRYPTO_RNG, 1, 1),
-	RK3588_SECURECRU_RESET_OFFSET(SRST_A_CRYPTO, 1, 2),
-	RK3588_SECURECRU_RESET_OFFSET(SRST_H_CRYPTO, 1, 3),
-	RK3588_SECURECRU_RESET_OFFSET(SRST_KEYLADDER_CORE, 1, 9),
-	RK3588_SECURECRU_RESET_OFFSET(SRST_KEYLADDER_RNG, 1, 10),
-	RK3588_SECURECRU_RESET_OFFSET(SRST_A_KEYLADDER, 1, 11),
-	RK3588_SECURECRU_RESET_OFFSET(SRST_H_KEYLADDER, 1, 12),
-	RK3588_SECURECRU_RESET_OFFSET(SRST_P_OTPC_S, 1, 13),
-	RK3588_SECURECRU_RESET_OFFSET(SRST_OTPC_S, 1, 14),
-	RK3588_SECURECRU_RESET_OFFSET(SRST_WDT_S, 1, 15),
-
-	/* SECURECRU_SOFTRST_CON02 */
-	RK3588_SECURECRU_RESET_OFFSET(SRST_T_WDT_S, 2, 0),
-	RK3588_SECURECRU_RESET_OFFSET(SRST_H_BOOTROM, 2, 1),
-	RK3588_SECURECRU_RESET_OFFSET(SRST_A_DCF, 2, 2),
-	RK3588_SECURECRU_RESET_OFFSET(SRST_P_DCF, 2, 3),
-	RK3588_SECURECRU_RESET_OFFSET(SRST_H_BOOTROM_NS, 2, 5),
-	RK3588_SECURECRU_RESET_OFFSET(SRST_P_KEYLADDER, 2, 14),
-	RK3588_SECURECRU_RESET_OFFSET(SRST_H_TRNG_S, 2, 15),
-
-	/* SECURECRU_SOFTRST_CON03 */
-	RK3588_SECURECRU_RESET_OFFSET(SRST_H_TRNG_NS, 3, 0),
-	RK3588_SECURECRU_RESET_OFFSET(SRST_D_SDMMC_BUFFER, 3, 1),
-	RK3588_SECURECRU_RESET_OFFSET(SRST_H_SDMMC, 3, 2),
-	RK3588_SECURECRU_RESET_OFFSET(SRST_H_SDMMC_BUFFER, 3, 3),
-	RK3588_SECURECRU_RESET_OFFSET(SRST_SDMMC, 3, 4),
-	RK3588_SECURECRU_RESET_OFFSET(SRST_P_TRNG_CHK, 3, 5),
-	RK3588_SECURECRU_RESET_OFFSET(SRST_TRNG_S, 3, 6),
 };
 
 void rk3588_rst_init(struct device_node *np, void __iomem *reg_base)
-- 
2.47.3


