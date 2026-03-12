Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 281EB106ACE1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 19:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KqyayV7Gg2halaaZ+cLaY6eAuvoXnGLGXG1qkIwL1Hk=; b=eAotkscCZx29aokqQ3aLTi81rs
	qisBxIb1sQPCnvAXZCa2CKLGsfHRV7QE1EiBiK4xhrARFsuCEUG/5L1dBjUPcdozTjSlzlL5k22X/
	9YXNVPwdecoZx50cb+G+k9rlOdN2wOqvc3P5NxKT3NgBCsoCPUQHfIe0OyriGk+87ba0hMoDXrfK5
	tir7hi0Tt/ddD9VvksPLkL+UQ5ZndvF1UfuwhaopEFGzAtON2iK+S99mlsJ/D0Yja17KJuqZtvy7z
	jC9uoZjl94ZqpQwfwlhplv33xKLTJXUwVeQKaa4//JrPpvDZYH7W0y6qZCUUPpzNKmQ3xqFSRhv8T
	pM35CSWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lYE-0000000F35t-0TSH;
	Thu, 12 Mar 2026 19:18:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lY8-0000000F2w2-1GL8
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Mar 2026 19:18:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=KqyayV7Gg2halaaZ+cLaY6eAuvoXnGLGXG1qkIwL1Hk=; b=QY7PTW54yRM7rR7+aPaaPIj9aG
	w+Pj0o4oTkQufqVyd/WUlEpzfsTd0qYNBdqq0S2NOT7JrvMP6vaYtT4OlzrYmnAwwXBbDtl360J/G
	LWeAxafdQuTWGvxqH6lwzQJ8VYlZ3myLI0Haw/zEtUTKRGy06/aZ+u5PQKcIQMTCw8v4fR6X2Bs3s
	Lis5tsCzKMNMjgZpfG6OVddNl2ACArHRpO25ArmkRDYBFFl7RyblL/OGCAWgcQeOU5iDFlrrsjTgz
	e6emXdtdCCTDpb3kY98h17/nVe9iHBEf3f2oMwICMcvpdie0WCwaxMm9iqYgTk9Z54qsTYtiudyCG
	19TXF0GQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lY3-00000001qtO-0tTu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 19:18:21 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CI2PNF4133000
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 19:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KqyayV7Gg2halaaZ+cLaY6eAuvoXnGLGXG1qkIwL1Hk=; b=Z9REE5/i3eJdBmbI
	NwjL2mFHLiRboIcapwNYLOa0x5RwSrnqekPjC321oeeqEc0ojCeNGXzFt83GQSkf
	scTsgUK/wzA1jbojuY1U6nuF2WfANvxLsx+O4Zuff0960TZ8veZIG4r1jRmm53bc
	SOTp+4KoP/kQWV6DPxNdPFvyxThJikJe0lvQ/W3QipjAN6bfUZMt2OZvPabxSYIu
	TgpOYfHgjR3V4WAbsQ47V0NtOU8xQaOURfZRShJoYKClz3O1e+KcETefJnmUEKBj
	OY8J11XmrWS7Z4z/jT//GbYfu4A6wbwn+XdSTJTxJ9HQ+do1aXSrWfqLRAYUPZbK
	NiEMmw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4w3avy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 19:18:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd81be6f05so812124585a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 12:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773343096; x=1773947896; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KqyayV7Gg2halaaZ+cLaY6eAuvoXnGLGXG1qkIwL1Hk=;
        b=cBHvJVYMDmKO96S+LTUEFY9EUYW2/gMjMAnOjtyU71PKbWnDgM8MZqh/IW/GhYT5N1
         FVqVXzVuuW69logqhdMKUidX/S5oy4THxFCHguTtZbvtX6VdQFZKah5nMWxGBBGSK7wU
         1vCJdUS0waLpLW/WzXTu4nw2FX/SsvD6cD3vknhl13f7njXc3GFCQfvx79YF0hsaBaCA
         2FZA1BDHux+//nhv+FAThPGZJLiQmvDNvEa4Ffy+61y1wHokhhs7aj1f+LBYBg2P6ATE
         8pQzm3AGC5rJEJXsbIzGadD5ylh29O/jT7cJMGxnopjwOGfR+i+CAWogSivyQ7JlxPbb
         FlTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773343096; x=1773947896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KqyayV7Gg2halaaZ+cLaY6eAuvoXnGLGXG1qkIwL1Hk=;
        b=D4iP1AkSr1JmHIKmb59eecUFrL+DsKr1nlmtysUcnSf2vDfx9tzWs+w+ZFQU5uctFk
         yWrTg5+ExUcF9EE1LZG2guEowEsFmjl84SlVknSa73/ug+OE05xb7s4UxJa0K0aCmy/m
         B54JWsm0gkj/nU8FmwBQxJKJII1rcH9GtMpJGDIpJcyXeMXdEk5lCwA0H4qkPVJm7kqU
         SkBNYBXaBXAmiHoYycP9Z9tk0KtM3h7jXDIxWEAKfNKhsHx6TUUjQdQgIEwC1zT5MBZf
         RGZBla4IXpLvGsystVOy1x8rgs+W/4litMPoBvDBw6DBZ2oxme3nhh5ZQsYqu8k1uQz6
         7KyQ==
