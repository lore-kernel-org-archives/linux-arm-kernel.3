Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C65FFE6FE23
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 15:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jiVMsPmbQP7FZ38DNLit/HG1+5z9nnDnXvMaFIBjNjQ=; b=hekeHfzWRQVMDqGE4pVEm+nsN2
	3ojS4ROAAeM4MBXD9ZO+ajPONtragWzrGf7WUd59aPnmGEpbgQWgceWpvaIcrm7nrYI2QZwJQjaDJ
	LA8IjNbEVsGhV0NzZ03g2lOn86GuqZDtf5qCxHQJF/YU/5swg9AyESPUUdLaAPr/gGfpxJzEg5nmE
	AvR5O4uf2gtj06FMnsKqNlsS6yN30LsRYjVyittlye7AM7XIfkyiPLPoUlH1p7P3xJG/gbRaOgRYq
	MIE+x9XZ5cXGSnAURv4BfQNjKMSCSBjhrdsLQ4/CljoxoWcYVC2ihdJKjyDh7tpQdGrxC85purjgy
	m7eWubvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY4mU-0000000FjE3-0Ohj;
	Tue, 23 Dec 2025 15:58:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY4mS-0000000FjDG-0emg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 15:58:37 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN8tdmr2748481
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 15:58:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jiVMsPmbQP7FZ38DNLit/HG1+5z9nnDnXvMaFIBjNjQ=; b=dY21izoQwZl3PUWu
	Mb6XE3I9EdcKQO8QjSqkx5MLvjiEwvp7/oOdtyn2XSuWlTf3zVnBSDfvpxeh+aLG
	uQViOdMN53cJFkPMxDxc7Tz0MrWKgjfFGwWea8YMW8CmOrD3Q9+uVH0+5tnsI3Ed
	vxfom/ISfZ5X0F9jEgVbRIeCNtAtVoQ28hzi3zolpSY+3CY1+Dtd3NVZJYHXipJu
	fTZdrdKIAAJ/Pd8qfzGX1MKPf2bTnUOKAR/WlTEpR4vdpBVwdecu0c2rn7UvVrN/
	YmCQbg4NE2gSVOFz90F80BXLJDXxr/mJHWJxz2cna19+/98SeU6WkHbCYNzBY/kS
	QCAYsA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7h5ctmtv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 15:58:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0dabc192eso113153215ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 07:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766505514; x=1767110314; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jiVMsPmbQP7FZ38DNLit/HG1+5z9nnDnXvMaFIBjNjQ=;
        b=GZ9bzuCDBWYIsdg8xXXbybr0FBqzMOJF3tyBwJBRa0n3Ymm0R5mDfFRD7Df+U/p50T
         oeDhn90jOgSLvn4Ifjte7vN5a0ZDelFlwC51VJsS9I4qir3n7cnbpepw2q7RQSJzjPAQ
         SRBvX+1aXfnzwNaUDvrJH0ZhMRFZjyfkdU0rX0zhuc7VJ+e590stMMzVu5b2Ni/QdWkI
         c0EIQWiYaZCQZhR98mydTAyvWuJcLR/6JqH0Mtw/sfIUvYM650xkMrWTmrpwdtMqImVc
         0aoEI0h+R0YaRVi2SKrS7mZASsBz5hwEhfTelgPC6bmLgIr+9h0HrkFD65UQNnaXyCyi
         Ta9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766505514; x=1767110314;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jiVMsPmbQP7FZ38DNLit/HG1+5z9nnDnXvMaFIBjNjQ=;
        b=a67lQeJmF74r/AhRqVf2Zi1v93yAIB06du8D4t+RHkd0NzfjOhOODJWA+DKb0Y873z
         hy4VAsZSwT7DD0bcjH1173g+/2ElryZk6rK2Qp53M3ASV/2N6spaj16S/OjqV1DiXRjI
         b0990+uWxzQMsw56QMuaq4GU/Bhv5mssFLRQvfBiY0U4YZAVVCUj8bCYtqJeMqhXKCSA
         NK/lsW9kCsXP/boJji7urdL/1Mv3QQ9LsIx0esvjqgPV+fp0SCrVntIxjItZpWT53n/d
         MxsLv8JuEPiZJgBNu19gD5DUZLy4d8eGhISsNHx0da7zBcCDx8EMq3oCafgCCLnbHimz
         X2lg==
X-Forwarded-Encrypted: i=1; AJvYcCUcA9JZPFBUJGlEbMT+/xXHScaGh2l/YwXDA4CB0R/HYL3zHC9rt1z5HeO80twoKuG6jhgt/YtbW8jBIr0TTFhv@lists.infradead.org
X-Gm-Message-State: AOJu0YxDZZ4T9WiD/KTMDK9WpirEs9UnVsu7fFgyS1yCOKDdS4A8fVIh
	p0nFKOkmP9Ok+fX0kQMvTRaDqvwpZukGZubU5mGcFM624F28ZEakauXEn+V3HE7d1XLN6BRTa4k
	6iY3LXFLioQTrt0cU27NDPsZW1HfsHlQK3gMni9ZuoKmLEUbU6Kx5Cdt3n5O7rFn0aAVh2RjvtZ
	lmtw==
