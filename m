Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BC7C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 16:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2bByUiTilCfcRBjAZx/mUHa2iGdQsonj502SFhnDFDo=; b=Q/tjC6GKxRIFKdYgtZNH8vhk/f
	fPJ879sYvNjveXHTAwcCtr/mJZ7x/wS5MdTAqJEF+BuFEdLmFkT4WqnNLWiR2j529F2Txa9qEQxTd
	eVuMvXE/YF0B3wbQqKwwa1jmFFEYVxhgPxBAsyinZm0Tge9S+MOwXmlHklJ9KT+fups7jrI4Kocfi
	XYDpcU73+NH9J/JuFY9U2ezysNFRteac9XNcf8NTxmRjcq4JDm+8/XzG1D6Yst88D+wAANfzOAdBN
	xKTgKg75d+goYoQUO8d90QFfTlGYqj00hT2BJGDrLIux02CL3cjRDXoTk0AZUNs76kgTcNzphLSb1
	3XQicD/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfi7N-00000003wwl-044p;
	Wed, 05 Feb 2025 16:19:13 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhvl-00000003uOM-1TyD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 16:07:15 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250205160709epoutp02a7a2544dae905a0f70c8e604060f34f7~hW5WgeYV-2194321943epoutp02a
	for <linux-arm-kernel@lists.infradead.org>; Wed,  5 Feb 2025 16:07:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250205160709epoutp02a7a2544dae905a0f70c8e604060f34f7~hW5WgeYV-2194321943epoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1738771629;
	bh=2bByUiTilCfcRBjAZx/mUHa2iGdQsonj502SFhnDFDo=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=oIW0HSbc9DEUMzFLOvTKkNWPvToLtHnIiexm/sePEpAzu8pRv3KsPZQ6lpiCfCe6b
	 327ACFLhZ8PHqoIZFFkcKQaY4OLEe85Aldb3Llqowua3xT79BlXy58aN+LIllORVWo
	 2M44/LV1sAxIYtwY8C/ROD8/fFpS26xJQriQi8sk=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20250205160708epcas5p295d47a52d8ad411be061ce90c0654e96~hW5VUTtmm1179611796epcas5p2s;
	Wed,  5 Feb 2025 16:07:08 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.178]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4Yp4qs5Phcz4x9Pp; Wed,  5 Feb
	2025 16:07:05 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
	epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	EC.A3.19933.9AC83A76; Thu,  6 Feb 2025 01:07:05 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250205160705epcas5p4c645ccf4051eb12a252d7d9d4c3c300b~hW5SwVNy60758907589epcas5p4R;
	Wed,  5 Feb 2025 16:07:05 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250205160705epsmtrp2113197f500872c205a384b66f5d74b61~hW5SveyX_0198701987epsmtrp2W;
	Wed,  5 Feb 2025 16:07:05 +0000 (GMT)
X-AuditID: b6c32a4a-c1fda70000004ddd-20-67a38ca90efb
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	85.89.18949.9AC83A76; Thu,  6 Feb 2025 01:07:05 +0900 (KST)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250205160703epsmtip2aa5667ef559938479af04ee473001a39~hW5RQ__Nz0781307813epsmtip2d;
	Wed,  5 Feb 2025 16:07:03 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Sudeep Holla'" <sudeep.holla@arm.com>
Cc: "'Devang Tailor'" <dev.tailor@samsung.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <faraz.ata@samsung.com>
In-Reply-To: <Z5zPpz6WAbPJX701@bogus>
Subject: RE: [PATCH v2] arm64: dts: add cpu cache information to
 ExynosAuto-v920
