Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1630FF60F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 09:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ccYDg7cwwXLw+3otD7WVW/2X37CRQFF/HPOHPWrVwE=; b=fhREXmtkU9Vy1nX2A3wqC0dtkw
	3mW9RzGhzHx5v6r6XJ3ARxdXyp9o0wRLjfWJhNykIlZ7WMZIE4We2JmDsa8kbTX6wdLdVBZlSdjmk
	4i96v5ptBSuA25T6dau7RbBDEBFTBy+TeG9o9VVU3kAdZ65LDds0PTKIRLjIlkr05tYdCO2gLBsmY
	g8d8ZrY8Oag8wYCYiMDK8nFMXrYvn4McfqYEmitBuLDKvlOxJrWt4wUdgUtRXSqrcQozF+o1ZpPVx
	R7tjwFsEEEbfZiMLsrVA5TIZuaTTwaR3WC5Vq9YP/7xH1FBt3coFJt4D7/OxJdyiOkUDUpZuxzGci
	RL1wF5YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7VED-0000000CfgI-1wik;
	Tue, 31 Mar 2026 09:17:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7VE6-0000000Cfea-0bja
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 09:17:35 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V3lRvP843027
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 09:17:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7ccYDg7cwwX
	Lw+3otD7WVW/2X37CRQFF/HPOHPWrVwE=; b=T4t8gOZqL3M3aAsEOjU9ydTcXLf
	Hk+gyCVd5y4XxsUT/Ab3ubTgBjAMxZaD7yTuVnUTUT8Kq9F8nRLMdDfHrH6OhB4m
	OXWWSINtm1jRTLkDEZdgrnAURQgav5i/Vvcmt3bIfAI97UiwpMGJltJnZb16HJt1
	QQgL0NYKhGVx7VmxH5dhhvOTh6wSeXMV5Ag0SyL18HiVzTylMbF3d5EBZFaN9sTn
	9SS8I9GRNTUgu4pAEWMvNrxNkrD4UKsJY5zKV1cE9kY8R+/cm9Q72kyK2lAZlwr6
	uk4qc+prLzFucVM2MLIG7LYEzyPZtctX46EM2o6iYAJwiyD80uYV/FPMjLg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d86nt9935-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 09:17:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b274f94f8so86379281cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 02:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774948652; x=1775553452; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ccYDg7cwwXLw+3otD7WVW/2X37CRQFF/HPOHPWrVwE=;
        b=YAhRJI7kgqFKul5XlDhBSgcHn1QBnfYDzqkew9Pk++MuPj9j5x9yTKhxBSaH1s8/cb
         8vnPZklptvnr6gCTujh/Ya5G7U86fGKIc+0lvd/0t55zSShole3pLGZZiVXTVyhyIKiQ
         QtYdHITSDDX43xTA3j/ms5HSYCExD2JERDOKJUsyhM6cOEWXbirHmY2rgKwxRXtC19zz
         DW/pESpkHA3zKHK/rkbzdxF++QeZPLJmsHgXKq094D6U3qd9PfMBz5PgjNoO6B+avKLR
         CHQYHtYWBbCTzdlIGBiP5J5ddpbwP5upxjJerdQ7QmPZ6RZ/6L6jqxcHHosBcuCyYCQS
         S1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774948652; x=1775553452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7ccYDg7cwwXLw+3otD7WVW/2X37CRQFF/HPOHPWrVwE=;
        b=Zru7F5pv800Xew5IqrWRQWPifF/Ib5uvvKVufAW/Qplad+lSbNYvVV0EFAdyLN6vbO
         fLcNhbk/vzKUKvjHD8FCmRmUSmPU28pi+r60x5HEEh7zz3TKKOhZ8BhsbeJOF+Zj87IP
         BdAbs5//qtFQ/o2NVlqk8aW437fkUO3mn061X8CXdUYPGPpGXwBQIA2RnFGRUtQUN4fI
         uD+vno8elxNDCfuEUg/S2B6xz73/WXcYwgRqk2hJIO55YGuInAodA3xQCKGXvly0+pKI
         knhx7Rq3RRwnArsrfBmGSWTxAOwSg3lzSpIcIfv0UoHAPrjBcJcbf/2yzAR/wnQV55Qa
         u/+Q==
X-Forwarded-Encrypted: i=1; AJvYcCV7rXXdUYQ0NDme3PAVLVvatEd2MwwkZ7ZacCBD2hh/G3fmlncGSS/iuPwSfNr7HENR67B6ZsQUBRMSVKvNWplA@lists.infradead.org
X-Gm-Message-State: AOJu0YxoAbUJ03Qht4zwcHcETH5yJ8nsW9KHVGvm7kO0kwqCIxGjyAzn
	FaNUHMijzoOVqvUX/txpXqDVQOieP911D94JsCfYL8M4RtpJsLsKdD3x31KeGJC2K9Qnxr1hHtY
	71x83ftIsOoi+TVMXT/ILJ1KbcKV7G1kj2TqSHQn/hfMZ6q5nBi/Bd/oCofxdfYD5qywA0T+09Q
	H2XQ==
