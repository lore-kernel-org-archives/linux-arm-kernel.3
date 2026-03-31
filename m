Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E789109B474
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 14:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AO1TMipeF3x9ONXKLaFScjDsJmSbpvvwIZ+aASe0uAU=; b=YG1A2FjcldM19LokkZX7PSDGBv
	XWVLxtz8jQoHYpRdYA62G8yHW3cI/5fC0fi3XhZRNeU5Lhn6sP1SFedcAZ5Mnkw0jd/1oKItpxYRR
	8eDLk4KPBLLVVyQSZ99S2hsQmJ9Tcfmjhz1iCxe9NRcZHcSpfQ+2s4+0wd5jnkvHFhl66616dlH6m
	7qD0cgSsjAPEhkzTceH/YVav2mZDOueBzJshlNET3IZPNnwqvAdi9s7pWGrKDpFN/F2qR+bQiD0kD
	p6rzwvENJoI11kkF4K9sMqio4+nQ4j8tFz2J6usm1+96SGm8UkdWiKcqeqyEZb3PpqEfiHMWytyiY
	w0Li1ZYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ZwL-0000000D4ME-1zc0;
	Tue, 31 Mar 2026 14:19:33 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ZwJ-0000000D4Jd-00Xh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 14:19:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=AO1TMipeF3x9ONXKLaFScjDsJmSbpvvwIZ+aASe0uAU=; b=X/RsBCWE/CPb59IHU8JBpkOj8F
	H5xADYQj7WN7hRlDFe8S++xS9hGlJhhyXfVjj860NoJzNpSR+8fa9i8RZGP8X2INQ6nbyhGeIqjcP
	uMxH/o+nOgpzSAfScvNnSHpPfYTbie3epZdkv4c/qw8qrZ6IIf8cL5a3QXSER0WekdTDVksCfdc6D
	+5nX3M3/j+2QuyHJdEjPWHkjzN3y8uZqqBI+UVwMAoL4JzUJEescxn2MMemxXW1LNMF5avcciHYJn
	826b3L3cWYWhUkyCRkr+Fcc0jPeTYW0HpVYSBLrmxtfxPK81gpVOfvgfPjeJW/stlid7iCmkJV0Np
	j26121ZQ==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w7ZwC-000Jro-18;
	Tue, 31 Mar 2026 16:19:24 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w7ZwB-000Mdz-23;
	Tue, 31 Mar 2026 16:19:23 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH 0/7] TQMLX2160A-MBLS2160A DT fixes/updates
Date: Tue, 31 Mar 2026 16:19:01 +0200
Message-ID: <20260331141915.2918927-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27957/Tue Mar 31 08:24:30 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_071931_136801_C9AC43B4 
X-CRM114-Status: UNSURE (   6.40  )
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

this series adds small fixes and improvements for TQMLX2160A DTs.
The DT overlays address specific hardware behaviour when serdes is configured
differently.

Best regards,
Alexander

Alexander Stein (1):
  arm64: dts: fsl-lx2160a-tqmlx2160a: Remove deprecated properties

Nora Schiffer (6):
  arm64: dts: fsl-lx2160a-tqmlx2160a: fix LED polarity
  arm64: dts: fsl-lx2160a-tqmlx2160a-mblx2160a: use DPMAC 17 and 18 for
    SGMII in SERDES2 configs 7 and 11
  arm64: dts: fsl-lx2160a-tqmlx2160a: add aliases for all 18 DPMAC
    instances
  arm64: dts: fsl-lx2160a-tqmlx2160a-mbls2160a: add various GPIO hogs
  arm64: dts: fsl-lx2160a-tqmlx2160a-mbls2160a: enable pcs_mdio17 and
    pcs_mdio18 in appropriate overlays
  arm64: dts: fsl-lx2160a-tqmlx2160a-mbls2160a: specify Ethernet PHY
    reset GPIOs

 .../fsl-lx2160a-tqmlx2160a-mblx2160a.dts      | 306 +++++++++++++++++-
 ...l-lx2160a-tqmlx2160a-mblx2160a_x_11_x.dtso |  20 ++
 ...sl-lx2160a-tqmlx2160a-mblx2160a_x_7_x.dtso |  20 ++
 .../dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi |  23 +-
 4 files changed, 357 insertions(+), 12 deletions(-)

-- 
2.43.0


