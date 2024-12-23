Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A42E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 02:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AUTC71RmbQUz5XOQf0rxtfhjofBR1Y8T7JtGTYAqVMg=; b=Q3yEMdtox3zYMpoBguz7CrAL6x
	oKXMlDOYKEVHtYJA8BEdyEXEnWx6UkQZ2wTsnrpMhk4W1SVYfWHba3W8oGbuFgq2Nca2/YmUEZPFD
	XIR4l33TRhin+jgKmxAQ4QHqAiwkdUohYWWFfV0gcyre9lNvwj2fu1bSLDKSIq420gFFzIF7W5kcc
	/UFL4uMZtsv87NXS/LQ0WtvcChEjXD5JGxqRSz/RtfulipaPzNKNU5+TYs/FesSiebHEt/MhwRU7e
	iqU5k4dOum43ab13rKUaFjJEqKc9WDZ+0it/IoC6Q3dTNIaC0+IsP8eC9HDUjb0IOzSzEluj8lRlB
	qM9QHtIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPXvw-000000097wi-2F35;
	Mon, 23 Dec 2024 02:12:36 +0000
Received: from [203.254.224.33] (helo=mailout3.samsung.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPXuj-000000097tz-3aee
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 02:11:24 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20241223021114epoutp034b8e8fd74bdecb34ed7505395d20b08e~TrG792rLN0995909959epoutp03P
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 02:11:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20241223021114epoutp034b8e8fd74bdecb34ed7505395d20b08e~TrG792rLN0995909959epoutp03P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1734919874;
	bh=AUTC71RmbQUz5XOQf0rxtfhjofBR1Y8T7JtGTYAqVMg=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=BxbwTNTuqCfQAlQF/Ffr7puHLdg4CB06eXIoqm6cPygVfQ2I0E3s1DGspRePK11jk
	 enWptixNt4wNCmtne8kdUOJFb9t8xYStusL81Q15vq0EHA/96sonp9Nmc04Bo2IfF6
	 V6S+zYsppLROzzIDlYJajbt6+bTYUYoW8whJDE5o=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20241223021113epcas5p430ceb5f3bf2e9ac8ab5b0d655f3209e1~TrG7d9X3N3115731157epcas5p4P;
	Mon, 23 Dec 2024 02:11:13 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.176]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4YGhMg6M60z4x9Q7; Mon, 23 Dec
	2024 02:11:11 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
	epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
	68.81.19956.FB6C8676; Mon, 23 Dec 2024 11:11:11 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20241223021111epcas5p148011ea277570c5090bada9d06a24575~TrG5K0RcW0946509465epcas5p1M;
	Mon, 23 Dec 2024 02:11:11 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241223021111epsmtrp15bb1429cb6cea8730ddb151eada5c801~TrG5J1lUw1551215512epsmtrp1P;
	Mon, 23 Dec 2024 02:11:11 +0000 (GMT)
