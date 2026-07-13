Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC45C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 14:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ePg30Dj860EoigB8zsOGgFL9B06gE/0H9SqHIRAB5OM=; b=swFaHaXQqVz9LRXxwCZyIAgBib
	FHhgmKOVIqAAQN+U9f2tgXSxmJJcBRgMYwQ7DmLsbJjUQq6S8+RYt7fEDcM8PdSEGMdzVUzsJAoTt
	sa/UTR+FNEEG1eU9AfzNz8HwBcoza9jHhM3qgZWdS0RwklpLZAowqEs+tjqvoGqV6eaWVcugi2EpK
	Gm0PDtJsjZ7DSsGrp/2ZsVRByISt3ogcjrNsut/lV3Dwb3XIT07b1No/9u/D9vIkqkDa08E89GzC8
	al0ohnclkJGDoGgcKE+IS7SPo/+mu3zjVlGX+idTGOWCeeSPWi+aULom8halCY9QCLcjIv+tv8qZq
	6BjWZdmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjI38-00000009er8-02bB;
	Mon, 13 Jul 2026 14:54:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjI36-00000009eq4-2urc
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Jul 2026 14:54:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ePg30Dj860EoigB8zsOGgFL9B06gE/0H9SqHIRAB5OM=; b=ZsniBsC7FC0DKRYyBn0BQraCYF
	Q8jPgZ8Bp4x67CbOgDLcAeFF8ZN01nj3yiupJ+Mkts5HuYnGnjO0G+ikhgcr/4jaOLFCx4UblKC8x
	kI9a3yAqqVULngmdNcTotKiaqHkWIWZKRbk/j5IQ6f+8yYwkT5Gx6gP5C6GtKZWtUQkR2ydVWf7Fj
	zXRV+MVPbjJr2GpKFmD56SOqo5o14Ezi1wCnuDlMS7zIVWGxYUs4kRVJXvehfChykgc2Qj/6Byw5F
	WaiCphW1Rrkqc1YgvY2Hz84yU0R6RSubcKWZMBqO5vljfYaQwVGWBbC/K+x4clsXAAvV1eNEOn8C/
	zXiy6k1w==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjI33-0000000Bjli-1oJJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 14:54:23 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCFJXm1506638
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 14:54:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ePg30Dj860EoigB8zsOGgFL9B06gE/0H9SqHIRAB5OM=; b=VHHUK5eSgjv53HjU
	FauSiO0Uf2cBnKOfqOfwfHQgCnafmqrF4uslpK1sB7OhyIESBcobZ2TeAYfx4l/t
	VKa5r2k6o4vYHbSl5ziExVOXRHvD6Viij7dJF/3hvBSwWhMG6XkMssmi06inMcLS
	fLP7q2SJNzh9ztW0GdAS1529q+/vLa+SiNHrQsfEjCfZBRMGAjZrXF/J+Urpb2ET
	j+6Ak22NMK7B4LGwcoQ3SEWZ46UkztdrQpbVWVETHXGP8u8DKvhgBRMALQZKnY3t
	HZSoVs3veJny0VL+sdYpUNH8b2SBGaFlFgdSlAJTsYacM/aCpIEXCyBAKL/hTp36
	hmqiXw==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwda18tq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 14:54:19 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6a0e3320c53so4457843eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 07:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783954459; x=1784559259; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ePg30Dj860EoigB8zsOGgFL9B06gE/0H9SqHIRAB5OM=;
        b=kSh9B9VdKeb7HsaeusxRVRNBFD6MVn/chROzq3rDtD0y7/jq94XQjttmBGEvE11CS+
         T7wHCBMDrReczCXiN6cVnKwaAswbtsH9i0ArIYthfD7kfNCW7NBlVIf/PHnDB0yUkjbI
         D7Ee1T70OXHtTRWLP3FhfbkJlmKZuYk+jg0D2QPmLNv3fKtiA1rZ2aR26UeK68i/1Ij4
         glV5PXCpkcw0Ga3mI16njAALpBp4wGKTeb/9n/CLr8KalqabuvuFWLnIHzjhcWYTi4v2
         av13yRzNnbiLEcp+UyWNVc/pNtQbQdE8qQIgpni0PNmOG8Cuy6gdE3ax41Z7FAE6ZjxE
         kpug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783954459; x=1784559259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ePg30Dj860EoigB8zsOGgFL9B06gE/0H9SqHIRAB5OM=;
        b=YmtJ6e0airwTJKKRE9ngb/O4CajuY/UFLlnd5DtvmQNZo/aFTAMAwcvbmdsUtlFb5n
         1x8vHPvaTnAyGAFcj/XSH3gRsyXRHOvBymHmx706wWfP2/nOOvR2k/34QeB6HeuayDk+
         rSp8ngpRorzQlokpqAGMYb3ECPaF7qYUHwEj1CM93K2XMOS36Xl2rp7LY/Pv1+j8AMXE
         JY5v3Bp03FvusRm6T5V5M7f+vyn90kVmIHIi1R+eZXEJT+fV66UIkbFfCrFnyV38N+jV
         NK/y4Qf7e3/HI0wfiPVn8DiTKUNlKVEHPkJfRWj+56l5Gi3lcCDrd0+lwNxIRa4ARKrE
         B64A==
