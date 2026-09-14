Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E8CC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 09:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jLEBtgZPD99ESKFnRmQeGhEc0KH9pKzoTmRMAH/wIzI=; b=sJLz+eNupAD5pqecltevuWR0V5
	4gVtRj0od6lHm6QObHI/PXiEqDGzHcEkDdTjHeuOIwGPwCyFRn0kud6N+uYnPQei1LFhLXcxZ5ngU
	yWEXpu0oqpB2QeFgoORwK8JnmB9lrNYDQ02ATRqo5PXrEVsAKrZJRpxIWAK04AbFsHSBgSMRRYfZd
	ULybXRmP8s1RiMBMwELXkCRj+zw+g5Y5p4jvaCqgCErfcFQoyND7u9I4hEAf/MY8RTkrqhnbUcsKU
	e3eJf94cCHM6KpBy+B3DWbhIycUMS3nlglzEl2cRFuL/O9651eEd86TUfdpN2snin3NxFdI1DtU8U
	f4dfoXPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63B5-00000002zc7-0TPR;
	Mon, 14 Sep 2026 09:40:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63B2-00000002zaC-2Y9U
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 14 Sep 2026 09:40:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=jLEBtgZPD99ESKFnRmQeGhEc0KH9pKzoTmRMAH/wIzI=; b=bTtJkwi/Wni3H4MuDkfU1T4h8Z
	z+EpXD4coXPS737CsSz+8W/4awQOffUI23tWMrW/nYmrt46igflsFV7kJSw6+hvIkiDNK2BL/2saA
	oONxvAnABa+94/3W/ZG/Cd5iNMeu4GdRZT2VaOH/aBGGbb25whxtWjo9srloavG8898wljnT3TxnK
	rOntoGY6SgazTDSQOWJKbLiFsC1JKWE7ZOE3ahB0zqNg/TuOAj+hxowquiI4k5Rj9BfRiWlf4S8yo
	seCwqr6GfvrZPpBi1G2VGHrtLq2UvtCLEP3gBMIC3fjchmpAIjVXj4oKfC7nhTsCSwFdZ2QEvKYNg
	lTH/WHGw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x63Ay-00000005SB4-2Que
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 09:40:39 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E7xxoa3490217
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 09:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jLEBtgZPD99ESKFnRmQeGhEc0KH9pKzoTmRMAH/wIzI=; b=GRHBF45zjkMEa/aQ
	DPBEp39VwMgYCtsR+lOVJ9DVytz9ho4CvOvD5hneLrwyFgr3W3Cnem7dLCCDt6pd
	kzDnJir+5XMq5ZAsk7FiytBnp01hyY3Rwv0xpNUw3pny1PrD9h3CznEqY82yOc9x
	jTe+g4H4p+KbnaJLMcEE1H0i/6RtGRY+2tWwTwVT71Fd/72VC1CDDrlcASX79cnt
	Ijj5W58vhSGpxJYPh7zgfSXUhXteTkvyIWkB4t/Rvf2YFtMGYeBn34ukjlmXGfPc
	CMiEKWNI8zCI3a7UVUSql95BtG9MmWvsVKiTT3rw5kPP90lY0ftZl6an0rW4giS4
	ywIXxQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f0b74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 09:40:35 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39d8646b10eso3093708a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 02:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789378834; x=1789983634; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jLEBtgZPD99ESKFnRmQeGhEc0KH9pKzoTmRMAH/wIzI=;
        b=eACITJLMxMrnO999FwvdAh68gVs1Sdkl9CXy2ufMaRCn+B2wByyiRsM6G95Kbo373y
         yzy6rSRN0HqXcqHWiDPB5uJ0+ET7CFUOlsOba6TZAnT/UB7Vn5Bpbr4We3ndeip6NI9n
         rp7l2yZ5Ab80aPRYLhDpeWa919f7hxAmYOJGH1yrIyHk7k0mgheUu2mUjeCFmWrjCYDi
         t/gSTquU5yS9uvNvkWYnALxzCbBQtRaJe+gi9dBIePtgptBdghTwk2RTFsbJDhkm4Xi9
         wkctjF29c1b3sXvyQc26xaVHUWfNX9qOYaPZ/twL1pgpdgNH/ylukm+CHNvFNVEspwZT
         0HUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378834; x=1789983634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jLEBtgZPD99ESKFnRmQeGhEc0KH9pKzoTmRMAH/wIzI=;
        b=p5gtK8iAIFsP/5RSxCqsPJfCFNs69O+n3hfY9GH3Ot7tAzDl6gWaLJXjMZga/AGROY
         nTZ41gbcWfgDnRUzc3qQjDuB69LHSFBZvaDZ/ywpyrS4ijp/KMy0QXmyIdBS9Za+6WUG
         1iQk5qWl060MK0xh/nNMxF9PQD0pihIapSV+nSYUUAKvWrNhxMOit6M+ypLjcxebOM/2
         DkAM1/qRNGj8HUqxD6LANacg6cBW+ZHQo2MsZQFmnPQUPmLiShLq27Xb3uecRNhYxH1A
         rhi7th/Uruk8HblrO3Ca/t6vqDWrZi74m11JPNKhB5qXWm7H38MwW11fSx4Pk9k3f9eD
         Yb5g==