X-Gm-Gg: ATEYQzygp0TnrQTaqzPyUCNdvkZhgeSVuFCa7moAiOBJIa9yEjdOK6TmD+gB8CxE50i
	SXhOvBjoq0295d8H426dGz+4HOeSRbLdzMEP5U0Gm6vZRT4VC1H4wxXfR0WPbhJs52x9WE8rlBJ
	hSJgSnmvRto9/I93lRBS0vgMG0l7q2NsJq/kPiLk0OCKnX3MLFLgi6bD24Qa4pjwU7HP/oIuzcd
	RTjA77lDwg0PzYCuIOYhMRBt+PP2QdoLnVC5SN3mbJ4i7ichKTq50mpcT2/bkDxTr4wx5p4CUyz
	6QW5PQa6vgzVOtrXBo2RStE7KE1graxQXTZeE3NVymwZqQLU49g/AO2M+AwhIMQgo9cqCt6aCtQ
	DHZGg0eMiEPaULdrJl8u/wcJLBZjeuVqYZSdQ
X-Received: by 2002:ac8:58d5:0:b0:4f7:a06d:c4df with SMTP id d75a77b69052e-50d2c92fa59mr35427661cf.33.1774948651994;
        Tue, 31 Mar 2026 02:17:31 -0700 (PDT)
X-Received: by 2002:ac8:58d5:0:b0:4f7:a06d:c4df with SMTP id d75a77b69052e-50d2c92fa59mr35427451cf.33.1774948651495;
        Tue, 31 Mar 2026 02:17:31 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48880946cc5sm135815e9.13.2026.03.31.02.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 02:17:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] clk: qcom: Constify list of critical CBCR registers
Date: Tue, 31 Mar 2026 11:17:23 +0200
Message-ID: <20260331091721.61613-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=18390; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=JSIM/1zziQ+S4js/C3wMYQlDMKpyS/ppmWTqSdiK8PQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpy5EivxyAXv/PseRB2rPa7IEnw7xou0qljON0A
 Hze1Xf8wRqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacuRIgAKCRDBN2bmhouD
 1xUCD/99nlXXXTXtA7ePJceS+uzz9C7GynJ3Rbd6oV8g+w7QM/o3KRVElTi4PKe/i+E/Y6g4DjK
 BCA6KyVYLCi9nNfus97G/g/il4hTn1I9ZXGu52Q6RLBbPvv01ShT1qP99KM4z3Mdz7ybSxrnuAT
 KfQPW1XdMvAOAt4owtO3eR29CG/KiIWGVgNkiLag+ZBmYWZMrskhxoUhml0tr96PigGhVtVGuvQ
 0s2ZfVzyLQtHfdbMLo6yABe3T6AW3uWoVr6ygiDIiiY+r09Ta1NZPJbUxkbf0gqnHNaF++nkk6X
 SWXRsd3y3xJFYNalL/82r7MQfo2oeGp88BZSH4zi7mjiDF+fB/Yls8fyYH2KzvGPXLtcGiiv4Yv
 9FzFwDXlH3TdImYFLEsrAvRoSuvKaGXcukO3Z3TsEGqsYCwuwBeR76CHwTyk1QVPJGRxAch3cxE
 JU/7WacmoVHnVcQsblCkAtIMMh/pnXNbGEoG5bHOGAPnFtOktzhkI0SaGefOUzJkVcl6lf87Mdv
 U11w6Ai9QqG+RI9FyGkFlhzgyp1FvgnyLJtCJNXmka2H21WXtOo5iu37hX30u8Od6kmxoaTO+t3
 U3qYB7EZzF2qO7HVDrEGlh9rsH+Ih63qGqld57OpSCNATxXavajyfoaVF1m9xcMDX2OSHt1W6fx CVtrEPwgnOHY+cw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _lKP74YxQtpM2YBi50tVQiWOdsWId201
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4OCBTYWx0ZWRfX2pc8GvVhDjgp
 MSoFrfysoLDdZZTGNhKnEp4iOwSXgvpSrb2t+hivrp81YS31Qq9E4Ka9tDfDCxU0BV2HfZXHZoa
 utm6jaWQ3Oz+HhLsK9J9RWAR1AQnBRdpwX7XgXln0m1lTHxLzBO3UfsDDxVcdL29OTE9/QjFidt
 WH0XU/ZV+ql4apYNXMrBSKQ9RzGk/esxQQ6qsI2aEir0CRIi5vb8LGb6HyRaZXe4Kf8HXqlejbQ
 BqlcrwLYjq6EHuEls69pKN1WRIRwFqtyjQ8zD3GHoObqoHP6oU1Pb2aozJEQuurIcol/v8xDRt9
 xnilxphNYuyMD72n2AVqonhsCKHf2qpu39W7H1+EuFOmx1VdVVciRtj1Tth+PntxwaPI1ElwMZA
 XvH9ZoCUpAJMGfOZi0jvAgf/XBenk/nFI8oxNKC8RtWPdYQM99YnylmpWSwejbd1cqEb4Z92Nnp
 rURe1BtQFvRvHED3QcA==
