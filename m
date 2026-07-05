Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF3CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 08:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B2tXzOW+S2Yl0q+Uq06qicu2OVLdBJOKKhZnmt9rVFc=; b=Wc4eoG2JiS6cTkHQvkRT9ccyLe
	mho0uMu32+oO/apoWt1BnjVhYIOgyXfljjIAniVZniNArW3KG+6MmWICdSLDgYcdscqDCoz+B0Bwb
	WwvpwuGm4MQD9mkbq+rTCN3uwStoD5+KYpKjp9K1MMduntgMUdvlLDFaSz6XbcORaL4dywDTT3QBa
	FxMmUoYiBXHmznChcgSWGttLKoQjSfLYLaQb3XM+o+tT5ahq5hHIa5U2oVmDJ6WAqB3CyS/LPvbVp
	NBY792anikgCHL6utnmTiA7oWIm6nm08/G+vZ1EmqrXu2vNfFAHBOCbQOFrYXLVUDhrWyWS63QvhC
	qnzYqIEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgHn4-0000000952S-2FeU;
	Sun, 05 Jul 2026 08:01:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgHn1-00000009515-3oqn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 08:01:25 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6655v7Dl883967
	for <linux-arm-kernel@lists.infradead.org>; Sun, 5 Jul 2026 08:01:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B2tXzOW+S2Yl0q+Uq06qicu2OVLdBJOKKhZnmt9rVFc=; b=VUdwCw0cILZ8JMr4
	3q2tqSbWj2siraqnE8Gnpv7whpKslc9d6eoRsi+NbHZmhTUdXk+w4NjYYp9dHmcl
	kWeHfhNilPqHWc1uYnY/EqWiA2RCxcx8H9zHxFijKH0xEVPjjdMWp84IcfsHtsQ/
	qRBgwoUpyNkqSl/7A/3mooRXdysh98qMNDe55QMtytTRkG/3uCtLYP0nJZg39dcw
	V4ZTJ6vBLZwUthTvkMP7nH7ryE4RvGTCAqNCLNtj7o+cs6u0GIPaPicWyVyqj35i
	CjZm+Cn+7Q/c0p3+yynKA6Z06hEwlqbdDMyk2VZrMafLUV11hsuLr16B2STe8iql
	ni/eHg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6t8uj9qa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 08:01:22 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-380c178acfbso1639648a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 01:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783238482; x=1783843282; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B2tXzOW+S2Yl0q+Uq06qicu2OVLdBJOKKhZnmt9rVFc=;
        b=Q7iR4FxztUjSvZOMZUa+nyQfgBjZzvQQB6e/b+E2dOhe8lS7rsKOjL4JqTjNEugi8i
         mQATUcl+NbRt+/p5XYzjdV1ZfjiX8zNbUhBhWD52MJNHdEOR+JDxlYSo+KgE+5H6g1ii
         tx77uPPl4wg7ux6HN5oV34Zj9GKiSi2h0Gne3JzhYhJZyC01V7dP5Kot7NqWU9opMe9J
         YPyo+/svJ74q6i1hMhldcu4jzl7DIAgEYY3pVDTQDEpmzJXOLDmHMSpDP/28JdB7xtj2
         wd0iVqeZWkC+ovTMxGQT7X7kCKzdMgxcygesabs8aXU5AceY75BjsCDB1kl9sW5f2CVe
         lDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783238482; x=1783843282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B2tXzOW+S2Yl0q+Uq06qicu2OVLdBJOKKhZnmt9rVFc=;
        b=QoCGgaSEQxsdD5QNJMU+/eFCnY0nfQ98ZnD8nCgAXIjq2YQrxPrIdOeq3EG0p6i0kv
         d5YTHvT/zoLJtet69w10i8amg8yM7Pi8hprnmY9gZVfiV+aU3wFIsw0Otfh3KBjshmaZ
         UzvKBmwgw/u2kPGu7gW79LJd2Wsykp+3AqRco3RMKUKyCrYtcQD69XBSvjPS1zGkUO/i
         dPgTPNDHqcT6w2VuCg3DM5/CRu3WAIoO+NWmc8C4/5rTaLBxqAKRMeIStLXtGn34b188
         Z7vPJK9R6KRyhdt9D1WdsL2kWDG2eXlzZUb03tOj+aTqr34bmdJf2Ua7r95ZhrdEuj4d
         jQzA==
X-Forwarded-Encrypted: i=1; AHgh+RrnElCNGXBZ/74St8PfPZOsumPDMOM4QsOt8NyRhKaikgydTJACRJVCMkMDeRrvWQFt870Ohl8DyXQocg1fKpzU@lists.infradead.org
X-Gm-Message-State: AOJu0YwyywRTfsUd5YODqnyE7mtU2NZ+qWIC43Y6qj2m6GRxoYPBv0TJ
	WdVy1iFNv2BzUv+q/K5V1qsYgQugITqmFngj60ocZ6GFQDz1EmvYUTLKBMak0LVZoMuFVfs+5t/
	EeGyhHUhsjkI6ooKnnTLdA4CmtR6ftjubDmJP82nfVYDmug2Swl70fiiSi0KvRzau24Gl/xvq3j
	v60w==
