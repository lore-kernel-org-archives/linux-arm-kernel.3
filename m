Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9355FF364AD
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 18:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t2hSeCqy3196ZrPyXqAGFPnwN9LeRm2Fe9O2th3jhQA=; b=W9EkWPM1+xVyvbojXmQi7v0PRu
	7ilDwGAt8J23iVTxhh83bbL16s/ZmYFjC7oGJMbVa7X7QalxIYfEXhaLVckvIgDuAp2F1Hu4m1M/F
	JRBkV9Yv5gfHwl+ik9i1mEhhlpsfGOlatMluoW9lb8fFDS2Bo+hcU5u/A2jUNyqqie3o0oq8Rgv7/
	rVGSCAIG4+PkYWVIBPFQZfc3UzYsIAEMh60S3Hj17TMCkzZDThQ9OWtqiHPuG2eBCmTbFTH3hu2K6
	eMPgYXqG6zPpQEXnIgDkGZGuOAaSUbf0rBco87ciJeLOEpsjAPDi2wXtohBPmWbfh+e9SxbA8sOXD
	QkqlEJ4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAtr3-0000000B42Q-1nsf;
	Thu, 09 Apr 2026 18:11:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAtr0-0000000B3zs-1HA5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 18:11:47 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639D1Sbr1972547
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Apr 2026 18:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t2hSeCqy3196ZrPyXqAGFPnwN9LeRm2Fe9O2th3jhQA=; b=PAgb7lkp52h2aYe7
	X/q/AUNoT8wFXcENwF2xkHMQdpolfuJRSn3wDifsClUkQSrrf/zlY8GzlBWXEd6C
	7SvU3SDb5KzHJPPb83l5BBzoh9n0peh9a6bL5IjpU4fo0SthbVvtKQfL1fehBYva
	H/M9mnm0jSNxjxaV9U4U15b/3mwzoOByXOQe1IbfZSX9KtNupF6qYNymkSzHBeA7
	+7bkSGm/7xnnft1jUn6clpeEMxdJu59BOhyMwUyFCJwNHe7VN4PZCWYUnxl0XOPq
	Quzs9LMgIs1X1jYeFD59B4dLMq31tO3oF7cMpX/ltWeGczFMSxw4O+gbQZFFr1q4
	lGHE7Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decms1691-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 18:11:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3594620fe97so3530801a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 11:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775758305; x=1776363105; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t2hSeCqy3196ZrPyXqAGFPnwN9LeRm2Fe9O2th3jhQA=;
        b=I/SFvS2Tx58Tf1oIdmueG4l+oFTZG0CN5JBhtnDLIOTHnwQd9IaNxLpEQSLnrA6sPj
         oWcT4M1sw5d63Kf7w6U9WgJNCIhKmsZt9IdqHKCEDF4w9YUzbnbomnWmtXOPNrCynn24
         s/MxnwtSIMlxpz6Tk3tno0mHJ91G16ffK8r5JrKmPLHtutPgSPy/1COn31Mdwj1oWUeN
         yLgZIHsX6QTe0aN/B+U6XAHUCOEBfgJ1j8Zjm7lUhqPd5LkE1+TY0MFjT1YyNTXug2X1
         32hOFHDm2VWvZWKSuodrycke/qcGZ1tT16NcCObJRnZRGYzmfDD25Jpxw5ulgTTt2ftT
         BIAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775758305; x=1776363105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t2hSeCqy3196ZrPyXqAGFPnwN9LeRm2Fe9O2th3jhQA=;
        b=YJcs4+dbH+Zt9XzS26UR8unmSB+EhRENGMORDVTvBuLXVJ+HFHO3yn4POnv+h0jMm/
         lrfy9Km0rEH8QFBcca5WlMDq/zg9Psrfl3jwQ4xdxuNeqdTMCDAJP36PlQc81dAQa5fq
         JQew7QPRh1k/B4ndmeslG2zioxCyzKqwyHmGUYeFcjpgu7Mld7k1/3ib78h9QlvloJiw
         UjoipJJStmbo7P9tfPTVobDeuZyx5c/cKx9Ftpwr3cLiDwW6XFBV5WdW5XbXxNNOiNcD
         hO6w+PBq+SX1eqWPv8XG0+QS/IGQY06VbLMibK3v3Rw6YSr0ICdj60dxE3xn8Hd4Y7e6
         l21w==
X-Forwarded-Encrypted: i=1; AJvYcCWH099YwCHJdSpwRVBe9rwiZGYiB5n7A0k0q8X8hRHb9DEt7WEwCjcScqF0HFDd7fT/o+wGn0w6z3FUEpof8rcn@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9R9is1X/azBLdK08hMm245mcpTYMYv861Oj5PBE9nk3i2up5z
	Rg+YnNCa5yTx8+DMjmKhUnKLwRc9d5PSIfrXBAUeh+ugCIF9YDltnhk4F2xKtnDXlXNEO0nIegA
	pMs4vdj5ZFomX30qpgEHUXcEq0Q2c/5AnRd3M6ZsnKTAB2eKQCQWpnQFzA4IB1U9zoCqMsFT+Xs
	yRtg==
