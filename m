Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90A8CD6E6D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 12:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q5uBWSpIKAMT49XBoIDUyB5FAbxKelakvTHVeHNdNyM=; b=xS4uZsoYtiNN37frkoJu9NC2E3
	HuQh9FlMd+LJ/taaClFhfrc3Y1yIqmOf7HcTh7i7JM0T4bhQedXUSwlNXQsIw1u8zBth81R9kYhyV
	qQua1wmBlg5bG49nnr7rlab/+e0t+oReMb3Fr9yZiDkv4dEFV1pxQl/yS50iLAThGCrJyvq4Yvj+8
	wbBJ4xXLspRCANys8q8+ikZkLZtsEHxHaboHvMiL4qgoYKLRDIyHWaPYyfZFFIiAHM/vpiKyKdks+
	xvL+1n9uH80WbKVAlb8KO0zAfxZHVSyCoFG82/BpvLf/RoJ8fNtsiC6Qg8XnUOmtg8nD2Vc3quHxb
	7pJDToOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV7Ea-0000000GiiY-3HHN;
	Thu, 04 Jun 2026 12:31:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV7EX-0000000GihA-3suK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 12:31:39 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654CCd8g3221159
	for <linux-arm-kernel@lists.infradead.org>; Thu, 4 Jun 2026 12:31:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q5uBWSpIKAMT49XBoIDUyB5FAbxKelakvTHVeHNdNyM=; b=IKKcfbiQd4EX/21Z
	A6rxQE9bFiAjZalDxu5w+ZGExnX8akdriSFl4molN+SrcgB++6I0Zz4D6csgi/sQ
	CkVNQzKtcspqMHIMbZ/1Ew+/EPoQHgjinFCqn/7pMn4rSYhCZnRQq9rB+syYX4Hn
	U8bahJGzatQZUYPRngyTONXjAYU/hdaPQwlJkXUdaL49+8OZ5OUWTawcJv1AzgiO
	wzfdrfbmomKfTVnyK+YMhzJ624xZi+WLOnryrOe3b/ytmmDLFIndfHD2AG6xJSma
	FpzkfAznOuLB+XGDmEH92xNcfq2iYNYcc+4yQqPVOd71y51JDa3IluqYyS57nmUv
	KFKbvg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek95u82dx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 12:31:37 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85a2c665easo937091a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 05:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780576297; x=1781181097; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q5uBWSpIKAMT49XBoIDUyB5FAbxKelakvTHVeHNdNyM=;
        b=PGLguZXuJF9L9C7CCkNXHwlHnLtxi5+oSkT0bXvTnXs5eAetZjSOAuvRDF5tN7vzQD
         tIiuLfVBzyrn3As2J6vZ9c7xvNyrxz5rBG3R3ShDtzhEAHWLhCrYKiWhtWqnwVW8BvWR
         F/PhD9RdfKikkD/GAYahPJPMV6pDYE0XDP/vLQNA/CYANR6prsZooBTR+UY7kImuVtkP
         CvrZKVowCMywe/TOHdv8/UPeUhyqErHsHD9402Wq+59E2Mbgut+IM+qF0RKsatiUZWJO
         aTeMQm1lWnrfFu/tceezmOndIlo57LzyQ4XxJP5DeIv/zExnmXewbc1J0sUfx8VEeYwF
         CGvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780576297; x=1781181097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q5uBWSpIKAMT49XBoIDUyB5FAbxKelakvTHVeHNdNyM=;
        b=VCCN2zc4shmw85oz0PgGaZBuLX+NvS+ZfWizYSSUlogkw9ZBy5VEQXqSkUqVavP9zV
         5j/iIFROaLlNsZ5IVLNOqx6kP9TruPDJkmZJUDcIdQ3sH1etUxY+2RdXrnViEJiiSb6B
         SIWrVujDBFMWwrqloXvFqibs+OkQE7IakIi99pVf0hJY+c3wKFDOgx37nEiBQMCOYQ0p
         8sxx9x0/l6XOill8z7sgPvpT/AbCVQalshySFzsWNQ7iXcCsGJu0tlhricGJJ6vpvs8S
         c7YYF0PSeOGkc7xtDIhOo8WpRm4MwkhrC3OO/km9CPyS/o6QUtXwTziCnMudLKgYvc4d
         X5WA==
X-Forwarded-Encrypted: i=1; AFNElJ+FMpQobQHGCiwA9Zo/nL+j63nljhtI0zDV8qXb4apUfs9V+Ets+jR2DcddeDj/CtfZYBAfueFfIzmyO7cFkpgS@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7aAwNfQYAbeBqYBR+QdZKbB9pnnqWuhWWLewrY1uP0v3jgYqa
	dBmU7zy83vosAWZHk9znQTgVlHEUnMuLDKyLEaokTdOgyObQHDnj71c52AbwxcVRrRjZf65/nY3
	IJCLhW2Z7af0MSi1fri6flhGwjzt+kcATVxryo7qpKBVSTYi7PNcY6+WQGUAAamlFzwepcmekQ3
	noOA==
