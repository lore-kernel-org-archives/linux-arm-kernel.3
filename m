Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F599C19777
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=GB97pYLpDQ6tgX78bR35TsDYzztt4s1z6GEmVMXWXBU=; b=j0q4zLpau+kMtF
	z3enCKEJ5ftDL8lB5hM0YbMhnuiDVOopvLQE32JdfC3sStLRcGmP//w0V9VhY3qZcpKjF4rsVbbB8
	slncLRZHOxnQ9DbvlUQRFHrt66XPM7zfjxwkkF5YzHw3xvW6PIW+Tyb8P5FXv1o8eJa9nOgANs8jt
	T3PdbHB9TInNdzFlzs5ZSEC4pMd4iqnOwOw52j9z3rgnmjfI1MmkVfg9UCKLJwiV/npYQ3iT52b9g
	jau53tgAo2RHD3JPtVn55PWT2cizZFQBiSu4YjdqgQi5Ok+Cmf1kG1etwMuMhcjSAPFPejuc3DW0T
	+K34J/R+DkPftH1+xkgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxx2-00000000Fec-2Odw;
	Tue, 25 Feb 2025 16:38:32 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmuzS-0000000HNRO-2K2A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 13:28:52 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250225132844epoutp03242889ad5d792b6ea5c68577556ba121~ndowLpfNS1565915659epoutp03c
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 13:28:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250225132844epoutp03242889ad5d792b6ea5c68577556ba121~ndowLpfNS1565915659epoutp03c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1740490124;
	bh=GB97pYLpDQ6tgX78bR35TsDYzztt4s1z6GEmVMXWXBU=;
	h=From:To:Cc:Subject:Date:References:From;
	b=T+Bh8CgN8uxCag3gvq9dzgZlw5itN6OLC+zQnfA+hNIeS4BKjcreifGsMphlw8dCM
	 a4X5ocyGYAyt7D4miBtmN16yefpKYUSg0zsZpPH99HruCOA2Mpr/Qw5c9iAhXCyul+
	 cd0Oj+qlV4cXrqJ8B6sK7MzhrRsfJWnfv4Isvr08=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20250225132844epcas5p4cf1928f596fffee98c4c670392e31de7~ndov2Z6I12351523515epcas5p4G;
	Tue, 25 Feb 2025 13:28:44 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.180]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4Z2JMt6N5jz4x9Pr; Tue, 25 Feb
	2025 13:28:42 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
	epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	75.45.19933.A85CDB76; Tue, 25 Feb 2025 22:28:42 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250225132431epcas5p148b0c62e36ea09c35473c8da7f312ece~ndlEdiUWI1609216092epcas5p1X;
	Tue, 25 Feb 2025 13:24:31 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250225132431epsmtrp2d29ed31d237e06b6201e8d2dbc618650~ndlEcs8fS1147511475epsmtrp2f;
	Tue, 25 Feb 2025 13:24:31 +0000 (GMT)
X-AuditID: b6c32a4a-b87c770000004ddd-5b-67bdc58a93eb
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	87.A2.23488.F84CDB76; Tue, 25 Feb 2025 22:24:31 +0900 (KST)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250225132427epsmtip29deb63f3da29d8b2328d554f4eeffab8~ndlAf9dbd1947719477epsmtip2c;
	Tue, 25 Feb 2025 13:24:27 +0000 (GMT)
From: Varada Pavani <v.pavani@samsung.com>
To: krzk@kernel.org, aswani.reddy@samsung.com, pankaj.dubey@samsung.com,
	s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com,
	mturquette@baylibre.com, sboyd@kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: gost.dev@samsung.com, Varada Pavani <v.pavani@samsung.com>
Subject: [PATCH v2 0/2] clk: samsung: Update PLL locktime and samsung
 function
