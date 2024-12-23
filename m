Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93327E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 02:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1yi8VifrbHgYZt97+z0+c2/5hRN41YzklThVkZgjkiM=; b=3qn+LPYMKSQG8VYIgyNZoQrZBu
	UK7Ew6j8/9j4C/DSkmQBUPknWp3VG3/n0DTkTAXGV7QxuAPiIgKVzrpcrXcx301ccnC4aUe5R2dJW
	h52a3xPjwF9o5qa1Rf85pSbJEMXlcBXDKpXONxHvP74opu8thmaF2DhFW0NuQ5JDYFvp/kODq9gGz
	jEpvTLPuFpLXYR7Ydv9Rb+PTxaHHjfhsMEJUq2005zIaG5R3viS8FQoudYDWSSY5Zx7vAbFCPTf2+
	W7G2NsZV1atvmRWQjh2uRFqWLyL462OsOd8k0sGdmyd7crHVjWm3dedDsr6jo6sggo58k5InSaGj2
	yTji7DwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPXy1-000000098AX-1HVe;
	Mon, 23 Dec 2024 02:14:45 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPXwp-0000000981f-14zd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 02:13:32 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20241223021325epoutp021bc9b11d613091103cfa3e896016694b~TrI17K9W40714207142epoutp023
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 02:13:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20241223021325epoutp021bc9b11d613091103cfa3e896016694b~TrI17K9W40714207142epoutp023
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1734920005;
	bh=1yi8VifrbHgYZt97+z0+c2/5hRN41YzklThVkZgjkiM=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=tDloVFYzYG3ZiFtC/IhTf91ENQFm2L9vv017kIQXuPQYq9/Zna57SWLkX4obVeJJ/
	 lWY/vqTpdDhy1ikOWgSctiZ8tbvjzyrCbjkx0quqrAj66eUkD3d/jr5qgd6z0pEtRp
	 E3W5sn0tHRU4PKjKhs6d6XNhRqqop/IR1AKcuP3Y=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTP id
	20241223021324epcas5p14dc32012cf9f48c37faaaafb237be46b~TrI1H5NuR1851418514epcas5p1K;
	Mon, 23 Dec 2024 02:13:24 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.181]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4YGhQB4Hdxz4x9Q8; Mon, 23 Dec
	2024 02:13:22 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
	epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
	95.E1.19956.247C8676; Mon, 23 Dec 2024 11:13:22 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20241223021321epcas5p4278f1753b6d8219259813a50effc9b5c~TrIy_iSl21096310963epcas5p4N;
	Mon, 23 Dec 2024 02:13:21 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241223021321epsmtrp2667826646f5cc5b85fa5063f4b86573c~TrIy8OhUL2478724787epsmtrp2t;
	Mon, 23 Dec 2024 02:13:21 +0000 (GMT)