X-Gm-Gg: AeBDiesXqlIz5cejjt7IJUPiq6NgfO88MhbBwm3atj1IyJ0YnrnMEAPk69LPtfME2Yx
	2RUSSVzTnWPpdSvGiXZnU6zvVclfS5t5xaBo3U8Mn0y8/x0dWFRwcBteXGe/iZ4AZhN2yaEE9TJ
	fDYPF1kLwMPj/d6tGl0vDkvmRqtMTOwQA9b2mEuS90LeCvGYmp2lL1zf2ReV91G6Vu9b/g5ejk6
	J/v5sdSXYnbs0yZ6WzH0tyf6Wh6ZuikfVU+BwG+A1ieO3ZeMfxKGpLmLkjTYfy6b5d6twd74EXD
	H5zfzjb7ylcYXmTvW3/rAwzmTBPE46U3LWk4K9eDfxlNcK7Y99ZtmdFmqGvhZ1vRLKTrig27s0q
	qD/TIF85cOCAJwXk3us8AEQXUhzo2C4MuLk9NS27Fywu8Rw==
X-Received: by 2002:a05:6a21:32a4:b0:39c:4e62:b838 with SMTP id adf61e73a8af0-39f2edf5056mr31142022637.17.1775758304833;
        Thu, 09 Apr 2026 11:11:44 -0700 (PDT)
X-Received: by 2002:a05:6a21:32a4:b0:39c:4e62:b838 with SMTP id adf61e73a8af0-39f2edf5056mr31141967637.17.1775758304218;
        Thu, 09 Apr 2026 11:11:44 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7921a2d9ebsm66132a12.30.2026.04.09.11.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 11:11:43 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 23:40:48 +0530
Subject: [PATCH v2 7/8] arm64: defconfig: Enable clock controllers on
 Qualcomm Eliza SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-eliza_mm_cc_v2-v2-7-bc0c6dd77bc5@oss.qualcomm.com>
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
In-Reply-To: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: cORHHHjVjVmDQ7FRRMk72f3dt1xGRsug
X-Proofpoint-GUID: cORHHHjVjVmDQ7FRRMk72f3dt1xGRsug
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE2NyBTYWx0ZWRfX5l8Q0aih6DrI
 8hAuzRMb5AdqZtgMk0P+X80u31um4Ky4evYD/J21WlFbMSSUhyO+8+FMeSEvRfql6dlINAYR8jT
 L9mnq9EF0Mu4tvA9idjcfcY4VwNKDP6kPMm1ZmepcPZvj6J701XdG5NLvogVKTqXXCAO8iM+FtT
 8b1Xwewo1WvqZ4IMdOnbKzSgRkgiL9v+W+E4xRcoFlNRxw96iTM9W6lf5XjpI6w93MyZz/dapb3
 eeSyKv57exJpHYX8sJOrBE8ADpKRQBnd2KX7Owghwg1iz+qEo1pZsZEQrEsgfyKfPAGAnNCSkce
 wTyIBQREMAu5E4uVBn3glmVNnu8fmLpichiqRudgqQjxiUfd243U/DZZc7Kj6t9XLQ6dq3qLVwE
 Hui30sK0A3/4+cN2hhNVNzSVhb37uoAdF+H9AizRV4Gr9xX1PKmnUlkir+49YwaZmqgYQokadSI
 wqQyUw1evBQHJwd+NHg==
X-Authority-Analysis: v=2.4 cv=N/sZ0W9B c=1 sm=1 tr=0 ts=69d7ebe1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=2e1B0ptGhY38lJQULHwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_111146_400447_79BE76F4 
X-CRM114-Status: GOOD (  11.34  )
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

Enable the video, camera and gpu clock controllers for their respective
functionalities on the Qualcomm Eliza MTP board.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dd1ac01ee29bf631d517c38486f6896ffd82dcc9..130e8716e67d69c54cde3f66db09b352f736feaf 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1475,9 +1475,12 @@ CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
 CONFIG_COMMON_CLK_MT8192_VDECSYS=y
 CONFIG_COMMON_CLK_MT8192_VENCSYS=y
 CONFIG_COMMON_CLK_QCOM=y
+CONFIG_CLK_ELIZA_CAMCC=m
 CONFIG_CLK_ELIZA_DISPCC=m
 CONFIG_CLK_ELIZA_GCC=y
+CONFIG_CLK_ELIZA_GPUCC=m
 CONFIG_CLK_ELIZA_TCSRCC=m
+CONFIG_CLK_ELIZA_VIDEOCC=m
 CONFIG_CLK_GLYMUR_DISPCC=m
 CONFIG_CLK_GLYMUR_GCC=y
 CONFIG_CLK_GLYMUR_TCSRCC=m

-- 
2.34.1


