Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27488CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 09:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2GZRcmUnBgFU/NnSUNvF0yJ6OQh07+XuyeXMMfMjdpw=; b=sNl8OmXWSqs4FLAmwXWGg+DHeD
	vTMlfgnyZWSgcxHNaeZrKn9ddvojiIFhoZNlbZKxI0ps9lC0qvVGsOsOhSUWjAlEIrWmGhiCHuCeY
	Yuv+B4mXKkxJ0UljbsSQWN8o9LpYVFUnEmgW0fqITpzf93F8eFaW38FqctViX4tqkUjWCiKZTypWa
	ULFetl3yot/jrhsrshg88jUvFgG93ZeuUpLlAvSVUelGfwCfvjXIHhLLpFho5XcFpSIoRX2p467am
	qgP86GO58NUGKIAIR2wMByXzcZikrfLhdHaOUCdQ1hE5gLpmtTOKYsWhL+kVD+aq7GjAUzo+BFnQy
	E/9lB9xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOAF-0000000599a-22UB;
	Thu, 30 Apr 2026 09:58:35 +0000
Received: from flow-b5-smtp.messagingengine.com ([202.12.124.140])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOAC-0000000599F-2HKh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 09:58:34 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.stl.internal (Postfix) with ESMTP id 1F9B61300024;
	Thu, 30 Apr 2026 05:58:30 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 30 Apr 2026 05:58:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777543109;
	 x=1777550309; bh=2GZRcmUnBgFU/NnSUNvF0yJ6OQh07+XuyeXMMfMjdpw=; b=
	Ei3OTv4yPMbRmJibf59VFwjx/txeLxhoz1vkiRSeiuQdFzP60yCwic1wXfQ1ypwa
	MkMu9W2lRCwTXuI+l9H+yh6t6UfIHRRx2kAvxwofEA9gqlulztPdPxIboAjNKxwf
	OIlIPutFxrv45KYJSmx9OyELKDIEAt8q11lUs5Noyl9rU5jcTKnz3gk3zHLuGl+h
	NtX0iICmZYs46wBbWskSZ1o14QwCjcQ7Y1b3J0DjGXrsMV0HL1jWsiWykcmY6teT
	Gjas5Xh01RYTEIO5hWnd1XtdkTy/z4GCt5kyuqF61epboJrDqzRRhNSKO27FQyKe
	BiVRk1sBHjWsFiFb79L0xA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1777543109; x=
	1777550309; bh=2GZRcmUnBgFU/NnSUNvF0yJ6OQh07+XuyeXMMfMjdpw=; b=f
	+dO5OsKQEP+z4dIuEky0DobJ4pu+ixgoYFPzObV+1t65xswx+yk/6884x9NPu37W
	FR1rNA4sHgWb65DYcaeTlP1wPwinHwVb/8eCe58+Mxtp45sv/5ArZsbDiaN/JdOU
	ixBvGHOi1bXWAPKqdvumj+6LGfz8Sr3sV4R/vA2x2FbMRvBi6IdX9KEQPTfPKD6G
	tJB8Dc33Teu/0ekw4WoyIkp5PsaZvy7Ma/X+XeXKNb74ZMW9cmutATamYAR/vPAr
	gSomBT2TxyIs8mJ4kl9z75pxpWsumMnn/gK7VTANqjY+kfwl8HoGwOJ4TNRdQ3uB
	HjOs+2I98kYtBCbmnwawA==
