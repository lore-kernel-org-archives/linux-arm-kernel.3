Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD33C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 11:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vSPtDJBBCPKpz5rvbsYOOueaz2bMZDd9bsU+wbrmbcM=; b=c3HMyc514P1X8e3MPT2fQuNyYf
	TgqiN3Efolx5fbB7rH6gjc1rJh0nJBtqsbm91/X1Avi/rPui0KvgNbTGd5EhD94mIU2GxztAZpyNl
	8V305uhTrm7/h/Ebltz0xTnjrFFPqXcAzrOEOoEkDB/OjGSpKm2J4NpQcVXMkfZzgwSNKxo9xnfkA
	CGjj9ks8qw8MAkfmHU8UzK8/abnQYRa36hEqh1sk21sSItR1y5XaIs9Dcvti+tBB7EGMdgr9nQ6nY
	2nHt3Rk6Tn8kqycA//HlH41hZKijepObYiMa2HOrQMEpYDpgMcWpztwkPrfUHSPciU6HNuY58DdKv
	Iz+f8hNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2pu2-0000000ADEK-2e8B;
	Thu, 10 Apr 2025 11:17:02 +0000
Received: from mout.web.de ([212.227.17.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2oZr-00000009zxc-2NV7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 09:52:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1744278701; x=1744883501; i=markus.elfring@web.de;
	bh=vSPtDJBBCPKpz5rvbsYOOueaz2bMZDd9bsU+wbrmbcM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=uNJTSIACyASdjTcRckv2AYHUAAfql049+cxwSxa0bnxGRoSkp6C9mSuacBk292GN
	 jns+fIlNpfhauKawNrKOHfDYH0fQ0liEGgg7TD4kVQYA3cgDwBKZrxOGSF2QpA67C
	 zaevTXFNYDdN+ML9plVzFADlJYXYjxWgDyUOjoGWNYajIM/T9EpuqsQdb2ilAM1AJ
	 7pgHztMeD7/mGSMQqiJKjnVEmGl+/XL5HgaGq/+BbbIrAkjOX8pisavOJJ9VunaHL
	 Evmt2SGmALAiAhKFe1jeiN2+hDxpQlWiRZbUW7Vadwu/hGpsASPN3mJlaJ8CgYm3d
	 +uKxXTKjEPTxtlOKjQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.83]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MnX1L-1tJKrg2oKL-00aV4K; Thu, 10
 Apr 2025 11:51:41 +0200
Message-ID: <47681eb7-11b5-4a75-b100-93bc5ccc1c8b@web.de>
Date: Thu, 10 Apr 2025 11:51:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: crypto: sun8i-ce-hash - Refine exception handling in
 sun8i_ce_hash_run()
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Chen-Yu Tsai <wens@csie.org>, Corentin Labbe <clabbe.montjoie@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
 Samuel Holland <samuel@sholland.org>, LKML <linux-kernel@vger.kernel.org>,
 Julia Lawall <julia.lawall@inria.fr>
References: <3727de04-7993-4b81-80c0-adb40b847307@web.de>
 <20250409133610.59d42bec@donnerap.manchester.arm.com>
 <2774682.mvXUDI8C0e@jernej-laptop>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <2774682.mvXUDI8C0e@jernej-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:hwJLNn0l4SKDqj00GqpCYLwpSlnmBFbcsAzjdkoHdNAyDzfJjqA
 cVOLLWsODyxVOnyi0U4Xp9SR14AQAiClqqwnvfEpYYplTw/vOLVgNt+GaDsUpmTqwTh5/11
 yLUVrGoaXrE7440Iz+8ts0one8l2XSTFMi7/71GpPnvLiCl5pfyV1AsTDfMqhnJbmsh9JPX
 L0vEEFPgulu/0pt0cwARA==
UI-OutboundReport: notjunk:1;M01:P0:aPD+U6ytqzM=;3juoI7tli45UC7oVR/Bw81F+FNl
 tIJSaD6SCDLINBFGIXvDu1w50HUXMTh3TiGWYgCk7NCXe2qf7Z7t/ygJQUryl/sTxmtak55md
 CTGghy+uVZBiYKKfWxASqdMU6a1yJXaNX5E8Xvldg8zU02/hzaBuq1viJW0a0qoVCjgbpbTah
 9/gGwEsx0uaBxMu2Ryxvj87r3q5zyvbB0wfgv3KdrN8viH/vp1MVwmnAP02dfyHW7+MkU4LKN
 kof9akYD1J6t4p4RlhtWtJaRodyDD62KNqvjkR6VaRwV3HznbsAQDHfRdxL1rbjX2Etg1H9HU
 8QgtRUJAimxbUf4+Vo7RtZAY/eIgw01wF5yaiOiH5w5KNYxUfVaHRdHUDjeSEhsVRTiFWggyv
 agXyaj95ABVJors1a+vKTu/dvBhBAMMbWoUAnzMFBjQ55tTlEiq9TZq2Evc665Un7pTLT0FQA
 WNtC0UahR6uQhe7dXmSeRslGAcWnoLk2+8PIgi/hgQhR7TUknT9LY/XMRvcTpwcCqXOSD9DYh
 FT2C25b9tsAkItS4QNDrOijYtwXtxjQx5RM4wIpq8OmbpyFTkTxf53AvBVxdv1ZRipYSZrzHB
 LoNybxR16nwI1oLQ/of4XN88FffJQA7d6yVPKsVtqp+GYGmERw2jEcSZ5UcaTNvSpWXjXfeox
 0oXE+l+vejVDNDdiBkYeVULRrVB+qsGTgdJd7ldA1hUvCS+JRArC0Li8+91H2P24bsRVIwSkX
 ef+HYS95Vdfn52nMnU9ZOh1HiXpAeAN7deJPxC29q9lUENRfw76sYc0yW+pj5JPh9LsK+K1CS
 CLNJBJk/1ClRIlO2G2k71iZsxbl7Xp0MCrB0bOUq+ucUZdG3D0kMFNc7Ax6+epzjv63XCYTKQ
 4BhTPP9eKaSVMd8sYkSdzVBarDhKcB6WEy1eTRA1W2XxxIchY7Se+YlNyi+dtQ6v1Syt7Gpb5
 6tScQYWIBxm/bLK3UApil8DWBOfhZPrGrUNEFbBZbaTb4EV3+0r6d1Z3Zm4z064Dmun+hTz+Z
 rmSJa7TxHuHiWBt4KO3uiM9iOwhGjoSVsZv7IRGWvH26eMY9TpJbSon6DL0qU+HMeduDX+MAY
 q66HNoBcYYx2iGcV+3ELyCmvtMB6+c2C/REJQQ2MxzjG0tPD+mGXxHF7hWX+Z6yN8uL7FN8a7
 rwMnE8yuO1SMQuIq8V/VKd7QQldWvlBdW57dTCd/78w2eO4sMtlDi1RDxhJU9MAWHfpSiMw0M
 VrrCW7xibXjchciMJdpBtAdDz8/rTdjzL7O6XMC9zukrYdf0H5EqW4dKyCIvGAcT/A2uxq1cl
 4AVO2Ry7xa2qKKvX8QqUmbX6mSHPaPzIf4Z5jseax91MsGpv5Jca7ptaJJ7pSrDI6Wos+RNe8
 UgjPjvlp9Dm1C8HLBMGilbtB8zXkj9twzLu/1eKatcwdvZzsGioj7FKCR0IRPBlZNFGYq23iM
 hyDrv6cZWetOiSGvZAy5HI9cjjO63DlUNF8j9tQAlUiE9lXBs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_025208_003307_52926358 
X-CRM114-Status: UNSURE (   6.55  )
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

> I'm not a fan of this patch either. As Andre said, current code is easier to
> read

I dare to propose a small source code adjustment according to another
software design option.


>      and such optimizations are more for compiler to make than us.
Do you know any compiler versions which would support the presented
transformation directly?

Regards,
Markus

