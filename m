Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC538CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 12:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+xF4bO/fTs8QrjNJoxW4GipCjwad45AsUDQqmvp/V/s=; b=1ltoToGLB9x73Kga/ugOek31gy
	nCQGSUe2UOdp+7tE+WixBmQhKz8p9Jxhkf1YpAUnMHg9ieEaW91lxUQ1xOINugHcwrpDFw4oWcfuY
	my9FjaXbi7EKfCzvn5ztL1NwEbJ2M1MjKM6eBgrOnH/lSdNtdgls4dtMf9IX1yAVSW91HLj4xMskl
	HriUB96lS1OkfiQ7FhZvejR9pLtQic24RkElbyuwr2E49aV+x7GA0QY2APwwC3h6acoyN8P62p9OP
	Ri++s73UmVfDD+06K4W414xk4gncNl7IcVo/WgZtx/jtVA06V4EXp6xB9lXsA2tBA9oLCQ6VsNzjW
	MUVsB2XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyTx-0000000G4iP-1tny;
	Mon, 17 Nov 2025 12:37:21 +0000
Received: from mx-relay15-hz2.antispameurope.com ([83.246.65.157])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyTs-0000000G4gu-2sTf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 12:37:20 +0000
ARC-Authentication-Results: i=1; mx-gate15-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=+xF4bO/fTs8QrjNJoxW4GipCjwad45AsUDQqmvp/V/s=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1763383022;
 b=Z2qJfSB962gswPHV2BifEuY5btiUtEK5UGmvYAJf9dihEg+2LLn4U/b8us0ZZyzyuFb7iV77
 os/pfvyF+xLx06gU037KzSuH+WdKZW+TNPThe67TIPSdAgWfSmrlmEXWkDlrB7CelnONDutnFGa
 G3LEEmdopZhUOznIcvH0y4We8OO+wnK2ZRAxCb+WEfgDt65fQPh6QH6ErB2ZnBJeliI+A8dA8aw
 ds5fcH9ob/2fegHu54GGWoCrmUVcD9VC2ugpbUowDeNaBtQPSmcS5fAdaZ/SzqYGgSSs42tUTQC
 8iglhYhJ0ktWxs/XDWBqLs/sA3dk2Mh0u/cE+U38XD0Fw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1763383022;
 b=DRe3KppFTDLRLi6x+lJlSvPfO+Innkwdrbeo67CJxZcnwH/EapH0hgQJEdKQ/iXnQATCJOui
 GF/3LuzuyVurL4+UMmsuMPH5g6wYZndMrqaZi+Nxf6hEl4FF2CuXbGlLKnCkrQrdJ7V+oMCmoay
 T1IzQ+9ru799gQUqG9tZQbFy9YsBctdbX+riL0ADB9Lyd9NzbsjI2sMzIdcn5kk9tstyk+pIGJG
 k0IBTxB8To5WCDhxuRvRl1xSQ4NyH/vJ3d3vzNHY8MVfPTQBXmL85Eibd0m0FflOunPR3X1ELBI
 7+oDrNxwOoSEYFE3OmTqtRIHuHb8k8UwBCARk9gErvm5A==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay15-hz2.antispameurope.com;
 Mon, 17 Nov 2025 13:37:02 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 1F7C8CC0DBA;
	Mon, 17 Nov 2025 13:36:48 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Martin Schmiedel <Martin.Schmiedel@tq-group.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH 0/8] TQMa8MPxL DT fixes
Date: Mon, 17 Nov 2025 13:36:27 +0100
Message-ID: <20251117123643.711968-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay15-hz2.antispameurope.com with 4d96gh6p7Dz2FbSG
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 328a4f074a2d613aa025241cbcc29309
X-cloud-security: scantime:1.739
DKIM-Signature: a=rsa-sha256;
 bh=+xF4bO/fTs8QrjNJoxW4GipCjwad45AsUDQqmvp/V/s=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1763383021; v=1;
 b=bM9GOjYvsoif4C36pLCqRKNdQCnQrxwXDdBeByIxpG8s3pVwWcxkA/VcTBnwDbUaEF6u4Bcp
 vJpaopSoiuL98Mm0CqOB2aXskNd6N3BmvyOTDAvCC7m6IxuVRzJ7v/kaslCNaJDZBCplJVbNsxE
 q9uVVdYZIjhwUFzQm22FrLU7p1Mo45CcUinTSVapu2QkALDwchh/ZpBJyIORLSIY1iUNrSrCspx
 OmDDn7xfhZaWvtrpHm7cZrEb2seZ6pdTFSCXA5NyxZ72LQVum+XSxUtJ3UCOqjrkEA8uiXoHl+j
 Yr5d4qRvbdaz224rZ5Dy5ifa1VX7FD3HVU5INa1xXYI4g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_043716_868858_21E3B0FF 
X-CRM114-Status: UNSURE (   9.77  )
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

this seris includes small fixes for TQMa8MPxL both on MBa8MPxL and
MBa8MP-RAS314. The ethernet IRQ type has been changed to level-low and CEC
pad configuration has been fixed to use open-drain output.
For both boards the HDMI audio output support has been added as well as
the ENET event2 signal on MBa8MPxL, which can be enabled using
/sys/class/ptp/ptp1/period.

Best regards,
Alexander

Alexander Stein (8):
  arm64: dts: tqma8mpql-mba8mpxl: Adjust copyright text format
  arm64: dts: tqma8mpql-mba8mpxl: Fix Ethernet PHY IRQ support
  arm64: dts: tqma8mpql-mba8mpxl: Fix HDMI CEC pad control settings
  arm64: dts: tqma8mpql-mba8mpxl: Add HDMI audio output support
  arm64: dts: tqma8mpql-mba8mpxl: Configure IEEE 1588 event out signal
  arm64: dts: tqma8mpql-mba8mp-ras314: Fix Ethernet PHY IRQ support
  arm64: dts: tqma8mpql-mba8mp-ras314: Fix HDMI CEC pad control settings
  arm64: dts: tqma8mpql-mba8mp-ras314: Add HDMI audio output support

 .../imx8mp-tqma8mpql-mba8mp-ras314.dts        | 21 ++++++++++++--
 .../freescale/imx8mp-tqma8mpql-mba8mpxl.dts   | 29 +++++++++++++++----
 2 files changed, 41 insertions(+), 9 deletions(-)

-- 
2.43.0


