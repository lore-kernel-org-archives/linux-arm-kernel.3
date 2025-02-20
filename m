Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B5CC021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 09:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=4misLsGizIp8iJMKt8X2Vm5Ecs/n9mjZr4L2QsqFWXM=; b=b3ceer8hcIHF3h
	rufcDN3ldSLP26JCwrWyl0trn9o7FJQSzufli9zUu+PpYfB5wgJ24dOiPu4gbTPbGctRMVRn+zTYA
	lF3SQHdFr17wLESYS5mC5BF/TpP8B06su1e99IboPZ7KK7sIIgOLbSMbiIsW9dVMrwWBCYyJQ6tij
	0s+/5PLpTYc3uX/1Wq2YcsKuIWf6CZccTQmbSg9OavqVIXhjWqRHgWFRAf1RXkNclOs+bPNgueqwr
	eBRk8mnvkHpcDqH4pzdlsIL4vOkybhbFDYhCTAcGgbX4LX6BZWx7Q5ahnHLPaprGiQjrZGSqDIqAU
	Mud8EUsy+ODjtntTi9iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl2e7-0000000HYhJ-1i6W;
	Thu, 20 Feb 2025 09:15:03 +0000
Received: from [203.254.224.33] (helo=mailout3.samsung.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl2cb-0000000HYIz-21W5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 09:13:31 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250220091325epoutp0365c603f110f2bdfeb87032d22e79149d~l37ZanAXc2070220702epoutp03X
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 09:13:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250220091325epoutp0365c603f110f2bdfeb87032d22e79149d~l37ZanAXc2070220702epoutp03X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1740042805;
	bh=4misLsGizIp8iJMKt8X2Vm5Ecs/n9mjZr4L2QsqFWXM=;
	h=From:To:Cc:Subject:Date:References:From;
	b=LrBaGoGJ7evwoCMSk8hi7DaVOCciwIbblIEXmfgZMt64lJjrAvB/P5HFtN0aL1YN+
	 +b3MJSE0VxUuYNjhxkm57BGNc/xXXbhk1a+M0NcJMkZf06CIoKmonS2602P1gXsNZV
	 AdODV6RAxDYieuKsqSLlSJGMHdGqmU+JUDUqyuXk=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20250220091324epcas5p42d6766705a53da738706cb26af96c3a0~l37YrWvpt1887418874epcas5p49;
	Thu, 20 Feb 2025 09:13:24 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.174]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4Yz6xZ3VfQz4x9QH; Thu, 20 Feb
	2025 09:13:22 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	59.7F.19933.232F6B76; Thu, 20 Feb 2025 18:13:22 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250220073939epcas5p24b926b2dd3bcfda426b03309d8c29590~l2piTYbsi3085630856epcas5p2a;
	Thu, 20 Feb 2025 07:39:39 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250220073939epsmtrp1850a517d022c0d7bb0aff188bbf88784~l2piSa9JX2536525365epsmtrp1o;
	Thu, 20 Feb 2025 07:39:39 +0000 (GMT)
X-AuditID: b6c32a4a-b87c770000004ddd-f2-67b6f23262df
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	D7.3E.18729.B3CD6B76; Thu, 20 Feb 2025 16:39:39 +0900 (KST)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250220073937epsmtip2cb6b4cac36a7a6ea08a4d6f3ab053e3d~l2pgGOnLT3266832668epsmtip2s;
	Thu, 20 Feb 2025 07:39:37 +0000 (GMT)
From: Swathi K S <swathi.ks@samsung.com>
To: krzk+dt@kernel.org, linux-fsd@tesla.com, robh@kernel.org,
	conor+dt@kernel.org, richardcochran@gmail.com, alim.akhtar@samsung.com
Cc: jayati.sahu@samsung.com, swathi.ks@samsung.com,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, pankaj.dubey@samsung.com, ravi.patel@samsung.com,
	gost.dev@samsung.com
