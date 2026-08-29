Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD14AC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 19:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uYY1haxtrXQH+XznnghxF9X9hpKVzJQon3ETAsbHsJs=; b=pE1WH8hKwpSRoU7IJS9OuqhN7t
	PZ+JYmLKG3ioYEVVfKDCcc+Ip/XvJojKOOkSJeTdC93RSIbCBrUxVJ6ncKZ56S6rsAIccgSwNh/Uy
	eZ7eBi8UsHPZYPFcuGEgRGwGv5pcURNHHf5iY+NGlzMz3yftMjOM1CQyWop86GKnCGNCIFB3/bGdz
	5l2oaqoPmm3uevvVpyJ6YVtsToYsAq1uKCVj+vOWHmlWyH1E2aDtKjDfA3d9khPQkHdzfVOAE0TKq
	Ck+jtNNhbHexdGZl/Pivjg/DKU40M8eYmKfdt26PU9p9HavjI9J/2/u2tGIs9vVlNsDiNeEyvfeYS
	l20cvMWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0Ow2-00000007Gnu-1iCj;
	Sat, 29 Aug 2026 19:41:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0Ow0-00000007GmY-112A
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 19:41:49 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TGxPx43455520
	for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 19:41:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=uYY1haxtrXQH+XznnghxF9X9hpKVzJQon3E
	TAsbHsJs=; b=nNahYu9cLblgUCWHqjYUnlACTlZge8G4kcNgam96C+gayxBsNSp
	4pk/qlXEE78hRQD/H16CREyCL6SxGdRAZrA5EQRULRHGDehRJFyYbtTryZdU1knv
	HjaspjKvISxU3hcZ31T9fSBmSfxz8qdmcu5Vkxk3IkznrO4EwRdLO2qHrk6RpWlH
	87VTFc/iMQ6HlSkVnLauk1pYevTL/eqd16o1HETP4r/t23zl/8ZYEV9cernQAPPA
	/7x/9ICWpxUvqzBnzGKq1u7sBnOBQeo8rrVSpRMBoiNNSz071fclPRn3Q6ey6OMS
	fmH82mxT3DCSqVWEzLI5BtQvwjRDK0JhEQg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqhmsnb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 19:41:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52d33c89a29so51703561cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 12:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788032507; x=1788637307; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uYY1haxtrXQH+XznnghxF9X9hpKVzJQon3ETAsbHsJs=;
        b=AeL1zhrCNjeVf1yeVNpBw2WKK0w3XgWDcDeME3ZQpe5yt0TBrBvGhA7/KpMZNGwYCB
         bsdn2V6E+bszg6WZby5kjFJOO0rel8rnyZ+2Cd6J6BqTRSlQODmLb5V01py442zow2No
         Q2FCFhq0BoEVgIlUSAk1bMfTltoHJZm9oT2zcD3feImHUZS8CBCer4gZeDequRqPcnAS
         tSZ/7y0BwXlbawM4/8AnZZKt8eHt5Pv3lL27YQYYNYiFogLm2agRjVoA4ZcJ7I4rVG3r
         rTgbABK0pRdxiTfx3y1YNs1ltDnk9vUKjl+fysG1/6XCNSoC38Nt52TqiU6hLrTfDAAD
         reSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788032507; x=1788637307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uYY1haxtrXQH+XznnghxF9X9hpKVzJQon3ETAsbHsJs=;
        b=ezQmVbBX1+adNu/qj5HL4bhC1mnSeZ1vb/FHezpaawGe+7EsUcpo7jwBrFNwbMG5Gu
         IH6NbZLNwZ3Oa67v6XObAh8ncXlPX7xQfoOTYNrPzI1sJgZNiinIdBO8HzH4c90e9yAc
         31BmQjcFtbwph6obMlrpswLPzQFvfrWLj5ZHiAzhpEVacX+sOodW2umjSKA80xg3u76B
         fLOvHA7KzMpW10jjTpX5Sdr5yVBqFwCUBrcuOq+hDmJJ5i+03nStePdvcv2NHCPIytTw
         88dtTY26SyRX/jlLYk0HTHPaB7Rm7+xC+4g2LL/JYaqe+0+7qK+riqf8RWCU6aFTdrl6
         FzYQ==
