Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74876C61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 19:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5xi+B0+Ll3mZcfG/+eg8A4FHQwmBK5tcrEyuyH0+7VM=; b=RUUDHTK1EneqgAWlwgdH5/x3Pk
	7jsW2SxNlV7dNGlqOVn/mQFTNXkAsY/t/6jM1ucySYHtYEedTv8Zh+ldxSjZ6Ft6914aBjDn5ZBFv
	SNiR6PIWD3bTVBt83+1oBNb/KfHkEsEv6CwgSWhbGi3cpkS2qKYkJltiQPEo8oYTazytOnauXpqVO
	qZa93IG/5JC2jN2AKZVrHCNKIgE1SUX+K9hLHS87MEhfml1Umspw7G2abDkpo/R+yjNKNm1YrVNYV
	DssjcAMoZ7e9a8rDbs9jQ9QN9cG7KijJdZhsK4zuVJO8KkELYoY8F5+NmaawxLO/gmOqDoIZ5JOb7
	tF/sHzUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0Ow7-00000007Grq-3GMx;
	Sat, 29 Aug 2026 19:41:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0Ow4-00000007Gp9-03cG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 19:41:53 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TGx8vF1856640
	for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 19:41:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5xi+B0+Ll3m
	ZcfG/+eg8A4FHQwmBK5tcrEyuyH0+7VM=; b=p3EZEI+wahJLlLAViTQEiCVCq1M
	md0lpk2in8UEreKOrtZCQnBEEBUonkn4zmEdzgqm75dZzVktkSIvT8LMkstcyXLY
	isASibzCkuGavjS6bYfab9sSe65i6JSL4jI2GR5LcKjkzwioNbbS2uDcNBLOfIfm
	jk4EBsC0P90ROl0SCK7UGHottRCae5avlrlcuww3Is6GMNyZs97lHfgRsS5vcDFH
	LlRqzhYg/L99Ewyf7rFZNaXUDKokKam1Sm0qQcNprTMPBdKQusE33sVOoLfKk+vJ
	upiOR6VaExeO0GwSkujeDschrWthGI3sLvnLSJNCh5CYSr08im9dJI9F9Hg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbr6dsj5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 19:41:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a8b0a08d2so25265561cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 12:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788032510; x=1788637310; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5xi+B0+Ll3mZcfG/+eg8A4FHQwmBK5tcrEyuyH0+7VM=;
        b=RC8KbY7/Ex0JGSv5aZHea7euBBRUo+6FZulDnVEznlqVRLDtcO31QS30e/HNNP0VoJ
         0Toj8A2wfO0efD6CJWy0Qa6H96BiuxtwK87nQEU88yJxU8aA4BrhPa7mEz9Fki3ATSEq
         bQy3sCcF+vkhCGjiynUQV2epgNk9MDPdawkER5pH19bEzLoWU8ny8jJpm88LDwlm3/5+
         WjVtQDVuYb7SJBc6YzFW8Frms5LZOkQErJIe/jm/8pD2rr5Jl56ClqJlFl6XhHI0x27y
         e9u8JZLDCtl7sJTGXCbLYKVUExUNAnawWnfvoks6tHeKUxc3NQdL8/EWobVHcQ3gMlGW
         cS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788032510; x=1788637310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5xi+B0+Ll3mZcfG/+eg8A4FHQwmBK5tcrEyuyH0+7VM=;
        b=JX8w0Cytaq0NMO1dsH0dNHClPy1WH8InriivXU9LCa7Raw/orYpX1hJaL+HUcPiSpp
         j3VPXxsv6p8KnCPTkPhexO0rhweLqC94m0GXulhL2AbFIzqMG0LLe40sf+n42ILg/7Pm
         Yc2wnT7JtceLMbrCicN7Bn8Eyz6nrZS7dmiLob1bmmQPwvji1pExdqTxyGfarnRtNgZ5
         qqxPckawLYvV8jCi22X5zswD296DKPp44YaZz99uTf4Lxhnl5s6CFwLxt5Nr7pNimuhi
         Xk8fRysnIOYLJQ9FyX00JUASy2Be8mHhnlphZCUhdtmoGdktSorPLltH2SbUQdhhcqOG
         n/0Q==
