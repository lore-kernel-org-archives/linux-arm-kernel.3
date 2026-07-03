Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39226C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 10:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rKjHG4tTd9LIUQ+3fOPrSQ/CBSJcIEba4Q8qoWmuJ8g=; b=yuGQzBRhmDnfLc/4ilVhmmZGgv
	SZFv5hZf3iY1+bpoBVxLAjdp5nEQVLXuqmBTQHBWoJ/tiVkq/OdW1Suuxjtu/e/syJrejZJIQ8lRA
	YBJgkvIs7aFXguTXtyYP6tREYIM8cORMYgfXTK2K4bBx+rxW09v9nlcQOf6lMi6QGxezsFOSpUXEu
	Ub/0h5JJlX/Nw+W9iZu+6fUk5VJoyQHH0PkllGwljMW7PQ/b8FTwyWE4NifyeU7S5+IPQa9HxRNmT
	tYep9gpTtfMbepi0C0Z6mS1KRmBbP88ufkbHUu4GO/7sXlx2uYgyslWKTboHNQyHiQeOl6BXuoH1f
	n9soo81w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfalH-00000006XzS-40sS;
	Fri, 03 Jul 2026 10:04:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfalD-00000006Xtm-1eUU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 10:04:40 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663A2tSP3772699
	for <linux-arm-kernel@lists.infradead.org>; Fri, 3 Jul 2026 10:04:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rKjHG4tTd9LIUQ+3fOPrSQ/CBSJcIEba4Q8qoWmuJ8g=; b=KCQ6i5m+buD11unu
	UL2krd/oCWG08il24JR7usMCmWEkPqS2ouzmfGuxwLfYPdpudBgeKqKXezuE1yhh
	3UZ5Q/SG3HKOIrcfGikuFsVovyy7Qe8W+k8u+IcKEIKlmrAgz7LuU4KEf3xOYJGH
	il8VsTslWdv6uAp236kY3JVt5SRUnoD1cFJxuR+ZJ+0ix4fhzOYQ46qrSKIa3cgq
	Sv1FOcU8vKzAuAs04NsSIOWrs/q5h47J14qmJTyJ4K13SbXB1tpSL3jXxBethlZT
	CAYfAPjD0pB2bKS6xeyi7V0U9nly0D7lZ8OQBc0hvvzVmiebRaScc0RFbMcLAzAA
	DE8oXw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6b03807w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 10:04:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e4f27f49bso31475385a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 03:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783073078; x=1783677878; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rKjHG4tTd9LIUQ+3fOPrSQ/CBSJcIEba4Q8qoWmuJ8g=;
        b=JgZtu13AeCQbMKx3NbVX1NJaOS7Ve0Kd0aP2Ym3Unwr4wsOnsZBnGXpN5780NugPDx
         4lv1/kNczcy4iF8dxwFJEMHeKC0UYa3M7N0nmXDEKHqMwem/kLQennVTfuXE7Bip38Dw
         Ne2hmNQ8vD81k3Y0MoIGjsiMUWi9DfQVEPN6DYBVud8mjyZ9WRt5Qzx9LSKyXLpfmbKX
         48/H8mvewVfmDP5sRii+iBdZPhht4RCldbsVcmZWsgiTa78Gxd4h1LloLPu1cZt5uRXL
         7eZR6e+64eA5IsRWndo1QqP5M1/yuNLRoTVCVAvWY8HepmvHMilJ+RX2sqbFbfqZUGPp
         Qb8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783073078; x=1783677878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rKjHG4tTd9LIUQ+3fOPrSQ/CBSJcIEba4Q8qoWmuJ8g=;
        b=iJv8drbdNLyRAvhnOw2GbsQYsbr7iqrRO92JXIfPtwPCzX1KwAa+Pw0ydD9QfL7mED
         xz850Taq+yNAja/IqVsiiB/C5k+cIF/OvY/DPceMDO1uyNNQDtE/HBHx4ZHWWJgzzmUX
         Els9IWND+B6XJSetuBOtMvej1JXr7LxByuLm+jCj7ufWfWKAMpnT3Nb7tv5/OitGMBXV
         Bkc1czZifGPMtXr0RhUjrVV9iS34DEgJAuhbbiJtNlxNkAaMbAzGzvfUOYXmHVrTQPRK
         7v8GuyXMt8afVrUXTb/azVtBFftx8GcF/gkYtIbwx7ur+TElDNshhQSwVDO///um+a3t
         bcag==
