Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3085C021AD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 07:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=gzDZdnsCspvTZeSgVAXe6lE4XfFNW/yTAr5n04ZTuIU=; b=yAnGgmitaa/CXx
	/Q5DQnFmYspPfbF3i/Acer16vMKedSlm5BNr1bMfEztX+csunfI5CiklIdXmwsvAIs7d9NpmC6ces
	85vObO9bRCoaS2J+Wqyvl6i0F7hT23+iW3D7AYowqeoR8cRfV8BJ8CGuguDbuNPwRYpuroTpHThkI
	9+j2dqbUV65UfiLsfkKKaslpVkvqLoNSQR4mvLlOctaWF+Yf/O5Vkw1hVsUm+Nrl7w5oEys1leJe2
	DzxYGVdq0joXVLgaT+Nkjstz6SWZldzldSJbOLTYyLUbAn59mILifc36hKkoP7wuBggh1J+M05r1c
	vgEHgHKvBCYujUpqlG/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl117-0000000HAVh-2177;
	Thu, 20 Feb 2025 07:30:41 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl0ui-0000000H8nU-2lbI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 07:24:06 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250220072401epoutp0120ff2d8568f3e894b3b0124b43f09f9f~l2b3-aOhJ1885918859epoutp017
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 07:24:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250220072401epoutp0120ff2d8568f3e894b3b0124b43f09f9f~l2b3-aOhJ1885918859epoutp017
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1740036241;
	bh=gzDZdnsCspvTZeSgVAXe6lE4XfFNW/yTAr5n04ZTuIU=;
	h=From:To:Cc:Subject:Date:References:From;
	b=POnHLO5WgHkpI7qD9I4z/8UdlGtVUc1Ep84rIiGQ3qW2YPwWY6s0N7ZG9VQXW64a+
	 Z48AgTee3mgSgOv75trEe1Xd8MB/CzLGmhceecZUNehFUUKo4P6cWwI5fJ2TGBa+s8
	 CTLvMNXux5uHDHLftn4y74PMhmB4KfwbpC5mLUj8=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20250220072400epcas5p4e25dba29d9d99c5f3e15deb142702f77~l2b3dXuXz0862408624epcas5p4D;
	Thu, 20 Feb 2025 07:24:00 +0000 (GMT)