X-ME-Sender: <xms:xSfzaRsKVlg-ScY42aRobmDN45st5Yh6tt82I_2nrYdLqqesPCLR0w>
    <xme:xSfzaVRjKYABycFlKXsHs5n9HtHcLmIxyKCGIBiHXpQCmzmUqd9gUKVjl9FYtnzoz
    eWJJDRb4PCpyOQdcM6DfPE1oSBIzd6p3FESjRSLtwwlDTxTIIJ744E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekjedtvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeeutdekkeeftdehleekieejvedtkeelvdevteeugeejlefhhfehiefggedtvdduieen
    ucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgs
    pghrtghpthhtohepvdejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtohhnhi
    esrghtohhmihguvgdrtghomhdprhgtphhtthhopegstghouhhsshhonhessggrhihlihgs
    rhgvrdgtohhmpdhrtghpthhtohepkhhhihhlmhgrnhessggrhihlihgsrhgvrdgtohhmpd
    hrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegt
    hhhunhhkvggvhiesghhmrghilhdrtghomhdprhgtphhtthhopegumhhithhrhidrthhorh
    hokhhhohhvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepvgguuhhmrgiivghtsehgohho
    ghhlvgdrtghomhdprhgtphhtthhopegrrghrohdrkhhoshhkihhnvghnsehikhhirdhfih
    dprhgtphhtthhopegrnhgurhgvrghssehkvghmnhgruggvrdhinhhfoh
X-ME-Proxy: <xmx:xSfzaTqz2TAqWBJNhUetmWcAQzThHEWytbSBu19pUreFLJpG8D_ifQ>
    <xmx:xSfzaW114DhQkU7PsC_pDzf0NnfqA_rV3BUeA383pB1vx6bThO5C9w>
    <xmx:xSfzaaXOO6WiQjxnFZ0qTKACe6PlmvZcmZoS_VD5fJtxQrEjlV4AmA>
    <xmx:xSfzaXyNXunqCtskmYElQtsXbGmJjI8cN5ZUoEABr6gmV3ZRd9EQIQ>
    <xmx:xSfzaVodQF4K2tXT2Oxfv5o8TlVySilTpseCUTQ8a7plToUY_s5B80Tb>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4C14A700065; Thu, 30 Apr 2026 05:58:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A3XgsrJ_aa9s
Date: Thu, 30 Apr 2026 11:58:09 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Rob Herring" <robh@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Christian Lamparter" <chunkeey@gmail.com>,
 "Andreas Kemnade" <andreas@kemnade.info>,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 "Eric Dumazet" <edumazet@google.com>,
 "Bartosz Golaszewski" <brgl@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Johannes Berg" <johannes@sipsolutions.net>,
 "Jakub Kicinski" <kuba@kernel.org>,
 "Kevin Hilman" <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org, Linux-OMAP <linux-omap@vger.kernel.org>,
 "Felipe Balbi" <balbi@kernel.org>, "Rob Herring" <robh+dt@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Netdev <netdev@vger.kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 "Roger Quadros" <rogerq@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "Tony Lindgren" <tony@atomide.com>, "Linus Walleij" <linusw@kernel.org>
Message-Id: <f7e0f283-a640-4017-824d-2efdf5543470@app.fastmail.com>
In-Reply-To: <177754112702.3678889.4847926893667561974.robh@kernel.org>
References: <20260430081242.3686993-1-arnd@kernel.org>
 <20260430081242.3686993-2-arnd@kernel.org>
 <177754112702.3678889.4847926893667561974.robh@kernel.org>
Subject: Re: [PATCH v4 1/3 net-next] dt-bindings: net: add st,stlc4560/p54spi binding
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_025833_042834_B9932E86 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
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

On Thu, Apr 30, 2026, at 11:25, Rob Herring (Arm) wrote:
> On Thu, 30 Apr 2026 10:12:40 +0200, Arnd Bergmann wrote:
>>  .../bindings/net/wireless/st,stlc4560.yaml    | 61 +++++++++++++++++++
>>  MAINTAINERS                                   |  1 +
>>  2 files changed, 62 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/net/wireless/st,stlc4560.yaml
>> 
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> $id: Cannot determine base path from $id, relative path/filename 
> doesn't match actual path or filename
>  	 $id: http://devicetree.org/schemas/net/wireless/st,stlc45xx.yaml
>  	file: 

Thanks for the report, I've fixed it now for v5, to adjust for the
renamed file.

      Arnd

