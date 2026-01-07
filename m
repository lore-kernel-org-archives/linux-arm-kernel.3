Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BDACFD621
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 12:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bC0wC25dWX1u9h804y9npqlSPE9Pd9D9e+NxLaj/2I4=; b=GbctKHjDM5ngC6JVMQBxaoZw4S
	JYpUdulWgPOOtep5B2U3Xy0JzaLIbSgURfEao2bgei4SI8hBLZ//6m99Yo02Jr+NFPNbo5aAvZ7/A
	m1IeWgFcTLCs0oXBY9JtXl4AJQJrKqbTC3b7IV8TNEl/f+AgqwkCluMa7eUXJcRR74z0RAkX/aMcT
	nXrv6G+rDKtsgSWCvzKA31sNpRCiY8jJKnsQqbBrX7Ztx15NeEmO4F2Pjm39b38x3DBV2SZTrzvj1
	QzwzHrSdce7OneTs4idDv4K9K00zXVQZ36qzZUAWvblireSj8jeCfwPHleegt4hlz2Lnhu9XUhg6Y
	JK6qR+eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdSlM-0000000EukR-3pVt;
	Wed, 07 Jan 2026 12:35:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdSlK-0000000Euj4-1scC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 12:35:43 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607AHUXx3888916
	for <linux-arm-kernel@lists.infradead.org>; Wed, 7 Jan 2026 12:35:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bC0wC25dWX1u9h804y9npqlSPE9Pd9D9e+NxLaj/2I4=; b=mclLOmd+Va5hvkJq
	I73xotDuEPUPz/8m5HsSnCU2taxUQmDmbgWwX2kQiNnHkhINHy4wAu/OF8+lAHj6
	us43TEwIv7ZhVpfrB1Se+qnRMlQZl1iCbUaZR/3eHNGfAsFuqqpSUUS96cDuuUx+
	ZLlHwR0Brvrg+1PbspBuw8bdVWa/DHSW32cuEz8IGNlqzF4XHbJqoPX1SJXRRUXz
	Fjy0QqYySQOnlI2zDl6f1WCC9W4NtsUTogulzaqgBP6xP24vdlN5szN2LZZieHAj
	/muaIpc5NfmykX6B/YGgwvXn/3ST1QLhP6EFkIX0vw2Y573ssJ+AhZ0QWCs3/Olv
	PGFzGw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh6a0k9v2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 12:35:40 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7f66686710fso4743545b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 04:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767789340; x=1768394140; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bC0wC25dWX1u9h804y9npqlSPE9Pd9D9e+NxLaj/2I4=;
        b=YN89/+FLXYufB7Hi/a9VlmIp5Uf0bfOL0BTHi4E2IJ3X11iDCu79gKVYad69+I6I6g
         g7slxzXm52+lNRZHzwlulUuAhRd6McmWmsbxn17S0SoeWwhcs1ULzujRNMFPgce8sjDR
         mP/VAT+vgMZZrJx0QiygJS3bHJdSr74OM+hAUHCGDZR3yA5zdDUdvXXdm5fRLfYm+EvW
         U93O4OzEOz47IU4A9X3V3i3elae/Dl+ScU9mUDf8+NS/Wx0zD6FJ00kmfeKXNSrIn+L2
         hPsYBLiD8F+I/Tkyl1Xn3XRmiBRUb1h3G/EAYGvdgpneNChV449RWX48k1tH5ukmr9/m
         ga7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767789340; x=1768394140;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bC0wC25dWX1u9h804y9npqlSPE9Pd9D9e+NxLaj/2I4=;
        b=xQ2e8MWytD10UA5iXI2nxnYvuHq6KYqr0PHG1MKUK/73cCJW8nEwAU/25Y6r/6XpqB
         eJSWkDqcw4mYKU2ymaNj+r9sYnsok+esCC37Pm29IrG/uulnMUb5QnRut+mOuoCWXOsZ
         J4iHs/pZPDUUlz4l1Waka39gPzA60ZQB2OW9MQtAtzCDb8P9DxknKQEUe4ZkJRKaAaYz
         zECKqgHRIG5/WrnmpOaoQD3oyl85QdghE7ztmzlcTMrJStOw/1Laz8mGCcdy8a+k1NL5
         vWOdVMMmrLh63B020f5dsbFVr73ZMnsQ7QyOAqYaNzakIFvtSqWPaMbXJW5IYHWQQ0vX
         H2qw==
X-Forwarded-Encrypted: i=1; AJvYcCU4VRgj6iZWB0KDpymqbCjnkpiilPgEOnLAMP2m4rwgQ/KdMpy4z9PkhKc26tdVHY6VmJVKNyctAK7if0bsbjPi@lists.infradead.org
X-Gm-Message-State: AOJu0YwdA8Bhx2vpQ6nQ5nEDOdhHSRy5H9kiyw0ipRv5BMIivgrbKgey
	Fuo7C7LfD9v57FrVL7VtZqOuenveFbIOO9Tui4gaP2Z2U/HLUJtnCSAAN+XRsRMqXnwIdCkqGG7
	qpqGkOdv4whCp2DtJ2ybJuta1l2p93zn6voHtBvz+L2e+ErXQQD9nEoBCrV35dtvKAb4t/J4LxN
	cfeERKgseEjA==
X-Gm-Gg: AY/fxX6wkneHKY/QMDVgkP2jk1iE+8Tik3tdXKSeGfk11xMebAOSr4ybXKaEoTFsWbi
	G7mR5yOTlc/lw1fULrREyY4gGhcnwPzsyPPGdPWdCiljaix7AHQfy3T45jNmQsAQTeMcs33jt4S
	2y+tSi7Ml7+uNmNkRDqH8NeXL3iTC8ttfaFb+ZiPnSlW+aQNDaTU/uzspW097MjSy77Qi+wGBux
	//IBUxUZOad9hfudvjCL46zUj3tXYbGmowahM5a1JJTuTBIwoeR9JwhaZ8BAAEyrLJleFIbJxBX
	eagFg13mD8FEWM4G8ti9i//smPQxyoDhflwNospLVB24FvA8FMB2xg/hDGrWVp4WMuMoyd+iUvu
	gayZrhUc=
