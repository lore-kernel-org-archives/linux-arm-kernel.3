Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF4D1125850
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 16:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mElEGJc/QiRCvz5IlwWov/EZdnYuY229D3PB+C8fVNE=; b=jVcXf/0pr3uijRse7x6eGIf8ng
	z7DY7lS+yjdied2skuMLVxlf6vSfUADivUqtITHk3kCoQecXyzy2rLAdbjh8aYKiihWRLnucZHjFR
	A7j/waCPTQiYmirQPP4wkFPvkcVdeMXNr1DFhBnrl3EJ/wZnUv0w2/lz97tH4Lc0aycfCejb/Ed7u
	LVdv6ZC8zXoDACEK+U+fIe/O/xTD3khvZYdG1ctQ6uh/wxXjqxLZ59PFUEpg96nLJFtdJdaH7+P1u
	T1nUGD0489YK6lBFoc8vI3C58w71Zb7j2A2dxEzeChOc5vqCIVa57VKvAiRC69jaXk/5a+tbQ0KGE
	V+5Noszw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0M6q-0000000BsOI-2D8s;
	Wed, 11 Mar 2026 16:08:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0M6m-0000000BsLQ-1dYX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 16:08:29 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BD7t7M4032609
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 16:08:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mElEGJc/QiRCvz5IlwWov/EZdnYuY229D3PB+C8fVNE=; b=Fgzx9HByGfIdmAdp
	O6LwzAW5seEUYvidmrjvNhfmsNeTP+S3RlaQA+7AAuqz8WqqCjRt4xxDeb8wBY98
	gf9+npYgercvq+zI5Hlij799cXbMos6OyrBKyis9Y2wbtm1zPCxzIm9UaOXW0Uvo
	kumY/L6JT5/TReBD5etcMOoUsdlhQQRG3i2y5NibEsXeFKYUcVCbcRLGxOvb0hp8
	zn1taouTr37y6AnLk0VFu7XRBXEv44Wi37IUgaN7MOR2OFfJBpqSnSGC4fmlVlcK
	RMdBBLPtuhcsZ8Z2dH0XcQiLnfgeTq41JC1oAXMNRzEjzi8DduCbklWjrhfhNLxJ
	neSrsg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu90t8qwu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 16:08:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-509172f1134so280151cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 09:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773245307; x=1773850107; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mElEGJc/QiRCvz5IlwWov/EZdnYuY229D3PB+C8fVNE=;
        b=fu0VETuD9EpIWjlqTLr+x16TttUQqeQrr6sboZi8VmGLyYvsEX0iFf+9cF5faIp7d1
         lKYnCbvwET1GgUzhNjaN3JWUm0VMHVVZKu7c8FG9OOvSkJhtLaCWtP5myDYsUE5fI7sw
         lAad6BRMCdf5HmWMgd90X6uDnznN8/jMxMm+ko7OfQzW0zVuIWeXhKVMeWhLBvRl0BMl
         7nWOQWT6ETwpWvjPgKWaP4xHjmYagPH4k+DYSSUvEt2bo/t4eW0tucR48k7gUYwXoc2d
         Trsh6TOGsHpkVFnGvstqmtolIeDmDM472RFfR/t7T/ri7SjUhDt7YqLOHB+B9cFSGHCE
         RO4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773245307; x=1773850107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mElEGJc/QiRCvz5IlwWov/EZdnYuY229D3PB+C8fVNE=;
        b=dWSUo7ZkNfsgg9T1P2P3vqY+o8JZgW+wi3Yi+oSgDq+a3jjUPXLoXpgqSLxse8e+QR
         ZYWfrXhN4obmVNC0SXqWb6zxUI9V3PDuZ7dbE+CrKaDpiclZyDLMN+G/EGcF/Ps//LjF
         WjmbSGEHh8pwv9+AkBwFDKueyTPWm5yb3fBG/+/TetoZ0eLI0u5EucwF/p93dEvLDJQT
         jSrGIDW1H1Y2S4rZRvctY76rWS3ZI3LB2dvkH9WP2suxFZPxh8/4QdXPSIXSQuO7rOmF
         ugEhcmBfgetP8Bw4JBFswLJz2xIAI7HYS4wheoQsXQ7PhxgbwzIINnCgFAzWRAwUECn2
         Mtjw==
X-Forwarded-Encrypted: i=1; AJvYcCVR5d6K6e5RAsKnjjAX62+72xjMmk3y9LvOxu273d38wygC9idkoZbWLlC9z8oy9qei9IZkvuX1AdkbzbwXVRA2@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4+UZbh55Ar8ZzOwOtQvB7vuGgz/EhvLP5grMXRRLr37TkeIYm
	Yos2jhWKeA1e9VvIjawQp+KxoveC/XlMgVoVycCvayzznyH2GqFdeuix7S/hZf0EyXyIkAII85M
	TPgmcEOkaD1KvFTRH0c8rYJbQ2U70Kel1Kx2lv+aUTGTm0OInipiSw2NpY/oAwN+8wkzhlyjhfS
	p0cw==
