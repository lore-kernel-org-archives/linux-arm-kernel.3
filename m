Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A6B0106ACD6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 19:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qUMXYVupAC/oXs1qHQXgK4lz3qO12f7R15hKpGsftlk=; b=RKI3uQCEH3vEcO
	jjZteBF364smiDeFmRGPDgSKSb8fFjwks2A0gTmFr4Y4UOZxEzkGDSYyrXhJAXNZVyDvtAz2yZADh
	Htu6KljiX4G+KZ01HgPfCXc0i2OloGhVXS7vJEfs1VoPOqBhMOetnpv5fg+cGyJ/zB1XqlnuX7qaM
	dK1ocldE/xs3uCbPxnekOfpoVHMsucPhk+gCTViCax3zHQiQ8iSrhwNzjxT+tdyjBpcqsU8pXpDRW
	Xrff3A/KOLaKexy5P0bbLQvqRHrL4Z858B0QwrFr55j/5i0+qqmGKV2xZVmw9G1leiYggl7lxgLo6
	lljco3LxRVo0l1EtkgjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lY7-0000000F2wV-37OA;
	Thu, 12 Mar 2026 19:18:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lY0-0000000F2no-30D7
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Mar 2026 19:18:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=qUMXYVupAC/oXs1qHQXgK4lz3qO12f7R15hKpGsftlk=; b=IGptsV+NDrJ9rYeeMg3TTRL2m/
	cJiAdGknye9h/sUi18FPf/xQZy2iBaRoi6F6vh6l8xRa1I8+yfba3eCgsJuWFBTqk6dZ9whUdtZPd
	VjVUM8UOv73JxFTaCCZUPEc4wBvxGoNpGsgCdkyzdX1YYti19Ju3wc1XxODmqXfDs3317FKF3iNF1
	E1b3PLbUImL/x1PGVRik3RzYC33TrP5DVhOMxTgQ/UoEtn5ZM34Cvsw+fTWkd7lzX1lhfOGD2hYoh
	k6S5GLsrm1phj3XsXys1W9ly+2UvyA9ex5BGpHbI8iJQq2MCOrRkDsUCF9dNKV7E+bTuHeSdPSWrk
	gxaMGccA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lXw-00000001qoq-2XMv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 19:18:15 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CIkarg587634
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 19:18:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qUMXYVupAC/oXs1qHQXgK4
	lz3qO12f7R15hKpGsftlk=; b=IeT3ObRZ3TmfjGHBmLChx3FwtTv8XxtT77f+2A
	nNOYuVbPVNXZQyI5tXLoYA2pA/fD2e1djNYt/EeodGFfPEQfHfjurkqrBp1LASHa
	0cMV2HtyJ2fwG45r/sQ0vv06DP+3Ff6gQdBTciUOGNf1ynO5C33OWhuJpAhtfB8s
	tYDOjqbjBCfgMwxbr9ACfgJYE7NHPlQ1+MKriIJFN8mntEOlz5vFDad+7KARJuj3
	AXyJGICnu7F3XVaVp42QqIGu8sniZFyc/gnDfm6nP85GeYTkcPc2/Dc+WpfZHa0s
	mrjBfaL6d9K0ylOmHQxKM1a8yJMjkdjcmyd79ganHNOZIixA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh5q3a6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 19:18:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7c4ab845so584757085a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 12:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773343087; x=1773947887; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qUMXYVupAC/oXs1qHQXgK4lz3qO12f7R15hKpGsftlk=;
        b=UxHj75CHoDxXY9uhDWbHc8CN+Xy60W9jQYMPeDbR2V9eA6gLus1Gy4sCPaN9WJ/4u4
         y272GsPMB9GtkXg0brWwVmsMlRnwhqb5/CR3XqE/CjhxGx2yNPPxCLk9yVviGkNiPNtW
         dwsqrSUjoyJd7mHUN+yYtLeCI02WGy6S/6G3Hol299vzOlCaD5GyXlUzguNxayu/5EjF
         PYlx+VkL1ENTwsgGeWxbvap0cui5Cxq6I/4gZ6MG+Wz19RjJPYd8GAgXyjAJNXWkk4Il
         3EovRW/4wFtYO5i6tLLm+DQR1RxrS7O8PbdEr65ziC1ltM3ljjYqLc81Fm4uXjIl4Nmw
         jhXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773343087; x=1773947887;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUMXYVupAC/oXs1qHQXgK4lz3qO12f7R15hKpGsftlk=;
        b=jDpEonhGwtRgLZX8TJAyJoPwNy1DDYIluaqZy02medfxTGEx1nE4rzXBW50MzYfmnp
         Nhx8SpQaMGWEc11BJ5dfrk/mTHjS8GtoYNa10t/bo5ASL1uyL0+ehy81YH7ozN0Q96gW
         5s7uBYQA2mGz8/DTHQr3deeYBG3EoIZSqV0A6PB9Dw37YPUv9frrNQWABOpi++yRQj5T
         u/riK0gHgEBPw75C6wbH4VK7BPBTB06Sh99NQKX63FEu1BrzxU20h6IQaD+7IWqlKq0u
         n+DpwjIdgKaJgAgOsAlJqCLEMZ0l+bf7lev192IM8ZJHeBiZVr3sKzAHfF10WdUBbZsi
         QZZg==
