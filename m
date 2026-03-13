Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F9CF105F781
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 09:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q+6sbBvItLVDaaK2nVoqlOqVJ4lF02bwo0WaOVku2Og=; b=j7FgsyUyM2dMuXaFqjWr9GBxAY
	Bs9p4YUpsBFgJMgnxLUHHSqGbJ/9mta417tRhet1e14hAGscsXn1DuiFxSxPDUZZ83PmWfRluOJ40
	3DeLqUZs4G+fQ3VA4zWaXwTiO9GmyPpKvTcRB/JvB7Ac1XtLLlLoWhnW7VapbZyIYklHAYND2K5zT
	Tk0AypLDved2ydlU8lJnkXEK/lsoTFlxPXhvWf4FGPAuY57AyYwuaDxi8uYV9q+P/9MGWMRF+2VTT
	d1VhmKEDo/LcaiSo49yzUxXUbS8Do2M09UTKIPHYME1NDiqy2Z97H0gOP0RNp1Cnt0F7rqoOBNv4D
	144twSHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yQP-0000000HLKF-0uKh;
	Fri, 13 Mar 2026 09:03:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yQM-0000000HLHN-1V5q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 09:03:15 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tjvT3466896
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 09:03:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q+6sbBvItLVDaaK2nVoqlOqVJ4lF02bwo0WaOVku2Og=; b=NQJ0Oq2bkwRyQVLJ
	BR1oHmMsDFtWsex7Ume+LsDBbjvLk3yfXFCOP/VwtGecbTEF4KBZMhhH3JUTPqeH
	ESqBBfG5A2XRGNczBEK1R3cXtV7si+QGr4qMeY5pc1JGXOH/ow5PjKDC/sUNT12Y
	Kpv73SjimpWogy6DSkQX7Y2qhJrrO2e1GqTalcDsuThr+3T7CiyY+nhZstG+LX/f
	NwczdH+K45T5zlrztpghLcI3DqB/LTT6CV/99DO82vpgFS0lOBshZsZW8im1y1i8
	aK7Hm39aCk2llXt3z5YrV+r6JMmv/j9Y4KyvPMRfqTJTWYtdKaR1e+nbEJE7FOMl
	McUiuQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh60nbkw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 09:03:13 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c73c065dd15so1019642a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 02:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773392592; x=1773997392; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q+6sbBvItLVDaaK2nVoqlOqVJ4lF02bwo0WaOVku2Og=;
        b=X9t9dR+I8jD37GIOXUZdUzmKfBuqACRySRPDMRPu+aR+EpKKv36VcZV3zFt2rkRC6v
         MCxdYRn+o39Ok/95/uOVZIzexcD5vDsjYLFvbhe48EbUpHvH04OZY5GKnCI/mFgR8pfX
         uMQGAnIeEnDOOlO9i/DPlbcsHD7Ska/Yz3COXivypYzlPioALB7SjaMCpx23tjwAAZNH
         XKgkfASG9xdZvxz2jQ5UU4tQH9UjiGaF9+n5jzMDQ+wjwAP98M5Dk0s5BPHANWexPs+3
         z3PiapknbSpzGUuPpkZtzIksEtyK6uHU4iGPSNguG1Mb6LWfjFrXJqK/i6SF6o1qt6QV
         UzHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773392592; x=1773997392;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q+6sbBvItLVDaaK2nVoqlOqVJ4lF02bwo0WaOVku2Og=;
        b=NCum+Mol8dWy98NZ24cEyk49IOW/rS0HIM1iCQ4/XuShelAMbfRauXiO+vt0p98CR4
         6IEb2XPw8HPk61HVoRWuc0JasrLZrdEJTGVqnDiXJZnU0knLy5W8hA75R12Mc8glgh6Y
         nMUDR5e1Ff0FJ29CVDnc1TVk4eGegC+fzE5dqpmLrGlpUs5rJt8uTheHvpxh6Ok9PhZy
         ZbH61/2otUrq9zwbr6LHiTgGNID3cZ3IgibDIVdYeLG6KMTtGcyrZ/3yl2WTsIMHxROK
         FE+Xjq3jmY5WoJE0CWJSlZ71vgS0JfJurhWfOnxWOMOFoJOXovOlNu6XaM844G0przMn
         +CPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWm0FE/HrNdS5ZNGBBWTEp9IgzkbBEyU3lLmAyxtObNk3B07wtVGvL5WyE1aIO/HarVeFklr2s9DbOQUQFbgBoF@lists.infradead.org