X-Forwarded-Encrypted: i=1; AJvYcCU45TzwbA0SIUUk+WRg+CPNah3vnwphGNgseQ0J6cDzk9Ol3JE0eQnGGaHWtmiEhTbg/DLYynITBvx++0zk9nV1@lists.infradead.org
X-Gm-Message-State: AOJu0YxYMLuGtFyvv2BapVUPaZbgBK7pr+U8hfz3vdzTceE5E+WMV+SI
	XxQzfZEh5Qm+Pg7e567d66m0QrtqNyQryErKKZ5q/xrUAP9juA9YOePLpQgy80DJT5g+KLQ0Mor
	yDcDEsPq118DTzFnIr+y3/iq2duJJ/ib3UA2UmrNj7H5PigQg9r2Bg8I+fmEv2i/PoLgOuW05Va
	lsxA==
X-Gm-Gg: ATEYQzwzKGfAJblejDCdSLqvjbJAyNs8DYTMu757OzmkigBkb9/368V/8dw0ka0grFF
	XYQAy7Qj006aXaQ6Pw9en5fUBRaAShaXxYLkXuWuue6N9eTTvg8ndAajYtlgzglkAN16MAqlgXe
	RPJA42Fonq3ZC0b6jhUlKbdCBD6tpL6y9q9oAZFV0B7xHK8vkKoZF5S8Ibd/vtjTZmHbW/QzMcZ
	YMInhS71mMxglY1WKdwkQgPI5TVVI17dQ3VWmQSkPJoB9idWRq2yxEZNFq1tK7fcN3bglKTpgoz
	r5KkQZDgnD0yDoSuU+mC3QXeEb3nq23zkRYOMdFVhqYe6T8R5AzVtGoctWdiep1OvF+CZ3Tb1BL
	ywInfeqgtDco5kEHJjTQgEoklAaqY2yFRbNerJ/kcfOph
X-Received: by 2002:a05:620a:7085:b0:8cd:af31:b416 with SMTP id af79cd13be357-8cdb5a75623mr117967885a.34.1773343096441;
        Thu, 12 Mar 2026 12:18:16 -0700 (PDT)
X-Received: by 2002:a05:620a:7085:b0:8cd:af31:b416 with SMTP id af79cd13be357-8cdb5a75623mr117964585a.34.1773343095965;
        Thu, 12 Mar 2026 12:18:15 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485577835ebsm1874935e9.7.2026.03.12.12.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 12:18:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 20:17:50 +0100
