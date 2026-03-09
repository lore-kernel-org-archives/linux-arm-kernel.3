Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35BBBEFCD71
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 09:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q+6sbBvItLVDaaK2nVoqlOqVJ4lF02bwo0WaOVku2Og=; b=H7O9NJQg9WKGg7dBwxBCXYg23d
	FAmRu8L8F+Bf9TvKcHc6pWdoNNNBkH7oT9qMhdOEHODrZ+JOwLpLUmqXWIDPmhm0onsrz5JYkiuog
	sUsaxfyFWVt0um36nPBLTiAvvyBL604cyhwKQkwbN3E4q+PUiZdHsByQAhFqf9YLiv4N8KfFU3H8Z
	SF1dJ7nAJAx+RBnTs6YSYRurWngdWbKYY8PYLYfcF+u+6raY2rbMfHSxDs9KZ/Z4dFpN0jAWwjz5/
	RluYWZey1YocAzOgA7j10gd1z4X9qmU1Xz+7zIVQp8+cu3MZf4UuRNJPGgJYVIy0EuDR0hHpI2U+O
	sXgFMUTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXEH-000000071Cb-1JxE;
	Mon, 09 Mar 2026 09:48:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXEE-00000007196-1IfO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 09:48:47 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62946l7H895140
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Mar 2026 09:48:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q+6sbBvItLVDaaK2nVoqlOqVJ4lF02bwo0WaOVku2Og=; b=FaNOT4rTHTMX80BO
	NNDcD4DlDMmDyOthYlfwnasf6azYcFvjPA8cNV5qe6kXFfrSzV57BNnz4Xodp6Kb
	esm3e3psLAVtGV2zJ1RVcIZvzhGccFPiRg3A4aQ9qP2XDGGBoHIA/F3gqtpPhUeI
	kQVgwY+DPTc1S++6VkAQsBbeFzhTWOXLAK23PrX8KNbRarY4YWXiWHwehOT34a97
	oe11MyGkKbp3D8HVdkv6pGurF/ppPXApiXgL/uIcSY1kcKYzL4G7t7SSnexujfvi
	jUn0xgodnWynzoqAJFJbIA5G7eo94bOXgtOjO+n6YmkvXalj3MpKdb5h8Hf1Tq/h
	htfYDg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crbkxvvcq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 09:48:45 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3595485abbbso10464901a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 02:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773049724; x=1773654524; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q+6sbBvItLVDaaK2nVoqlOqVJ4lF02bwo0WaOVku2Og=;
        b=QMDwcb26aP36MdaL3BbwU6Zs2QX0IAYPVIzL0oWI5weraJ55mSKH3QB+hh7cBzr07y
         Ss9zy43QgxTBYeGa8SAcY9JNurqqkOpYrPmO1dORcRB44ysA8itKy242mhKceLMNkhRc
         hjYhwno4Y4JdJwVbe+tUJNszDzCcSBVzfocn5T6RcvOlbYTqj/QIlSB1BgxWWDhzFQkZ
         L5Ha1JDa43J/Q416X3EZRbsaEg49eCBL456qLkwynbUfJY/iB/XbYz4Z/WLsnPyicJ15
         Msm0bP7AgNfXVQhpG/YleN8tusBmcpwcfaIdRFAKYxdhT2zajGnZ2ghxVzB5+sJr7AA4
         jG2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773049724; x=1773654524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q+6sbBvItLVDaaK2nVoqlOqVJ4lF02bwo0WaOVku2Og=;
        b=uuZ/+zidjt1CuRi9MQ4k9JG6gH34JlHNcktdvMUituNPutbqS1HzpINE5XVBf5YaDS
         /ykHNtdjPDeWFzySVG1u2try7vaLG7tuO4MLMUs/oPk45ZRTsO1Qcic4Drzj+YiVxEkI
         YBWkIVpebhzywWdm0VH0MY+fpcXCK1+Yxferfxbxp4dYmHSYlY8kDsbguDquUud/hZ1q
         x0fpuxo9WcIrRAdKKZuPn+yKRE5b3Pg1+CTiregslaV6KhUcYQlDKpNdjpQc3f4KRNDD
         pCQr7oVQWrSakLTAZCKbD5tAbxqUH6jjdPKZOIrNtlhL/AjX62J4W8tD6QmvjBrNLxuS
         Q0nQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1MRP9nSMV+NGnQINfJiPHMfnSWmxU2C0uyBtKr0mxZnsZScmQTVO1Rn3qd3bMGKVgYSDJm94UPSnUQLjpOnpB@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs1T9Mm5FY4Ybp0b/Wr7xgrEmNA5A3+7clAA0T8QM3HIJla77f
	otw75o1ANxWymNI+owr7H5R3f4Mqh7D5lRCN/vCOh0HEAz6czVY8ultcUwztQQy7x9wfrb8yzNE
	9C1zZ0yHE35/qM0Us4WgAjwHTfPx0O6oFwBMYQJxOvjrNPexJYWfsrmMLjZ2B1bWt58mjEmz/UC
	ZCqQ==