Date: Tue, 25 Feb 2025 18:49:16 +0530
Message-Id: <20250225131918.50925-1-v.pavani@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrEKsWRmVeSWpSXmKPExsWy7bCmhm7X0b3pBue/G1k8mLeNzeLQ5q3s
	Fte/PGe1uHlgJ5PF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxaKtX9gtDr9pZ7X4
	d20ji8WG3lfsDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZl22SkJqakFimk5iXnp2Tm
	pdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYA3amkUJaYUwoUCkgsLlbSt7Mpyi8t
	SVXIyC8usVVKLUjJKTAp0CtOzC0uzUvXy0stsTI0MDAyBSpMyM44u/stY8F89op9648yNzD2
	s3UxcnJICJhIrJ36kr2LkYtDSGA3o8SblV1MEM4nRonnf/6zQDjfGCUWrL7ODtNycNc7qJa9
	jBJ31p6Fcr4wSmzbtBJsMJuAlsTqqctZQWwRgSNMEn9OpILYzAJ2EuunzmXuYuTgEBYIkLj0
	Wx4kzCKgKrF05hawBbwClhINF7dA3ScvsXrDAWaQ+RICt9glVu5axgSRcJHYv24HM4QtLPHq
	+Bao66QkPr/bywYyX0IgWaL9EzdEOEfi0u5VUK32EgeuzGEBKWEW0JRYv0sfIiwrMfXUOiaI
	K/kken8/gSrnldgxD8ZWkti5YwKULSHxdPUaqDM9JDr/bwfbKiQQK3H3ufQERtlZCAsWMDKu
	YpRMLSjOTU8tNi0wyksth0dTcn7uJkZw4tPy2sH48MEHvUOMTByMhxglOJiVRHg5M/ekC/Gm
	JFZWpRblxxeV5qQWH2I0BYbYRGYp0eR8YOrNK4k3NLE0MDEzMzOxNDYzVBLnbd7Zki4kkJ5Y
	kpqdmlqQWgTTx8TBKdXA1Lm3VUPJicNz93b1vFum/L2ZG++0BTHem9+ksfGowYrlkb2ThLz2
	3XU9Ofd1a8JLl4NXZycYTWEukZ1Uuyrs5KEX0aZJDNriW29cX6Aj13ZcNitichSHhPQKw+Ui
	yybcOCEQcMx1xVL5KLbkUJUfz2Y8e3TN7c8XlWXJj91efyt6ftD6Ym4FVwPbsXOnTdp+Fery
	hZ1KOTMhLT1lu3Co2pna/KVVCX2MP1531TJvrG/i6y0W2WU+Z+bNzQuWTd33uMXn2e+Cq7Wr
	bO6xp6++K8iyb5V7m9O9+xKuIdFVRWpPQjYlRrC9tnRPnRWivOhOauBkcUWmHVZsyzlutj/N
	azHlyeI5KiHm279VPUdJiaU4I9FQi7moOBEAaoAFDQUEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrILMWRmVeSWpSXmKPExsWy7bCSvG7/kb3pBjPuq1g8mLeNzeLQ5q3s
	Fte/PGe1uHlgJ5PF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxaKtX9gtDr9pZ7X4
	d20ji8WG3lfsDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZx2aSk5mSWpRbp2yVwZZzd
	/ZaxYD57xb71R5kbGPvZuhg5OSQETCQO7nrH3sXIxSEksJtRYvL/NewQCQmJnd9amSFsYYmV
	/55DFX1ilLh7eQpYgk1AS2L11OWsIAkRgUtMEgeOPAHrZhZwkLh49gkLiC0s4Cdx78g7VhCb
	RUBVYunMLWA1vAKWEg0Xt0CdIS+xesMB5gmMPAsYGVYxSqYWFOem5yYbFhjmpZbrFSfmFpfm
	pesl5+duYgSHopbGDsZ335r0DzEycTAeYpTgYFYS4eXM3JMuxJuSWFmVWpQfX1Sak1p8iFGa
	g0VJnHelYUS6kEB6YklqdmpqQWoRTJaJg1OqgcnHvFG5lOf+rAfF2/a3M7A3ZBmrJd8wzd4X
	urdLUfFsbZ5D9oGLii+lZhR8c963RqYlpFrlR4xvhY7GHu+Ct8cN+OwmCi4T2Z83N1L9c7hp
	vFoI2xv5OSeuXvKVDhFuTM8y228+aZl6uXKUa7iZPUMk28WjTHq9q6XfxkY4ZlW8YOtvN+HV
	9KuWV3p9ePFT6+9GGyXKklzPLXMwWHBgmdiy/Jxkk7e5+isOnTZ3mfN7XZPsD5WWXcKLs5+E
	aFU3zry1luHzLoFre1VLeWZLVh4yC7W44qm48pbA8ZwZniy7VY5OjgxfG7d+mQtH/ru/M9cm
	xW07fuBk/bcpU4Onna0+FXHIsME4abu41NKZSizFGYmGWsxFxYkA8XO+UrQCAAA=
X-CMS-MailID: 20250225132431epcas5p148b0c62e36ea09c35473c8da7f312ece
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250225132431epcas5p148b0c62e36ea09c35473c8da7f312ece
References: <CGME20250225132431epcas5p148b0c62e36ea09c35473c8da7f312ece@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_052850_903866_5D2752FB 
X-CRM114-Status: GOOD (  12.61  )
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

This patch series updates samsung clock driver with common samsung
CCF function and defines locktime value for PLL142XX controller.

Changes since v1:
1. Addressed review comment by Krzysztof. Removed fixes tag and updated commit
message. Below is the link for v1.
https://patchwork.kernel.org/project/linux-clk/patch/20240926144513.71349-3-v.pavani@samsung.com/

Varada Pavani (2):
  clk: samsung: Use samsung CCF common function
	This patch is missed in this series https://patchwork.kernel.org/project/linux-clk/cover/20240926144513.71349-1-v.pavani@samsung.com/ hence posting again.
  clk: samsung: Fixes PLL locktime for PLL142XX used on FSD platfom
	Got review comment in this patch will address in next patch series.

 drivers/clk/samsung/clk-exynos4.c | 78 +++++++++++++++++--------------
 drivers/clk/samsung/clk-pll.c     |  7 ++-
 2 files changed, 50 insertions(+), 35 deletions(-)

-- 
2.17.1


