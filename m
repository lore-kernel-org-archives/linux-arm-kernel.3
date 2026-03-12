Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C9D106ACE3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 19:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F5OsB/HItLJlP+MT0p+X93pBrSZTfPHNoWEoN+Lyl2c=; b=k+WMriALJFWaH1s834CGmDPVCJ
	9A9K1DPCDWMeQUQW4ukTEWl6Ll0hIpgGSv05k1yxFB/RF590WAE4kIFxAf7Z6j24+US5MItv27DGH
	FtIJHH4WqXinYOyDxutByPhtHgUTlpI3oF1rhhtqNwVffIiWj6vcllVIEGCbKvBMxl84fk3yfTjic
	HvS1oDJY0rF6L+Mc4ukrk5npbLZ3LVy3tHjagbytKm4XIi+RyQRSf80QiHUOUZIMB8E1VgIa4eeyO
	f2V5sCjYRYcqDsokDvvfzkHADYccbJSgeWLe0LFQUFiECIYwxAliMvXFkb0R4LI82JMVwBXDrB6QJ
	JH9valCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lYe-0000000F3eh-2HVn;
	Thu, 12 Mar 2026 19:18:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lYR-0000000F3OW-426m
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Mar 2026 19:18:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=F5OsB/HItLJlP+MT0p+X93pBrSZTfPHNoWEoN+Lyl2c=; b=dEp+W+rfXvrxU9ZQv40gExUd9V
	kkqc8QNqv9A2U4wLxiLB4/SfYSQ1npll0OiK9N+wbzIUMhjD3m56FbQ4m1TLzd9aClgX9S08RHGGc
	OgA2i8qfcDwb3gyH0rSLvTpluZiIHddN3N4A0YHwipkmMp9RgNsPdE/BCbyDkI1yw8Oj7pqC9r+FL
	IIduPccFNXknMhaQVJwlMOpXZVJpJJI7kPuLMucqumqao5Z/Mrl3TR8YrMemE/e2mdockRvi2EbEJ
	J2tqPUZYH+DKAfWK0b0hs6CoZLFiHm4nKqMQLCZ/G6zXRjMYewSYK6i0Y3MJ2vUEQswpHSC15nd0p
	yP91TZ9w==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lYN-00000001r3P-2CSC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 19:18:41 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CIUq3X4132898
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 19:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F5OsB/HItLJlP+MT0p+X93pBrSZTfPHNoWEoN+Lyl2c=; b=We0lFU1AOo0Ik6m1
	PIE39qlUc6OZPhvhMKcm3vRpnV9tnFvTpSoCFLa+qyrfFU2/3hsxk4IovsIkGVRc
	CO4RklWgPCtcThKReHDoUcuZVthvbBfR+Uhvg2CVDiVqRE5BGYdbR3zmUqjUGTDz
	lKk4dIRwjUjihuHgBNZUHEtICchcVA8r5QkgL7gOcEK5IfL1iQQKKd3gn0eLFEen
	rSKNAaEFw5DcTUKqGNzL/ndybkTnNFDYYLJqWndMao8pp2xIpIb4gmxkRzCc8ccI
	rVxf5p3JDBSfoXQiHeyQZmhN9DZbywx/UE5IsFw418bvsM7w3qHlv1guNknlvjiP
	3ejzOw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4w3axs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 19:18:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd81506677so764500585a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 12:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773343116; x=1773947916; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F5OsB/HItLJlP+MT0p+X93pBrSZTfPHNoWEoN+Lyl2c=;
        b=hPmI2aODjrhTH4weSL809JjrwPULuVHb/7QUIrFZVuMpXZ65Ylgo9JxNS+FUMb5WkM
         NeIc5r+VK5ip74mBBhGIC7p8okq4rzWD27xhWTUi47W2uvFuoWG9KywLI15DlJCfEOSo
         gvKsJznV1YdivkKMuTpswN4eoHdiwf3MOCFbkLZ7nPil5FPoIrFGintCErDdOia21X7q
         J675Q3IVfzB5eQfuNWngdjQmpuMKGPyF0/c08zkmzsP4t+L8qiR6nT0XZ7Tcy5/wxcLW
         r4g5CCkjs6WDTX1ltYEQpy/DUHpCG5+cJMV7kI2JYVXO1cKN8zhjwqFmvnc+NDpstpNn
         jPgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773343116; x=1773947916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F5OsB/HItLJlP+MT0p+X93pBrSZTfPHNoWEoN+Lyl2c=;
        b=ZlOCQswux+9Y9iJ7yrbEjVeRD6bdm1CjWMpcF3Fqx8YwSbHzUKErBz+tccwZej89eP
         FldjHHj02fiXU43tao4JeJ9SNRTEX8gKi0JsolkxYUtaaLacUj5GrWbk7S7AD2PJ+Mk0
         GTO3CY2aMinaUEHqGsGaFiNVEE7VYXlQspyGkHoc964ZObdvdMzckt4mB5aNAga228Mf
         Av0b8abOHIZUvTP7tE9RRZBX6VKgcX/q4h7G2jggqeq8ZRHl0VfhiHinzLZ3AcXdtbnF
         G5woXJx0CCTdh8v/RBKcAoNzqUiACV6TwGnM9q6SAX6efkg367qJMwFnAjDzDZ6drDlM
         QAOg==
