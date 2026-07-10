Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D55FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 16:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pVC3AYzWCZ7nA7Zx5PcIM9xICa0pzsEbQr6/+eSIHzw=; b=30YLuxl2jx155StR8HoBr0Hb2U
	2s3TgPB0hBf+wQRl8pnh7P2CUDYkxzzxlue41RJQMB4L2Gy/mv+pA1fb8TEo0MhYeaiK2MdQChl0z
	QA2FraFMlE+IY8tMVwpb9llu5p0h4zhGoDPR2bmK/40nY7GI4nijMhvrwGSzhYYQ2+ovEbXglTNwK
	/LhaFGOq5+sEC8fH01Zaw5mPqFneGeHd8dXaGdyb9M2s3aAxDwSllF2pvUVnh81XTAUIe2qK48c3o
	bIiQ9um/xmFLsH5tDXAvrPZpiFZfop3aUVF5JmCf44H0QN8C7s7Fpe9FJZCaOdew6ffZsb+EguAvi
	ZRzXEVFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiDgU-00000005FVf-2SwE;
	Fri, 10 Jul 2026 16:02:38 +0000
Received: from fout-a6-smtp.messagingengine.com ([103.168.172.149])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiDgQ-00000005FTx-3jRy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 16:02:36 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 6DCD7EC0080;
	Fri, 10 Jul 2026 12:02:33 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Fri, 10 Jul 2026 12:02:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1783699353;
	 x=1783785753; bh=pVC3AYzWCZ7nA7Zx5PcIM9xICa0pzsEbQr6/+eSIHzw=; b=
	ZdKLk2Nrqvuquig739pAFXBk3xhchDAyJLCFAbElu+VcQzL4un+lTR93+4DLk2EE
	pnIc503b23mDSSIzu0bqWWjjvBJykyDENrv4ZwWvClqGirI7J83xphFi3afnl5e8
	9KcUgJPxQzb9kuRGX1xQ8TXSWJN1iHk0nC4NTeJEA40ccOC7sPrVKVirkNPTDR07
	uBfKYDHzdciH/fjEvd+/ThJVVimkeN+JotOmL2dz/BOf1a04x3pGUwMq++pZIDsC
	R8DXfunHs6GpTsfbwodfLJ4l4seHQoY41ONg/pMxIjaTtgoMQeqfA7kV3FoxbtaD
	nxWl5e9y2N88JfThw94VdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783699353; x=
	1783785753; bh=pVC3AYzWCZ7nA7Zx5PcIM9xICa0pzsEbQr6/+eSIHzw=; b=g
	FaGiPeQCfxueu8B7xP+DWdcSkMlsyQM/LZ0sAV5cZzbxGiZo6b1SrOOmV4rn6QFl
	5QSIExw7vMHNp6faSvRVyEa5RTZ1VjJIiLCwO1PMzMltH0Lc8+F6v3cc78lrtg9N
	2dgBBZaDFpz5qHUUPp+XeL/XJM+XNMLGrNHEMrLeFcEAa6HV6Xskqc0IkYNQBSOl
	6uaZ/cE3MB8jGyaTiGBxrcltwavhQW+9qyML8BOUU7RZplYR667p48IorFOufeYB
	z39iDM4B8sS+GsnExEBIUhUfG/PnlJ38BJbxY3A0SV/GPVoxG8YJlnxRs34Zu3IJ
	2NVpuHWswmjYNMwDjsgkw==
X-ME-Sender: <xms:mRdRaoERz92OijovTxey0JyU_f463D5iH3pFCeLA2J45LGvf0pM_XA>
    <xme:mRdRasItX1eVy_fNyNxBpySLU9FjWHrsw1c2YAhlvpfXRmCHYnxUNP9uyyFnTZ2-x
    tsr4PYVv32DsppatAhUqQ-hIAUiu6S28t_Ix-cux3W5780OCzLfE1c>
