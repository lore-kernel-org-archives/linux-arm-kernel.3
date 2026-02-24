Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 795DEE9B250
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 10:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ne7yOu90dPGQgrUhRBv6heI97JqK1q/WEP2CV9u0asA=; b=1pONzreDlVcseEEOE47UmakTCr
	iTkCtOVBjORFYLySqQIZb8wACw4CAkyNKk0wxhHCajHMFv8Jed1GwWZSc6A3mm1+rcFg+B2dayYje
	qWKGC4fT18+MSHtHCEfIF9B5RbpDbdeLpqjyjLd6frYQAvL3PV8923FlzAAUCo2K2oVdn7yS+xZrq
	r2+z1bZZC230iG824ByFKO3wkw3EnPbxOamzeNFSRba7cYOeaEYorb+BPgSD/0JyvWOql7b1l/2Jj
	lTJM++wT5A0cW+yDKxU0H+bp9AmRppTKYppsZ+BA4sD7xW2YtRIyMXWopDVslzdmOBAB2k1AD1oe/
	tPqVYYjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuptW-00000001sMu-22y2;
	Tue, 24 Feb 2026 10:43:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuptT-00000001sKZ-2Xzy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 10:43:56 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OAFXqp3324796
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 10:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ne7yOu90dPGQgrUhRBv6heI97JqK1q/WEP2CV9u0asA=; b=TfQuzWYs6V+a7MZr
	M7JONU3S/pDgfd/PtBI3vHsOjR2pnj6TRjYGhinFdHTNnQ1As5UKVFMMq/2aCnnG
	NAsCci4nAQWnqM6uKy1CHPYr/ernPrwYcWBL/Xk/LVqQymzHAuAGdO8zhFyRioTV
	v9rxC1d9vilxIyswyr0jl9S/EIdalqYqCpekjtQ8jCRstzupMTlrbfqmQMVYfTVc
	xtcLj/ybHn4C11BtZrfq40vrCn26AOQsUbnOKTEv4k4M8peo+H97OiNIIbmPh+bE
	4+hgJFEEG2eh7ujyCXfNl4E/1MyT/0LnogYRMQaSEXcRlUfOl+DEyhhYOYXOTgoq
	8Th3sg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8y3wc6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 10:43:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb403842b6so5249248685a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 02:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771929834; x=1772534634; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ne7yOu90dPGQgrUhRBv6heI97JqK1q/WEP2CV9u0asA=;
        b=j9JC6NElXMRZGmsO/21qOW1roJiRXNHK4zZA/4lI5+Z9bkSchm5qh0Q07WVqYY8b90
         dUMb8TpmzxGFo4qnfyGhoJarOQCWzeHbLXytlHIgU5sXOfgWPNMjgCi4905Yxkw/SxOO
         MRWRYesesZxuNpeCqzD2geME8Jlei6anQcWhXZ+8Fcn4Hw+Uw+i8J/+8xW9Y8Q7hsWLH
         9MzAGZjI6nyj3vl9Sy9AziaWFeLG08PUP1W/We/xCP+PZDVSbotCNI3QLqDDoyKIlSfR
         xKtX0UqFtWlizeYKCs+y63OjHZ9Jjt1+957ebdSjKbxYDl6UyS53kkxE4ggddtlO9TMy
         IOTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771929834; x=1772534634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ne7yOu90dPGQgrUhRBv6heI97JqK1q/WEP2CV9u0asA=;
        b=nMmadGre4gvrp+nAFWxgJymVTFmZaBpP9qHD4BnY/YJhFLChjkJRgW5nIWQ91sFQzr
         G0t2qSJBFhXdw6pSOYtFZSjYFVRwZpu0wpZJVeQCr7v3Gj87kQZDKnfUzIRbcs5Tr3qn
         OqnFIfrrgW2sVYsEMH4UoZmLbTtuauAArk5wp1c9vAhmS6OqFWtSPTFwp++UxlLlt2/0
         0mEAbo3vZ2UDZD9oPATKi9GkSAIH19F3YN6+bUiwIKtZo2AZ4TUPdSqtGR6kEppMYSg+
         cWMiR8U0YiGMIRNubUya4jtFPQ2SnyG9L0otwcuaJUwhsrkCjPpeQyQ+asxWshd4C6Df
         0dEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGD2rCYQmFKizjlPuvsHG47dKgDzhgVLVa8trnJlxDmrBjo/5Jfm3XNmkwYPfhwuIpnZUsmb+6Vh1m5cGzQlTE@lists.infradead.org