X-Authority-Analysis: v=2.4 cv=IswTsb/g c=1 sm=1 tr=0 ts=69cb912d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=j6FNNbI0-hDOaWdGd2EA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: _lKP74YxQtpM2YBi50tVQiWOdsWId201
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_021734_188822_1EA9AE36 
X-CRM114-Status: GOOD (  15.81  )
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

The static array 'xxx_critical_cbcrs' contains probe match-like data and
is not modified: neither by the driver defining it nor by common.c code
using it.

Make it const for code safety and code readability.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/cambistmclkcc-kaanapali.c | 2 +-
 drivers/clk/qcom/cambistmclkcc-sm8750.c    | 2 +-
 drivers/clk/qcom/camcc-kaanapali.c         | 2 +-
 drivers/clk/qcom/camcc-milos.c             | 2 +-
 drivers/clk/qcom/camcc-sc8180x.c           | 2 +-
 drivers/clk/qcom/camcc-sm8450.c            | 2 +-
 drivers/clk/qcom/camcc-sm8550.c            | 2 +-
 drivers/clk/qcom/camcc-sm8650.c            | 2 +-
 drivers/clk/qcom/camcc-sm8750.c            | 2 +-
 drivers/clk/qcom/camcc-x1e80100.c          | 2 +-
 drivers/clk/qcom/common.h                  | 2 +-
 drivers/clk/qcom/dispcc-eliza.c            | 2 +-
 drivers/clk/qcom/dispcc-glymur.c           | 2 +-
 drivers/clk/qcom/dispcc-kaanapali.c        | 2 +-
 drivers/clk/qcom/dispcc-milos.c            | 2 +-
 drivers/clk/qcom/dispcc-qcs615.c           | 2 +-
 drivers/clk/qcom/gcc-eliza.c               | 2 +-
 drivers/clk/qcom/gcc-glymur.c              | 2 +-
 drivers/clk/qcom/gcc-kaanapali.c           | 2 +-
 drivers/clk/qcom/gcc-milos.c               | 2 +-
 drivers/clk/qcom/gcc-sc8180x.c             | 2 +-
 drivers/clk/qcom/gpucc-glymur.c            | 2 +-
 drivers/clk/qcom/gpucc-kaanapali.c         | 2 +-
 drivers/clk/qcom/gpucc-milos.c             | 2 +-
 drivers/clk/qcom/gpucc-qcs615.c            | 2 +-
 drivers/clk/qcom/videocc-glymur.c          | 2 +-
 drivers/clk/qcom/videocc-kaanapali.c       | 2 +-
 drivers/clk/qcom/videocc-milos.c           | 2 +-
 drivers/clk/qcom/videocc-qcs615.c          | 2 +-
 drivers/clk/qcom/videocc-sm8450.c          | 2 +-
 drivers/clk/qcom/videocc-sm8550.c          | 4 ++--
 drivers/clk/qcom/videocc-sm8750.c          | 2 +-
 32 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/clk/qcom/cambistmclkcc-kaanapali.c b/drivers/clk/qcom/cambistmclkcc-kaanapali.c
index 77adb453ab21..6028d8f6959c 100644
--- a/drivers/clk/qcom/cambistmclkcc-kaanapali.c
+++ b/drivers/clk/qcom/cambistmclkcc-kaanapali.c
@@ -383,7 +383,7 @@ static struct clk_alpha_pll *cam_bist_mclk_cc_kaanapali_plls[] = {
 	&cam_bist_mclk_cc_pll0,
 };
 
