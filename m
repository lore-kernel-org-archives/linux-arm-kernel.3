Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104EBEEF33D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iWM+zFw9puuVTnXKWNi+w+/4+fyEV8c1VB6uPAwJH3Y=; b=lxvNgraiJE12X2u3K25dNC5spA
	paKmuSjT2ySn6ehwVM/5HDHbQ8B43b1MdgbWanv2b3udX43DbQrId9mMCylIUd+M/50BHqMZq4RLY
	dqBg+CUL+Fnh3YaZCC3pHlBhP7SqxlcgCwX4V6YjH2R/q4RuPWlunC2eXLsFvvhB8ZAWOqrK4FpkH
	JiS7bcqR2Utp2WS6xSYQj1Uia1egBchSTGALW5a3i86D6EIDVyvJLlPQ981PpxglDX/y0LpQvGEyf
	097fHrFw1DlUQ0YNi5VdSLLKLloG7INsbA23jeGzVS6saHcc4ignDD+7Yia6JFsBR+MhzYhAo2RPc
	AJCWLhLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4iE-00000001Joo-2Cjo;
	Thu, 05 Mar 2026 09:09:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4iA-00000001JlI-3gk5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 09:09:40 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6253A9k5865377
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 09:09:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iWM+zFw9puuVTnXKWNi+w+/4+fyEV8c1VB6uPAwJH3Y=; b=O47AUWOPnSykjiuk
	Y3Ee9exj5809jy+mUUmuMYltHRgxuyzOV/SqdZ+Tc/L4g11ADsXQtweMbYuOiAJo
	rI0pZzj3B5E9tFceZ2zy6bdlspDYp+h90beqjTpgKxhwT9p2JHG+5kYgPud3JhAC
	mzHCS5ylcEeSFghP1cxGJzXkNHoTGxZQpDUAZ+dRkV0yDN1oGmiLM9DWVjUZp8EE
	Hkv5+h9xWD0WKDVlo9S33ws++HV/0PoQDmUk82RKrNKUfAT8XYfFGhxt0p/UlR0H
	mFC2mU1IR0n3f2U8iSKvgbSw5ybVJsUkugVE8cbXKOB9aKbTwp5Y/e2KW9yhj0zl
	XlXclw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq1pk130d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 09:09:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb42f56c4aso4872151085a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 01:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772701777; x=1773306577; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iWM+zFw9puuVTnXKWNi+w+/4+fyEV8c1VB6uPAwJH3Y=;
        b=GXpvINjhGTT9bO6gWfkhbsSvC96GY1qLWlt3/mXJDsUbQQRylxNRWPgTNJUBPhkTPr
         k/gDjEfEiPafeDv4yaZBIigEtiY89EP07fHmcavZwhaYxqlsrj6jR8v+QjqMKOmzf1PE
         huztJCHDYUz7URR5KIx3FfSOY+C3rSadQ36AfBwheYGhvDxTL7mDLjvgRLHaBMu+onJ9
         6MGYpDkZpoXpASSbgtTdcVM/wQ1n6fsRqPznIL8IgiO1oj3XK1x3KMeGljuvVpfbChvl
         Rxrq6epsNFWzDs/bCRJVAgxpUiUAJbIU/HBSW9iIpX90gysI0GPtQTvr7i8JN9U6wk3N
         XFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772701777; x=1773306577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iWM+zFw9puuVTnXKWNi+w+/4+fyEV8c1VB6uPAwJH3Y=;
        b=nsSRm+LPPr2oD8YMr1huTBBKOYC2Z8fpIkQozr/u/a61yV4YbZ4TDoHkm7Ve8bUpz5
         vSCrXrHxwTS7o4x6ga2Zark5keSVrdW+FCYvv/ElVNwNwW97P8nV/NG8VkIiHhwzgkIY
         2qyNeGJvX947YKokK8GF1Peo4uRrYPURZnVQP4XFNW5XdXTfDxXU2dkFTPpm0aMJGq3V
         q8WzcdENBjn78IO9HR/PyIH6rWUKy5qykcBdSbQcxCP5ZaYLp/rumDwy0aNuDavdcJsG
         CRQM8moWqBoE+LJN9BfScWDpGs1b6MayirwSj0GDVeP8cVUKVXHLwfTVhWSn4CzGlsod
         +3Kw==