X-Forwarded-Encrypted: i=1; AJvYcCUsKjXM7N2Is3O3O29bcMVf4s+0TfwHxh9CG3J4H2qSSmZNWkAEnZlC1tPsACnwkvAmqZglKCLQTTbqRPFmnF/C@lists.infradead.org
X-Gm-Message-State: AOJu0YyxJiZXC8nYeFe7UqyHxOI8DXFCV9cHEEaT/PbzpNJWVUmE8KgN
	rHzdGaIr3I/7o51S0efVGl/+5YcYDXlZBrYZPkbgIzH9IPAYWGVmgmn2VCRKHRVXryPE9I4+Zgk
	B89z4hsEiFdFx/Xzk1Vdcs/0tVssyVQYG6sdM9HurExva0/2GFoYqUW6gOebu1tlJ3Mqv6LMAKT
	Hmmw==
X-Gm-Gg: ATEYQzz9Hnmq3WOZgfU5ImkuVdvMypXJZznhDC1ydiXvu7OHW03LNPt6nQUuOwdJgFk
	5uHbg4E1C3B8Ic9S6b6OwqyNGfmenm4atA77p3Ig3W44HO2/P0UNcSY3vJCUNCwdXVNxhiWnaOk
	558sQkJqxjmqZMMbx/zEKy5xMv3R3oI+vpqY/dxjiS3vCplzdRQxmW2WzCBc2Ffol1vffOFWuO0
	H3Ms+Uq3uMYwCjYSaKYTJF+bp4LuFPoKuQoV2RosOGHDSy0hfyrmLzmYOO9wPASDSMxXOwOEpi1
	0TgO4dVXELb0mXtVotYkd67DaJIigd1IOEoFhLjgRXuNqPJiUXatX4mcKTBGrhxSM5hawbZ18js
	IlpASjtbSkjulfNqAr169F0DyL8qQQ+TUZsLeA4D+ahTg
X-Received: by 2002:a05:620a:1983:b0:8cd:b33f:1832 with SMTP id af79cd13be357-8cdb5aa5419mr124302885a.28.1773343116370;
        Thu, 12 Mar 2026 12:18:36 -0700 (PDT)
X-Received: by 2002:a05:620a:1983:b0:8cd:b33f:1832 with SMTP id af79cd13be357-8cdb5aa5419mr124297485a.28.1773343115803;
        Thu, 12 Mar 2026 12:18:35 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485577835ebsm1874935e9.7.2026.03.12.12.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 12:18:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 20:17:58 +0100