-static u32 cam_bist_mclk_cc_kaanapali_critical_cbcrs[] = {
+static const u32 cam_bist_mclk_cc_kaanapali_critical_cbcrs[] = {
 	0x40e0, /* CAM_BIST_MCLK_CC_SLEEP_CLK */
 };
 
diff --git a/drivers/clk/qcom/cambistmclkcc-sm8750.c b/drivers/clk/qcom/cambistmclkcc-sm8750.c
index f0d7e3b7c532..5df12aced4a5 100644
--- a/drivers/clk/qcom/cambistmclkcc-sm8750.c
+++ b/drivers/clk/qcom/cambistmclkcc-sm8750.c
@@ -402,7 +402,7 @@ static struct clk_alpha_pll *cam_bist_mclk_cc_sm8750_plls[] = {
 	&cam_bist_mclk_cc_pll0,
 };
 
-static u32 cam_bist_mclk_cc_sm8750_critical_cbcrs[] = {
+static const u32 cam_bist_mclk_cc_sm8750_critical_cbcrs[] = {
 	0x40f8, /* CAM_BIST_MCLK_CC_SLEEP_CLK */
 };
 
diff --git a/drivers/clk/qcom/camcc-kaanapali.c b/drivers/clk/qcom/camcc-kaanapali.c
index acf5f476955b..af5486418492 100644
--- a/drivers/clk/qcom/camcc-kaanapali.c
+++ b/drivers/clk/qcom/camcc-kaanapali.c
@@ -2600,7 +2600,7 @@ static struct clk_alpha_pll *cam_cc_kaanapali_plls[] = {
 	&cam_cc_pll7,
 };
 
-static u32 cam_cc_kaanapali_critical_cbcrs[] = {
+static const u32 cam_cc_kaanapali_critical_cbcrs[] = {
 	0x21398, /* CAM_CC_DRV_AHB_CLK */
 	0x21390, /* CAM_CC_DRV_XO_CLK */
 	0x21364, /* CAM_CC_GDSC_CLK */
diff --git a/drivers/clk/qcom/camcc-milos.c b/drivers/clk/qcom/camcc-milos.c
index 556c3c33c106..409d47098c10 100644
--- a/drivers/clk/qcom/camcc-milos.c
+++ b/drivers/clk/qcom/camcc-milos.c
@@ -2104,7 +2104,7 @@ static struct clk_alpha_pll *cam_cc_milos_plls[] = {
 	&cam_cc_pll6,
 };
 
-static u32 cam_cc_milos_critical_cbcrs[] = {
+static const u32 cam_cc_milos_critical_cbcrs[] = {
 	0x25038, /* CAM_CC_GDSC_CLK */
 	0x2505c, /* CAM_CC_SLEEP_CLK */
 };
diff --git a/drivers/clk/qcom/camcc-sc8180x.c b/drivers/clk/qcom/camcc-sc8180x.c
index bd06d271928e..016f37d08468 100644
--- a/drivers/clk/qcom/camcc-sc8180x.c
+++ b/drivers/clk/qcom/camcc-sc8180x.c
@@ -2829,7 +2829,7 @@ static struct clk_alpha_pll *cam_cc_sc8180x_plls[] = {
 	&cam_cc_pll6,
 };
 
-static u32 cam_cc_sc8180x_critical_cbcrs[] = {
+static const u32 cam_cc_sc8180x_critical_cbcrs[] = {
 	0xc1e4, /* CAM_CC_GDSC_CLK */
 	0xc200, /* CAM_CC_SLEEP_CLK */
 };
diff --git a/drivers/clk/qcom/camcc-sm8450.c b/drivers/clk/qcom/camcc-sm8450.c
index 430b436a673e..1891262a559b 100644
--- a/drivers/clk/qcom/camcc-sm8450.c
+++ b/drivers/clk/qcom/camcc-sm8450.c
@@ -2915,7 +2915,7 @@ static struct clk_alpha_pll *cam_cc_sm8450_plls[] = {
 	&cam_cc_pll8,
 };
 
-static u32 cam_cc_sm8450_critical_cbcrs[] = {
+static const u32 cam_cc_sm8450_critical_cbcrs[] = {
 	0x1320c, /* CAM_CC_GDSC_CLK */
 };
 
diff --git a/drivers/clk/qcom/camcc-sm8550.c b/drivers/clk/qcom/camcc-sm8550.c
index 8c42ae7544aa..34d53e2ffad7 100644
--- a/drivers/clk/qcom/camcc-sm8550.c
+++ b/drivers/clk/qcom/camcc-sm8550.c
@@ -3517,7 +3517,7 @@ static struct clk_alpha_pll *cam_cc_sm8550_plls[] = {
 	&cam_cc_pll12,
 };
 
-static u32 cam_cc_sm8550_critical_cbcrs[] = {
+static const u32 cam_cc_sm8550_critical_cbcrs[] = {
 	0x1419c, /* CAM_CC_GDSC_CLK */
 	0x142cc, /* CAM_CC_SLEEP_CLK */
 };
diff --git a/drivers/clk/qcom/camcc-sm8650.c b/drivers/clk/qcom/camcc-sm8650.c
index c0055fb08f62..9dea43e74cb6 100644
--- a/drivers/clk/qcom/camcc-sm8650.c
+++ b/drivers/clk/qcom/camcc-sm8650.c
@@ -3533,7 +3533,7 @@ static struct clk_alpha_pll *cam_cc_sm8650_plls[] = {
 	&cam_cc_pll10,
 };
 
-static u32 cam_cc_sm8650_critical_cbcrs[] = {
+static const u32 cam_cc_sm8650_critical_cbcrs[] = {
 	0x132ec, /* CAM_CC_GDSC_CLK */
 	0x13308, /* CAM_CC_SLEEP_CLK */
 	0x13314, /* CAM_CC_DRV_XO_CLK */
diff --git a/drivers/clk/qcom/camcc-sm8750.c b/drivers/clk/qcom/camcc-sm8750.c
index 9b6d49981267..6618b074c90e 100644
--- a/drivers/clk/qcom/camcc-sm8750.c
+++ b/drivers/clk/qcom/camcc-sm8750.c
@@ -2651,7 +2651,7 @@ static struct clk_alpha_pll *cam_cc_sm8750_plls[] = {
 	&cam_cc_pll6,
 };
 
-static u32 cam_cc_sm8750_critical_cbcrs[] = {
+static const u32 cam_cc_sm8750_critical_cbcrs[] = {
 	0x113c4, /* CAM_CC_DRV_AHB_CLK */
 	0x113c0, /* CAM_CC_DRV_XO_CLK */
 	0x1137c, /* CAM_CC_GDSC_CLK */
diff --git a/drivers/clk/qcom/camcc-x1e80100.c b/drivers/clk/qcom/camcc-x1e80100.c
index 387420533125..81f579ff6993 100644
--- a/drivers/clk/qcom/camcc-x1e80100.c
+++ b/drivers/clk/qcom/camcc-x1e80100.c
@@ -2434,7 +2434,7 @@ static struct clk_alpha_pll *cam_cc_x1e80100_plls[] = {
 	&cam_cc_pll8,
 };
 
-static u32 cam_cc_x1e80100_critical_cbcrs[] = {
+static const u32 cam_cc_x1e80100_critical_cbcrs[] = {
 	0x13a9c, /* CAM_CC_GDSC_CLK */
 	0x13ab8, /* CAM_CC_SLEEP_CLK */
 };
diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index 69c4b21333e5..6f2406f8839e 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -28,7 +28,7 @@ struct qcom_icc_hws_data {
 struct qcom_cc_driver_data {
 	struct clk_alpha_pll **alpha_plls;
 	size_t num_alpha_plls;
-	u32 *clk_cbcrs;
+	const u32 *clk_cbcrs;
 	size_t num_clk_cbcrs;
 	const struct clk_rcg_dfs_data *dfs_rcgs;
 	size_t num_dfs_rcgs;
diff --git a/drivers/clk/qcom/dispcc-eliza.c b/drivers/clk/qcom/dispcc-eliza.c
index 60de3c743621..479f26e0dde2 100644
--- a/drivers/clk/qcom/dispcc-eliza.c
+++ b/drivers/clk/qcom/dispcc-eliza.c
@@ -2063,7 +2063,7 @@ static struct clk_alpha_pll *disp_cc_eliza_plls[] = {
 	&disp_cc_pll2,
 };
 
-static u32 disp_cc_eliza_critical_cbcrs[] = {
+static const u32 disp_cc_eliza_critical_cbcrs[] = {
 	0xe07c, /* DISP_CC_SLEEP_CLK */
 	0xe05c, /* DISP_CC_XO_CLK */
 	0xc00c, /* DISP_CC_MDSS_RSCC_AHB_CLK */
diff --git a/drivers/clk/qcom/dispcc-glymur.c b/drivers/clk/qcom/dispcc-glymur.c
index aae60291b55e..c4bb328d432f 100644
--- a/drivers/clk/qcom/dispcc-glymur.c
+++ b/drivers/clk/qcom/dispcc-glymur.c
@@ -1921,7 +1921,7 @@ static struct clk_alpha_pll *disp_cc_glymur_plls[] = {
 	&disp_cc_pll1,
 };
 
-static u32 disp_cc_glymur_critical_cbcrs[] = {
+static const u32 disp_cc_glymur_critical_cbcrs[] = {
 	0xe07c, /* DISP_CC_SLEEP_CLK */
 	0xe05c, /* DISP_CC_XO_CLK */
 };
diff --git a/drivers/clk/qcom/dispcc-kaanapali.c b/drivers/clk/qcom/dispcc-kaanapali.c
index ffdb4de3a33e..42912c617c31 100644
--- a/drivers/clk/qcom/dispcc-kaanapali.c
+++ b/drivers/clk/qcom/dispcc-kaanapali.c
@@ -1886,7 +1886,7 @@ static struct clk_alpha_pll *disp_cc_kaanapali_plls[] = {
 	&disp_cc_pll2,
 };
 
-static u32 disp_cc_kaanapali_critical_cbcrs[] = {
+static const u32 disp_cc_kaanapali_critical_cbcrs[] = {
 	0xe064, /* DISP_CC_SLEEP_CLK */
 	0xe05c, /* DISP_CC_XO_CLK */
 	0xc00c, /* DISP_CC_MDSS_RSCC_AHB_CLK */
diff --git a/drivers/clk/qcom/dispcc-milos.c b/drivers/clk/qcom/dispcc-milos.c
index 17ff10cb2f6b..dfffb6d14b0e 100644
--- a/drivers/clk/qcom/dispcc-milos.c
+++ b/drivers/clk/qcom/dispcc-milos.c
@@ -906,7 +906,7 @@ static struct clk_alpha_pll *disp_cc_milos_plls[] = {
 	&disp_cc_pll0,
 };
 
-static u32 disp_cc_milos_critical_cbcrs[] = {
+static const u32 disp_cc_milos_critical_cbcrs[] = {
 	0xe06c, /* DISP_CC_SLEEP_CLK */
 	0xe04c, /* DISP_CC_XO_CLK */
 };
diff --git a/drivers/clk/qcom/dispcc-qcs615.c b/drivers/clk/qcom/dispcc-qcs615.c
index 21974e2574f5..637698e6dc2b 100644
--- a/drivers/clk/qcom/dispcc-qcs615.c
+++ b/drivers/clk/qcom/dispcc-qcs615.c
@@ -739,7 +739,7 @@ static struct clk_alpha_pll *disp_cc_qcs615_plls[] = {
 	&disp_cc_pll0,
 };
 
-static u32 disp_cc_qcs615_critical_cbcrs[] = {
+static const u32 disp_cc_qcs615_critical_cbcrs[] = {
 	0x6054, /* DISP_CC_XO_CLK */
 };
 
diff --git a/drivers/clk/qcom/gcc-eliza.c b/drivers/clk/qcom/gcc-eliza.c
index 9356c5bf0a03..42a83be34e01 100644
--- a/drivers/clk/qcom/gcc-eliza.c
+++ b/drivers/clk/qcom/gcc-eliza.c
@@ -3005,7 +3005,7 @@ static const struct qcom_reset_map gcc_eliza_resets[] = {
 	[GCC_VIDEO_BCR] = { 0x32000 },
 };
 
-static u32 gcc_eliza_critical_cbcrs[] = {
+static const u32 gcc_eliza_critical_cbcrs[] = {
 	0xa0004, /* GCC_CAM_BIST_MCLK_AHB_CLK */
 	0x26004, /* GCC_CAMERA_AHB_CLK */
 	0x26034, /* GCC_CAMERA_XO_CLK */
diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index 7a199e1bd493..2736465efdea 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -8538,7 +8538,7 @@ static const struct clk_rcg_dfs_data gcc_dfs_clocks[] = {
 	DEFINE_RCG_DFS(gcc_qupv3_wrap2_s7_clk_src),
 };
 
-static u32 gcc_glymur_critical_cbcrs[] = {
+static const u32 gcc_glymur_critical_cbcrs[] = {
 	0x26004, /* GCC_CAMERA_AHB_CLK */
 	0x26040, /* GCC_CAMERA_XO_CLK */
 	0x27004, /* GCC_DISP_AHB_CLK */
diff --git a/drivers/clk/qcom/gcc-kaanapali.c b/drivers/clk/qcom/gcc-kaanapali.c
index 44275bac095e..6e628b51f38c 100644
--- a/drivers/clk/qcom/gcc-kaanapali.c
+++ b/drivers/clk/qcom/gcc-kaanapali.c
@@ -3457,7 +3457,7 @@ static const struct clk_rcg_dfs_data gcc_dfs_clocks[] = {
 	DEFINE_RCG_DFS(gcc_qupv3_wrap4_s4_clk_src),
 };
 
-static u32 gcc_kaanapali_critical_cbcrs[] = {
+static const u32 gcc_kaanapali_critical_cbcrs[] = {
 	0xa0004, /* GCC_CAM_BIST_MCLK_AHB_CLK */
 	0x26004, /* GCC_CAMERA_AHB_CLK */
 	0x2603c, /* GCC_CAMERA_XO_CLK */
diff --git a/drivers/clk/qcom/gcc-milos.c b/drivers/clk/qcom/gcc-milos.c
index 3438fb9039ee..67d0eee8ef35 100644
--- a/drivers/clk/qcom/gcc-milos.c
+++ b/drivers/clk/qcom/gcc-milos.c
@@ -3152,7 +3152,7 @@ static struct gdsc *gcc_milos_gdscs[] = {
 	[USB3_PHY_GDSC] = &usb3_phy_gdsc,
 };
 
-static u32 gcc_milos_critical_cbcrs[] = {
+static const u32 gcc_milos_critical_cbcrs[] = {
 	0x26004, /* GCC_CAMERA_AHB_CLK */
 	0x26018, /* GCC_CAMERA_HF_XO_CLK */
 	0x2601c, /* GCC_CAMERA_SF_XO_CLK */
diff --git a/drivers/clk/qcom/gcc-sc8180x.c b/drivers/clk/qcom/gcc-sc8180x.c
index 35c2e9d555b8..e6b7f1a5dcef 100644
--- a/drivers/clk/qcom/gcc-sc8180x.c
+++ b/drivers/clk/qcom/gcc-sc8180x.c
@@ -4647,7 +4647,7 @@ static struct gdsc *gcc_sc8180x_gdscs[] = {
 	[HLOS1_VOTE_TURING_MMU_TBU1_GDSC] = &hlos1_vote_turing_mmu_tbu1_gdsc,
 };
 
-static u32 gcc_sc8180x_critical_cbcrs[] = {
+static const u32 gcc_sc8180x_critical_cbcrs[] = {
 	0xb004,  /* GCC_VIDEO_AHB_CLK */
 	0xb008,  /* GCC_CAMERA_AHB_CLK */
 	0xb00c,  /* GCC_DISP_AHB_CLK */
diff --git a/drivers/clk/qcom/gpucc-glymur.c b/drivers/clk/qcom/gpucc-glymur.c
index 824b4e09c3f9..54cc3127718a 100644
--- a/drivers/clk/qcom/gpucc-glymur.c
+++ b/drivers/clk/qcom/gpucc-glymur.c
@@ -560,7 +560,7 @@ static struct clk_alpha_pll *gpu_cc_glymur_plls[] = {
 	&gpu_cc_pll0,
 };
 
-static u32 gpu_cc_glymur_critical_cbcrs[] = {
+static const u32 gpu_cc_glymur_critical_cbcrs[] = {
 	0x93a4, /* GPU_CC_CB_CLK */
 	0x9008, /* GPU_CC_CXO_AON_CLK */
 	0x9004, /* GPU_CC_RSCC_XO_AON_CLK */
diff --git a/drivers/clk/qcom/gpucc-kaanapali.c b/drivers/clk/qcom/gpucc-kaanapali.c
index 94f0feb254b3..7f6013b348ad 100644
--- a/drivers/clk/qcom/gpucc-kaanapali.c
+++ b/drivers/clk/qcom/gpucc-kaanapali.c
@@ -423,7 +423,7 @@ static struct clk_alpha_pll *gpu_cc_kaanapali_plls[] = {
 	&gpu_cc_pll0,
 };
 
-static u32 gpu_cc_kaanapali_critical_cbcrs[] = {
+static const u32 gpu_cc_kaanapali_critical_cbcrs[] = {
 	0x9008, /* GPU_CC_CXO_AON_CLK */
 	0x93e8, /* GPU_CC_RSCC_HUB_AON_CLK */
 	0x9004, /* GPU_CC_RSCC_XO_AON_CLK */
diff --git a/drivers/clk/qcom/gpucc-milos.c b/drivers/clk/qcom/gpucc-milos.c
index 7a8a3917db9b..1448d95cb1dc 100644
--- a/drivers/clk/qcom/gpucc-milos.c
+++ b/drivers/clk/qcom/gpucc-milos.c
@@ -500,7 +500,7 @@ static struct clk_alpha_pll *gpu_cc_milos_plls[] = {
 	&gpu_cc_pll0,
 };
 
-static u32 gpu_cc_milos_critical_cbcrs[] = {
+static const u32 gpu_cc_milos_critical_cbcrs[] = {
 	0x93a4, /* GPU_CC_CB_CLK */
 	0x9008, /* GPU_CC_CXO_AON_CLK */
 	0x9010, /* GPU_CC_DEMET_CLK */
diff --git a/drivers/clk/qcom/gpucc-qcs615.c b/drivers/clk/qcom/gpucc-qcs615.c
index 8233136db4d8..91919cdb75ae 100644
--- a/drivers/clk/qcom/gpucc-qcs615.c
+++ b/drivers/clk/qcom/gpucc-qcs615.c
@@ -459,7 +459,7 @@ static struct clk_alpha_pll *gpu_cc_qcs615_plls[] = {
 	&gpu_cc_pll1,
 };
 
-static u32 gpu_cc_qcs615_critical_cbcrs[] = {
+static const u32 gpu_cc_qcs615_critical_cbcrs[] = {
 	0x1078, /* GPU_CC_AHB_CLK */
 };
 
diff --git a/drivers/clk/qcom/videocc-glymur.c b/drivers/clk/qcom/videocc-glymur.c
index 4f1ad0db30e5..bbf13f4ba82d 100644
--- a/drivers/clk/qcom/videocc-glymur.c
+++ b/drivers/clk/qcom/videocc-glymur.c
@@ -467,7 +467,7 @@ static struct clk_alpha_pll *video_cc_glymur_plls[] = {
 	&video_cc_pll0,
 };
 
-static u32 video_cc_glymur_critical_cbcrs[] = {
+static const u32 video_cc_glymur_critical_cbcrs[] = {
 	0x80e0, /* VIDEO_CC_AHB_CLK */
 	0x8138, /* VIDEO_CC_SLEEP_CLK */
 	0x8110, /* VIDEO_CC_XO_CLK */
diff --git a/drivers/clk/qcom/videocc-kaanapali.c b/drivers/clk/qcom/videocc-kaanapali.c
index b060ee34e8a4..b29e3da465e5 100644
--- a/drivers/clk/qcom/videocc-kaanapali.c
+++ b/drivers/clk/qcom/videocc-kaanapali.c
@@ -741,7 +741,7 @@ static struct clk_alpha_pll *video_cc_kaanapali_plls[] = {
 	&video_cc_pll3,
 };
 
-static u32 video_cc_kaanapali_critical_cbcrs[] = {
+static const u32 video_cc_kaanapali_critical_cbcrs[] = {
 	0x817c, /* VIDEO_CC_AHB_CLK */
 	0x81bc, /* VIDEO_CC_SLEEP_CLK */
 	0x81b0, /* VIDEO_CC_TS_XO_CLK */
diff --git a/drivers/clk/qcom/videocc-milos.c b/drivers/clk/qcom/videocc-milos.c
index 012a13f8fb0b..3cce34e8c71a 100644
--- a/drivers/clk/qcom/videocc-milos.c
+++ b/drivers/clk/qcom/videocc-milos.c
@@ -345,7 +345,7 @@ static struct clk_alpha_pll *video_cc_milos_plls[] = {
 	&video_cc_pll0,
 };
 
-static u32 video_cc_milos_critical_cbcrs[] = {
+static const u32 video_cc_milos_critical_cbcrs[] = {
 	0x80f4, /* VIDEO_CC_AHB_CLK */
 	0x8140, /* VIDEO_CC_SLEEP_CLK */
 	0x8124, /* VIDEO_CC_XO_CLK */
diff --git a/drivers/clk/qcom/videocc-qcs615.c b/drivers/clk/qcom/videocc-qcs615.c
index 338ab803d56a..3203cb938ad1 100644
--- a/drivers/clk/qcom/videocc-qcs615.c
+++ b/drivers/clk/qcom/videocc-qcs615.c
@@ -283,7 +283,7 @@ static struct clk_alpha_pll *video_cc_qcs615_plls[] = {
 	&video_pll0,
 };
 
-static u32 video_cc_qcs615_critical_cbcrs[] = {
+static const u32 video_cc_qcs615_critical_cbcrs[] = {
 	0xab8, /* VIDEO_CC_XO_CLK */
 };
 
diff --git a/drivers/clk/qcom/videocc-sm8450.c b/drivers/clk/qcom/videocc-sm8450.c
index acd0928be1f6..18b191f598b5 100644
--- a/drivers/clk/qcom/videocc-sm8450.c
+++ b/drivers/clk/qcom/videocc-sm8450.c
@@ -413,7 +413,7 @@ static struct clk_alpha_pll *video_cc_sm8450_plls[] = {
 	&video_cc_pll1,
 };
 
-static u32 video_cc_sm8450_critical_cbcrs[] = {
+static const u32 video_cc_sm8450_critical_cbcrs[] = {
 	0x80e4, /* VIDEO_CC_AHB_CLK */
 	0x8114, /* VIDEO_CC_XO_CLK */
 	0x8130, /* VIDEO_CC_SLEEP_CLK */
diff --git a/drivers/clk/qcom/videocc-sm8550.c b/drivers/clk/qcom/videocc-sm8550.c
index 32a6505abe26..4e35964f0803 100644
--- a/drivers/clk/qcom/videocc-sm8550.c
+++ b/drivers/clk/qcom/videocc-sm8550.c
@@ -536,13 +536,13 @@ static struct clk_alpha_pll *video_cc_sm8550_plls[] = {
 	&video_cc_pll1,
 };
 
-static u32 video_cc_sm8550_critical_cbcrs[] = {
+static const u32 video_cc_sm8550_critical_cbcrs[] = {
 	0x80f4, /* VIDEO_CC_AHB_CLK */
 	0x8124, /* VIDEO_CC_XO_CLK */
 	0x8140, /* VIDEO_CC_SLEEP_CLK */
 };
 
-static u32 video_cc_sm8650_critical_cbcrs[] = {
+static const u32 video_cc_sm8650_critical_cbcrs[] = {
 	0x80f4, /* VIDEO_CC_AHB_CLK */
 	0x8124, /* VIDEO_CC_XO_CLK */
 	0x8150, /* VIDEO_CC_SLEEP_CLK */
diff --git a/drivers/clk/qcom/videocc-sm8750.c b/drivers/clk/qcom/videocc-sm8750.c
index 7e77822c132c..e9414390a3cc 100644
--- a/drivers/clk/qcom/videocc-sm8750.c
+++ b/drivers/clk/qcom/videocc-sm8750.c
@@ -392,7 +392,7 @@ static struct clk_alpha_pll *video_cc_sm8750_plls[] = {
 	&video_cc_pll0,
 };
 
-static u32 video_cc_sm8750_critical_cbcrs[] = {
+static const u32 video_cc_sm8750_critical_cbcrs[] = {
 	0x80a4, /* VIDEO_CC_AHB_CLK */
 	0x80f8, /* VIDEO_CC_SLEEP_CLK */
 	0x80d4, /* VIDEO_CC_XO_CLK */
-- 
2.51.0


