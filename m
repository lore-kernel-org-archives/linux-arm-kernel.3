Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5551C79FBB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 14:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KaUce9/yrvvWl365SbTXejci7TYcSE7Y91Xq09tmBZY=; b=LFFDq9/40A4bEfGL5vLBV07Kxe
	RJNR63zb5aHBSuwbIyDbVMDbM7qVCXNUjUQ/nnfL7PVosLK2qPQqFAhrKY9/H7kK3yJJh+Htgx2x4
	NCbBTPdfry8SY+RZAxVGEC378bH4WqL0/SnX6DtWCDq3x5agbpuo4uSsT8E95DjpP+gqT1JHjf+aq
	xbryEVohR/4e0k1cLymJ0aV+lzcZuPWAB65drwZbUBtkC0GhvYWvENDlMmBtmpRAOe+YDtsan/F+X
	soWsd7oXY7zKYp6/+8L6Y6hf1f5Dw/jmCa6BXXBt6z/5ikoRMlFc4e6qyx2Ur1KseglSnwXoE2J7I
	dvzIo1qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4J7q-0000000BwK0-18Jz;
	Wed, 09 Sep 2026 14:18:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4J7m-0000000BwId-26Vo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 14:18:07 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689DIg0b2081656
	for <linux-arm-kernel@lists.infradead.org>; Wed, 9 Sep 2026 14:18:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KaUce9/yrvvWl365SbTXejci7TYcSE7Y91Xq09tmBZY=; b=UzpJHeJf8hlv3pxg
	yKv31LFTgKIFGnY7P7QAKlfHUPvZJp+vWADabvrqDzLJ0jOogQuhxWippFaoI/5b
	RQkSgzQqRn0Ewkwz2GlIkbZLJJPfslV8YLy+7aasW2+4manAh9XRt/ukayGZf0Kq
	SydQh+Ljkif4K2wIXT1Qb7wwGIntc/9SqLyN9IYwgk7vhJKLkxOXZ3G/bgYX40Eu
	DlJfLa3h5w4fGmYPYMn5tzvEhU59XNVqvugYTUC/bywpB0JBm62HaEElBQzjGHFV
	sUj6m3fL0ZThH4pW5n7EaxXIvR28+H5pd5ft6KNNFgA9pO6fZqdHerV8thBA4/nm
	ebqs1g==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk87r09xw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 14:18:05 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-785b66a7017so1407995137.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 07:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788963485; x=1789568285; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KaUce9/yrvvWl365SbTXejci7TYcSE7Y91Xq09tmBZY=;
        b=Gc7es2CYg6CRbjLxA/SvyQWgpIfGnrq/NWjsZaACocTOvP03obdv+/McC8ZZGE8JJV
         JflH3Q+8AcY5pP1TMvxvUNT9UaPCPzPtX5EG0Y4GrIpHolGujHViO9wWbZkLSuusMFi9
         cZTj7UP5ajmn+ZTee2CsDBiAIUhQuriN9x5jUhNu1s/wH4dYYQab2ur35x+4E5hOY70t
         TurkpdE0H3mSHWr4aTTcGsr0SxYRck46ettQsQTbcNTsY2E50Ya3cRgo9+YV2izqKc53
         6aVldDa4S+CFp5Kz3VQJHlBIzywqQ92fIvpUjgljU1E4/P6Rv5PSz60zI9BxqAySV93J
         2c1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963485; x=1789568285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KaUce9/yrvvWl365SbTXejci7TYcSE7Y91Xq09tmBZY=;
        b=SMCrXesREFMXduXsxUA1Hk1U6q7tlJr+PELxhSzzPtgaQL12pcPBUC84pBGN33fCK+
         0U+ViiEamCDb7wMymSP2OZtjd2HWAt4RzEAJxcA9Yay0toFF3lmsULjxOy/c09LcjYyI
         BW1qvy/0S9pj+q9KQKRcEKHm1jbcakRbNh9CWKSpwfShdWM8b0fr5JrvtnPjMNY9lX7d
         A/RjOmA4Y0/FgrvkC7xb+Ruk9LRovwn1SSsoXEZgseomrSjMeXzslD49KZBnmg/LFbCX
         /YfC4AQ6+HLT5vq8gd/alZJLcTwrOnEtIT7Gyok3qOzpZkcfl8LW4/Eg5mDrCuYVoRKL
         jjRw==
