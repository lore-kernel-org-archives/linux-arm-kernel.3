Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58FBC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 06:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c31s3mpskb+5zWGcp6639wWZ2XSIoFe0Eg4tpjdgFMQ=; b=QEfyUbkKRvzv8Gs5Bc1SjWOgP0
	/b5+oZZkOiWTvXTsRj0J97bsZ82aTIpLGhVtsvS/2A7yktJ2THmuhuJEduUntDbMDvOty4QYOoKYC
	ZEb8+LPSdmmLf14jTNaiyFPVidPJCrlK2Fc2R8+HQgB6gKbDdboNOi9VQYF7bhtbR+RFEFhnuQxYH
	39znzarxT2hUiiXNJILJnRFR59EAEAqQMKhA4Tfvu/OfzSVFc4ekwHPcHLZUuG9Y74Z1hM00AuR5w
	R73C0yBkPxiD2Bpz6lZyPuVHJwbXVMaq8TUBOWcBsGOoIhsWzdXPbNihUKAz5GF13aaWFoBJZd1As
	vFwElrmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufBjD-0000000993c-3vwK;
	Fri, 25 Jul 2025 06:16:23 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufBgk-000000098Tr-01te
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 06:13:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1753424030; x=1784960030;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=c31s3mpskb+5zWGcp6639wWZ2XSIoFe0Eg4tpjdgFMQ=;
  b=ogdtOgBdvmS3fBkvgyOb+QjT8MEDFywoYUyKAUxpiLgOoJhTQIHciTU2
   gvA36H5122mvBgGN1jDPhovKTHUTQqDR+wFbbWDoYnmoBNjOGdTwcCz8J
   wps6yi/hLD5yFsDh+F2ygxzj2VZPUl4s0yU/OgW9Gl0rVlswdg1PXlhQ2
   uZ6PhD1x9dFkxgs8M4/CTGT82hUrOp6vBxT1E04/1OYKMFimqnkgKTShL
   m8U6d/niCLNuAXtjZOII3ULCOTpcAUupoqx2M8EQQhZPVbpfi4orGi3z7
   lfjj7r3dbNuMuJ+mJ73jxHP5ILJtUcsKK5x281DLtapCmKcZjUJyHlsMB
   A==;
X-CSE-ConnectionGUID: KtrZHt8ISB6KLNEAanoAzg==
X-CSE-MsgGUID: tBddOxUiTNeUQbv7eHksUQ==
X-IronPort-AV: E=Sophos;i="6.16,338,1744063200"; 
   d="scan'208";a="45413012"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Jul 2025 08:13:47 +0200
X-CheckPoint: {6883209A-2C-9BFD12F6-F51D5FD4}
X-MAIL-CPID: 3EBA27A9C48D9BD60EA4DEFA9B9C27DB_3
X-Control-Analysis: str=0001.0A002111.68832097.007F,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 66306173583;
	Fri, 25 Jul 2025 08:13:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1753424022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=c31s3mpskb+5zWGcp6639wWZ2XSIoFe0Eg4tpjdgFMQ=;
	b=nxX8zxbW99AsUHe6/kYCs+Iu3wG9ud87J90b07DNjKOPyUbgHpQQ+7iqC/vRK0V/l8uoDC
	5ta5hoq2r+U/gbFKLd/KTSnEKcQc7m9iIIGnConpXWqAWksJZ5lGTPHbsC2nEayCCorjRD
	f0uiVMoUsPdajBIeKxBatveqTNd7WNv2Wa2AHj02c0Mvx6/Pjr4xMZv/7U+tHr/EC7AbCM
	vYD1khlJqoW1U7YnjpYPInetCpilo+3Xp6JvkcWpBTxLb9liv1gL5R54nZqJIRQRVjxuaJ
	FSm8zUSWrPbcqgmdQoFT5TgRfXhtdJtHEkGtQ4lgD3grBefFhJ1egPtx7igSSA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/10] ls1021 DT fixes
Date: Fri, 25 Jul 2025 08:13:25 +0200
Message-ID: <20250725061339.266125-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_231350_526943_6077AB28 
X-CRM114-Status: UNSURE (   5.99  )
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

Hi,

this series fixes most of the CHECK_DTBS=y warnings for LS1021A.
The only warning left is:
> esdhc@1560000 (fsl,ls1021a-esdhc): $nodename:0: 'esdhc@1560000' does not
> match '^mmc(@.*)?$'

But changing this might break some bootloaders as they reference the
/soc/esdhc@1560000 node explicitly by path.

Best regards,
Alexander

Alexander Stein (10):
  ARM: dts: ls1021a: Fix gic node unit address
  ARM: dts: ls1021a: Fix qspi node unit address
  ARM: dts: ls1021a: Fix sai DMA order
  ARM: dts: ls1021a: Fix FTM node
  ARM: dts: ls1021a: Add reg property to enet nodes
  ARM: dts: ls1021a: Remove superfluous address and size cells for
    queue-group
  ARM: dts: ls1021a: remove undocumented 'big-endian' for
    memory-controller node
  ARM: dts: ls1021a: Fix watchdog node
  ARM: dts: ls1021a: remove property 'snps,host-vbus-glitches'
  ARM: dts: ls1021a: remove undocumented 'big-endian' for
    memory-controller node

 arch/arm/boot/dts/nxp/ls/ls1021a.dtsi | 40 +++++++++------------------
 1 file changed, 13 insertions(+), 27 deletions(-)

-- 
2.43.0


