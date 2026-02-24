Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1ECE9B249
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 10:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OZ4E54OvU7h144U3LHJamjkNTkG1gc0xqf9JFK5pbkI=; b=3kj/H9W5xndvx5DIDFU8r7V/1u
	hrxByokvujHSYt9j40pzh1bDD7D5ejP65E0mjQ3c4KXPa8V2iijsmXnD8hwoBm+N2g0sOWMYiVlPn
	61QG8+iHNHw/7U81TyiVJRf0GbiBGzjun/7qCAETzlRxl/sfQFeVz5nKZOt6HDg5lxK+xMGTKs6jj
	pqUoLUKBJ0KGqUErd0rteGLMu9NN3winECdQfDWLrFetpMabCe+GCTU1dVc2Wn/r19WAgpxxy4qDj
	VDPZwUBAlgD9pa789O+arhGQqagIYL5QmW3WS2eR9U7kBcD6BMgbnPKBoHBqsRwArGmWxOcTH3XtS
	JIz8UoUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuptW-00000001sMI-0pZr;
	Tue, 24 Feb 2026 10:43:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuptR-00000001sJ4-2z3e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 10:43:54 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OAFaok2284725
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 10:43:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OZ4E54OvU7h144U3LHJamjkNTkG1gc0xqf9JFK5pbkI=; b=D9v3qx8o/f75VsT/
	LhL4bFzaO03AVDp1hmkLJWmKeXl6N8puQxT2VpFjhcj5v8ELcW0JtAtalWMSUIZP
	3pV5FCZLs5BKt95sc/ebDVXvmj48cxHbfbt0CbrGQOxcYkL88Iy70In2gQAaGCdc
	+cr4iEqs2rCL1kq6FIw4gwDUOd4jW0e3oJWHpk8+8o8w4JZCZDRyHMAXBjYG7AuM
	qlCbmEoe8IMRhYd/fnXTl59jp0anjm8qrEtDaCOBvQSBODiGRRBY7C6+HahIzx+e
	NJ256yntk82Jtw+sBmGnspNvusljYofkYBaIz8Ssd1WaVHxqtwrPIOJROK5usNfR
	UQntIQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgtx0asd0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 10:43:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70ab7f67fso3843491985a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 02:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771929832; x=1772534632; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OZ4E54OvU7h144U3LHJamjkNTkG1gc0xqf9JFK5pbkI=;
        b=WBxRI7Blu9rqh57HbXRqGp1IC9dLZjpoIzQHNwRt+/y2/mIM9ieb3NOIGl0SDMNJd3
         FufG8TXBXxjxlSeHQwnSIc4RxisZQ9qvK3woRT2Da6nhlTHEss+O6Qa1BjGhiJleTCHF
         YCqNAoH495Natvjr+viyE3vgs7/iytpbog2Z5rlN9QUG5q5wItXqqFycWMdop6pYLA77
         a0QCTy2WWPYO+RO+lDLiac/MFS6Yrzg9/MUF+48WlXejp9XNmo26rLmTxL8j1478h/xK
         idV/PDpg7ohssi1aGF/EcNMU8bHtCCBx7jaX8pWRnzvrR/VG9Vz0+D/eU9acJDfsjt70
         g6Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771929832; x=1772534632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OZ4E54OvU7h144U3LHJamjkNTkG1gc0xqf9JFK5pbkI=;
        b=nJkF4S4jJhp1do/zGzU6+903ge7+AwEc7akXQVjlu3gY4xncMl0q06mZF0x8+h9ucb
         NeZnQS53KlZj5zBMUZ8aeCDcMaOP02MbGzKSFYI83v0ZV0XCKUj+niaOcfMJJg4jue1Z
         F8cVQ9GfDH4UV6im2WzR7NY9k040xLJUcgbL1rPJ6XtXK+7T5WQJwwfV4c+ra3pUMI2c
         GJThQP2XcdSzTUU20cG8lzvjl/THoeBnzSMGgYTgonrTpjPgr6yFbmDApt5dH7o6rb63
         TmmLsBx2oW4A5rqQo84zeU9BgvbXaOJoC/7GfuAwe4DBOWhbWw9E6GyumWSg7dMug3Gf
         pvPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWeonXrfMji7soG24qIYQxBCM78qKhurhUII2e3luPMr7PCIDTqaUkGh1/RvEHyexDbTpQY+brIM08Qd+OduiE@lists.infradead.org
