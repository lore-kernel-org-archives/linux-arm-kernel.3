Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4AB0CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 07:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aA7JCiuVVRCy3V30ThlamZSn/80oafKR6lFslO98isQ=; b=EAxTZmnCYtLPzaz4H4ACa8Bc7V
	rQH4GtXdpQVhyx7xtYBqEjOZfYwl7ViJWD2yoZPUD3NVnwsek7f4ixOiDTUogXxdKSlJaXbwbny9c
	rkr3G1ITXvyvNUJvHDr1AizhVl6H3Eekg3eK+HLuKMyg8csM6sb5JHGF/YhiyQ38ivTZ+l0QwalmR
	3T7JBNxNIyvAXNdfs++h4wjj+A6CK1Ca/iP8B+4l4GaOjOPqaS+xg2KKza9LDrTCdtrM9CqWOtrRu
	B9G966qSRKrgHZgCLq8doSfHBqub9RiL1Nc4jpp266qh2m7IUq7OgyyO3QX+gZjPdsHzx/fAlIJgC
	PTO0CGYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ZZN-0000000FTPf-3AaJ;
	Tue, 14 Oct 2025 07:35:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ZZL-0000000FTPC-2t0j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 07:35:40 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E6aP3x003051
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 07:35:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=aA7JCiuVVRCy3V30ThlamZSn/80oafKR6lF
	slO98isQ=; b=YxJx0KAxO2DqDO8I0IKd7HJf3ZDdKG0xzvCT/lLqkhtagBriu9E
	qR42JQe0OQhY2Nke4Vpeh9pTtdbGcOAVVfNmtg+l2gTL5Q9iWQAoBlQFET1Wiere
	cY+l05G5XIiXa8S1mE4DhMJ9Lqhgir+iR2ftCKJUGRcUOJjKDRmL9mQaJ+qfRwEd
	6fILSLEHu+Cwag/8EcpfEgRIB06tWg7Bm6J9U9gWDisWxCXc3W4cn7sJz0ssCohl
	2JRGe6Jph4NnrktfzmOxvVOoxqVGEsRTdCHbT/QAGbbWy9MyEAUVGjnszAi7uIdv
	WkBaRAjf0QALrxwJ6CXxZJn89NMjzq1BobA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff0qj9d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 07:35:38 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-339ee7532b9so25147912a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 00:35:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760427337; x=1761032137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aA7JCiuVVRCy3V30ThlamZSn/80oafKR6lFslO98isQ=;
        b=V0izn3pviWvHKFsZRRHJelWEsMHO8JdIfIMNYiHvG2wvQ7iCoWtIknUG6oved6ROQY
         1JAAvpGnJiTXM31iqQF26PoJqbmWnNYVwNEYTJg9BYozB5mvwuqZrY3f15A3T24CtZf0
         tOi8dFh2Y9WqpFe5GPjsOfoNrs+00/aID0NncHfikWKbyK0Ygc5P+wDU0SwillHpIas4
         bt4ZIYsSZ/IRXqL4k3V1yzzjJfeB9BwQTOakGHPdk8Sq2VAs00CogxDWw1E6RLgdUu7S
         AFaif/AxcT897QPD3XYkrX5ryA5qduaJyaJH/waLY6foEKDE4/9doia9sJkRug0tkinH
         MAhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjcN6rgEjOq4E+VwP7Ib6WJWzVC7QJYQVnT3Zd120TX5bBfNqpYqgw+p4rd98pWk490EbisjUvejUUOy9Zr7M7@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8oo0hOhwDwv3MlXoemxWfBPvJlQwEUc3AkRqTEIsp/9ugbBsm
	C6kpH/K0UnWuAnvFIiAzteQSyRo9iA4dtjABO5bKn/cPWw8q0TSjY/IW38PAxmsZyvqFoSJ+jCu
	kb1bJfw+WXMidd56wyjM9rzvqciCuPYDmxK6vg6J4Sg6ZNrgtSBwJiUTpeFs6Ubk1xiB16kli7s
	965g==