X-Forwarded-Encrypted: i=1; AFNElJ9G7WYlEY2QB/JdagbTHLzvLFaQ4PCZ2XXddcg5W+fJeLQJlXIQfstXyJDJ/1ANwLgXfD4fy1Q8dOWOINc5+BcJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yzw0s1P2RBJuTQtv38xUZuldhefrgBZYcv4RUI1UkamVQzg466Q
	ko9kHNZ9j/Bn58yA+63ksq++Gk0RAQepGV3r4MiBlc86iw2I4IpLk2VPbFIYGWVstccO8Jg+gM3
	mhQmQuK33q9fNfOpy+ALs7Z4SxMuKJC/H/Z2saVcPWr9AE7sp5u2sAlND5Ml3jkBFR891HURgQh
	QKSQ==
X-Gm-Gg: AfdE7ckUFuPsJmzMBa4Vw410yCv5QEYuL3D751KKXAa2h5YxrDbB2ZZBzk7sX7RzGuS
	uTNCr1EcuYFbAB3jSNkszeYKUikKEJR9FhZqVebPIHzttkCGLekrzURwQQ+34f+mZcTI6Z4R/Er
	ABWC9XetF+O3JNZFeXx0CEpIFkJHzVOKkAA2nDhQre6i1YaLH7sgL9SndmuPWnr50SR43+HGh9o
	SoFosJN2AaUtHjHext/EpzffPU551FWkD/f5etlYyeLT+M0VNqKQ32+SBSjRZpFhG7i5VrM6SDW
	4cTNacq8+6iw7jZFGPVIoq5FjsweB+mVmNzX1L+nTMZw1O/6UZjFNM1KXR4Zl52+4P9vPlJ91pV
	sgvBv5XxOCRpeVE617fXYRo6MVVE9+Lovo80=
X-Received: by 2002:a05:620a:3728:b0:92e:535b:e08b with SMTP id af79cd13be357-92e7825c3a1mr1371755785a.33.1783073077836;
        Fri, 03 Jul 2026 03:04:37 -0700 (PDT)
X-Received: by 2002:a05:620a:3728:b0:92e:535b:e08b with SMTP id af79cd13be357-92e7825c3a1mr1371751185a.33.1783073077438;
        Fri, 03 Jul 2026 03:04:37 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccd9d607sm51353505e9.2.2026.07.03.03.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 03:04:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 12:04:05 +0200
Subject: [PATCH v3 7/7] arm64: defconfig: Switch Qualcomm SDM845, SM8150
 and SM8250 drivers to modules
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-clk-qcom-defaults-v3-7-78894525e54a@oss.qualcomm.com>
References: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
In-Reply-To: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1205;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JfjK7thpXbrrPhwyCS15MQlU8HtjezPzY6FlkiPWkv4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqR4kZMt7jLn4o66w5NIeZk9JVoDYmTxObv1FAE
 9FEmur20fWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakeJGQAKCRDBN2bmhouD
 1+3/D/4xnT7HVH26U7JwHKu+DT6nNexpYNUtlzH+mx3TnUlFPIe1OBu3TpsqcEOsByGOvpK1Dxe
 Gz+T+5aBYdIdWa8ow/4Zc1qUjdimRlD1LO8bOF7my2IuLgMOGOsPMehV7gq1NNKHJxAGqSXd/eT
 vT+zplbSzspOs9JoENz5QIqEoO50JmVPt1OPilNo8hOeUlTNoVSvnpAm7zC90mqTvtHkHayW2Ze
 5rEJaCi/fx2el3PscSDQ0xp1U13GcOWUUkD1RCiTVE5aDo4Ti10/0Cfdon1UTsnRavq6tWLgmDJ
 yrVrr+xvgJHyo8AgIrpBqArueHLVDhawsmNfVSveYUAtf0w7OB5FFDCo+dUSIDng9iOu+TuxUao
 7+leGAV475j+1u3NiR5CdCZBeDXynl7lU4F+yeTq60naTTQR7CPNIkL4eMDCQZPHVNCyy40Ns5v
 JARP1b+CbjkwqM5ObTVZGfWcBEZESVtlgR7fQUApEN7zg4r5iR40xXzgl7yxE3XbzZVGEeW3vnh
 Q9aOmH3hmtJdorGojX0NB2+hGe8jOjiXuSEtuwq0be/fYg5BbMATlEJf+ChvW4y37jDp2d8LKOK
 7mpHEkS1/wz46axUNwISWXCwnybWUh80cEZOjDpgFpTI+sC0BamdEclbPNPN4ZQCw6SWLz4FaGq
 XmO2PISvBrOJGsw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA5NiBTYWx0ZWRfX5RstNvYCatFY
 lDycSLeT+hWFoHW68+6NDovIx8viT6WnNSq39l66EZ7zxSHC9O7lL/TXPLBlUnxlt/89F+QR8cf
 BWgdr0DG3UiXsG8NXZRrD2w7y77LEhk=
