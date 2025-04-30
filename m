Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD8DC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 10:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UyRogJQCKF4dzNdKeUnXZgi87K+PLm5TUetHnPxcySQ=; b=vBUqHuIkCNqRI1vgE1/2tUD9se
	3Ca8ajNBGPv6rLEsV1kBuBLY6gKrnUhhKWXtXQVXAbx1pMSboWnyA3Z4m8HDWzI42Dtq/dzP6ovlY
	WuV0mBgBvgkr6GHa8kQvVYlyH+qxCmtjTttVN/TAsuJlm4iaAG4Sj5P7KzO6WfivRbko2XSs7Q0T2
	7eNqHIceZFzgZathJajuQpk1bEnyKuMUW266WE2P75CA/4xQGbKr0Kk4HdF592tQjwVu8k/y2qFBz
	WP+1LWX5eS4y8L66EWuP+XviiKHEbdnG+ca3fPKgb9ckz7GskphYG4py/jGDkdjOd/YWt6jI04A5A
	/ZG7Ub9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA50v-0000000Cau8-29w3;
	Wed, 30 Apr 2025 10:50:05 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA4dI-0000000CWHU-1m4e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 10:25:42 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250430102531epoutp042a5fae3f3a8d3936b2061e5d127bfbfc~7EbDZpu6C1429614296epoutp04S
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 10:25:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250430102531epoutp042a5fae3f3a8d3936b2061e5d127bfbfc~7EbDZpu6C1429614296epoutp04S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1746008731;
	bh=UyRogJQCKF4dzNdKeUnXZgi87K+PLm5TUetHnPxcySQ=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=ikkomal01DyzcBrUu3dssZgfy3oW6rzhxSQtcj84EOHtyo/KD7d0537vyv5/493f2
	 DnRNWoMeLfOCxIXyMBTDjCHOKpQr9TpgBr32Znxo3iK5zjN/6SFGiEmbrSVBe3UjPV
	 2tfRVqKrGkjcofc4ZN96ZVjCmJBcGDotR2mxqVxw=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250430102531epcas5p159f5edae7b9d6649b91ba016fd8580cf~7EbDDY--c1745817458epcas5p1B;
	Wed, 30 Apr 2025 10:25:31 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.180]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4ZnYGy28rYz6B9m9; Wed, 30 Apr
	2025 10:25:30 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250430092538epcas5p1b6aee888ecfa27c04e01ca16a0a93d19~7DmwiV8Qt0647906479epcas5p1S;
	Wed, 30 Apr 2025 09:25:38 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250430092538epsmtrp1e08dff0c1eac600a72115669d75dc488~7Dmwhcsq62304923049epsmtrp1Z;
	Wed, 30 Apr 2025 09:25:38 +0000 (GMT)
