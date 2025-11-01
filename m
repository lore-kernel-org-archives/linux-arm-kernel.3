Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A50CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Nov 2025 04:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VCqahWxJSH0GJ6HwC5OvL8qeWdhWmEk+RK3OoYwwn+M=; b=ezJrs63FC+P4fIZq9zrL91QrNE
	a/Kb0LVvwvIhrnJWGbc/YBUVv1T2mOZ/ZoYHC8RVhCYz6UyXiRTXThu6vvi317cWZTF0FdrM2dDvX
	XUNnWmKF3SYo3+eYNDU2wIOi5OD2FKRDWwbU5xQUCniI1uHsaRyZXfUwetF3uTu61iePN7WpYzp5w
	/2NDQfF9bFQ33ZWhyW+jJFwPczg5154gjctgOqQf5OfM8xavBfuU+kWO5GwLekD8oz5filns3WXsQ
	pYjmza3xGKjweZzH6+yBSv86Nc63Rrkb3xdWikT9QqzS+P3V0Bsn6Pt8Iyovzn2qMCSGtVUFy8TI7
	osY6Lb+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF3Fi-0000000740F-3BEJ;
	Sat, 01 Nov 2025 04:30:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF3Fd-000000073yk-0H2Q
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Nov 2025 04:30:06 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A13Pf96517964
	for <linux-arm-kernel@lists.infradead.org>; Sat, 1 Nov 2025 04:30:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VCqahWxJSH0GJ6HwC5OvL8qeWdhWmEk+RK3OoYwwn+M=; b=grlhPYuuRy7u9HPb
	hY5dmob/1WLH136XMzDHSCFS6OvyQW8uz9rDf7Fze8B4zbOepisIZrdLNtyK52/P
	hhhmY3eLqjZv30PmuAn8IHpFZIyY6ekTm+psFlrfaw0Di2U6zAwSYsdnK8iXMY9i
	f1p0lIhi8hw6R7dGyDdH//g6MDAyZCi/geNQKUsculA+EBiVXpf/QfhYSRuw1Hvh
	xdFfJ7rPE1ECCBMEppxpMYJO1LAQf8u8mrm9TIyZZwZDiAMaA+tPqNc55vywRCEU
	WJy/fVbdl847A9O7BjXvX98VQVxqotmNbln/2XG7u/heTHkktF80e1yCDomo1gXz
	2WcaXQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5a9vg2hr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Nov 2025 04:30:04 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b6ceba8968dso2399324a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 21:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761971403; x=1762576203; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VCqahWxJSH0GJ6HwC5OvL8qeWdhWmEk+RK3OoYwwn+M=;
        b=jM6Ed8qRHhziotkp+Oh4U9sK356GUqzIonVbev43OCUTIzv8PSoddww286sMTecKoK
         oKR/IDvdqsiDKxh7dF1+E0rwAKXFbTVdvirzDwyXiqOOkDkOI6tB31ssmnShk9hQEvYf
         n/WitFmBHwwzcgOHmIMYVQjwracY8NrshR0XMFY1n62Hu82q5pXOcTgCkStedXEqIPZR
         raNSWutf6/Wonni7EQerJC+03ewGiajM/HB9t9+O3E1L01YhkRYntdeZ6VpT0lapnF/W
         ++L/L+Ax0amRjN9NSHWpmrSN776LxbIN02CLkkKRLrBPH1vUplhIOkH039vJ4bNMJkb2
         lVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761971403; x=1762576203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VCqahWxJSH0GJ6HwC5OvL8qeWdhWmEk+RK3OoYwwn+M=;
        b=qIyXONCYu199Co6y1/pCeKoqmwaaY/otQm0v68R8nzCMi9CYWf2fgSETtaLxo37cGQ
         TCv4pQmUsSJ8QXaFMom6K1ksmix4vYTqyOhy28Y0/hUgtNc3oU9+0tlRfJEX4Ji6NShr
         IDLkAfgC9OdubrQLAqwsF7TFMxf59Gt+DHSC/e7CVv4gxEM1ARMx5W/nyArxD0xR8Kmc
         DIG0zFcwt19lcqTm7742Z2TVEVtdhYVYyTkcIb8znxkcowgL5QlgKw3IwpZlysqo7Sd8
         wIRq8ZP5DiDN1PoZoSH5lWX7/fv+vzEwivruBlVaqSr6Cv1SC8fsuCsBVUbpoyG9bI64
         +bbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMA1pg48SuzEOgTitCr8s0NYbBlUCCLIQ3EA4M+7tyMv8bZ60cdhd5oGxnBiU+tNrghr53CIENs2r1iHz0H04m@lists.infradead.org