X-Gm-Message-State: AOJu0YzppzCpnMhhQkCs3jaMT2MSxfWW+gn/wfhyZdAzm20DpmwhJlJI
	4F+FSKwRy3b5wg6bYaP977X+RonWAeGvTOUNNps3mCPQTWnxsekz/G07pHTrjFyVlqcSpq7qotf
	3DfhieGYgWKJZ58d6m73JLKLFIG6Fgi/oEDiBbClgTR4UwIECyLd+6E+rId+LtuB73T2QSOtnOn
	cEBayhPzfLQQ==
X-Gm-Gg: AZuq6aIgC0w7swtoOHMXt5QBx+BSKOOZQqWlR+iZGPCNaI+c4AfX/ul8fdHPC3zSLJt
	c97iBp1NwXTykxhJqnLrJsuVK5dzs8fArXdPl26VpGDuncsDzHFxo3peXoD2M69CxrAYtGeDODu
	x+K/K9Wez7k5HuAyZnGDDI7eNHnw1spHUMyNjHOfUWpjTLxOY7399IN+qzEOaQX6pH44luqwrne
	dHHU1I+r7ro+Sw9OKSxWdAtvJKgo7PS4ZJcGxge/gkZyyuaqTqmoYPJ8MVNRNMQ1LhhPdyoVTFh
	l3gcqT9YV8jtzYsrPWjm+E1+MHe4klc+/2Jb8K2c6JFtLIzU94L7xu6eu3O/mI6u0U7NeLie3sJ
	Z0EMM4Lhpncn4fc9bA/reO0JWdqa51jgJ2F13l4f6Wh6GLg==
X-Received: by 2002:a05:620a:280c:b0:8c6:ff8f:58af with SMTP id af79cd13be357-8cb8ca674bcmr1328011985a.51.1771929833715;
        Tue, 24 Feb 2026 02:43:53 -0800 (PST)
X-Received: by 2002:a05:620a:280c:b0:8c6:ff8f:58af with SMTP id af79cd13be357-8cb8ca674bcmr1328009985a.51.1771929833267;
        Tue, 24 Feb 2026 02:43:53 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d40004sm25685906f8f.21.2026.02.24.02.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 02:43:52 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 11:43:42 +0100
