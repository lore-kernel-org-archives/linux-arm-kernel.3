Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F2BCCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 08:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WRJljLs0mUu2LG8ESeBqv0weK1tocDM94Ekh5Hl/RQ8=; b=t0+kANuVG9N0m1bb+PM0dLYs2e
	dCLKCrjhAb3AWOyhA44um8x1s2ln6B+m2KJJhKRCnzGDgEcewUb22AvIV/ZXBQcGLZCS4XaFIYAo0
	lclh3cdfxtbPpE5mYILcIK+B7SzDu87gqzgMV/pvZyeubl5jvNlrP9CT7yOEaxqzLSI8ytz5GkfTu
	pYAB0xx1gEjfydT/4xwbAk06cuM7Nc57aTeZaBAPuHV8lWDzLPLN9ItEcXXhKIrg7x/YonvuxqEJM
	1WOLJImssLCdEVkcDSke2ZLj91HgfulU/271uy2aNuoSekA6taBeWK7vxN3mv9B4IZcZa/7nlN1EB
	yKUK27GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGC8J-0000000BOHh-38F8;
	Tue, 04 Nov 2025 08:11:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGC8I-0000000BOH0-0mOe
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Nov 2025 08:11:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=WRJljLs0mUu2LG8ESeBqv0weK1tocDM94Ekh5Hl/RQ8=; b=j8xIHkTJVHWcXM9OCxlLX4ung5
	Y+zw3BzG7t6v6p5zcf6AJhm0v1CkuSnOHNY9m6U5feL0dVoocHFOJEECtEvOeuT/HP+jnJqqbL0CQ
	PM6Szc2WWDHaTeF1e+c++z/JThCe7xViVEGjKPBxFKNsNoL8vKDi035mIaX6ibpS0NRnFCmxN3KpL
	i8h/Y34+kns+d677zq37go6rM7ByEvT3f/1tFKjfVVREGvmI4j8N5P+zSaeU/V15Pbx8RuIU5xD96
	Azf2MU5nk9aCW2FUlLiJ/HT2quqR1OsfY/L7UbTn+4bfTfWlJDBVS1bhbjXonjEGlDBXc2YLuV+hS
	W+Q6ho1g==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGBGW-0000000H5ph-46Xt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 07:15:43 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A438mID3595114
	for <linux-arm-kernel@lists.infradead.org>; Tue, 4 Nov 2025 08:11:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WRJljLs0mUu2LG8ESeBqv0weK1tocDM94Ekh5Hl/RQ8=; b=CEAq7DoPp+XPwAdV
	2tL1ElN/hNno6ytXqV0C4Yp+UAoCGKCjAJWby/NfqZr8xCLIg6D9KWRFXnEUeEq9
	Zr6zYerQe+u69gPW972IRuxHwdyrR09twK8uZf+hWYY2jTWV2TDVO6eZWWp9EE/1
	1LF92nI5AD/ixVv6jrPa4bovaLoU5CZJDKMI9467fneca2HNU6Z5Cd+08aE829mj
	J16Jm5YRyK42rkDDYi2dlzQuY8efuRcvHSbD8DNASeb9D+0FrHPgUgjx4CvBHrlo
	KfxHWHtWNEO0QUmh8JfFL7yyXpTfYZS2JW7mlVxLFRo6MbcejXDmtIElT7UWVvor
	hxknDw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70exj6dv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 08:11:06 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b92bdc65593so3909202a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 00:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762243866; x=1762848666; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WRJljLs0mUu2LG8ESeBqv0weK1tocDM94Ekh5Hl/RQ8=;
        b=POMFner5BSh79Ozd0x1dn1r6EuZh0xF8Kz54LV018SneGbw0aX2zozd8HuGjs551cT
         JIbHqiQC8OZby/W3GKXaN0k9kpHhjjEg4G0TLvOgKzrY6wqNLFlYKIP4SELM15tJ9WdA
         DMyW0SSklj/TiBgY6S9yY6lwC/bpd62ldBY/xlC23r9MKbROx9kAju5x5yIQAa3xCzus
         +r2j5BeaEoV9xx6j1ZyhKDklzl+uXR91BWS/pCrTZRE0+qyVo+mbFNe9u7s2QARLzZ53
         bGC6gXJbzLviJthWoxWoz3YYIi2JuI2rxgv16Lq9yYDwz5xTOfd5dGGchWqIJqAW2EYZ
         3uGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762243866; x=1762848666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WRJljLs0mUu2LG8ESeBqv0weK1tocDM94Ekh5Hl/RQ8=;
        b=LjY1Is4D52hwBLVJ9/52eSPTiD9fYIPmxYjuEfc0yq003xrmlhvwWmd/9Qd6Yg8PUS
         foPn++AiTIWF/l41djr8DZvxqCnH8YWhDjzUb452P8WrdYBCQhAhd6TRcl9uL4nk2Yqs
         7/7Ap0KNSTAcw5VJclotHr/z7g+mnDJCfEL7fJneItMzJH5MVL05dXNUahBTCl1aJGAf
         8VEA7HKbB27U4yVWUCYm027uPPqWbeMuzx0FfvTorxfCScJb77iHAY40aIo4zpbDHaY+
         gMxHNYjNJVAesdAqNxOtxra7J8NItAICzSFPf29MEWcKz1ThZ2DVFOmJMM4Sj1klYkab
         9T0w==
