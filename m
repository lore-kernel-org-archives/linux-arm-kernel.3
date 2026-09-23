Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F4E2C982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 04:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LaTyrJazqCQrK/3v09odbP4gZk6HlHmaWeeBLbXZQ1s=; b=jkrkD7SwNktc3o
	faZsv1FeBGjHWWOUcVpYFVTxsC2+j4f3qLOuzK48ohGwKHy/Yk4FFyvAqja4np9BWE5QQaPTaUOT7
	feBt7ZyeIhx63MCYE+nM5v9DHxSkZo/sCENhhyBWZxv5VrUwNV1vL3fdj+P9l9/JQUhi/chNesx5s
	YrgUPGgjynqDZcPyFRmL7f1R3uP2T8uadNVBrLIiNcqE4rixbZI0gu7vMOzMGHlwfmbNzaQmDKzNX
	Ge/bUkHAsQnMkQXFe46ZtiXFpj500GVFOuITqXOuJ3ERUFE4KD/u8Bze05UuIncw8D9wqG69on9uq
	RtvCxn8TlFugosbhJJ9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9F3T-000000078lv-1YIN;
	Wed, 23 Sep 2026 04:58:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9F3L-000000078kI-3uYu
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 04:57:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=LaTyrJazqCQrK/3v09odbP4gZk6HlHmaWeeBLbXZQ1s=; b=Lw5EMdqtIL6VDUbo35I9Dqh9On
	ZNyDMA/rbTVYzcfKP7dLmdLcQ2KWLMhXNG9XLzgssotcQMUizU6tJ+f69a0aq4KEqcPT8vVsU7BCI
	c+rcnXnIkDCqFWjZZYqzpZerk0YkILdaFbErPR3VzZ7Vk4rm7UXDl16H9A/1182E2rFpZRWgVhYGw
	Szz5hgEsAx/xB4aw9AHXTBTPu12UkHi1r3Ocg9nl0hvwkjJASsu6lHUrEPoJEK+9b06pmJoHHOIn+
	ajUZPV/kuW418eJfmKBNnJT7UQQrKPk/b0muW2n/8+uGSXKFa+jaBhypIoDmueRlz8y7Wb6gHod9Z
	2YEf2DtQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9F3E-0000000EM0U-1WPg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 04:57:54 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3iPFh2571363
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 04:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LaTyrJazqCQrK/3v09odbP
	4gZk6HlHmaWeeBLbXZQ1s=; b=CH2D82OEL0l6CnABHHXq3jtam2KqlgEdZEWm/c
	nmdGinjGc3XRiLyENb5GU+7ug65NyForGlJKuygmzKkoYRYzkSJ+0eOQ1XPqo3AW
	iQ3YR6HDMcn9T3fusWwWc7RCTv1Mc81DE6ZSnoMkZ+XBGG7p/JUgaqcSIumqBxfh
	PAcHn0WspZ7hN6MARtudVDTfuVVtSTz/Ab86YKy+mnqAtDQZs905DyQFmPB32zoK
	cjNRRNUOvPdcfucWl3t73SnYANAEPgujIgUBE4wDV6bmCpt9l0Yrzn+CoZ+Vas74
	bxbqrm2SNWJuhwI9EWOvlAVSGvzENpp6raSYaNvySTNgsNIQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux862jby-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 04:57:42 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-32b8c2b30c4so753307eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 21:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790139461; x=1790744261; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LaTyrJazqCQrK/3v09odbP4gZk6HlHmaWeeBLbXZQ1s=;
        b=h4LgkY7jzPYetmSPbNznk/uFwWxLgIIt3uYCncu8BWly+ZSAyiBTZ/oNW6toq9zhFE
         0l2MXIVQwQ4B2uzIK+jxckNqZFrHciDLUwSds/RBSQ7BRSZf2FYDRuuXd7BlHHyajBfK
         bdTZglnbPTwducH+BDnctri3WFDaDBGaAeCOHinsK92GPi/9sVEkWwzTxHot4AAFhItJ
         ClLPmoFF1aomeg+/kviznhkDSgVEp75vWTQMtqt1RziH6DDrN44Kyw9L1C58XwYrcjFj
         UpZGXP9qpuh0OOYw/lcyXzGhTlvSU7gneYj9KB5s4wPFGmZYz1UIC4xYq7f5hzrexIVs
         4Kvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790139461; x=1790744261;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LaTyrJazqCQrK/3v09odbP4gZk6HlHmaWeeBLbXZQ1s=;
        b=nCzJ+Facdne7DoffN+Wcn/udzgiC+EoUt+K+msaE5QjNxYqDClRjposd+AHKBSCrnw
         J6G6RWjZ1pBWheV1kGYpgDgPJGFs2RfahCAw+zWSpcOd/2EeyRzVGAjr+GXyqZ+di8i1
         C2kzrnCR5EWTT868KAsR26auJ47SMr1Ra98FJnLGq/K+L0ev0LCDNJIS9wptRWTBS4Vs
         i9A/s0vu5GiZ8D7DcwLVSUmIe3isuyN0HjEp5/IWGo3oT4CtQ4nSmRgV8rZqZQoyVaEr
         MJF4fNJfTnMoerLVC86fu09bu2QEYzdjVttGG1EPNNwMaPq5G8g4w/SmD8QDneS12GpC
         PjsA==
