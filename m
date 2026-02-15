Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ACDBEF5873
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Feb 2026 11:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ld1npyEylhh9T/ZrLUK2KA2uppN+ES3kJsT5nxT2auI=; b=FUkrAPyon6adblwqIyRXjS6Yn0
	I3Ds4/7yYaUrorpoG0spYoyR9II04oYHFm09aDWauGZZF3ehyOenU6TDNvfNB0drdc8TRp+hHHs44
	AXxz42beVGCHaF14Pd3lghvGpUPyrdUsYSvoYUSB5btcITXabf+0rav8pIENbyRwTqirOLjRTKNIv
	1PKUHfYwTAvxe2ZHp61DWmVLIIlYNhcRj0th770ZRAcmCD8gIt41cKHB80YNcuXkxVNtfw/HBT+W+
	6DEYUOUYPknxDje+qbzkP1IUDccsjXyf0lWMtUZY8fOQEKcanu7EQybbo2ZF01OKmgOf8+9cH3KL2
	wgON5vFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrZxV-00000005LvG-3ILQ;
	Sun, 15 Feb 2026 11:06:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrZxS-00000005Luv-3kGk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Feb 2026 11:06:36 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61F9flOP1967331
	for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Feb 2026 11:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ld1npyEylhh9T/ZrLUK2KA2uppN+ES3kJsT
	5nxT2auI=; b=S+XsWXtNwq8KK4YXODBXvTA5hKPUNWG6nwUU3T0pjsMNAQTH6dY
	ZdE1pl9ceKZYKmugtQawlKT4wI47oTgXiCmEIVReXm25gGSkeSWJwQI6BDd4u/MR
	xRnjxlpzRs84j+TDjfamMoT+Sas4lQQc+wRqSe6WQShjzQkNZ8mEg+6EFgq8rt+c
	22JmorGW4Q4cKLYb7KJiYQCXkel9P5Sa1Iav3dcQBvFT2Ln7nXoDNZXRG8H1MZ/B
	Jv2vyaAJP3zbk2gUfurCOaYoZGMxqmwOCuBgZpy9qkhMHG31CZf8MwUg4hs8/18Z
	5kAd2RJk0MEn8qQvB+bTkguUmgYWNIAwkWg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4caj7ja2ty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Feb 2026 11:06:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5061d1ef1f3so143356321cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Feb 2026 03:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771153592; x=1771758392; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ld1npyEylhh9T/ZrLUK2KA2uppN+ES3kJsT5nxT2auI=;
        b=f/Y8rJMXQMmEnGkrfiPidtaRJvxIyuBrVa0xGoPMrgaLOj03KvJDxNfpSff4D2KZnk
         YsWblz8rw4jJYw4w2Z1oqhbiHcS9QLPwSTl2sJ41wjltGRWo4ebOj0HzaTa6/2++fute
         j+QUVk/XSMMxMtap6Ke/+ywJM5t/1w+J8QEoFkRg0ExQCsPaftecGZofGz39RO44lFdK
         b3uUDgHXd+Iu6RcRhrj3kMEfRUs3TEgTr/jggMG3sGYBJl2fhctl10NJ0CdVqcK6OY7r
         Im+XednGGgiOKpQpQlNNnzE6d4ekIJmjdk/Bqqtzn/QAhQcb1D6AET28MFqMENLPzrbu
         A7Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771153592; x=1771758392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ld1npyEylhh9T/ZrLUK2KA2uppN+ES3kJsT5nxT2auI=;
        b=Qn8URFWzGY0GVk5SZxwXnh7zXUdYHoMR76fNtneTQDximyS4ArF0wDEP4RWDsGoDQb
         9Bc7GxLfr8MmDsWDOkptod5bqs01qDxhbjM+IP0PDe3FdQrSTOyc7BxxveJvrZQO8BlW
         Xg7ylgSzMD0naSWZ651sd3dV/MLLL3nQ9A14tPht1y8HnfitiL1PiJaju/TKu/E1qlOP
         p2TXfGFVsADmQ6OzDw/5Gwy0JLncyWzn29kcTP68Rb4Vrj7SP1vrGGHd8IxXFb+uEkXV
         cHmf4/+ziMF9q3mZQBHVrDhpseCcXWUEvEsBCezTs4B9vPCvp0et4pmgA0voWIoPoSnt
         pbGA==
