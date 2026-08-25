Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DADBC61DBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 07:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yyhmfHSnhvkNCTBiWqfj453SyLCDbsMwb4fZbxXlEDs=; b=0noDILdoqz2Yh8GzqS2XSnclnN
	80xSIf75KdCuf6PrIkb5yjlRg8jLs7t2Esz57O95uoZAd2Eh9Rv9WBrZiDttU/2UeyB4g3Xojkr3l
	H7uvRKJjl+7Y6CXrchO3gXBZYEnAgjsRrpf2OQYk5EAxHKYogTbPvrQh9i0/kWzEhoK6BfJ3DEcyO
	nUT29mTQLYhIyRMJyIOQTGS9ZNm3JPHsMKVBvuUOGcQDikVoiX7Y9Qas8pCObv0ExRYkid45EG235
	5P0wBldMjOsLzOzpqOvHnBeZ875OUQdk7Hm+51pp1srTIcWJSkQOdapejAqfomKJ9TuAU+aHudCeF
	Gl/T1/3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wylD7-00000000GDd-1F7E;
	Tue, 25 Aug 2026 07:04:41 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wylCv-00000000GAX-17Ge
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 07:04:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=yyhmfHSnhvkNCTBiWqfj453SyLCDbsMwb4fZbxXlEDs=; b=VTgDOIuYSf8ELgpuavJKd0dFp1
	hHNTwy0Xe6Gt3LK47M7XGg595uYi0Ot8nbGzFB14eCcj2OhcYEY3+3abHTkrrNm6T3sFT3RLJjgge
	pU4K3eiqaXmh8FCYmIgLD7BndbrcN+t8dzSbAO5UFycay6CCLw+1QpZ2d7EWTQGNmDqnKxzuembDh
	0tEBuFIf25GJF3Gfb15136apu2VedFbZDeVtABTwoDA1RGXUxj62aPDDv1DnE5jos9VPsQgGCtMUW
	zXkYvlq7lwngYhYMYrixmuLjrZto42jRmWAxqmhOBwwQT3z4QBIHMCd0VcSy5N5RokKD5W2hbTHkv
	w88bPqDg==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wylCn-000PBc-2m;
	Tue, 25 Aug 2026 09:04:21 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wylCn-000H2F-14;
	Tue, 25 Aug 2026 09:04:21 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] TQMa6UL[L]x[L] DT improvements
Date: Tue, 25 Aug 2026 09:04:15 +0200
Message-ID: <20260825070418.2072708-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28102/Mon Aug 24 08:23:58 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_000429_308783_A3338C6F 
X-CRM114-Status: UNSURE (   6.97  )
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

Hi everyone,

this small series improves the DT for TQMa6UL[L]x[L] a bit.
Ethernet PHY IRQ support can now be added. And the on-board USB hub
is explicitly specified.

Changes are mentioned in their respective patches.

Thanks and best regards,
Alexander

Alexander Stein (2):
  ARM: dts: mba6ulx: Add Ethernet PHY interrupt support
  ARM: dts: mba6ulx: Add USB hub node

 arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi | 36 ++++++++++----------------
 1 file changed, 13 insertions(+), 23 deletions(-)

-- 
2.55.0


