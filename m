Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 840B5C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 12:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2wY6Dic8hzBm+S2wld/DgwBFhKKy9RZVyTbW8u8LUKQ=; b=MJywMVGyOKn78DhTbzUL1bLep5
	F5pUs3kSyBSmyXOB0vgLWzntB0UeXGhlr9wYUFkKLSrurqS0c1JbaHfFi5HlfFUEKVf4PUZS1fTXq
	FnYGqSyk2L4BBPT532aYS9wr7+bl7n+4MPu7ZqnjWaE9BzXle+gnYIEbo1ZCgS8eoTcAriInOKomL
	NwxoKdOXF6kC3e2qiS8ZgzPHyenvkCQqXhXYLkE5gX/MrGUgecp5UcB5boSVxsHSynkCDlGmjZd7J
	PFnPgsM2mg3uw174of6KDL6ZMTacKHRRBtTfRk14OAq2qjLtjRHEYxlWdtcvrC78MWTzQhFoGI4yW
	DuahPaSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9kXU-00000009hop-3k2r;
	Tue, 29 Apr 2025 12:58:20 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9kTk-00000009h5Y-3pQX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 12:54:30 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TBj1WX006373;
	Tue, 29 Apr 2025 14:54:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	2wY6Dic8hzBm+S2wld/DgwBFhKKy9RZVyTbW8u8LUKQ=; b=RRTSZ+m0h8YkGL8v
	os5svgrTXqb/b6jOKAJXFJcc0ndC/2bD41BRTmk76SSQrG3uUr2XK0/3Fjn3oUf1
	Gx+a9mGbDo5wyT/GRN8Gc50QfXSHg3ixNz2JNXUVskCEzdSa/kzq6sWui454u7eP
	e7jVmtND91Fb3uqYM2l8SZgZPPK2zEuzBhc9ZxMSl0WKvclM2t9PhnSHpHmLRuwJ
	kPF3P7mlRafYzIbrL9cflnEX0cekS4SxiCMtI/IM/dysEeMKkdWzR+r7kVI/HytA
	PONgiG7X66x0VVjAs0Je4HCY2753o5Z41Ff1TxCOnmeLfQHeKJ4Xu2EG/x/TtA3o
	MNZ0Dw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 468pu7kd01-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 14:54:21 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E29D04009C;
	Tue, 29 Apr 2025 14:53:15 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0173FA904B7;
	Tue, 29 Apr 2025 14:51:52 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 14:51:51 +0200
Received: from localhost (10.252.5.160) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 14:51:51 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <daniel.lezcano@linaro.org>, <lee@kernel.org>,
        <alexandre.torgue@foss.st.com>, <tglx@linutronix.de>
CC: <ukleinek@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <jic23@kernel.org>, <robh@kernel.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>, <devicetree@vger.kernel.org>, <wbg@kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <olivier.moysan@foss.st.com>, <fabrice.gasnier@foss.st.com>
Subject: [PATCH v6 7/7] arm64: dts: st: use lptimer3 as tick broadcast source on stm32mp257f-ev1
Date: Tue, 29 Apr 2025 14:51:33 +0200
Message-ID: <20250429125133.1574167-8-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250429125133.1574167-1-fabrice.gasnier@foss.st.com>
References: <20250429125133.1574167-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.5.160]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_055429_252452_A70C914C 
X-CRM114-Status: GOOD (  10.04  )
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

During the low power modes the generic ARM timer is deactivated, so the
the tick broadcast is used, based on LPTIMER3 which is clocked by LSE on
STMicroelectronics boards.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 1b88485a62a1..242115863ab4 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -190,6 +190,14 @@ &i2c8 {
 	status = "disabled";
 };
 
+/* use LPTIMER with tick broadcast for suspend mode */
+&lptimer3 {
+	status = "okay";
+	timer {
+		status = "okay";
+	};
+};
+
 &rtc {
 	status = "okay";
 };
-- 
2.25.1