Subject: [PATCH v7 0/2] arm64: dts: fsd: Add Ethernet support for FSD SoC
Date: Thu, 20 Feb 2025 13:05:25 +0530
Message-Id: <20250220073527.22233-1-swathi.ks@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpik+LIzCtJLcpLzFFi42LZdlhTU9fo07Z0g2dnJSwezNvGZrFm7zkm
	i/lHzrFa3Dywk8niyKklTBYvZ91js9j0+BqrxcNX4RaXd81hs5hxfh+TxbEFYhaLtn5ht3j4
	YQ+7xZEzL5gt/u/ZwW7xZeNNdgcBj52z7rJ7bFrVyeaxeUm9R9+WVYwe/5rmsnt83iQXwBaV
	bZORmpiSWqSQmpecn5KZl26r5B0c7xxvamZgqGtoaWGupJCXmJtqq+TiE6DrlpkDdLWSQlli
	TilQKCCxuFhJ386mKL+0JFUhI7+4xFYptSAlp8CkQK84Mbe4NC9dLy+1xMrQwMDIFKgwITtj
	ybLz7AW9PBUnTn9kbWD8wNnFyMkhIWAi8al1J1sXIxeHkMBuRokbbY+hnE+MEkeP/oRyvjFK
	/L5/khWmZd6UBcwgtpDAXkaJVW8VIYq+MErM/tXPApJgE9CQuL5iOztIQkSgjVHi2NNGMIdZ
	YC6TxKqD24DmcnAIC3hK3FrLDdLAIqAqcWdqL9hUXgEriTWnfrJDbJOXWL3hADNIr4TAT3aJ
	3sV7WCASLhL3jn9ghrCFJV4d3wLVICXxsr8Nyo6XWN13Fao+Q+Lur4lsELa9xIErc1hAbmAW
	0JRYv0sfIiwrMfXUOiYQm1mAT6L39xMmiDivxI55MLayxN/X16BGSkpsW/qeHWSMhICHxMaL
	KpBAiZW4fOwv2wRG2VkICxYwMq5ilEwtKM5NTy02LTDKSy2HR1Ryfu4mRnBi1PLawfjwwQe9
	Q4xMHIyHGCU4mJVEeNvqt6QL8aYkVlalFuXHF5XmpBYfYjQFBtlEZinR5Hxgas4riTc0sTQw
	MTMzM7E0NjNUEudt3tmSLiSQnliSmp2aWpBaBNPHxMEp1cAUd8FWniUvb96WJYscSx7bs/Vv
	6DrINr3cW2hH6hrW42Uiz/J/3L0vyix+gvMCl0wLh1LgbqtpUnZm0403XbTlMwoWa5yzPpb3
	vMeDPZfevupYmjr5/gTvHXyrXpqXas80zN/CcLfn2f4WMaUze4r3MvtsljjPf63lnoJf3yKR
	mf8OhBYlneB+e3LyDG2erjQunoprFwW6rzls+deUvVhOZeWL4vkup0PXXX2dxvjC4Mq6C5pd
	7IqWUzkWP4/z1l55LbzgzY9kV4/Fh9/fm97AcM5xddSGr5I2obFv08zVznyctfrtASOZfXtP
	W025MjU/2aQ0aeemu5suObCnG0823eg9te2CaHi7Yp2kkeojJZbijERDLeai4kQARMCm1RUE
	AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPLMWRmVeSWpSXmKPExsWy7bCSvK71nW3pBq8P6Fk8mLeNzWLN3nNM
	FvOPnGO1uHlgJ5PFkVNLmCxezrrHZrHp8TVWi4evwi0u75rDZjHj/D4mi2MLxCwWbf3CbvHw
	wx52iyNnXjBb/N+zg93iy8ab7A4CHjtn3WX32LSqk81j85J6j74tqxg9/jXNZff4vEkugC2K
	yyYlNSezLLVI3y6BK2PJsvPsBb08FSdOf2RtYPzA2cXIySEhYCIxb8oC5i5GLg4hgd2MElcn
	rmKCSEhKfGqeygphC0us/PecHaLoE6PE4StXwYrYBDQkrq/YDpYQEehjlNiwvZUFxGEWWM4k
	seBAA2MXIweHsICnxK213CANLAKqEnem9jKD2LwCVhJrTv1kh9ggL7F6wwHmCYw8CxgZVjFK
	phYU56bnFhsWGOallusVJ+YWl+al6yXn525iBIepluYOxu2rPugdYmTiYDzEKMHBrCTC21a/
	JV2INyWxsiq1KD++qDQntfgQozQHi5I4r/iL3hQhgfTEktTs1NSC1CKYLBMHp1QDk8aMZ8Jy
	hvNFJpUmTY4Ls00pYXkplFK2c1VIZan1uqB7p6+e6tnLKRuQbDrruenOM9/lf0U4tSx9knr8
	otvLUpPjpxIDLulzvWvcG8x5Mnxr1N6a0DXn/3sW24me273mY+sxnzZbV3WTR6kBBgU3/7Ae
	U3Sb+FtJRVZzvl5jgkO59XsXtZLilCwnIyeJNm35G2f2yjnkGBx4WmN5qja/UveIYM71ra7T
	wmseR3h6Ze4/tzfxfu7XrOPq6VnPll5M3Re8w/2Vl4fhjQTeBf8ZQyOO6Txy5Cn2szRs/nvt
	Z4C38WTOs+azspRWaQus1X6/UaYjlJdxH6dE9rGdilV2N05KVux82x7WzvX+zHclluKMREMt
	5qLiRACs3C//wgIAAA==
X-CMS-MailID: 20250220073939epcas5p24b926b2dd3bcfda426b03309d8c29590
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250220073939epcas5p24b926b2dd3bcfda426b03309d8c29590
References: <CGME20250220073939epcas5p24b926b2dd3bcfda426b03309d8c29590@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_011330_161317_CFB1F5EE 
X-CRM114-Status: GOOD (  15.07  )
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
another one is in PERIC block. This patch series add required DT file
modifications for the same.

Changes since v1:
1. Addressed the format related corrections.
2. Addressed the MAC address correction.

Changes since v2:
1. Corrected intendation issues.

Changes since v3:
1. Removed alias names of ethernet nodes

Changes since v4:
1. Added more details to the commit message as per review comment.

Changes since v5:
1. Avoided inserting node in the end and inserted it in between as per
address.
2. Changed the node label.
3. Separating DT patches from net patches and posting in different
branches.

Changes since v6:
1. Addressed Andrew's review comment and removed phy-mode from .dtsi to
.dts

Here is the link to v6 patches for reference:
https://lore.kernel.org/netdev/20250213132328.4405-1-swathi.ks@samsung.com/

This patch depends on the DT binding patch
https://lore.kernel.org/netdev/20250220043712.31966-2-swathi.ks@samsung.com/

And the driver patch
https://lore.kernel.org/netdev/20250220043712.31966-3-swathi.ks@samsung.com/

Swathi K S (2):
  arm64: dts: fsd: Add Ethernet support for FSYS0 Block of FSD SoC
  arm64: dts: fsd: Add Ethernet support for PERIC Block of FSD SoC

 arch/arm64/boot/dts/tesla/fsd-evb.dts      |  20 ++++
 arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi | 112 +++++++++++++++++++++
 arch/arm64/boot/dts/tesla/fsd.dtsi         |  47 +++++++++
 3 files changed, 179 insertions(+)

-- 
2.17.1


