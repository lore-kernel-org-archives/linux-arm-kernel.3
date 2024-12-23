Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C5DE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 02:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c4mdwcxcN7uUzUqzZPO+90GO9wIv3nNZkWJW+auXCrM=; b=KVEmWM160RY9LhOB2080VFJli6
	LRzMEKTswuiJz4nWZA6D53LmIrdB0f+V7jf9hEBQ4zZx9qFMYYMw3NhC3xgVV11+N2uwspMlRTo7e
	CwwE+c51OsU7UcJIKSlH2xaSKSIr3Wfqn/nAlFhPd7zrZq7pwV1ovpIoMQ4mrWLegFUHuYznR5OFB
	5/cXgutGBif+hSexm3EoB/pr7JAt3+L7hbggm86NW3ZnB5EsQ7trMp1l/D3WvCcAi+qkRowPRqwCa
	W7Hw46aJRtl4BZuYVjmyHI8JnQbNFmAAsnL32vQmmDHfVVxDNswEGUuR3borBe3VibeOvoAfHeikD
	6Sa7w/0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPXzC-000000098M4-0B3m;
	Mon, 23 Dec 2024 02:15:58 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPXxs-00000009896-0QPM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 02:14:37 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20241223021431epoutp0354b03f9d6d3e41dd1afdf3c89aad3f5e~TrJzvQaah0980509805epoutp03a
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 02:14:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20241223021431epoutp0354b03f9d6d3e41dd1afdf3c89aad3f5e~TrJzvQaah0980509805epoutp03a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1734920071;
	bh=c4mdwcxcN7uUzUqzZPO+90GO9wIv3nNZkWJW+auXCrM=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=d/LlbNsgkOsKpclUb9gU6E0umMpJQwAcYh3FVe0XmtPt8IqYat8GloFA0UHKE7GtN
	 20/fbHF+dSHkFfOmbLjDnsvCubVtpKzD1uSnz5hCpdWRzUTx0YBeFpv6JF6z9x5Sbm
	 WQgNNqDvCTE09WW1HxXKlIBq/WRWoPCSeOfFAkic=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20241223021430epcas5p4f01f78be3f9b7f45e6fc4fc18d3e6a2a~TrJzQ6CBV1821118211epcas5p4B;
	Mon, 23 Dec 2024 02:14:30 +0000 (GMT)
