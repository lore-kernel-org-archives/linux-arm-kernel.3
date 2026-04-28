Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E610FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 17:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dEMWb3CKiGmBJqcMxJUz+Micd4CN6K2YYETwoBGc6kg=; b=HtEuYkpECLNxHhHmElRUF/YyvE
	o9BcBLCuJeVoD1phalIbXjWXg2LJuIhpA+9kBwnSseW5XSXt6nE5lGHn0sNCMl4z7tEdQ5wwcDbgM
	tHcOwaV5+Lr6mYiE+Pzn8vHADyWNZ4oXR3nFJQgvjJP2LC+O9DoB+CJh80gmYkxhOKWg7TnBmUtz5
	bEp0SvXm+AWaAWpEdbtXP8bOsAruc6YniGgYMTLIrrcTHUFpdMyVMxo/IlrZXql/DwC3k1XSL/pLT
	w5dwECuH4mAnySe7p86Bl/XUJQhTafh73C41oloC7PaefxSr6m9Hhr7z6/F3p11UWM16Oz6DnKqsh
	AYx4JcYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHmIn-000000021ZI-2OJP;
	Tue, 28 Apr 2026 17:32:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHmIi-000000021XO-33EH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 17:32:49 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SGsw0h2983640
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 17:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dEMWb3CKiGmBJqcMxJUz+Micd4CN6K2YYETwoBGc6kg=; b=RW+wzwvAfP4l9Asj
	jGdz/TNLYxPDz3POML9mOfd3NOPug7kgVb5BMCFTV0fNSwc/qhCHYN+R1SVxuSlh
	rg7HkTSucqC533H/g/aA6RRiwmUkaHIthCqGWIlNCtIzXGyQQILIbx94uv9ln8CZ
	mMTwCa2ZoPBEK2VhXkBzGk8Rb58cf93RcWlSrVMJam+gxeLJhe5VahdYZwS145Qn
	KA1dhEmacXL7RQrGFB4WQVsdk6Ng2huWA6YPcE86R0OsAWvp7BYq/JpH9v/qkJ16
	Ms1/7qV0lIPlTCEu77jlCW/hP9/j+UPB+aB+ND6Eh2rf9SRgoPMkcdhogcOiiVJH
	plIylg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0u1r56m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 17:32:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d826ed6f9so1635061cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 10:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777397567; x=1778002367; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dEMWb3CKiGmBJqcMxJUz+Micd4CN6K2YYETwoBGc6kg=;
        b=YZ6rbHAMrHHOZylznMpaoK4wg070vFHuwozB5Inn0HhYh+q1mc2CYY7VXO84aZGeZR
         o8532aLO+lyveHlhaog5Xz84U+7EYRkNMTazdqgxTjcuLC6wrD7IKpq5u7hjviWCCEnl
         s4duVNGP5NvqURM0/Y0G55NK9U4BRVtAPuWE0Jo93eKjH1uTp+XmV/3TFXNiYJCqnA25
         9xy1EKvpuvDjEBIESQYsGG+WXMU05zLXeGH6lYbIRjE+zoQjEgim7XJLhLwFOkQMOWmz
         qCc03Qk7MxNsn4Dgbw6+Ke5no/8423bQLxJg8c5x59Hmvhb04q4chl2TXdjV4N/tstV8
         jNnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777397567; x=1778002367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dEMWb3CKiGmBJqcMxJUz+Micd4CN6K2YYETwoBGc6kg=;
        b=DUtXKFZDex/NwU/68gsj/CRENzRYN/PMlqGDFsL//DdCWRZY8cj7lIosGP/SiFoeVX
         gvRpYG0s8w+JoipAdIQxOXGvPJaUhQaOfVa5w0udpCSAtWHO7GIyZv3hEHR9HLOaIZAF
         V7HpH0bpjCwosMVZIItu3bhc2LPAHDkLiUaIaotU/O9KcYFF3JGDn8GlSgP8jopBw1eF
         T33WufNuvrDByUgKjmt3UyMPki+tXmCHZqijM6lAr8e95J7/wzIe9crJi+ppkycbrv0B
         tuU2N6LNncSzTVRmlb3rU+0OqD3y+HyzQiI98lV6xJAnGpU4v3LNysEfbNMtuCwtV8KG
         7b5g==