X-Forwarded-Encrypted: i=1; AJvYcCXxI4nMDHHSaJhQ3FyKXYxYDY8yPCt6Jhc3sNIvEzQZvk5aZyZEVU+hrUeAw2lJTcFIJW+9xm9eITg1M1l/PFky@lists.infradead.org
X-Gm-Message-State: AOJu0YwNxkuI40QGUcIRi/hh9vm5fvhm4xs/Yvt1vLLwH+CrGI3mQxV8
	OLw/SDaDoxM84J5GVqeP0yoB/n5mmK2k3gaPjAh+3q/UTJ4ZZYmBX2TRnzD1S8cExY/Mg+WOjGV
	KN29AJDrsLqgImQ+OQutajPL5SDYtkgbjTMeCZwl1YGqvD/5q2TRUX8CUAKAjdnmUb8leuKL5PB
	2G+A==
X-Gm-Gg: ATEYQzyJQafhmga4ynEbq/OPjatQt4mfrBiqTfcdFEqhFSsbYiyFiZrsG2PM010KkmS
	NeqP3t3BdPDUv5SZiq4i8xqliuvcSyrdQX5JTyZx2MLhGmE/7g0Yq9cNllIh8fFLLXRcFTE6cS6
	RpQHGdmfSSn8Mg6AnuCqqzbk43KEmLRMQzrIeUMPXE3b21VIpqKcuaxG+N6D45moP1DJ10nXk11
	x9XOciF+afI7TEAd83XgnlScwgDwm/cyltpgWz715UCxgdr6gospAxFbhCqK8YNSKifSgceH6Az
	S+fYrogAqJR259DapDDNLvTaqyArSB+Tz6N3Bx5jhtlrjprSMISaVeCqCUAq3DUX4YJkkycydMw
	R8xHq7E5nrWQTh7Ilt94H8h+YgmUsKlgPTizM3MejAQCt
X-Received: by 2002:a05:620a:2981:b0:8cd:94a5:2f25 with SMTP id af79cd13be357-8cdb5b49103mr118582085a.41.1773343086575;
        Thu, 12 Mar 2026 12:18:06 -0700 (PDT)
X-Received: by 2002:a05:620a:2981:b0:8cd:94a5:2f25 with SMTP id af79cd13be357-8cdb5b49103mr118578685a.41.1773343086095;
        Thu, 12 Mar 2026 12:18:06 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485577835ebsm1874935e9.7.2026.03.12.12.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 12:18:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 00/12] arm64: dts: nxp: Use undeprecated reset-gpios
Date: Thu, 12 Mar 2026 20:17:47 +0100
Message-Id: <20260312-dts-snps-reset-gpios-v2-0-0d5040eb4a1e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFsRs2kC/4WNTQ6CMBCFr0Jm7ZD+GIOuvIdhUdsBJhGKHSQa0
 rtbuYCbl3wved/bQCgxCVyqDRKtLBynAuZQgR/c1BNyKAxGmZOyWmNYBGWaBRMJLdjPHAUDKeu
 CUa6xGsp0TtTxe9fe2sIDyxLTZ39Z9a/9I1w1KiSnvVfn7u6a4zWK1M+Xe/g4jnUJaHPOXyfzC
 Vm/AAAA