X-AuditID: b6c32a4b-fe9f470000004df4-71-6768c6bf9c1f
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	00.B0.33707.EB6C8676; Mon, 23 Dec 2024 11:11:11 +0900 (KST)
Received: from INBRO001561 (unknown [107.122.12.6]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20241223021109epsmtip2288959e1d86621ed67ae589f52c7aed4~TrG3VuOQC1881118811epsmtip25;
	Mon, 23 Dec 2024 02:11:09 +0000 (GMT)
From: "Pankaj Dubey" <pankaj.dubey@samsung.com>
To: "'Rob Herring \(Arm\)'" <robh@kernel.org>, "'Lee Jones'"
	<lee@kernel.org>, "'Arnd Bergmann'" <arnd@arndb.de>, "'Heiko Stuebner'"
	<heiko@sntech.de>, "'Liviu Dudau'" <liviu.dudau@arm.com>, "'Sudeep Holla'"
	<sudeep.holla@arm.com>, "'Lorenzo	Pieralisi'" <lpieralisi@kernel.org>
Cc: "'Peter Griffin'" <peter.griffin@linaro.org>, "'Will McVicker'"
	<willmcvicker@google.com>, "'John Madieu'" <john.madieu.xa@bp.renesas.com>,
	"'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
In-Reply-To: <20241217-syscon-fixes-v2-1-4f56d750541d@kernel.org>
Subject: RE: [PATCH v2 1/3] mfd: syscon: Fix race in
 device_node_get_regmap()
Date: Mon, 23 Dec 2024 07:41:07 +0530
Message-ID: <000001db54df$ef602f60$ce208e20$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQEZrw4XBTjqISieS499QzyO27eqOgIlhVXbAn6f76O0UT+aQA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBJsWRmVeSWpSXmKPExsWy7bCmhu7+YxnpBrOe6Fr8nXSM3eL/o9es
	Fms21lnsfb2V3WJH20IWi02Pr7FaXN41h83iwNJ2FouWPy0sFhtm/GOx+L9nB7vF8lM7WCxW
	ffrP6MDrsWbeGkaP378mMXqsfDGb3WPBplKPTas62TzuXNvD5rF5Sb3H9mvzmD0+b5IL4IzK
	tslITUxJLVJIzUvOT8nMS7dV8g6Od443NTMw1DW0tDBXUshLzE21VXLxCdB1y8wBulpJoSwx
	pxQoFJBYXKykb2dTlF9akqqQkV9cYquUWpCSU2BSoFecmFtcmpeul5daYmVoYGBkClSYkJ3R
	unIjc8Fqvorbp/4wNzBO5eli5OSQEDCRuPnmJ2MXIxeHkMBuRomPXWuhnE+MElN+fmaCc9re
	LmPuYuQAa5n+pQYivpNR4vTjg6wgo4QEXjBKHNlTAGKzCehLnPsxjxWkSERgNpPE78uTwRxm
	gWlMEge3LwTr4BRwlPh4ay0TiC0s4C9x9NFZsA0sAqoSZ05UgIR5BSwlXv3fyA5hC0qcnPmE
	BcRmFtCWWLbwNTPEDwoSP58uAxspIuAkce5xAzNEjbjEy6NH2EH2Sgjc4JDYt7yPDaLBReLB
	y+nsELawxKvjW6BsKYmX/W3sEF/6SCzd7QERLpHY0LOUBcK2lzhwZQ4LSAmzgKbE+l36EKv4
	JHp/P2GC6OSV6GgTgqhWk/j+/AzUlTISD5uXMkHYHhL/9+1nn8CoOAvJY7OQPDYLyQOzEJYt
	YGRZxSiZWlCcm55abFpgnJdaDo/u5PzcTYzgJK3lvYPx0YMPeocYmTgYDzFKcDArifDyyKWm
	C/GmJFZWpRblxxeV5qQWH2I0BQb2RGYp0eR8YJ7IK4k3NLE0MDEzMzOxNDYzVBLnfd06N0VI
	ID2xJDU7NbUgtQimj4mDU6qBaZ9oT5I/w1LBq/M7Vkda5DWkuMQ+W+Z5xvzuu0vf7iiKlgXO
	t0sPS3dbMfMJd0bL87W7nO58Z1oWbWh6V/a4xP5jpyyqBHcyr+m7c6Q7Nv6aQcSRxXe2nj5x
	3CvkfR6XyeEtZ0+mdMft22KhxRdwau6Gx0XZISn8N/ftWVHpp9zy801cuZMif2hBblpd4bNN
	kYURMieUFHL1Yy2Zf96s02RoMI+Z3dH7dcMM02qOkPWMAbwzFZYIL3w6dc083WRp6bSpz1+Z
	r7s08fF8IU3lD0bpR5yy77wV0dafs1Kz2FdGMuDNvvs6ri9vpHCoBK/ge3Tj+AZlu79fQ7N8
	NA9nNa1f+PB3/batJ0oyFglHK7EUZyQaajEXFScCAJtZ1W5bBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRmVeSWpSXmKPExsWy7bCSvO7+YxnpBnu2MVv8nXSM3eL/o9es
	Fms21lnsfb2V3WJH20IWi02Pr7FaXN41h83iwNJ2FouWPy0sFhtm/GOx+L9nB7vF8lM7WCxW
	ffrP6MDrsWbeGkaP378mMXqsfDGb3WPBplKPTas62TzuXNvD5rF5Sb3H9mvzmD0+b5IL4Izi
	sklJzcksSy3St0vgypj25CF7QRNfxcMHO5gbGF9xdzFycEgImEhM/1LTxcjFISSwnVGid8cS
	5i5GTqC4jMTk1StYIWxhiZX/nrNDFD1jlFh34QkLSIJNQF/i3I95rCAJEYGFTBJvTswHc5gF
	ZjFJfN+ylhWi5TijxMTfuxlBWjgFHCU+3lrLBGILC/hK3Hs8gQXkDhYBVYkzJypAwrwClhKv
	/m9kh7AFJU7OhNjGLKAt8fTmUzh72cLXUKcqSPx8ugzsVBEBJ4lzjxuYIWrEJV4ePcI+gVF4
	FpJRs5CMmoVk1CwkLQsYWVYxiqYWFOem5yYXGOoVJ+YWl+al6yXn525iBMepVtAOxmXr/+od
	YmTiYDzEKMHBrCTCyyOXmi7Em5JYWZValB9fVJqTWnyIUZqDRUmcVzmnM0VIID2xJDU7NbUg
	tQgmy8TBKdXAtNLt2accU6/Yu6G+v2bZznRkf//wiYejYbzJy/WSTkb3FsTnnhTW6bF+vuPP
	g7LPOhrdM1+rfDrf+ju0yvm9LKPKYq36uR3bLV9tLJW4x3h1YtBX56P6hfvfMJ6qVV2SyP28
	56fpY/4m39BKFb3O/1x7nijHim6zYjwbc1KxbZtOSuydwLveGTsdgoS+eR9udPHZ+0hFMbnv
	yO1Lh4ydK5VyHQVybk/8LJfhyvzSZZ94hBTf3uCH6ZvSjk7bpW9btDXmw4F1EfcimnhPmGdv
	f1Ten8Ykm+l/f/rNs7uUv8Q9fDWfpXBnzozNqenXJL0mP7WVORDMJ9gk0lGZwaM1e45qYtwq
	lnVi7n8OmxQqsRRnJBpqMRcVJwIAwQiJpkIDAAA=
X-CMS-MailID: 20241223021111epcas5p148011ea277570c5090bada9d06a24575
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241217181202epcas5p3dfeeea922cd1a71840ac126ddf20c644
References: <20241217-syscon-fixes-v2-0-4f56d750541d@kernel.org>
	<CGME20241217181202epcas5p3dfeeea922cd1a71840ac126ddf20c644@epcas5p3.samsung.com>
	<20241217-syscon-fixes-v2-1-4f56d750541d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_181122_634904_35AF711A 
X-CRM114-Status: GOOD (  15.67  )
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
> Subject: =5BPATCH v2 1/3=5D mfd: syscon: Fix race in device_node_get_regm=
ap()
>=20
> It is possible for multiple, simultaneous callers calling
> device_node_get_regmap() with the same node to fail to find an entry in t=
he
> syscon_list. There is a period of time while the first caller is calling
> of_syscon_register() that subsequent callers also fail to find an entry i=
n the
> syscon_list and then call of_syscon_register() a second time.
>=20
> Fix this by keeping the lock held until after of_syscon_register() comple=
tes and
> adds the node to syscon_list. Convert the spinlock to a mutex as many of =
the
> functions called in of_syscon_register() such as
> kzalloc() and of_clk_get() may sleep.
>=20
> Fixes: bdb0066df96e (=22mfd: syscon: Decouple syscon interface from platf=
orm
> devices=22)
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
> Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
> Signed-off-by: Rob Herring (Arm) <robh=40kernel.org>
> ---

Tested on arm64: Tesla FSD=20

Tested-by: Pankaj Dubey <pankaj.dubey=40samsung.com>

Thanks.
Pankaj Dubey


