Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3707CC87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 01:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OFb+MxeGvGYuCTvG77kyztXowg+3Zd8eZRLVKiTa1Xw=; b=q4BzYaQ3KwtdntN98fixWw4x5N
	LKzJaeSthL/880I3M9QxvhhNN8X6dMaFBAoPaoDmGy6sLw+qmN/ahupEOC02nnqXSP+THfpP/gweV
	rQ8k9OMGLsvIFVkyR+APNrMtXxSLayxESY0VfJZgCySSLE5FrhvmTy/oCHiMa8Qi1emjGojo/VbLC
	/k9uFVRMYc8OX/cWwqXlBGkNVN4BsVFf4FXN91jGAGxQC1SwwuxR0VhgNDQKjn6IqymBPjkW2mrnh
	vECZHPJAZ9H9Pt4AWEiUaOWFv81pCRR7EBQNelsVqHTX8+yMjhFWZO4iqK9hqtAAoTHFeda+75xOV
	+vMCHRhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj6ti-0000000BbmU-1ym0;
	Tue, 05 Aug 2025 01:55:26 +0000
Received: from mo-csw1800.securemx.jp ([210.130.202.134] helo=mo-csw.securemx.jp)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj6m2-0000000BbKY-0ma2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 01:47:32 +0000
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:Cc
	:Subject:Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding;
	i=nobuhiro1.iwamatsu@toshiba.co.jp;s=key1.smx;t=1754358430;x=1755568030;bh=Lc
	Lx+c1Ziwph8MToNFr2L5doRdPKNx1LR2gU7L9kP3Q=;b=xXwANU0qR3w75pq4r+CVyOr1lEuaQsZc
	m+RVN1T8bjUVII+BrJSoeITEnKG4I0p5QZqfa/XSqVyi80LNcJSxW5jicbHGr0+3wJ4BUm1x2rRUy
	kOCBWmZgzZtt8f09GEciAzsx1ZsZLR277C2jSyBYlOmElNg0oDdGKmBeIDtK78vFZrUZmM0v6bYui
	A5L8HQ547aY93kRDGdXrSKMdwKepPxJpIhvC3+vj+BqPI/BgR51GYuxIb65Aa2Xt27S8thUyff+yg
	Kqh9cbb9Q3WKaKh0ZNcuI34W94MfEHeDws6bxk34ClA5AqyU6aGR9/mJuntoUiOZDPONi6FmV9DnP
	gQ==;
Received: by mo-csw.securemx.jp (mx-mo-csw1800) id 5751l8oK3492421; Tue, 5 Aug 2025 10:47:08 +0900
X-Iguazu-Qid: 2yAb5t3M3LwiUKK6XA
X-Iguazu-QSIG: v=2; s=0; t=1754358428; q=2yAb5t3M3LwiUKK6XA; m=sRYnrJ4AKvupUhpvGfMA/J8gq0uBVaN6DEO0tu2N3Bc=
Received: from imx12-a.toshiba.co.jp ([38.106.60.135])
	by relay.securemx.jp (mx-mr1803) id 5751l74Z3322505
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 5 Aug 2025 10:47:07 +0900
From: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To: Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
        bhelgaas@google.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        yuji2.ishikawa@toshiba.co.jp,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH v2 0/2] pci: clean up cpu_addr_fixup() for visconti
Date: Tue,  5 Aug 2025 10:46:59 +0900
X-TSB-HOP2: ON
Message-Id: <1754358421-12578-1-git-send-email-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_184730_703693_706D8B30 
X-CRM114-Status: UNSURE (   6.66  )
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

Since
7db02f725df44 PCI: dwc: Use devicetree 'reg[config]' to derive CPU -> ATU addr offset

dwc common code have handled address translate by bus fabric.

1. Correct dts
2. remove cpu_addr_fixup()

dts change need be merge firstly.

Changes from v1:
  Update commit message.
  Fix range.
  Set true to use_parent_dt_ranges.
  move pcie under the dedicated sub-bus.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>

Frank Li (2):
  arm64: dts: toshiba: Update SoC and PCIe ranges to reflect hardware
    behavior
  PCI: dwc: visconti: Remove cpu_addr_fix() after DTS fix ranges

 arch/arm64/boot/dts/toshiba/tmpv7708.dtsi  | 75 +++++++++++++---------
 drivers/pci/controller/dwc/pcie-visconti.c | 15 +----
 2 files changed, 47 insertions(+), 43 deletions(-)

-- 
2.49.0



