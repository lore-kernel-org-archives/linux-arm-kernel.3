Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F3D9C36014
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 09:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lwuUd8hYGj3GNL0Azh/1bN6dVI+5gqcHi1ZNroqNifY=; b=hHKSCAIQGNdfuEXSFb4IPOEYgd
	S+0z/BoMhqpfz1IcsgbjF11A4K9e1dTxYk1y5K0r2aQQhAMWTr8PuAd++dd4y0rZccUXXWRrqX5YM
	tgqp9X9Y3/Mgpvaibplm5EpAkluz2gTZv5Gv/4Z8VcHdwXy4J6v3Z/bU6Zv3+4ah/+83EVFv9j7Mb
	4Thr3xjPwOtt7cl7H0Cbu/ILeucFQAK3lQtLSdL4GrkCFnAgAnGbsn+astCmDOdwLzBfq5JE+FMpC
	ey2Ps9q3kV2quJwK7G0LOmuZPycVjM1G8+bc/LWTIsJWLtkxS8/N0z4ketNiTFr3rS3g0ReXFj2He
	HEhMPdUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzXiM-00000002RGn-0CbR;
	Tue, 01 Apr 2025 09:15:22 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzXVW-00000002Ovu-2RdP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 09:02:08 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso2962444f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 02:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743498125; x=1744102925; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lwuUd8hYGj3GNL0Azh/1bN6dVI+5gqcHi1ZNroqNifY=;
        b=P/R+Xngo7PAljRfyR3GC3ZclQ4mZlVnNUJonV47TXGB0hPESBgAX+Bk0phf8LlDmg2
         8WRkZmy0ygPnPwKp692jpTuvAE2Wv+huHwAiLdIMNoD3erWbu/r76uIRMwh4CrNoQBH3
         w0mt94P/HSCxWXrCl//VuDWfB6aGvYVGFQapMOd9e2ryatJuuLIiSe/D0zOCt5wK9yPc
         lw+nl9G6lvxbex96VYsvZzvRO8QXqI6Y6Davhk6ELCFyruc/xCCjeGy5OxhgsT4rK4pT
         4yvBRQsfXm35oI6rf9h8JJsJQCzd3IRY4zHTvDqoynzcayAVivztwIjws+ofoCn/PY8B
         GPcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743498125; x=1744102925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lwuUd8hYGj3GNL0Azh/1bN6dVI+5gqcHi1ZNroqNifY=;
        b=puOKoaYeF4pZE9WpwvpPlg2vpLZeDmHBmBZlqzcls9TfblSUqraa7vRmDVFHvatp/b
         NTh88NLNgKxzD6kd1VBd4uIIWfv2awHORGspJlHJknTU6PQIUN/MJO/nNaZJJUGm3HMT
         ui6i8B4fF1HJBKw86zchI+3GutX4QMp+RsumCiPt0hKvR5IzLQkY6Jo6u4c/pgKl/6fW
         Q+QrjWT7uAdiPDdZMgh/sMx24mDgDHYgrcf1MVq32pdeUzaRpkr0TA4k9cY7etEkSOQt
         ZuoZ/WEi6ILdpnf8nNJ1gJy0Ary3MWJyo2DLFTtsoo3nFF6YbN4xaL2Ziox2WglWmGRW
         9YZA==
X-Gm-Message-State: AOJu0Yw48SrN3AJbSRgf/45wLRZ2d8J0LrD0zEZdSiNt27au28aUwefh
	YjxiaD5wGvkLsyTJuoh8p6vrRUovjrvIdf9vWlC4UfHocffT6dqs
X-Gm-Gg: ASbGncuwuAdScukYSzYsvaN9GXe0gDJk0X9GwnWLedgHvqCPNpCKQbVUz6eXflrqFgv
	FQXV0s5M1NU5aJpLBXSIpc3Grey7Y7TB8eB7bfrXUuPiWNMc8OZxoUBi/P18f0ZCcVmo+c22ek5
	rOMd/prI4bfMz2dlugdh+liv0GqUjZGkOS2NMipKZmfuca3vb5SyA1p2RXAqjhMOoGwv0OjBZ3M
	Jfhwn2uWIDiI6JD4CCy/eLaPD0G8uieMSYK8uRQaS3Bs2Cy1yPlAby0wWJjiOiaT97rqbCwodXB
	Hu80rNLvDtzN6UWHLDS2C1kQUsFAZXxXaHfqncZKigMd2va6N1+8+HjUlUCcQZmPoKD/QA==
X-Google-Smtp-Source: AGHT+IG5q/PEbpPaVh0iCNItH4EvuvUb6MLDTDCWLGwP2sV7/oussH3tigDTStcR73sD1oJkDtjKpA==
X-Received: by 2002:a5d:6d8a:0:b0:39c:dcc:f589 with SMTP id ffacd0b85a97d-39c120dd036mr10663831f8f.20.1743498124843;
        Tue, 01 Apr 2025 02:02:04 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:cd7b:4630:9a98:b82a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fcd0738sm148391545e9.19.2025.04.01.02.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 02:02:03 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Russell King <linux@armlinux.org.uk>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/4] arm: shmobile_defconfig: Drop individual Renesas SoC entries
Date: Tue,  1 Apr 2025 10:01:32 +0100
Message-ID: <20250401090133.68146-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250401090133.68146-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250401090133.68146-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_020206_815992_EDC162E6 
X-CRM114-Status: GOOD (  10.31  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

ARCH_RENESAS is already enabled in shmobile_defconfig, which ensures that
all ARM32 Renesas SoCs are enabled by default. As a result, explicitly
listing individual Renesas SoC entries is redundant. Remove these entries
to simplify the configuration.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/configs/shmobile_defconfig | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 8c30ed14e52c..357cb144150b 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -195,25 +195,6 @@ CONFIG_RCAR_DMAC=y
 CONFIG_RENESAS_USB_DMAC=y
 CONFIG_RZ_DMAC=y
 # CONFIG_IOMMU_SUPPORT is not set
-CONFIG_ARCH_EMEV2=y
-CONFIG_ARCH_R8A7794=y
-CONFIG_ARCH_R8A7779=y
-CONFIG_ARCH_R8A7790=y
-CONFIG_ARCH_R8A7778=y
-CONFIG_ARCH_R8A7793=y
-CONFIG_ARCH_R8A7791=y
-CONFIG_ARCH_R8A7792=y
-CONFIG_ARCH_R8A7740=y
-CONFIG_ARCH_R8A73A4=y
-CONFIG_ARCH_R7S72100=y
-CONFIG_ARCH_R7S9210=y
-CONFIG_ARCH_R8A77470=y
-CONFIG_ARCH_R8A7745=y
-CONFIG_ARCH_R8A7742=y
-CONFIG_ARCH_R8A7743=y
-CONFIG_ARCH_R8A7744=y
-CONFIG_ARCH_R9A06G032=y
-CONFIG_ARCH_SH73A0=y
 CONFIG_IIO=y
 CONFIG_AK8975=y
 CONFIG_PWM=y
-- 
2.49.0