X-Gm-Message-State: AOJu0YwLRV9XO72yhHs0hvsJbmTWxjFrVKsd+FiU1tL0gsuwj3MgC1MP
	uKQ7kPDg1y8LLtCc/Szkna0IxJvzFxdknuxY3QnfOvN9Ng+rFe94kGuAcDLuI6w6JLmRcq3N+4f
	JpHCv8RuVHihuRlRTI95bpZm//X6B0oS1G5OA5OkIgnMRUK9hl+BLDtlXQL7m74DA4RKtA5flCy
	KA7g==
X-Gm-Gg: ASbGncsGGOSNAQsja/IZuXXQvlSSZtLPBZ2Y53dLhDhHYFhLLReL4myGR88L3I57I9q
	+qB7iAeTobPa/ap9zNyYKZGkymNj/YSkNccnwTUjfv/av328u1HlX1Jf15O6SAN8Y+391eT1Bqw
	i3tvYxPOXRWiXFJ0uplJ6/zkiHT6J+tMMQVzEUV3ImKq0/fhjBS0ij/2kFk3CKloxqak+vQnonq
	KLbIVSvE/H78BQFvgW4LXGnp1i1qUQ1bgd2A1gk3KVU8byPmVTH9W7vC3xxmlxgvqfh48h4OAD+
	4y2OOqSsiMjn/Yz2BwuxGKPQF2W92VUbVPAwsjYsDZVJw+BDAUqAtmvGIImTp/g2U6vSy5Ff+xb
	0XMKKOlSaNTUORLajSvMb2SqX
X-Received: by 2002:a05:6a20:94c9:b0:334:9649:4754 with SMTP id adf61e73a8af0-348cab90586mr8300621637.13.1761971403126;
        Fri, 31 Oct 2025 21:30:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWduze7ttH0fM3SXqrm9M7DW4Z/7xe/Nc3XYQeEd4wKVo1kiDZdb6XskF1v6a8AcaNd0i4Jw==
X-Received: by 2002:a05:6a20:94c9:b0:334:9649:4754 with SMTP id adf61e73a8af0-348cab90586mr8300585637.13.1761971402661;
        Fri, 31 Oct 2025 21:30:02 -0700 (PDT)