X-Forwarded-Encrypted: i=1; AJvYcCWR5t4oyzXqRSsEU65S9bQuI0D2OsAVLJhYRBw9A6gA+7wk/CZZt0SzEqi3Zu4DhifP3ymSBizLGRWDY6U/ynB6@lists.infradead.org
X-Gm-Message-State: AOJu0YwvQTeP7bYZhGTEYYTpTniDllGP2q5i71m0P2btE1hfRiIXwf/O
	SelUEYE76SHxJwRSBycM9LrhbPc7CyCR55h52iz59ar/+/ybK7xbQQunU/XRRxS6rejwQ1U/kXE
	ViMeLB7RepgkH/DLcWbYVoojqY+I+dQ8/OZvQB0mcy6EoPcgsVa2u+h+l817Xj+xOWHobg0hmZI
	ZjHQ==
X-Gm-Gg: AZuq6aI/gOwTmONrXsDjw5Af2/Qgw9yfqZVs1IB2B1XOQiAvCrPFRfQ6oCpHMy+MN4H
	u6K8/it1iQsyY6ckiFeu1I1Smq7/M/sHon5Hv8NsLFnXwX43/1siwAXRjx22CPpRmcziLGq46Yp
	ZRoTi0YsraAc1bavpSAsOEw/WPvD8d+DiOK4O4fMpfGG8RzCGby4WxuOLn5BqUD3wVnas1QpH7S
	1s9ZtXcLvhQcmSncDZnGfINf06BWNuGhSCdQAqWdXosWvxmFact/x0M+1CvdW7jlg/fszGN/voI
	PNNe0Dtow9+sCbCisP7eh90B/WuPOTIXFbsSCTaArdrmytnRMdA+SZwsc8JaSAaSUD2MoK60nwt
	4QTxc3a/xOi2pKAhJH93k/5RX4ouZfra6AeYZzA==
X-Received: by 2002:a05:620a:7081:b0:8b2:ec00:7840 with SMTP id af79cd13be357-8cb42268fb7mr859965285a.27.1771153592481;
        Sun, 15 Feb 2026 03:06:32 -0800 (PST)
X-Received: by 2002:a05:620a:7081:b0:8b2:ec00:7840 with SMTP id af79cd13be357-8cb42268fb7mr859962585a.27.1771153592073;
        Sun, 15 Feb 2026 03:06:32 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835dcfafcdsm546360325e9.9.2026.02.15.03.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 03:06:31 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Ard Biesheuvel <ardb@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-efi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] efi: stmm: Constify struct efivar_operations
Date: Sun, 15 Feb 2026 12:06:28 +0100
Message-ID: <20260215110628.34293-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2165; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=NP94FmMc49hVak9d84xroc99UMOfASUZ7FO4Vb9UwNE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpkai0cmoweuXzmNdkt3cUKsm8kSCLQVJPu23p+
 dCZSm7zbAmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZGotAAKCRDBN2bmhouD
 11qAD/wN+jA1lzX6+fvH+7NvijyyXmKjI69j+7amUOgM5sbk570RGatIFifeiMMYCzNsjRtka1N
 SK1h155UeEuyH4Bh28xMW0yl3B4RbpKRBgecF8bJOoauDz6gj89z70NAhEoCXnlMQzyliGE3BKi
 Ahxw8Ny/zGlGitabsYrEgLDKuVSld04+JP8Sog5HdJ35M1hsyWuZXSNr+jqW6HxZMPq5fhBdzXr
 5u07sXCHRdxtXIs+A6LZdb0qYJ3D3oSR874npKfRbML/aPlxh7DQXJPoWBoDL65GifRkJaHhZl2
 MjJDpmk/7UdZIzOdP56MOfqQlImW+obhbofUzlCs1cKDpZd8hVCB7LOBYj+bJw2dfZR5nGwgGuZ
 MKmrUgz9ADLHW7MgUaHtCdjIKKMF+PoQjoN1Zzo30F3SVWfda9kAEQK8GxotrYMrO4n6LI9kcAL
 Fwl8MNE2IFEYm5DVap6C+VDkyMhbmTb84uEMDJYMHqastkqmUxy05JsGSD217Kev8/4HnhENdLN
 HINqvMPYNNQTDLiPSGaaDq8A2zGrjc9XKAUK9kOHbF2DT8UZsu+SuYHn0DHl5L7anJl4Itr+pii
 caB1cZK16piHfC546QaES/WzkbiqD9u/sxAYzvAYEfsLIlrT6dpd6lKsaXed1zbkbjcXudDC5+I fgr4KP1y45xlKHg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dIurWeZb c=1 sm=1 tr=0 ts=6991a8b9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=NNID--eWxax2qouwXSIA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE1MDA4OSBTYWx0ZWRfX59Y5+3kUAZ9b
 eHPy0cd8a/XbZ4d7ZbjN9pCworPSpFuTMlaoca/zy1V25OJqoXc8qYyT9kC7UyJM4XGKRgmXmsI
 Os6AuyUUQD+NPfPk4UF+Y+pmVTLkfvth1HRrEFyJ6p+3/d5MM3DZfXwqMrDOwB9kD2KsVXZDiOq
 4ABbHJ8c1xamUS0Y7PXCRPcX9e1hONkOmNAMn0yfcMlB6707Km1LC2D6yFzh8w7iqZlr1IhH3yS
 5RGpJgfyG6gus+AAc/4d4HJSvlFzFYox+LvJQyoj4am6OUp8mSwbulhPR/dDGHSM1Bjj6dlOYFV
 I3TJ+DT0bgrxz4jc+OfOOCZgzQwTJeG5NRe89bQtVWgzkzeliAH399ZkV0IJToERS/0uxMuKk7J
 lz7SZS8BfSFgPCnuqYpXMat7cL7Asgog/QG8TyzQfj4838Xgdy+ujlT5jy/bqUgLY28eLitI4dq
 Zo8D2397/wxSnRbfWpg==
