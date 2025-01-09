Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A9CE77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 04:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sEUvxAlaFrOzDB5FB/QVUuqwckCcowLo9iu/iZGaWU4=; b=DcliWjE0Papc6OIibc5FF1x9Hu
	cDfgWGxum1kLUPPvbjFreR6jzvaUfmWjqzbRtKDZrCJyFJivKmfIvKnYLtvLgMnMkeCpGpR/a8I4r
	YelUAY/sX+KMiJnPPfj7rBLtondqQFxYIPot76FZR8LPHfi9BKPrTj9PZ72fn80E80x3iW9TVXk/a
	q4wwMpWg3R0nT2uJxdU8JTou/n1dUeFBZ3GAjHlXlRbmKwqy4HXelUAwOMA2bqUtX2/UTareJotKJ
	3/5TheWswaIY7whZv6ccK7XhIxZDr244YqVWQAwytikgYmArNUNyJmg4pPlzpTy4zxLXSR+nMce6t
	bn90OtGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVjpG-0000000AgE7-39OT;
	Thu, 09 Jan 2025 04:07:19 +0000
Received: from [203.254.224.34] (helo=mailout4.samsung.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tViY2-0000000AV0J-21sV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 02:45:28 +0000
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250109024522epoutp04131024c2d366ffd346b1689dcdbee6e5~Y5il6sifM2482924829epoutp04U
	for <linux-arm-kernel@lists.infradead.org>; Thu,  9 Jan 2025 02:45:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250109024522epoutp04131024c2d366ffd346b1689dcdbee6e5~Y5il6sifM2482924829epoutp04U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1736390722;
	bh=sEUvxAlaFrOzDB5FB/QVUuqwckCcowLo9iu/iZGaWU4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nJz+pwdR7WVZgkhxvDE+dhxa0cQ2isiaeYwXNE/Rol56xFl/OBDOyrrbiq7Q8kFwZ
	 hQEVBrW7e+44Ul5EkMy4qWQnpVvuKlozbj3PvjZhYnQd2BX4TeZT1q4KwHvAwGlfHs
	 OPYWAVqunaPWqOGsgqGx/sDz2CW8tWoMFWLmH7S0=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTP id
	20250109024521epcas1p3cfde285b76ae5769293a85951d02dc3e~Y5iloxEGD0949409494epcas1p3a;
	Thu,  9 Jan 2025 02:45:21 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.36.223]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4YT8KF3Msgz4x9QK; Thu,  9 Jan
	2025 02:45:21 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
	epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	B4.6B.21650.1483F776; Thu,  9 Jan 2025 11:45:21 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250109024520epcas1p1659320196eff30afbbea57a1665b978c~Y5ikqoaiU2273122731epcas1p1Q;
	Thu,  9 Jan 2025 02:45:20 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250109024520epsmtrp137a472e6ff4448e66d039e146eb5bbbb~Y5ikp03Bg2100921009epsmtrp1j;
	Thu,  9 Jan 2025 02:45:20 +0000 (GMT)