Received: from work.lan ([2409:4091:a0f4:6806:9857:f290:6ecf:344f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295268717ffsm42273285ad.2.2025.10.31.21.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 21:30:02 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Date: Sat, 01 Nov 2025 09:59:40 +0530
Subject: [PATCH RESEND 1/3] dt-bindings: PCI: amlogic: Fix the register
 name of the DBI region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251101-pci-meson-fix-v1-1-c50dcc56ed6a@oss.qualcomm.com>
References: <20251101-pci-meson-fix-v1-0-c50dcc56ed6a@oss.qualcomm.com>
In-Reply-To: <20251101-pci-meson-fix-v1-0-c50dcc56ed6a@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Hanjie Lin <hanjie.lin@amlogic.com>, Yue Wang <yue.wang@amlogic.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Andrew Murray <amurray@thegoodpenguin.co.uk>,
        Jingoo Han <jingoohan1@gmail.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1877;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=hOzRlMRlpIFq50j9dDHMLuFdaWiwUzshHPxiwOpWbK0=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBpBYy9zq4wJrz0r3+6uCkCvsMmwRZUlT46YYvOf
 J+G28QVziGJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaQWMvQAKCRBVnxHm/pHO
 9T7WB/9nIC9CiMtsjFOltn8J1++MX+wQ/k98V/p+0MAawJkUXXMpCNwLStWI1NmCyUkr8N20efv
 MeYn4YxpBpJesUMCtMvd8rY0ZTPNM9eygq7GWsxlcIkJlD2vnxBlSgXs5sHGSzcgIIaXIaxG5EQ
 lPY6zr6SEfF6KM7y43ow45Qon28ey0xRI1EbMExZKnmclQKdqWq9HntetUgaZVMOvQTf2bXsZGA
 wTvDOztHqK9IKShy3PiYFTZc69Sp8rh6DLOV1pHf6lKsPPCeRfN9Cke2ROnJvnKvcXZIdTbDndf
 ymyWWbXKvW+eKG4O1aQbRvM997tza5KQp3LFXjTU1VPlJNz8
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAzNSBTYWx0ZWRfX+BWWg7+vHCRZ
 v1sM+eX3Dq2B3Ylq9oigi5baVTMb/UJjDd8fONBcxBUp+ezM7fHfVRAzAWe6eLYYiAA1mes6RFz
 Ka7m0qz7dn3my/ctsGp0vigKGLZvFNKEVftZ+TdIDgbOgwk/iAXYW4FexUUGzkQQdZetp53Swhy
 24eUx4ihMOLq7ByC8xwhamZiW+FnwKsbNzUJ7pJ33eBc+655qu0RJK+uc+cVOILjYF7nnlwdQyf
 gpgJRqKLpuwZyHVxtgcT3wJ5Ei/ALiZMAJ/DqXW7bGtqEeWcg3b/51ffe+v6ATmEQbwkVC089kH
 a8NM+SJ8dDe3SRsDvBGNBkcfPLwO5o/ybAC8TiWftqhV0PJp+WjuCO1yorzxbimQr6org8tL6S1
 mziGW89NqoiSsC/Io9BDLMF/xG0lDw==
X-Authority-Analysis: v=2.4 cv=c6CmgB9l c=1 sm=1 tr=0 ts=69058ccc cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tsNw8QEO8ZJO9lGSRLYA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: l7pH_TftK_Vll7fjj-oyEzPI0nLkNwZK
X-Proofpoint-GUID: l7pH_TftK_Vll7fjj-oyEzPI0nLkNwZK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511010035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_213005_222953_930F0868 
X-CRM114-Status: GOOD (  13.60  )
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

Binding incorrectly specifies the 'DBI' region as 'ELBI'. DBI is a must
have region for DWC controllers as it has the Root Port and controller
specific registers, while ELBI has optional registers.

Hence, fix the binding. Though this is an ABI break, this change is needed
to accurately describe the PCI memory map.

Fixes: 7cd210391101 ("dt-bindings: PCI: meson: add DT bindings for Amlogic Meson PCIe controller")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pci/amlogic,axg-pcie.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/amlogic,axg-pcie.yaml b/Documentation/devicetree/bindings/pci/amlogic,axg-pcie.yaml
index 79a21ba0f9fd62804ba95fe8a6cc3252cf652197..c8258ef4032834d87cf3160ffd1d93812801b62a 100644
--- a/Documentation/devicetree/bindings/pci/amlogic,axg-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/amlogic,axg-pcie.yaml
@@ -36,13 +36,13 @@ properties:
 
   reg:
     items:
-      - description: External local bus interface registers
+      - description: Data Bus Interface registers
       - description: Meson designed configuration registers
       - description: PCIe configuration space
 
   reg-names:
     items:
-      - const: elbi
+      - const: dbi
       - const: cfg
       - const: config
 
@@ -113,7 +113,7 @@ examples:
     pcie: pcie@f9800000 {
         compatible = "amlogic,axg-pcie", "snps,dw-pcie";
         reg = <0xf9800000 0x400000>, <0xff646000 0x2000>, <0xf9f00000 0x100000>;
-        reg-names = "elbi", "cfg", "config";
+        reg-names = "dbi", "cfg", "config";
         interrupts = <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>;
         clocks = <&pclk>, <&clk_port>, <&clk_phy>;
         clock-names = "pclk", "port", "general";

-- 
2.48.1


