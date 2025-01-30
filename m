Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED055C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 13:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wj58s5CoC7A+ZuNeV/ZGyINoKzUF6v+v74SipQCF2NQ=; b=AK9eecxyAzTkpNjG7Sqn9bu5SX
	38TvYcz4noF1tCNzaHXa7JQSatYqBW+w1H+qMK6yaS/nOxQNN/laA30CZL1bVfICSTUAV965GQ9UJ
	OBTrnDVAjuEg84z+eVn9dvLUgNGyTdiYLtOMM4EzsQNg1XOTK2dlSnnsFmiaka3t07gbxcYpXf+sm
	0rjy1v0ulLcKfuZyXXJUOYpF+M8KSjL3fLU9SQ93YFiApAPjMcq37KCXhgnbhOrgS59iqEM1fItIp
	bsyzlNSskzVDjfPgH0l8yposGhauj0cPfF7aLUDo5t+GQ5ZgiEDBAXRAkr22hNjDoF1UHsfulMjpA
	BjOgdvuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdUBm-00000008oII-2H5P;
	Thu, 30 Jan 2025 13:02:34 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdUAQ-00000008o2H-3gJt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 13:01:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1738242070; x=1769778070;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wj58s5CoC7A+ZuNeV/ZGyINoKzUF6v+v74SipQCF2NQ=;
  b=WzYMPRPVObF3ZbrwUVD+m5PLcVep2yQgODOm68aTbsjw3tXhBqD+gM4x
   q6I7kFajCC1JYMfGzS572uCrIiN3L2dsn7Lsqs0a/7WR1DQ4iTu+HuBUv
   C3Km+XqYNqjYhUhcxoNyCmidwv1JAMHkzijma+a6Xwk5NygUhCn7h/bIg
   OtnklwlrXE14CclSLkCf5ftvLhXsAjzFxQ8YBfVCOONAcQnY5zSErGe3H
   5aasmaebnPEloz+TpGv+jWwD+enbdjZGi609epE3G2Nct+vjQ0/wHhe4z
   Mx2iMQTPZJedfR3rmD591+3jWdhxJGhozLh7DrzCfIiRgEP4PtbOCke+s
   A==;
X-CSE-ConnectionGUID: F346eup2RHyq5Mx9HZjn4Q==
X-CSE-MsgGUID: gyO9Yn/jRTGuTzpjVybASA==
X-IronPort-AV: E=Sophos;i="6.13,245,1732575600"; 
   d="scan'208";a="41374596"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 30 Jan 2025 14:01:08 +0100
X-CheckPoint: {679B7814-32-1CE016C0-E589DA3E}
X-MAIL-CPID: 96EE492516499171CB9FDB906F9A685E_1
X-Control-Analysis: str=0001.0A682F1C.679B7814.00B1,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 54FB41675B4;
	Thu, 30 Jan 2025 14:01:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1738242064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wj58s5CoC7A+ZuNeV/ZGyINoKzUF6v+v74SipQCF2NQ=;
	b=mbcFpJJxFpOyy8kUEWQbTB4M3Gyw3lSYbYE2ZwwM71ysmoV3w6Ji6wTZTN2JStwPupDawb
	8oJm98ESPJuBxIw39klfQBSnrNZW2mpTHF63+7yl6yuDP73OPy8YXaqMgEcFhPvNpUFVGy
	ZpLcDLLIxq99QSzbia1Jq3B3cuVRRsnBx2T+i69+06Z3pVH4LX/noYMF+xa0/G8AUHqNUR
	b5lrSwd6ZPo3I0k+9/9kBk8IwCoZ3KJ0MoMs+qzRWY7N1xZMrffxRfyBBpVMnPTelOeY/v
	MYo3ID28tMD4RHvQ4lKzDIL3/iSBu6gkLjZxn3aHjD5PbLsK3sse3Ip7dn1+Jg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Make i.MX8M Nano OCOTP work as accessing controller
Date: Thu, 30 Jan 2025 14:00:57 +0100
Message-Id: <20250130130101.1040824-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_050111_405307_D8929FFE 
X-CRM114-Status: GOOD (  10.88  )
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

inspired by [1] this adds the accessing controller feature to i.MX8M Nano.
The OCOTP eFuse has bits which can disable particular peripherals, such as
GPU, MIPI-DSI oder USB.

In OCOTP driver, the nodes under "/" will be iterated, and checked
if property "#access-controllers" exsits. If not allow access, detach
the node.

I successfully used this on a i.MX8M Nano DualLite which has GPU disabled.
Without this patchset the default DT completly freezes the SoC if GPU
is accessed.
Using this patchset the GPU is disabled without any DT modification from
bootloader:
> imx_ocotp 30350000.efuse: /soc@0/gpu@38000000: disabled by fuse, device driver will not be probed

Adding the other i.MX8M SoCs is straight forward.

Best regards,
Alexander

[1] https://lore.kernel.org/all/20250121-imx-ocotp-v6-0-76dab40e13db@nxp.com/

Alexander Stein (4):
  dt-bindings: nvmem: imx-ocotp: Add i.MX8M Nano access controller
    definitions
  nvmem: imx-ocotp: Sort header alphabetically
  nvmem: imx-ocotp: Support accessing controller for i.MX8M Nano
  arm64: dts: imx8mn: Add access-controller references

 arch/arm64/boot/dts/freescale/imx8mn.dtsi    |   8 ++
 drivers/nvmem/Kconfig                        |   3 +
 drivers/nvmem/imx-ocotp.c                    | 107 ++++++++++++++++++-
 include/dt-bindings/nvmem/fsl,imx8mn-ocotp.h |  16 +++
 4 files changed, 132 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/nvmem/fsl,imx8mn-ocotp.h

-- 
2.34.1


