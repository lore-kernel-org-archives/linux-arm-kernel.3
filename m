Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C328E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 02:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KLKyQnrF5x93Vn+g5TnewvjfKvBfI76WnJygwdw0hVE=; b=dd48jpWO6X7PUGGXtWAhx98V/z
	+vf+u4RPGBc0j5dK+kL1omjpMS0CT4zEs6BRKF1I0OI7cFOtiDELL4e9qy9RywouxR0i1B2/RGut4
	lyPA0iL5BQyOx1gupPR/WVerMOIU2E9l+zcAWM+3zt8bNO/Nur48COAoVRUseV/I2dBb0j7S+nKZN
	GzfhYB2w34b4yEnEVCjFRnbMA9YJbLjIcUEGA0skK/dzaAgQn0JPAmtOJX0KHOl3Q1cZo0gRRKWkq
	j5rEHfVNyDOpxQiYRPeI3s6njvea0LTfGRPyCUcWW1a5+8roKTHlnsjIB2WLChuFpk4vLeFffIPlK
	BaljzSNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tK6jG-00000004hXw-3Woz;
	Sun, 08 Dec 2024 02:09:02 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tK6iC-00000004hTH-2J3g
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Dec 2024 02:08:00 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20241208020749epoutp01c064b814c4a365ef083192f4b725817c~PEYrBt16D0782007820epoutp01L
	for <linux-arm-kernel@lists.infradead.org>; Sun,  8 Dec 2024 02:07:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20241208020749epoutp01c064b814c4a365ef083192f4b725817c~PEYrBt16D0782007820epoutp01L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1733623669;
	bh=KLKyQnrF5x93Vn+g5TnewvjfKvBfI76WnJygwdw0hVE=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=lQ068TEsb14Qt2IAbOxt08K/q1IPU33JZc9siaGJ4R0CB+evzIt54ba+rPbpZE8XO
	 tiawwqSmkRUNaYhK4sns2UsJta20unfid1+z5uuh6Kx3t9zNgbqPXbiaD0GD6YPrH0
	 05JM6wBul1oJV9BEBo/k63UGeftS+BtRmrpL1/r4=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20241208020748epcas5p47a267cd9724258ead187b5351ef77e4c~PEYqcoTaO2944129441epcas5p4p;
	Sun,  8 Dec 2024 02:07:48 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.178]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4Y5T0g3XvGz4x9Pw; Sun,  8 Dec
	2024 02:07:47 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	E2.BC.20052.37FF4576; Sun,  8 Dec 2024 11:07:47 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20241208020746epcas5p4ad06deac63f0f0e684f3fa2e0153e7d3~PEYoT8nZZ0889108891epcas5p4z;
	Sun,  8 Dec 2024 02:07:46 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241208020746epsmtrp12d808f1a8f2c3d155f54aa8b1ccfa648~PEYoTSpG20269902699epsmtrp1I;
	Sun,  8 Dec 2024 02:07:46 +0000 (GMT)