Date: Wed, 5 Feb 2025 21:37:02 +0530
Message-ID: <090c01db77e7$ffa892b0$fef9b810$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJnCMNmj1amGSmPwLixER7WDeLbQALDHLFMAzsAx8ICGgWRG7Hg+i6A
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJJsWRmVeSWpSXmKPExsWy7bCmuu7KnsXpBpdb1CzW7D3HZHFvxzJ2
	i/lHzrFaXLuxkN3i5ax7bBabHl9jtbi8aw6bxYzz+5gs/u/ZwW6x/NQOFgcujzXz1jB6bFrV
	yeaxeUm9R9+WVYwenzfJBbBGZdtkpCampBYppOYl56dk5qXbKnkHxzvHm5oZGOoaWlqYKynk
	Jeam2iq5+AToumXmAB2lpFCWmFMKFApILC5W0rezKcovLUlVyMgvLrFVSi1IySkwKdArTswt
	Ls1L18tLLbEyNDAwMgUqTMjOuNhZULCbu2LdoV2MDYwrObsYOTkkBEwk/r7cxN7FyMUhJLCb
	UWL6pDXMEM4nRokvt3cyQTjfGCW+nexkhWl5tXsFVNVeRom3rzeyQjgvGSXmzuhlAaliE9CV
	2LG4jQ3EFhHQlti8+xELSBGzwAwmid3LL4AVcQqoSkxs7WcHsYUFgiQWTD0CZrMIqEi87TzL
	CGLzClhKNG9+xAJhC0qcnPkEzGYWkJfY/nYOM8RJChI/ny5jhVjmJvFk82JWiBpxiZdHj4B9
	JyGwhUNiztG9UD+4SFxYtQbKFpZ4dXwLO4QtJfH53V42CLtaYv2GeSwQdgejROP2GgjbXmLn
	o5tAcQ6gBZoS63fpQ+zik+j9/YQJJCwhwCvR0SYEUa0q0fzuKtQUaYmJ3d1QWz0k3l+bxTiB
	UXEWks9mIflsFpIPZiEsW8DIsopRMrWgODc9tdi0wCgvtRwe4cn5uZsYwWlWy2sH48MHH/QO
	MTJxMB5ilOBgVhLhPb19QboQb0piZVVqUX58UWlOavEhRlNgcE9klhJNzgcm+rySeEMTSwMT
	MzMzE0tjM0Mlcd7mnS3pQgLpiSWp2ampBalFMH1MHJxSDUxblVVCP/CwBLebnpzyx7OE901I
	yM1UvQPzeKVPTvf5Kcv6/zRXRbXuzMrjHMzlXpHGs3/OXDlvX4DH95lBqifeS+hr8R/9uPLj
	vzovxW4ni2cfNt7JYjY0/SBmxBvEzZC+Oev+xtCyo1JLv66Tm7Hx0W0T/fUKE6U3Rr1lX9zc
	tv7l3rmuHO/P79nTrL49xseyfdFVoQ3FnCUtgodXrZ/hovIn86vmpofL2u/fNY3/7nXKf9X8
	E/u6BI3qts3/uXxq25Lw9zNtYxWf/Jn8s2jpHU/TBdb5hb98wlffsTjoo5J2UnrPkn6eE33O
	cQpG3qU2Xt8/9C/Vutp194WFoH/CCxfBRZ+v/42ZJF/KV1qjxFKckWioxVxUnAgAYb4TWjwE
	AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnkeLIzCtJLcpLzFFi42LZdlhJXndlz+J0g7stXBZr9p5jsri3Yxm7
	xfwj51gtrt1YyG7xctY9NotNj6+xWlzeNYfNYsb5fUwW//fsYLdYfmoHiwOXx5p5axg9Nq3q
	ZPPYvKTeo2/LKkaPz5vkAlijuGxSUnMyy1KL9O0SuDIudhYU7OauWHdoF2MD40rOLkZODgkB
	E4lXu1cwdzFycQgJ7GaUeLR8LhNEQlri+sYJ7BC2sMTKf8/ZIYqeM0o8O36LDSTBJqArsWNx
	G5gtIqAtsXn3IxaQImaBRUwSm5ZeZ4XouMYo8efRUxaQKk4BVYmJrf1Aozg4hAUCJA7skQYJ
	swioSLztPMsIYvMKWEo0b37EAmELSpyc+YQFpJxZQE+ibSNYCbOAvMT2t3OYIY5TkPj5dBkr
	xA1uEk82L2aFqBGXeHn0CPsERuFZSCbNQpg0C8mkWUg6FjCyrGKUTC0ozk3PLTYsMMpLLdcr
	TswtLs1L10vOz93ECI4zLa0djHtWfdA7xMjEwXiIUYKDWUmE9/T2BelCvCmJlVWpRfnxRaU5
	qcWHGKU5WJTEeb+97k0REkhPLEnNTk0tSC2CyTJxcEo1MPGGTY1b1Ty7r3jVxBqjsi0HeAJN
	YuNyzl+Nk+8R18ngvCqtzVIRvn9D1feXdzz4dh/avHqrVDXbnObMiXu/mHCkfBPe6327bcq9
	lDfe890efZ0TFiaccIZvn0LV8/+6wQ1nTx6e+kTQ8+syh0kuUkZc4ctqm42eLeSSydnPs0JZ
	pW7aYU3TuL1u684b/foX/ng9/4ptSx4di/f6Kl0tXV+X6zjtZfvrOT6Si6QPB+9fnHFDNT3S
	i6fwbWvj2Yi1D9vXuGh+DpKdlfp6g3H/lwbeIx/dSpm2Po38vpZZZVZ6HkvpGg7HPfVv9zRu
	WDnl0zTTZ9KHuhS+v3ve+ER0feC6lfVn0komXmQL5l9fraDEUpyRaKjFXFScCADJ6BzEIgMA
	AA==