Received: from epsmgec5p1new.samsung.com (unknown [182.195.38.175]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4YGhRT1TcMz4x9Ps; Mon, 23 Dec
	2024 02:14:29 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmgec5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	6A.A3.19710.587C8676; Mon, 23 Dec 2024 11:14:29 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20241223021428epcas5p17e96085071f7689ec40c6652851bad14~TrJw5jPen2138121381epcas5p1q;
	Mon, 23 Dec 2024 02:14:28 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241223021428epsmtrp20e71dbb5cf8709a499e8096234cc234e~TrJw4uubj2534425344epsmtrp2a;
	Mon, 23 Dec 2024 02:14:28 +0000 (GMT)
X-AuditID: b6c32a44-363dc70000004cfe-20-6768c785960c
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	E4.03.18729.487C8676; Mon, 23 Dec 2024 11:14:28 +0900 (KST)
Received: from INBRO001561 (unknown [107.122.12.6]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20241223021426epsmtip135406ff4f99231bc31d063db717f2f2a~TrJvE8idA0113001130epsmtip1U;
	Mon, 23 Dec 2024 02:14:26 +0000 (GMT)
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
Date: Mon, 23 Dec 2024 07:44:25 +0530
Message-ID: <000201db54e0$64f8dc40$2eea94c0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQEZrw4XBTjqISieS499QzyO27eqOgIlhVXbAn6f76O0UUFZUA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNJsWRmVeSWpSXmKPExsWy7bCmpm7r8Yx0g48vOSz+TjrGbvH/0WtW
	izUb6yz2vt7KbrGjbSGLxabH11gtLu+aw2ZxYGk7i0XLnxYWiw0z/rFY/N+zg91i+akdLBar
	Pv1ndOD1WDNvDaPH71+TGD1WvpjN7rFgU6nHplWdbB53ru1h89i8pN5j+7V5zB6fN8kFcEZl
	22SkJqakFimk5iXnp2TmpdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYAXa2kUJaY
	UwoUCkgsLlbSt7Mpyi8tSVXIyC8usVVKLUjJKTAp0CtOzC0uzUvXy0stsTI0MDAyBSpMyM6Y
	e3E/e8Fn3oonbbPZGhjfcHcxcnJICJhIrF3zlKWLkYtDSGA3o8SM/euYIJxPjBKfn65nhXC+
	MUr0PpnDDNPy++B6NojEXkaJF7dfskM4Lxgl1hzrAatiE9CXOPdjHli7iMBsJonflyeDOcwC
	05gkDm5fyApSxSngKPHx1lomEFtYwF/i6KOzYN0sAqoSW5suMYLYvAKWEo/enmGHsAUlTs58
	wgJiMwtoSyxb+BrqJgWJn0+Xgc0UEXCS6H3ZzAhRIy7x8ugRsPMkBO5wSHS2bmWDaHCRuPLw
	PhOELSzx6vgWdghbSuLzu71ANRxAto/E0t0eEOESiQ09S1kgbHuJA1fmsICUMAtoSqzfpQ+x
	ik+i9/cTJohOXomONiGIajWJ78/PQF0pI/GweSnUUg+J//v2s09gVJyF5LFZSB6bheSBWQjL
	FjCyrGKUTC0ozk1PTTYtMMxLLYfHeHJ+7iZGcKrWctnBeGP+P71DjEwcjIcYJTiYlUR4eeRS
	04V4UxIrq1KL8uOLSnNSiw8xmgJDeyKzlGhyPjBb5JXEG5pYGpiYmZmZWBqbGSqJ875unZsi
	JJCeWJKanZpakFoE08fEwSnVwPRgdtu/nvn/mx2z7I0ufd7YsXqai23Atl3h6mVfunLE71Xu
	+9B046+Ld2eslk/rgYjjTx1t58+xWLC8/BWn1lmxXWzyH/bHbZQ657dMe7l77yd/2ZBE8beJ
	U5pF50qybVk+V2OlQ8bHhR2PHLdq1XxuM32u4Dpxm/KUVcGl4ouKPK/1L5u7tuHtb5ZuAxZZ
	Ad/32cHnrR0/cNvsvLVm7rHDWTuKAh1i7v8W7v33btHnz3rNxyxfybLwr3/2anuqVdifqnVv
	njzgmarPybz4mwXf9Z3T9lW7Pp3Xc/KVzJ7T1uYeAZXqRzxMAu74vrzlt3+l9GbFdXcczf60
	uk44Jvllp+wiTZE4vXUGIsHnv2YosRRnJBpqMRcVJwIApq9oF14EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKIsWRmVeSWpSXmKPExsWy7bCSnG7L8Yx0g+lvRC3+TjrGbvH/0WtW
	izUb6yz2vt7KbrGjbSGLxabH11gtLu+aw2ZxYGk7i0XLnxYWiw0z/rFY/N+zg91i+akdLBar
	Pv1ndOD1WDNvDaPH71+TGD1WvpjN7rFgU6nHplWdbB53ru1h89i8pN5j+7V5zB6fN8kFcEZx
	2aSk5mSWpRbp2yVwZezpW8BScIq34saJDpYGxoPcXYycHBICJhK/D65n62Lk4hAS2M0oMX3q
	OlaIhIzE5NUroGxhiZX/nrNDFD1jlLh38xZYgk1AX+Lcj3msIAkRgYVMEm9OzAdzmAVmMUl8
	37KWFaLlOKPExN+7GUFaOAUcJT7eWssEYgsL+ErcezyBBcRmEVCV2Np0CayGV8BS4tHbM+wQ
	tqDEyZlPwGqYBbQlnt58CmcvW/iaGeI+BYmfT5eBnSQi4CTR+7KZEaJGXOLl0SPsExiFZyEZ
	NQvJqFlIRs1C0rKAkWUVo2RqQXFuem6xYYFhXmq5XnFibnFpXrpecn7uJkZwzGpp7mDcvuqD
	3iFGJg7GQ4wSHMxKIrw8cqnpQrwpiZVVqUX58UWlOanFhxilOViUxHnFX/SmCAmkJ5akZqem
	FqQWwWSZODilGpgWn4pN5XmTfsj8oCGz8Yf7/+d9vHqoYr21WfS/d5rd6q3f7T5IrXDdsGDW
	IqPn7udYo1n3+x2PmVE6P2Jpv+LCvfNaxC4EXDtwcp7+qy3HOP4y7/r6QCiMJf8uU8QeFr9Q
	kb/7uZW9WD38jvktE1L+0eCTxfA982zk7/UZjH92rC6KtZ2pzL4uvzb0TtHDQ44ZkSuErU/n
	H36mx/jnVr297tzF3b/X3FRYvc/i4uYu8UUvqiZEbfzGemvCpwfFHFMfcPrrfXm7TTXpbs1t
	nRgXSxcm80/HxWfY8pfU1Rx+5Zlp7cc5u0PLiCN1Rbf9OZ3nm2/sypRfsWu7cjHr7o4H1Rsz
	hZnifk1y8y6zMT2nxFKckWioxVxUnAgAts/XJ0gDAAA=
X-CMS-MailID: 20241223021428epcas5p17e96085071f7689ec40c6652851bad14
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
X-CRM114-CacheID: sfid-20241222_181436_474107_B3361942 
X-CRM114-Status: GOOD (  15.57  )
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

Reviewed-by: Pankaj Dubey <pankaj.dubey=40samsung.com>


