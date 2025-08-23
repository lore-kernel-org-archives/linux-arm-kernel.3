Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C98CA0FE8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 09:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TSQ2sN3s9VBkJCPgvduSGRVkYYKkIMIbTvHVaxtrX70=; b=Ujg/6IWrcHpjcmes8vztr1BHqI
	6BSh8kN5BNQo4MUppxZSzqhmPpwrcrUd64KTc9+ueHAcfvg/vCudh0UEFaxyCfx0qcbNozibwLdWM
	ZuN4FN7oJc1WhwuKBUQPT2Xkm+Fx5OinFql3SpI0QEvpbZ/VM+lC8iFDEAx4nq5Q/FahIaZOZDo8V
	1eEwNNx5SZIJSvHTqfmLM3Z7A2mrQE08/AkL1hHO9YAjigGE1Hd32CZWK9xBHo2PeROXCl+vMAs+q
	BQWwSVnFLPPuXms7UbCxjCjSFDWEEMAcB6W7IhjH/L955tEMv1e9QJHHCZxLyfmD7qM1Co8ofc22e
	9bNXXQyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkgo-00000004XDZ-3bTp;
	Sat, 23 Aug 2025 09:37:34 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upeqe-00000003q5O-45bT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 03:23:22 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57N3NGsl856664;
	Fri, 22 Aug 2025 22:23:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755919396;
	bh=TSQ2sN3s9VBkJCPgvduSGRVkYYKkIMIbTvHVaxtrX70=;
	h=From:To:CC:Subject:Date;
	b=eWFJtclbmm25QlQ5tdIAiP0y5fm9fRAWG8lk/bwt3e6TL7yvP14PeTQM1/nI8NV3f
	 /RbBptPq1zqZb68uVvFZIlpykcQ+csjbgUHP11mtHf6nPk3NDl5nigyOd1oj+zmrms
	 mCWgDQ8RaapLycpGHdaWEI7wJjhokM36Rz3hVOQo=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57N3NGQ54067513
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 22 Aug 2025 22:23:16 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 22
 Aug 2025 22:23:15 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 22 Aug 2025 22:23:15 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57N3NEeQ288079;
	Fri, 22 Aug 2025 22:23:14 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <bb@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v2 0/2] Add USB support for AM62D2
Date: Sat, 23 Aug 2025 08:53:02 +0530
Message-ID: <20250823032304.1085775-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_202321_105513_103514DD 
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

This patch series introduces following changes:

* Patch 1 fixes the register length in main_pmx/padconfig for AM62D
 and AM62A. This also fixes "i2c 0-003f: deferred probe pending".

* Patch 2 enables USB support for AM62D2-EVM by adding pinmux and device
 tree nodes.

Change Log:

	v1->v2:
		- Added fixes and Cc tag for Patch 1.
		- Dropped two patches for OPP (applied).

Boot Logs-
https://gist.github.com/paresh-bhagat12/e29d33c3fd92ff17580edf1441ece9f9

Tech Ref Manual-https://www.ti.com/lit/pdf/sprujd4
Schematics Link-https://www.ti.com/lit/zip/sprcal5

Paresh Bhagat (1):
  arm64: dts: ti: k3-am62d2-evm: Enable USB support

Vibhore Vardhan (1):
  arm64: dts: ti: k3-am62a-main: Fix pinctrl properties

 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi |  2 +-
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts  | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+), 1 deletion(-)

-- 
2.34.1


