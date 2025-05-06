Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA07FC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 16:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7flR5DbV9pTvWMtb7j8Zpa3VQSCSW81rsjiKSP4Ot58=; b=Qs1v8kRh95hZQDyWSpdWMM3/pO
	d4HPV7j4HllFfm3Nj73XUvgtLaucW6kCD7qRslASOa7g8d8USoQn1qy5hXk95cgB6+CiPqm5E9c/+
	zrGEfnuO986/R9hLazKnQDGEJbi9+AdjYY8q9VBYr2XjsQWebxYbcDTIMYQBRr91edxFHQjpU4Hd/
	fNKZAVtgjWQ95KuTDvSHKkGxGoJjN9xwCC/LqxtRBWcYl7jtviPOxkYskkPaicbfieu18ldXEgrMn
	6C25XhodfqIRoKwoXizsMn/tiw0qN80A6bN4OtWELA0dNtgKFOtLdWsGoTLHZIrmABhJ2GIhlk4t/
	yiYgi/KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLRL-0000000CjCz-4BVN;
	Tue, 06 May 2025 16:46:44 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCI3j-0000000C2SX-3Vjn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 13:10:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1746537007; x=1778073007;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7flR5DbV9pTvWMtb7j8Zpa3VQSCSW81rsjiKSP4Ot58=;
  b=JzRKzjdVAROek0XlNVamfSgTpc9G2UUXSnb08i9A3ISZF8Jkrel8+7xk
   47E9onLvKJTqbgomIRKu6C5TSHJutwlCQca3Y3+Q4iC1lZF9M1HnMUit8
   wxs+POOBeE/Je7d8B4hZet/NaNVc3txPz2dppM9Q3jROM9gS61lJAIhPQ
   GvDBdhurtutec+IhKmzRC4kGQd5SERcb4h83ILwiQltsQE33daSNTmizm
   8M3LqPW+xkFqpvGQesnwj6yNRkYAsFjlJqyvQERH83SMc8ICL0v/XyRd8
   4kIlsveOZsgevX9jjFKfkFj4GJokdVefLQSmQo96eooa3H0/WovUUQrRW
   w==;
X-CSE-ConnectionGUID: Q1eSLSEGSGyRrPEtnwsZ6Q==
X-CSE-MsgGUID: 4ZaVbCIiRfWnTqXBDzDuJg==
X-IronPort-AV: E=Sophos;i="6.15,266,1739833200"; 
   d="scan'208";a="43909028"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 06 May 2025 15:10:03 +0200
X-CheckPoint: {681A0A2B-A-68AAF6F9-E177A1A4}
X-MAIL-CPID: 98129684B7364D902E833F2BF2B8F45D_2
X-Control-Analysis: str=0001.0A006398.681A0A3B.005C,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A04A51636AD;
	Tue,  6 May 2025 15:09:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1746536994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7flR5DbV9pTvWMtb7j8Zpa3VQSCSW81rsjiKSP4Ot58=;
	b=VtIs0gGsg/LpVTSw0QA4nX1HA9u92HuNFdEq/6irbAg0c84cqHiVnauSV4RZ6jRV5eVrc/
	p3avYSnxmb0PFc9eyZ4AczU4DOWnsWy75/tjaI2b83wnx+f7yUo25cAWo+2lbU7iO3SxDf
	K0RVnXnT7TScEzzZAU/eijrG4GVOrOcIR+2FBGFBoec7MoRpZKXAJQNbExKFtKBJjuMqFE
	DkzBjW327IWkdI2l+CVi4RTe+5DV+eXurf4H4KsTLb+pyq2+PsvTk9OOcxynXC/NrNhppz
	M8yFYLhwM9JGGUjTpFSXn4HlWHA1RyWwbyhKUXYIGuKib3v5nZneQ2vaTlf8aA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] arm64: defconfig: Enable Marvell WiFi-Ex USB driver
Date: Tue,  6 May 2025 15:09:39 +0200
Message-ID: <20250506130940.2621554-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_061008_355271_872F7014 
X-CRM114-Status: UNSURE (   7.93  )
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
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 8691f0ee44e66..550b2505b5658 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -437,6 +437,7 @@ CONFIG_IWLMVM=m
 CONFIG_MWIFIEX=m
 CONFIG_MWIFIEX_SDIO=m
 CONFIG_MWIFIEX_PCIE=m
+CONFIG_MWIFIEX_USB=m
 CONFIG_MT7921E=m
 CONFIG_RSI_91X=m
 CONFIG_WL18XX=m
-- 
2.43.0