X-Forwarded-Encrypted: i=1; AKwUvBxZJvUHAKpUkuvCTctAvrmuXjeKR3ETc9b6172HQUd+C6v5dbFqNxg23QqFkKHwPOeTWmBYYbPKA/t20zPnum8h@lists.infradead.org
X-Gm-Message-State: AFuF++m68sXBH0q1g+oWtTrH2oSvyiChWCwE50f8X1AStT0obKRBS6WJ
	J4O+u09wPJm+X9md+IiRk97bMrNwsBd6ADxbNHsFgyW+vA+KFeGZFu8vqhk/du9QlEQQz+U1xoR
	LQ9ovPK6N55hHGePPyUNuEUItgDqu18Mtl/rLAePBVAelZnyP6Yuqsy3CPSmm1th+UNS8p3kD0N
	zv+g==
X-Gm-Gg: AYBFou2ik+YMfHtkQiJyBH/JmOdVaQq2Lryqv+6tpGYKsIZRIaqS6+QFp8W1hiRVZ0a
	0UkAMXIrBRYd2wTZ7i67zkE64kPYFdqXtSvxVmevf4MvF+dRLJ6fxOW+qH+PRVXOuGMv09Q0zhW
	4JMoU4S72MfvDINF3DXn10BjipwAsgXkwnzXls/huBG8RLJMoARA5iXqJrC8GPMNxmGqXfhal3u
	DV8PsNYB8dieQ/W5fnPbnK1Qz/b7r6I9uBYcUGNbfFLpUam4xT+ZtINVbFgnADM5nMdQoRdtDpQ
	0LHRm+4L2Q5yk2fgTq7G4b9ywCFCqK4EX2KJecVLxPr+naiOpoFVBE4lNbrhEmjeFJbKuXHk8xk
	Ydgr8/SmEbe4MhtvOAxFi5+d6t+NNg2+vh71ucBx4jw3/MI69HhlCf8Zb
X-Received: by 2002:a17:90b:39cc:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-39debf94eefmr4068716a91.8.1789378834166;
        Mon, 14 Sep 2026 02:40:34 -0700 (PDT)
X-Received: by 2002:a17:90b:39cc:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-39debf94eefmr4068644a91.8.1789378833728;
        Mon, 14 Sep 2026 02:40:33 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e60484sm19488728a91.4.2026.09.14.02.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:40:33 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:37:55 +0800
Subject: [PATCH RFC v2 07/10] arm_mpam: Fix mpam_dt_create_foundling_msc()
 to create MSC platform devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-mpam-resctrl-dt-knp-support-v2-7-bf6645bb2f65@oss.qualcomm.com>