X-Forwarded-Encrypted: i=1; AKwUvBwgBBu9VkvgcgXpivnnPkjE68xakBQ/pDCb6KgGXTbTP7dgQWSkL8TJC08XhIzVMsDvfCg9AZW40vYj40PyJG25@lists.infradead.org
X-Gm-Message-State: AFuF++n6GeNT/hndQ5hptqK3mKwpFDM2LQlyKy1hN7bdMDqnsAKL19ne
	nb85maUr0jH5LuemLx2SNhLtvmLA80ptw7vf+7OcqwcRhtkQNntqn3a5LbEDyzbwRUttdTmaJwJ
	XC/JTLFo+Epg531IOmctN0lWBm75OeJlQ4w0XmwvWZ1611MosNoLxGUgyTwTQNTCz/fd3HFcV8q
	3BjQ==
X-Gm-Gg: AYBFou0C7HbsQ9B20IDA0158rC0+uuPtteBpQODZO61tZhekbzb0hQYJNDw4otzj9QW
	uUhUu9sb/xBe0SAxmvTPA8KyGFb2gEn0OhVtZTAaSH4ST16+DQ96LzSuuPJjuJ6WELUK2KkWTGE
	UW8EcCsr94pVFyjK48VZsuDiMY8l/PrTeBGPwi2FgB3DjsOfZ15FOH1HjoII3bB3hmWiw6JJrvP
	d444HwOfmC+uFEixbFn4NMJOfhCbLx7g0KCcj4mEigF9wfXliXrgvRo7vwY2VZGe2zoX8+G10I/
	tmx4lqG000+Y8egiIDPVH0ai0YXSDiiKgetfUVoE9NE0O+youRkiLPaXGQIPM5e9HacHWzQJVBM
	EJe5tiBznWBhsXsATq7+zf42YPSFJzA==
X-Received: by 2002:a05:7301:170a:b0:33c:4cc:3a32 with SMTP id 5a478bee46e88-33e8bc73ea8mr1469870eec.7.1790139461372;
        Tue, 22 Sep 2026 21:57:41 -0700 (PDT)
X-Received: by 2002:a05:7301:170a:b0:33c:4cc:3a32 with SMTP id 5a478bee46e88-33e8bc73ea8mr1469830eec.7.1790139460681;
        Tue, 22 Sep 2026 21:57:40 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96e48e3esm3168907eec.26.2026.09.22.21.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 21:57:40 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH v9 0/5] Add CAMSS and IMX577 sensor support for Shikra EVK
Date: Wed, 23 Sep 2026 10:27:27 +0530
Message-Id: <20260923-shikra-camss-review-v9-0-09f5fbea1309@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADdcs2oC/43SwW4CIRAG4Fcxe+4aBpgBPPkeTQ8wQCWtWhe1b
 YzvXtQmethteiH5SebjT5hTV9NQUu0Ws1M3pGOpZbtpwT3NOl75zWvqS2y5k0KSQEl9XZW3wff
 s17X2l4n02XOmTOQZiULXJj+GlMvXVX1+ueUh7Q4N398uu+Br6nm7Xpf9YgZGQI5eZrRJaWSBI
 mslnDMQIgvDkUBT8N3FWpW63w7f18JHuGJ/djtCL3rSGCVbNujNcrcv893Bv1+en7fjyh7lnSJ
 hxynZKPbgFIUMEtxyW+sIpR4owHFKNcqCVdpC1jaKCUr/g9KNChwQhAWjMExQeKcMqHEKGxUDq
 pAAI+s8QdEDJScoapRhTdmFEHQcafX0u1VW4DThbQxMlEW0ZqKNubexYmIJzOXnjCKRI3n0PEH
 ZO+XAjFO2US44dCQlcPYj1Pl8/gF50SikWQMAAA==