X-Forwarded-Encrypted: i=1; AFNElJ8EJi0/toxu3uuJc80V9cctn+zKp9bpIc1n8unUgO0j3ScUJsRkFyqPumPiOOuwanb89DBmQ70vuEnQSwQ3JfME@lists.infradead.org
X-Gm-Message-State: AOJu0YwH13dhd2h+E9E9zNdmCuuHXCGBRfoGBoplpxvSVQ7SbUValWLj
	cnmKxPpR4IP0VNg9j2z5CrgPGg4OURukkUFeI7PH8BwAsCcDVo4c63L2mMvVcqEvs2+aHGu46pP
	JQ2rroXMdHWrfJHelNmmypUQ9v7lfCp9QJbEIU570MDceL39gT45wfblUzjnRaDx3d0uafeepWv
	jTlA==
X-Gm-Gg: AeBDieuohsiqzOSLPy4x7HR6ZpK9BzHdz2wTLmz4abEYCHdSQRSzuVXS3rTY5gGpJSD
	SkmL0bmfse5jBrLFLGU95/Z8gDWBgVvq4F/gKX5rURBDIfPa5KEJhYm8lTol+MsFC/AXSC8BelZ
	ChwcRxXRHC4j82Refq6zNaCsRFFuDB3XC7T4PzXSPVuexpx2piL9ejc8v93WoZwJsmr94tKMT5H
	MKU5ZnjEQkel1QG0LwGrWwnWcoOv+Egqz6KsuFuq5Ul9RQjJXumfeljQ4+1oXXsqJcaULsreVfi
	V5OB1zzgIQqszrGUjYC5toK5/jYPphUEUppXx/U8qVFf+asrz4MmE2RAy4hqRj66/yloXgrTIiz
	o70raZ2J3vcnbWbgrI9fOlwtRKFAeV3lYdHoL2nJZyJM+pd54k21B/TA=
X-Received: by 2002:a05:622a:454:b0:50f:cba1:18c4 with SMTP id d75a77b69052e-5100da50fadmr52787631cf.26.1777397566929;
        Tue, 28 Apr 2026 10:32:46 -0700 (PDT)
X-Received: by 2002:a05:622a:454:b0:50f:cba1:18c4 with SMTP id d75a77b69052e-5100da50fadmr52786681cf.26.1777397566110;
        Tue, 28 Apr 2026 10:32:46 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b8ce444sm2089545e9.0.2026.04.28.10.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 10:32:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 19:32:37 +0200
Subject: [PATCH 1/3] interconnect: qcom: Fix indentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-interconnect-qcom-clean-arm64-v1-1-e6bc3f7832db@oss.qualcomm.com>
References: <20260428-interconnect-qcom-clean-arm64-v1-0-e6bc3f7832db@oss.qualcomm.com>
In-Reply-To: <20260428-interconnect-qcom-clean-arm64-v1-0-e6bc3f7832db@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1875;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=yQAWJBywT6pwqGJLKFwuedfSMNGXnwkl9Ism4JarDpQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp8O83Fu3GfCGKF7sJQ/ZUFjiWtzMYyEhj5ZLnx
 s5fkhc6OpCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafDvNwAKCRDBN2bmhouD
 1+CZD/wPHH6w2qnDNKJ3cBQTuiZ0KvF1tnVH9pGm6JRyFwmQUocpUUDXozSfHDJ16Q0UhryYLfk
 A5JafqUStvVzVHl1viKG6ZuOKZqRcOR5J1OIgeEKN4hGhlHFPeyJjubuaTJvm/mfeOSBN2OsE5I
 1B75cRhoxwF4EJGI5OiJ872G84a2NstxA6DhTEew8mECqTvRGWHruVcABQhKtHliYuTIA9rGuuo
 Gk3Y3GsmbrLf8Z6Vo343qUc1R0QGvv6VBZs0kDjmZPRYGvn9RsDpaS904TrCOU4Y+lQAI88OHeO
 4KbxDX8LeQaJtaTdwouk3dap8NdItPzjuMwBK1mcddXasD/7IP9HhRZNcdceus03uy9IoC6M6+l
 sgLoQRR5FPNzqzud/GWfx8NpwKepeA2BUiKoNPRtwXQmQA73u7hdHz1Z/M0ZuoyZ97f4eCDwLSb
 WrZmbFr1vqo8mKLZzz5h6vjuzwkEujZOZWhf0qEN3d/ZgqIopGiVK0Rvw2jpMrigGyFMFgr2Nj0
 6uAaGXcRQ6fN1dYMQ14vVDddDBRjRkcjeOemM5e7X0L5TBYbLINcVgCfwiIzyLDADFr+Rh9XkIa
 J+iq2ejazlnlwTJ448iio0Wf84ZIOPsgWhPbtSN+xoq1KjUN8+CpB6kEm1HdcLOCCVG8eXbX/Vx
 fJ2Xv0ui4TNPodA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: pux-bOHtBv4rkxKT8EBPeD9bccUyMQ6v
