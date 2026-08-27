Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D23C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 18:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nYbKd+3GajDDr0jOEfWiaOSW2NcTlBpxJd3GfO91+J4=; b=nq/rlh0lYCvmajAGPsXaYzZhLP
	N2EWmCq8pkezPSfuzIOKv9UrQNy+X6pNmPVGK+GrsRMFcDmnSU4sWSbOM18qZ7a3WB7R9uAiLsWYQ
	C/p1NWBLbU4hB/LSoIqfniRFTV6PCMlOpK+PySF7ZKFbh8MisZBvFZtvFRKFq+VOkp9OjFABM8s3P
	JRnWO3VvMWqlsD6ksD1kjhfv6AxG4I9gMGo8XfejQt0pCj/PjThxr0UJrAMaDv1d8fu3J4VpPR9pu
	yXJpiXN/4UxsLOSRr3QnO1BtrxshfCcz7id8GuEF82tVVHDl5tnJFqv0D9qk3GdoQBw/QuAb+bxKZ
	xt0AjgBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeOW-00000004Xhf-0wXr;
	Thu, 27 Aug 2026 18:00:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeOQ-00000004XdE-2FxM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 18:00:03 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RHXbuD873636
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 18:00:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nYbKd+3GajDDr0jOEfWiaOSW2NcTlBpxJd3GfO91+J4=; b=I+Y80KM51q9Yk2+a
	j4H/8pee737PHnA3HwQtTl5QnWER3ePY9GPJX8rYztgUV4jZuiM1lGNdmJVKnETf
	SyXWlrQFiQETA7yFO8fsTd3V7kA+KBlc6wNhE1O27MWafeUT0WV/RB6AtPhJ8po/
	8q3I9byjRspDJKIwxpqYn0lgGppFENeSo0P3fMOH2AbYWXIhXcXomPuCgem01Uqd
	IvUcx02zBKzCLsJkkjh4fNNISTR23DxSvAVL1YGy+DzJUcRYQQnN7KcxHPXE0nC3
	bIo85WSQ6Ui9xKj8TEb2b02hiwIVsnwrD+Ppx0yJuSrnVupxG2yKGIsghD2/YEDH
	0HG4/w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4garn0gj8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 18:00:00 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-395543dc382so271258a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 11:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787853600; x=1788458400; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nYbKd+3GajDDr0jOEfWiaOSW2NcTlBpxJd3GfO91+J4=;
        b=VLDxudZmC4KqMt9U3+G8F62NCo0cvWx8fuXzphXHpf/mCD90M7yWLXaJcPtWTxgNMZ
         tLwVwa1aWhPWKe0WIhByBb2wQYZKWUMOCdWIm/Cq4yEo5yKhwGEfNrfeVQGJVuH2zhqD
         Ltz6WIoAO1u1GSp/eih6y+4jKorOSwLt4rdJ0LT+mE43Wa5+Zvj0i64z+s/mEA6kongU
         waHFp3MsSWawhW0zlS0wjYEanaZnu2qrlPRmgZ+4vVMigHgmS9TLHQpIuMD8G9tDQAiO
         pmEArSBemXMF+8T/m/cpKTwJiwgZxt2oPv5RspbbRJ8875DcPzKIilQKnXP7syqoOJ+v
         cajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853600; x=1788458400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nYbKd+3GajDDr0jOEfWiaOSW2NcTlBpxJd3GfO91+J4=;
        b=mIv4Z4jgEQfovtHYoO2YeN+TzOe8cwPpfGmZHDO5WoWb1EjWDO9G8xROppe3rk/nY2
         LirBXwrunDLvOaXFUAsU+RSYoAp24lnL4hQMmpwkC0rWmiNM5tsmkFJw9XkVj4Orux7W
         AuzhYDcF6Jr9+2tuWivHcj779H2gDzoLuO4f/RWoAkRWuBbpJIWeSJq1UzgDlJIZe5nz
         GIps7/1YvQLfBjmAz52qrupuOawdhUAFtORmyCqkJ2DWoIujJDNZjVLdWur8zlk9ik0s
         jTmSbyEGK82r5pFIJnLMuVq1TRtcuq2RpO4M7GiyJo/8q4OwZM7CXPtgOQXRvBRK0gKo
         ZEHw==
X-Forwarded-Encrypted: i=1; AHgh+RqW1ZgPry5bkM7jNJWvO/yavYqcWoj4EUgYbfQVNZ2PBn/wOiRNxBCO+JOO3rykWvCtUQxjgh9pa9LIv6k1WEMV@lists.infradead.org
X-Gm-Message-State: AFuF++ntyy/Ymfbdc1fkrRyOkeCT0+NrOvWGdJ1lsOZVWN+GmaDcUVkn
	Cm+JkCwFvtyJWIlow+UZHeN+/hV4TL01PV3mAb2RDUkCatvGg3tjwk2adBXO5mhMgrGSrx1eMVQ
	dau8+RXz8Z3f3tG9hggEMjBPhXHxO/bXZYgyJ98y/aXJj44hbQ+lIqKQKGKPhBsX+oUOORPyNU+
	skjQ==