Subject: [PATCH 4/4] firmware: arm_scmi: Use container_of_const() on
 scmi_protocol_instance
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-handle-not-const-v1-4-90bf93b53e27@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4567;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7h/Lj1fVzQNHqbpgOXMHGQLnYHp9vdXyxXswRQGiGq0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnYDf4rZiAuG6azRnIxmXqPEv0a1/T70K4tGK4
 QP9Dmw1vw6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZ2A3wAKCRDBN2bmhouD
 1wDdD/43Tz0/D5jgcP/JaZaTJn5X30WjBrCxt9pL9IIr2CExuUF8RvV3UVEFqSDruYaLY5xV+nj
 AE4rp6GAxvDCXBdFG4xpPkgnVW3BpbCf3z/GvNJ0QrxSQlpG8j5/nEYjECCevxyMMafQYWSNTD7
 0UobXEhsOcJDpZJCaslgR+Fz9zAS2M4fYw0MNvt/NKMYEeqfzFz+LOHDm+gD7s+N33ztv6ehEgt
 FfxiM53R83gSRbQm3C4MDYA5kwh8yZC2pMmW6Ggf3qjL4NBrJqx8mjnODFE9PQK6kiSj3NQnfq8
 cPBpVYf6zckkoB3wVbdMpHKT2zWoiYxT7w/3p0MF83zkInjpv/E5PwcJBCRLrhA5GBDY+uoIjha
 j1upzMWegB56pqV2WFHpyXrEGTpKmC56ew0/SjFviE6pf52HCBiZFVihc4inyUt3bGxzRXFhfuB
 QZe2pAMXJ28FUEaFKuc+AgVrxnAsJg9N8OCRojP33zU1dGlRx5tm8Hrfwz9ACSNrLjp2C/uVKCK
 MJafuDcbvHS07QMdPslmOIkDT7MseZvDpXBY4IXZiBxq+5/LX5d98P6sEhPFWvEzkV+wXY6TqM4
 ZUtlBHJOmsCqD2wo2Uk2jjJlTPFWdpdg4LLgbCzjBCxLMUlLcieW35Tn5PI7+emQKJ9h23X2c8G
 izF8oAxXnVfQFjA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA4NyBTYWx0ZWRfXyhAVI3RiAq+z
 DseI7zZIziqivpAbTkraIT2veoGnd2XWGVzQYHUmNMNoQYHKIsIEdjdTKB8Q6trUQNRxQ3jJCEo
 8vD3szCV8/CL+zUY5a6S3nzctWxKx1XioRN58csuh2dgsa+zR0vTrjxVwueW66ftWPqMMW3L4Ek
 6SQPrOZYzY1R+BQROoT/ATX7eBqgfwtXee2GuSpbFhXERLumha0HQb90R3/6qF6vw84952un/E4
 rhp8Uqdk6nKcDLBtXdWuCSkJaW6h8pDBBKRiaK1epG0lXswcUuW7UThEQMivdar5NrjAl0wX+MJ
 M1TkNyD6ySVRkmfXs6znvudL6tHZHv9xxOgpnzpAKqHXiKk9FnsCqS3OE4yJsNHAb32fnpGt7fr
 Rma7BQuGvcYsXOmTLGpyvf4LWKFBPOp50nWuB5jITkK+xIFQQjjFDCM2dNGK2rGFYQ4Seqq2YXj
 0Wgit5FjLnpBn/GrxzQ==
X-Authority-Analysis: v=2.4 cv=edYwvrEH c=1 sm=1 tr=0 ts=699d80ea cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=BpvVLMS52MUaY0b39kYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: UOzeXlm4UnfrYSjijoQPytmcxl1yJorq
X-Proofpoint-ORIG-GUID: UOzeXlm4UnfrYSjijoQPytmcxl1yJorq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_024355_770857_F7F6543D 
X-CRM114-Status: GOOD (  17.55  )
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

Functions receiving pointer to const scmi_protocol_instance, and are not
modifying data in containing struct, can switch to safer
container_of_const() which does not drop the const while casting.  This
improves readability because makes the code more obvious.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/firmware/arm_scmi/driver.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index cc6cdb7017cf..933b90f42794 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -114,6 +114,7 @@ struct scmi_protocol_instance {
 };
 
 #define ph_to_pi(h)	container_of(h, struct scmi_protocol_instance, ph)