X-Gm-Gg: ATEYQzwWCtc8fb1JP7ey8AWjCvE42yPBdFcSH3XCuAPEfcAt8GeKCTPv6sA85DjiApF
	eG1GmGnaEzPKmYXzw/++H4Hsnq5CSH4bb6EzBDud2l9AXvkt+1dpJMu+QTeIfKUmTcTZDnRKsu4
	spsGygBwh6t3uelP7mnFUkhdL/57mhhHwqUuLl3SC1WTatTzmpF4tDgdWHfIPUWtumaOkZvJXIl
	EEF7Zxgfu2i4GRJzWZwhJl3usyaK0euteCUXzMN3LAoRk0hx9fKoiOG1znrv0n4GJDAXN/EpgXL
	ieJsbP2HJUUDo07Xu/V9A78CWHmdikv5HwlBxD14kEnXbK+hmiPAtfZPD4EEEGCv+S8PpmOLLCL
	dQMSCrXpbMWP96n6pac9xJOMnlSMloISeC2agXazED6EY
X-Received: by 2002:ac8:580b:0:b0:509:cbc:1277 with SMTP id d75a77b69052e-5093a16af68mr40237271cf.41.1773245306999;
        Wed, 11 Mar 2026 09:08:26 -0700 (PDT)
X-Received: by 2002:ac8:580b:0:b0:509:cbc:1277 with SMTP id d75a77b69052e-5093a16af68mr40236581cf.41.1773245306490;
        Wed, 11 Mar 2026 09:08:26 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1aa2c3sm184711f8f.13.2026.03.11.09.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 09:08:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 17:08:00 +0100
Subject: [PATCH 04/12] ARM: dts: imx6qp: Use undeprecated reset-gpios
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-dts-snps-reset-gpios-v1-4-ea1cc09fba84@oss.qualcomm.com>
References: <20260311-dts-snps-reset-gpios-v1-0-ea1cc09fba84@oss.qualcomm.com>
In-Reply-To: <20260311-dts-snps-reset-gpios-v1-0-ea1cc09fba84@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=971;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=CbxUYYhcGr5bAijJBwqMSOgztEvk7KUeq6ljk3HDbJo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsZNiu8NEgmuXR+CahaN5WfJ3wczpP0TVQ9YuS
 igvpG3jCT2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabGTYgAKCRDBN2bmhouD
 1wRuD/9lbnGnZakL3WnrxuZFyn6eVTWDihodOeuH6JYoKFuJJppPZkn3YPc5C5E/2l9yt6mPD+r
 QizQ9iKXrCBCdyzTHbM1rwzJudPL8dMvyvLeFdD3pablT5aItj7fWsM02y76bqnnXNNAf8twDgn
 Xh8Kr8RuKN4tegOd6c1DNmU2HYJqns0yCP3ZW1ZpDF8sycGxbgBz3fMIz14rENv9tpLRZ/qeCTn
 bZap+dQQV/u1fFjudn5reRYtdfO4oqIz74vQeLgcKAOlXig9jlh3tBW7ek0UBNMS+1cp53FV39A
 T0LZPQc826ZNsbfISYXE7LRb3NTTHy1uS0lD/5b2xnniyfJdWJiRdLj6uMDkQwxjGHUg8N3fmUe
 8Q6ZrPLRkYfPOzEl1U7QbN6dZt3FwUiRpWJ7lgwT5xTUzS+jJhUMpqZWqr+6iUiMlnVPAXC83TY
 0l2+9udTaJZtwldg8c1F0JQvTTjcGhQqU9grMGHRs0f59jQidXRse9TRBJ0bY7ApfCwYSpSGQBN
 AGPwDVwzvIviA8jpmMfQiYsphmuJ+OOcKc7beTmIdHBNUuAJAks/QFTrXWEmF3JJLN71uaYQhvU
 LXvBHSn1LgCLjTisURJzZX8yplxAES0M0QiiWXmInsQr4g4JXRgwNiFK1CS4R0RcgohaqclTol2
 cGkH+XfX91wJgOA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: Gzv1tSH5DFDPjXvhxb96ZdmQKzxlhbe4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEzNiBTYWx0ZWRfX8FhOhNjinELe
 GoOKiERp1jevnmOUqY42afsdEMPWpEe6aO3eQ5heZJAac/oo4aA3gf09CscXJM1BaM1EvGXQjfY
 5kkM8DNHOocOlOQqSKpJSaR1Nh9h0ux+uYKiXulUmq0jHEFhMP4UaDrhVAWtCAsqozRBCg+5UYe
 nMjDOPGiu1+NhjA9Y/Rpw1CppXLdtsYYRj6f6opmf4dyTn/kKBkq6aGRJQZwIHmoDNclywGojib
 iws2ivZ9/REB12/Gw3EVhJ+zOFmRq2hUKgRyeb9I8nTRGUf3kcdvgMJJ4W1yYDwrPW+zb8bGVEG
 qiFcFiRwKtx01/jh5PhZPLf+ijAfp7zQY/08PjdRR/K5rwjoiG42dv8KV0goecViq0jNRGXcD+l
 gSSH/RW54DC/tJyGP7MdNaIGEtxECoatzkPXCC68NbfefcK1AeALmVZbw9+oTVSxbUubGFWWCYg
 uTGJtbtDA4B7YY5m8Ng==
X-Authority-Analysis: v=2.4 cv=DfEaa/tW c=1 sm=1 tr=0 ts=69b1937c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=gppIO-ZMk2ssqBZJiK0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: Gzv1tSH5DFDPjXvhxb96ZdmQKzxlhbe4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_090828_447468_3C9F6E8E 
X-CRM114-Status: GOOD (  14.85  )
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

Freescale i.MX6 PCIe host controller bindings through referenced
snps,dw-pcie-common.yaml schema already document "reset-gpios", just
like Linux kernel did for a long time.  Use the preferred form over
"reset-gpio" deprecated since commit 42694f9f6407 ("dt-bindings: PCI:
add snps,dw-pcie.yaml") in 2021.

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