X-Change-ID: 20260311-dts-snps-reset-gpios-de03ad20a831
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9529;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=yzJYxCpjEKgZzmXVMKoAXtrX4nMn457FYKnE9adZi5I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsxFgKLZLtH04fDkf73Anx21BTomoRLU+LeXpZ
 JhMLwpiUxGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabMRYAAKCRDBN2bmhouD
 1+WFD/sGzjjDT1fhLI8Ug9jLpLXqkhRqOVEvQcQQmKBlEoV/OxAp13ULz6VVzj/pWoxPMHttABm
 L44EfwlGhNGqBR9o5bltL1bmEMc96MlXaUH8ff7LSyuPEh2bIz8Vxjk/oOHLX+bIuzQ8LMLbqmW
 CTPsGTCZ9HmnLbS73BDemeRUY8ZeNoz0DAHM/WeKvYt7rw8miZ9L+PNo038+ldrJjFlsmJ9YO3n
 k/JCDkJ01oucg1JOdhbpPs7W/p+Mb29hXxRrfAdEGnaSuj9t/0Dk34rgSrumP74qzfJz44HjMHb
 szaUdogaOp/0Ou0YTEUkr7Z8vEVZgTNkJ+t17BUrplJq3/aUt/AdKjj73f1dI9d3rBYsGLoc6jd
 LHXcK+poamD3mFVz6pxIHBc0u3NQkXPKrjhiwzUkWsNIHXx/7UuNopRlmJ67F8H6dy1K0GdKqHM
 LCDyE5FJmm+KBsd8kuje46/yePpia8+74wh1lbSD0E15mUssXJQOZ8ibVVHboQp/cDY6vopVyIy
 qdCFQ99zuiBrYXp8syglc63ZYqMsf7w0p7tyT8yGlcCfvYnDlAfBknOwzbSwHDL4OWFXxtWq4Bu
 htIjub0ZyLwHb8LoDfLg7qQgv3EdMWFEisCeRWos7y4NVGqpWmWa6VCgwhUrFh5VBJIxbcFofFB
 tEy1pDhnh7AcULg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: Us5cnI8eBebG3lRCokoeaUk7kaHx_ngK
X-Authority-Analysis: v=2.4 cv=CIUnnBrD c=1 sm=1 tr=0 ts=69b3116f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=JG9a4EfIwmMJyLezLg0A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: Us5cnI8eBebG3lRCokoeaUk7kaHx_ngK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDE1NiBTYWx0ZWRfX5z8rIqP0zY3G
 GKGEUkPOmzJ+QV7tGccT+z0XM7u+TyEGZVckzCxPemKKlE4/QvkxoPMyOYSAcAiyD2VZVtdOBow
 UC5KwzK1cQJSxgFinyjNmE6hsfxBYskSyMcmXymLATmqayBcDU+gr6t9EohQoEgonfZrpg0zz7B
 ZV8oXP2xL7O8r0c99578HBFKdnxGSZCHJNGAUgmWAnPQhqhhXQFHGdcJIMPQSwtA9+kvKv4Qmev
 4zDjwbRriNWd1nkrl2y2T/RlhxeJywjZkQ8ZC18Xu/LM+hbbOgKD+joYkCgoNul6bHWPAR8IY53
 ZrfaQx53SlooU4jJ+CuBpxQ0vWjFsgj3Vo6TEjVk3GWeAaTXM1EpOIlNpI/0H1PuFmFZFvGE2U2
 HOH3KRxvisE2wd3RMVv16LtA300jo5zmyZBGH0X5tMTcx3UmupdmlJ/Q2hOzxwWckxm692t0OjA
 CBw3TKBgNljwdXfEbGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_191813_058889_09F698EF 
X-CRM114-Status: GOOD (  12.54  )
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

Changes in v2:
- Minor fixes in subject and commit msgs.
- Add tags
- Drop also reset-gpio-active-high for imx6sx and imx6q. These patches
  have actual impact on U-Boot, thus move them to the end.
  I will end the patch changing U-Boot in separate posting.
