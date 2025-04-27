Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77181C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 07:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4wem6TS2dnw8Rf1VQyFeDN7FTK3VHMUt46iflIVr5/s=; b=FCt8nrNwPkAj150Hz+hcEByg0q
	MYczyaDVqMb9E6RKKbYR0P+xf8II3xlRL8ENzpt/DzMWax3uICSA8rgP9+a21xFEomwv6u5MUMcu6
	rgXdXPHgHz+wknu4AV/YAhZAkHxDWF3WLoxULl4KAbj7e57UHPYVEf8jIz8ZPnuqjjAOYO50ucD3W
	fqarCmRImMyNZMA8UvD/EYF3Id1niRvtHOKyWbcojfKBpuBnsDnIv86wG09WIfBg9L6qb1ELkJFzJ
	161dxdzffTjCexzM1aoMkqmgGBKxA6XNAxSh0JCNeV1FgWc8fMjroxfoghCC2LL7RwtLe926sRht7
	mU80pNIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8wCo-0000000353y-2l72;
	Sun, 27 Apr 2025 07:13:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8w2M-0000000342N-2BcM
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 27 Apr 2025 07:02:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4wem6TS2dnw8Rf1VQyFeDN7FTK3VHMUt46iflIVr5/s=; b=cbmHLcsCt2inKJbcdS6LQoYy7I
	Rv+5feYzUwbeQkJDrLlDHBZoD9OblbODbKK+rGPZv9yV/eFWGFXHI8R/cxq4qiBDHpVnDkfv5wdws
	n9rp+cbEtLCWhytj8MLY9hdGlR2sorQhsDKcII9ykPFTiUEONYKKp8VX4KevqBZ/zwVmKBSqj4Rm5
	cy8eAdgl6z0RPjlqeMkohOYlK54iKBPgHmTSupjK0QYe1GBxSvRfTe9Kpvo1/FPAGQRdmtQhKJ9ER
	DYVOjq9gPBCRA9w0pM62dRQP4XXcQ0wwXOPIZFOiP3FKY4LFmxl9ABa6b3X6rp8L1nDBfY20hJpEr
	gkEyMHUg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u8w2I-0000000CQ3o-2CC9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 07:02:49 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53QGM42a025717;
	Sun, 27 Apr 2025 07:02:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4wem6TS2dnw8Rf1VQyFeDN7FTK3VHMUt46iflIVr5/s=; b=CnwSN30ifJlcEw69
	CPQdY6Y8XR/0OoMe6sIZUGiGpkNzE4sxE7jx1a55p0wnzh9IT3BkJwTJeDw3lmLJ
	tXg6hvRf+qNqeFTnU1AkJwQRhoco6Kbn3OznPMdWzxK2gfD10koSt4pmPs6gG3MI
	mdo/rKfUL7RmSB313OWBTX6MuiK6TS/UOg88WNcoeo9dCFcQEWhENP+FKMULq/zz
	UrfFwHnAI/Tlu0NmLTZs1ef0hPSsAjxtOt+MMzTmxEmLt694XWyVbfi2dEPs6/LL
	gKex3gXpEDI3VsXGRA3qMSi0PZdq8DriaPEZ3MaTYuuLEhVGx8wSb3pCRGxXkACE
	fmpmww==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rsb33d2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Apr 2025 07:02:38 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53R72bke016376
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Apr 2025 07:02:37 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 27 Apr 2025 00:02:31 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Suresh
 Vankadara" <quic_svankada@quicinc.com>
Subject: [PATCH RFC/WIP v2 5/9] media: qcom: camss: Add sa8775p compatible
Date: Sun, 27 Apr 2025 12:31:31 +0530
Message-ID: <20250427070135.884623-6-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250427070135.884623-1-quic_vikramsa@quicinc.com>
References: <20250427070135.884623-1-quic_vikramsa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI3MDA1NSBTYWx0ZWRfX4pfu7jq1XntR 9babJ2uNaHq94qTb/f4NFLSn6ot1PewwaMz9lqXB2FTLP0krJm4FBE+LK6xMhGSsmYNTUB73bNW VZu1eRu0BnKq0n9j3E2e+DAtWd10NrSHJuIHXvHYf3nkO1wZMjxJyya9yBwdFVOWnJpFpu8dIpD
 vmMNhvDqzkhgqHIakXIYZXjwTdXwtqbfo5FE/0pQKze1rHtsEuB4/eNyeWRCKrP+bqJpKoqLzKY r76tk1Wolm56bdGDER9CoZwACMGxzLaaO6+lrOGhj8/342j+y/R+zO+yuTODU1+5xfnHS0tBO60 imfRx0yzgC2Mt7sMMH1ZzFVH0JYEvi6VdY2bSS0k8fs6emJXE7e00Vg2L015LXMmQ7yh3uSWICT
 XhG2mRIGfGSC7D7LqGoluj6uwNNaA7rHKjkaDZ3dfQwd4iuSi1Lf82UFpoGM6OrKdSLz3RGm
X-Proofpoint-GUID: HPGcqCENyk-yd_ffAUR2wU45naR4gMHv
X-Proofpoint-ORIG-GUID: HPGcqCENyk-yd_ffAUR2wU45naR4gMHv
X-Authority-Analysis: v=2.4 cv=I8ZlRMgg c=1 sm=1 tr=0 ts=680dd68e cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=gE60Ov1lhapgyOv8Ur0A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-27_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 spamscore=0
 mlxlogscore=980 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504270055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_080247_003339_06067258 
X-CRM114-Status: GOOD (  12.99  )
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

Add CAMSS_8775P enum, SA8775P compatible and sa8775p camss driver
private data, the private data just include some basic information
now, later changes will enumerate with csiphy, tpg, csid and vfe
resources.

Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 drivers/media/platform/qcom/camss/camss.c | 23 +++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 467f7ff4b042..9e0e1bf855bd 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2483,6 +2483,19 @@ static const struct resources_icc icc_res_sm8550[] = {
 	},
 };
 
+static const struct resources_icc icc_res_sa8775p[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 38400,
+		.icc_bw_tbl.peak = 76800,
+	},
+	{
+		.name = "hf_0",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	/* CSIPHY0 */
 	{
@@ -3753,6 +3766,15 @@ static const struct camss_resources msm8996_resources = {
 	.link_entities = camss_link_entities
 };
 
+
+static const struct camss_resources sa8775p_resources = {
+	.version = CAMSS_8775P,
+	.pd_name = "top",
+	.icc_res = icc_res_sa8775p,
+	.icc_path_num = ARRAY_SIZE(icc_res_sa8775p),
+	.link_entities = camss_link_entities
+};
+
 static const struct camss_resources sdm660_resources = {
 	.version = CAMSS_660,
 	.csiphy_res = csiphy_res_660,
@@ -3865,6 +3887,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
 	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
+	{ .compatible = "qcom,sa8775p-camss", .data = &sa8775p_resources },
 	{ .compatible = "qcom,sc7280-camss", .data = &sc7280_resources },
 	{ .compatible = "qcom,sc8280xp-camss", .data = &sc8280xp_resources },
 	{ .compatible = "qcom,sdm660-camss", .data = &sdm660_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 63c0afee154a..345479f6feba 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -86,6 +86,7 @@ enum camss_version {
 	CAMSS_8280XP,
 	CAMSS_845,
 	CAMSS_8550,
+	CAMSS_8775P,
 	CAMSS_X1E80100,
 };
 
-- 
2.25.1


