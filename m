Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA61C021A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 04:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=IvA31ZbD3Zexo4H7INEaKo7X7KJqCF/0qKrLl6D23Yg=; b=2Uhu1GUf2m/kKl
	GmmeS1XaC22EAMHW+my9IJ12OLN2+r6ZoI4Ib+6i0OFKeF6/NZDhNFP8oKHNS8C5Im+Ggg+K+YzEQ
	D9FeOCuXgi2fJVqnGhSIlVHtWNMHdqr+DgkjG3FIEDVMKC0QxTCruluhheG7ar36cTyUU96Hgld+N
	8tGSfptpPV5EZUcES9qsZj/YjnanBACwjbmvj01mHkIhxvDSpDGLbg7sfLzKusR2cK5YqMC6K42UD
	v/FrKZa4vymlOr+MuK6hu7c1lxDR8TEjTO4WIYaY2EOHLwE8epDsjCqxOY+bGBFsyjAwFjLwTvJ+3
	krJ97lNEUKVo+yZXp2Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiRJF-00000009lY5-2FOE;
	Thu, 13 Feb 2025 04:58:45 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiRGg-00000009l9L-11E2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 04:56:07 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250213045600epoutp046edab88c68144ec54ea78a3f802db101~jq5ptouUy2181121811epoutp04H
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 04:56:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250213045600epoutp046edab88c68144ec54ea78a3f802db101~jq5ptouUy2181121811epoutp04H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1739422560;
	bh=IvA31ZbD3Zexo4H7INEaKo7X7KJqCF/0qKrLl6D23Yg=;
	h=From:To:Cc:Subject:Date:References:From;
	b=f4AGjI24g6vfdhDWi9jNytRlvg8AfYxeoS5kPlyK/jYkQW1o20j858HDje/wkvqVf
	 risrbvZWPphe2BCx+lUaIYMf774w6sVp/PV/JqKsG77HMZmFKTJ2x35VJFGbTqVE6G
	 zoGgarrJIpJr8zdMbYntG3h7Fvh2vE8QU+ig5nwQ=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20250213045600epcas5p4339919d365306e80caebf8739ab4304d~jq5pPueOt1374413744epcas5p4E;
	Thu, 13 Feb 2025 04:56:00 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.176]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4YtjYp75BXz4x9Px; Thu, 13 Feb
	2025 04:55:58 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
	1D.1B.19956.E5B7DA76; Thu, 13 Feb 2025 13:55:58 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250213044950epcas5p1a7badb480a7e8d843fe0ff51bcf5cbf4~jq0Q09LC_2465824658epcas5p11;
	Thu, 13 Feb 2025 04:49:50 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250213044950epsmtrp25ca5594c3b92929b4c65f819f26d33a5~jq0Qzfr1Y1364113641epsmtrp25;
	Thu, 13 Feb 2025 04:49:50 +0000 (GMT)
X-AuditID: b6c32a4b-fd1f170000004df4-1a-67ad7b5eff71
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	58.A0.33707.EE97DA76; Thu, 13 Feb 2025 13:49:50 +0900 (KST)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250213044947epsmtip24a8e5a1d81bad9d99d12448f2eda324e~jq0ODQcEX2154321543epsmtip2h;
	Thu, 13 Feb 2025 04:49:47 +0000 (GMT)
