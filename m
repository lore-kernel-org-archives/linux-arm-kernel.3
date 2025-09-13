Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5C4CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 06:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3OZQiGNMXfE/ACLETEfEQUWdCU873vCZ6upELcnL4J0=; b=Jeh1xt9TOvQSGOk8/TkBojM2wO
	YpFeWdfwT0DLEYEK6MZoZpPWZbBvaUo0i6MBYXX1BhOU2XvIAc5DeKm0q+RWwDenmyIHVezeaHeXB
	QDcPKWF6mk8EnLVVSGO0SRCTltz4rXc876OV2GdQ2UPT8WaEkkHk+YSjnrUbhlHXQOvLuC70jZz4/
	C/3kJVTGQTeN8mSbs6IKuaM9N4FF68ZsJQQ3j4ooEgPB+7H81su+vjKne/PdhLO2P/bg/bWeccEqs
	QB9bTv3V9eb+zuJSijynmTa8vZZfk+aG0f67hlwnDaKutfW5j0iVHbuD7s+WcPf0NZr4tLlkk2Kd8
	ZQy+tgKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxJyE-0000000Da5G-15Zn;
	Sat, 13 Sep 2025 06:42:50 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxJyB-0000000Da3Q-28dU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Sep 2025 06:42:49 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58D6gDnc664120;
	Sat, 13 Sep 2025 01:42:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757745733;
	bh=3OZQiGNMXfE/ACLETEfEQUWdCU873vCZ6upELcnL4J0=;
	h=From:To:CC:Subject:Date;
	b=lTVQc5XAWzgdG3o6NtWPFM1v9sK6VgozTzX2U2qLMgwJYTqtswUw39nO0TGKrXsPd
	 VzN8/4V5TQSZC/IQ50D6vRtggPX2CRbR4KXWS5z5J4yFdIAb+Ncjw/tazdsrlBj3EL
	 BHPXlLTyEpRJBSguH8Kz+eY//H8QwMB7wkAQh1uQ=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58D6gDXY1841141
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sat, 13 Sep 2025 01:42:13 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Sat, 13
 Sep 2025 01:42:12 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sat, 13 Sep 2025 01:42:12 -0500
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58D6g5uw543875;
	Sat, 13 Sep 2025 01:42:06 -0500
From: Swamil Jain <s-jain1@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <jyri.sarha@iki.fi>,
        <tomi.valkeinen@ideasonboard.com>, <maarten.lankhorst@linux.intel.com>,
        <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
        <simona@ffwll.ch>, <aradhya.bhatia@linux.dev>
CC: <h-shenoy@ti.com>, <devarsht@ti.com>, <praneeth@ti.com>, <u-kumar1@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <s-jain1@ti.com>
Subject: [PATCH 0/2] Enable OLDI support on AM62X
Date: Sat, 13 Sep 2025 12:12:03 +0530
Message-ID: <20250913064205.4152249-1-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_234247_699824_8E9BEFD5 
X-CRM114-Status: UNSURE (   6.78  )
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

The AM62x SoC features 2 OLDI TXes each, which makes it possible to
connect them in dual-link or cloned single-link OLDI display modes. This
series enables OLDI support on AM62X[1].

[1]: https://www.ti.com/product/AM625

Aradhya Bhatia (2):
  arm64: dts: ti: k3-am62: Add support for AM625 OLDI IO Control
  arm64: dts: ti: k3-am625: Add OLDI support

 arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 52 ++++++++++++++++++++++++
 1 file changed, 52 insertions(+)