- Link to v1: https://patch.msgid.link/20260311-dts-snps-reset-gpios-v1-0-ea1cc09fba84@oss.qualcomm.com

Freescale i.MX6 PCIe host controller bindings through referenced
snps,dw-pcie-common.yaml schema already document "reset-gpios", just
like Linux kernel did for a long time.  Use the preferred form over
"reset-gpio" deprecated since commit 42694f9f6407 ("dt-bindings: PCI:
add snps,dw-pcie.yaml") in 2021.

This fixes future warnings expected when this is applied:
https://lore.kernel.org/linux-devicetree/20260312184344.42337-3-krzysztof.kozlowski@oss.qualcomm.com/

Best regards,
Krzysztof

---
Krzysztof Kozlowski (12):
      ARM: dts: imx6dl: Use undeprecated reset-gpios
      ARM: dts: imx6qdl: Use undeprecated reset-gpios
      ARM: dts: imx6qp: Use undeprecated reset-gpios
      ARM: dts: imx7d: Use undeprecated reset-gpios
      arm64: dts: imx8: Use undeprecated reset-gpios
      arm64: dts: imx8mm: Use undeprecated reset-gpios
      arm64: dts: imx8mp: Use undeprecated reset-gpios
      arm64: dts: imx8mq: Use undeprecated reset-gpios
      arm64: dts: imx8qm-mek: Use undeprecated reset-gpios
      arm64: dts: imx95: Use undeprecated reset-gpios
      ARM: dts: imx6q: Use undeprecated reset-gpios and drop reset-gpio-active-high
      ARM: dts: imx6sx: Use undeprecated reset-gpios and drop reset-gpio-active-high

 arch/arm/boot/dts/nxp/imx/imx6-logicpd-baseboard.dtsi               | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts               | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi                          | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-common.dtsi                  | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtsi                    | 3 +--
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts               | 3 +--
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts                    | 3 +--
 arch/arm/boot/dts/nxp/imx/imx6q-ba16.dtsi                           | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts                          | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-dmo-edmqmx6.dts                     | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-gw5400-a.dts                        | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-novena.dts                          | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-tbs2910.dts                         | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-apf6dev.dtsi                      | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-aristainetos2.dtsi                | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2.dtsi                   | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi                        | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw51xx.dtsi                       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw52xx.dtsi                       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw53xx.dtsi                       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw54xx.dtsi                       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw551x.dtsi                       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw552x.dtsi                       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi                       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi                       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5904.dtsi                       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5907.dtsi                       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5910.dtsi                       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5912.dtsi                       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5913.dtsi                       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard.dtsi                 | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard2.dtsi                | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-icore-rqs.dtsi                    | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-kontron-samx6i.dtsi               | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi                         | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi                | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_som2.dtsi               | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi                  | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi                | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi                         | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi                      | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-var-dart.dtsi                     | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-zii-rdu2.dtsi                     | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts                      | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dts                    | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi                           | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dts            | 3 +--
 arch/arm/boot/dts/nxp/imx/imx7d-mba7.dts                            | 2 +-
 arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts                             | 2 +-
 arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi                 | 4 ++--
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts                       | 4 ++--
 arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi          | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts         | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi                       | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-iot-gateway.dts                | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts         | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts            | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts           | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts              | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts              | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dts              | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts              | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi                    | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi     | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts                 | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts         | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dts                 | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts                 | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi                     | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts                        | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pro.dts           | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse.dts         | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts        | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts              | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi                    | 2 +-
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts                        | 4 ++--
 arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dts         | 2 +-
 arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts                | 2 +-
 arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi                 | 4 ++--
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts                        | 4 ++--
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts                   | 2 +-
 arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts                  | 2 +-
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts                   | 4 ++--
 arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dts            | 4 ++--
 arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dts              | 4 ++--
 arch/arm64/boot/dts/freescale/tqma8xxs.dtsi                         | 2 +-
 99 files changed, 107 insertions(+), 111 deletions(-)
---
base-commit: 283366d30bb599dee322996c9007ee5a9989cd9d
change-id: 20260311-dts-snps-reset-gpios-de03ad20a831

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


