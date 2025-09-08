Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23793CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 02:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5P/e32ELuvx0ZyRrIAXbGyN+mm3v2Mndp/fFVgoo2Ws=; b=d9dw8Vz+WmN2O+D8G67/aY8WrR
	ILMPV75QUqE/aJiD7bx1iARsh9IcqlXpXYXXCSD0aVua9hiauU2IItSbeeoyo3CRVxbL5CXa+YwAw
	/18ZlTUM85R/hDZaZ3OaL3HakXmsv08TYxvC0v1WXuLZ2oMg4ka4eXDux42yojQ4NOgDBxKZPnEE3
	0phS7xp3fEDVVC1YcW8EAYLnQx5CsQ26r2ubVtFBIOG13gs/6YjNZMdc47WiBIzLIqazeZ4CdN0xQ
	6AAE7bR70FV4uvHVMKFC4OzMnSoTwKk5Qbo7ALxvs3tbijdDrkNUVX4HP7saZfMEU2EVzfgx82BH5
	GpMBjj/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvRnh-0000000E3qr-1ceO;
	Mon, 08 Sep 2025 02:40:13 +0000
Received: from mo-csw1801.securemx.jp ([210.130.202.135] helo=mo-csw.securemx.jp)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvRiA-0000000E2ZA-0TgK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 02:34:31 +0000
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=mail.toshiba;h=From:To:Cc:
	Subject:Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding;
	i=nobuhiro.iwamatsu.x90@mail.toshiba;s=key1.smx;t=1757298853;x=1758508453;bh=
	UOuCgsVOzcqGcD4bSe0mq3TlNWvnSHg5Np/d7vt13PQ=;b=iZqaXPw160+CiPIhBtqrrViDlIvKS0
	viOmkwJGATdJ5endyJu1uTm4IjotbWxp2NDtKwCFELaiCNQpiWj7vHRQJCOe3XIIUJBwnifwqgZ5P
	H97STPBCs/DoX4o4Bbn7PMPSQq1DdNDNMeRAboKt6K8KW6VWoAUSv8TNybBlXZWug9dadq9HYcNyI
	uK7pkclc/vY4xuCPDMRqFLtFpNblLTGGYxEwwUdgZknZkXTSVp0rzl6mqNOe2Kax3oHUESvVDFIsm
	UDgKLrl4C/XQVjIMd7LPW0xwEU2hbxOXSbpyKsG+MJkoTYbRtocP6u0YsuBCClL1VVHAVHoyRtN4A
	WtDw==;
Received: by mo-csw.securemx.jp (mx-mo-csw1801) id 5882YCH13421718; Mon, 8 Sep 2025 11:34:12 +0900
X-Iguazu-Qid: 2yAb1IXdsJfj9oAHkf
X-Iguazu-QSIG: v=2; s=0; t=1757298852; q=2yAb1IXdsJfj9oAHkf; m=Xw1EX/ZpLeBsPwnXn8A6IDPXLhm7k9BLgm4lJvZHWz8=
Received: from imx12-a.toshiba.co.jp (unknown [38.106.60.135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	 id 4cKrch02TCz1xnZ; Mon,  8 Sep 2025 11:34:11 +0900 (JST)
From: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
To: Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
        bhelgaas@google.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        yuji2.ishikawa@toshiba.co.jp,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
Subject: [PATCH v3 0/2] pci: clean up cpu_addr_fixup() for visconti
Date: Mon,  8 Sep 2025 11:34:06 +0900
X-TSB-HOP2: ON
Message-Id: <1757298848-15154-1-git-send-email-nobuhiro.iwamatsu.x90@mail.toshiba>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_193430_260588_3225187A 
X-CRM114-Status: UNSURE (   6.65  )
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

Since 7db02f725df44 PCI: dwc: Use devicetree 'reg[config]' to derive CPU -> ATU addr offset

dwc common code have handled address translate by bus fabric.

1. Correct dts
2. remove cpu_addr_fixup()

dts change need be merge firstly.

Changes from v2:
  Move update in drivers/pci/controller/dwc/pcie-visconti.c to patch 2.
  Update Signed-off-by address, because my company email address has changed. 

Changes from v1:
  Update commit message.
  Fix range.
  Set true to use_parent_dt_ranges.
  move pcie under the dedicated sub-bus.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>

Frank Li (2):
  arm64: dts: toshiba: Update SoC and PCIe ranges to reflect hardware behavior
  PCI: dwc: visconti: Remove cpu_addr_fix() after DTS fix ranges

 arch/arm64/boot/dts/toshiba/tmpv7708.dtsi  | 75 +++++++++++++---------
 drivers/pci/controller/dwc/pcie-visconti.c | 15 +----
 2 files changed, 47 insertions(+), 43 deletions(-)

-- 
2.51.0



