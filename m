Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0AE10A62C4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 13:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SE2NRfRHPwJEdSfoM027+6QczK5mncPPsBhluV/mbEo=; b=zjSztCMZabPeK3XOJPO+/5SREb
	IB9Ap0e5fNpow1lN2cMRqy90oroViGVL5hRTnKqEnYsOSo56wyQ/R8SO84Bv/cAAjmMpwNTfLgnQB
	8Dt0SuyXyYMagfGi85ARy/koqiTwQh9WHDH3rZCBbdWWZTwxsjRwMT9VtgSW4Nxr3stcl01bUZbM4
	T4R98E/1bwR5KKhSIXSiuvG7IIWwm3y85dHXdYUtEL4MVsIHnSXg/l97PtgMNKAwUYhtmbmatrQI3
	HT/5bbZYnDwTmT7war8S/l0bkO3q89ZfHxDMsaahKb67ZQh/tVki4cqo+eycwxbc/MskHYFzepDbz
	Hr9XuDFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5kMi-00000005VUa-05rZ;
	Thu, 26 Mar 2026 13:03:12 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5kMc-00000005VTg-1A0K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 13:03:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=SE2NRfRHPwJEdSfoM027+6QczK5mncPPsBhluV/mbEo=; b=fhRjKcvQewDrlhhUPTpRVfjrUF
	7NrLBBLD8Jp61Dqtx1pMuEdWMwYUpQNGQSSSE9NI9AQuJpUn4gasoHBHk8ne7xGK1QU6Bugr9hMgE
	pOhzib5r0HeAPUmfIKPQpcjvmNMD3YrUpnvQcLwBPzC7KqZ5P5ws04kdqDHskbA6zAqoMOMLh/FcZ
	bJ+x+Dab7dDxm6Xs4z6dt7AI0cYmTGOFLPuTwh4AXeG+j4pV6QWYLsMvo2dAiL1CgmKEJJmy3PPgj
	csDhXXKHfrcXnh9uUczmnP2jIs+QjoyECfkIx/L6CZNuzxsPYntH8QQUxElhvLyKLtd2jEDF7zz1Z
	8IATbRHg==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w5kMZ-0009m1-2C;
	Thu, 26 Mar 2026 14:03:03 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w5kM1-000ByX-2q;
	Thu, 26 Mar 2026 14:03:03 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 0/2] Support TQMa8QM
Date: Thu, 26 Mar 2026 14:02:20 +0100
Message-ID: <20260326130225.1406806-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27952/Thu Mar 26 07:24:52 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_060306_428406_F67FD88A 
X-CRM114-Status: GOOD (  10.02  )
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

this series adds support for TQ's TQMa8QM. In v4 several prepatory have been
merged already. So this series include only the two missing patches:
1. platform DT

2. Workaround for missing "ERR050104: Arm/A53: Cache coherency issue"
workaround. See [1] for details. Split into separate commit for easy revert
once an errata workaround has been integrated.

Changes in v4:
* Reduced recipient audience due to reduced patches
* Sorted nodes by name (not by phandle)

Changes in v3:
* Small cleanups in patch 1 & 4

Changes in v2:
The need for clock-output-names properties for renesas,9fgv0441 has
been removed by reworkging the PCIe clocking

Best regards,
Alexander

[1] https://lore.kernel.org/all/20230420112952.28340-1-iivanov@suse.de/

Alexander Stein (2):
  arm64: dts: freescale: add initial device tree for TQMa8x
  arm64: dts: imx8qm-tqma8qm-mba8x: Disable Cortex-A72 cluster

 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8qm-tqma8qm-mba8x.dts    | 871 ++++++++++++++++++
 .../boot/dts/freescale/imx8qm-tqma8qm.dtsi    | 325 +++++++
 3 files changed, 1197 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi

-- 
2.43.0