X-Change-ID: 20260526-shikra-camss-review-cf6f66ac566b
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790139451; l=5770;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=BTOJ1wiveAXpZtw2XTXq7Nf2MHakkYTzq5oPmpfXG/I=;
 b=EmPMgmb3Us8EvsrZlA3s2nNjTIZPp4ZBqm+EIgIdr4tgP5n/X/WLzWSU5xU3LGg103P9t7jhq
 OrapwiEVbI2AIDOHU/xG75gF2yNsBARX3ceGpdtKPjGdEfkygEeChgn
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: RNQhVaT16JN-iFQ6_Y4Ukv8Mqx-beLX1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxOSBTYWx0ZWRfX4nw60MJDAhMU
 CZHDEu7b8BmdbITeZDTdAvQQKCtorQIDKUmVvt5af4pVYnF1Mx/6me6ematkAQlMkmjRZP3P9v1
 +Z41QuQuJZ6tpey4aqVL/Y9MYqchUpk=
X-Proofpoint-ORIG-GUID: RNQhVaT16JN-iFQ6_Y4Ukv8Mqx-beLX1
X-Authority-Analysis: v=2.4 cv=eIOGH3p1 c=1 sm=1 tr=0 ts=6ab35c46 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=E40xv7DK0V-5u9Ck0vwA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxOSBTYWx0ZWRfXxd4Wt+D4X6pX
 T7WRdoHnE7W9YacZXNXEfYQYJ2YixcJ1zzMbHaI3D5tYB6yhegV2zCF8wfoIxUXtLTUEQI37FnX
 BKC+npCVxvYIjs7fTGetA29vExlnhtlFyjsa2WJ8tvuUG6+0brD3iZnABaQQca4NBgcpQ7/OQzQ
 kkraiRQURPMTyc5cMRBNIObDW73DI9J3DayHy4TLeheZxqglfseSTdyY6PEB84CL8CC8lYgAwTD
 N/8NH34QW6VIoE7by+L12uqlXSwP+xdzkw7rV9nEQBf8qTA581W2N4gDMFtUebEQdmVwxOth8WU
 h6+tEkkQxsWuMQkZzxP1ZMAALIro382hWDR4HguTGDsFnWQMqJthT5ARjcSD0+7fKH7pMEkTbVX
 Nwc5PLjTpmcVtMd007M49wUZiO0Fjt6Y0ZKAURH8H3r3AY09S+6jmo19IVFcMFgQGORRdgj8TBk
 tZ19RIMWgQvJ9nQGq2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_055752_042265_DFAEDA0A 
X-CRM114-Status: GOOD (  17.73  )
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

Shikra EVK is based on the Qualcomm Shikra SoC.
It lacks a camera sensor in its default configuration.
This series adds CAMSS driver support, CCI definitions and enables
the 22-pin IMX577 sensor via CSIPHY1 through device tree overlays.

We have tested IMX577 Sensor on CCI1 with following commands:
- media-ctl --reset
- media-ctl -d /dev/media0 -V '"imx577 1-001a":0[fmt:SRGGB10/4056x3040 field:none]'
- media-ctl -d /dev/media0 -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
- media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0

Used following tools for the sanity check of these changes.
- make -j32 W=1
- checkpatch.pl
- make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=i2c/qcom,i2c-cci.yaml dt_binding_check
- make DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=media/qcom,qcm2290-camss.yaml dt_binding_check W=1
- make CHECK_DTBS=y W=1 qcom/qrb2210-rb1-vision-mezzanine.dtb
- make CHECK_DTBS=1 W=1 qcom/shikra-cqm-cqs-evk-imx577-camera.dtb
- make CHECK_DTBS=1 W=1 qcom/shikra-iqs-evk-imx577-camera.dtb
- make CHECK_DTBS=y W=1 dtbs

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
Changes in v9:
- Use suggested CAMSS CSIPHY port labels in the DTSI and camera overlays - Konrad
- Collected Reviewed-by tag (Konrad, Abel) 
- Rebase on top of linux-next (20260922)
- Link to v8: https://lore.kernel.org/r/20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com