X-Gm-Message-State: AOJu0Ywt/5ImQBdRlSRomgyMjJslwzIIsO2hiDq7+rV0JTDp+w7ddLOe
	RBNZdkLqC+vO3gTFyipX+m7RHEbwQkU+4PLfSkpvFXfm41qeh/lxE+FlXWGzFTYqFw9i6/BIGAY
	Dg50qTZCAce0FbxDEuQRNkzAL6SBk/TNiBFIBhszA/D4zMxEQHMTFB6N9KF36pCRggqUgchxMQ3
	/7Gw==
X-Gm-Gg: ATEYQzzQECwArUTYoHurLQ1LjKJtBtGOCh7ajRrBH2iwaB7Gw8RYfaGqtlwy4vLs2Er
	7yRRm1X8nOpip427O5Mo/dffiDqjxaL0KVuir13cjhcEOgiBxSKBSYprJb0gSWmh8zQR063fIo8
	w1mDuYWm0Xt5SJacsGQ5VluU0xz7Wlu5OVjthT78tYCNuL+kStB8Jh95aiCDNiPeaAL35rfKpVP
	WzSoKWWliyzdqvsKIpB+RzthhC8TgDtKfqkTU8uw2Sn2y7YfV8vkV9Ym8m6yVt8mJY/Yh6Mxwxq
	uAOhKY5Jj1IO8LsEOLIcvVSOvaBtorHvUtQkfFtzJiw/nCGEvAYmiU+V7MCO4io1NPPkkQt4juv
	2EhbKa0LTG9ciDR1zvu8in1xJtXo+n9wCV43ZWnzsSy1Dm9KbO1F3k2Cf59WVPrIlLLvZFT//h5
	sLahJFageo
X-Received: by 2002:a05:6a21:687:b0:398:aaac:a079 with SMTP id adf61e73a8af0-398ecd38582mr2136349637.45.1773392592342;
        Fri, 13 Mar 2026 02:03:12 -0700 (PDT)
X-Received: by 2002:a05:6a21:687:b0:398:aaac:a079 with SMTP id adf61e73a8af0-398ecd38582mr2136304637.45.1773392591858;
        Fri, 13 Mar 2026 02:03:11 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73ebb9ed44sm1269275a12.34.2026.03.13.02.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 02:03:11 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 17:02:10 +0800
Subject: [PATCH v15 7/7] arm64: dts: qcom: lemans: add interrupts to CTCU
 device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-enable-byte-cntr-for-ctcu-v15-7-1777f14ed319@oss.qualcomm.com>
References: <20260313-enable-byte-cntr-for-ctcu-v15-0-1777f14ed319@oss.qualcomm.com>
In-Reply-To: <20260313-enable-byte-cntr-for-ctcu-v15-0-1777f14ed319@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773392553; l=769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=0MADiRxGeDkPQDc+D4cOyR9YpPfqVXFTQN8hJDo+rxc=;
 b=0J85xbyTY/0MHfnvcKJXG9ENgHTZhO2hLfyhFJl+vQIbDZagnd8thni9l+8CaOt5aokMxSfV4
 roVmSvGh3bUBQKAQdiG+hg30af1ewsWBVxZTWSJDeGw7GSgX9kSCU28
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: jRRG02bwP0W46BSJRrsPvkIX0vaoqFFr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA2OSBTYWx0ZWRfX6F1wFkiavF8x
 oR8RBc3CpQgd4elMOFzm5lB3/7pCVIm7GuEXzqoXoWFqds9xiWbke3aTBwqhEesNzupUertr0R1
 dfVr4CcB22XqgDYtXfywpoX+eqniP625ncRBbzVK54pAeUZyfMOIZgijhspxAD0GfjWS1IxFU9D
 JgfvjMLUasGrENcXYw/0eGGuc3W9bFA3Ux9xqPpieC5QUJd6OmKzY0BcPEr/mElo5SazwhNkRM7
 73ihkzLU6hvdL8/rFpxzXo9psoaQ1VeMbWPk4Vk7kq5koLM/MMzM6G7cW2wxZ+6BvDV+r2m+5H2
 M1YM6UAN93Ke5bc+Pa17PgpqYfaubUS6sxfDfqrFg2UVy65/ofS3HHKzWoQxlPQddFmf8LlYyhe
 3KdJSxhUsCNvNldtjhpSXvkusMuQozCdqgNUcteQxZGLsy/Fj9TdfEfkGo8OdXAQUa2kH80E3Mm
 YNblntNCxvK9RatLdbg==
X-Authority-Analysis: v=2.4 cv=DsRbOW/+ c=1 sm=1 tr=0 ts=69b3d2d1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: jRRG02bwP0W46BSJRrsPvkIX0vaoqFFr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_020314_522598_EA06E3F4 
X-CRM114-Status: GOOD (  11.76  )
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

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 808827b83553..e8a20789cd58 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2800,6 +2800,9 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.34.1