X-Forwarded-Encrypted: i=1; AHgh+RpEsb49peNfURwglDTqoq55HKUUXqAM60WhQtI5khKdTqSClsSDY2c9g2JYmYfsZXx+UPaI+EUtEk/6C1zgJ3fG@lists.infradead.org
X-Gm-Message-State: AFuF++l5n1nJrpaCY9Z91b9z+u8/iJtzwjnkkyEubFsNrMzkkSpr/EUf
	HROZOJA2NzFX0QRD62yyH7cWMTj3hdLxrQZ+29fNVwN413H/GFzEHlAQy4QGARq2kEjj+Ct+NhY
	YHcuVIB/WwqnfdN8CBoLBNH3D18S/5ETI+OUjbAhlXM6KEpT/TTNkm5fM5yYAd8cba8mAhpVIoK
	4U9g==
X-Gm-Gg: AR+sD13b4tqdc8FNDi2EOoq1vJxbq+s7Mh8nT/5/TZ/T/F8YssSi8KdGMB3XVSN/l/A
	mJWs9Eu7zyalqwXpHFaHzDlROe28t6QcZi0w907yjqzxLChNdqjHKA85W7stIe8wvaa2sEtHfnv
	Q7eZywN6+erLxvMmPGomijI9uFHzNZV38HhwYc8hlfuyoJJUr3k8IrEZgU5e+TGHARYyISZqYPP
	7DXtWPWKkQgYHc/ntq8yx8YZ790amksWTh/cqyS1T37lZdGOj0thi41jXkwc+vjRNF4pE22G/35
	KcGMk9aad/xGMzKyC0hC+AkXZtaz4SVhhlWS6ft1twqPPj1tWqhnCczQusW07RDH1Pccfo70z/b
	aTHBPrf9H0peGUmM=
X-Received: by 2002:a05:622a:1343:b0:52d:f12c:59ba with SMTP id d75a77b69052e-52fb960c788mr178894701cf.33.1788032510512;
        Sat, 29 Aug 2026 12:41:50 -0700 (PDT)
X-Received: by 2002:a05:622a:1343:b0:52d:f12c:59ba with SMTP id d75a77b69052e-52fb960c788mr178894411cf.33.1788032510136;
        Sat, 29 Aug 2026 12:41:50 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4c321184sm288399155e9.11.2026.08.29.12.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:41:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: actions: Replace spaces indentation with tabs