X-Proofpoint-GUID: XMbth2ZiP80eQaAJe-QAR4Btp25g3RWZ
X-Proofpoint-ORIG-GUID: XMbth2ZiP80eQaAJe-QAR4Btp25g3RWZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-15_04,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602150089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260215_030634_989435_C8207A92 
X-CRM114-Status: GOOD (  14.80  )
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

The 'struct efivar_operations' is not modified by the driver after
initialization, so it should follow typical practice of being static
const for increased code safety and readability.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/firmware/efi/stmm/tee_stmm_efi.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/efi/stmm/tee_stmm_efi.c b/drivers/firmware/efi/stmm/tee_stmm_efi.c
index 7b04dd649629..3bea2ef50ef3 100644
--- a/drivers/firmware/efi/stmm/tee_stmm_efi.c
+++ b/drivers/firmware/efi/stmm/tee_stmm_efi.c
@@ -14,7 +14,6 @@
 #include "mm_communication.h"
 
 static struct efivars tee_efivars;
-static struct efivar_operations tee_efivar_ops;
 
 static size_t max_buffer_size; /* comm + var + func + data */
 static size_t max_payload_size; /* func + data */
@@ -520,6 +519,15 @@ static void tee_stmm_restore_efivars_generic_ops(void)
 	efivars_generic_ops_register();
 }
 
+static const struct efivar_operations tee_efivar_ops = {
+	.get_variable			= tee_get_variable,
+	.get_next_variable		= tee_get_next_variable,
+	.set_variable			= tee_set_variable,
+	.set_variable_nonblocking	= tee_set_variable_nonblocking,
+	.query_variable_store		= efi_query_variable_store,
+	.query_variable_info		= tee_query_variable_info,
+};
+
 static int tee_stmm_efi_probe(struct tee_client_device *tee_dev)
 {
 	struct device *dev = &tee_dev->dev;
@@ -558,13 +566,6 @@ static int tee_stmm_efi_probe(struct tee_client_device *tee_dev)
 			  MM_VARIABLE_COMMUNICATE_SIZE +
 			  max_payload_size;
 
-	tee_efivar_ops.get_variable		= tee_get_variable;
-	tee_efivar_ops.get_next_variable	= tee_get_next_variable;
-	tee_efivar_ops.set_variable		= tee_set_variable;
-	tee_efivar_ops.set_variable_nonblocking	= tee_set_variable_nonblocking;
-	tee_efivar_ops.query_variable_store	= efi_query_variable_store;
-	tee_efivar_ops.query_variable_info	= tee_query_variable_info;
-
 	efivars_generic_ops_unregister();
 	pr_info("Using TEE-based EFI runtime variable services\n");
 	efivars_register(&tee_efivars, &tee_efivar_ops);
-- 
2.51.0