X-Gm-Gg: AR+sD129kKJ1y7+TDs2sxraOxxiLcYjdY7yz69tcTff8nAkW+qqTynpwz3AlJWT4uHr
	7yxxTmhOvI4oJqJjm17xZo4ko+P21UFwMiup0OQcPR8w2sB71KxK7vLXmwIAoujKBUsTxqqjHsb
	rKs+iPhNp3VSrbFyrIzrw62UOPmKR8hISVZGn5f7NRxIzvJ1U5GWHIbRoc4x/3m0lxCFyUA1M3S
	hqSM/3u6Nkz633s9KS8HcPALy9flW6zIVIPa1x1D4iNLXF/lyXhxZQhT3gDBMXcXjmEAysHSYx1
	BTavMSXssqp5VcvM8bkXthIVkWqaO3XsfAoixcjo4vK+R7ppJclvnwhKDytGvwwjCjEm92+X1a+
	agPUesmrtebzFHjSj9n4BNmGcCD1avew7Rw==
X-Received: by 2002:a17:90b:1a8c:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-396d0c0ffb5mr1795751a91.0.1787853600039;
        Thu, 27 Aug 2026 11:00:00 -0700 (PDT)
X-Received: by 2002:a17:90b:1a8c:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-396d0c0ffb5mr1795630a91.0.1787853599347;
        Thu, 27 Aug 2026 10:59:59 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a905cf38sm27437523c88.12.2026.08.27.10.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:59:59 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 23:29:21 +0530
Subject: [PATCH v2 4/9] soc: qcom: geni-se: Remove OPP rate reset from
 resource deactivation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-4-091697dbeb02@oss.qualcomm.com>
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
In-Reply-To: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787853566; l=1510;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=uYtf63EywauTBDLjs8uD8MJtcy5tP9+vyAB+Hmv6QH8=;
 b=yuYXtqOch5+JdddKssp+xdvmeKhNyCOF/ql/3aH+DBJ9+vZFPKVWOtB1ybZnNXz8rc2iiV8As
 /p7XPI4/WDQAeVMiG8xWSUmsqYQmJgFqpH9oY3Y4fem4xv9ACoLmXqJ
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfXxJVEUPekEywf
 ulPtk2QaZDa5BYLszeLJOv1tnW/w0lHIIv8t4sDroSOiBVkkxrQIJogEKGnosGjR0suAn0B9ayq
 qcBxNr+weY+bhL79nO2hJ+YIXIRBmxCiXswbKgzKThvOf7Czn6Eq21ORrLni4Kz20SnAeEme2QL
 gd76nR2U27qLKERDsi7wYJNBJacstDJVv5jlybrZdJmRZl0D7emGo9JD5cmhrMbLjudxl0E5mb9
 juH/sgBohtu8wozXfe/pqy9qbTNvDEDXSZ3caX2uv4lNqZcunWapLMDaTFAqP19D4nfm+fy2V4/
 mZGpdRiMTUJJ8yVc6zRKW7wlXKT1saggzDylN4CMsctZ5+eWlwxjGjoAMQ4odXRuXBPvIaZPEze
 0RXmnpVIMTR7TF19b7wiEsSjng+PVZROgDgUUYfp2LyAowv5pMg7v/ljZZNZgtRaPhbI0pLtf/2
 f4G1LxZUbP5kjXDL5fg==
X-Proofpoint-GUID: f_ubVPtOhh1qdJR3X2ula-K21qw0xB9V
X-Authority-Analysis: v=2.4 cv=C+3ZDwP+ c=1 sm=1 tr=0 ts=6a907b21 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=dehDsB7WAhqrwfXEkZwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: f_ubVPtOhh1qdJR3X2ula-K21qw0xB9V
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX0Dpm97Adeh9w
 KpbFEpe1jSSQ7g98grmBwpmowEv0kEFMkUUzuqvnnhpvNWBm+wlXi9K3VfWd83jKpyG/ZIfOuml
 Y5jUQJQl2VLT5xST0/94W82+Io0NSRo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_110002_722241_42ED07CA 
X-CRM114-Status: GOOD (  14.37  )
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

Remove the dev_pm_opp_set_rate(se->dev, 0) call from
geni_se_resources_deactivate().

OPP resource management should be controlled by the consumer driver.
Additionally, clocks are already disabled by geni_se_clks_off(), making
the OPP rate reset unnecessary during resource deactivation.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 04f58a6f26ff..d4f0544d73c4 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -1039,8 +1039,8 @@ EXPORT_SYMBOL_GPL(geni_icc_disable);
  * geni_se_resources_deactivate() - Deactivate GENI SE device resources
  * @se: Pointer to the geni_se structure
  *
- * Deactivates device resources for power saving: OPP rate to 0, pin control
- * to sleep state, turns off clocks, and disables interconnect. Skips ACPI devices.
+ * Deactivates device resources for power saving: pin control to sleep
+ * state, turns off clocks, and disables interconnect. Skips ACPI devices.
  *
  * Return: 0 on success, negative error code on failure
  */
@@ -1051,9 +1051,6 @@ int geni_se_resources_deactivate(struct geni_se *se)
 	if (has_acpi_companion(se->dev))
 		return 0;
 
-	if (se->has_opp)
-		dev_pm_opp_set_rate(se->dev, 0);
-
 	ret = pinctrl_pm_select_sleep_state(se->dev);
 	if (ret)
 		return ret;

-- 
2.34.1


