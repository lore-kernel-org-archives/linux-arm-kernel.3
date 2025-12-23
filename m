Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0581BE6F093
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 15:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=swioPwHv+v70eeUAVzefRp8+8yRTw6Ca8/QqJVxwAdA=; b=eeO1q45DOdrsu2KKF1jgqjuUjv
	xeIwt6U7JrEXngNGLxd9UxzFGRZFb2h9HhaWIDoFr5Ql5yXQhLuhgQAbTkOqcDAeGfHA5gJ2a1Mpm
	vUv4XatTsJFxwQweCBIk434XGEBCiXesjf1evz3TpQEsGD1BsNcUgDoP6ceXWPvTG0DrL9Ugv0cFJ
	5M0QMs3z/kAnJR5aQkuedNalZ2gJv7liKg/clOnmgOE1cAquleYp4Hb0P4THx3eO4YQs6NSdLZ/7V
	wRWROLmf6Urdx/WLmNUD5xv989DWlwJN3AMA6q4x2ymZmCYynROlewcvuAlqZP/lMrCmWTKUHKc2C
	OoDCOT2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY4GH-0000000Fg6p-3VvL;
	Tue, 23 Dec 2025 15:25:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY4GE-0000000Fg4O-3yPg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 15:25:20 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNBRI2H700902
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 15:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=swioPwHv+v70eeUAVzefRp8+8yRTw6Ca8/Q
	qJVxwAdA=; b=VkraxcAVQ96otXS/ddELXZPa9a5PpPly9e8JmATMT1TYWMEF6B3
	ZipwM70klDB0rOfhwtqrYibZtFbwHPfKbjoPjCjsdqRPbNGvGaa04X6oc2nRWGdP
	lhzxwvpWWrQdb+gYytCZTdjwnIzta75gqiw/rj7ZDDx76+uDJE9HVGytskNV8O9f
	ZnD5J6g3jL0V8/EjseZNSSi77peTEo6wsLeepI6I0kVad7lVoEUlak/eWw9+3Hjv
	/TN7N0ttCbeNeo6ej1/K4o36wvAlNl8M6JtXyVXJLp2AKr9lra0DF2k9PGPzxR3J
	XqNa5KnMgjoTECnJOyq9sfzlls9c5YYjbJA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7t7jrmve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 15:25:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee21a0d326so24911491cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 07:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766503517; x=1767108317; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=swioPwHv+v70eeUAVzefRp8+8yRTw6Ca8/QqJVxwAdA=;
        b=MrfKXZIdLmI7+8JkJYKYjNKVIeLJ44sx77dPN9Ewpa6CfAI9pGqrpSxY+rfOfN5BH8
         XxEE432xk/LoLOr3So+L4AByWeRVCzIc+AAtQ8AYs0QRO3DjrRUG4pJtpu9UspE4S20Y
         rsPxo99nlvu8OMF3NABUQt61lwimJZxXoHqITmSYCdRxYDLW6kmvCezuJBfa7RCroHt+
         VQU3nGaNJ76HG8aFQssD2Qv1dojH98ehF79Pf9AxsbKpuO8uZbg2nRd9OmKZuAct3nEv
         xcYEYu653yBIymO1wXCBqq/8yuXuQhUNow40ViowWWTEf1hRh2PF8f/ItF2R8WphQ2KO
         Emaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766503517; x=1767108317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=swioPwHv+v70eeUAVzefRp8+8yRTw6Ca8/QqJVxwAdA=;
        b=YRhBP+PjgPqE3nzCHWg3bZ+2CxydwLdTM4UgiTnDU/m1tHr5BtznbJFvYtqh65LbMV
         L9niFNfCwTzfZ96CDgtAcxHsOBxX7cSe8oRPPS/u0maJstbgs0FgDNjF0FrBFC/RZS7j
         8uvmsSqM5JMGvEW8NuEXCTOG0J4GUSbRpaKqdO6MWLjCBGMoZ7Poiv8Gd23HHTycMI0z
         a4fTGQBlezN4y6qoyrBy7ettGqsnZamXd0eEUiyUy3PNTDDLPdsMYyouZxx6u4n6k+uJ
         wZ6K329IXiHFjyG+2vDzfRTamuvvDSpShh4nnPhfJgOXIlXTK7DFGUDLV7crkqLrGGZc
         VRAQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0YQ0/sC1iQyQ/BmzYgcofDArYuXX3bMc8gGCHtwt8/4/1k+darnNS5AXOMiS9MNLpkbnc3jZA2HS00YMTXlqH@lists.infradead.org
X-Gm-Message-State: AOJu0YzAjWvrZsKpmHgM29caUjvgv0Ft6VDnJg5gl4Ac9qHmsg6Cw3of
	pwvJscxSGdHHNZg/APqLBwK6zqWcGrMmDf045SCALa1GXD4/TBNTdIhkG0lmADWl0votcVwxP5F
	ALqLw9Fg41XNQY6mgqxr7mRaU71WIYi4HOeirGNInHnzE24DlWu6qs+MEtBO6X63WZrOjwGqKcD
	K7tg==
X-Gm-Gg: AY/fxX4hC2MoRxGjWfh3Vyu0dAZSdF0DkmSC/Hm16CH6UBcLuUayoHXGqRqK9VXFTK+
	piA7CyqR12+cSNwSUSBNx4l/HBBqIHNedPYnTprEGpDq4GU/W87eDBH/ZoSnb3VbPj5py9RVC63
	PluqEyLblJxSyVRCeOhL5wE5ye4W5NQNgp91YY/GHCLuzKTs7BMwSkSWkOVctFJLsoz4YJLyPP6
	AF6z88BVyrHahyF3npNpPEWrtWTK1JbdHp1B83zJGCIi9LGhtVZk9OlInaubMP5lXlZZvnWVUfb
	CosRpVyVQpr48D6FyZgZDtrS8u5ah4xRopsSOFzw5YuxmPa2H+nckNwzb2wxQlXSk26ZXaAOtit
	l1DeKCCfDl9eSS5JDl0mbM/6KZ7/Q8CbyVT6PfnI3qb4DX4u+AsJlWCWNXNQmviABPo0=