Subject: [PATCH v2 03/12] ARM: dts: imx6qp: Use undeprecated reset-gpios
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-dts-snps-reset-gpios-v2-3-0d5040eb4a1e@oss.qualcomm.com>
References: <20260312-dts-snps-reset-gpios-v2-0-0d5040eb4a1e@oss.qualcomm.com>
In-Reply-To: <20260312-dts-snps-reset-gpios-v2-0-0d5040eb4a1e@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Christoph Niedermaier <cniedermaier@dh-electronics.com>,
        Marek Vasut <marex@denx.de>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@dh-electronics.com, linux@ew.tq-group.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=982;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=FSagZpYeoU5OgfV3chNg7NHZFc9RhUFrhY0mXE5gWa4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsxFjEgkzNjNpQE+L8JaKg45sCAUdwXfblhUwb
 vIBC6xW9DKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabMRYwAKCRDBN2bmhouD
 134eD/9q/OOzdFfoEz2Oryw39dQ0nJxRBAuXHBSl4fQLO1RiEHYLWdoql7X8N8T/nVWrMSrK7DV
 vJuyUP+3aIKnYD/u/xPHJOhox7AsJ8t9yhcrzXgdtfAiFddQ87bh2+uyjut8zB7cnB/K9VLgYz2
 qkdNJoABJticjlV9njxiSrmNX26/1ibs9nARqx1Dvk6knhncXJjQcXUtvDtCyyYlLflDvCYKSCN
 GMj10bL9SSu5sQVSeGpUqN60TF0tiUJ5mbJSjm+wQCUrI3+KJjpp2yeKsi7s8YnJxgZjcJ1gl3q
 WV3bKqrXkVXPDn/pmzUc195aChLg7qJGmS0dyVJSmENhroqHDNe9MTWAtXMnzUSouTi0Lzr5FpA
 5rLpfHBP/5O2n7CiE72DtAYtm5M+IpvSbZO+DZ+DTgBD+8u2d7iDbtWNMJjFe2QusVNl3bSKYjg
 GoaipT89gqWyrHCVQCdiFug+Ha/W1i3PrVyS3qU1fNFuDWdMamjtsjvC1W/rMJ+7JDRtJDeKqCS
 LW/tbKw30xDHkyDXt3o0oMmmTfJKc9atkn6Yu61DSs8ZnX4tBj10UFhZQLe6+nzVRg7k7GG9NLc
 +qPlvUs8SLcvaekZT8TXjimALzVOZt+xyTnM9l8K1GbYF9g3nfvGwSL+KPcYUt7n9fYwevGc4Ym
 Y6xrS/HHXJjq2NA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: 2t9jXnI_ktzgT3ckNbyNehP2rf7BCxl4
X-Authority-Analysis: v=2.4 cv=Cpays34D c=1 sm=1 tr=0 ts=69b31179 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ujzWiR-heZmsqz2C2nEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 2t9jXnI_ktzgT3ckNbyNehP2rf7BCxl4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDE1NiBTYWx0ZWRfX03li0MLkDx9Z
 awlL2v8pl4s2GsooewxwOWdTHXvOE8pXrC3W4YSuzEcHpnQvoKc5gzcfHJ8LsWHE+nV5e26fDbh
 2LIbOFk021qz9R0XFz670DsNum1KCtE53r25DQyBzxhTZEI7/RQS1N9GfDPosktEf95lPP+EgE/
 j2EmISs/zxyn8CApJd3Csh0KUfVAALt4l8ewBaN0idgHeuEl1xn5+40J1zF3hxEXDYkXsy9NoWf
 bk56a4H75eO40AelKwF9r/yV6+adB4Jf2SxC9AU2qMt0Rg8JmfPIbVKm/w5NUEllShKSerf2r+u
 D6diQ5c27gLxHqhJhDdGKzeKFcPCUn89X3UI37P8JNnf+KdBU9UDWLlyKrCK0K8c0H//oWumh14
 p/7Os5BMnLmb5FQMWmPu4GIJx2a64LxPrXDrfAkNSkKmTumRUfsvwY/icqHT1OMk5bCuGWLCj5B
 +2eQvf+ybQRcGecJF4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_191819_676679_640CFF4D 
X-CRM114-Status: GOOD (  15.06  )
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

Freescale i.MX6 PCIe host controller bindings, through referenced
snps,dw-pcie-common.yaml schema, already document "reset-gpios", just
like Linux kernel did for a long time.  Use the preferred form over
"reset-gpio" which is deprecated since commit 42694f9f6407
("dt-bindings: PCI: add snps,dw-pcie.yaml") in 2021.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts b/arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts
index c5b220aeaefd..2eb84308f9ae 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts
@@ -45,7 +45,7 @@ MX6QDL_PAD_GPIO_6__ENET_IRQ		0x000b1
 };
 
 &pcie {
-	reset-gpio = <&max7310_c 5 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&max7310_c 5 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 

-- 
2.51.0


