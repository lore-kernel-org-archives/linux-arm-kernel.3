Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461C0C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 15:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GENAPiyGrW4RKf+sxnTjivjp6lL9fZ26yd1QrBL2owM=; b=x6fRtqpF5b2YH6zkzCVwgZ2LJt
	6NTdsdvlgYjWzgraU5EfgJ9W43VIIO/3T1vpWEERHtILfckoj4y3yxGGJEssgCMfHKTtDpAU/vlmM
	YsFZYGrkfUK7lvlA7lnax5KufeztfyvF6NAy2+b575nlV08mXbbaYeYxsmCpd7Vd5rR76ejI/KoSL
	Eb5opAUz2PJB6r4HSUDbb8XLmPqBKDeeDLG1F7l+8MThKdFWAWxISjr/J+PA69oxKbj/kZI63X1ia
	uos+TMZJBvzOyxTzXScevbT9lqlWDloXz19LBTqPdcY4jocLN1AnUS/bCR8LPFhnlmPGvZoxTDn6R
	mawRCUJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMxs-0000000AJpk-0alQ;
	Wed, 11 Jun 2025 15:02:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJs3-00000009lup-2cpN
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Jun 2025 11:43:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=GENAPiyGrW4RKf+sxnTjivjp6lL9fZ26yd1QrBL2owM=; b=AcmPpaM9AzrxVIJMU5hN+gBhj4
	wT4lMpsbLMRA6/M3yQGmpxSLJP9TP+ufysOsD0RGD1mYJg4s/MjLt1DXVBkSReSZgHm/Sg5YisCWs
	l7RNF2yjmOTV4fmq/hHRhHoJGYDqP08+xDMqSBT2l3VQluiBVZi5ieQUvn074aItvLJdF7Ss7WPBi
	7zVSmTJyMPiyPVEvIEgpbbX9gR7eVg8Mo6ce/YHFaoaIo+aWSz5ol1A711ZtYK9HKTliBwQx6hmWf
	oZOU1OgXdjdiAAYEH1chrJVouaUtJ+acSEmYfTo/EL7Vae8y9ZcPuOxe5Z2n5kHgOcA2BZ9Tl8/y3
	/JVi3WAA==;
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJs0-00000002Mdg-3oVC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 11:43:55 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55BBhf2r1352854;
	Wed, 11 Jun 2025 06:43:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749642221;
	bh=GENAPiyGrW4RKf+sxnTjivjp6lL9fZ26yd1QrBL2owM=;
	h=From:To:CC:Subject:Date;
	b=jpB9O4OyhOJC5o8S6Tq03/2nfD0Ni/Fkj5eVPABhXfssfe7wLPuE71Uxe0M9Sb20M
	 l3xXFI1AlWS3XoBDHlMXDvh0YKHk4xFVz0BmYGlxKDJw6jTDXtTFRPLZI0iUon+0Mg
	 9nRjCF67IcDhnbBpIpR25uW/CiI7vrSKQI6T9gRQ=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55BBheZj986075
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 11 Jun 2025 06:43:41 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 11
 Jun 2025 06:43:40 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 11 Jun 2025 06:43:40 -0500
Received: from uda0492258.dhcp.ti.com (dhcp-172-24-227-169.dhcp.ti.com [172.24.227.169])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55BBhavD270460;
	Wed, 11 Jun 2025 06:43:37 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v2 0/5] TI-K3-DTS: Cleanup CPSW DT Nodes
Date: Wed, 11 Jun 2025 17:13:31 +0530
Message-ID: <20250611114336.2392320-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_124353_410757_361870CC 
X-CRM114-Status: GOOD (  10.57  )
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

Hello,

This series cleans up the CPSW Device-tree nodes by updating the SoC and
board files to keep CPSW disabled in the SoC files and enable it only in
the board files.

The following is a summary of the SoCs, CPSW instance and the Boards that
this series affects:

-----    -------    ----------------  --------------------------------------------
S.No.      SoC        CPSW Instance                    Board(s)
-----    -------    ----------------  --------------------------------------------
  1.       AM62          CPSW3G           AM625-Beagleplay, AM62-LP-SK, AM625-SK
  2.       AM65        MCU CPSW2G         AM654-Base-Board, IOT-2050 Based Boards
  3.       J7200       MCU CPSW2G         J7200-Common-Processor-Board
  4.       J721E       MCU CPSW2G         J721E-Common-Processor-Board
  5.       J721S2      MCU CPSW2G         AM68-SK-Base-Board, J721S2-Common-Processor-Board

Series is based on linux-next tagged next-20250611.

v1 of this series is at:
https://lore.kernel.org/r/20250529133443.1252293-1-s-vadapalli@ti.com/
Changes since v1:
- Based on Krzysztof's feedback on the v1 series, patches have been
  squashed with SoC and Board changes combined into a single patch.
- "mcu_cpsw2g" has been enabled in the board file
  "k3-am68-sk-base-board.dts" since AM68-SK-Base Board uses the SoC file
  for J721S2.

Logs:
1. AM625-SK:
https://gist.github.com/Siddharth-Vadapalli-at-TI/b82ecd46b0116211ff8bf2ca7bfd1b9f
2. AM654-Base-Board:
https://gist.github.com/Siddharth-Vadapalli-at-TI/91d5ed19429d9758b152d98fb61a41f0
3. AM68-SK-Base-Board:
https://gist.github.com/Siddharth-Vadapalli-at-TI/e1f28b4ef6e1e864a76235fa74949daf
4. J7200-Common-Processor-Board:
https://gist.github.com/Siddharth-Vadapalli-at-TI/f11bcc3d79ec8cd9577e2d44ba6a7182
5. J721E-Common-Processor-Board:
https://gist.github.com/Siddharth-Vadapalli-at-TI/9bbe7832ad153a65c5978dc6e0113a1c
6. J721S2-Common-Processor-Board:
https://gist.github.com/Siddharth-Vadapalli-at-TI/684f100cda6f8e1d672f61136b2f8fb5

Regards,
Siddharth.

Siddharth Vadapalli (5):
  arm64: dts: ti: k3-am62: disable "cpsw3g" in SoC file and enable in
    board files
  arm64: dts: ti: k3-am65: disable "mcu_cpsw" in SoC file and enable in
    board files
  arm64: dts: ti: k3-j7200: disable "mcu_cpsw" in SoC file and enable in
    board file
  arm64: dts: ti: k3-j721e: disable "mcu_cpsw" in SoC file and enable it
    in board file
  arm64: dts: ti: k3-j721s2: disable "mcu_cpsw" in SoC file and enable
    in board files

 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts               | 4 ++++
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi               | 2 ++
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts         | 1 +
 arch/arm64/boot/dts/ti/k3-am625-sk.dts                 | 1 +
 arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi     | 4 ----
 arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi                | 2 ++
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts         | 1 +
 arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts       | 1 +
 arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts  | 1 +
 arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi        | 2 ++
 arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts  | 1 +
 arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi        | 2 ++
 arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts | 1 +
 arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi       | 2 ++
 14 files changed, 21 insertions(+), 4 deletions(-)

-- 
2.34.1