X-Forwarded-Encrypted: i=1; AFNElJ+Y99m2323Va2iQynL49irMNhgC5hB+HcOekbBurti1pdUSl7Egspr5Ia7wRuJBpgPgFYBDwwZcRmctdGwK5JBp@lists.infradead.org
X-Gm-Message-State: AOJu0YxsveouwYaxs8muxKdR5aZoPLMl/vaF4hS0aMOEJ8ApXI2zTkn/
	Hs2Um/c1yXQeNODq5qrHWwzUgL0NydoFGosQFGwOJ9FIMwHWHh1dp9qTFnls/UqSmolXgFalxBG
	QT4aN29VSP1n6ruyCNECUvXUFUtyErWGb+kOrl5sJU7d9bAULP0Nc5jddbPeoUP8Utzasy4gJM3
	drNg==
X-Gm-Gg: AfdE7ckk/EO+zTT6qgGLCrTLFlFAFi9X1fGrakCWRsPDvmo+YHtCHBbF+DMAlfnh9JF
	IR3nK8jBsgg0wdeoCDfKOJsQ0tcpL6Cw4CJKRcLGxparRyKQ3dlkB0mFBvQPAlnJnVlYaQwonmM
	qEDBqmX2+8W85m+fPVCtKa/hvMZLR7x+Y+KnW9kkFXAV3aA4QGIqnP4zYofpBc9HjrcQrzBuNej
	E3v3hTKvw0s5UIqtB4ocJ2a4cbb3gZ4xixi5EdDSD1VysUQTFN5S5YpILq7jMTc7vZeXvltA6uN
	ot1IIhlK9wMdsE7nXN83lN/1mGzOsc7zFOsAsQvM0Hc92JE56dII49QSngEPN4K9CSJCFXahSlc
	zahp4lxudEW5WtcXVzLUryvGTY5V5psE/9oM=
X-Received: by 2002:a05:6820:a08:b0:6a3:21bb:17b with SMTP id 006d021491bc7-6a39a8348e6mr5633450eaf.58.1783954459179;
        Mon, 13 Jul 2026 07:54:19 -0700 (PDT)
X-Received: by 2002:a05:6820:a08:b0:6a3:21bb:17b with SMTP id 006d021491bc7-6a39a8348e6mr5633426eaf.58.1783954458738;
        Mon, 13 Jul 2026 07:54:18 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a38e9bc8casm6728746eaf.2.2026.07.13.07.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 07:54:18 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 20:23:41 +0530
Subject: [PATCH v7 03/10] arm64: dts: qcom: milos: Add power-domains for
 camcc and videocc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-b4-eliza_mm_cc_v6-v7-3-4d91bcef50eb@oss.qualcomm.com>
References: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
In-Reply-To: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfX57mGCpQXiU1K
 1xkKYaumP6MZHrHYh3QdAtXEvzEBFMbVpRKJVHDz2uyMs+N7926kZtXsKQ/pq/TjwOxj3h56cjy
 yYmo84ZlRq+xDWJB6FughUviy+wkz0Q=
X-Authority-Analysis: v=2.4 cv=cNbQdFeN c=1 sm=1 tr=0 ts=6a54fc1b cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=zrNp7rCLQDew2w7GYOsA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-GUID: dJgIqeUnYZ4FNDIyoEU8iENkrymKLIcz
X-Proofpoint-ORIG-GUID: dJgIqeUnYZ4FNDIyoEU8iENkrymKLIcz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfX6n4NL2qbEyNv
 yuSKu75lE6aZ2M2B+m1+Q+8Dggd+//Dj6T3bfGAHVkwdnMo4bDwQOc+qAlbkEYqeMpRHQgi0qo2
 a9OrnKaZqx7L0iAvRVhYALscTe08eEum3FyLWg0+tLTa1kctmS0Jz6mFcBmq2GW7fWE4NkeHrF2
 Du/qoCihk8XhwpCtB2BBm7lQR6phXhG/Xyodp5StUJX8bof5qEL4rPfBWvwv75SReco5jpUO26y
 ySMdKbcvPosZGIRkOP2eXYFY5QZFFzikYp6uAFboBTPcdVFFxYIhe190w/GmmP0VAdsAl1qH7aA
 h2JO9EC01aZm1OBDECCa6JCoDwsay1AFPKYpVDePA0dUFEGpAXS0jVl7NPxJ1KGniwx+Mqe2ALj
 5kiVcWU1xMt7Fdpqy9LwPUR5YmPMAqkRrOfBJXnYMwVUoSiYwSQo8+0rAUcjPf2Y8UKR9632bx1
 AeGTaIra5Cnzc7RfNGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_155422_126315_41C7C1E7 
X-CRM114-Status: GOOD (  14.04  )
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

The Milos camera and video clock controllers operate on the CX and MX
power rails, and require these power domains along with their
associated performance state votes to be specified for accessing the
clock controller and its GDSC. Add the 'power-domains' and
'required-opps' properties to the camcc and videocc nodes.

Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 8c92329889538f0d79f7af436898e3ee278e361c..7c42d6c89829e4bf5a2ade64018623e49623462c 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1892,6 +1892,11 @@ videocc: clock-controller@aaf0000 {
 				 <&sleep_clk>,
 				 <&gcc GCC_VIDEO_AHB_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>,
+				<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+				<&rpmhpd_opp_low_svs>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
@@ -1971,6 +1976,11 @@ camcc: clock-controller@adb0000 {
 				 <&sleep_clk>,
 				 <&gcc GCC_CAMERA_AHB_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>,
+				<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+				<&rpmhpd_opp_low_svs>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.34.1