X-Gm-Gg: Acq92OGf2N1S5bbETlYpyKteJ749nMfPgdkDSG6ESgagReMIunpkpM7fUcVreHYUob2
	k7dKkqC2oIcuMdsuHUK/Zv1Ig0LqKkYaBJGw0PL31bSSfZDfJIl5aj/0fsw7e+1Qat5L9TouE5H
	vPePBmNfqUG+nVrtIZZoL/BBx38sgE1XtDLfnzTtsQm8dV4mKzXqeqWBzbFgWQYYxJDxrvsj/Cg
	y1+Dbp0wypZ7FvuJqzcsMD9pAJlwraOXgAHHw20KL96+7G2rJwqhajD+MzV0RB1o+Leiwos00Kk
	2/TQXrs91kVcat3iqX42UpU7Ia3EQtv7Ja/ZXlW1LZwaL6xU2HQwgyCFkFDM5N8moZkPQR43AFm
	+68+ICyZ1I32k7SjU6MKPd32dCuRrwey5HnRRzgYid22pmKxXP95bpw9Kn+c=
X-Received: by 2002:aa7:8887:0:b0:82f:355a:857e with SMTP id d2e1a72fcca58-84284f19a34mr7916017b3a.47.1780576296730;
        Thu, 04 Jun 2026 05:31:36 -0700 (PDT)
X-Received: by 2002:aa7:8887:0:b0:82f:355a:857e with SMTP id d2e1a72fcca58-84284f19a34mr7915977b3a.47.1780576296198;
        Thu, 04 Jun 2026 05:31:36 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428325d9a3sm6015917b3a.34.2026.06.04.05.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 05:31:35 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 18:00:49 +0530
Subject: [PATCH v2 3/3] soc: qcom: ubwc: Add Shikra UBWC config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-shikra-display-v2-3-b3c1b2b67edc@oss.qualcomm.com>
References: <20260604-shikra-display-v2-0-b3c1b2b67edc@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-display-v2-0-b3c1b2b67edc@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780576263; l=1005;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=RszZ82isccZ6HTay6fmDewNiy8+hVMevI+lNe+sJbQQ=;
 b=b49w/HlsBNCONlirsUpO5rkEIu3aZiKg8UbSER51g6trjxtIHBA3pBF3VltP4RNl+n6X4WcDy
 tWxKEYVttzaCry/mB9JVehbo1q/1hFQVEJvE8KFVIUyofFNpmhHZ2ea
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=at2CzyZV c=1 sm=1 tr=0 ts=6a217029 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=vtxxaatxrD0BdpsZsnUA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDEyMiBTYWx0ZWRfX2TrJGeuBOZCa
 STqy5K37NLyNtQ07vOtMSjl15IyXwZT3zEmzKfnU8tQjDm3Valau76tQLKXjFulNnUk1QZa3mD1
 bpzcdo5uTMslV0UQ5vIIMVbjDr08MbrzJrDNKDtWu7wJ7LrPIg7b7vUWMIR+WNh0t5Upgg/xxdn
 bQH5xMKxVsrb14IulNfv1oMVfmzz7WA69z233VddKFGBGoPwfYUhTBm8uEuQ8oYTvcNXPwciWcP
 K428Jj4fJZ0SP1fpStP7ABaKMXxjREaNDJwTrhzw/NALXq/abQx8I5/PM/8yL9aT4fw8qfygbtw
 M/2oEFrMxtNTjx2I81aKeLAlXaVy0N0vo5yNP+vWzl7ZvEISw4dxhCYdTKGrcou+m6BShT27vaX
 3TXWlsvO8uuwgiwVX0od4ahLb74YAvUU4WYr3ygiJUy10KtQ6ue+Uiwx8Q44775HgNsJZNTlvF0
 v3RIcb2iSR2CF/1XEuQ==
X-Proofpoint-GUID: 6VMvSbABwSXCIj_gSmQgdNydchUBOqKk
X-Proofpoint-ORIG-GUID: 6VMvSbABwSXCIj_gSmQgdNydchUBOqKk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_053137_979246_0ED6BCB7 
X-CRM114-Status: GOOD (  13.88  )
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

Add UBWC configuration for the Shikra platform. Shikra shares the
same hardware as QCM2290 (Agatti), so reuse qcm2290_data for the
UBWC settings

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 3fe47d8f0f63..1a2e54c6480d 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -278,6 +278,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,sdm660", .data = &msm8937_data },
 	{ .compatible = "qcom,sdm670", .data = &sdm670_data, },
 	{ .compatible = "qcom,sdm845", .data = &sdm845_data, },
+	{ .compatible = "qcom,shikra", .data = &qcm2290_data, },
 	{ .compatible = "qcom,sm4250", .data = &sm6115_data, },
 	{ .compatible = "qcom,sm6115", .data = &sm6115_data, },
 	{ .compatible = "qcom,sm6125", .data = &sm6125_data, },

-- 
2.34.1


