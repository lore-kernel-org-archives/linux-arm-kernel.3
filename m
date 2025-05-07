Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58435C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 15:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XjHm1B1Dol6/zUw3jQARhV/mKabUcXMJ3aVJNVwVxy8=; b=C/GV74YS6jy9qbDDvU2ylNR2Cj
	xIpWWB1ssni+QlgJXg3yPglIpakP8/rK813k7OU/HbugMDG86Uxy+w5VAShwtHV1Dlh8ycQrg7WMn
	7BYSC2DaqZ/SOEffhoUV1mzHkvUBI7cr2HVXWCfeljej1s5BmZ6CsazCFk5PNR0At8PNGAJP8f92V
	7VxbEvNJe7dvyfcx29IRO2AMnYvr8oQCtPOlEvAtVyxbz86k0m5V9pyhWgHhraU3wW0HXvaR6vGwt
	3BfLL1aXImEkNlvML1Vluh5OuSBcx2ehgnj3Y2Wr4Oq5svDZFuW73f3AotXXC1GsF2V6cI8rh4zl7
	vh7ye0iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgZw-0000000Fwdx-0ZBJ;
	Wed, 07 May 2025 15:21:00 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCfug-0000000FolN-2Ekc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 14:38:23 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso67829815e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 07:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746628701; x=1747233501; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XjHm1B1Dol6/zUw3jQARhV/mKabUcXMJ3aVJNVwVxy8=;
        b=Z1s+KSTqlD5w1pUX82EaiK7XfCC/5j88YaZ3hWuYnUXUAkdWnG9XfBuFMUgMHNjCw8
         bagVaSqRtyDUBMpmnrTRsy/kwLmu0Xp/hlQoGTwTbua0disrumsJORSW+3NC2m8a3keU
         aYngTWKDdZcGvCwmoqgxqUyWL8XEiN4MOlcickczuRLdJNrlYU9RPIrV3l0pIijP4rW+
         bUZcdTFKyCY7DkQbNlutMYQsIfDWuV+OHU4i1gstpRm4EZuaIKGao4Ep/n9qAeXN5HVK
         iW6a1t6bbomX6RHmtYLMaVHu5wCRtGjSV0ZAxz8f+0V/Et0Nt8ZIKWKLPxirrRoLa70m
         V4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746628701; x=1747233501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XjHm1B1Dol6/zUw3jQARhV/mKabUcXMJ3aVJNVwVxy8=;
        b=kTEb/DGqgvnBLwZptHZ+ri1hbTSabJNAvzAvb0kqkoa+yMSL5EZxBojSY01APd4SVn
         qfotS1hsiBMTxTkeW3dQmW23z3P8TVSG+fYBm9KlcGR/WAi6794aiAkSkrzNiJQM/KEw
         tmlyn7cuwwqOcx1iHQsgn8/4IbXN/JM+Qwegs+tuxuj5LGQrG21FUA4rb2PkAPGrMkBm
         y1CCEuhRI/CCdqQiv8dRp4wbOLTuTBRcLGsTpxtbvzWFM3uo7FslBotv4O14q4jYLTEH
         chbSD7F9DlkbnjEEVZ8PF1l4Rpq2pfV08ybgsbHGz9hQ/hQXv3keZJkh8ZJoPkXdYFPa
         EfOg==
X-Forwarded-Encrypted: i=1; AJvYcCWuKm/ijPhi+CJLCL+eQiC4ECgbPVsuiPN34jb9281Z8rAZ+773KWGw7wXStiKryyBLcJutPFMgy16GHz8X2oj+@lists.infradead.org
X-Gm-Message-State: AOJu0YzS05ojAPPLDh9XNeepGgFzYpa+CSnTWNUgzlSZHBj/Y1bsXnnM
	/0kQUIush5h0QXw3pVjMkTKG0oKUzdYgueSV9xjPG5YkEGpLwGdp
X-Gm-Gg: ASbGncshgd44kG0rHuTF9lb12hG45UvrjNkiZwoelfLDkwIu5iY92iSUHFTkqmD0tm+
	JI0693DM7dj3RDQgcW0cbghJFqxv2ca5zRFFN6DEeEB3x7NQqcCguB4MGDzEQ+sidX6uSr40Upq
	zl5MRDLh05fLWaOnEYbN/XxSP4BHv05lsJQ6pDEiguz4JKrFlNEOAz25WVgpqeH+y2r6yAXS3Sw
	0LcQYtPz8A6Ntn5J3v6M0wN1cQUX8x+UXP1w2Vo797jQcCvkNcA/PzIPhq0kTU50gaBU+pMunCC
	je9iAZ1SY75XBkFwib8G6HhCprb9OsuKAzYuuXWGcfgxmhs57Aj+lljfUoauur5FRPVla6ovdQ8
	oDuMqjuOvdGD6PX45xbrs9AtMv6z5tEvh
X-Google-Smtp-Source: AGHT+IHGBKi5VYRbLhMgDoCgAi7F0n0AcFeEp62EtCNfWTr8tx3YHXmmuXFcoAabgma0YQ/p6jtl7A==
X-Received: by 2002:a05:600c:5122:b0:43d:82c:2b23 with SMTP id 5b1f17b1804b1-441d44dcca0mr24288065e9.23.1746628700896;
        Wed, 07 May 2025 07:38:20 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442cd32b0c8sm3238005e9.3.2025.05.07.07.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 07:38:19 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 8/8] arm64: defconfig: Enable Tegra241 and Tegra264
Date: Wed,  7 May 2025 16:38:02 +0200
Message-ID: <20250507143802.1230919-9-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507143802.1230919-1-thierry.reding@gmail.com>
References: <20250507143802.1230919-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_073822_568060_911D2FB4 
X-CRM114-Status: GOOD (  10.51  )
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

From: Thierry Reding <treding@nvidia.com>

Enable the configuration options for these newer generations of Tegra so
that support for them gets built by default.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 696bd4043c99..c5342a35fc15 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1491,6 +1491,8 @@ CONFIG_ARCH_TEGRA_210_SOC=y
 CONFIG_ARCH_TEGRA_186_SOC=y
 CONFIG_ARCH_TEGRA_194_SOC=y
 CONFIG_ARCH_TEGRA_234_SOC=y
+CONFIG_ARCH_TEGRA_241_SOC=y
+CONFIG_ARCH_TEGRA_264_SOC=y
 CONFIG_TI_PRUSS=m
 CONFIG_OWL_PM_DOMAINS=y
 CONFIG_RASPBERRYPI_POWER=y
-- 
2.49.0