X-Received: by 2002:a05:622a:1389:b0:4ee:1b36:b5b4 with SMTP id d75a77b69052e-4f4abcf6c6cmr192921691cf.15.1766503517163;
        Tue, 23 Dec 2025 07:25:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmRbhrmDceASeL3z5pklcWBSlwUzr1ZwN9b83wnRLT3KyyEmN31UjSsXEzCxHiojU90XgHlg==
X-Received: by 2002:a05:622a:1389:b0:4ee:1b36:b5b4 with SMTP id d75a77b69052e-4f4abcf6c6cmr192921081cf.15.1766503516519;
        Tue, 23 Dec 2025 07:25:16 -0800 (PST)
Received: from quoll.home (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0b12dsm1430334666b.48.2025.12.23.07.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 07:25:16 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] arm64: dts: amlogic: Use hyphen in node names
Date: Tue, 23 Dec 2025 16:25:11 +0100
Message-ID: <20251223152510.155463-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1005; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=G66E8fx+L7zfz9oMuG35JIwYIhu6Ttp2Ewl9PrskaL8=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGlKtFbIQzko1XrP1llHftHM4pRSWLxv9oygGQ4ajS0ySTX/1
 okCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJpSrRWAAoJEME3ZuaGi4PX8fYP+we0
 NZIvA3rK1U6S4+XWHbMDwVZJw9AXHLNX/URFNBStFNEY24T0QCmIkWzg6UhLnzsBoEsh1E5mOQ3
 krMl1DoKvIyEfzgv1b9exH0na/yBAPfpv55poAL8F8gp6zAYp/sSFcpyxkv1FCoW87N0Ce6uCKK
 7fefzyJ8FcVrwd3xGrPtIl7MfgF+870/yUgEMMA2t+bPu30xP3h4accapDcrGTOFqycloYX06HI
 t6K1B8JEbvp638KO9wqQvuGWSXrhPMcYVoS1usglzHMevKm1EB+ZcG+X2bVE5ZB21bw0fUZPSpD
 J+tc+PEFL15iqtAqzehehH4ZrqxIlVLiP+/noO4Tf8F4di4seTXUz+WYTnE8tcLgEDpRTNmsGV/
 Y9ZU57n0dORu8O41Br9OGdxy1ybn/PnurBo9Qe+gvPlieJtvmD2iSOCp/YcRdONgzKS3I9KoXVW
 LlzrVmD2t8ttnnpYYlLiEFkKJRYzLmsW6Ph9ZF9+r/9wqJGMgVv+KH8BypJx+jTAgb/cchjYQm4
 /ogNwluZK0siSHrbQcBekjXJU+tLGxnm5FuvbssXcpGJREvdaAtC7oBjtFxYNaMvR22YA634KLi
 DVILZ4UodXadW2B7zn8j4KhFyenJrZecrhcu1YHrJnYJvZc/JXjSdL6C4UJ5adbCljkHuptaXnV 0fdqc
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEyNyBTYWx0ZWRfX6C1AW1fVmWvo
 VCwxGiJRkZ534UGuTByTw6dXXvUShFdSB7y0uwsKZPiQl93Gc5tC+6MlM4mhj28fzerKX+OstgC
 H4mSWlfPW5f26Iv+aytJZx6e6p5snyowhnMWSLHF//BZLilt7rbXSC4kEq9mCTyzHSgm3Wp4ZAV
 JiVvucX2v+/kS6XbzLi69/tHTM3ls27KrPd0rp18H2+dEk9RgSpZvRtzqSXEZ3GbYJTw0kY6DBE
 5bo+p5N2AUFfi5WlM5WdDwn75GPdwoaY2hcxY2C8fbNN+DsLMLFeOZFBIvbt55jQ5fQSuLScMba
 30zLqumEefzybWeLIV6URCcs+HmQltoFi5LTDGm5w/b6lvteB2vVkllHTRcH5Cqj08o0BHF3cUp
 TjB/63kv4AwK4n8UVhphb12T3wVrviUV/R2S+n1l2eijEMP34lbec4gtd0df5m/sUxw3Q1F03zd
 Q9jGeZ8ppix/8P0eOvg==
X-Authority-Analysis: v=2.4 cv=IvATsb/g c=1 sm=1 tr=0 ts=694ab45d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=WFmU4M8xItcfhem_W8oA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Ro5u-ve5RUdF1pJCsOywQWxic4Tx1iYR
X-Proofpoint-ORIG-GUID: Ro5u-ve5RUdF1pJCsOywQWxic4Tx1iYR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_072519_111012_EC7D466C 
X-CRM114-Status: GOOD (  13.77  )
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

DTS coding style prefers hyphens instead of underscores in the node
names.  Change should be safe, because node names are not considered an
ABI.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Patches done with sed, verified with comparing unflattened DTB and
dtx_diff.
---
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
index 13b7ac03f9b2..c9d9f3ddf73c 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
@@ -780,7 +780,7 @@ int_mdio: mdio@1 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 
-					internal_ephy: ethernet_phy@8 {
+					internal_ephy: ethernet-phy@8 {
 						compatible = "ethernet-phy-id0180.3301",
 							     "ethernet-phy-ieee802.3-c22";
 						interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.51.0