X-Received: by 2002:a05:6a00:348a:b0:800:902d:9fdb with SMTP id d2e1a72fcca58-81b7d861859mr2145565b3a.5.1767789339626;
        Wed, 07 Jan 2026 04:35:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH93fKUDfasuP5q8gHkOnrMUzHklFoNL76RVcQSiBJyvyfD7E4zZeOiwuGWUMy40Gzp59Romg==
X-Received: by 2002:a05:6a00:348a:b0:800:902d:9fdb with SMTP id d2e1a72fcca58-81b7d861859mr2145512b3a.5.1767789338774;
        Wed, 07 Jan 2026 04:35:38 -0800 (PST)
Received: from [192.168.1.102] ([120.60.59.91])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c59e7c16sm4940286b3a.53.2026.01.07.04.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 04:35:38 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Jianjun Wang <jianjun.wang@mediatek.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>, Lee Jones <lee@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
        Felix Fietkau <nbd@nbd.name>, Sjoerd Simons <sjoerd@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org,
        linux-phy@lists.infradead.org, netdev@vger.kernel.org,
        Daniel Golle <daniel@makrotopia.org>,
        Bryan Hinton <bryan@bryanhinton.com>,
        Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20251223-openwrt-one-network-v5-0-7d1864ea3ad5@collabora.com>
References: <20251223-openwrt-one-network-v5-0-7d1864ea3ad5@collabora.com>
Subject: Re: (subset) [PATCH v5 0/8] arm64: dts: mediatek: Add Openwrt One
 AP functionality
Message-Id: <176778933103.573787.15149542478385360900.b4-ty@kernel.org>
Date: Wed, 07 Jan 2026 18:05:31 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: FdHHDiQpiTh1EW_lOlyi6VCfdOHAmrGa
X-Proofpoint-GUID: FdHHDiQpiTh1EW_lOlyi6VCfdOHAmrGa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA5NSBTYWx0ZWRfX8g2MEv0xfbrX
 zmXDpKULRGDb72HHqk9qZtpAt7TQIigRT++EL7SYWnIJwQP46dfNg2t4u6GE4OFjeVcHaLIY9bz
 B/3Lsrcy9/AxFM8d7izXZ65GqThHQSSZfLtnaygftl4YdOoPnIWH2nGRQo7rMG+e7IEeFE83R1x
 vtDVqL32pdcjzpRwmVME0O1B6Q9CI0r6ZqSSfHpzg0RtLCu4N3u7h46ghCI41O+YgLpy34rTeXO
 UK7Qg4oQZz/uKZgm+E1fCqJzHEjPbxsnhuYAX6iPk39vx4DWh9t7YVzz9QNHCgXlYEZpoHA4KvD
 6n24WHqq4neivvSNhrfmZMjNji8eyKZQbE2XOPTMthuyL3/bcRhwn7ZUgT8lw6SVrNkrwco8XYV
 7RWAnLOI/3TO8BkiD/rswGGJK3vki+9CHklcRFkVzclzn+lqOV/fJ1OEe+1OqvXPNgtuQrwaaSr
 SUlWcVZ/eItz0fO0hAg==
X-Authority-Analysis: v=2.4 cv=MtdfKmae c=1 sm=1 tr=0 ts=695e531c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=jZ9eb5YeB6VHmQ1DXVOWBw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=QX4gbG5DAAAA:8
 a=w7wmWQyBmLUzaIw334oA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_043542_601190_82F42412 
X-CRM114-Status: GOOD (  14.09  )
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


On Tue, 23 Dec 2025 13:37:50 +0100, Sjoerd Simons wrote:
> Significant changes in V5:
>   * Rebase against linux v6.19-rc2, dropping merged patches
>   * Drop note about disable pci_aspm in cover letter, not required anymore
> Significant changes in V4:
>   * Drop patches that were picked up
>   * Improve mediatek,net dt bindings:
>     - Move back to V2 version (widening global constraint, constraining
>       per compatible)
>     - Ensure all compatibles are constraint in the amount of WEDs (2 for
>       everything apart from mt7981). Specifically adding constraints for
>       mediatek,mt7622-eth and ralink,rt5350-eth
> Significant changes in V3:
>   * Drop patches that were picked up
>   * Re-order patches so changes that don't require dt binding changes
>     come first (Requested by Angelo)
>   * Specify drive power directly rather then using MTK_DRIVE_...
>   * Simply mediatek,net binding changes to avoid accidental changes to
>     other compatibles then mediatek,mt7981-eth
> Significant changes in V2:
>   * https://lore.kernel.org/lkml/20251016-openwrt-one-network-v1-0-de259719b6f2@collabora.com/
>   * Only introduce labels in mt7981b.dtsi when required
>   * Switch Airoha EN8811H phy irq to level rather then edge triggered
>   * Move uart0 pinctrl from board dts to soc dtsi
>   * Only overwrite constraints with non-default values in MT7981 bindings
>   * Make SPI NOR nvmem cell labels more meaningfull
>   * Seperate fixing and disable-by-default for the mt7981 in seperate
>     patches
> 
> [...]

Applied, thanks!

[1/8] dt-bindings: PCI: mediatek-gen3: Add MT7981 PCIe compatible
      commit: 407cc7ff3e99f6bca9b4ca2561d3f9e7192652fe

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