X-Forwarded-Encrypted: i=1; AJvYcCX6mbMYw6umtcloTH+MnPD7JrIa/oG/L933NCD3oBI3c3RPt/0CtzwMrTzp5abuCQE6idVOYvSNqHPA9fw0V4yL@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0Ca7TRvv3Q0w+0Qy/fAA9LTIbbD70E6qnTapD7xdyP0juo28H
	Q5FvBBxWvtVMer6LmN7k3pT9Uy5sCtvZFC6bGmQ60VKNwDzvCzXnWlZ5ONLOTZAM/AQftNkMeJc
	/n1Hv9Lpq3ApHF6s1AAPOne9CFyeuN7W1mXu9Diwr1mvMoSLmV9gpt9OY0wyVucvynFEZth2ViT
	ifzQbdZrcwnQ==
X-Gm-Gg: ATEYQzyroH58Hj6/KjTv5JlytVV+0hX+Z0WH+acaUy13IgG57L8ZBkX7SZa/Jy7aP43
	nPQFVeolNkI2NQwgA8dl6PlDoUykXJhGI8QdxxaAYMqKxq9xcg/pWvBls7JYe0fpgMlVNiHOnOz
	EOirn2To8V7OwpnG+jSWabYoMmTRGC7WxJNfXxeweUVOwpvdlLguXBAcXmsZV+FgcvUuYUuZ85V
	v8GKwK/ydikFKbP0DA5F/v/7YNQPQBk3VqSCa/1oZ16Ig8OCtmX9igXIvXSQ93SgP1xmYSWHJxe
	3sNqhaVamfy6QFsweuK+KllqAuJ17HCKHUyOf4ADrTr8plv1zb5fjKuAOdwsldxS4PlExXcZhZK
	KYiCHRoD35FS6wwZC+Mk+/EvIaXvxTP62Y0ynH5mJeonl
X-Received: by 2002:a05:620a:4481:b0:8c9:eada:f3f with SMTP id af79cd13be357-8cd5afaa760mr560825385a.67.1772701776976;
        Thu, 05 Mar 2026 01:09:36 -0800 (PST)
X-Received: by 2002:a05:620a:4481:b0:8c9:eada:f3f with SMTP id af79cd13be357-8cd5afaa760mr560822685a.67.1772701776532;
        Thu, 05 Mar 2026 01:09:36 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439abded86esm38817703f8f.6.2026.03.05.01.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:09:35 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 10:09:26 +0100
Subject: [PATCH 3/5] ARM: dts: exynos3250: Drop duplicated I2C
 address/size-cells
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-dts-exynos-i2c-v1-3-2c8d3df3b9ca@oss.qualcomm.com>
References: <20260305-dts-exynos-i2c-v1-0-2c8d3df3b9ca@oss.qualcomm.com>
In-Reply-To: <20260305-dts-exynos-i2c-v1-0-2c8d3df3b9ca@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2262;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+ET7cBxh4ZoH3YN/EYv8cNqrlKIIjGzn2UDYqXcCK6Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqUhHF5APwpdgOAqymUIGEGtC/e9vFagAeyBKf
 3jTywOELFmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaalIRwAKCRDBN2bmhouD
 1xCnD/9YybO09CYqjGiaazgfzRedT7I3mzW26QoSpBWP57AxsfDi1dBnylZi/Gog6EXrm4+CI6B
 TuDy5K1MwuJ+nsbLxkWZJtjqXDsBcZesczQp1/Cj/8M3wPJYdT1CI+AggyFA5n3RwJbO8/7aDhO
 VWkRNZJaCI79dgMcW4C03eacgA+tV0G2SJBtwfhQo3YsWLp9v7CM0VW62yJ/z8AnPWKlOCnP8qD
 CoMnBrK2he9j1ppabWuXowCAxodgM8jV43a3NW9T2EAZGlKxlvdU8mBT7H6sTyBuuN7Cy955Msd
 V5dw5/o0g46ma5bfbyG4kvzSoF3A4DLUYbt4wjtz86g3XxlMHLz3PyBMaIupXuMYGrfTFzp2j1z
 4q2lNnMxCGvZBxss9PxaZiPvMk6c282BVdlEdmgL73OEPCX6Q8CuMrG7R0aw4zAsRA2PUBjTd0Q
 OKl03w2MeMHaAeOyOEJzp7x/5cKSnXbVXXT69XljhizTAhtrUFsPAawwbPX09wL7BbaS3sWqlyu
 5Z4gmGtV9rrgLIUA+SAKCrmZH1ZmTeVhdaUJJJw2KPoQbcMak5noS1A4rNGhJVtXW+MVYWEFgef
 9O9/KZsSLBSqogcO4cbvmPI3ndunTZIqs4UffzsQLNxL7e4gCC7Por5+9kqfNZGnBgyTH+GfZ+R
 Uz+1A7HrmnpvIGw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 7_DIdqShwslwgvv0R4Ya6DkY6sho3eLq