X-Proofpoint-GUID: NCRfm36znL5_HVt6NEIO1hbjSRqOT-9_
X-Authority-Analysis: v=2.4 cv=FoY1OWrq c=1 sm=1 tr=0 ts=6a478936 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Qd1XWP2DvpO_7if9oiIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA5NiBTYWx0ZWRfXziNxRRhsADOi
 xsIfqnqItw5RImHPSzKFth2i1KrU5oASI8mxSDs02IG24u87WzSzPuTkR09XVgcO/40+k99VvTE
 ldbmJOpmxntfKv5KBjk2NXH2I0Hppatn8SNDkDMuobPMg393pX4w2bzq2lQvkUIn0zzJ0sHfY4g
 aYeZiFb8A0Y6P3+Q76qC5URWHBvHaDotYD9/XXgKNnNAr3wLH8Lk145KLI6AcPbntghAzwB4QD5
 4zwqQSVfE5M8055WGnGG5pc0LQpuncYqYk+02qE8qNPueG0zvlJ5pe+XOBNqIUKmGlolX4oqduf
 ZsRalTP5YGZoGsD+fIa7SACnlY//YS2hoMOXqOLuYDf+ArX3cA5Ya30OjwAdldTo2oBVS3OhzN2
 oGB8GtfvbwdKF2eTWHDswRslKu4Fm4zXq5UAEIstCcXDN1AX6YC9Jco8gouSqWFxlMvHFX+TK5U
 tKVlc9AHfmdnT4ORq6g==
X-Proofpoint-ORIG-GUID: NCRfm36znL5_HVt6NEIO1hbjSRqOT-9_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_030439_553899_4B53014C 
X-CRM114-Status: GOOD (  11.69  )
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

Display, GPU and video clock controllers on Qualcomm SDM845, SM8150 and
SM8250 SoCs should not be built-in because they are not necessary for
platform bring-up to shell or even mounting rootfs.  Drop their explicit
selection in defconfig, relying on defaults which makes them modules.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Depends on previous patches.

Changes in v2:
1. Rebase
---
 arch/arm64/configs/defconfig | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c9560f0851b2..386a0ad3fe3d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1462,13 +1462,6 @@ CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
 CONFIG_COMMON_CLK_MT8192_VDECSYS=y
 CONFIG_COMMON_CLK_MT8192_VENCSYS=y
 CONFIG_COMMON_CLK_QCOM=y
-CONFIG_SDM_GPUCC_845=y
-CONFIG_SDM_VIDEOCC_845=y
-CONFIG_SDM_DISPCC_845=y
-CONFIG_SM_DISPCC_8250=y
-CONFIG_SM_GPUCC_8150=y
-CONFIG_SM_GPUCC_8250=y
-CONFIG_SM_VIDEOCC_8250=y
 CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m

-- 
2.53.0