Subject: [PATCH v2 11/12] ARM: dts: imx6q: Use undeprecated reset-gpios and
 drop reset-gpio-active-high
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-dts-snps-reset-gpios-v2-11-0d5040eb4a1e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6359;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=N3H7+2vtqLg6QQ4dN2zo7tRBw4lRUW7IRodijLAqYE0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsxFqasB3p5OKn4gp6uF+7tjGNif+YMMHawHjP
 KdHswytElyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabMRagAKCRDBN2bmhouD
 14hyD/9d882WM29V8Alf41+0m7Cw1LLTS9hrbKqwz2ZR/5qLY5yckb83aIbGX9UJ7KPg1Spm+5w
 W4rtNgxvfURgninwzYzUXLT0xYlJW7zI6AMKzHhBQVFKcjTD+BtDdv4qQTFVk6xjzplR8Q0UdTV
 I9fjoVsByp1dcYtc+pNYJ9D3kXWUrWMRWJSL8Q6bcNJUTnsdEKbs2ua7xyTs6ufXWLn3Bt+GNhE
 BmGqVpEuJ2f6tRgx3Ddl2mR8Qw9igvx7k7xFQRbHZ9pDctnWLdNrRtoSKLzcpXiaitu/g3Qb6UG
 rXBKj55uWLcYU4AU8lW7I2t41Oz+P1/5etL4RVDFQS7Ecu+csBKuum0wrO5nEEvaViJ3tTo/tfR
 HUmcucd6JwSXoEsaptT4HJV+pJ8J9pusqoY9wYLQiqUixcdrWO9i/pkvlCpbRDgeMXQV/q1EDwp
 L5HRTh5lj/kxQH4+3jr3FpkwMrQuI8UTCjsTJuF8nUl1EkErVj/q5msHnf3XH0ysXTxZl6ld3SN
 Jz5bvc3LivSAtGxSZOzHqJ06BcJpXbMqKG/6IpBdaSyT8mYxGn1mhNI3fB+nfJ5LDJstP1m3f43
 N1cAAg4dmqJi7YL3EuQrTNQYIKzlrErI3Z8pgi2oVBpHYxlu6AI7gCU6DlvfKVxGAnLywCMHc2w
 ExoKekrZ1bD+61w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: 8TU2MW9dgacx_TG2L6fSP5MNMStUqbgU
X-Authority-Analysis: v=2.4 cv=Cpays34D c=1 sm=1 tr=0 ts=69b3118d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=TSsFHv4FMKH2p5kP-T8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 8TU2MW9dgacx_TG2L6fSP5MNMStUqbgU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDE1NiBTYWx0ZWRfXxI6yCRHAyrrb
 I9HHDiuVbpxNKWfDSkKl6CYBDPk8IltDdzMR9zbdmfUYbofCiAaMGmYgyvGjU81VQB3n6Jap5FW
 JCnINNX5QDh8XG4cHx7njzPbmas6VCZQvi2cnxBh3Ag2Ut4CuJa6cIjLE6K+m8GcYSE2pmsJUQT
 JT1ckq9GdXfuScaEL+OuCkqakGByS/WdFr3XbOBvJ3f1jRDseV85aHRyquk/9l4btBP3EweDQ3+
 zIrPAXL6VkHasd7GVx74jJRSJD8HApoYJnLOT3EDMIh7BcERZj4l1taYZ5m8MK0N5h/tC0jfJ8A
 AEiJYIwZbQ9oxGbmlPz86W2u4NyiSHrbxw8kq/NTYzkMRQZPrL2cNocAUivjOy0+L9CI8BU7wSc
 yJ8aB0e+x73/7m5FVMBoHn04Za45VtbDY9syKYKZsDSnynANadkXQuk9lLNFHQjdhNzRgBEtiJP
 VyyPefcSSLMxzQzumWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_191839_926096_3C186549 
X-CRM114-Status: GOOD (  18.00  )
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

Linux kernel already properly parses GPIO active level from phandle
arguments, thus we can also drop "reset-gpio-active-high".