X-AuditID: b6c32a2a-d57fe70000002265-56-6811ec9127c4
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	C5.75.08805.19CE1186; Wed, 30 Apr 2025 18:25:37 +0900 (KST)
Received: from INBRO002053 (unknown [107.122.2.234]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250430092535epsmtip23755164dfc0ad1aef32e04bca5476327~7DmueEaSD2671426714epsmtip25;
	Wed, 30 Apr 2025 09:25:35 +0000 (GMT)
From: "Yashwant Varur" <yashwant.v@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Cc: <cs0617.lee@samsung.com>, <g.naidu@samsung.com>,
	<niyas.ahmed@samsung.com>
In-Reply-To: <b00514f2-55ca-49f0-aefb-ec1e784545d6@kernel.org>
Subject: RE: [PATCH] arm64: dts: exynos: Added the ethernet pin
 configuration
Date: Wed, 30 Apr 2025 14:55:34 +0530
Message-ID: <0f6e01dbb9b1$d52519d0$7f6f4d70$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQI+tP5AvR0g22A5T67WLyfPVk3CYgKkYErqAxsAxq0DRO6qzAIlGw2ospyhojA=
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKIsWRmVeSWpSXmKPExsWy7bCSvO7EN4IZBt1vrCwezNvGZrFm7zkm
	i1XveC3mHznHarFl5mVmi5ez7rFZnD+/gd1i0+NrrBaXd81hs5hxfh+TxZMpj1gt/u/Zwe7A
	47FpVSebx+Yl9R59W1YxenzeJBfAEsVlk5Kak1mWWqRvl8CV8bWpm7lgHX/F1EuzGRsYd/J0
	MXJySAiYSFz9v4eli5GLQ0hgN6PEnkdL2LsYOYASUhINb8IhaoQlVv57zg5R85xRYvOuY6wg
	CTYBfYnnm68xgSREBBYzSXxpOsgG0swsECTxZXcgRMNcJon9xzewgTRwCthJfOp+CNYsLOAr
	sbvjDDuIzSKgKjH71HFmEJtXwFJi9+p+KFtQ4uTMJywgNrOAtsTTm0/h7GULXzNDXKcg8fPp
	MrCZIgJ+Epf+zmeFqBGXeHn0CPsERuFZSEbNQjJqFpJRs5C0LGBkWcUomVpQnJueW2xYYJSX
	Wq5XnJhbXJqXrpecn7uJERxzWlo7GPes+qB3iJGJg/EQowQHs5II76RbghlCvCmJlVWpRfnx
	RaU5qcWHGKU5WJTEeb+97k0REkhPLEnNTk0tSC2CyTJxcEo1MHHvsVtVs3H+JFVlKfE9cezl
	UiffhOy5+PfKqTmeuuyWB/N4yrhT3tzL4i3PPdm6L8v/q+7+a2wfTW2q9kpvYzz+qDjCSiJr
	elDSXW3mjdyW278/vbVsa627kQXDgifWcr8fxu9YOmP+Y9O3ko/uRzj4HJ8gt0lQPsT80AWT
	vo9bHHae3uS0pjC3/I+Z5ypOeRNtrX7O4wZP+aX0P9+/x1JRVvCMr1VV9FC09nXdbclfu9NO
	OEenB2qtidm3XfBJ4LlusxNMjsIrXPo1shWyNcJucUs1Td2ztf7azZczbpz75fPfd9fdv60C
	hYvY/kdm/5eUFOGVfpIuKCn07UmgQeCz0wudVnw84aQ27x+LvBJLcUaioRZzUXEiAE0w33oo
	AwAA
X-CMS-MailID: 20250430092538epcas5p1b6aee888ecfa27c04e01ca16a0a93d19
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250423060042epcas5p2c04be779e21089f33b8a9a7785bb151a
References: <CGME20250423060042epcas5p2c04be779e21089f33b8a9a7785bb151a@epcas5p2.samsung.com>
	<20250423060034.973-1-yashwant.v@samsung.com>
	<73a5d0a6-ceb0-4c47-9992-260828f074d0@kernel.org>
	<0ed501dbb8e9$45aa96e0$d0ffc4a0$@samsung.com>
	<b00514f2-55ca-49f0-aefb-ec1e784545d6@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_032541_087315_41A3CE83 
X-CRM114-Status: GOOD (  20.66  )
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

Hi Krzysztof

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: Tuesday, April 29, 2025 6:37 PM
> To: Yashwant Varur <yashwant.v=40samsung.com>; robh=40kernel.org;
> krzk+dt=40kernel.org; conor+dt=40kernel.org; alim.akhtar=40samsung.com;
> devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; lin=
ux-
> samsung-soc=40vger.kernel.org; linux-kernel=40vger.kernel.org
> Cc: cs0617.lee=40samsung.com; g.naidu=40samsung.com;
> niyas.ahmed=40samsung.com
> Subject: Re: =5BPATCH=5D arm64: dts: exynos: Added the ethernet pin confi=
guration
>=20
> On 29/04/2025 11:29, Yashwant Varur wrote:
> >
> > Please follow DTS coding style carefully. This applies to all commits y=
ou try to
> send from your downstream/vendor code.
>=20
>=20
> hm?
>=20
Got the issue, coding style says
Node and property names can use only the following characters:
Lowercase characters: =5Ba-z=5D
Digits: =5B0-9=5D
Dash: -
I was using underscore for node name.
> >>
> > Sure, thanks
> >
> > What is more important, I don't really understand why you are doing
> > this
> > - there is no user of these entries - and commit msg does not help here=
.
> >>
> > Understood, in v2 will add the Ethernet node as well.
>=20
> I don't understand what is your reply here and what is quote. Use standar=
d email
> style, not some mySingle or Outlook output. I suggest reading typical gui=
delines
> how to use email based workflows (kernel also has one).
>=20

Looks like mailer was not configured properly, hope this time it is fine.
I am working on upstreaming Ethernet driver for exynosauto (which has a var=
iant of STMMAC controller)
What I wanted to reply previously was, will add pin control, along with Eth=
ernet node(which will consume the pincontrol) and
I realize that first dt-binding should go for this IP.
My plan is to send Ethernet driver along with Ethernet dtsi node as well.

>=20
> Best regards,
> Krzysztof


