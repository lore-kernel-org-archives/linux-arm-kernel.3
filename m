Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE20C87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 07:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CdSfNikpGH6BscsmZd/Rx5luzG62PFHqKEcL/imgz3o=; b=CQx8spmemrSSlCto66jocC1KS3
	GNWpODgf4R1EWoEssVs+RXLE+P+NlUVrt7HS1F7Ccne5Dkjq5vJE+mlXuYDjLCZ2qI6hEWgUGSuVG
	vZhnpgJyKnBWznD3kZM/lgATNdyw915C13FkGOyPHo9CxRKqAsGkOPf2SYahSeLcV4QZmzYcDklh/
	ydaK0iR5L1EhFRlcahMm4V+A6K/BjU1qt/54s5SZ3f4S/aVgpOYfYpbXKmcL1CrCNCxjpJqqb7GJN
	c0ECznpFCc/p4eTlctFhcHnjfjnBqnjhP70rslhtaJRP8sVmhVk+qGNtPVsIQY461uQB1V7ynsTY2
	Fr4dgWvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uipws-00000009rFw-1Lus;
	Mon, 04 Aug 2025 07:49:34 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uipuJ-00000009qxr-1IP9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 07:46:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1754293615; x=1785829615;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CdSfNikpGH6BscsmZd/Rx5luzG62PFHqKEcL/imgz3o=;
  b=TX6LGmB57Bp4bARfjqQJVmOIkUtCeONhtzp4EQQ63t6WVkJivOXXZ1AJ
   +1mzaHj+W5q3Z2DzIbSEfDAIGH7bTD7CAPAN2Ovww7LiffcVAEamD5py1
   ykVUEvzwc+CtdxXsQP/i3gfLtNZ3elu9SZq0fpriIWzZkjkd62nbaSds7
   c4Hgf6vx3nuojlLyjGHbh2nXJ43qvmiL47saiTQD71N9LQ2JVYi7XNrcW
   ERWNTOXGw5t4E/xW0wP3YiTzdDXe03sI/o+kvo/2zjypqtbrdkSkPsplx
   +BaH1nnt+T0ptc7mjVuZUYTDX8VKreRoA50tssBcMAy3b1lFwDmvChYc2
   A==;
X-CSE-ConnectionGUID: HpCTta7TRG6yj4QOSCB+Lw==
X-CSE-MsgGUID: Aeglv0tvTyugj3tAdvpArw==
X-IronPort-AV: E=Sophos;i="6.17,258,1747692000"; 
   d="scan'208";a="45562890"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 04 Aug 2025 09:46:50 +0200
X-CheckPoint: {6890656A-1C-BC5CDED5-F054443F}
X-MAIL-CPID: 4AC64EF87B1BE66EB7BD5C8C8A82D21A_3
X-Control-Analysis: str=0001.0A00210D.6890651C.0090,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B04091617E1;
	Mon,  4 Aug 2025 09:46:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1754293606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CdSfNikpGH6BscsmZd/Rx5luzG62PFHqKEcL/imgz3o=;
	b=ecKANMWNDiOVfAMTmVMafSHm/DT+1YcSONM7nAJtnCxEO+Ziaf5xmwr7oQZbcP/FdHjQZg
	c9ItJju72cOUClS8/+/I1KwLI6Mx+6sRV/eDMCLIxGgiHGjd9s8h+vVlbt6f5IDiEfhNag
	hobttP7S4HZq6MYU5tMCWE+d1yVUgWdDYi2dyd/yDI341E/PzSpE+DttX7gYALtPMihhFX
	HqF0S1rfCDNd+Qb1CKFuITUKGft2Ml4cKgH+TCeFZ40mc21dbV+99v0bDJNYMFB1wI2CNk
	jGOHyQsuc6l8ivt3B0btn6LjKlWBiKlyxzaMRqUqvV8IP/+P0AudxGNX6UgbPQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [Resend 1/1] arm64: defconfig: Enable Marvell WiFi-Ex USB driver
Date: Mon,  4 Aug 2025 09:46:41 +0200
Message-ID: <20250804074642.75072-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_004655_832262_40110CC5 
X-CRM114-Status: UNSURE (   7.41  )
X-CRM114-Notice: Please train this message.
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

This driver is used on imx93-tqma9352-mba91xxca.dts.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Added IMX Maintainers

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c7520e78b6a11..2271ce6079bbb 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -441,6 +441,7 @@ CONFIG_IWLMVM=m
 CONFIG_MWIFIEX=m
 CONFIG_MWIFIEX_SDIO=m
 CONFIG_MWIFIEX_PCIE=m
+CONFIG_MWIFIEX_USB=m
 CONFIG_MT7921E=m
 CONFIG_RSI_91X=m
 CONFIG_WL18XX=m
-- 
2.43.0


