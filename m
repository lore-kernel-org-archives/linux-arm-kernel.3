Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DD1CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 10:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZOIIyAi/+GlYEL6Pahn/kWUROmPQ14HPEuftxMS5fFg=; b=vJLGCw5VYxlF8MvqZBx4o2ocz0
	gnrt8QMj/+2j1FQ7ECGWPDsYp9nnTZLm39E6WhK+ruO3fY2bdQNRybsXO41HXV5r3pt1k8SjVdNGJ
	JQbJLeWzlYNmKHEqu/gWeA2Cew2Y/w0YKgO/C6mbkjAi+kfCW3MCOMesAkccY3MQlUcHsRfOhcytG
	wt+sTq3JqhtjCfVWJIO9oBGEqnVXedJIl0lVrFPxEqVOtimzbb/X0jxXHVaHRxfoQGy6kZ0u8zqyb
	mAKVI0dOt490qmrbYeqY7sMzdc8OqqQUc2CsKyLchZBUGHLEVsWs5nBlkxJsp0GkHgIlv+IGrtva0
	GFudsx5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut1bf-0000000Bt4Y-2ncr;
	Mon, 01 Sep 2025 10:17:47 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut0h7-0000000Bim3-0s8h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 09:19:22 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5818RZ5O025349;
	Mon, 1 Sep 2025 11:18:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	ZOIIyAi/+GlYEL6Pahn/kWUROmPQ14HPEuftxMS5fFg=; b=EtZkLnMTGcZVaH/F
	7lMVN1cMkh4fc3S0pg0tlGW5h42V8oK+o3GJGFGzYbMGNyX+G1NdqD70kbIWkYVR
	8qHunwkZDuwtBXdXJ5XxRP2g45dET0liMaq0iuWeH9ZbSVf7a6t/Abdp+o/IhbP+
	TSe9/kqh65CZkMLJMUxSPzl01CL1LM2HbNOPyRdnFhEJAZibOdD+gC6yrcEwECw5
	9teqcU3aa0mI6zLqc4mHFV8oKIwJumDxnRFtYG5pZiN69ODC8Wl194sp43kGkE4v
	BmxziaJkv0L2D8oL0Gh+oF/eP7aQCW6hcnwHqDC4vsvrw2z3O70y22BOivJnvIUG
	va5qrA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48upqk6jtd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Sep 2025 11:18:50 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id EB4EC4004F;
	Mon,  1 Sep 2025 11:17:29 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 43BAB765CFA;
	Mon,  1 Sep 2025 11:16:37 +0200 (CEST)
Received: from localhost (10.48.87.141) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 1 Sep
 2025 11:16:36 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Mon, 1 Sep 2025 11:16:27 +0200
Subject: [PATCH net-next v4 1/3] time: export timespec64_add_safe() symbol
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250901-relative_flex_pps-v4-1-b874971dfe85@foss.st.com>
References: <20250901-relative_flex_pps-v4-0-b874971dfe85@foss.st.com>
In-Reply-To: <20250901-relative_flex_pps-v4-0-b874971dfe85@foss.st.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, John Stultz <jstultz@google.com>,
        Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@kernel.org>
CC: <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Gatien Chevallier
	<gatien.chevallier@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_04,2025-08-28_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_021921_650284_1FBC5D5B 
X-CRM114-Status: GOOD (  10.17  )
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

Export the timespec64_add_safe() symbol so that this function can be used
in modules where computation of time related is done.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 kernel/time/time.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/time/time.c b/kernel/time/time.c
index 1b69caa87480e7615d44ef409b96c081f2d15395..0ba8e3c50d62570d7248dd02a80395cb0c51c42e 100644
--- a/kernel/time/time.c
+++ b/kernel/time/time.c
@@ -858,6 +858,7 @@ struct timespec64 timespec64_add_safe(const struct timespec64 lhs,
 
 	return res;
 }
+EXPORT_SYMBOL_GPL(timespec64_add_safe);
 
 /**
  * get_timespec64 - get user's time value into kernel space

-- 
2.25.1


