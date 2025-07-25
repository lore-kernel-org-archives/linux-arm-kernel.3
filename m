Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01EEC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 06:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2dourJm0SDZjHfoLji84guhHFN2WHfzi10bttqrIUWw=; b=h2a+0+EJrMeYgR/CLPnG6qoEzM
	HHJVV39RjJkznWfDJJ2+rncV5ibKx/KxL/T/aPjnMtCpfszgwpasSR9F54thoLvi6vQzu9YpsgInI
	VG+KaeMpfYY9iJsaXfq2FM+xeipygXpzovrxow47a0LcSJr8kb6uRPVGbvkz+a0GzTpXNid/qPfGQ
	e8ffhyJyWF1MX4N8SNsc2QqDgmuKsAuwttAzR4/hzjxJKTdWbqUtAtjOEGxfjVQ43xQ9zhVUoNmea
	5E6NgswyvuYHMqHuO9kYe+O5/j/Yy+Mk1V2wF9xeQEJn5b++LjkZ7CTF9y1O9FGGE9kmBk6rxYj5t
	bSMRiiOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufBo4-000000099bv-2lGa;
	Fri, 25 Jul 2025 06:21:24 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufBgr-000000098Tr-398u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 06:13:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1753424037; x=1784960037;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2dourJm0SDZjHfoLji84guhHFN2WHfzi10bttqrIUWw=;
  b=Ce2IEzwjq3m0e2kwWPeEwhiErTrUv5019l5W8gCa8UihExVN6TiZqAXw
   Tpi4pE/Kz4s563b+Re21I7D62vKvA21MYBu7329TeR9wI5oBZ/Q1AFcDv
   TUT+kkVQhaT54iV1Hj5kPjDv7/LKLN6C1zMpAVcewD4uZeLY2KiqUu52T
   jPz0bjPev5GeckdPz0pukWC/yEVCEEGeyWGePjMhD4l3n84wrXPwVshAO
   JGbx+zUbjhLqve346Au/anrrQ5zsTYYgVZLP8Lti2ZGVp/SCGVJDTF3Hf
   9fPGdy7sgaQuA9UGLuT1UmB+5+Qud8K9ILNUMGi8somfReCETXxxFDXLC
   A==;
X-CSE-ConnectionGUID: niInC5YdTJSXO2exHXj9Nw==
X-CSE-MsgGUID: V3W8PETgRYGK+aPO+qcvpg==
X-IronPort-AV: E=Sophos;i="6.16,338,1744063200"; 
   d="scan'208";a="45413016"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Jul 2025 08:13:56 +0200
X-CheckPoint: {688320A4-2F-8CC3CD70-C1DBF452}
X-MAIL-CPID: 99CAF7C9F1E8294BD57271360C0A0B97_1
X-Control-Analysis: str=0001.0A00211A.688320CB.005E,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2243D1735FC;
	Fri, 25 Jul 2025 08:13:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1753424032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2dourJm0SDZjHfoLji84guhHFN2WHfzi10bttqrIUWw=;
	b=s+onBUaCIAiV+fa8r+WH8r6MLg2ZglZ2NZRT4xxC6D8YbQBFclIYNRGYPypmEWIKhauTzW
	Co7NHGpyE7wx0gPoSkKWWLsAyuAx90lFpcZqQH5hGJ7DRRSFqfpsFL0PO6GVjnOqMH8Djo
	eFKk+cysuw2Bcl79hDZOb8MGO6/bqeZ3l81ZjtrJKoAVo8xivuLzVw3JFtqBHnQ608YCGI
	hyCuAV95gMxRmpA193B6tuuPOkIg6ZflVowZeGXxaliLPFAJIoR4MbgchXvHnQ14N45wwQ
	IpWWTRUnp/QwRmGFm2jpnCCaj8ifPtdJAFGZPLWi0A5Ms74zCALYQYOWX6VMsw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/10] ARM: dts: ls1021a: Fix qspi node unit address
Date: Fri, 25 Jul 2025 08:13:27 +0200
Message-ID: <20250725061339.266125-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250725061339.266125-1-alexander.stein@ew.tq-group.com>
References: <20250725061339.266125-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_231358_086532_337D7F61 
X-CRM114-Status: GOOD (  10.96  )
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

0x8390000 is reserved memory, but 0x8380000 is the QSPI base address
in RM. But register have offset of 0x8000, so first 'reg' entry address
is used for node unit address.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/ls/ls1021a.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi b/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
index fb44c76bf1d17..74c5698e0b314 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
@@ -917,7 +917,7 @@ ocram2: sram@10010000 {
 			ranges = <0x0 0x0 0x10010000 0x10000>;
 		};
 
-		qdma: dma-controller@8390000 {
+		qdma: dma-controller@8388000 {
 			compatible = "fsl,ls1021a-qdma";
 			reg = <0x0 0x8388000 0x0 0x1000>, /* Controller regs */
 			      <0x0 0x8389000 0x0 0x1000>, /* Status regs */
-- 
2.43.0


