Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D568C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 09:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5fV2R1E3CKBb4WFfRo1d9PYp2TC8wiqYUiEwsJbh6Qc=; b=imzvyLB1rOADAn
	dhgr6ZJ+rGLiCPz0lZSdfaexP+FsyLG+JxnVQHN4eTVb/OOLQtS4SppGG2mHh9IJ37ZzWH1MFmLZG
	m+6WaLM0cEiEXARp8pHnAtLyF9jfj02jCpVd/xlX8ONWfZUxbUFyT/6BGK20DxZNPjY7mDaUIkwVf
	UJRcmuc2dIPJFB9CzeeexwIK420OJQl+IX0OdockKEUGBRKXoVUT2R9GrFhQlNNdPKHOrFmtdxhd3
	xjeJbm/SQOdcyd8luvRwrJfHKF0zm+gWFDIx1TU2kyqNWKuzXnUy4Paalb56ASk6CvH3AK/YEhpyl
	V/XmsCw/+58TPS4Nq8kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tweQx-00000002lCC-1y5G;
	Mon, 24 Mar 2025 09:49:27 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tweKz-00000002kRl-3Hul
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 09:43:20 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O7ELVd032168;
	Mon, 24 Mar 2025 10:42:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=5fV2R1E3CKBb4WFfRo1d9P
	Yp2TC8wiqYUiEwsJbh6Qc=; b=o0SeTaSKKMUsYOUmOa4/jofgvOu2CbNHqPZR4J
	0590RDqcPG3Niu91HZ96V9+SDVJLcRZEQxzXpO+NqAsm1OdYKg7GrrGWPHiB5sCq
	eS32CMq9KCaOAzG0KB64861IdL8niNlDmjJiJdaWejHtDhX/i8alovllZCCZyVu5
	YamOpIJRGcro4TNuZ9uI25C0c8Gjk+12Lc+FN9BtTMY7/NUvNvDG9O34TtlN2U7F
	H4LWx37jWYYfr8jMweBJRTkARmFIVR4W3VmvEpYMLV8vFKZgS3jjBxWuygR5X+go
	ufO4+/kzPAsIOeYUpViumltgWd4rZih9TcGGtSNkPku75yvQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45j7n84eqn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 10:42:59 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E3BD1400DA;
	Mon, 24 Mar 2025 10:41:40 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 14FE17EE902;
	Mon, 24 Mar 2025 10:40:16 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 24 Mar
 2025 10:40:15 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Subject: [PATCH v2 0/2] spi: spi-stm32-ospi: dt-bindings fixes
Date: Mon, 24 Mar 2025 10:40:12 +0100
Message-ID: <20250324-upstream_ospi_required_resets-v2-0-85a48afcedec@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHwo4WcC/42NQQ6CMBBFr0JmbUlbENSV9zCEFBhkFlCcKURDu
 LuVE7j77y/e20CQCQVuyQaMKwn5KYI9JdAObnqioi4yWG3POrNGLbMERjfWXmaqGV8LMXZxCAZ
 RWe4ujSkLY5oComNm7Ol9+B9V5IEkeP4cudX83n/Nq1FaXZ3LS20xc2jvvRdJJaStH6Ha9/0LN
 jJtXcwAAAA=
X-Change-ID: 20250321-upstream_ospi_required_resets-34a8b17611b6
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        <christophe.kerello@foss.st.com>, <linux-spi@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_04,2025-03-21_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_024318_130557_2E084622 
X-CRM114-Status: UNSURE (   8.59  )
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

Make "resets" property mandatory.
Update spi-stm32-ospi driver and dt-bindings accordingly.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
Changes in v2:
- Update dt-bindings commit message to explain why OSPI's resets becomes
  a required property.
- Link to v1: https://lore.kernel.org/r/20250321-upstream_ospi_required_resets-v1-0-9aa4702e3ae2@foss.st.com

---
Patrice Chotard (2):
      spi: dt-bindings: st,stm32mp25-ospi: Make "resets" a required property
      spi: spi-stm32-ospi: Make "resets" a required property

 Documentation/devicetree/bindings/spi/st,stm32mp25-ospi.yaml | 1 +
 drivers/spi/spi-stm32-ospi.c                                 | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)
---
base-commit: e94bd4ec45ac156616da285a0bf03056cd7430fc
change-id: 20250321-upstream_ospi_required_resets-34a8b17611b6

Best regards,
-- 
Patrice Chotard <patrice.chotard@foss.st.com>


