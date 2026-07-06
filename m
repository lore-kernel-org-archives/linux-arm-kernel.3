Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB9EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 21:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lECXM1p7mMPSbcZ5Smb9oe9AFh1hLoc+9PilQyUZhA8=; b=gsq/UFm/93IO8Yf9V3WxWPQSZv
	NsxP4fB/pI7FGxBwI35np32onGZNyzArNsz+9qyflzXu5bFDgBnOQl8fWGGr5gh73kmgApSgOHcoJ
	If8xy7Kr2+zGzebjqZ7eWMIkGixsbUV0vgjP3tulp4GXXSD+EIYG8VImK9rcpz2fRHUWfVSLRyvW4
	fPm7DQWOrJU6xu6E9HcDxZcxqKpmjRVz1J9qwl6qJwYe+LaVp6fsf42+5f7f/lKDeqQcHjL6zlpBC
	rKo1EQ1MfRTzRE1JKyFZ+W/zRtx6pD0DViH1C+tYRcLwH4aCIoUvRoj5TyohjVzfnexyP+pk4WfIf
	GPfV0Qvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgr3w-0000000Dezg-2IrY;
	Mon, 06 Jul 2026 21:41:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgr3u-0000000Dey9-0J9E
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 21:41:11 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KEO591613962
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 21:41:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lECXM1p7mMPSbcZ5Smb9oe9AFh1hLoc+9PilQyUZhA8=; b=njTE8qK6HOr/c07s
	nWJ62yK7y5zZB6HxnWuxRHGIbpX/GR6+AbzabIh7+TiSZ/sALesKBtbTUhXWOYaX
	UCSkt11/mJwBkA7ieDsiwlbciJLTKTLnimAuuNdf9RDmzLD5Fp4G93Ory2NbHBTL
	kJnB55MdwG2dWytvowbRjALalOlBbMX9diBjsjs2I3Mh0pu+byBkPe1A/NwC2pwh
	l+9/FfX1GWDqrJJSGektaCNA5OubT1JrU9e42JwkztuwpoLVhM6xo4fhM8jDaL3M
	Dwp0AxiHrwiIQJO6GlqVggp0tNF5uOEaMW9qKjRWiQIJpV42fSYUm7D0D+M7BQ9y
	sJLZqQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h53dcc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 21:41:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c354050c34so39179465ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 14:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783374068; x=1783978868; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lECXM1p7mMPSbcZ5Smb9oe9AFh1hLoc+9PilQyUZhA8=;
        b=J1s2F9y5ggmxQ6r9PX4W9meF0ElpueK8zuDVvEA4DiGz4GpOy+FIgaeDsfjCDl6NsM
         5oRlP0CTD2jz9j1JEwN502L6wTcmas39PZ2Wi4Adh5T4ZiT2aP0QxBuLCFvGdkOr/w1F
         V0o0J/lneRN2kYH6hrlTi8kZFwjAYmNxrOeLBNvOBc5enGuRSFz2GezrUA3DBr3MAPkZ
         bwxlbfI2ltx/oXoeDJoJ3BIVxT9fc/1GImnqTmlE8zCWzwhlDorYYX696imk5m7Vb1oo
         bNqc6uQS2utQIBhDRsgXI8ZLQd5LKNfdHRV6/n4ZmbDOB/2eyF25OTg7v8czrBQFrhYi
         NSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783374068; x=1783978868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lECXM1p7mMPSbcZ5Smb9oe9AFh1hLoc+9PilQyUZhA8=;
        b=cCu+23D/U8ynZDLEIIJzLPkyykwG0RBBpwBXuabl+YXuQ8BjrbFLpAxASkkfsGyCQO
         220A/Juux4IDQLFMfpq+1rTNQjKrcceJ6Nvou1O/QGvn3kfhnrKssgFotae/UNbiJGZU
         Y6MD6HPf9aOyoGBs0tBS3WcPJO41ZmJzZ6MiHpA4w2cY8yoOoSiem3ELL9uSV0Zcew8r
         pJoleUeR8VCFTbVgiIUjy1Chy4jMDw4Ifqy2RXgjxcZam0WnE0e9l8vCYjIp9cuXGzst
         Lv3MFakKe5UAzHEF75B7n2LOeOp1dsWG0TXjKI6T4qVtEZE54ShhqWr15KUBxCB8gv+3
         f6HQ==
X-Forwarded-Encrypted: i=1; AHgh+RrXrCjvYLZgIThsDtihWMWqiX36MfHCjCSygnZ82zUP5szVGyWcJY3LLnejeJzSLCkDjV/mDh7+2AzLlftRzHpx@lists.infradead.org
X-Gm-Message-State: AOJu0YzxKx+JBou8o5Wcc/Ph3stJJ/ghgOeTd1cBEAkAl8wlgfJYMNet
	7hTfCx2DvhIybT6bKZ9ieI69G9et225tjt7IuRygeXP4yczFrJkafcTlZ+oZ7dlw5Q+x2hoOnXX
	z8mGy6MUq4SrOOMyqXnwkbKQADXL8ocsdNoDFQ+aLKJiuB4mMGA/XFNJW79sdqTVLt7jMQmEyzA
	7rVA==