Date: Sat, 29 Aug 2026 21:41:42 +0200
Message-ID: <20260829194140.108124-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260829194140.108124-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260829194140.108124-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1831; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=sgLtJXmJs78/RqhOSizJSvU3iXqQ7UznIWasIAWICeQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkzX1OIaEKat493ZfJZkKvah8PeFFF/7aGruui
 vp3Dgo8mq2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM19QAKCRDBN2bmhouD
 1x+VEACRq8VclU0kLvbnL1qfP+IJzxDFe+osyLXSxiADY0Q4a9co4V06j5PqZKRvC7dKYi9s1br
 q7ewYlL7DsgEmZqG8JTvuM9AugbCqYAVpTUWY/5eE7ZZ8S5BhBu973o4f4WmtJlZq3ZGxwVvDeu
 O90HPuQGbPu1emXI4CgeQal4LXy8lmIV44JN2fBwry/CGEWVN0cIB7UonPe0Mmwif+RKPO+1I9w
 HGR+wrlhPT/9bIWOdYIjMZIa+AAvm7ZgOfyiH2DFoCSK2NcVfmwTYHN5pmEipENanyOkZgxEAZF
 jUQIH5AcaHrytjhZQ5IkRlXXqNREFRbJkuJKfj9uj47qnsqsiH8pf6Kzd8xbe7tBZelqwP/b0rL
 u0kmlpF+KC1QPBdKFH033MCANf9QfwpDszJuOpxG6EmqifhV6V6CaAv402jZ8jxPo/0Q27wJatx
 VHnHTrpSnuGqnlHR4xjzxlFEq3frZGHXxOhgR0L2P4Yxv7hQHr/B9im0oReANGcufU2TvEYz29A
 M+BcNbHOMfOJRNTV1Ux670tc/lZEZfTzeDop0/OLKHgVklXyKLMm1HzO2TesuRYEn8vzg133fqM
 NKRBkHVBExufNIscgeHNUicyAkAigyYXGGkHECCnPAu78NwleJ3/RzKq8nL8zILg3Y1uO/OEZdL 2ot5O7YB4Vzmbxg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MSBTYWx0ZWRfX+44Z3/gYd1Xc
 QgmmTUBfg+dbA4SPf51Eo3fYwNNtmExa2u8DpVDVRKTxCoLqV2NvWbjQE3ipjzH1csvBJwjM9Dc
 Ib9d2PT2bNy+aCKIt4HgNxPCLL6mB+afD0kOVkMcGSZcBVpeRIWGsYFGGhvfPISI9elauKwslo9
 TTByJa//SM9p03Z1V7ycuQ46Kd/nD+WpflljpPEVWp1SGcr3UHSl5Dlb5Ie6vAQeWmeqs/5qWiE
 PXWG1ooUUnCRwKf9WJSeVSADdeCk8uDUMU9vA7C8JQ9ziLe0mZy1HEu/PBAE3NXtMKY42dEB8xt
 rqTjiRS+DUD2SLGlYRTJaiOih3pf+x+abNluMuRIY8W+bHz+s/s8+tRCajSQzDAT68pCR6RRZm0
 PQ6eqK53/oVGDP9itt4sJgHsKny8w3xKZ4KgV0AY06WESlsNZv/vhG1UyiwCjlyZePR6zQBWgxT
 wG/rsbXVvKYY+517Q0g==
X-Proofpoint-GUID: rOzyYTyUv3QUTl7UToyceX7xRDseQSI3
X-Authority-Analysis: v=2.4 cv=Zakt8MVA c=1 sm=1 tr=0 ts=6a9335ff cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Ta6ShJ3tCWu1s0TIFCkA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MSBTYWx0ZWRfX+nUR6nXYRDLH
 mH8TUg5OeCKBZ4Sw8e9vlMPSws8cyOhE232e5KX1kBfE2OmSyLyyOq2lF2Ee9Pi/08E8k2eXz+B
 azl1h+9z14yaIQsHR2pcn42NnIqTzzs=
X-Proofpoint-ORIG-GUID: rOzyYTyUv3QUTl7UToyceX7xRDseQSI3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_124152_071190_A91E68AF 
X-CRM114-Status: GOOD (  13.40  )
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

Replace excessive spaces for aligning indentation into tabs.  This will
be reported by dt-style-check ("[mixed-indent-chars] too many space
characters in indent (more than 7)").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/actions/s700.dtsi | 6 +++---
 arch/arm64/boot/dts/actions/s900.dtsi | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/actions/s700.dtsi b/arch/arm64/boot/dts/actions/s700.dtsi
index 2c78caebf515..3d114671b901 100644
--- a/arch/arm64/boot/dts/actions/s700.dtsi
+++ b/arch/arm64/boot/dts/actions/s700.dtsi
@@ -66,9 +66,9 @@ psci {
 	arm-pmu {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
-		             <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
-		             <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
-		             <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
 	};
 
diff --git a/arch/arm64/boot/dts/actions/s900.dtsi b/arch/arm64/boot/dts/actions/s900.dtsi
index eb35cf78ab73..267ac2dd5441 100644
--- a/arch/arm64/boot/dts/actions/s900.dtsi
+++ b/arch/arm64/boot/dts/actions/s900.dtsi
@@ -66,9 +66,9 @@ psci {
 	arm-pmu {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
-		             <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
-		             <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
-		             <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
 	};
 
-- 
2.53.0