X-ME-Proxy-Cause: dmFkZTGDTkK3SVwkc+amod7exxsWo1H8kNTCzwZRzHy2djrXwZsLuo1VudoW34n48OL5jN
    oW+SPTDBM+j6ht3IH6jol0nDS5ALzuDfOVCa1zHpQCKl3P+z6+TOKSCLB11ngBo+sueKAc
    ovnUieEtSrTlEJYm43z9WzFay/newCZl32dIbbeObPBJQ97CVfrB3QTfi04l7R7q+YpnLM
    ooGrrzgehnNwUN1rbhNnr/MqvCU5J61v8QbxgN0MZQOWq9nd0JyEDQ4eGUrj3fKYSQe8pm
    J30zZeHvvuEkW79s1V980RdQkPNUvedhmoG17Pyj7E7hv5jlEgiD+WNXMAfD+OTJz7dVaD
    xlHMYiDwnbQg/UR/px1l43MaAhhthfjV4Kngw6LOeUaxzOzG3gxHBmUdyLkBj4Lhc7FNBo
    OMyjVpd8Wj08WBSVqglQNn9GSi3lI8pityDFdRV+CNdT/mUdt1JDPKRlphq8yoEdegrc+C
    UftORxSiU8rLrqvFTRrejT1EBbTlxTIIPnxhaJlBZv4baI8gR05XC24qxFP6PBKELoRGRP
    GTr5+sEKiRvYMkiW//duzM211haiLICBeWxnWx0oWNm/KszZeBD/wjk7MY2ItMjOoLzzyN
    N6gtQodnVchDHfnhjrCA9DTa3hiPBZrvoGaPKHgLF54eJkR33T0XRbHb5owg
X-ME-Proxy: <xmx:mRdRarrcDOfAIv6bewic9yTimSBhaR0cPqQjFYg4nY8s_emjz6G6Xw>
    <xmx:mRdRanJB4jusAMMWA2OWjeOqwfafbiNdm0k4xF8kTJz1WXVsHzn0gA>
    <xmx:mRdRaoQGUCwThC5jmr6fOVo0BlG7PCcK7i_LBlrpplhX2brhQB7fAg>
    <xmx:mRdRauu3mUE_rbnk2t4rLobQ7REL_kZmcKO5f078XWDRaf8oovJm8g>
    <xmx:mRdRalXwF3Gsr8uRLwuLE6iYhQaYWZxrcWURobzEmjwqwj1YyucdCD_M>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 01E2A1820082; Fri, 10 Jul 2026 12:02:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A5EVnRCqXlfN
Date: Fri, 10 Jul 2026 18:02:12 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Fugang . duan" <fugang.duan@cixtech.com>,
 "Peter Chen" <peter.chen@kernel.org>
Cc: "Gary Yang" <Gary.Yang@cixtech.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
Message-Id: <149b7e70-9e13-45d6-808e-64498ae11bca@app.fastmail.com>
In-Reply-To: <SG2PR06MB5384E0065AE40BE256F03FB6F1FD2@SG2PR06MB5384.apcprd06.prod.outlook.com>
References: <20260626092015.1709904-1-gary.yang@cixtech.com>
 <21f81761-ac02-4771-9dfd-38e653d1f74f@app.fastmail.com>
 <akIV3eH0n9kRMNvf@QCOM-gEdNzOMOFu.na.qualcomm.com>
 <SG2PR06MB5384E0065AE40BE256F03FB6F1FD2@SG2PR06MB5384.apcprd06.prod.outlook.com>
Subject: Re: [PATCH] MAINTAINERS: Update maintainer and git tree for CIX SoC
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_090234_997679_120792D8 
X-CRM114-Status: GOOD (  12.66  )
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

On Fri, Jul 10, 2026, at 05:28, Fugang Duan wrote:
> =E5=8F=91=E4=BB=B6=E4=BA=BA: Peter Chen <peter.chen@kernel.org> =E5=8F=
=91=E9=80=81=E6=97=B6=E9=97=B4: 2026=E5=B9=B46=E6=9C=8829=E6=97=A5 14:51
>>On 26-06-26 15:03:53, Arnd Bergmann wrote:
>>> On Fri, Jun 26, 2026, at 11:20, Gary Yang wrote:
>>> > Peter Chen has left CIX Technology. Take over maintenance of the C=
IX
>>> > SoC and Update the git tree URL accordingly.
>>> >
>>> > Signed-off-by: Gary Yang <gary.yang@cixtech.com>
>>> > Reviewed-by: Fugang Duan <fugang.duan@cixtech.com>
>>>
>>
>>Acked-by: Peter Chen <peter.chen@kernel.org>
>>
>>Peter
>
> Dear Arnd,=20
>
> Thank you for your review and comments.
> Regarding your point about maintainership being tied to the person=20
> rather than employer, we fully agree.
> Peter has personally agreed to the transfer and provided his ack.
>
> If there are any further concerns, please let us know. We hope this=20
> patch can be merged, thanks.

I've merged it for the next set of fixes for 7.2 now.

      Arnd

