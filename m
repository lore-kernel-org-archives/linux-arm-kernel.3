Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A75D9C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 14:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aU//bpRukT0JZldE0QjTM6KvhUiCU+wstfqEC9PvBkQ=; b=h4MVb+ywpb9rqhP7sei9QEfmwA
	6Mbt4vV7SjisyZ/TPT4iLusM4q8KtGR8DVZG1Xs1BekgMv/gYv57usUFXbRP7AqTKEjRq6EdIz5UC
	9bo6IUH5cn+Q90XhM7aU0gD5UCIb5Rn7KKPJM4bSOWDUed3qFBrehWsl7k/z07NQ4zjnXb3EHBXg/
	hneqqr0w2j0LkBrXK0Vpkc2DLrbhMzMHfX/AHKqF8AF8mABdU8ObAYBEjuS3B0BMieVn3EDLr01CL
	UkKL3giyy6w+DzjYdWLPOH3PeBMtxfC+JmmLFnZmZ3HioF1nork0+omQle4Lar71Z3+/AemKkXMZd
	Byo11ohA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txoTd-0000000BFLK-08oL;
	Thu, 27 Mar 2025 14:45:01 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txoQN-0000000BEi0-2y2A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 14:41:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1743086500; x=1774622500;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aU//bpRukT0JZldE0QjTM6KvhUiCU+wstfqEC9PvBkQ=;
  b=bCQGT431BsWqvhbk1YrLuLd7qDTyFTAnSDqdbIITNuy+rJy91XJd6ELp
   /h5Y2SGeKribgf0ZWrVy48LIE/DHCN25RytOPWT6r4+bYa1QpnggGx2Pb
   7s9VOA8rMIhDehU29/6Pai25lHuKzTPuhRvl9qomrDXODWbVNkJmx9hln
   8/wUlC9Htnotj2u+zOawpIxyv6gaWUttqz2FDZGyHaugP3PddKhnMBdIG
   QIHhOucxIxglppiYLphPHzCPQbBlgbVtzhYqRyjaC9lqBc7nVXWOwsp/4
   Kl9GDglVZFSnAzKHDSBHxCzppAdLZ5wp5trQSk0LqgglFET27dIuKXjsz
   Q==;
X-CSE-ConnectionGUID: zX1auU/JQbyB/CY2MEy59g==
X-CSE-MsgGUID: Ejdha72TTYeKeVu6lVVyvw==
X-IronPort-AV: E=Sophos;i="6.14,280,1736809200"; 
   d="scan'208";a="43199500"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 27 Mar 2025 15:41:35 +0100
X-CheckPoint: {67E5639F-D-903EAEAC-E04C76C8}
X-MAIL-CPID: 7CE2AAB81C9B4778987FC805EB598DF2_5
X-Control-Analysis: str=0001.0A00639E.67E56394.0078,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7EFC016C763;
	Thu, 27 Mar 2025 15:41:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1743086491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aU//bpRukT0JZldE0QjTM6KvhUiCU+wstfqEC9PvBkQ=;
	b=k8oLlYcmWb/PaO2ge8FkoUlQWythL6L5D03wz2a59w2HSMOl9TJz0jHygjc+z3okWP2wPY
	ooFHd5o0IJRwIYtmdp+ij8E6GVzO7wF3UmNYjQccQjM2p0H++DZPBxn3SKuj6bZ1B4F8bW
	J81MTch2g0GL/C0xNPNElIPwh/8rGLWdIYtIWPO/T7EdlmVOLGS16f3tbYwMSU8rs/JETm
	n5fyGXXV55EVw+IlSF1lYsyWVw8fqzCgQdKDTOvVMJvsSmwXvBdY0O+Tn2XEhdtED5rAdl
	QA7V+GOl2lWWkTAmG1J5H8/bncuUCpNXEjNsiKY6QeaSlYgmObti2fhoOYWWAw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] TQMLS102xA: New display overlays and small fixes
Date: Thu, 27 Mar 2025 15:41:06 +0100
Message-ID: <20250327144118.504260-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_074140_238111_DF05CED3 
X-CRM114-Status: UNSURE (   9.83  )
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

this series adds several display overlays for HDMI, LVDS and RGB displays.
Additionally it fixes the license header and updates the sound card model
name similar to i.MX based platforms by TQ.

Best regards,
Alexander

Alexander Stein (7):
  ARM: dts: ls1021a-tqmals1021a: Fix license
  ARM: dts: ls1021a-tqmals1021a: Add vcc-supply for spi-nor
  ARM: dts: ls1021a-tqmals1021a: Add HDMI overlay
  ARM: dts: ls1021a-tqmals1021a: Add LVDS overlay for Tianma TM070JVGH33
  ARM: dts: ls1021a-tqmals1021a: Add overlay for CDTech FC21 RGB display
  ARM: dts: ls1021a-tqmals1021a: Add overlay for CDTech DC44 RGB display
  ARM: dts: ls1021a-tqmals1021a: change sound card model name

 arch/arm/boot/dts/nxp/ls/Makefile             |  9 +++
 .../ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso | 32 +++++++++++
 ...tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso | 47 ++++++++++++++++
 ...-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtso | 55 ++++++++++++++++++
 ...-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtso | 56 +++++++++++++++++++
 .../nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts   |  5 +-
 .../boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi   |  3 +-
 7 files changed, 204 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso
 create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso
 create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtso
 create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtso

-- 
2.43.0


