Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C581106FD87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 07:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Kkt3A1e6l/KLgh24uOCTImlNQ3maInjpGSRh0bHez1U=; b=BAlP/M4MElauNrGeIhrLnaTlsx
	MqAcGzYGzchzBNwbxnE+Eaa/Kcs+puw9YkIOnD3vXHWm3CdqNScwQMWawSi2QZsteBJFNuuqad7XJ
	M3knlaYSTKb1T0ImDqHao8WZW/30DilCHkjx2yhtQQBaKqua7FIOlT7vwVugpDcXIfhX4L4Y2fawF
	bQY8Sct7JzcypYawXOvafzZYLDG7ZugyF92AyjOmOOILT5CLDpAstr5hDaxA2B6BuKpE6cIzazTTg
	r1K0I1Bskf19ZSIFIl/6kAA0AEirQO7gYl6DqIMpMxTjE3WcXuEkbctxSbYx16SdKi1wUX8hrzP9O
	+60jkfKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wcf-0000000GyGi-1lGl;
	Fri, 13 Mar 2026 07:07:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wce-0000000GyGJ-3vWi
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Mar 2026 07:07:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Kkt3A1e6l/KLgh24uOCTImlNQ3maInjpGSRh0bHez1U=; b=JuohmyuHoS3O+OdD8or4jlfAhC
	WnW6c+nnzpPCXh7Jq8Su9CCIW1aw7obh71l8/6FgSzfuRNbumTD8nGkeRkG0XPACfZFrDQkAxyrz9
	IcEgpyrFlltfNCzzM0Ef3CVaTZM1vgby7NS7J7l0gDmdcKDdpj1/DFuZePdntCwPKZM2wscsSMQfP
	pgvKz2X2JOfHLW52VMRBSieT2cZNHQ6nIQueRCDL4QYjnug4aRredBOVKOtr0CgBEClOzktBjG3Ah
	DzM8TQ9PG1wfyyPvAej2lccfupolWtLdaJ06xqabbe8li10akzcBNMy54yg0zLJdfayNu72IJwUUI
	E7nWSHNw==;
Received: from www537.your-server.de ([188.40.3.216])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wcb-00000002io4-0G3u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 07:07:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=Kkt3A1e6l/KLgh24uOCTImlNQ3maInjpGSRh0bHez1U=; b=LbX4mAKwv7C4HUfxwhNXS7VlEh
	hmvcLa/leBzkzWdz0p6xBwZXLRlGDiGWbdStfzh8qnLx1U3hBb0nlJzc0bMs2eGYKHyW+0QOdAtmO
	RrDiyIazA141ISX3qUm7EVm6QWYqAIN/pRlHKw+t661OHH45g++qtekm+rJ1OeqckomtMeIa8elKj
	IaNiwb9So1RFgfHoBvYAi7PaRvAjXDwaWmRTl7latpUxEsYgbQECHNxjzxyi9bb1fKB1vGFZmlQuF
	Emvofw1cWpf/f0/0AUNY5rXbSEhvGfiKNumGvyjKgWkS9cgqEgPGxfdExkYSlzJZXVDUgicZMNKYx
	qjjFN14A==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0wcZ-000CUj-1k;
	Fri, 13 Mar 2026 08:07:43 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0wcY-000IYT-2s;
	Fri, 13 Mar 2026 08:07:42 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 0/6] TQMa91/TQMa93: display support on MBa91xxCA
Date: Fri, 13 Mar 2026 08:07:30 +0100
Message-ID: <20260313070740.585043-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27938/Thu Mar 12 07:24:01 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_070745_349328_5A1F3B0C 
X-CRM114-Status: GOOD (  10.14  )
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

this series adds support for parallel and LVDS displays on MBa91xxCA, both for
TQMa91 and TQMa93. The parallel display is attached directly, while the LVDS
uses an LVDS-Encoder. To actually work it needs the pdfc driver from [1].

The first two patches add required (Video) PLL configurations to achieve the
necessary pixel clocks for both displays.
The last 4 patches add the overlays for TQMa91 and TQMa93, although the
overlays for TQMa91 use the same overlay for TQMa93.

Best regards,
Alexander

[1] https://lore.kernel.org/all/20260303-v6-18-topic-imx93-parallel-display-v11-2-1b03733c8461@pengutronix.de/

Alexander Stein (6):
  clk: imx: fracn-gppll: Add 333.333333 MHz support
  clk: imx: fracn-gppll: Add 477.4MHz support
  arm64: dts: imx93-tqma9352-mba91xxca: Add parallel display overlay
  arm64: dts: imx93-tqma9352-mba91xxca: Add LVDS display overlay
  arm64: dts: imx91-tqma9131-mba91xxca: Add parallel display overlay
  arm64: dts: imx91-tqma9131-mba91xxca: Add LVDS display overlay

 arch/arm64/boot/dts/freescale/Makefile        | 12 ++++
 ...3-tqma9352-mba91xxca-lvds-tm070jvhg33.dtso | 56 ++++++++++++++++
 ...93-tqma9352-mba91xxca-rgb-cdtech-dc44.dtso | 66 +++++++++++++++++++
 drivers/clk/imx/clk-fracn-gppll.c             |  2 +
 4 files changed, 136 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca-lvds-tm070jvhg33.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca-rgb-cdtech-dc44.dtso

-- 
2.43.0


