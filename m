Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5B6C54756
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 06:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U36H2wWEFauYEEMSa49AZxUwXKu8FeN0HzMSY10Qhpk=; b=xKYIF81vno+qxjQn+aYedrVPs4
	dyNmSDWJ2BAGMs4cI8cns3/J2YR/C/lGC3CTfdUQnrhSgvhCBU0SAi9Wc1B2D7p6KzaFaUtI+AFqe
	C5GPjMzq1wlTsfFajb9OGEF/ExsLe+Dppc7bfkp3K62xGCjYPlixhl1Cc9nJF+hBuWtFgwHrLfEbQ
	nMi6NVj4liwF9Ym1dimlA54IHYpyr2OWoOaG+3FoM5qxjCZq+SLc8L3dyKjfqAXj86ggHvifrywN0
	2tn58j8w6W8E5ZNsa3tit4TnsW/b5GJBycuG164TJaZ6Xpq3DCYlzNvtXcDIPRZrgJlJH6L4NDqgd
	ZNfRIWUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHz8I-0000000HYVl-0fbV;
	Thu, 22 May 2025 06:10:22 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHz6E-0000000HYM5-2iX2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 06:08:15 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-231f325366eso56910805ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 May 2025 23:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747894093; x=1748498893; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U36H2wWEFauYEEMSa49AZxUwXKu8FeN0HzMSY10Qhpk=;
        b=Hp//94ZzmPodQZ/ysvZLoZRheKwO0zOQ5UPw2GkG8L9Cn5OnEKzj4MtJQwPhgapq4t
         fbom3EogIOPY7pdF2JyNi1O2oUpIJHhTLdQNLLUk08a5qV+Sz0LUk1S5/9JNj5WMSs+1
         gJa7zy6FLkbjMqssyFVYUGQNrTvJdhwOSNEjoQn6DyVCX+2JvyEMdMq//ABYvz6/TdPl
         orquqJMRwwkpQn1Arr3+T1umubb1VP7grSgi8JIz1ddNDgwT7yU0MQ+/68aZCcircUN8
         eqF05jRSPxzkBjt+9/fhgZXmVirEWUhJh4gzfEz8cifpsIa5v+RW6de3KDkivhV7ClKO
         IrRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747894093; x=1748498893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U36H2wWEFauYEEMSa49AZxUwXKu8FeN0HzMSY10Qhpk=;
        b=VbjycjAJovEdC6NOVi8D+9HMmJ/rD6NQV8itx7YiMgjVQqdFT/qsU+d2fQPp2Snt2y
         jePGVEFFM2DPhg4C6NshXCJjp3GQlD2+IMchBERVubmIn1UrIeCtpGQDTF8QcBsoM/d9
         MXvl1JWQdfvUwq7K3vE3UdDcwJEPr6mq3r7RI2tmjtqjCWC5jbsuYYD1NpN4CQWTbJhl
         XCkdK6bh/6pePsMbubU25zD0/GOnuL1LfT2JcAmjxRfSsNKWgi1W/YAOj7daVuKyoMk2
         AJec+3Z9CcpilQ8uoGd7Y60XDs/DX+FHYCLSrdxiky927CxjXYOF8dVSSbqifFsAzrGw
         Xa5g==
X-Forwarded-Encrypted: i=1; AJvYcCX+Y81ldHA/qTvb+XBjdyqusVM8Xqe/rQX88BPHr5DUGtwrg/JMSrB0arY6hsr9ln1RFIo2u/qDXeJ2cQBXaQuR@lists.infradead.org
X-Gm-Message-State: AOJu0YywAMe1hWq03t5i8V1B4HIc6qm3W/fZSV3zlol0Q2rBn3TZPLqL
	B2ckgL2gD3oqWQkZy3od9kaa1/m7QlTtHUoMofWW4SXZZPwkwg07eg3WEar9Oa0zmqaoqVX3fNg
	dSy3eMxgvW/pOMFRy5nKYV8uwrK0UtDs=
X-Gm-Gg: ASbGnctnMUcnL7jlLk1oO8+xk9H+gI7VD12dwEXLAhuiSSznMUVVFlbpSTWUQBH+iE8
	4yz4VCvsm72aEipife/rMDHGCdJYVWy0Pj9fpN+oABCp+qmfuMJ1n5ijiPWjUK1IkVtXLiYUvUx
	RFGP3JpH6YFL75ul4foZMrsH64Ud3hJg==
