Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6846D606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 06:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uhuMMCGj;
	dkim=pass (2048-bit key, unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ndZFzLE5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rzvF6MsRtSNRQYkAnE8s0gTVzXdnYrXPinbLwOnBUXA=; b=uhuMMCGjgtuPvV0wl1ktul6lJT
	yjg0drtmaFG31ow22YB8OLPrf8CvxaoilZWH8nGQzlX8p5d7UEcZMpUPqt8CR1JA+WeigjCYbL/zz
	Zo4cXT6b9DyTXhJQfvRDCS9bU9BI7knuQRw2NI527OSYzEpsm6d38L9cWgybRt6OBHXoUYTvlLN3i
	fnB6NIZuAB6IBYGGa2PclFV3LLm/lDkaZT70ZGS3KEeiYxf8UGpTUSH86LUVY4EIdO5ZCwFhE1lVy
	iEylXWCJdFCK2mrQHDM3n4pxeemClvGcL6YRZFBq/0hVz+F7UAodBx8hiONVZMAcaTW/dcMeyL1Q1
	LhNv5M/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPDCu-0000000BKsF-3k6M;
	Fri, 06 Nov 2026 06:13:48 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPDCs-0000000BKrs-28m3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 06:13:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1793945623;
	bh=rzvF6MsRtSNRQYkAnE8s0gTVzXdnYrXPinbLwOnBUXA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ndZFzLE5AsFZxPNSYiwe1F7iskrv784pVUWFqTXYG7o/4s6WIGZF/QcWN8C9inFSo
	 d8MXP2mSJgLPYNoW2AWLn5VRNIrPj1LvIP1mHVKZgWOhOhRI1K25XLF/k41y826lKv
	 7v6ZUAbAXf0oSctj+L3mLhLfjRcu6yV4dTGlwR+GFYPnnTZ0Mpl4+zXQrBBq5Jf9Ps
	 6HKEmS/q5zVbYOPc/TJlicZ8TdETKFUGMYUXrevKj92uB3KYj9iN289JumYhwMUiVc
	 xZc+5Q1POjXSzWFRBjBDRuAzzg7r5Zf16DH2Yx6Mk9Yn6HZE//t+JEvCfKXgJZTiuz
	 1HdzsucRlCc9Q==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0140E649EE;
	Fri,  6 Nov 2026 14:13:41 +0800 (AWST)
Message-ID: <8afcccd35b8a78730c6a9cc46c30dbeb99694e6e.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 1/2] pinctrl: aspeed: Use managed pinctrl registration
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>, 
	linusw@kernel.org
Cc: joel@jms.id.au, ryan_chen@aspeedtech.com, billy_tsai@aspeedtech.com, 
	brgl@kernel.org, tan.siewert@9elements.com, linux-aspeed@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 06 Nov 2026 16:43:41 +1030
In-Reply-To: <20261106022907.10735-2-prasanth.padarthi10@gmail.com>
References: <20261105152348.8567-1-prasanth.padarthi10@gmail.com>
	 <20261106022907.10735-1-prasanth.padarthi10@gmail.com>
	 <20261106022907.10735-2-prasanth.padarthi10@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_221346_754114_2F9CB406 
X-CRM114-Status: GOOD (  19.19  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 2026-11-06 at 07:59 +0530, Prasanth Kumar Padarthi wrote:
> The shared Aspeed probe helper registers its controller with
> pinctrl_register(), but does not unregister it when the device is
> unbound.=C2=A0
>=20

This is a problem in its own right. IMO the rest of the discussion can
be left out, as it depends on the subsequent change, which still needs
consideration.

> Registration can therefore outlive device-managed callback
> data, leaving a registered controller with pointers to freed memory.
> The G6 handover change in this series embeds that data in a
> device-managed allocation.
>=20
> Use devm_pinctrl_register() so controller teardown runs before earlier
> devres allocations are released. This also cleans up the registration
> if later probe processing fails.
>=20
> With this change and the G6 handover patch, one unbind/rebind cycle
> passed under generic KASAN in AST2600 QEMU and on B650D4U hardware.

IMO this sentence is enough to describe the testing, the rest reads
like unnecessary detail that tends to be generated by LLMs.

> Controller debugfs entries disappeared on unbind and returned on
> rebind; a subsequent pins read succeeded without observed KASAN
> reports. The unfixed control case has not been runtime-tested.

What is this last sentence referring to?=20

>=20
> Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
> ---
> =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/as=
peed/pinctrl-aspeed.c
> index 7e0ebf11a..d19b4d23c 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> @@ -461,7 +461,8 @@ int aspeed_pinctrl_probe(struct platform_device *pdev=
,
> =C2=A0
> =C2=A0	pdata->pinmux.maps[ASPEED_IP_SCU] =3D pdata->scu;
> =C2=A0
> -	pctl =3D pinctrl_register(pdesc, &pdev->dev, pdata);
> +	/* Unregister before earlier devres allocations such as pdata are freed=
. */

I'd rather the comment is removed.

Cheers,

Andrew

> +	pctl =3D devm_pinctrl_register(&pdev->dev, pdesc, pdata);
> =C2=A0
> =C2=A0	if (IS_ERR(pctl)) {
> =C2=A0		dev_err(&pdev->dev, "Failed to register pinctrl\n");

