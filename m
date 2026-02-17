Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 047ABE8385F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 07:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=68dSNlIqSuNSwsdT3P/zsSiAKuuLihUwYctME7b8hno=; b=ZZtmjt8dJdnrMlQ2zaLWIrGA0D
	5Y0Kl0LWIOxi+A+C6wW1m/KkBNCkDMv4NNG/4h4uvBPzBpFWKoVVcc8SwbxFsqHLUn19GXIixMdsV
	ZoWUZsnxIcJJXZnm3uGveGy2oRjHayUDnPtVBUV0RhIGjJx9JF1X6jkVZNAtvP9D7mkif/00fnJLH
	wtjetJhfSGtW4rZvW9ZJBVreJDgTxcRKC/MVvrheTiOvIO2cVXwermWfUo6y2P0uFeYgPSyZLrcra
	VZHL5bE1pu01uUQ0PJsPhQJIaFKFv3VBAY0gwaowDzeJjo/rL2iI819xufbbXFAtW4aI0oQbOOOC5
	phXek1cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsFIM-00000007kNM-2sxE;
	Tue, 17 Feb 2026 07:14:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsFIJ-00000007kMB-11Ov
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 07:14:53 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H3RlxS2178782;
	Tue, 17 Feb 2026 07:14:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=68dSNlIqSuNSwsdT3P/zsSiAKuuLihUwYct
	ME7b8hno=; b=EGCRCNGk4kMvU715/FN7pPcw2v5MWessjAXgKiz8SJWGnYXzOxm
	db6Eftdfm7r4myPp568ACQfgZTBnB3lbCTP+X9Ms5SSE4v9eSc/RZkdkWZQkokmD
	/XDjwxFtZz6di4Nv1jHz22JZDQYTUvUZoo8ofX3Hg22iNAgGKZ10nz31GGV6csea
	vFGKfO/oq0fw9BblRDTgVZ2L9YlK80QQ3ylvBtxSOxrKHYpZMBh+YdhISdrieqxV
	zBZugSk3MtLxPh1CuVY4Yn7rpXDtezjCKZS402soOw2eJWwTdcYPN7C/xvSjdPHe
	QYaF1PWyQTmp4XlifQ4tVXB3VvfgVnjs9FA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbnv9kkrt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Feb 2026 07:14:32 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 61H7ETlh005748;
	Tue, 17 Feb 2026 07:14:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4caj4m5s77-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Feb 2026 07:14:29 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 61H7ES1a005740;
	Tue, 17 Feb 2026 07:14:28 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mkuntuma-hyd.qualcomm.com [10.213.97.145])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 61H7ESbA005738
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Feb 2026 07:14:28 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4582077)
	id 965795D5; Tue, 17 Feb 2026 12:44:27 +0530 (+0530)
From: Mani Chandana Ballary Kuntumalla <mkuntuma@qti.qualcomm.com>
To: dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
        swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
        sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
        alex.vinarskis@gmail.com
Cc: Mani Chandana Ballary Kuntumalla <mkuntuma@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com, dri-devel@lists.freedesktop.org,
        quic_riteshk@quicinc.com
Subject: [PATCH v3 0/2] Enable mdss1 Display Port for Qualcomm lemans-ride platform
Date: Tue, 17 Feb 2026 12:44:18 +0530
Message-Id: <20260217071420.2240380-1-mkuntuma@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: LY6NhJ9EQlMByd5kbJln890jx30DJgsb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA1OCBTYWx0ZWRfX9XjIwUxzhzK/
 Aw4uXGa0g5U6hfh88p9167ZYphZBzZow4dOSrT+S/wFkYKhIM2saV9Njlha043+62nlqS8TU+rn
 3xWtV4gTL9VtTxuMnRvJ/g4+h929ukn1ZRvJ9kyOg06G3OWFhE/C5DywZmBQ+a2GmodAR426LbR
 GBjD7k8p8mmDrtKU/3QRgin/5Zbi5m3ie5Ed/t0uv0IAIHThvxV31UKta7qWbFdwjKxk6izBh0A
 y0OB27Fa1E89chJMbhcx2JxX+XDgkPMJCprFs3ImpBmMmgmfgW5GxAXgSa9dquCdiLvzzVNF0Gd
 QrMWuw40/GYR1Lz9B5+QYqHraPJjLQ+0B4zpOrEfDJTAYuxfPOMG1jU3X23krsboCX5p0yL1mHF
 ffqtw4cQVn3BxeQBxbF6TVO0DdOgHZ2hBAuOSBSYJVv+IfYON1eTWtN4PS0GpoiapJbxZiCrLXe
 HOUDnrKi1AYDQjVYgAg==
X-Authority-Analysis: v=2.4 cv=b7K/I9Gx c=1 sm=1 tr=0 ts=69941558 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=e5mUnYsNAAAA:8
 a=EUspDBNiAAAA:8 a=0IT7fpZdUoEMrN4OoH4A:9 a=TjNXssC_j7lpFel5tvFf:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: LY6NhJ9EQlMByd5kbJln890jx30DJgsb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 phishscore=0 spamscore=0 clxscore=1011 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_231451_406462_56967774 
X-CRM114-Status: GOOD (  12.65  )
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

This series adds the DPTX0 and DPTX1 nodes, as a part of mdss1
on Qualcomm lemans SoC. It also enables Display Port on Qualcomm
lemans-ride platform.

---
This series is dependent on below series:
https://lore.kernel.org/all/20260128114853.2543416-1-quic_riteshk@quicinc.com/

Change in v3:
- Patchset v2 [1/3] got merged
  https://gitlab.freedesktop.org/lumag/msm/-/commit/1338e8ae4084
- Rebased on top of linux-next and picked the latest patch from the dependent series.
- Removed additional instance of opp table [Dmitry]
- Link to v2: https://lore.kernel.org/all/20251125105622.1755651-1-quic_mkuntuma@quicinc.com/

Change in v2:
- Added fixes tag for the DP driver patch [Dmitry]
- Included below patch in this series after addressing comments [Dmitry and Konrad]
  https://lore.kernel.org/all/20250925-lemans_dual-v1-1-9c371803198d@oss.qualcomm.com/
	- Removed the misleading comment: "same path used twice" [Konrad]
	- Removed unused label in 'display-controller' [Dmitry]
- Removed extra zeroes in dispcc1 node [Konrad]
- Enbaled dispcc1 by default in main dtsi file [Dmitry]
- Added EDP ref clock and updated dependency series.
- Link to v1: https://lore.kernel.org/all/20250926085956.2346179-1-quic_mkuntuma@quicinc.com/

---
Mani Chandana Ballary Kuntumalla (2):
  arm64: dts: qcom: lemans: add mdss1 display device nodes
  arm64: dts: qcom: lemans-ride: Enable mdss1 display Port

 .../boot/dts/qcom/lemans-ride-common.dtsi     |  80 +++++
 arch/arm64/boot/dts/qcom/lemans.dtsi          | 315 +++++++++++++++++-
 2 files changed, 393 insertions(+), 2 deletions(-)

-- 
2.34.1


