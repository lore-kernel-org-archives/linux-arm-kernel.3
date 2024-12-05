Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E494E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 14:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OdXCtfDRHY0nRO+v5Xk5BGQL8Y2s3oOt7EmGZj1YWY4=; b=akL8G+Pclk2+a4
	bgmTJkhnIge3BouwlkDI80Fgdr5oiwxzLULC33SWv4BSXmMqF1zMv0AINGiXRjA9lQn9Wq5UObmNj
	W7iUJhXychoD10WLGLmZn4lFW1vLVRY5u8zk5UJnrnwhvNMSe4qD8N6cI/LGpoPMom0lzVF7S1Ojt
	aRo9CgOxoxq2imzKW9xqM4Yqr0LJ5h4qiJq1wuDHpUk0z9G3+vqhaz0TS1gev/WkMqdpCaL3D38iJ
	pjZdkRCfc26wH3vxWOq0Ka7eTV3vYUHop4z5i0KYFuOvoVyCJEUcwXza/x4dKteDwXcQ2F3bqx097
	2v0eThOCMZ1ZAMiXzdEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJCPP-0000000GGPq-1Ezl;
	Thu, 05 Dec 2024 14:00:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJCKc-0000000GFEB-0lmq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 13:55:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1733406950; x=1764942950;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=lHxFLGKPoNfSvqzFkYKUGzmmcfUFjgD/RTXtN5+r7Ms=;
  b=kLHr8JTNs03EsUDN2N7ZSLELRO1E5ocMitgA3g77WXm8wwp+y+6W6bgC
   b0s99/ILLW8EKrn1Q1jrDVbSG6q22laprF1YoV0eYegxyUW6Ny86HRRnK
   riGwknFzz2a/Mo2YKdV+zNkO0e1Zt7369c3ot0vHYfDwZfqvhVcknsesV
   ZgGq3qcR/gi7mdGjfjwAQh7tdYAA7wUEwFZgVhR4YawMfgvfA+qdiqlWd
   OJsnh1M3QBRC+e2OWhap2sP9fzSnPjRltnYYWozFpw5KIxgjV/VZYDxCl
   1A2igFh6ZYvGwukPlJzU9nywQk4iq34jlL1rMEtkRzN2LDgbQtp1suWVV
   Q==;
X-CSE-ConnectionGUID: k5kzCLZDRxuQzU38z46vlQ==
X-CSE-MsgGUID: Gs8t/m1WSf+xfE5sWPdvDA==
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="266373257"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Dec 2024 06:55:50 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 5 Dec 2024 06:55:18 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 5 Dec 2024 06:55:15 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Subject: [PATCH net 0/5] net: sparx5: misc fixes for sparx5 and lan969x
Date: Thu, 5 Dec 2024 14:54:23 +0100
Message-ID: <20241205-sparx5-lan969x-misc-fixes-v1-0-575ff3d0b022@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI+wUWcC/x2M0QrCMAxFf2Xk2cA67Vj9FfEhrakLuDiaIYWxf
 7f6eM7l3B2Mi7DBtduh8EdM3trAnTpIM+mTUR6NYeiHixv6M9pKpXp8kYYxVFzEEmapbDiNIeY
 8Re/JQevXwv+h5TdQ3uDeZCRjjIU0zb/bhUThOL4ajy6uhwAAAA==
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lars Povlsen
	<lars.povlsen@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>,
	<UNGLinuxDriver@microchip.com>, Richard Cochran <richardcochran@gmail.com>,
	Bjarni Jonasson <bjarni.jonasson@microchip.com>,
	<jensemil.schulzostergaard@microchip.com>, <horatiu.vultur@microchip.com>,
	<arnd@arndb.de>, <jacob.e.keller@intel.com>,
	<Parthiban.Veerasooran@microchip.com>
CC: Calvin Owens <calvin@wbinvd.org>, Muhammad Usama Anjum
	<Usama.Anjum@collabora.com>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_055550_230178_AE5DF805 
X-CRM114-Status: GOOD (  11.45  )
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

This series fixes various issues in the Sparx5 and lan969x drivers. Most
of the fixes are for new issues introduced by the recent series adding
lan969x switch support in the Sparx5 driver.

Most notable is patch 1/5 that moves the lan969x dir into the sparx5
dir, in order to address a cyclic dependency issue reported by depmod,
when installing modules. Details are in the commit descriptions.

To: Andrew Lunn <andrew+netdev@lunn.ch>
To: David S. Miller <davem@davemloft.net>
To: Eric Dumazet <edumazet@google.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Lars Povlsen <lars.povlsen@microchip.com>
To: Steen Hegelund <Steen.Hegelund@microchip.com>
To: UNGLinuxDriver@microchip.com
To: Richard Cochran <richardcochran@gmail.com>
To: Bjarni Jonasson <bjarni.jonasson@microchip.com>
To: jensemil.schulzostergaard@microchip.com
To: horatiu.vultur@microchip.com
To: arnd@arndb.de
To: jacob.e.keller@intel.com
To: Parthiban.Veerasooran@microchip.com
Cc: Calvin Owens <calvin@wbinvd.org>
Cc: Muhammad Usama Anjum <Usama.Anjum@collabora.com>
Cc: linux-kernel@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
Daniel Machon (5):
      net: lan969x: fix cyclic dependency reported by depmod
      net: lan969x: fix the use of spin_lock in PTP handler
      net: sparx5: fix FDMA performance issue
      net: sparx5: fix default value of monitor ports
      net: sparx5: fix the maximum frame length register

 MAINTAINERS                                               |  2 +-
 drivers/net/ethernet/microchip/Kconfig                    |  1 -
 drivers/net/ethernet/microchip/Makefile                   |  1 -
 drivers/net/ethernet/microchip/lan969x/Kconfig            |  5 -----
 drivers/net/ethernet/microchip/lan969x/Makefile           | 13 -------------
 drivers/net/ethernet/microchip/sparx5/Kconfig             |  6 ++++++
 drivers/net/ethernet/microchip/sparx5/Makefile            |  6 ++++++
 .../net/ethernet/microchip/{ => sparx5}/lan969x/lan969x.c |  9 ++-------
 .../net/ethernet/microchip/{ => sparx5}/lan969x/lan969x.h |  0
 .../microchip/{ => sparx5}/lan969x/lan969x_calendar.c     |  0
 .../microchip/{ => sparx5}/lan969x/lan969x_regs.c         |  0
 .../microchip/{ => sparx5}/lan969x/lan969x_vcap_ag_api.c  |  0
 .../microchip/{ => sparx5}/lan969x/lan969x_vcap_impl.c    |  0
 drivers/net/ethernet/microchip/sparx5/sparx5_calendar.c   |  2 --
 drivers/net/ethernet/microchip/sparx5/sparx5_main.c       | 15 +++++++--------
 drivers/net/ethernet/microchip/sparx5/sparx5_mirror.c     |  3 +--
 drivers/net/ethernet/microchip/sparx5/sparx5_port.c       |  2 +-
 drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c        |  1 -
 18 files changed, 24 insertions(+), 42 deletions(-)
---
base-commit: da4fa00abe5674d3d165cfd8032c740e8aab4d3b
change-id: 20241203-sparx5-lan969x-misc-fixes-869bff8b55a1

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>