+#define ph_to_pi_const(h)	container_of_const(h, struct scmi_protocol_instance, ph)
 
 /**
  * struct scmi_info - Structure representing a SCMI instance
@@ -1231,7 +1232,7 @@ static void scmi_rx_callback(struct scmi_chan_info *cinfo, u32 msg_hdr,
 static void xfer_put(const struct scmi_protocol_handle *ph,
 		     struct scmi_xfer *xfer)
 {
-	const struct scmi_protocol_instance *pi = ph_to_pi(ph);
+	const struct scmi_protocol_instance *pi = ph_to_pi_const(ph);
 	struct scmi_info *info = handle_to_scmi_info(pi->handle);
 
 	__scmi_xfer_put(&info->tx_minfo, xfer);
@@ -1394,7 +1395,7 @@ static int do_xfer(const struct scmi_protocol_handle *ph,
 		   struct scmi_xfer *xfer)
 {
 	int ret;
-	const struct scmi_protocol_instance *pi = ph_to_pi(ph);
+	const struct scmi_protocol_instance *pi = ph_to_pi_const(ph);
 	struct scmi_info *info = handle_to_scmi_info(pi->handle);
 	struct device *dev = info->dev;
 	struct scmi_chan_info *cinfo;
@@ -1473,7 +1474,7 @@ static int do_xfer(const struct scmi_protocol_handle *ph,
 static void reset_rx_to_maxsz(const struct scmi_protocol_handle *ph,
 			      struct scmi_xfer *xfer)
 {
-	const struct scmi_protocol_instance *pi = ph_to_pi(ph);
+	const struct scmi_protocol_instance *pi = ph_to_pi_const(ph);
 	struct scmi_info *info = handle_to_scmi_info(pi->handle);
 
 	xfer->rx.len = info->desc->max_msg_size;
@@ -1556,7 +1557,7 @@ static int xfer_get_init(const struct scmi_protocol_handle *ph,
 {
 	int ret;
 	struct scmi_xfer *xfer;
-	const struct scmi_protocol_instance *pi = ph_to_pi(ph);
+	const struct scmi_protocol_instance *pi = ph_to_pi_const(ph);
 	struct scmi_info *info = handle_to_scmi_info(pi->handle);
 	struct scmi_xfers_info *minfo = &info->tx_minfo;
 	struct device *dev = info->dev;
@@ -1650,7 +1651,7 @@ static int scmi_set_protocol_priv(struct scmi_protocol_handle *ph,
  */
 static void *scmi_get_protocol_priv(const struct scmi_protocol_handle *ph)
 {
-	const struct scmi_protocol_instance *pi = ph_to_pi(ph);
+	const struct scmi_protocol_instance *pi = ph_to_pi_const(ph);
 
 	return pi->priv;
 }
@@ -1720,7 +1721,7 @@ static int scmi_common_extended_name_get(const struct scmi_protocol_handle *ph,
  */
 static int scmi_common_get_max_msg_size(const struct scmi_protocol_handle *ph)
 {
-	const struct scmi_protocol_instance *pi = ph_to_pi(ph);
+	const struct scmi_protocol_instance *pi = ph_to_pi_const(ph);
 	struct scmi_info *info = handle_to_scmi_info(pi->handle);
 
 	return info->desc->max_msg_size;
@@ -1914,7 +1915,7 @@ scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
 	struct scmi_fc_db_info *db = NULL;
 	struct scmi_msg_get_fc_info *info;
 	struct scmi_msg_resp_desc_fc *resp;
-	const struct scmi_protocol_instance *pi = ph_to_pi(ph);
+	const struct scmi_protocol_instance *pi = ph_to_pi_const(ph);
 
 	/* Check if the MSG_ID supports fastchannel */
 	ret = scmi_protocol_msg_check(ph, message_id, &attributes);
@@ -2067,7 +2068,7 @@ static const struct scmi_proto_helpers_ops helpers_ops = {
 struct scmi_revision_info *
 scmi_revision_area_get(const struct scmi_protocol_handle *ph)
 {
-	const struct scmi_protocol_instance *pi = ph_to_pi(ph);
+	const struct scmi_protocol_instance *pi = ph_to_pi_const(ph);
 
 	return pi->handle->version;
 }
@@ -2366,7 +2367,7 @@ void scmi_protocol_release(struct scmi_handle *handle, u8 protocol_id)
 void scmi_setup_protocol_implemented(const struct scmi_protocol_handle *ph,
 				     u8 *prot_imp)
 {
-	const struct scmi_protocol_instance *pi = ph_to_pi(ph);
+	const struct scmi_protocol_instance *pi = ph_to_pi_const(ph);
 	struct scmi_info *info = handle_to_scmi_info(pi->handle);
 
 	info->protocols_imp = prot_imp;

-- 
2.51.0