X-Gm-Gg: ASbGnctBMXFSr0vRVc2igwHrZthHX8bXcNE/Rcmu+5xRn6sigN5zZyqTsSwZ4brn6Cd
	/lgtPU2gOWX4Hki3Mkq6XtWoO3CQo8nYDhdn40nk3sY+Q0kRAgz3RTmuVCRkwy7fohfE+i/+38D
	yTCQa7jYTTaprGulqv8eWtsY3G0nbm55sHfqyYGnjCxeA22gWSIeTr8pfZJZGdtXV6I0H4XALRU
	4nXxUh6/FEoJWeZjcZBnF8FY64M+uXWpXjekllrlYNYkI5lucu2+V7M8Eatsm8sX/nVodJuJ/Ln
	y8Su7v4WDYLI4/RwABqXhunyXyKUoaVhMGkqSqUREmtfpEpumO2dyu2W5/BQNLdDr/RUt2NGXal
	ANbEZ2icTa1ogzn1W6HE=
X-Received: by 2002:a17:903:2acc:b0:264:ee2:c40f with SMTP id d9443c01a7336-2902730237dmr320265085ad.52.1760427337280;
        Tue, 14 Oct 2025 00:35:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOxdIo88Y+BDPv1KzmWMec2XJ9wxExeRxOPDZ/MXxz4c5ZQPBmyG0bxZVL0yu6B0smPV2waQ==
X-Received: by 2002:a17:903:2acc:b0:264:ee2:c40f with SMTP id d9443c01a7336-2902730237dmr320264835ad.52.1760427336782;
        Tue, 14 Oct 2025 00:35:36 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f93b66sm156070585ad.124.2025.10.14.00.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 00:35:36 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
To: sudeep.holla@arm.com, cristian.marussi@arm.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, mike.tipton@oss.qualcomm.com,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Subject: [PATCH 1/1] firmware: arm_scmi: Increase MAX_OPPS to 64
Date: Tue, 14 Oct 2025 00:34:54 -0700
Message-Id: <20251014073454.461999-1-vivek.aknurwar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX13e4iBAlUEK2
 lis5SLr9s5eY9n6nt7LwTzszJc2+KCg584tCVh/yuYD+C0LvATzBOohhVHiapxPyYxNq2aIxs6r
 00wtepZBBjCQocuNGRb/SCceoaFs5ZeVkt9Y1ZVbILXKsW41pnmcO8NT6tHIdRMD2ZZqRtg9Xsf
 UnpDQQVFDRV9DrHnvlpOu9uy8uIlWu0i6nXVhz7xEVK93V+4FwWaw6+mzG9avpcDWRV00qCl7DW
 NOk1YXLtxGVQyhrt9RSOEiAc2qFmLb22Z0gNl72Ks3Jf12tL/39gxcxv5UtipFK254dRdHY8h6d
 EQzESWxnpmXpMVzmBx5H/I2Xfv0YTYKUd4hC897V7f1j7FCltuDLUd+HBkxZKapUT/sbpUmvJJT
 pH65C+ne1dLYaJqmqrF4EKG8bjdkTg==
X-Proofpoint-GUID: s1rLeiPneMKrxCrKHHxv5Ed1ervKZPV6
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68edfd4a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=5ooIImjpSQmp0NYUP-EA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: s1rLeiPneMKrxCrKHHxv5Ed1ervKZPV6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1011 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_003539_726277_A916781B 
X-CRM114-Status: GOOD (  14.54  )
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

Some upcoming SoCs define more than 32 operating performance points (OPPs),
exceeding the current SCMI protocol limit. Increase MAX_OPPS to 64
(next power of 2) to support these configurations.

Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 drivers/firmware/arm_scmi/perf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scmi/perf.c
index 683fd9b85c5c..2249ef7fe790 100644
--- a/drivers/firmware/arm_scmi/perf.c
+++ b/drivers/firmware/arm_scmi/perf.c
@@ -27,7 +27,7 @@
 /* Updated only after ALL the mandatory features for that version are merged */
 #define SCMI_PROTOCOL_SUPPORTED_VERSION		0x40000
 
-#define MAX_OPPS		32
+#define MAX_OPPS		64
 
 enum scmi_performance_protocol_cmd {
 	PERF_DOMAIN_ATTRIBUTES = 0x3,
-- 
2.34.1