Received: from epsmgec5p1-new.samsung.com (unknown [182.195.38.179]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4Yz4WK18n8z4x9Q8; Thu, 20 Feb
	2025 07:23:57 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
	epsmgec5p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	3D.C8.29212.B88D6B76; Thu, 20 Feb 2025 16:23:55 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250220044123epcas5p1eb9f906067a6e2585f9e4598653857fd~l0N4iKwtB0786207862epcas5p10;
	Thu, 20 Feb 2025 04:41:23 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250220044123epsmtrp2866a5d8ce254ede85ffe37d9571754c6~l0N4gyFPY0490204902epsmtrp2I;
	Thu, 20 Feb 2025 04:41:23 +0000 (GMT)
X-AuditID: b6c32a50-801fa7000000721c-a0-67b6d88b6690
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	1A.ED.18949.372B6B76; Thu, 20 Feb 2025 13:41:23 +0900 (KST)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250220044120epsmtip1b0ee07b1118b6ede1390ae3fe28da517~l0N1vbGDN1683716837epsmtip1i;
	Thu, 20 Feb 2025 04:41:20 +0000 (GMT)
From: Swathi K S <swathi.ks@samsung.com>
To: krzk+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	conor+dt@kernel.org, richardcochran@gmail.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: rmk+kernel@armlinux.org.uk, swathi.ks@samsung.com,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	pankaj.dubey@samsung.com, ravi.patel@samsung.com, gost.dev@samsung.com
Subject: [PATCH v7 0/2] net: stmmac: dwc-qos: Add FSD EQoS support
Date: Thu, 20 Feb 2025 10:07:10 +0530
Message-Id: <20250220043712.31966-1-swathi.ks@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA0VTe0xTVxjPubcv2GpuUPTYTdZc4wJk1NaVciC8ZM5cnDoWXZYQl9rAXXmU
	29oWRZaJbgwdU6SKzgEiURgK41VLeQwIDwdEFkUoReJ0wHiIIu8RQAlradn++32/7/d9v+98
	5xwe7vYbR8CLZfS0llGoSI4ry9zq5e3z42OzUtx3jkBL41cBKhqoYaNfGx5gKPdhKgvduPeA
	jUbahriov6kWQ+PZzzioy5zBRsa/rWzUU5fLQenWYTbKWyllo7b8zWihcwKgm1XzXDQ4Xc9F
	9/54jqPuiwYMrdbXcNF8ZT831J3qsT7CKdOdfowauVjFpWqzn3KpfGMiZSz+gUPdLUihamvm
	MGqqsZdDZZiKAdXcKKHmjB4Rb0fGB8bQimhaK6SZKHV0LKMMIj85JP9I7isTS3wk/siPFDKK
	BDqI3LM/wmdvrMp2VlJ4XKFKtFERCp2O3BkcqFUn6mlhjFqnDyJpTbRKI9WIdIoEXSKjFDG0
	PkAiFu/ytQmPxsc0/Hwe17RuSBodN+KnwZu30oELDxJS2Le6yLFjN6IewNFv3dOBqw3PAmgZ
	TAOOYAHAuZUqznrFtawRriPRAOBr8xLbEcwD2F2dCewqDuEJ+25Xr6k2EcsATl/qxO0BThRh
	sHPAgttVG4kweDa3ALNjFrEDNppLWXbMJwLg8OQMy+H3HiypaForhkQHD76pyAGOxB74avV3
	tgNvhC/aTVwHFsC5yQbnsHJYktHrbBQDny4bnHwIbLLk2niebSIvWF6300Fvg1ful63NgxMb
	4IXXw5iD58OavHW8Ha68tDpbboXmwimnLQX/6ijlOjb5Jcy5XczJBNuy/3fIB6AYCGiNLkFJ
	R/lqJD4MfeK/u4pSJxjB2iv2jqgBJRUrohaA8UALgDyc3MRPSzEp3fjRipPJtFYt1yaqaF0L
	8LUtzYAL3KPUtm/A6OUSqb9YKpPJpP4fyiTkFv53talKN0Kp0NPxNK2htet1GM9FcBpDYJ/1
	T4+4GTidNnHglKiZPLJ0uWX6QE/Pk6G22Mqzo188z/q4iB+X3nt30JB6deL9X6qZ6e6qr8w9
	V0Ld3j2cXVc3mm6+5Rn09ZZXhR9MbT24W/Z4aOz6O7MXQPvYcMPsbraXKvbO0WdlLskDXmHC
	yZlrpoFTxvO5gSk/CS0Vh1wjLbt6T9YvZKZ03MqS+ondm3ldYSEPRwvpyM3lOX0Gl/4X1d6+
	90WW+uh/ysMJzwC/sW/mzw18XxSexAQ/kofksF7u7zpmelKwT97sn/xpfn7RsdXPyy7HtfpV
	thAnmo+Hfda316NuomPHYX64380y9eKiV6hJcGY5qX02eOLI9bwzlwwkSxejkHjjWp3iX8JM
	AaJOBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGLMWRmVeSWpSXmKPExsWy7bCSnG7xpm3pBtMuilj8fDmN0WL5gx2s
	Fmv2nmOymHO+hcVi/pFzrBZPjz1it7h5YCeTxctZ99gsLmzrY7XY9Pgaq8XlXXPYLLquPWG1
	mPd3LavFsQViFt9Ov2G0WLT1C7vFww972C2OnHnBbHGpfyKTxf89O9gtvmy8ye4g6nH52kVm
	jy0rbzJ5PO3fyu6xc9Zddo8Fm0o9Nq3qZPPYvKTeY+eOz0we7/ddZfPo27KK0ePgPkOPz5vk
	AniiuGxSUnMyy1KL9O0SuDL2zuxhLjjMV/Hs5SbmBsY/3F2MnBwSAiYSM6Y8Ze9i5OIQEtjN
	KPHp8U5GiISkxKfmqawQtrDEyn/PoYo+MUqsPDQXrIhNQEPi+ortYAkRgQ4miT1TTzKDOMwC
	G5kkjl3azA5SJSzgJNE+ZwkTiM0ioCqxb9taFhCbV8BK4sm7jywQK+QlVm84wDyBkWcBI8Mq
	RsnUguLc9NxiwwKjvNRyveLE3OLSvHS95PzcTYzgqNDS2sG4Z9UHvUOMTByMhxglOJiVRHjb
	6rekC/GmJFZWpRblxxeV5qQWH2KU5mBREuf99ro3RUggPbEkNTs1tSC1CCbLxMEp1cCU93rV
	qQMWM47VnvY4dHvPxBK+K69O2F9/rOt1Rq1ipn1h71qLi0tnXT07yXvzioMdAnFmt4wy6/n0
	U5dHb95WcIllk4RXrMjrDbO4Gp96aR6brtujq3/fp7FZ8xKT+vGy9lmzMr2y1qkZdFxK/zNj
	uajV/qsCv+d4li3MW10ToZL68UXTznd5u7Xud4RqZSX3r1zYXBw/ce7iOM2CiaYd9gabI7dZ
	rMhadbpYWENrVd45b34rrxs9R3d0lrjFlM0NVQsWXCL9aO0fTpG05eunZt84wVL28MHXE3OO
	zJ52OGC+zGXtg1q/UvQrWF4cn3HQZvaO7fLLZH5EBu779GOe+aeTplkuzxo3L1owy3vHZSWW
	4oxEQy3mouJEAD8KrUj5AgAA
X-CMS-MailID: 20250220044123epcas5p1eb9f906067a6e2585f9e4598653857fd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250220044123epcas5p1eb9f906067a6e2585f9e4598653857fd
References: <CGME20250220044123epcas5p1eb9f906067a6e2585f9e4598653857fd@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_232405_019608_88592D56 
X-CRM114-Status: GOOD (  19.21  )
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

Changes since v6:
1. Addressed review comments by Krzysztof on dt-binding file regarding
clock-names property
2. Corrected indentation issue in dt-binding
3. Addressed Andrew's comment on listing phy-modes.

Here is the link to v6 patches for reference:
https://lore.kernel.org/netdev/20250213044624.37334-1-swathi.ks@samsung.com/

Swathi K S (2):
  dt-bindings: net: Add FSD EQoS device tree bindings
  net: stmmac: dwc-qos: Add FSD EQoS support

 .../devicetree/bindings/net/snps,dwmac.yaml   |   5 +-
 .../bindings/net/tesla,fsd-ethqos.yaml        | 115 ++++++++++++++++++
 .../stmicro/stmmac/dwmac-dwc-qos-eth.c        |  28 +++++
 3 files changed, 146 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/tesla,fsd-ethqos.yaml

-- 
2.17.1


