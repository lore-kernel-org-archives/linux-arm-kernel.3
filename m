Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E69DC02198
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 00:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jnRRalYsfx7z1FMzhIoHU7Ms/KER3HC5c+11l6mllmM=; b=4QsDfs9dzBdYcjKMyb9PtKhm8o
	xh3Y3GoKlevljlLs2GB7VCEHppo52j8oYehFaavT6aSoeOtG42mFh64boGuGlzhXryaXVWVR/d12F
	NCdbRxnERgttL7RK6yA0wdv8aKk0Qh8L1dNbygXWzXvLLCscsY2gVZUxNFGVZyY4om7rz7Y4o0NSA
	Sexl1GRdRKZPN7/DjUVEd5IYkXiaUo+/Wq+3EXBdhVhWgGDdCf3xal+YqKCQC77rjIxnFfWV+PNcc
	p6TsXAjBvIN0GxeO5w/CdMFq+S+tTKJs0pAZbd87EAWLt796fg5ijmFLhxJayRZOMEkbVzSWY5yZu
	PcEmAr0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiN03-00000009GmY-2teb;
	Thu, 13 Feb 2025 00:22:39 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiMyb-00000009Gcd-3Wqr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 00:21:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1739406062;
	bh=jnRRalYsfx7z1FMzhIoHU7Ms/KER3HC5c+11l6mllmM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=jtht8LwAMfpecc9QULdps43dmB2r9suxd0Al+T+TcRwf+jWzxNINzQjWb7ANfiPym
	 nYWEb3NrG5KPb7Nq/hEZUHiQsJX6ZOQWZNrqslozedBLb6+RlwoPj9rdp1UnhU3+RX
	 MBZqp9p8n3mTFAiW2svDTgNF2e2h8/A7grImi4ukZ3O+AFOLkEmTmMhNH5kGOVgrSS
	 Lw0YoAVJOYKHd0egB4JEn/vQjZns5tY2kDJDn224NuWa/pMlrfRWQYl0cqtF+F1wit
	 /2bJhstEdhGGsG5HagLr4OSVsFV7hnzcsBXe339aFQjMC0wat3wyyaFgAHQQ1/qDb8
	 nsAGBIjOKWvoQ==
Received: from [192.168.68.112] (203-173-7-184.dyn.iinet.net.au [203.173.7.184])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 880B57576E;
	Thu, 13 Feb 2025 08:20:59 +0800 (AWST)
Message-ID: <f649fc0f8491ab666b3c10f74e3dc18da6c20f0a.camel@codeconstruct.com.au>
Subject: Re: [PATCH] soc: aspeed: Add NULL pointer check in
 aspeed_lpc_enable_snoop()
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Chenyuan Yang <chenyuan0y@gmail.com>, joel@jms.id.au, 
	richardcochran@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Date: Thu, 13 Feb 2025 10:50:59 +1030
In-Reply-To: <20250212212556.2667-1-chenyuan0y@gmail.com>
References: <20250212212556.2667-1-chenyuan0y@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_162110_158408_0ABF8DDB 
X-CRM114-Status: GOOD (  12.50  )
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

Hi Chenyuan,

On Wed, 2025-02-12 at 15:25 -0600, Chenyuan Yang wrote:
> lpc_snoop->chan[channel].miscdev.name could be NULL, thus,
> a pointer check is added to prevent potential NULL pointer
> dereference.
> This is similar to the fix in commit 3027e7b15b02
> ("ice: Fix some null pointer dereference issues in ice_ptp.c").
>=20
> This issue is found by our static analysis tool.
>=20
> Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> ---
> =C2=A0drivers/soc/aspeed/aspeed-lpc-snoop.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c
> b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> index 9ab5ba9cf1d6..376b3a910797 100644
> --- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
> +++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> @@ -200,6 +200,8 @@ static int aspeed_lpc_enable_snoop(struct
> aspeed_lpc_snoop *lpc_snoop,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0lpc_snoop->chan[channel].=
miscdev.minor =3D MISC_DYNAMIC_MINOR;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0lpc_snoop->chan[channel].=
miscdev.name =3D
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0devm_kasprintf(dev, GFP_KERNEL, "%s%d", DEVICE_NAME=
,
> channel);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!lpc_snoop->chan[channel].=
miscdev.name)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return -ENOMEM;

This introduces yet another place where the driver leaks resources in
an error path (in this case, the channel kfifo). The misc device also
gets leaked later on. It would be nice to address those first so that
handling this error can take the appropriate cleanup path.

Andrew