X-AuditID: b6c32a49-3fffd70000004e54-70-6754ff73a69d
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	CC.10.18949.27FF4576; Sun,  8 Dec 2024 11:07:46 +0900 (KST)
Received: from INBRO002756 (unknown [107.122.12.5]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20241208020745epsmtip1b959213a34c4853655a97200e8f779f2~PEYnKg_W62769927699epsmtip14;
	Sun,  8 Dec 2024 02:07:44 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Faraz Ata'" <faraz.ata@samsung.com>, <devicetree@vger.kernel.org>,
	<linux-samsung-soc@vger.kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>
Cc: <linux-arm-kernel@lists.infradead.org>, <rosa.pila@samsung.com>
In-Reply-To: <20241204122335.1578-1-faraz.ata@samsung.com>
Subject: RE: [PATCH] arm64: dts: exynosautov920: add DMA nodes
Date: Sun, 8 Dec 2024 07:37:43 +0530
Message-ID: <141801db4915$f8ffb4d0$eaff1e70$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFjpTq5mUG5UMRch2oPlNEF/ignPQHSFX3Ys7xQWvA=
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMJsWRmVeSWpSXmKPExsWy7bCmlm7x/5B0g94Pkhbzj5xjtbh2YyG7
	xctZ99gsNj2+xmox4/w+Jov/e3awW3z5+YDZgd1j06pONo/NS+o9+rasYvT4vEkugCUq2yYj
	NTEltUghNS85PyUzL91WyTs43jne1MzAUNfQ0sJcSSEvMTfVVsnFJ0DXLTMH6AAlhbLEnFKg
	UEBicbGSvp1NUX5pSapCRn5xia1SakFKToFJgV5xYm5xaV66Xl5qiZWhgYGRKVBhQnbGh1dP
	2Qoes1XcO3ubrYHxImsXIweHhICJRN/6oC5GLg4hgd2MEk9m/2DsYuQEcj4xSpy8ngiR+MYo
	seTdXXaQBEjD0pnn2CESexkl/kxdzwThvGCUeLZ1LVgVm4CuxI7FbWwgCRGB6YwSL6bdYQNJ
	MAs4S6x9e5sJZDengJXEnQ0BIGFhATuJOS2/mUFsFgEViSm/fzGB2LwClhJzm9+wQtiCEidn
	PmGBGCMvsf3tHGaIixQkfj5dBlYjAjRy0prTUDXiEi+PHgG7VEKgl0Pi2rOdLBANLhKTtp1n
	hLCFJV4d3wL1mpTEy/42KDtb4vjFWWwQdoVEd+tHqLi9xM5HN1lA7mcW0JRYv0sfYhefRO/v
	J0yQIOWV6GgTgqhWlWh+dxVqq7TExO5uVgjbQ+Ji5yamCYyKs5B8NgvJZ7OQfDALYdkCRpZV
	jJKpBcW56anFpgWGeanl8OhOzs/dxAhOnVqeOxjvPvigd4iRiYPxEKMEB7OSCG9lWGC6EG9K
	YmVValF+fFFpTmrxIUZTYHBPZJYSTc4HJu+8knhDE0sDEzMzMxNLYzNDJXHe161zU4QE0hNL
	UrNTUwtSi2D6mDg4pRqY5jVNmKmy5ejERdsFTNzFE5bfq51pkOR0PVuTn2eR4dMnPd4M3MkO
	+lJOV2Inn7qXyiSZ87Q/XqDwtvP5GPd33Q/zGQImtfk5LvpabH3sYcuZj68rXfUMnuf9Fmr8
	0hWfmXs44E2LlspRPYHe5vTnsmvlOJ8HdvRuMX9x3+jeiQhm0ymFq2INz8udnzj5zYKPe7bt
	9atrjhN88vhwxrbJ3Cv//t57S1rJ84Hi1Vt6fIlsP1pCzSU4D2Tm2wd2mdU0b1Zy0dJNyHtz
	fqXS6xn/mNJsZpzVfcXsLpo6NbKstGkn/23DUw8/L1891z6/gkfR7JqFpLXowva1DblHt83+
	E6H717LTRr7H3OHQUnYlluKMREMt5qLiRAASlYYjJgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHLMWRmVeSWpSXmKPExsWy7bCSnG7R/5B0g69XOS3mHznHanHtxkJ2
	i5ez7rFZbHp8jdVixvl9TBb/9+xgt/jy8wGzA7vHplWdbB6bl9R79G1ZxejxeZNcAEsUl01K
	ak5mWWqRvl0CV8aHV0/ZCh6zVdw7e5utgfEiaxcjJ4eEgInE0pnn2LsYuTiEBHYzSky+s5sZ
	IiEtcX3jBHYIW1hi5b/nUEXPGCX2vN7FCJJgE9CV2LG4jQ0kISIwl1Hi4Y3fbCAJZgFXiS3/
	vrJBdHQzSjy+ewVoLAcHp4CVxJ0NASA1wgJ2EnNafoNtYxFQkZjy+xcTiM0rYCkxt/kNK4Qt
	KHFy5hMWiJnaEk9vPoWy5SW2v50DdamCxM+ny8DqRYDGT1pzGqpGXOLl0SPsExiFZyEZNQvJ
	qFlIRs1C0rKAkWUVo2RqQXFuem6xYYFRXmq5XnFibnFpXrpecn7uJkZwFGlp7WDcs+qD3iFG
	Jg7GQ4wSHMxKIryVYYHpQrwpiZVVqUX58UWlOanFhxilOViUxHm/ve5NERJITyxJzU5NLUgt
	gskycXBKNTCZbpnPnXmCT/NLy5u/N76m1J7Z1N53mJ+R6ar3M227WD++Z3n2omc8b9Qt452w
	94LS5YIFD/c1/8r85/X/xvR3ng+/rD7JtvDtz0cfvbXdpLNX7KguNJi5TPdzS0/5swXioaHB
	ojq9K07O7pV5f7Pi8GmlgBN710xINk3xv9kgsIdp69lIIYF9wZNWsMRMYp2Xeip1xTsbuR7h
	1mizBXFvJjHJdZxKcVh35u0izzu9O1OuaiZcP3FOPX6ueeLmBxJTFd6untMdoZgRb7tLvKb5
	8ZOtLwuEJC99EN3U+vT+z4U/5xubqp398mymK8OFov5XZoGlfScuZ7hFzClOFc4VW/Mizi6p
	7+jif3vzFOwTlFiKMxINtZiLihMB3PCpshEDAAA=
X-CMS-MailID: 20241208020746epcas5p4ad06deac63f0f0e684f3fa2e0153e7d3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241204122402epcas5p2412733eb46d495fadfa30e5af3c5ce83
References: <CGME20241204122402epcas5p2412733eb46d495fadfa30e5af3c5ce83@epcas5p2.samsung.com>
	<20241204122335.1578-1-faraz.ata@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_180757_966282_4ACD6B8A 
X-CRM114-Status: GOOD (  16.38  )
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

Hi Faraz,

> -----Original Message-----
> From: Faraz Ata <faraz.ata@samsung.com>
> Sent: Wednesday, December 4, 2024 5:54 PM
> To: devicetree@vger.kernel.org; linux-samsung-soc@vger.kernel.org;
> krzk+dt@kernel.org; robh@kernel.org
> Cc: linux-arm-kernel@lists.infradead.org; alim.akhtar@samsung.com;
> rosa.pila@samsung.com; Faraz Ata <faraz.ata@samsung.com>
> Subject: [PATCH] arm64: dts: exynosautov920: add DMA nodes
> 
> ExynosAutov920 SoC has 7 DMA controllers. Two secure DMAC
> (SPDMA0 & SPDMA1) and five non-secure DMAC (PDMA0 to PDMA4).
> Adds the required dt node for the same.
> 
> Signed-off-by: Faraz Ata <faraz.ata@samsung.com>
> ---

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

>  .../arm64/boot/dts/exynos/exynosautov920.dtsi | 63
> +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>
.
.
.
 
> 2.34.1