X-Gm-Gg: AfdE7clQOvYDcjeai23qOVBeiCj0iGN0tYWhGy277FPfydgCW5R7M7RPaUVfZvrixsi
	CGpvUiGYq1JGzxtTq5kph+KMDDt7L8LiD7UKmgNa7NXOdhhrQBVob9z5cLljgM4xEecV5NdEUcE
	q/cvoUrd45ah/eXlzCA+SB1wX95GdIOVjCreLr36V1viVkCVKFmleutNJWZcfNf7DMR69VbeeNh
	aIhxh+hqR+TiSd5UNCn1gqRbEvHXPAa4MNV3I3Ilrrac6lb2a0F34bdJnKB2zUJUuyle7UWuNc8
	VjWj+PDtK04djwfwYok8cHYZ2C7hRhXy/7pcvtYqFw1b5EmttBXAtv+Yq541XHJ9cs2I0CL9x7q
	qh8d+vBOV7AdgxCoTo7oUS3znVghkOzI6LvM=
X-Received: by 2002:a17:902:e78f:b0:2cc:741a:ff33 with SMTP id d9443c01a7336-2ccbf07b90dmr27229365ad.43.1783374068140;
        Mon, 06 Jul 2026 14:41:08 -0700 (PDT)
X-Received: by 2002:a17:902:e78f:b0:2cc:741a:ff33 with SMTP id d9443c01a7336-2ccbf07b90dmr27228815ad.43.1783374067709;
        Mon, 06 Jul 2026 14:41:07 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm901810c88.14.2026.07.06.14.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:41:07 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 03:10:21 +0530
Subject: [PATCH v3 3/7] arm64: dts: qcom: kaanapali: Add QFPROM node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-kaana-gpu-dt-v3-3-8dac9a60dd5c@oss.qualcomm.com>
References: <20260707-kaana-gpu-dt-v3-0-8dac9a60dd5c@oss.qualcomm.com>
In-Reply-To: <20260707-kaana-gpu-dt-v3-0-8dac9a60dd5c@oss.qualcomm.com>
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
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783374032; l=1140;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=xlkJOQ68/B3gMybJ9Ns4FY50UaqHntYHUufy67tsBxg=;
 b=7edwsEeVv8RHFs9wiiykhb6VXFeyYOH/HK4hwAwFZ0IHw5gWNb6aDpzyhjQU9h/vPFqbm1TSa
 s9NCvSNutLKBK4+wkAdMeVSn/V2LA9Rq/OVHw7b/aeeMzaXAawE2luN
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: ijDZyJuaYLRzYp7l_S6c5UocgdQkqku9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxOCBTYWx0ZWRfX/bKCVgMIL8LZ
 +kSMRF1BJ13il/dcQQEoPzJx7CC4U7qxKUr+ngovqDO2hPccmVYI8hFMJQHC7qltdF3Usea1OL1
 hG5ajPRcOZrSU5bTeQu04U+8JFc4gxU=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4c20f5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=doS3iEISOceegCkkCwMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxOCBTYWx0ZWRfX9rhq/l7YsTGC
 36LMuwr6L8l6ipOr/CwAKbSPf7JeqvJaGdR8Th+Y2oQ4wVMAkLYidE6MywwdqGQV3nwVKluyNHd
 95ryMm0iQ6v6zElgJKmus+8I8uatfKkZJldsVYqlGnkkAdVh8Y6pjvbChDl3UddbwVKIe93v5R/
 PsTMbNaTzABCqR0hYVGxiZR0iVSEk3ifkhieGNNLt9ahBuagQG0Q0O3/Q5o1HmJWDoZ7I5/cBHd
 B9f0xby7HJqCQs5RzNVlZlFrxlOwSAmItLKOzuvYgKoky45RSd+NouoA5HWyiJK7XPBXMxcT95G
 fNY256uNaiElcp8G2weyU+IlZ3cDnNJP8PEdh3yQprCND15Due2s43leExaovjpw0391bADWdCI
 AppI6Bot8T54JbqDlxD3OpcqTuhll6RVohhQF3COL6MmG5g15Py8NBLui3v1gDNhbp86ORsNA6m
 ZSE3eua6QLVzqEAefYw==
X-Proofpoint-ORIG-GUID: ijDZyJuaYLRzYp7l_S6c5UocgdQkqku9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060218
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_144110_241366_9EDFA932 
X-CRM114-Status: GOOD (  12.23  )
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index a41962366941..2d0db71cabf1 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -5871,6 +5871,18 @@ rpmhpd_opp_super_turbo_no_cpr: opp-480 {
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


