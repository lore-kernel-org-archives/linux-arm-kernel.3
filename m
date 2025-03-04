Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F22C282D9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 19:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2wY6Dic8hzBm+S2wld/DgwBFhKKy9RZVyTbW8u8LUKQ=; b=wDhZ/otauQHnac5ykNyGe2Usqd
	abjt/0+hYW+3iwhRPpttzec5lkpd9medmY3NccZrZMe+G3IvL6r+3XkjOZSYWP7qPKL8ggqiiL2o1
	JLzqSSXYqr7X1fXoefvh6to1wE/ik6POE3c2885e91EVxskCKuTmgcSg4jNeBEXxIoXOMGbllwMQp
	xu7DB3q9CA8aUAMFfNKN3jqXI7Ixkdq/PNbYp64/irVKLTT0JMV83SmvzEt3IKiRQefpeW5IpRfAN
	UOv6zdd2h7beZo+s1oEcM2AdioDsWF9yTQb0YW5dgDltLWPQyk7Lg0RcXpmoNhZHKD58Fgf1eSye5
	hbQvu11A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpXqP-0000000603x-19Fs;
	Tue, 04 Mar 2025 19:22:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpWG3-00000005g71-3EtJ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Mar 2025 17:40:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2wY6Dic8hzBm+S2wld/DgwBFhKKy9RZVyTbW8u8LUKQ=; b=aPzBuIrduQtx+JzcDWMk1B67mG
	t43/OGWKKIFcK3AGYS0z5lmb7HkYLqSf5LlNJI87FQModsNOB1wfT+BhuPSOalEKJBmRWiIi1tnqO
	oYkzC4oKEHsg+bR5HTFFdX/xW/e1X/DU81eLQeycVKIrUU8kONXo+K8cdh2p0wufkmwOjPZhwtKz7
	5a3/tisiNF+Whe/laUbIKyJtVtRhuzix1aw1ko+i+JI2rasoK6Udr1Z5KLKomMnodvsKqzmUzly0x
	Qbmm9Ai52KtZQkjDGxXkqaE+jX8AYJacpcC7ZR1QfQm1YgQmwJNVmt9olr9HUUtzQtfN77P1RAwVH
	9nnp6fOg==;
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpWFw-000000008Iz-2gVm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 17:40:38 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524HXaf1010806;
	Tue, 4 Mar 2025 18:40:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	2wY6Dic8hzBm+S2wld/DgwBFhKKy9RZVyTbW8u8LUKQ=; b=l0N6wU/mIwkLnrve
	lkY+E5+N4aIn5MVtiEYfr1OFPmz+jauaVKYeBoXloM67YVbVm4R/Eltr+d3IWGQL
	KsE2Dc1XxlneQv3k0bRxF3TEugh4zmQBvplKL9H32cI/8F28bwTl9q38N6W4bRl0
	BPtMhBqHchXsuwWh0RB4n++5yix9xYXTEbzHaqeTUJTeaOsm9Rvo2l1A5x2661MY
	N/jK8QE90w2FIBWAlAu6tm04b3up4QVDX6kNE4EYbx7gPIRanfyg157iNUDDq1k9
	VxzOLzaHbWZGjnWzkwngh2qZqlqgNSQm4Og0YnV3u/uWIqmeQz620xzGoDeOwj/M
	vTrwsg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 455wbhmdyv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 18:40:20 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 929BB4006A;
	Tue,  4 Mar 2025 18:39:15 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C3136594C2B;
	Tue,  4 Mar 2025 18:32:52 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Mar
 2025 18:32:52 +0100
Received: from localhost (10.252.16.143) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Mar
 2025 18:32:52 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <lee@kernel.org>, <ukleinek@kernel.org>, <alexandre.torgue@foss.st.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <jic23@kernel.org>, <daniel.lezcano@linaro.org>, <tglx@linutronix.de>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <devicetree@vger.kernel.org>,
        <wbg@kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <olivier.moysan@foss.st.com>, <fabrice.gasnier@foss.st.com>
Subject: [PATCH v2 8/8] arm64: dts: st: use lptimer3 as tick broadcast source on stm32mp257f-ev1
Date: Tue, 4 Mar 2025 18:32:29 +0100
Message-ID: <20250304173229.3215445-9-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250304173229.3215445-1-fabrice.gasnier@foss.st.com>
References: <20250304173229.3215445-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.16.143]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_07,2025-03-03_04,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_174036_995904_C39D3420 
X-CRM114-Status: GOOD (  10.67  )
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


