Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB5CC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 16:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zen24IcM3djM9YgCwghgtHtMwzQ4LV/2qqQkL+b6/N0=; b=IbWh5iQPP7i1KjOYWheRNfmr6c
	BmhIokszVU4n01SKgqBPnk7IwQdkmPeWaHF82J7CHF5vx4eM6igx+G1Al5NYdPas4yEH3Hz/EJjFJ
	nD3sp1ryMW6cKHdsi3cdeC93v3JuDU5dHryLLLNmoDmi03mLb/960aFyk/+myjwNPyAP0tKMo0Is3
	9kgUmhTC5aR0KD69GjZUCsarjzA4273Sl+SO9qOIOSLZ1CmgXIJtR5xy9nFb+DvNipD1xEzQVOlkT
	iwLGCAboVCmBmLNol9VthmJ5vN642gIJ4//5aWS5jsy3eGoraJFejLqFY0KLEuPcTugdLqY/taHKZ
	sB+n25Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjLIc-00000000QdT-1xd7;
	Sat, 15 Feb 2025 16:45:50 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjLHA-00000000QQx-1od5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 16:44:21 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-22113560c57so5152375ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Feb 2025 08:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739637859; x=1740242659; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zen24IcM3djM9YgCwghgtHtMwzQ4LV/2qqQkL+b6/N0=;
        b=bfFCkcl+eTImNcEx2RiMzwbeUi3RThJer4CMV2wJ95sW7+a6g9mHwVjjT7T2rObeqK
         V1Yup+OAInEonnnvpfcxmVuSgTmdZE0M7rfeDsBwMVHxX2PH/ZzvFTqSQA5RFWyRlYtc
         UNIGwpF0b01pCLbj+sSrwfSmRMDnf/3vOsYKkMKsZDNRftn7MuJkXB0KklTTwBetzkk0
         0jEjhw4RDwFhQpcIEZuzBg95d0relKstgh7Pl5zCDV+GkkLqX6xfDsc9gLW2wQ4z/yVW
         i9lhofPpLHbTVo+tOrJgIN0oKYHkdndYrycgM5LA7PavgKIx7ujnRs3CEuNaVpDo13Xd
         5LFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739637859; x=1740242659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zen24IcM3djM9YgCwghgtHtMwzQ4LV/2qqQkL+b6/N0=;
        b=g9HzQTLUS0ZxMnKVgyz64lUpwFTk00f5RpzGbPZhoJS5qvUacoZJ6Fwr4rs5fT3dqi
         +rbQ/bmsRPwjhsCrT7ucxMCb3mggv6PWySndHw2ZU2AZLEXIwF3ikh4Wt7f5XKnkTllF
         f/nd9E0FVyMc86IKLJwUk+hQmoaqCD2fk739ptzkT5WIw3GQGNUWyWsBKTAstvPBVm+/
         Cub8d3uMVbsSrB08GY5Gs8co3HF4Y0/Ta/PaqDTbR3OH834c8gHC/yBHtFYlri924/4N
         KmHdycLADMR8GpMVzptaO/DWxd81nFsHyXavRA3rcZJj3nWY6ktbkKBXLuLIDI8m0uzF
         HzhA==
X-Forwarded-Encrypted: i=1; AJvYcCU83/26WvGd5gUomzInLXognjZtA6031rpQZ3WTM6Z7e69/zekiOEe6v92dg7/te89c9qS1xzpqmx/ZeJ+80g1a@lists.infradead.org
X-Gm-Message-State: AOJu0YwTGRboSSNxtHUPG//LVvwc4GfbT8JLk+tI+GVdfgJm4366mIKT
	i1rpnjuXtqSIkNOb5+GuRphNJSt8bGXDIAnnpJHLWzJW4idQutWq
X-Gm-Gg: ASbGncsGP97BSyVmHmMVQYQ/gB8ENUv8kQTdN9zl3pDeJziBfWTtgem5UgC1uiSlJ3b
	Wl1I6+u6X4UCzHZK5SJQNfL+NLGuQ/pc5sQ0jijCZ514zJlX9MeIS0vlKFA2mXxznYTwqzd4cGI
	8n/hAmnwFhqNQRlAzTtKke9yVU+DHCA8Reo81w2DyuF2+WBcoh9y01oVYOpk+qbqiTY10iDPss9
	Eed9mA9dAQf+okv3U/eJk6Hn4sUuAKjBtk/0YY7m9P4FQ8Fi2E1MOGbGitHfVVSXMdAqeOhe6aJ
	1qDTKkYZaUxr/MD6p5Sy
X-Google-Smtp-Source: AGHT+IEB5/OkP6MlT6rURyfDn95k/vC4OmFIg6jcwrba1EZXG0N0SK2ZbXoBU4WJ2hpKhgmrU7THSQ==
X-Received: by 2002:a05:6a00:c9:b0:732:6221:7180 with SMTP id d2e1a72fcca58-732622171dfmr3553434b3a.5.1739637858885;
        Sat, 15 Feb 2025 08:44:18 -0800 (PST)
Received: from eleanor-wkdl.. ([140.116.96.203])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7326dba6585sm483348b3a.14.2025.02.15.08.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 08:44:18 -0800 (PST)
From: Yu-Chun Lin <eleanor15x@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	visitorckw@gmail.com,
	Yu-Chun Lin <eleanor15x@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] net: stmmac: Use str_enabled_disabled() helper
Date: Sun, 16 Feb 2025 00:44:12 +0800
Message-ID: <20250215164412.2040338-1-eleanor15x@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_084420_470106_2DF9972E 
X-CRM114-Status: GOOD (  11.41  )
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

As kernel test robot reported, the following warning occurs:

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c:582:6-8: opportunity for str_enabled_disabled(on)

Replace ternary (condition ? "enabled" : "disabled") with
str_enabled_disabled() from string_choices.h to improve readability,
maintain uniform string usage, and reduce binary size through linker
deduplication.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202502111616.xnebdSv1-lkp@intel.com/
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index 96bcda0856ec..3efee70f46b3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -16,6 +16,7 @@
 #include <linux/slab.h>
 #include <linux/ethtool.h>
 #include <linux/io.h>
+#include <linux/string_choices.h>
 #include "stmmac.h"
 #include "stmmac_pcs.h"
 #include "stmmac_ptp.h"
@@ -633,7 +634,7 @@ int dwmac1000_ptp_enable(struct ptp_clock_info *ptp,
 		}
 
 		netdev_dbg(priv->dev, "Auxiliary Snapshot %s.\n",
-			   on ? "enabled" : "disabled");
+			   str_enabled_disabled(on));
 		writel(tcr_val, ptpaddr + PTP_TCR);
 
 		/* wait for auxts fifo clear to finish */
-- 
2.43.0


