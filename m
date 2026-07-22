Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5921CC4453C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 17:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1w/L0JEj1tAoEtTkbuyiqxCj7tfW27Vj36Bhq5Zj1YU=; b=Rl0yj0LmBIBkNTAfmyQSpqGHiP
	TxKpICCa1ie2j6oTbB2yQhoL6SPKA/o7i3T7Oe8UuY2TXWBtkBuR6PPX/i0wyjwIT8fbDqgXn1Ceh
	6ENa4GF0MxreiUGIINLE09wD2OS2DsRFvqFQtYjJrVQi5VK0XYyVyvKBbFZ14ZpBlkR2vhbipIDSo
	H8XxXJ3e0HOvT9sMbP10oP7bxBR7kB3PgTtLR1L8RQ4sbP8B89xYxMdnbEtxQxx76b2kaORj8qdEl
	mBXZnE2hSed9Nl285kn6POAfAwZTxbk37WHAa8hIVOKoX9WFoMmi3xlSRh7qrJpw/BjXgWFuw6ZlZ
	nwMpiSAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmagt-0000000CSRP-3enH;
	Wed, 22 Jul 2026 17:25:07 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmagq-0000000CSPI-0Wsz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 17:25:06 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-848d21bbaffso352197b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 10:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784741103; x=1785345903; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1w/L0JEj1tAoEtTkbuyiqxCj7tfW27Vj36Bhq5Zj1YU=;
        b=GpXflw+eRTs1qfIuZewT4F6ExyEn/I80lDzWBRBk9Gj7jPq6OSJnQ4tg7gC71yRri+
         HfceGcbbsMmePQ5OCyDaM7/iu6bYlLewxy3bw/IgOEdpTxQwWOq4TsZ7hFVjkn9wjMMB
         kWAOei9F4nqYdCHylQm//Aa7qgQ0zthPozJ7H/a8on98A29FacU8Dp1eceQoTF3yG5lz
         aWQOodL8nKUeELEBdAHVWxppsYqBuDFGh6gFHd3XPAyCV0uSDYNyhiL3Z6D9bKr0tjfe
         zWwzNHd6mMzKph9PGPysyo0sRrA7mN2m/vCyrd2im80S8ACtCbRPQeLPVdkW81sh03dP
         MXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784741103; x=1785345903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1w/L0JEj1tAoEtTkbuyiqxCj7tfW27Vj36Bhq5Zj1YU=;
        b=kGp3K1ddlxgCjRofrtgag874OI1xiC5bt7cDOiqTDUzaFNPQVD0UxQEJ/Vy4A1AKRd
         8QZ3EStN6YL1c7u06gcQr14hcOj+4XchQ0bPBR8J3U7M3yWlhvu+Phmi0fwRcNNVEK9a
         kmY2MYVMoOxRZ3x+KzBzebw71VA8OYMZgtlZ1kpyiim8uYcq1X47dWrzX61aQ9dfkbhY
         pYFVj7vEldyBLK3WUZmf11Ew74wVa60GeIHHVxa0jYWNyDb8oMJGV/e+A3Opi++YZ12g
         +V2R3e33dQXtKOklbT+/77NesDnt8ErlYvi4lC0qcDMbmJNdEW3NtQ8UzTrJTM2VHx0e
         pnvA==
X-Forwarded-Encrypted: i=1; AHgh+RpD2FqcdB3SYNS6yXpsL9lL/IqM8RG2Ula1HfJTFRAq+z6SldY+nsXxrn/qbrZ+5kNIctgXXrzALPUb2xcdubYt@lists.infradead.org
X-Gm-Message-State: AOJu0YxHxK028OixSMc5tjaRwXLj67zU0SzhacqLSdeCijdubU6XdwG2
	XJqL2UCu/oDGOVgu7eULJsJnLTMmmxZiJCXxHSovspUmH1nmorCzORQq6SNe94KS
X-Gm-Gg: AR+sD12ReVSFpOeKkHC58ZFQTtaoRBhDMiP25V2smNmwRMnRQPYBwQi1a3e0dA0bPrI
	tJcCAcrmFKkGvQBBLX/B+er0DM4E+K9oHlJCwOVzAkyiYUov5jjTn5QX4yCDBfAGBvLy1ddga07
	jtO2G/PPVbJJpD7FD5ofH0BfmMRYwF4Ylmj6mvolvKjWgg3BgI0KMsTVvJZYMKv4QEXrn+dWT3c
	LPkTVDOP8FWhE0EhEx/PT3FM28VVkjQEtlishc3einxqGUHXqOyR16sxEcsktCHUNMNF0R8G2Dk
	Mqjdywm6TtBG3VRANZzviiqnh/ZMqo0YV/p62Xz3dcYu+0ONhC68gh7ViO6w+aPNPd1y4o4crMG
	Bi8WwXb3/Za5ukP1xhZBM7iU1y53lxRN9wFHFxRQkjJk0s2TlHw0VGrtbRHGBCVqKpnkczK+yiv
	dQlvPzWDeGjX2ooVNtEFQd/IHUSrREELiqpRUVAJ9xyHN6
X-Received: by 2002:a05:6a00:2e07:b0:848:2f84:730 with SMTP id d2e1a72fcca58-84c294e6a56mr23499585b3a.67.1784741102709;
        Wed, 22 Jul 2026 10:25:02 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e1757488csm1645603b3a.33.2026.07.22.10.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:25:02 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Cc: Yingjoe Chen <yingjoe.chen@mediatek.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM SUB-ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b),
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] arm: mediatek: fix secondary CPU boot on Thumb-2 kernels with Clang
Date: Thu, 23 Jul 2026 02:24:43 +0900
Message-ID: <20260722172443.534251-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_102504_189889_34089B9E 
X-CRM114-Status: GOOD (  15.63  )
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

When building with CONFIG_THUMB2_KERNEL=y and Clang, secondary CPUs
fail to come online with "CPU1: failed to come online". The address
written to the jump register has bit 0 set, causing the secondary CPU
to start in Thumb mode.

secondary_startup_arm is ARM-mode code (.arm) and, on a Thumb-2 kernel,
expects to be entered in ARM mode in order to switch to Thumb via the
standard sequence at that label. Starting in Thumb mode causes the CPU
to execute ARM instructions as Thumb, resulting in an immediate crash.

Clear bit 0 of the entry address so the CPU always starts in ARM mode.

Tested on Lenovo YOGA Tablet 10 (Wi-Fi).

Fixes: 0cda07001a94 ("ARM: mediatek: add smp bringup code")
Assisted-by: DeepSeek:deepseek-v4-pro
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 arch/arm/mach-mediatek/platsmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-mediatek/platsmp.c b/arch/arm/mach-mediatek/platsmp.c
index 6b0943d95555..9a7c65fc3ae1 100644
--- a/arch/arm/mach-mediatek/platsmp.c
+++ b/arch/arm/mach-mediatek/platsmp.c
@@ -124,7 +124,7 @@ static void __init __mtk_smp_prepare_cpus(unsigned int max_cpus, int trustzone)
 	 * write the address of slave startup address into the system-wide
 	 * jump register
 	 */
-	writel_relaxed(__pa_symbol(secondary_startup_arm),
+	writel_relaxed(__pa_symbol(secondary_startup_arm) & ~1,
 			mtk_smp_base + mtk_smp_info->jump_reg);
 }
 
-- 
2.54.0