X-Gm-Message-State: AFuF++ljKlSydfcfJztsRgk6sEWJTahdRY30FOd4e1h4ldFq+TC3fxcp
	ZIGsxdpncGrcOUYCJf0ZHTN/HNVkDS7/l+LYHjfmavkm/Lzn4W3z6uFVbJWkx6R2+auQPQ7KzKv
	MDB5e1dRJNzp4UqU8s+OFMAB5nscLrNf3ZMQMubNaaK26vhyXj8rkIkBPWbrHcTOjOfgdUSO2wX
	0DBA==
X-Gm-Gg: AYBFou0bGw3XTJqV5DXe8nrdkZ6evflSTp057BEfJI/olRh4Qggll2H8ptlO2XC4YOG
	JDDPSUDFwH8mhjaz/L3VPCI+3bUSYn43K96ExsNSbbb8m6jf5kfWhSiM3tXP6AQ/LLMSrau02iR
	KzYqebZ98B71AmljUwccPTTbX2Mc1V9ZOQ2pamQv+a2NPTX0hoQjqkbD78EmTGrPkJlilEeqWKb
	I0i0cvBqFH4I4QPAZ5immoUPGClOtvEg/2ndUzVHRV9olGV1Ut0MvzHBPnTyNU5zaXtDHtEQmVs
	mdom3XCJ6GXsg1Urh/VVBan3VxRZ3inSsMF9hT0FHMgtjjY/GYPI5GiXANzBIlFUJSnAx4qhOaB
	H5RRtz+M9llvQh0UWP09U2HE=
X-Received: by 2002:a05:6102:2907:b0:778:9033:e337 with SMTP id ada2fe7eead31-78a4a7186d7mr14276770137.7.1788963484704;
        Wed, 09 Sep 2026 07:18:04 -0700 (PDT)
X-Received: by 2002:a05:6102:2907:b0:778:9033:e337 with SMTP id ada2fe7eead31-78a4a7186d7mr14276686137.7.1788963483961;
        Wed, 09 Sep 2026 07:18:03 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c293b6246c4sm77581766b.20.2026.09.09.07.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:18:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 16:17:52 +0200