X-AuditID: b6c32a4b-fd1f170000004df4-a3-6768c742bb77
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	D8.01.18949.147C8676; Mon, 23 Dec 2024 11:13:21 +0900 (KST)
Received: from INBRO001561 (unknown [107.122.12.6]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20241223021319epsmtip17eaaeab248a473b2eb42fa9ee36b3246~TrIxFdnUx0069500695epsmtip1C;
	Mon, 23 Dec 2024 02:13:19 +0000 (GMT)
From: "Pankaj Dubey" <pankaj.dubey@samsung.com>
To: "'Rob Herring \(Arm\)'" <robh@kernel.org>, "'Lee Jones'"
	<lee@kernel.org>, "'Arnd Bergmann'" <arnd@arndb.de>, "'Heiko Stuebner'"
	<heiko@sntech.de>, "'Liviu Dudau'" <liviu.dudau@arm.com>, "'Sudeep Holla'"
	<sudeep.holla@arm.com>, "'Lorenzo	Pieralisi'" <lpieralisi@kernel.org>
Cc: "'Peter Griffin'" <peter.griffin@linaro.org>, "'Will McVicker'"
	<willmcvicker@google.com>, "'John Madieu'" <john.madieu.xa@bp.renesas.com>,
	"'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
In-Reply-To: <20241217-syscon-fixes-v2-2-4f56d750541d@kernel.org>
Subject: RE: [PATCH v2 2/3] mfd: syscon: Remove the platform driver support
Date: Mon, 23 Dec 2024 07:43:18 +0530
Message-ID: <000101db54e0$3d4b15a0$b7e140e0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQEZrw4XBTjqISieS499QzyO27eqOgDzNggKAYoQvF20YnesoA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBJsWRmVeSWpSXmKPExsWy7bCmlq7T8Yx0g0OLFCz+TjrGbvH/0WtW
	izUb6yz2vt7KbrGjbSGLxabH11gtLu+aw2ZxYGk7i0XLnxYWiw0z/rFY/N+zg91i+akdLBar
	Pv1ndOD1WDNvDaPH71+TGD1WvpjN7rFgU6nHplWdbB53ru1h89i8pN5j+7V5zB6fN8kFcEZl
	22SkJqakFimk5iXnp2TmpdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYAXa2kUJaY
	UwoUCkgsLlbSt7Mpyi8tSVXIyC8usVVKLUjJKTAp0CtOzC0uzUvXy0stsTI0MDAyBSpMyM64
	s30Oc0Ezf8WrhnbWBsZTPF2MnBwSAiYSbc/Ws3cxcnEICexmlNg09wkLhPOJUeLorVMsIFVC
	At8YJf4+ioTp+L/oNhNE0V5GiR1TNjNDOC+AnIl3mUGq2AT0Jc79mMcKkhARmM0k8fvyZDCH
	WWAak8TB7QuBHA4OTgFHibVHNUAahAW8JXb8vgO2jkVAVeJe2zw2EJtXwFLi/677zBC2oMTJ
	mU/AapgFtCWWLXzNDHGSgsTPp8tYQWwRASeJlpNXoGrEJV4ePQL2nITAHQ6Jvp99jCB7JQRc
	JP5uj4LoFZZ4dXwLO4QtJfH53V42iBIfiaW7PSDCJRIbepayQNj2EgeuzGEBKWEW0JRYv0sf
	YhOfRO/vJ0wQnbwSHW1CENVqEt+fn4E6UkbiYfNSJgjbQ+LBvE+sExgVZyH5axaSv2YhuX8W
	wrIFjCyrGCVTC4pz01OLTQuM81LL4dGdnJ+7iRGcpLW8dzA+evBB7xAjEwfjIUYJDmYlEV4e
	udR0Id6UxMqq1KL8+KLSnNTiQ4ymwMCeyCwlmpwPzBN5JfGGJpYGJmZmZiaWxmaGSuK8r1vn
	pggJpCeWpGanphakFsH0MXFwSjUwcfhMexjjevzq7/Rr0xd9E1ydtNzG9fXn+uTFRu1aLZbG
	wgK7U4o0a2yZZxycGfn17K5TJ1z8LhhmbS5594Hx+Fazqfyp29x4FvB5Ck1uFTk8f+Lky9nB
	c+Xqfpqds5ffUdG2IuJiamJpYHbBr6osV60n0d8YO7f/OFP5N/nsvdLZmT82SV3wYpk3Y9te
	r0tdDOuiHn863M1RViGnHuv4cgVT9cYtm/oX1/qdVQle7DTtr6ndibfsBho+q3REuiYrfpvp
	+LD0ZkTc+cf3/3779C/s3jNBR9EjkmtDor8oWKmosej1qlVOtH6wXuPd3lvPJM6un/6t4FTz
	5tAXzfsSvBwOe0blC81+KH02716PuxJLcUaioRZzUXEiAJYZ0iFbBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRmVeSWpSXmKPExsWy7bCSnK7j8Yx0gzvdBhZ/Jx1jt/j/6DWr
	xZqNdRZ7X29lt9jRtpDFYtPja6wWl3fNYbM4sLSdxaLlTwuLxYYZ/1gs/u/ZwW6x/NQOFotV
	n/4zOvB6rJm3htHj969JjB4rX8xm91iwqdRj06pONo871/aweWxeUu+x/do8Zo/Pm+QCOKO4
	bFJSczLLUov07RK4MmY/esdecJ+v4sPWxAbGeTxdjJwcEgImEv8X3WbqYuTiEBLYzSixb/tU
	FoiEjMTk1StYIWxhiZX/nrNDFD1jlFj7ayUzSIJNQF/i3I95rCAJEYGFTBJvTswHc5gFZjFJ
	fN+ylhWi5TijxKxZD9i6GDk4OAUcJdYe1QDpFhbwltjx+w7YOhYBVYl7bfPYQGxeAUuJ/7vu
	M0PYghInZz4Bq2EW0JZ4evMpnL1s4WtmiPMUJH4+XQZ2qoiAk0TLyStQNeISL48eYZ/AKDwL
	yahZSEbNQjJqFpKWBYwsqxglUwuKc9Nziw0LjPJSy/WKE3OLS/PS9ZLzczcxguNVS2sH455V
	H/QOMTJxMB5ilOBgVhLh5ZFLTRfiTUmsrEotyo8vKs1JLT7EKM3BoiTO++11b4qQQHpiSWp2
	ampBahFMlomDU6qB6dhRPufSf4U6Oj4H+VZd0to6b9eFItlJr6Q++/ZO+ehvsu6SeKbW3+bD
	Gb12v7eErl1nXHm0qnm2MuOSO4tX+oV9Evme0PNil6owQyJHvmH0H/6bLEprL5Ytzd6Wrsux
	3mlfyYViRoV/is8Plzw9ZlstxR739t/ZR/o9R1ZkBuw+41CorrRCI931ernvkveBt3xLLcIv
	P1OPSJ6lF3/e8eI6zirXR2ECR35NvKC67Ou2xTOlFgfvO2/+QfSFw4ugct5ZWcXF8594s+he
	bpFeaP1rg7qWuH6B1r+V906fV9F/svI+13mPCRmrWCV9PVcyyMbe+KdcFtm8UUFQPc9Q8FiR
	eHxq972tSs9ZzFv1lFiKMxINtZiLihMBawSPxEYDAAA=
X-CMS-MailID: 20241223021321epcas5p4278f1753b6d8219259813a50effc9b5c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241217181203epcas5p31615da7f180dd769388c5c8e8afbb1ea
References: <20241217-syscon-fixes-v2-0-4f56d750541d@kernel.org>
	<CGME20241217181203epcas5p31615da7f180dd769388c5c8e8afbb1ea@epcas5p3.samsung.com>
	<20241217-syscon-fixes-v2-2-4f56d750541d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_181331_631510_F1C68015 
X-CRM114-Status: GOOD (  17.25  )
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



> -----Original Message-----
> From: Rob Herring (Arm) <robh=40kernel.org>
> Sent: Tuesday, December 17, 2024 11:42 PM
> To: Lee Jones <lee=40kernel.org>; Arnd Bergmann <arnd=40arndb.de>; Pankaj
> Dubey <pankaj.dubey=40samsung.com>; Heiko Stuebner <heiko=40sntech.de>;
> Liviu Dudau <liviu.dudau=40arm.com>; Sudeep Holla <sudeep.holla=40arm.com=
>;
> Lorenzo Pieralisi <lpieralisi=40kernel.org>
> Cc: Peter Griffin <peter.griffin=40linaro.org>; Will McVicker
> <willmcvicker=40google.com>; John Madieu <john.madieu.xa=40bp.renesas.com=
>;
> Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>; linux-
> kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org
> Subject: =5BPATCH v2 2/3=5D mfd: syscon: Remove the platform driver suppo=
rt
>=20
> The platform driver is dead code. It is not used by DT platforms since co=
mmit
> bdb0066df96e (=22mfd: syscon: Decouple syscon interface from platform dev=
ices=22)
> which said:
>=20
>     For non-DT based platforms, this patch keeps syscon platform driver
>     structure so that syscon can be probed and such non-DT based drivers
>     can use syscon_regmap_lookup_by_pdev API and access regmap handles.
>     Once all users of =22syscon_regmap_lookup_by_pdev=22 migrated to DT b=
ased,
>     we can completely remove platform driver of syscon, and keep only hel=
per
>     functions to get regmap handles.
>=20
> The last user of syscon_regmap_lookup_by_pdevname() was removed in 2018.
> syscon_regmap_lookup_by_pdevname() was then removed in 2019, but that
> commit failed to remove the rest of the platform driver.
>=20
> Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
> Signed-off-by: Rob Herring (Arm) <robh=40kernel.org>
> ---

Reviewed-by: Pankaj Dubey <pankaj.dubey=40samsung.com>

Tested on arm64: Tesla FSD

Tested-by: Pankaj Dubey <pankaj.dubey=40samsung.com>

Thanks,
Pankaj Dubey