X-Proofpoint-ORIG-GUID: pux-bOHtBv4rkxKT8EBPeD9bccUyMQ6v
X-Authority-Analysis: v=2.4 cv=aPPAb79m c=1 sm=1 tr=0 ts=69f0ef40 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=UCTw9GvNnafMAvUb21oA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE2OSBTYWx0ZWRfXxAFpLDeXlG6c
 1vsqYcDeHCxcr4ooHC6QrWKeeppcBHutDFcZYqTvPX9dxrKkKwH8E5qa13Pw6xl/bNeLx1FcApW
 AUkwYSyMHXpN/E7rMRjOxj4oVz7BAkXt/WlcQa2//p6O8l3oBw/7zZZeS/85qwQznFCf+/WuAe2
 pnjwd1nlqc0ctsslOD1m3ZlpP/nPaQqEtymV4ndlVifZlQWzP1N+/Tk9Tiqp+e7mMvfF3+1B9hz
 Vc1hMsrJnpS1/cr8gTrCKtYbYaA8fuUJMzEWDDlw2gWUqhNXyUOMo7cLFK147ifpK/etuhKKZvz
 SoqU1tKaaMop/QEnY5maT+mf9s333zDK6wtVeg0ZEOAyGv25aKxrP/gN2A7SR8TJI6MffHmtd1H
 +0X3FDDyLTFkRXfYgHWG9N5Z7/vpyEvWdzISTr7WNcLWvcmQg1iidaXzKHg673+3iJbTMV8iWNb
 p0vEOyah7064xu1GpZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_103248_798385_88AC508E 
X-CRM114-Status: GOOD (  13.05  )
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

KConfig entries should be indented starting with one tab, so replace
spaces with it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/interconnect/qcom/Kconfig | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/interconnect/qcom/Kconfig b/drivers/interconnect/qcom/Kconfig
index 786b4eda44b4..871663bfd094 100644
--- a/drivers/interconnect/qcom/Kconfig
+++ b/drivers/interconnect/qcom/Kconfig
@@ -9,22 +9,22 @@ config INTERCONNECT_QCOM_BCM_VOTER
 	tristate
 
 config INTERCONNECT_QCOM_ELIZA
-       tristate "Qualcomm Eliza interconnect driver"
-       depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
-       select INTERCONNECT_QCOM_RPMH
-       select INTERCONNECT_QCOM_BCM_VOTER
-       help
-         This is a driver for the Qualcomm Network-on-Chip on Eliza-based
-         platforms.
+	tristate "Qualcomm Eliza interconnect driver"
+	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	select INTERCONNECT_QCOM_RPMH
+	select INTERCONNECT_QCOM_BCM_VOTER
+	help
+	  This is a driver for the Qualcomm Network-on-Chip on Eliza-based
+	  platforms.
 
 config INTERCONNECT_QCOM_GLYMUR
-       tristate "Qualcomm Glymur interconnect driver"
-       depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
-       select INTERCONNECT_QCOM_RPMH
-       select INTERCONNECT_QCOM_BCM_VOTER
-       help
-         This is a driver for the Qualcomm Network-on-Chip on glymur-based
-         platforms.
+	tristate "Qualcomm Glymur interconnect driver"
+	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	select INTERCONNECT_QCOM_RPMH
+	select INTERCONNECT_QCOM_BCM_VOTER
+	help
+	  This is a driver for the Qualcomm Network-on-Chip on glymur-based
+	  platforms.
 
 config INTERCONNECT_QCOM_KAANAPALI
 	tristate "Qualcomm Kaanapali interconnect driver"

-- 
2.51.0