X-Gm-Message-State: AOJu0YzuK9j5AGfWci+N5x1LSq/jjgWp9GnzExgcCedWW6JFlvZG2QiG
	uSszuob3xOljxt17ZJbV2VXcNiP2whLz/1+kUEu6/39CU9LfZzv3gqn7q1Dz6aPyDTaX+zNI4i4
	YtJXruEQgwrl6IWwutb9tBBA6qmsJExTZkU2xJZ5N9Nhd1IIRY/bX5cM3eScsvd33vk/2vcQ4Hk
	Qahw==
X-Gm-Gg: AZuq6aJ9jfYpB7iLq7RpO/oGNKbc2lA2k5zGC+RP2Cml8bMTPe2pSAIv+9Z0CzKm4Tn
	AczBTKAZ+b12BjYZ51YLfvgRebQXJ8NfX39vzD7alPk0uH1PBv4lo0jZ9cGM4HTfj8s3bJIOdz4
	WfSVrDn2QLG5m6ZbgBqqimAhs4H7vUwhULssoWAhw6OMHiN+zuFQ0UsbHDzEUX9TbRCTAptEpwg
	avmibcb3jlF27iG+tdq1OpzocMOwKkKCsNdGo68G6Nz+Z+kNbPu2TvU/lhWC4zeJBA2pARADVOf
	OwH+bmIMbrQBi4MH1pPAsFoq5aWEobHV2vY+Ahv5gUD2E0V2l5XSOGZGJ4wIAVol2JnwWLSWI1z
	XqBv/mEutn4hw/5oLNV2BE7SzO0cmtzhMf0Fw7f513f2N1Q==
X-Received: by 2002:a05:620a:1a93:b0:8ca:ffe3:33a3 with SMTP id af79cd13be357-8cb8c94311fmr1569673785a.0.1771929832084;
        Tue, 24 Feb 2026 02:43:52 -0800 (PST)
X-Received: by 2002:a05:620a:1a93:b0:8ca:ffe3:33a3 with SMTP id af79cd13be357-8cb8c94311fmr1569670385a.0.1771929831544;
        Tue, 24 Feb 2026 02:43:51 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d40004sm25685906f8f.21.2026.02.24.02.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 02:43:50 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 11:43:41 +0100
Subject: [PATCH 3/4] firmware: arm_scmi: Use container_of_const() on
 scmi_handle
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-handle-not-const-v1-3-90bf93b53e27@oss.qualcomm.com>
References: <20260224-handle-not-const-v1-0-90bf93b53e27@oss.qualcomm.com>
In-Reply-To: <20260224-handle-not-const-v1-0-90bf93b53e27@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2933;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Fe4MjhMn8lZ84KxqMdgpBwRbEDyKHabOEHVEnVI2kpg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnYDesakxrpxNl4CWrKKBXT6ZbDgoQ8kFNfECs
 nXEUwiwftSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZ2A3gAKCRDBN2bmhouD
 11AiD/9ru5hTRR38swT4NSjVHe7EPcPuJOJK0VitxSDyeTmSfPuBgQRbAy9FX60bP6ZNbyUcs7J
 7zbaHko1wWuuTXZYzbrSmHb3mNOKD3/dZkpeqCFPZap8bl7aNABQ/4eE79Pv/RiZbsDOP8BZEfZ
 kK6kKzWftbzhLwIcHfKMBbGQVmJRlir5iynhvi9cTCSnvEdF5tD4c/I+RiggOQkijoLjfwxD2og
 MYA6jylgYDTW1Bk9088jvtfJbNX48H9YfQZnkMxcgHVWXrLPIcWmMNNTkgbw8Zu/4mu/dpYxeDc
 rCL2vtq50RM2JjDXpoxqvPtuYJ+fLSocWFAm/P7wA+FHlr08TEZGiDnCZjO007ST6oO7p3gIpT1
 2NqT0MLKjwzKwGgk9WN5IkoAz0k8cWo1pOilBgx8ZgbT5eZGSBg8H3jfrMtBdeCTDL6CxGMJEX7
 JUuVdug8yMxTh4QLkTY/YqWNINWPAAv8r4pMJl6oCFPnH8ZExy2V7fUUYjuK/W1WQCDTpEBblcv
 JwpQ/gtTGjPeatMVQvmmHAw422D6PDLpPRKpTRcNxoIrukFBsHcQirWIYdw5zlCRYiaN2C1frLV
 nH0mdavtUPUZfSYjYI65KS7eXUR50nhSFJqYPvNlQYRcEq5Bi8eQ05JGDjo/qKklmOkzTAG/Ggb
 ZIt4m0sUR/ULbfQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: MbKifixohyNciVrS5v-eqlT5JU0qPNwG