X-Authority-Analysis: v=2.4 cv=Gu9PO01C c=1 sm=1 tr=0 ts=69a94851 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ARXnZHKw_jpq6KYG4RIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 7_DIdqShwslwgvv0R4Ya6DkY6sho3eLq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3MyBTYWx0ZWRfX9eMbBN9W8UfR
 WLruwVNnnE3VhlM6DNcq5j9sNwzCex/6hHMnl4jAKRq2urWVpDPavEeBs0kKJVL+Yh4xVk9lDhQ
 XNb7Tb3BV3DVFo1H9nW1AdK9keI7tjyAz0ctjFqiP/WngA6FVHeTRI10VotH0TxpXqfHxt0Nm3X
 zgszJ9h86/zy6VsGBiPYgrTL3MX9Wfwspb0dXo91DtehNKjHu9jbPHjm2Sa2snc01LLbMzZrHer
 7l8rweEyrOaalfl0o6Shzx403u/nrSIOylfq/pgQWOrPRcSNFLfXxhsu01rYcN+3ohTu/lm+Ufz
 fr4kfbXyFh+qCkJ2QNTPXIi7kb1xMTEd6/Ap8yWyzxwEbddRDxi7Fjt9tjRN6fJNjvqg+yMdIuC
 SrSJEvVp4ug8zngcgBMHt+INOkX7wUN9QrLb+P4fcAOQHGU+oSd19hPqyJrXs9fZzcyqQvu8mQs
 dwMPZSscW9YtHGK8vjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_010939_053427_01B956F2 
X-CRM114-Status: GOOD (  14.35  )
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

The DTSI already has address/size-cells for each I2C controller, thus
the board does not have to define them again.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/samsung/exynos3250-artik5.dtsi | 2 --
 arch/arm/boot/dts/samsung/exynos3250-monk.dts    | 4 ----
 arch/arm/boot/dts/samsung/exynos3250-rinato.dts  | 4 ----
 3 files changed, 10 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos3250-artik5.dtsi b/arch/arm/boot/dts/samsung/exynos3250-artik5.dtsi
index 3fdd922e635c..059c0f44e164 100644
--- a/arch/arm/boot/dts/samsung/exynos3250-artik5.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos3250-artik5.dtsi
@@ -74,8 +74,6 @@ &gpu {
 };
 
 &i2c_0 {
-	#address-cells = <1>;
-	#size-cells = <0>;
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-slave-addr = <0x10>;
 	samsung,i2c-max-bus-freq = <100000>;
diff --git a/arch/arm/boot/dts/samsung/exynos3250-monk.dts b/arch/arm/boot/dts/samsung/exynos3250-monk.dts
index 68236c7297d7..d59ed46614bd 100644
--- a/arch/arm/boot/dts/samsung/exynos3250-monk.dts
+++ b/arch/arm/boot/dts/samsung/exynos3250-monk.dts
@@ -191,8 +191,6 @@ &hsotg {
 };
 
 &i2c_0 {
-	#address-cells = <1>;
-	#size-cells = <0>;
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-slave-addr = <0x10>;
 	samsung,i2c-max-bus-freq = <100000>;
@@ -414,8 +412,6 @@ buck5_reg: BUCK5 {
 };
 
 &i2c_1 {
-	#address-cells = <1>;
-	#size-cells = <0>;
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-slave-addr = <0x10>;
 	samsung,i2c-max-bus-freq = <400000>;
diff --git a/arch/arm/boot/dts/samsung/exynos3250-rinato.dts b/arch/arm/boot/dts/samsung/exynos3250-rinato.dts
index 36d2171c1ce8..fa983b732898 100644
--- a/arch/arm/boot/dts/samsung/exynos3250-rinato.dts
+++ b/arch/arm/boot/dts/samsung/exynos3250-rinato.dts
@@ -263,8 +263,6 @@ &gpu {
 };
 
 &i2c_0 {
-	#address-cells = <1>;
-	#size-cells = <0>;
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-slave-addr = <0x10>;
 	samsung,i2c-max-bus-freq = <100000>;
@@ -594,8 +592,6 @@ regulator-state-mem {
 };
 
 &i2c_1 {
-	#address-cells = <1>;
-	#size-cells = <0>;
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-slave-addr = <0x10>;
 	samsung,i2c-max-bus-freq = <400000>;

-- 
2.51.0