X-CMS-MailID: 20250205160705epcas5p4c645ccf4051eb12a252d7d9d4c3c300b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250108054224epcas5p399f3d734f8d9f82e5ae75d183d1a5344
References: <CGME20250108054224epcas5p399f3d734f8d9f82e5ae75d183d1a5344@epcas5p3.samsung.com>
	<20250108055012.1938530-1-dev.tailor@samsung.com>
	<006401db73d6$2af35fb0$80da1f10$@samsung.com> <Z5zPpz6WAbPJX701@bogus>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_080713_860987_C5E52802 
X-CRM114-Status: GOOD (  20.12  )
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

Hi Sudeep 

> -----Original Message-----
> From: Sudeep Holla <sudeep.holla@arm.com>
> Sent: Friday, January 31, 2025 6:57 PM
> To: Alim Akhtar <alim.akhtar@samsung.com>
> Cc: 'Devang Tailor' <dev.tailor@samsung.com>; robh@kernel.org;
> krzk+dt@kernel.org; conor+dt@kernel.org; devicetree@vger.kernel.org;
> linux-arm-kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org;
> linux-kernel@vger.kernel.org; faraz.ata@samsung.com
> Subject: Re: [PATCH v2] arm64: dts: add cpu cache information to
> ExynosAuto-v920
> 
[snip]
> > You can add one node for cl0 and cl1, say "l3_cache_cl0_cl1" and
> > Remove the specific node for CL1, because both are same.
> >
> 
> What do you mean by "both are same" ?
> Do you mean both have exact same properties but are physically different
> caches ? OR Do you mean it is just one shared cache ?
> 
Thanks for review and pointing it out, v920 has physically different caches 
(two of them are same properties, but the 3rd has 1MB lesser size)
Got you point about having distinct node for cacheinfo population
So for this patch:

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

> If former, we still need distinct node to get the cacheinfo about
shareability
> correct. If this is about avoiding duplication of errors, you can probably
define
> some macro and avoid it, but we need 2 nodes in the devicetree.
> 
> If latter, you suggestion is correct.
> 
> --
> Regards,
> Sudeep