Changes in v8:
- No code changes; Updated patch subjects to end with "for Shikra" (Bjorn)
- Rebase on top of linux-next (20260916)
- Link to v7: https://lore.kernel.org/r/20260806-shikra-camss-review-v7-0-c7360fd6a5ac@oss.qualcomm.com

Changes in v7:
- No changes in patches
- Rebase on top of linux-next (20260805), fixing the conflicts.
- Link to v6: https://lore.kernel.org/r/20260805-shikra-camss-review-v6-0-a8dbc66f0d87@oss.qualcomm.com

Changes since last v6 RESEND:
- No changes in patches
- Drop dt-bindings: media: qcom: Add Shikra CAMSS compatible; already
  picked by Bryan into media tree (now in linux-next as 32179a552b8e)
- Rebase on top of linux-next (20260804)
- Link to v6: https://lore.kernel.org/r/20260723-shikra-camss-review-v6-0-7c46f9bbb4db@oss.qualcomm.com

Changes in v6:
- Rebase on top of linux-next (20260721)
- Sort CAMSS by unit-address numerically - sashiko
- Collected Reviewed-by tag (Loic)
- Link to v5: https://lore.kernel.org/r/20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com

Changes in v5:
- Rebase on top of linux-next (20260710)
- Drop dependency on shikra-dt series; now in linux-next
- Drop dependency on shikra-gcc-rpmcc-clks series; now in linux-next
- TLMM pin entries roughly sorted by the pin index (Konrad)
- Link to v4: https://lore.kernel.org/r/20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com

Changes in v4:
- Fix data-lanes numbering to start from 1 in all endpoints (Vladimir)
  Missed in last rev.
- Link to v3: https://lore.kernel.org/r/20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com

Changes in v3:
- Drop dt-bindings: i2c: qcom-cci: Document Shikra compatible; already
  picked by Andi Shyti into her i2c tree (now in linux-next as e3a8f8329397)
- Preserve blank line after compatible const in qcom,qcm2290-camss.yaml (Krzysztof)
- Add blank line between iommus and power-domains in CAMSS node (Vladimir)
- Move cam1_reset_default pinctrl state from board .dts files into the
  mezzanine .dtso overlay files (Vladimir)
- Collect Reviewed-by tags
- Link to v2: https://lore.kernel.org/r/20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com

Changes in v2:
- Drop qcm2390_resources struct and CAMSS_2390 enum; use qcom,qcm2290-camss
  as fallback compatible string since Shikra CAMSS is register-compatible
  with QCM2290 (Loic, Bryan)
- Use oneOf in iommus to describe all valid SID combinations: VFE-only
  (Shikra) and VFE+CDM+OPE read+OPE write (QCM2290/Agatti); add
  per-entry descriptions naming each SID (Krzysztof, Bryan)
- Rename shikra-cqm-evk-imx577-camera overlay to
  shikra-cqm-cqs-evk-imx577-camera, shared by both CQM and CQS EVK
  boards which use the same PM4125 PMIC and camera supply rails (Bryan)
- Add reset-gpios pinctrl state for IMX577 sensor (gpio33, cam1-reset-default-state)
- Add comment in overlay DTS explaining absent regulators are powered
  by the daughter board (Bryan)
- Collect Reviewed-by tags
- Add reset-gpios pinctrl state for IMX577 sensor.
- Link to v1: https://lore.kernel.org/r/20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com

---
Nihal Kumar Gupta (5):
      arm64: dts: qcom: shikra: Add CAMSS node for Shikra
      arm64: dts: qcom: shikra: Add CCI definitions for Shikra
      arm64: dts: qcom: shikra: Add mclks pin configuration for Shikra
      arm64: dts: qcom: shikra-cqm-cqs-evk-imx577-camera: Add DT overlay for Shikra
      arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add DT overlay for Shikra

 arch/arm64/boot/dts/qcom/Makefile                  |   8 +
 .../dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso |  72 ++++++++
 .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     |  72 ++++++++
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 197 +++++++++++++++++++++
 4 files changed, 349 insertions(+)
---
base-commit: 1701fda2f58e345c050f4309971bdc07cd6146ba
change-id: 20260526-shikra-camss-review-cf6f66ac566b

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>