X-Forwarded-Encrypted: i=1; AJvYcCWkApcwtmYiA+nfqmHmtiyeuCeV2FaakefELBk22/Bom7Nl93xdnIqPDJ0fBvz2ELmXyeYz5MMrrHAjX1zXbvQe@lists.infradead.org
X-Gm-Message-State: AOJu0YyILGgkDvemXGvJxcw8lpWPCtDMMTg4ceWWQP7cdepiXvve2BiY
	u769uNKB+MJWPr1T7ocE0TNKIX9LvXr40bMsaoli/D3S5P2zFv4VhYviETYKNfd7J0HQ79O8akj
	4/MA7dP1AtP5KLG9TCJRAxm3kEn/M5fex3dFy36Jo22hHQEzFn6dolYGuuyz+crGm2WcSkheNs/
	4Vdg==
X-Gm-Gg: ASbGncs6ib8Z3J8IqUulGsyPFt3brx/r+s5U5MMy5+Z9ZCQaKUcLhtE3DOdKhKbYfzk
	EbS9ih9WR5+qQl+EGNVCMKiF4XEPuldjZNH28cRwgL8bjIBd37PpGc/Tl/1RolWwowuJTiN82gC
	EG0ZPMsF8OeUNludmKKvc6dPitaTdLFzfJm7XVODb6xcqkcF8TTKm5J+H+6wyqXTA78YNODrtJ4
	IC3j6vqu3DeNgGZFF6n6SJC1talSP0/V9NDok2ZoMT0cT79V3MldXpvVvYJPkyO5xrzcqO7RFUC
	8rlEfhMVk50iHxl8Zn7GtBmmxMbOUci/ZANfbGqy4VzX4hXJIvHgD17ZVRV827UbsZ2112zDZ2L
	vrXBkElese2q8QMAZ0rNcIdnivPj9fGmrY8Uv3eRo2D9LWuzx1yvBbuQzH2MXxQ==
X-Received: by 2002:a17:902:ea0e:b0:269:a23e:9fd7 with SMTP id d9443c01a7336-2951a3c0348mr202032715ad.26.1762243865605;
        Tue, 04 Nov 2025 00:11:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFoXB8HgwRYlpL5Vtm3CBcq32qQz0T4JFr10LQq9JcvSX1bP3YvzIC0+zbTeVSa5ABSv/mBRw==
X-Received: by 2002:a17:902:ea0e:b0:269:a23e:9fd7 with SMTP id d9443c01a7336-2951a3c0348mr202032425ad.26.1762243865077;
        Tue, 04 Nov 2025 00:11:05 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a7afe3sm16755885ad.110.2025.11.04.00.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 00:11:04 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 04 Nov 2025 16:10:17 +0800
Subject: [PATCH 1/2] dt-binding: arm: add CTCU device for hamoa
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-enable-etr-and-ctcu-for-hamoa-v1-1-af552cfb902c@oss.qualcomm.com>
References: <20251104-enable-etr-and-ctcu-for-hamoa-v1-0-af552cfb902c@oss.qualcomm.com>
In-Reply-To: <20251104-enable-etr-and-ctcu-for-hamoa-v1-0-af552cfb902c@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762243854; l=810;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=RRDIkxdP3/Y5/4hhAVkauK6PkEknJbU5v3IcJnyja+Y=;
 b=P4Hd6IiPf6FbzSCYsqIHURtl3nbmaS85SbXA6tLhD0FS+Z0WbLeogub6LoVircW7PRSrlrJ4F
 NAxAOM3tOFuDVRRNCiVJKHWusodh6Wi8KyRgBiov9U2IytZZWXlerYw
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=APHuRV3Y c=1 sm=1 tr=0 ts=6909b51a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=AruyFUP6G_q06T9m-PEA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: LkRKZNoM7rmcJpT-ZZNdGSJw_PGzmUlt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA2NiBTYWx0ZWRfX7TATX1RPdgoL
 7fOw5TwYiNpRgYcTPYbqx4MkFQ/AxhqM31eiwXhOmNG9Ozln++tHN0vKbZ7kfsnZZS4YCI1dohj
 TJD26gYOEXOoZRDjbMD4PPvlq9ZuHN4mowW6jA+OwJYn5wHQ7BvghaxHul69L7lbLqQAmfp6wi8
 +ZI8Esg3MLA7k+hU31HtwMfvZ3P7O/RcGzVyw0Inx4kgj9x1a9uC4xO5ZF8otz+jPtqhod1nY/0
 x4l+OsUCKPt2H6wq3QzQ5CAp1yT5gXY0+YPBXhGfDzV5d5jn+FTRt79TrQsgpbh8JQpPL92MnQm
 Q7JDpxArEB6qSlHMz6w0oMO1yTzzJZzdrKVS+TfjL13gXaaQ/4qQlJNjabPRLoM6o4amNghsN7s
 pLajAyl7eFOmMel/m+8Sx3Sh/XwRig==
X-Proofpoint-ORIG-GUID: LkRKZNoM7rmcJpT-ZZNdGSJw_PGzmUlt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_071541_494830_673126AC 
X-CRM114-Status: GOOD (  12.42  )
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

Document the CTCU compatible for Hamoa, enabling support for the
CTCU device on the Hamoa platform.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index 460f38ddbd73..57dede7a90e9 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -29,6 +29,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - qcom,hamoa-ctcu
               - qcom,qcs8300-ctcu
           - const: qcom,sa8775p-ctcu
       - enum:

-- 
2.34.1