X-Authority-Analysis: v=2.4 cv=euvSD4pX c=1 sm=1 tr=0 ts=699d80e9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=vFoygJ3d8N6QX0cQTZYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: MbKifixohyNciVrS5v-eqlT5JU0qPNwG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA4NyBTYWx0ZWRfX2Bv6pjkWTvIQ
 3F+DTBco3Ks4gbZckF00ZifMyFGt96P6hgXp2hooI5wFSnI5M0VYUUG+821ftC46c3iFfRuwygL
 iycKPBiBZsu9cTWONkjQXHDSHYCnXM/Ly2mLKaEohRpG8EWT5q1gO41yGX6FhYHsH6cSw0F9Yh9
 j8AjNaQNjkuAFR7tzHuDcB8GtKGv/QvyBBMEPcCAACztzxdgZrg8l0Z1gBmX3vZ3+IvdMZ1WfPE
 P+dFbntJAbxOhr1pqu6qY3OlJoWnwuqriBElUXiK92hYvp+yjB6ttvQPhdIaMtcIoodHhrXlirG
 kxN7+aRpyOyVT4vxwLN/4g7jxdQtxsaUk8LPUwcu6pZOTbGNEG/Qa8+vwNbV/S1tHSh/4ikFB0N
 fBMBg6PgnxEz9xOlXmFBGICwgT/HfDSzAolxqMd3kJQk9046lTsl95mmkNA0OW0ctwYVONnFlW6
 6Mxkti9KHqVP4oxoPzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602240087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_024353_763190_B0DE09ED 
X-CRM114-Status: GOOD (  17.47  )
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

Functions receiving pointer to const scmi_handle and are not modifying
data in containing struct, can switch to safer container_of_const()
which does not drop the const while casting.  This improves readability
because makes the code more obvious.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/firmware/arm_scmi/driver.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 951711aa7d33..cc6cdb7017cf 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -174,6 +174,7 @@ struct scmi_info {
 };
 
 #define handle_to_scmi_info(h)	container_of(h, struct scmi_info, handle)
+#define handle_to_scmi_info_const(h)	container_of_const(h, struct scmi_info, handle)
 #define tx_minfo_to_scmi_info(h) container_of(h, struct scmi_info, tx_minfo)
 #define bus_nb_to_scmi_info(nb)	container_of(nb, struct scmi_info, bus_nb)
 #define req_nb_to_scmi_info(nb)	container_of(nb, struct scmi_info, dev_req_nb)
@@ -450,7 +451,7 @@ void scmi_notification_instance_data_set(struct scmi_handle *handle,
 
 void *scmi_notification_instance_data_get(const struct scmi_handle *handle)
 {
-	struct scmi_info *info = handle_to_scmi_info(handle);
+	const struct scmi_info *info = handle_to_scmi_info_const(handle);
 
 	/* Ensure protocols_private_data has been updated */
 	smp_rmb();
@@ -866,7 +867,7 @@ static void scmi_bad_message_trace(struct scmi_chan_info *cinfo, u32 msg_hdr,
 				   enum scmi_bad_msg err)
 {
 	char *tag;
-	struct scmi_info *info = handle_to_scmi_info(cinfo->handle);
+	const struct scmi_info *info = handle_to_scmi_info_const(cinfo->handle);
 
 	switch (MSG_XTRACT_TYPE(msg_hdr)) {
 	case MSG_TYPE_COMMAND:
@@ -1062,7 +1063,7 @@ static inline void scmi_xfer_command_release(struct scmi_info *info,
 	__scmi_xfer_put(&info->tx_minfo, xfer);
 }
 
-static inline void scmi_clear_channel(struct scmi_info *info,
+static inline void scmi_clear_channel(const struct scmi_info *info,
 				      struct scmi_chan_info *cinfo)
 {
 	if (!cinfo->is_p2a) {
@@ -1240,7 +1241,7 @@ static bool scmi_xfer_done_no_timeout(struct scmi_chan_info *cinfo,
 				      struct scmi_xfer *xfer, ktime_t stop,
 				      bool *ooo)
 {
-	struct scmi_info *info = handle_to_scmi_info(cinfo->handle);
+	const struct scmi_info *info = handle_to_scmi_info_const(cinfo->handle);
 
 	/*
 	 * Poll also on xfer->done so that polling can be forcibly terminated
@@ -3459,7 +3460,7 @@ static struct dentry *scmi_debugfs_init(void)
 int scmi_inflight_count(const struct scmi_handle *handle)
 {
 	if (IS_ENABLED(CONFIG_ARM_SCMI_DEBUG_COUNTERS)) {
-		struct scmi_info *info = handle_to_scmi_info(handle);
+		const struct scmi_info *info = handle_to_scmi_info_const(handle);
 
 		if (!info->dbg)
 			return 0;

-- 
2.51.0