References: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
In-Reply-To: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789378765; l=1946;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=Eup0TFC52Dvb5C0RkUrvytnZqSb5g4QWq/ztKU5w+8Q=;
 b=fXbWfUPGaOjktIrRdd0qWh/gG9DAXYutlr2e3ZmvjdmcsduoOF8c4KLO90VZPV33CVNCkTVC1
 Rxwgo62tnAQBpp4OtifMAO9MA/mDvKp/0V6F38k1t2gH4Muaj3j3HEI
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-ORIG-GUID: m-13IXgbfUlId2YxMnjSrKqttVlLO6oK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfX8xaLvymlZKY6
 eHXxQuE7SHKFH6/3/c4XFPPBqXumBNDQASbk8Am2enlw6QGkKAphtiONLx53N1rUtAUOL4rZVHP
 gK29q/9mUnSIcbdUxEKOUoyNHy6ysuo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfXzcjpuBjJV7GY
 lATSYjBIXw6ejLbY6610VKegY09UjgvsM9RdvwxrGM063EQKbSbXVsYT1m/GmRA9JYEvIatjwcf
 DDwc6VmlZQRLnoAvds/H37NArL7vvqtvDGQF0UOu8eN0doza4NxKD0GJ7uW20eXaHraFD9D0ql7
 NI4fmW69dgKMDiwqXbZKN+DuAOWv9MlXhOAErc41XLiCKiBq9tevjbUhjLsqkcsrpc6/sLChcya
 ayga2BLR1ZZXd8mLrds4XqnlcgngSLQsBPW0X5hK2SGki++5VguEVLAiXI2XXzKmWmZ/hzA5+Do
 8uW7kadhQE5+H/Gu0L7lZvx436ZIpc9+wkQeHk9z6vpUyZkn1bRHMKX2sHbqBrwWQiCBFLIXfwN
 3cJotjEjEY6Bbvr5tF7FVdXG+rwgPucwTj4cu9V0d2a0HyQaaBo1Tec4G0TEd9h1MPK/jE/Waft
 RljEHBJsROdNuBzCNtQ==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa7c113 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=rtFuv77GRgtEkpuRCi4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: m-13IXgbfUlId2YxMnjSrKqttVlLO6oK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_104036_986604_1154C324 
X-CRM114-Status: GOOD (  17.95  )
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

The original code created a platform device for the cache node itself
rather than for the MSC, so the MSC was never created. Instead, walk
the cache's children using for_each_child_of_node_scoped() and create
the platform device for the MSC child node, skipping cache parents
that firmware has marked disabled.

Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 480e38cfa86d..7ef3ed55b066 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2366,23 +2366,20 @@ static struct platform_driver mpam_msc_driver = {
  */
 static void mpam_dt_create_foundling_msc(void)
 {
-	struct platform_device *pdev;
-	struct device_node *cache;
-
-	for_each_compatible_node(cache, NULL, "cache") {
-		struct device_node *cache_device;
-
-		if (of_node_check_flag(cache, OF_POPULATED))
-			continue;
-
-		cache_device = of_find_matching_node_and_match(cache, mpam_of_match, NULL);
-		if (!cache_device)
+	for_each_compatible_node_scoped(cache, NULL, "cache") {
+		if (!of_device_is_available(cache))
 			continue;
-		of_node_put(cache_device);
 
-		pdev = of_platform_device_create(cache, "cache", NULL);
-		if (!pdev)
-			pr_err_once("Failed to create MSC devices under caches\n");
+		for_each_child_of_node_scoped(cache, child) {
+			if (!of_match_node(mpam_of_match, child))
+				continue;
+			if (!of_device_is_available(child))
+				continue;
+			if (of_node_check_flag(child, OF_POPULATED))
+				continue;
+			if (!of_platform_device_create(child, NULL, NULL))
+				pr_err("Failed to create MSC device for %pOF\n", child);
+		}
 	}
 }
 

-- 
2.34.1