X-Forwarded-Encrypted: i=1; AHgh+RotphXqHtiaQp9Ao6Mngzx3TiRo8v4fV8o3jWupFUAM3ghCKeDbeQzkCWR4hTfT4oLOnuLDmTyBBc4Fdt0KzBku@lists.infradead.org
X-Gm-Message-State: AFuF++lo8bsj/l18wecYJw+GMuB6wWjIhVWDOMCPVDG9sz3gutABj9GI
	bIwGulvHvaNnZJf2XgKVN11Ct+tFkpzekFD1p0f+teRjrkAlf+4u2ty8UWsPyQsGmk4P13ibXbH
	EXFesjcm5nhs+Y+DgVAbk4tB0mpYoOZ+uynSVGpK1Gq3KH3rcwZx53vyqg9xnL0IJieoRb2SQv+
	zBpQ==
X-Gm-Gg: AR+sD11nT3AiG/aifZi3e3jPAjNsWrUw7gvIAPPLfpntpmXgFX7HwAdxuIsQUK5PVBc
	qwTLGsGwJNTU57x6W7rXOwOocsZ29WsqFL5FAp7W79/KQKyIgkxt4Ts+NJ+xe8AY35wm0JJBA2p
	nw/f7DlZOJLRvFHBwMbClQTVYg6lrCh7Z/A/XXxXoASQmvmZSrXKQYL3hA0UlhJUzqoTFrdNtWr
	vBTGotn+K+TvlviLuYHA/l7wLq9gM+4dZGoVtnbV51vqNuHBqAyJbCTJQMMYPkqBWC0Z36XftcF
	mpH83PVcztTwNI1FecpP1PCGirGz/kUk057Myk2SSiP2xE47rTojjDW0ZU6G7SH8zz49em5mGK/
	16qT4P+Nnw3RG6BM=
X-Received: by 2002:a05:622a:1903:b0:52f:aa3f:947 with SMTP id d75a77b69052e-52fb93d8db3mr191848521cf.13.1788032506831;
        Sat, 29 Aug 2026 12:41:46 -0700 (PDT)
X-Received: by 2002:a05:622a:1903:b0:52f:aa3f:947 with SMTP id d75a77b69052e-52fb93d8db3mr191848201cf.13.1788032506367;
        Sat, 29 Aug 2026 12:41:46 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4c321184sm288399155e9.11.2026.08.29.12.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:41:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] ARM: dts: actions: owl-s500: Replace spaces indentation with tabs