From: Swathi K S <swathi.ks@samsung.com>
To: krzk+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	conor+dt@kernel.org, richardcochran@gmail.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: rmk+kernel@armlinux.org.uk, swathi.ks@samsung.com,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/2] net: stmmac: dwc-qos: Add FSD EQoS support
Date: Thu, 13 Feb 2025 10:16:22 +0530
Message-Id: <20250213044624.37334-1-swathi.ks@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFJsWRmVeSWpSXmKPExsWy7bCmpm5c9dp0gyvd5hY/X05jtFj+YAer
	xZq955gs5pxvYbGYf+Qcq8XTY4/YLW4e2Mlk8XLWPTaLC9v6WC02Pb7GanF51xw2i65rT1gt
	5v1dy2pxbIGYxbfTbxgtFm39wm7x8MMedosjZ14wW1zqn8hk8X/PDnaLLxtvsjuIely+dpHZ
	Y8vKm0weT/u3snvsnHWX3WPBplKPTas62Tw2L6n32LnjM5PH+31X2Tz6tqxi9Di4z9Dj8ya5
	AJ6obJuM1MSU1CKF1Lzk/JTMvHRbJe/geOd4UzMDQ11DSwtzJYW8xNxUWyUXnwBdt8wcoF+V
	FMoSc0qBQgGJxcVK+nY2RfmlJakKGfnFJbZKqQUpOQUmBXrFibnFpXnpenmpJVaGBgZGpkCF
	CdkZz56cZi74wFPRPH8hSwPjGa4uRk4OCQETic9/fzN3MXJxCAnsZpS43PyZDcL5xChxf+sb
	BGf+qQPMMC0Lb/5kgUjsBKqa+ZAVwvnCKLHm8gJWkCo2AQ2J6yu2s4MkRAR+MUp8mHQabAuz
	wF1GiU29d9lAqoQFnCRWLvwCNpdFQFXi+KkDLCA2r4CVxPmpH9kg9slLrN4As/sEh8SlidUQ
	tovE+Xkt7BC2sMSr41ugbCmJz+/2QvXGS6zuu8oCYWdI3P01ESpuL3HgyhygOAfQQZoS63fp
	Q4RlJaaeWscEYjML8En0/n7CBBHnldgxD8ZWlvj7+hrUSEmJbUvfQ631kPjadhzseSGBWImO
	iyeZJzDKzkLYsICRcRWjZGpBcW56arFpgXFeajk8qpLzczcxghOxlvcOxkcPPugdYmTiYDzE
	KMHBrCTCKzFtTboQb0piZVVqUX58UWlOavEhRlNgkE1klhJNzgfmgrySeEMTSwMTMzMzE0tj
	M0Mlcd7mnS3pQgLpiSWp2ampBalFMH1MHJxSDUzyYv4L5J4ssv6SrLjSvuOA991GhwnZF09r
	XrxdYfv2sqpLWSefcdH59JOibpVv9O4Ll6btWd+4ap9OzJ0bqXuyas5vUU3ji3b18Mttvly5
	R0r93Iwb77jbOsK/dXdFhn36//2bWGlUkEtg/eNl26wlDuTz8xS3J5/zlWKKOrc+5d5T9v0F
	O/vW7X9WmCb5/tbMTXpfhWPitx6dIeF36t9ZXqdjCSs+9vKXGiue6PRYUuOlrGamUFvyad7F
	I9Xz3Robvm7x6k/JmKe3sqXXM1NcuSX3QKtBeNMW0WWN99OSm07pfJirM9nv05+TsmfrVnW7
	H+wJa5c5fe3AIseA41z89x1U83la/63V/tDspcRSnJFoqMVcVJwIAMa1SHxNBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrILMWRmVeSWpSXmKPExsWy7bCSvO67yrXpBv8WiVn8fDmN0WL5gx2s
	Fmv2nmOymHO+hcVi/pFzrBZPjz1it7h5YCeTxctZ99gsLmzrY7XY9Pgaq8XlXXPYLLquPWG1
	mPd3LavFsQViFt9Ov2G0WLT1C7vFww972C2OnHnBbHGpfyKTxf89O9gtvmy8ye4g6nH52kVm
	jy0rbzJ5PO3fyu6xc9Zddo8Fm0o9Nq3qZPPYvKTeY+eOz0we7/ddZfPo27KK0ePgPkOPz5vk
	AniiuGxSUnMyy1KL9O0SuDKePTnNXPCBp6J5/kKWBsYzXF2MnBwSAiYSC2/+ZOli5OIQEtjO
	KHH5/SImiISkxKfmqawQtrDEyn/P2UFsIYFPjBJ7n4aA2GwCGhLXV2xnB2kWEehgktgz9SQz
	iMMs8JhR4sGr/2wgVcICThIrF35hBrFZBFQljp86wAJi8wpYSZyf+pENYoO8xOoNB5gnMPIs
	YGRYxSiaWlCcm56bXGCoV5yYW1yal66XnJ+7iREcC1pBOxiXrf+rd4iRiYPxEKMEB7OSCK/E
	tDXpQrwpiZVVqUX58UWlOanFhxilOViUxHmVczpThATSE0tSs1NTC1KLYLJMHJxSDUxJxZUG
	U1/wB+42V2J7sW3/05VGen+Oe631P3H808I3KtaT1Vzq94otitG5t855y/3njOIHflw75z7j
	h5nIv0eL3l5e8M6Qr/bcueApiVorj+tIXJPW28XUOj9anGnn88OrunND7k/euWheW/huryuT
	xENL9sr62Bw64TRj+7ULW4p2M+SoVjZ8V1dy0d6pqW2/pMCsdU3JwWczTP6Hls6XZpzux1pc
	v3+Ke/u3SUrREhNX/b71uUJwktaK2ItJExp9xIyey0aw+tz+cuK5/gbRPSXWz5nnBnZs377b
	TbWU6VVZyQGD02nfriyI+ezm9UFda9bHFesuHssKffDY2e5o9s5tLYwFQsa6caecVC+nK7EU
	ZyQaajEXFScCAKiT7UT0AgAA
X-CMS-MailID: 20250213044950epcas5p1a7badb480a7e8d843fe0ff51bcf5cbf4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250213044950epcas5p1a7badb480a7e8d843fe0ff51bcf5cbf4
References: <CGME20250213044950epcas5p1a7badb480a7e8d843fe0ff51bcf5cbf4@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_205606_627276_0CAFD1A5 
X-CRM114-Status: GOOD (  16.41  )
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

FSD platform has two instances of EQoS IP, one is in FSYS0 block and
another one is in PERIC block. This patch series add required DT binding
and platform driver specific changes for the same.

Changes since v1:
1. Updated dwc_eqos_setup_rxclock() function as per the review comments
given by Andrew.

Changes since v2:
1. Addressed all the review comments suggested by Krzysztof with respect to
DT binding file.
2. Added SOB Swathi.

Changes since v3:
1. Avoided using alias-id to configure the HW.
2. Modified the clock implementation.

Changes since v4:
1. Avoided switching between internal and external clocks for every open/
close.
2. Addressed the review comments on DT bindings

Changes since v5:
1. Addressed the review comment on correcting the intendation.
2. Corrected the compatible name in dt-binding file.
3. Listed and described the clocks in dt-binding.
4. Modified FSD probe as per the changes in the refactoring patch given
below: https://lore.kernel.org/netdev/20250207121849.55815-1-swathi.ks@samsung.com/

Here is the link to v5 patches for reference:
https://lore.kernel.org/netdev/1cb63ff4-8926-4bbc-8a78-59103d167140@kernel.org/

Swathi K S (2):
  dt-bindings: net: Add FSD EQoS device tree bindings
  net: stmmac: dwc-qos: Add FSD EQoS support

 .../devicetree/bindings/net/snps,dwmac.yaml   |   5 +-
 .../bindings/net/tesla,fsd-ethqos.yaml        | 114 ++++++++++++++++++
 .../stmicro/stmmac/dwmac-dwc-qos-eth.c        |  28 +++++
 3 files changed, 145 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/tesla,fsd-ethqos.yaml

-- 
2.17.1