X-AuditID: b6c32a35-093de70000005492-80-677f3841f9e5
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	A8.79.33707.0483F776; Thu,  9 Jan 2025 11:45:20 +0900 (KST)
Received: from localhost.localdomain (unknown [10.253.105.252]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250109024520epsmtip1ea35cc816648c977d3c047c37e9e1104~Y5ikarYjB0925209252epsmtip1K;
	Thu,  9 Jan 2025 02:45:20 +0000 (GMT)
From: Sangmoon Kim <sangmoon.kim@samsung.com>
To: will@kernel.org
Cc: ardb@kernel.org, catalin.marinas@arm.com, corbet@lwn.net,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, sangmoon.kim@samsung.com
Subject: RE: [PATCH] docs: arm64: update memory layout for vmemmap region
Date: Thu,  9 Jan 2025 11:44:36 +0900
Message-ID: <20250109024459.2632388-1-sangmoon.kim@samsung.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108135748.GA9367@willie-the-truck>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmphk+LIzCtJLcpLzFFi42LZdljTQNfRoj7doLFF0uLnl/eMFu+X9TBa
	PDnQzmix6fE1VouFbUtYLC7vmsNmcetBI4tFyx1TBw6PNfPWMHpsWtXJ5rF5Sb3H4r7JrB59
	W1YxenzeJBfAFpVtk5GamJJapJCal5yfkpmXbqvkHRzvHG9qZmCoa2hpYa6kkJeYm2qr5OIT
	oOuWmQN0jpJCWWJOKVAoILG4WEnfzqYov7QkVSEjv7jEVim1ICWnwKxArzgxt7g0L10vL7XE
	ytDAwMgUqDAhO+PoI62Co5wVC2dYNjBeYO9i5OSQEDCR+PXgCxOILSSwg1Hi5teCLkYuIPsT
	o0Tz1D5WOGfnzVtAVRxgHQ+n8kHEdzJKLHo8lw3C+cIosfjFXrBRbAK6El/mXWYEaRAREJZ4
	+DIFpIYZpGFy63VWkBphAU+J7/OnMYPYLAKqEqt/bQXr5RWwl1jaeRvqPHmJSWtamUHmcAqY
	SrT8VYYoEZQ4OfMJC4jNDFTSvHU2M8h8CYGP7BIXuv5A9bpItPzrY4awhSVeHd8CFZeSeNnf
	xg7R0M8ocaq7iwUiMYVRYu41TQjbWKK35wLYYmYBTYn1u/QhlvFJvPvawwoJCF6JjjYhiGo1
	icev7jJC2DIS/XfmQ030kHiwYDI7JHQ7GCXmHJGawCg/C8kLs5C8MAth2QJG5lWMYqkFxbnp
	qcWGBYbwGE3Oz93ECE6OWqY7GCe+/aB3iJGJg/EQowQHs5IIr6VsbboQb0piZVVqUX58UWlO
	avEhRlNg+E5klhJNzgem57ySeEMTSwMTMyMTC2NLYzMlcd4zV8pShQTSE0tSs1NTC1KLYPqY
	ODilGpiaXUuFHxpPPilj/WVzKhdDppUpX9z+2xMubrVm8t5qfsq0dldG6t6Z4Uv3ZkSqdMc3
	u897MGdW2K1u1fNaj31+x2iezVZvyuzx5fkUyOak4/SgTDrTJuG++dmzq77Pj976I0Wdx9T+
	qmmp9cuYhJBbUYtUF/3ubef3P+f8dFdJnHHdxQ+H8/arS4ucsfYP9T1+RVfJpXTWh5ALqz+2
	rwt6uXGnw6VWie61O7ImMt10tfd4FC+/NDe+mvlptfRS7aMzzobM0lv/z+qvy9e1qyef3jtv
	M8d7lWP+E6qZ79U3fLLXTz9WIeZVlGxxqvjXjZkPPn5xluEtXM5fvbwx/+oExXfl7O8fMmb+
	EjT+e1aJpTgj0VCLuag4EQCeQ95qFwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKLMWRmVeSWpSXmKPExsWy7bCSnK6DRX26wYVdWhY/v7xntHi/rIfR
	4smBdkaLTY+vsVosbFvCYnF51xw2i1sPGlksWu6YOnB4rJm3htFj06pONo/NS+o9FvdNZvXo
	27KK0ePzJrkAtigum5TUnMyy1CJ9uwSujKOPtAqOclYsnGHZwHiBvYuRg0NCwETi4VS+LkZO
	DiGB7YwSL7u5QGwJARmJnRc3M0GUCEscPlzcxcgFVPKJUWLLkbPsIDVsAroSX+ZdZgSpEQGq
	efgyBaSGWeAgo0TLrW2MIDXCAp4S3+dPYwaxWQRUJVb/2soEYvMK2Ess7bzNDrFLXmLSmlZm
	kDmcAqYSLX+VIc4xkVj74jkjRLmgxMmZT1hAbGag8uats5knMArMQpKahSS1gJFpFaNoakFx
	bnpucoGhXnFibnFpXrpecn7uJkZwSGsF7WBctv6v3iFGJg7GQ4wSHMxKIryWsrXpQrwpiZVV
	qUX58UWlOanFhxilOViUxHmVczpThATSE0tSs1NTC1KLYLJMHJxSDUw1p0My/rlc0baeMLHH
	wuyjs/VK2WkW1bdVSm9VXbgf1Tq5K1pxAeeVT+la9z6ueG29fSuXWQ/rRtly/S9KSz/LSkZo
	m7zJbdPbslW/9N+SZd0C7c86Dx0KZWnavynAzUpu486gyAw1X611QVIFZTnrUmPfS2bkBm/f
	4fBW1Md/vtHjl7WBi3jXfladrrl5/e65sYWvAvXfqjMseK/aorMpUOS10Jv09jhJw01p11af
	fDEnIvDhgpaXyb0LVu64pH1g4tPfIZdWd9pe5+S+5r/bXz75t6Py3emOX2XNm79Zv25mnbls
	ttOL1PltqtOTD/6eEWDbvqC0+s6tT3O+9qjxv7y74PUsrSszfIWEN7xVYinOSDTUYi4qTgQA
	0AwAItgCAAA=
X-CMS-MailID: 20250109024520epcas1p1659320196eff30afbbea57a1665b978c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250109024520epcas1p1659320196eff30afbbea57a1665b978c
References: <20250108135748.GA9367@willie-the-truck>
	<CGME20250109024520epcas1p1659320196eff30afbbea57a1665b978c@epcas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_184526_981506_14C967ED 
X-CRM114-Status: GOOD (  22.63  )
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
> From: Will Deacon <will@kernel.org>
> Sent: Wednesday, January 8, 2025 10:58 PM
> 
> On Thu, Jan 02, 2025 at 03:52:37PM +0900, Sangmoon Kim wrote:
> > Commit 031e011d8b22 ("arm64: mm: Move PCI I/O emulation region above
> > the vmemmap region") and commit b730b0f2b1fc ("arm64: mm: Move fixmap
> > region above vmemmap region") have placed PCI I/O and fixmap region
> > above vmemmap region.
> >
> > And commit 32697ff38287 ("arm64: vmemmap: Avoid base2 order of struct
> > page size to dimension region") has moved vmemmap region to higher
> > address.
> >
> > Update document as the memory layout modified by the previous patches.
> >
> > Signed-off-by: Sangmoon Kim <sangmoon.kim@samsung.com>
> > ---
> >  Documentation/arch/arm64/memory.rst | 28 ++++++++++++++--------------
> >  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> To be honest with you, this document is pretty stale (it doesn't even
> mention 16k pages) and almost impossible to keep in-sync with the code.
> I'd be inclined to remove these tables; we have ptdump support if people
> really want to see where things are.
> 
> Will
> 

I get it. Thank you for your answer.

Sangmoon