X-Gm-Gg: AY/fxX6dye/jF2VsMUBv9LyE3tF78FJPIvAuwyBf7k7QpOTsj4qv9Q2mB2SX6aLl20H
	pB2fAd8soFOxOfqgdrOeD8Hqr7RN24Z0qMQ+DrFaJrjgy4nu4UkzV80Tyfu22WJkfRRhXgc3GNw
	TTCRd+5HcMLKtjuQnXHr8YuIJxTjxky4QLbUAyIPX/ghUdzu2rxtaAvc5AB8PUoDIuz/tydX+K3
	pYtEVEITQ8PVRiK05/+Ppkv9eN1c4fpRxYG5eWeprs1zUNOAeX26bBh1BI90cTHWofmND6rUhHF
	IXgBuvUebxwVino43+Z0XUjo/9yig08zuwW+/+qX6fGxOwwtAlUKh5th8Aq5yp2Yz6XnmyARNsk
	VXEkCdnhDCw==
X-Received: by 2002:a17:902:d584:b0:29e:9c82:a91e with SMTP id d9443c01a7336-2a2f21fc506mr163295435ad.7.1766505514306;
        Tue, 23 Dec 2025 07:58:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhayM1D+7Y1gHqun6N5dRaivrEs0mEAHPs1q25xLW/IAzFnLc7m+vKUO2bdvStmAZD+ZHRIQ==
X-Received: by 2002:a17:902:d584:b0:29e:9c82:a91e with SMTP id d9443c01a7336-2a2f21fc506mr163295255ad.7.1766505513842;
        Tue, 23 Dec 2025 07:58:33 -0800 (PST)
Received: from [192.168.1.102] ([120.56.200.112])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d7754asm131271795ad.100.2025.12.23.07.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 07:58:33 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jacky Chou <jacky_chou@aspeedtech.com>
Cc: linux-aspeed@lists.ozlabs.org, linux-pci@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
        linux-gpio@vger.kernel.org
In-Reply-To: <20251216-upstream_pcie_rc-v7-0-4aeb0f53c4ce@aspeedtech.com>
References: <20251216-upstream_pcie_rc-v7-0-4aeb0f53c4ce@aspeedtech.com>
Subject: Re: (subset) [PATCH v7 0/7] Add ASPEED PCIe Root Complex support
Message-Id: <176650550798.2188958.10356654881464455126.b4-ty@kernel.org>
Date: Tue, 23 Dec 2025 21:28:27 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEzMiBTYWx0ZWRfXxFcBv/aK9eWw
 yYxSfN7hL4FMjti+ePgvzDzQikn+4Qj3OZrz+CrKhlxhmcObZDjqXJ5ZvJHkpZ+6INhoXaTqVRh
 Qu/VmsDiAewm58RzKtc6VKElHanR9ISLMLNErdN4JjVsCCJQfoZtIjHVDm1k/4AVUFDObP675VY
 EiYH9Urz9zHKpZErF2lRsmDhTNypUzWUP+KhxqSzOy/NWUVeimOo3xahmhBOnSSA/Fg31PkKCRY
 73ehoGE7Di/VAiTu46Wscq4o7VOe4FRtgGiRuQJ0kPw7ruQ6mkIOSqxoNEgwYOizFseAI3irdLV
 PNflby4me5rZLWt2xmTtQCesc671KRZxZu8GmRUJg4VgmEZabivUg5MeZ11RLkXtjr6HiBaggAB
 SVE7aNJkNmuaRnzu/Ao4f0WWVeQUSdi8DmSUIZsRyEIdD753x2PMXi5qJ5Krv3QBjqiNevs7bjp
 +jv6Hobrn6Wr6U3SNGg==
X-Proofpoint-ORIG-GUID: w__y58Tj-zMjSIBn0pV51scKYqXIaYKR
X-Authority-Analysis: v=2.4 cv=LeUxKzfi c=1 sm=1 tr=0 ts=694abc2a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=31AEnvkI3DvSdtIumApubw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=oUgZFhhkZxxgqap4hUAA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: w__y58Tj-zMjSIBn0pV51scKYqXIaYKR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_075836_216471_AC3932CB 
X-CRM114-Status: GOOD (  16.06  )
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


On Tue, 16 Dec 2025 09:49:59 +0800, Jacky Chou wrote:
> This patch series adds support for the ASPEED PCIe Root Complex,
> including device tree bindings, pinctrl support, and the PCIe host controller
> driver. The patches introduce the necessary device tree nodes, pinmux groups,
> and driver implementation to enable PCIe functionality on ASPEED platforms.
> Currently, the ASPEED PCIe Root Complex only supports a single port.
> 
> Summary of changes:
> - Add device tree binding documents for ASPEED PCIe PHY and PCIe RC
> - Update MAINTAINERS for new bindings and driver
> - Implement ASPEED PCIe PHY driver
> - Implement ASPEED PCIe Root Complex host controller driver
> 
> [...]

Applied, thanks!

[2/7] dt-bindings: PCI: Add ASPEED PCIe RC support
      commit: a20df1a7683d6c1416c0f56fb737554b9abe9959
[5/7] PCI: Add FMT, TYPE and CPL status definition for TLP header
      commit: 73ce5ba701a53ad89c623a641401288844f526ac
[6/7] PCI: aspeed: Add ASPEED PCIe RC driver
      commit: 9aa0cb68fcc16280c8c8bdd22dc770af8dd7349f
[7/7] MAINTAINERS: Add ASPEED PCIe RC driver
      commit: e5c2061442dda716fb08cc4eff485220c94e6475

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