Subject: [PATCH 1/5] arm64: dts: fsd: Fix indentation of CPU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-dts-samsung-cleanup-strict-v1-1-1b755a446b22@oss.qualcomm.com>
References: <20260909-dts-samsung-cleanup-strict-v1-0-1b755a446b22@oss.qualcomm.com>
In-Reply-To: <20260909-dts-samsung-cleanup-strict-v1-0-1b755a446b22@oss.qualcomm.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-fsd@tesla.com,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10829;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=mGJJghFSItEhhFNqrC/z616uuKMInTO+a8FIm23jRQk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqoWqSnUhp42JJuvjT3lk3UeBlFe+BA511LjOHB
 X1afbmVYLyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqFqkgAKCRDBN2bmhouD
 161AD/9mHusuedUPugo8y7rihvDXRj5hNQMmPMf3I2kYcmb6DlNz5HFEBKiA93IpMmRcmVzNVP1
 jOt+GuRW3tth3JwhtIvFwkvfQ5xVU52RHaImHEi73G0VF27aNsNbEuhz5r7J+uMTE5cfdFkWZ6/
 mTkwuWw0vzIH4z9VB4n2mRogC5rcUY4jTicX698ADjh8XJz7i8v1JPhfDIvcMyCzFCHhfdXdjZ6
 DY70NfUwa0yjE6m8PPt62Jr1b4GQkQHd+yus1z0ZctWG06gf7xHEHOIThUP7Tb0h8L+wr+h9Sof
 TmK7/NVPUNdyKklcwBN/fWGC9OCLq1yf0uUWODKVYOZIgA86CLEIKozYiQgRQCrlQhxl9V+GCNw
 kKDWkKH8sJtYJ0TER6jKd7P8pw+zvl988ecA6puaWil7Urhffx/Z6hsUntSgB4LL9CSj0eJENhk
 7N5i1+kKJYie1VM6GkcYgVtPKmAyUtVJwHPsZ+eTOFDWi1ayRkJkxn6EVEioQsmcWVrpkA9waiz
 yBi2I2PtS5h01MDdsb2x52sefkdhniAZKPK+Si1dxmRd20nuW+jQ/sgOuJllKrn/nfuK1fXi0hP
 0W2il9WcZOM7jm9YGxaTGW1HgMRxu6EgCH9NuU9p4NzV8dNF6unLOUy+bj7TxMl8YCXJSTjSVDe
 d1/lHF8PegC4w4w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=AImJJIpd c=1 sm=1 tr=0 ts=6aa16a9e cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=X3D6fG5ZlVyqGMLsjZoA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2MCBTYWx0ZWRfXz7wbZvK+qqGU
 A7n97ErnI5WiS37IvhvslGpy3TpCicAkV8vBD0dqg0cKDzRtAktUR2FEH0s/XEESzajnfnNzomZ
 32a0CX7U+X3SiEe5z4JjbQGYh2O078dRjqMiKaacqq/fyuShdvcdfSdyr/itjMGonOTaGdaMGYI
 0S5i+SQ+oCbphmtcBQhR3yxnKvsSmS6nvAKKiJOn0dJImKu5kGNfLCNo3gujjgi2qmpDhsgFRHz
 h4pbKvLa3zUV0jJe6hIebMXpmQTG8xCSl0V2CZZgwjsI7jZ6yqIKakP33U0mvELB32UBX2BFicQ
 vF8qkGEUmTEnr+zPQEeanmIk8Anex4EbdpVzsDkvK8v4QETzjCpiqlC9Ns+w/N3U7Aclo2WZ/Uh
 rr3rs0QZyY8MnOr5YRjU0NGGFMrNb9cEK0+8UGF/JHSqjs14dOstStZH76UKtzGyfRhvzyKAu5M
 JZSJ77YzgaGqT6fSicw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2MCBTYWx0ZWRfX+fOAajnp8VuW
 /ab9ihvUNHFEAO9wu5hzgy4gmaD90T+9+yPejX/AP4VmnNAkvphV78Ig0mZjkyZKOhqz679ushI
 N14q4H5EldezbHwgmaslMNUvl9ZM7hc=
X-Proofpoint-ORIG-GUID: x8a09RB_36YPDOxSBuyN-8QfQtMTmqcA
X-Proofpoint-GUID: x8a09RB_36YPDOxSBuyN-8QfQtMTmqcA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_071806_563361_DD209529 
X-CRM114-Status: GOOD (  13.30  )
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

Drop one tab too much to fix dt-check-style warning:

  fsd.dtsi:198: [indent-consistent] indent mismatch (expected depth 3 * '\t')

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/tesla/fsd.dtsi | 310 ++++++++++++++++++-------------------
 1 file changed, 155 insertions(+), 155 deletions(-)

diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tesla/fsd.dtsi
index 6766c78243a3..d076ea634f4e 100644
--- a/arch/arm64/boot/dts/tesla/fsd.dtsi
+++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
@@ -96,196 +96,196 @@ core3 {
 
 		/* Cluster 0 */
 		cpucl0_0: cpu@0 {
-				device_type = "cpu";
-				compatible = "arm,cortex-a72";
-				reg = <0x0 0x000>;
-				enable-method = "psci";
-				clock-frequency = <2400000000>;
-				cpu-idle-states = <&cpu_sleep>;
-				i-cache-size = <0xc000>;
-				i-cache-line-size = <64>;
-				i-cache-sets = <256>;
-				d-cache-size = <0x8000>;
-				d-cache-line-size = <64>;
-				d-cache-sets = <256>;
-				next-level-cache = <&cpucl_l2>;
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x0 0x000>;
+			enable-method = "psci";
+			clock-frequency = <2400000000>;
+			cpu-idle-states = <&cpu_sleep>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpucl_l2>;
 		};
 
 		cpucl0_1: cpu@1 {
-				device_type = "cpu";
-				compatible = "arm,cortex-a72";
-				reg = <0x0 0x001>;
-				enable-method = "psci";
-				clock-frequency = <2400000000>;
-				cpu-idle-states = <&cpu_sleep>;
-				i-cache-size = <0xc000>;
-				i-cache-line-size = <64>;
-				i-cache-sets = <256>;
-				d-cache-size = <0x8000>;
-				d-cache-line-size = <64>;
-				d-cache-sets = <256>;
-				next-level-cache = <&cpucl_l2>;
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x0 0x001>;
+			enable-method = "psci";
+			clock-frequency = <2400000000>;
+			cpu-idle-states = <&cpu_sleep>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpucl_l2>;
 		};
 
 		cpucl0_2: cpu@2 {
-				device_type = "cpu";
-				compatible = "arm,cortex-a72";
-				reg = <0x0 0x002>;
-				enable-method = "psci";
-				clock-frequency = <2400000000>;
-				cpu-idle-states = <&cpu_sleep>;
-				i-cache-size = <0xc000>;
-				i-cache-line-size = <64>;
-				i-cache-sets = <256>;
-				d-cache-size = <0x8000>;
-				d-cache-line-size = <64>;
-				d-cache-sets = <256>;
-				next-level-cache = <&cpucl_l2>;
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x0 0x002>;
+			enable-method = "psci";
+			clock-frequency = <2400000000>;
+			cpu-idle-states = <&cpu_sleep>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpucl_l2>;
 		};
 
 		cpucl0_3: cpu@3 {
-				device_type = "cpu";
-				compatible = "arm,cortex-a72";
-				reg = <0x0 0x003>;
-				enable-method = "psci";
-				cpu-idle-states = <&cpu_sleep>;
-				i-cache-size = <0xc000>;
-				i-cache-line-size = <64>;
-				i-cache-sets = <256>;
-				d-cache-size = <0x8000>;
-				d-cache-line-size = <64>;
-				d-cache-sets = <256>;
-				next-level-cache = <&cpucl_l2>;
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x0 0x003>;
+			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpucl_l2>;
 		};
 
 		/* Cluster 1 */
 		cpucl1_0: cpu@100 {
-				device_type = "cpu";
-				compatible = "arm,cortex-a72";
-				reg = <0x0 0x100>;
-				enable-method = "psci";
-				clock-frequency = <2400000000>;
-				cpu-idle-states = <&cpu_sleep>;
-				i-cache-size = <0xc000>;
-				i-cache-line-size = <64>;
-				i-cache-sets = <256>;
-				d-cache-size = <0x8000>;
-				d-cache-line-size = <64>;
-				d-cache-sets = <256>;
-				next-level-cache = <&cpucl_l2>;
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x0 0x100>;
+			enable-method = "psci";
+			clock-frequency = <2400000000>;
+			cpu-idle-states = <&cpu_sleep>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpucl_l2>;
 		};
 
 		cpucl1_1: cpu@101 {
-				device_type = "cpu";
-				compatible = "arm,cortex-a72";
-				reg = <0x0 0x101>;
-				enable-method = "psci";
-				clock-frequency = <2400000000>;
-				cpu-idle-states = <&cpu_sleep>;
-				i-cache-size = <0xc000>;
-				i-cache-line-size = <64>;
-				i-cache-sets = <256>;
-				d-cache-size = <0x8000>;
-				d-cache-line-size = <64>;
-				d-cache-sets = <256>;
-				next-level-cache = <&cpucl_l2>;
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x0 0x101>;
+			enable-method = "psci";
+			clock-frequency = <2400000000>;
+			cpu-idle-states = <&cpu_sleep>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpucl_l2>;
 		};
 
 		cpucl1_2: cpu@102 {
-				device_type = "cpu";
-				compatible = "arm,cortex-a72";
-				reg = <0x0 0x102>;
-				enable-method = "psci";
-				clock-frequency = <2400000000>;
-				cpu-idle-states = <&cpu_sleep>;
-				i-cache-size = <0xc000>;
-				i-cache-line-size = <64>;
-				i-cache-sets = <256>;
-				d-cache-size = <0x8000>;
-				d-cache-line-size = <64>;
-				d-cache-sets = <256>;
-				next-level-cache = <&cpucl_l2>;
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x0 0x102>;
+			enable-method = "psci";
+			clock-frequency = <2400000000>;
+			cpu-idle-states = <&cpu_sleep>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpucl_l2>;
 		};
 
 		cpucl1_3: cpu@103 {
-				device_type = "cpu";
-				compatible = "arm,cortex-a72";
-				reg = <0x0 0x103>;
-				enable-method = "psci";
-				clock-frequency = <2400000000>;
-				cpu-idle-states = <&cpu_sleep>;
-				i-cache-size = <0xc000>;
-				i-cache-line-size = <64>;
-				i-cache-sets = <256>;
-				d-cache-size = <0x8000>;
-				d-cache-line-size = <64>;
-				d-cache-sets = <256>;
-				next-level-cache = <&cpucl_l2>;
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x0 0x103>;
+			enable-method = "psci";
+			clock-frequency = <2400000000>;
+			cpu-idle-states = <&cpu_sleep>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpucl_l2>;
 		};
 
 		/* Cluster 2 */
 		cpucl2_0: cpu@200 {
-				device_type = "cpu";
-				compatible = "arm,cortex-a72";
-				reg = <0x0 0x200>;
-				enable-method = "psci";
-				clock-frequency = <2400000000>;
-				cpu-idle-states = <&cpu_sleep>;
-				i-cache-size = <0xc000>;
-				i-cache-line-size = <64>;
-				i-cache-sets = <256>;
-				d-cache-size = <0x8000>;
-				d-cache-line-size = <64>;
-				d-cache-sets = <256>;
-				next-level-cache = <&cpucl_l2>;
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x0 0x200>;
+			enable-method = "psci";
+			clock-frequency = <2400000000>;
+			cpu-idle-states = <&cpu_sleep>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpucl_l2>;
 		};
 
 		cpucl2_1: cpu@201 {
-				device_type = "cpu";
-				compatible = "arm,cortex-a72";
-				reg = <0x0 0x201>;
-				enable-method = "psci";
-				clock-frequency = <2400000000>;
-				cpu-idle-states = <&cpu_sleep>;
-				i-cache-size = <0xc000>;
-				i-cache-line-size = <64>;
-				i-cache-sets = <256>;
-				d-cache-size = <0x8000>;
-				d-cache-line-size = <64>;
-				d-cache-sets = <256>;
-				next-level-cache = <&cpucl_l2>;
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x0 0x201>;
+			enable-method = "psci";
+			clock-frequency = <2400000000>;
+			cpu-idle-states = <&cpu_sleep>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpucl_l2>;
 		};
 
 		cpucl2_2: cpu@202 {
-				device_type = "cpu";
-				compatible = "arm,cortex-a72";
-				reg = <0x0 0x202>;
-				enable-method = "psci";
-				clock-frequency = <2400000000>;
-				cpu-idle-states = <&cpu_sleep>;
-				i-cache-size = <0xc000>;
-				i-cache-line-size = <64>;
-				i-cache-sets = <256>;
-				d-cache-size = <0x8000>;
-				d-cache-line-size = <64>;
-				d-cache-sets = <256>;
-				next-level-cache = <&cpucl_l2>;
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x0 0x202>;
+			enable-method = "psci";
+			clock-frequency = <2400000000>;
+			cpu-idle-states = <&cpu_sleep>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpucl_l2>;
 		};
 
 		cpucl2_3: cpu@203 {
-				device_type = "cpu";
-				compatible = "arm,cortex-a72";
-				reg = <0x0 0x203>;
-				enable-method = "psci";
-				clock-frequency = <2400000000>;
-				cpu-idle-states = <&cpu_sleep>;
-				i-cache-size = <0xc000>;
-				i-cache-line-size = <64>;
-				i-cache-sets = <256>;
-				d-cache-size = <0x8000>;
-				d-cache-line-size = <64>;
-				d-cache-sets = <256>;
-				next-level-cache = <&cpucl_l2>;
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x0 0x203>;
+			enable-method = "psci";
+			clock-frequency = <2400000000>;
+			cpu-idle-states = <&cpu_sleep>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpucl_l2>;
 		};
 
 		cpucl_l2: l2-cache0 {

-- 
2.53.0


