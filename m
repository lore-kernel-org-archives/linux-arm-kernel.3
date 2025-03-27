Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 729EFC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 08:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LnYAL0qzCi9XCmR6NhqoPVEmturxz+5w+0yxwuJjQKw=; b=xAzuGHRiLT+8UYssDp19SkXFTP
	0R2knqHHLq7fkazGvb3uyXfekpEnpmIXxsOeK5ppGRwfAvjYsntKc94VszFrV42IndpXRgCQ8y+04
	SCvmy1VuByXlvZBVmTx4JbN8NjmR7HjmYY7lkFFwTTbZpIrdETsuFi4yXsiAd02SjLpw1Wc7SBW0+
	iW6yD8Umq9zZ+r7vivz1lt5f6vyySsluuNeCCGh5qu9HsoLT97ehpkhqRhLA1BoVtr/9kVO9/Ghvh
	rf8/OfoI9By6txYuLpEfeyOFjB2GXHOQ1U4KqL4I1I68D76aYG75KjtaSHoPyn6NL0X29hdLRoxyC
	iDnZLyFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txih0-0000000ASzW-1ieJ;
	Thu, 27 Mar 2025 08:34:26 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txid2-0000000ASWK-261f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 08:30:22 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R8QREd010593;
	Thu, 27 Mar 2025 09:30:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	LnYAL0qzCi9XCmR6NhqoPVEmturxz+5w+0yxwuJjQKw=; b=opqUvtxOT/LndP6n
	hlPbdaijHL9uoS4O0dQE1rIcuDZ8AWQNCgyrSfWs+4WtNlgCJiANNmWRDOFeyIZc
	TvbM0HCVx+9oPbz8sv+ReWVUQmAT+tYZh9Y0suHyh3uoNwnxqlgpdw7LZVF8e1+z
	yF+kGgHumw2Aaiy34t4F4nO+C0FfaWNDlGr083wo2PzD8tB85kqIFU72uCl6HcJ0
	AL+XV44OjmEGpLGREBuQD3jaddAnLCId/duksQGuaBe47VPN/bpTdvho5+EVLfiI
	Hbs/YOfUXKy0OP0EyVaFmyuxBn2ZUHL/TWcWgArPvpK81BIzHEKIoz90T+JLVOuV
	cL29IA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45mwrb2c4f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 09:30:11 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 07C81400B5;
	Thu, 27 Mar 2025 09:28:59 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 762C98329F2;
	Thu, 27 Mar 2025 09:27:33 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Mar
 2025 09:27:33 +0100
Received: from localhost (10.252.3.68) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Mar
 2025 09:27:33 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>
Subject: [PATCH v2 1/2] dt-bindings: remoteproc: stm32-rproc: Add firmware-name property
Date: Thu, 27 Mar 2025 09:27:20 +0100
Message-ID: <20250327082721.641278-2-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250327082721.641278-1-arnaud.pouliquen@foss.st.com>
References: <20250327082721.641278-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.3.68]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_013021_152463_47327102 
X-CRM114-Status: GOOD (  10.84  )
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

Add the 'firmware-name' property to the remote processor binding
to allow specifying the default firmware name in the device tree.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 .../devicetree/bindings/remoteproc/st,stm32-rproc.yaml        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
index 370af61d8f28..843679c557e7 100644
--- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
@@ -139,6 +139,10 @@ properties:
       If defined, when remoteproc is probed, it loads the default firmware and
       starts the remote processor.
 
+  firmware-name:
+    maxItems: 1
+    description: Default name of the remote processor firmware.
+
 required:
   - compatible
   - reg
-- 
2.25.1