X-Gm-Gg: ATEYQzwGZy+QS5cEUp7fueotgXSHdqnHJw3j5FcJV6AkT0c4eLrBEAfZT1QdZAd4dSL
	9iWhOz0VfU48tyBLk2s9ogllbRZgBWUR94x1eHDRabjPloFuNwjYqcGL7GdYx60BBJ33buQZCLy
	Cyuze1UQlroMvZweTkogTY12Lyd+OhxZ6ffiftRuKTSgdpjJMAUjbGEAycG77PSpRJYH8KlgHhJ
	aXzggolBjSThas2XuPX/pWSuEy0++oywGUelRZRJH5acPnoSmwCbKJkniPNToT0k50dH7JyJDO0
	vBS5cHSgLYbiFUUBgr4s+VFI99qyjkvhhHBIhkmlv3pPmGEVjD7+PGMLFjkWYiDYEmb+Uyp4e5j
	WH/FCCFrRx1pm+eBrqyIh7o5vqQH0bZFTlGHzeTtqIO0WXP7MHMXde64m4nDn1G+4wnGg2DdKkE
	NNo9TuvGuq
X-Received: by 2002:a17:903:13cd:b0:2ae:506e:4711 with SMTP id d9443c01a7336-2ae8243297dmr63511635ad.31.1773049723654;
        Mon, 09 Mar 2026 02:48:43 -0700 (PDT)
X-Received: by 2002:a17:903:13cd:b0:2ae:506e:4711 with SMTP id d9443c01a7336-2ae8243297dmr63511425ad.31.1773049723199;
        Mon, 09 Mar 2026 02:48:43 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e575e6sm104948435ad.5.2026.03.09.02.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 02:48:42 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 17:47:46 +0800
Subject: [PATCH v14 7/7] arm64: dts: qcom: lemans: add interrupts to CTCU
 device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-enable-byte-cntr-for-ctcu-v14-7-c08823e5a8e6@oss.qualcomm.com>
References: <20260309-enable-byte-cntr-for-ctcu-v14-0-c08823e5a8e6@oss.qualcomm.com>
In-Reply-To: <20260309-enable-byte-cntr-for-ctcu-v14-0-c08823e5a8e6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773049687; l=769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=0MADiRxGeDkPQDc+D4cOyR9YpPfqVXFTQN8hJDo+rxc=;
 b=RSm1iC1KmuhUuoAcNzQ9MDJjlZW0pji30cK8svj/c/5UUe1a1wjIKbxi1G6/YIyTm28tHffPt
 1G2/LSGs3vjDhii5pTvNxPkZ6p3YG4NvMQWo2QInDv+Lud2JFO1bKVD
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA5MCBTYWx0ZWRfX563HLFrtR77L
 v767DzX1ZyorSA+Gb40wEpbw8WhXMjQqudycUESg/++bMUoemYdDIIv67SIKtPE7CUSSaCSrzVR
 MFuTVZlaQd4mSYy9h0qHgPwAzho8VuNgNKlqqABOKSKVNBn7xyeJTa4GNQxHQWq1Pb/9PelGFZc
 lQIU8JDoyDeOPoDm2Nqj4gvYZfYBq9xpOyWD3t4/Qmbe5OfixDplNxkRuc6ANL5ZTNj1+xmbtM3
 DClSwEgMpygAzQ/pJXI89BbIVrexty0ooq6cUm+W4qXlFDggT11tEIlQXSnjV64/0DZqaZkqQZs
 1s3g3+Dlg+wK01lzNOqCihHHh8qFCJQW6CgoHIWwdkYOH1tr9VIeBrPIUS67pD7fa9ArxSVJOH4
 kCYtaVxrfPZjw7I3QpD0veUpI4vs6LYpHLsC+GG85MBECBe4BGFrrt6Fw7sEeqpGUIBaoVcHrPR
 H1oopuNmXvmrzfcLenQ==
X-Proofpoint-ORIG-GUID: Fb8wIV9Yhu2rhKpBs8X8bU-0_jH0QpPh
X-Proofpoint-GUID: Fb8wIV9Yhu2rhKpBs8X8bU-0_jH0QpPh
X-Authority-Analysis: v=2.4 cv=LOprgZW9 c=1 sm=1 tr=0 ts=69ae977d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_024846_480354_F7C220D5 
X-CRM114-Status: GOOD (  12.35  )
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