X-Google-Smtp-Source: AGHT+IE9W3/67pyzzG5bsjEEBnH07y8AiipEu78C3cAPr2w5kuaSHv9IVxPhv/H5TnGO4GqzACkRex6QwdqPxvVJFyU=
X-Received: by 2002:a17:902:ea08:b0:220:c067:7be0 with SMTP id
 d9443c01a7336-231d43dca32mr284472635ad.6.1747894093371; Wed, 21 May 2025
 23:08:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250425014937.3812976-1-peng.fan@oss.nxp.com>
In-Reply-To: <20250425014937.3812976-1-peng.fan@oss.nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 22 May 2025 09:09:57 +0300
X-Gm-Features: AX0GCFuVRNCfWGnfZ558VOZX_-jhCVuZC7ziACuj_BPkZuPzMGG-o1p_cqn-_zg
Message-ID: <CAEnQRZDKUHfWMXC5oe+kSpLpR5manxx63cxDOMrFEqi6a4VxPg@mail.gmail.com>
Subject: Re: [PATCH] mailbox: imx: Fix TXDB_V2 sending
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: jassisinghbrar@gmail.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	mailbox@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_230814_688300_682DF3FB 
X-CRM114-Status: GOOD (  21.33  )
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

On Fri, Apr 25, 2025 at 4:51=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> i.MX95 features several processing domains, Cortex-M7, Cortex-A55
> secure, Cortex-A55 non-secure. Each domain could communicate with
> SCMI firmware with a dedicated MU. But the current NXP SCMI firmware
> is not a RTOS, all processing logic codes are in interrupt context.
> So if high priority Cortex-M7 is communicating with SCMI firmware and
> requires a bit more time to handle the SCMI call, Linux MU TXDB_V2
> will be timeout with high possiblity in 1000us(the current value in
> imx-mailbox.c). Per NXP SCMI firmware design, if timeout, there is
> no recover logic, so SCMI agents should never timeout and always
> wait until the check condition met.
>
> Based on the upper reason, enlarge the timeout value to 10ms which
> is less chance to timeout, and retry if timeout really happends.
>
> Fixes: 5bfe4067d350 ("mailbox: imx: support channel type tx doorbell v2")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/mailbox/imx-mailbox.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.=
c
> index 6ef8338add0d..aef8d572a27c 100644
> --- a/drivers/mailbox/imx-mailbox.c
> +++ b/drivers/mailbox/imx-mailbox.c
> @@ -226,7 +226,7 @@ static int imx_mu_generic_tx(struct imx_mu_priv *priv=
,
>  {
>         u32 *arg =3D data;
>         u32 val;
> -       int ret;
> +       int ret, count;
>
>         switch (cp->type) {
>         case IMX_MU_TYPE_TX:
> @@ -240,11 +240,20 @@ static int imx_mu_generic_tx(struct imx_mu_priv *pr=
iv,
>         case IMX_MU_TYPE_TXDB_V2:
>                 imx_mu_write(priv, IMX_MU_xCR_GIRn(priv->dcfg->type, cp->=
idx),
>                              priv->dcfg->xCR[IMX_MU_GCR]);
> -               ret =3D readl_poll_timeout(priv->base + priv->dcfg->xCR[I=
MX_MU_GCR], val,
> -                                        !(val & IMX_MU_xCR_GIRn(priv->dc=
fg->type, cp->idx)),
> -                                        0, 1000);
> -               if (ret)
> -                       dev_warn_ratelimited(priv->dev, "channel type: %d=
 failure\n", cp->type);
> +               ret =3D -ETIMEDOUT;
> +               count =3D 0;
> +               while (ret) {
> +                       ret =3D
> +                       readl_poll_timeout(priv->base + priv->dcfg->xCR[I=
MX_MU_GCR], val,
> +                                          !(val & IMX_MU_xCR_GIRn(priv->=
dcfg->type, cp->idx)),
> +                                          0, 10000);
> +
> +                       if (ret) {
> +                               dev_warn_ratelimited(priv->dev,
> +                                                    "channel type: %d ti=
meout, %d times, retry\n",
> +                                                    cp->type, ++count);
> +                       }
> +               }

This could result in a infinite loop. I would try only a fixed number
of times then bail. Please use count to break the loop
after let say 10 tries.

>                 break;
>         default:
>                 dev_warn_ratelimited(priv->dev, "Send data on wrong chann=
el type: %d\n", cp->type);
> --
> 2.37.1
>
>

