Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4ECC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 07:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0YJbhOWQ6P/BFcdb7ioetfj13r5KZyDInuOILu/nbQo=; b=TiHFGbr2zAPCkc4h4bcAvIfZ55
	fjgruDO8EDRUh1PSwnvQuww3yxDay5K07g2iYr0ULxU52eIR3EYsqdeDzT8TV/894rJWkqxaQmDPg
	xuPdMceBRhMYSyXv877/XUZuTB21CNOVUlPS5LysrFh0a5wq9xSX2Vk0xzSmX9MvRiGBxL93wrDsF
	5fur0jGjavzdKsIo2gE/jOtmNnb7VAmdmv/GUL2ohGtXLlkn5bw32n+EYk8sStk+enbsieBQVLL6p
	MF0IvTKMWoD2jqlS8ZNr+IkGlDgl1xmXgTf19TpQU5rug4Nzz/9HTPkeqzQfBwCqtZkXBa2QpqXJO
	7n9uKWAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9HUm-00000007Pvg-1A62;
	Wed, 23 Sep 2026 07:34:24 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9HUS-00000007Prk-31nO
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 07:34:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=0YJbhOWQ6P/BFcdb7ioetfj13r5KZyDInuOILu/nbQo=; b=ijZpX4bq2Jfdi+23agBTCQ8BlR
	cs3Tr8nbmvUNPmFdfnJ/YyDskx3uufe0/09IV3/11rZYHC+AL40fYB2Q6NsfNm6abktGtY1Jbnvm1
	vuYIF7HicUiTASW1wqPF8067mcMIdzQQZtOPk9j7pRhVJ7V+t55qZ6SMAvrKPsvCv6CUfGQYRY7hq
	LbfvK5EDZWQ63TPtVIx7g1StEHr3GMAPhnO4ljQmZmKsrLKTJhcEl6lILsl9UsuNrkcw95yiW1vfH
	B+86bNtxK6GUNjI313X8VFjn/Sb1qiLjHH2xiM1TfRFlkBXjpv+XbCvCmbuoE7ypX3soOM48ekSJG
	1hLycgbg==;
Received: from cp2.siel.si ([46.19.12.180])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9HUP-0000000CD23-2Qwr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 07:34:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0YJbhOWQ6P/BFcdb7ioetfj13r5KZyDInuOILu/nbQo=; b=TpYJ+srkLVbZQR1ayxWpydpWJ7
	rxlQ2Xs+uNUK1QTBRYSAOvsrAeyp/P673JfUNytwVGGjk8tOuCeDIMHzq1yP4+lnfCyTBXJ5IoZQR
	f1rVeEzvmU1Jaearlv3k8S7B9dP4kRGAyQZcy6ThwD5zh9G0TWxsxjp1RL9hP5ChZDpJJfNtQ9hC6
	nH68fVaxlqc/N6OZzH2pmDLOgZYj6yhCUhU0Pt0EZTL+ntl8yTsRrMHHIjY3/xlmiRuBt8e1rT8jU
	9Y+TFNVFZP9qwK9ThmqeB/BKjGJ97FbpzaaWEQidCCEsB13TJa3qvy3PNSTSH2mzBZp9JGRFIyQwe
	olLOmtiA==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:33340 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100)
	(envelope-from <primoz.fiser@norik.com>)
	id 1x9H2S-00000009mhH-1tJA;
	Wed, 23 Sep 2026 09:05:06 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de,
	Yunus Bas <y.bas@phytec.de>
Subject: [PATCH 0/2] ARM: dts: phyCORE-i.MX6 custom OPP table
Date: Wed, 23 Sep 2026 09:05:03 +0200
Message-Id: <20260923070505.494949-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_083401_674415_A60E1A3A 
X-CRM114-Status: UNSURE (   5.07  )
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

This is a revival of a series originally posted by Yunus Bas in
February 2022 [1][2]. It adds a label to the imx6dl cpu1 node and
introduces phyCORE-i.MX6 SOM specific operating-points tables, since
the phyCORE modules run at slightly different voltage/frequency values
than the generic i.MX6Q/DL tables.

[1] https://lore.kernel.org/all/20220209223258.1672425-1-y.bas@phytec.de/
[2] https://lore.kernel.org/all/20220209223258.1672425-2-y.bas@phytec.de/

Changes to original series:

Patch #1:
 - update path to nxp/imx
 
Patch #2:
 - update path to nxp/imx
 - reformat operating-points/fsl,soc-operating-points as a proper
   uint32-matrix, addressing Shawn Guo's review original remark.

Yunus Bas (2):
  ARM: dts: imx6dl: Add a label to cpu1 node
  ARM: dts: imx6qdl: phycore-som: Add custom volt/freq table

 .../nxp/imx/imx6dl-phytec-mira-rdk-nand.dts   |  2 +-
 .../nxp/imx/imx6dl-phytec-phycore-som.dtsi    | 23 ++++++
 arch/arm/boot/dts/nxp/imx/imx6dl.dtsi         |  2 +-
 .../nxp/imx/imx6q-phytec-mira-rdk-emmc.dts    |  2 +-
 .../nxp/imx/imx6q-phytec-mira-rdk-nand.dts    |  2 +-
 .../dts/nxp/imx/imx6q-phytec-phycore-som.dtsi | 75 +++++++++++++++++++
 6 files changed, 102 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-phytec-phycore-som.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-phytec-phycore-som.dtsi

-- 
2.34.1