However this change will impact U-Boot, because it only parses
"reset-gpio" property for imx6q amd imx6sq.  Intention is to update
U-Boot to work with newer DTS, but any other out of tree user of this
DTS which did not implement undeprecated "reset-gpios" will be affected
as well.  There was plenty of time for these projects to switch to
undeprecated "reset-gpios", though.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Drop reset-gpio-active-high, update commit msg
---
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtsi      | 3 +--
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts | 3 +--
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts      | 3 +--
 arch/arm/boot/dts/nxp/imx/imx6q-ba16.dtsi             | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts            | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-dmo-edmqmx6.dts       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-gw5400-a.dts          | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-novena.dts            | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-tbs2910.dts           | 2 +-
 9 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtsi
index b6c45ad3f430..87f6c865f5c3 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtsi
@@ -55,8 +55,7 @@ &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_reset_moci>;
 	/* active-high meaning opposite of regular PERST# active-low polarity */
-	reset-gpio = <&gpio1 28 GPIO_ACTIVE_HIGH>;
-	reset-gpio-active-high;
+	reset-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
 };
 
 &pwm1 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts
index 3ac7a4501620..021d402e1310 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts
@@ -146,8 +146,7 @@ &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_reset_moci>;
 	/* active-high meaning opposite of regular PERST# active-low polarity */
-	reset-gpio = <&gpio1 28 GPIO_ACTIVE_HIGH>;
-	reset-gpio-active-high;
+	reset-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts
index f338be435277..1aea31902a34 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts
@@ -93,8 +93,7 @@ &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_reset_moci>;
 	/* active-high meaning opposite of regular PERST# active-low polarity */
-	reset-gpio = <&gpio1 28 GPIO_ACTIVE_HIGH>;
-	reset-gpio-active-high;
+	reset-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-ba16.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-ba16.dtsi
index 02d66523668d..7de8cf7804d1 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-ba16.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-ba16.dtsi
@@ -344,7 +344,7 @@ rtc@32 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio7 12 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio7 12 GPIO_ACTIVE_LOW>;
 	fsl,tx-swing-full = <103>;
 	fsl,tx-swing-low = <103>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts b/arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts
index 13245af8f74d..ff6c16b9a1dd 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts
@@ -468,7 +468,7 @@ MX6QDL_PAD_SD1_DAT3__SD1_DATA3	0x17071
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio1 26 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 26 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie_power_on_gpio>;
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-dmo-edmqmx6.dts b/arch/arm/boot/dts/nxp/imx/imx6q-dmo-edmqmx6.dts
index cbe580dec182..5a3783d8f15c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-dmo-edmqmx6.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-dmo-edmqmx6.dts
@@ -425,7 +425,7 @@ MX6QDL_PAD_SD4_DAT7__SD4_DATA7		0x17059
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio4 8 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 8 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-gw5400-a.dts b/arch/arm/boot/dts/nxp/imx/imx6q-gw5400-a.dts
index bf8fde9cb38d..e9a4b9f8015a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-gw5400-a.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-gw5400-a.dts
@@ -330,7 +330,7 @@ &ldb {
 };
 
 &pcie {
-	reset-gpio = <&gpio1 29 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 29 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-novena.dts b/arch/arm/boot/dts/nxp/imx/imx6q-novena.dts
index 24fc3ff1c70c..0cd0443b9df5 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-novena.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-novena.dts
@@ -459,7 +459,7 @@ lvds-channel@0 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie_novena>;
-	reset-gpio = <&gpio3 29 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio3 29 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie>;
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-tbs2910.dts b/arch/arm/boot/dts/nxp/imx/imx6q-tbs2910.dts
index 3bd0e2c9e57a..fbd1dc6f6414 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-tbs2910.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-tbs2910.dts
@@ -174,7 +174,7 @@ rtc: rtc@68 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio7 12 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio7 12 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 

-- 
2.51.0


