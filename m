Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E97C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 08:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GEle0AMI9TZnPmLqLtWKOxCiEdnYwNG8Oa2g+WyN29o=; b=wPCP+S10r3GXIWwstNg7TkSISv
	sG+2d4uHlGwPQarl+WWQHASULZf9+ueKyAQXNG/ltsarj/zcnu9LDuFUd/TPzy99+jo9m+pCus2nO
	URVyevIAGVjDBDGvEw2RKQNxFdltiuAqSwaRCl8aIjh+Va8cz/AGtfVLgVZFQ8hdzSKG8uViIjgqp
	E/QQ9LHwSr1EMZMNPh86YIEinRdknHHAXbEv1gYxEDf7HV51CWbkvB4rjcwzGX33An6AqZRZCCK+R
	2e7Bcl/2s8JOiPS8A4Es8E0lv0Iq8wkYAr6RuA4CQe6Pg47ShgpolG63FCRTnTzMUOz8ACMeEsG+L
	ePThPSGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfUB-0000000BXSL-19do;
	Wed, 19 Feb 2025 08:31:15 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfHP-0000000BSsj-1hOX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 08:18:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1739953083; x=1771489083;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GEle0AMI9TZnPmLqLtWKOxCiEdnYwNG8Oa2g+WyN29o=;
  b=TMwx8+Uta2lke6bplY26nZKp0gLqdA/OCg+MBj05z0OsVdPUAFExN0H2
   PYON/DY3bOcZquiX5wRsX40KtiOfGNjQ2gwYvOR+2/BXLSeI1QkTI8DOh
   P+S9ssoOdY9O9nYLYGD8B97LcHp0jjLy1lsJyaq4PfigsJfrVjwJGSV9J
   Z1pWCjwBD0q0CXs4qqwVauImv9NmAwmzDoLth4NuKf1nz3g/9jOrDb6Qg
   1HrpJMZpf4TuXyyaP12YWAXvVhUy7XgUtuDAbjEZdPM5Z9Bw2LWBwWUYQ
   oPnydxffclZUDwiKTD2m8CWUQaXhVNxZQEc4XctbnFkSk8/NosjcRxbtB
   w==;
X-CSE-ConnectionGUID: HKVTftLLQnC0kMdqN0dFGg==
X-CSE-MsgGUID: xT5G+t3NRH2NJSZh7QtJ5A==
X-IronPort-AV: E=Sophos;i="6.13,298,1732575600"; 
   d="scan'208";a="41945124"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 19 Feb 2025 09:17:58 +0100
X-CheckPoint: {67B593B6-18-C21CC984-D1047F1F}
X-MAIL-CPID: C4A40FE5FEDCBC6ADCB4AA86A878E99E_5
X-Control-Analysis: str=0001.0A002118.67B593B7.004A,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 552FD16CA0B;
	Wed, 19 Feb 2025 09:17:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1739953074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GEle0AMI9TZnPmLqLtWKOxCiEdnYwNG8Oa2g+WyN29o=;
	b=KAtWtUNtsuyZdaPlUXi9fjG4KmDJRl1KiiMc05jZGPB+ECUYwJjFMoseo5q+SsENHxLa2F
	kkpWOLasZ9KLzvdBFL+E8Tb2SIFhV5rYt1AAJvhrr4cQfkhDiQW6Ir0DCcuNPP+TT/2rjS
	PMsAlUtrjJAj/OeYQqtCxzvgiSvpEKuKZmZFutzYEuEwKujO6jGksMXoaPwj+moSEDMZxI
	rCsf7oC/o0iyGfTH79a/vxMPsT0NKX97AilFPjQ240nA7Iwtx6rUs136DWQGy+A55u71J/
	mvc/iJaYCQZR3Tcngki+7MPbv0doJEQXsOd+4sI46Vxt5US+vf60/GScwTSiSw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/9] ARM: dts: TQMa6/6UL/7: DT cleanup
Date: Wed, 19 Feb 2025 09:17:35 +0100
Message-ID: <20250219081748.1181507-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_001803_928319_32C7E6A7 
X-CRM114-Status: UNSURE (   8.91  )
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

this series addresses some DT issues for the TQMa6x, TQMa6ULx and TQMa7x
series:
* Ordering of nodes
* Limiting PMIC rail voltage
* Using PMIC rail instead of virtual regulator
* Add fixed-partition node to "spi-nor" devices
* Adding vcc-supply to "spi-nor" devices

Best regards,
Alexander Stein

Alexander Stein (4):
  ARM: dts: imx6qdl-tqma6: Order DT properties
  ARM: dts: imx6ul-tqma6ul: Order DT properties
  ARM: dts: imx6ul-tqma6ul: Add vcc-supply for spi-nor
  ARM: dts: imx7-tqma7: Add vcc-supply for spi-nor

Markus Niebel (5):
  ARM: dts: imx6qdl-tqma6: limit PMIC SW4 to 3.3V
  ARM: dts: imx6qdl-tqma6: use sw4_reg as 3.3V supply
  ARM: dts: imx6qdl-tqma6: Add partitions subnode to spi-nor
  ARM: dts: tqma6ul: Add partitions subnode to spi-nor
  ARM: dts: tqma7: Add partitions subnode to spi-nor

 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi  | 25 ++++++++-----------
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi |  4 +--
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi |  4 +--
 .../dts/nxp/imx/imx6ul-tqma6ul-common.dtsi    | 11 +++++---
 arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi     |  7 ++++++
 5 files changed, 29 insertions(+), 22 deletions(-)

-- 
2.43.0