Date: Sat, 29 Aug 2026 21:41:41 +0200
Message-ID: <20260829194140.108124-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1631; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=+6/8xDZthmh634DUqOXAa/rFhX/OfOYHFjYz6AZlfu8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkzX0ghEMAMxhTZ5cyy8ymZMj2DHVjHuWWybsl
 sbIs/AvbKmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM19AAKCRDBN2bmhouD
 137yD/42OqxFqymCxRmsIJX1+mJ3UX60exe8tWrVf2CRM6IoEby6+l+1EoL7Q02JPLtIzxO3KCK
 5ZRP3mksme5eHtnjhf66LCgejsns9f5SNhQtKO3oUdKlxQI2saw5vINIqFKkGhe6GX9+emIt69b
 TUV8lex6pjz3M1vPwqS8p/sgjOqi7F6iVF3ZnIFVsLdUp373eziwuVqlROZcJu+y9lk+UNc6Bbu
 3tNV4kgM0epR/XVUmH/jji6jfu2hM7JVA9m8IqpiOXQge/lrZY3g+GOIqJT1fRLnNmZnymPsb8n
 ruhHYoEqeYdQXVy6Ms5zbUS/YwM64fhoQzn3Fx/X5pxHCuwKr/9KX9K5uABS3p7wlUZN5T3686P
 mo4IRIe9iLlIIQYJKXcrSuegzzYPg6IKGOqH4JVED4B5a542Dzc/RVBoC/hWDvmzzpW7GZa10BV
 PFqbeY2h7YITjJEnDHKWwOyhZi1D5GG9nHj4YprNZsxKseJvgb/EBWDnK7afJPmu/k6STYJWmhH
 tqvdE38oYRk98y5b0e8UkvUswLHbX3KzFQxY5lZnnX1eyh7Jvk1+Qx3aj1Ds/OAq4whish3O9bL
 7VlXy6rtf4o2ft/KkhoOPsXpLnuoTA/XzKevWbD1fLNGlKTae8LhaSLWi4KSGreusdQdOfbgJ1W YIGX4a9v4QXwTvA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MSBTYWx0ZWRfXxIts1ae52icW
 XL6/0jySN4Ea/bkUYH9+Zz73+Bqr1GgIS4SkLw/OPQNhk4RgKu6ntjZ5LFi7PctO9zIo8wawdL8
 0Zsg1CHYAyaIC6xNk7PYzy6xKkbw09FoCzcpZS8n50tUwmqaKrBsV6/4BTDI9UkkJ52GHP8ww+5
 CsAHfYacSez+pFq7dU5/7lhno94kXVhAWLplTHIut9szE4ZPFFkSWh2uokf4De+6rLjLTCtU00w
 3VIrLE4NZ26busoEusRYB0J3rJZlErp/uAIDR9o2ZGNo1AeL6x6VetygJrpYOAYVMdTPjKgwduN
 Q55BiEJV21gOXXFYGnPgd83/D61FmRtHOHr0BwiYgi0/cu+9d8FPCTX8cqFgNKdq7nV0WZ7GRIg
 asawDcXpTdObMyY3vO4GKOhBTxVMBPBoRy4Cjnioxkr0CvhdziOW7OsMebFDYgVJs1SVKAn8x4G
 zbKVGTkyN5pfazqjH7w==
X-Proofpoint-ORIG-GUID: YkLSNdHpeNsbYGJjSvSshphOngVRqklt
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MSBTYWx0ZWRfX6eQ3ZczyEgwG
 8S/RHm3xDMcAjSm4/HDsANtj23UMf3/ScqCPgYnEhIvncwKf5X9hZ4dbA5+ffyQfMPkft0ZmX9M
 H0+6+JZ9e6PdraKYX8COV8U37RQVG34=
X-Proofpoint-GUID: YkLSNdHpeNsbYGJjSvSshphOngVRqklt
X-Authority-Analysis: v=2.4 cv=bpl8wkai c=1 sm=1 tr=0 ts=6a9335fb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=Ta6ShJ3tCWu1s0TIFCkA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_124148_284858_79806B31 
X-CRM114-Status: GOOD (  13.04  )
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
 arch/arm/boot/dts/actions/owl-s500.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/actions/owl-s500.dtsi b/arch/arm/boot/dts/actions/owl-s500.dtsi
index 739b4b9cec8c..f921654d318e 100644
--- a/arch/arm/boot/dts/actions/owl-s500.dtsi
+++ b/arch/arm/boot/dts/actions/owl-s500.dtsi
@@ -61,9 +61,9 @@ cpu3: cpu@3 {
 	arm-pmu {
 		compatible = "arm,cortex-a9-pmu";
 		interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
-		             <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
-		             <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
-		             <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
 	};
 
@@ -247,9 +247,9 @@ timer: timer@b0168000 {
 			compatible = "actions,s500-timer";
 			reg = <0xb0168000 0x8000>;
 			interrupts = <GIC_SPI  8 IRQ_TYPE_LEVEL_HIGH>,
-			             <GIC_SPI  9 IRQ_TYPE_LEVEL_HIGH>,
-			             <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
-			             <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI  9 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "2hz0", "2hz1", "timer0", "timer1";
 		};
 
-- 
2.53.0