X-Gm-Gg: AfdE7cmnFta9z/bgo77VT7tb12lHL1NKBRdpiaAOKSVPK4FgRltwA5Z+ayPhWpc+gQf
	BxrzLYM9AzGGKh2QVq2heq+9v4Kj5uc/NwDPkaaiFjP+8kOj731Drnb3pjy83mKvGRH0KxJZupA
	DHZOyZJIQfJPCuihfuiHEysup/5s5wbJS46J/cizOuzO4rWHmTkRtpC1/O6TgU37j31m88Hips0
	v37e7f39Mxu7ReTbohsE8CpBP5BDgU0Iatkb+d7SDDw7GH0hbkqEjlSWLb8Ku02XUBTO8c9A7H7
	ma2FQwLXIiDPfP6ycdxHCMhAC4QzhsDZiF+Adkbi7MhsE7Jib7lVhdQvg04qOXHUFun8UC8K7el
	oV9LnVn7znaJUjKpxhwN8UQufWSKvwFPmrVw=
X-Received: by 2002:a17:90b:3808:b0:380:8b14:d8e1 with SMTP id 98e67ed59e1d1-3829effb428mr5736442a91.24.1783238481379;
        Sun, 05 Jul 2026 01:01:21 -0700 (PDT)
X-Received: by 2002:a17:90b:3808:b0:380:8b14:d8e1 with SMTP id 98e67ed59e1d1-3829effb428mr5736407a91.24.1783238480880;
        Sun, 05 Jul 2026 01:01:20 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3113c88041fsm7759179eec.15.2026.07.05.01.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:01:20 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 13:30:08 +0530
Subject: [PATCH v2 4/8] arm64: dts: qcom: kaanapali: Add QFPROM node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-kaana-gpu-dt-v2-4-6ac53de56314@oss.qualcomm.com>
References: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
In-Reply-To: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783238440; l=1012;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=Rh9iMVK1VvEe82MbzfkSioOLphwmD07vDxc9YOX1LZU=;
 b=QirepiWSprygCdEJpVf63TbnYQtCy6LXKokXYpNSjgpaqD0KgQ7t8Cn3O3YrHCcD8otxXqu1H
 DORiZTSw4phC+My0GtSwo9tg4NvRUijt3W7PfDvv2IpCpJBeYGXq650
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: TgiAF7XUelPoeKTSZUHvu0kerwr2Zjua
X-Proofpoint-GUID: TgiAF7XUelPoeKTSZUHvu0kerwr2Zjua
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4MSBTYWx0ZWRfX99hn7DDdSx6M
 RY5Ts4YRjt5RvSTbc764N830EtR+XqsMDfDIPbaHAeZuAW2I0HXqTPmxD+wEQ47O+eAKNrq5zbD
 fHPK5SIb1P2oWffMmjVCwBPy+NpzjhE=
X-Authority-Analysis: v=2.4 cv=MZxcfZ/f c=1 sm=1 tr=0 ts=6a4a0f52 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=doS3iEISOceegCkkCwMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4MSBTYWx0ZWRfXzZyv8U1EBk6y
 VsI9Zbn5m8lHNf9/cYfxfNJq5Vgx8yCU5RjlWCXlj46OlVi0d1RmYOenmlySK/LtZO3Mbb1A6zL
 tjMkt126VFRN835T67Hni2HYmMaKLh9c8t3Vl3jglTz/mYCWnBDc3YaXtWmyvp8OLhmb9sfO2FG
 L28DnsleYubsPegW6T6wTLDPlUSxKoopUnrAjKk/IU67lMVCd38/jGUm0cZs+Cl+b2nnbsgY4PM
 VAIfbxNd5086z5AyEcDZo9Lj03qMJzOC2vKKVkOlf7AL+iRKlLXOyp4MtT95Hsjd89YXyhpU5nf
 6N5uHD20JBIH/VA9sf5DbN3npJjBuZKUYzqmhL1iIiN5/yJHSlESXquIyoYumpSEOFt2bAWOvI/
 VtKK71wsjK/i0Yw+otim6Jkdxm7VicbyKBMeJUH2JFoMix2iYeSI2wkyg+c0FgudGgFAIdazuly
 BYl4+/y6UBow9VAlZlA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_010124_076871_AE5EE6C5 
X-CRM114-Status: GOOD (  12.08  )
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

From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

Add the QFPROM node and GPU related subnodes on Kaanapali SoC.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 19eceecc2a19..8f71f9dc26e6 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -5874,6 +5874,18 @@ rpmhpd_opp_super_turbo_no_cpr: opp-480 {
 			};
 		};
 
+		efuse@221c8000 {
+			compatible = "qcom,kaanapali-qfprom", "qcom,qfprom";
+			reg = <0x0 0x221c8000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			gpu_speed_bin: gpu-speed-bin@142 {
+				reg = <0x142 0x2>;
+				bits = <3 9>;
+			};
+		};
+
 		nsp_noc: interconnect@260c0000 {
 			compatible = "qcom,kaanapali-nsp-noc";
 			reg = <0x0 0x260c0000 0x0 0x21280>;

-- 
2.54.0


