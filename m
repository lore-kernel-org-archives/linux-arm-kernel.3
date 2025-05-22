Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB44C54E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 14:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/A33PMiQZi7B+yBG25G8T9Mv2qAG7AQkcIksX5iQLc=; b=aP2XGwu1gbKghke95zeKI6PXa4
	HV1la9+EnftKt2CXcq6m0evI7RdfWrd8U4JvMqNDPQGxs1CWwqddWTduxbIVp0PvSk1Wokox0Hv1d
	ZFrtQJFzs2Oj1EP5IQ3as+4DapgnthoixImbcs4mwgv9AxMHVmYhi4ONcjIiGga4CCMQm8LIOcp3H
	6WG1zVTfhfsYUyeQU93crgO34clL1vV/A3tMuB9RYa/hZgfDi0MQgsNNXC928ydX09CAlfmzbEbyv
	zJvq5eOGOqdKtZFxVNpJhxgCN3lJ/VviUOX0X69867IBzrRxPdtVhVULwIi6aPidLogtTzL3cydqh
	DKKMWfzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI6zn-00000001GZY-46PO;
	Thu, 22 May 2025 14:34:07 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI6sZ-00000001FLj-2h6P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 14:26:40 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-2db2f23f174so3495953fac.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 07:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747923998; x=1748528798; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V/A33PMiQZi7B+yBG25G8T9Mv2qAG7AQkcIksX5iQLc=;
        b=hdxRGoKQHeUhtWtOwA5mst3xBE0nHiblpSzwMJl44oXYE/xE8tFMAjPg9nGVPobzIU
         HJm+mmwgjuwDTwD9ROuBRCsG8Xshg4OVF+UuNvpSpYv/w02NEk/cXfxeU/UnjOJ5s91S
         QMDKl1xVK+HF3XnBZgP6YQptoF8sP6vN6uDH8/dG4vcbOdrC8IXoaqh4y084T/dJzsUi
         f2U37s7R0oC6n2JbIhALHUR0k36yRMHdXkih2p6akg0YFpD/3pUoJK8bMcg4iatc7Vh0
         QL4Uuw/zt6lY+M2EtCjhZRyqULde/eXNSe1BxiBgvkcEHknMFdw2dbInofbPDws+DvG+
         5bEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747923998; x=1748528798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V/A33PMiQZi7B+yBG25G8T9Mv2qAG7AQkcIksX5iQLc=;
        b=ujyFhoi4k+4zvE8M1dMf5IEzPuZF2BfmFuR2ByLjGZ16Q55MWkGi5ZClgr86NfuhKX
         cZqhna1FV/y4d6htYHpkXvWFWzCoowzn2mGRjPf5JlBmCR6qLqo1HdqGILseMYOWdrkv
         /jmktV6BSnI4RT/eRp1sPJCyXWglyL0ajFwOuX7aNFiLREtMnwB8E3xUX74pRGpFImaf
         rRckRZAtZhhs5R6exVQy/5joNj/cne3wfgQEi2oLDh3s4gJQYk2FlqI5z7ROsGcPm9l/
         x/2Opa+K08mTj09BAs3d8/u7QGeRqafrovLIMyRTQaQB3ynM3lRC041rMAnYUCgZuugG
         UJxA==
X-Forwarded-Encrypted: i=1; AJvYcCUzD2xO6rIZU817LNDT9MyFIfhTLUZkjlPtXAFpjAo99t/0XEF9cXUzLJbk9jJzsOlnLM72mJ2ALhNAJgFGZFEF@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3beqqHCzORtP2NEs9FKEaKg3lNkqFrF4zOcfE27GUgBgAj5bv
	ZP0usLRJychJ0LChQK4gAA//AHBzQ1sxlSfSATIN8Q83LqGRBYrDKomvNx23VNTbYklkcdPyYlc
	oxRpl/vCS+BZt4gw8Hjni6raPkgeTAUg=
X-Gm-Gg: ASbGncvhWnzRi+DMeGPCBxkeXfSrpoNCyZacxNxY7YayYc6OkOYzbcIAQ2kJiRQIwfg
	LC+xTWLw4dSTMx3PhugYbi7DbLGbamU5cSiF8qWJxyq7d8h8HpK9I+BXdttricOs6+BwkE+RwNQ
	0XEL4syObBIAmBcWaQsmpkOZl5n7VJd4ctLA==
X-Google-Smtp-Source: AGHT+IFasGXYJwj7OJUMsTUB4kivLSdn/44D8WhpmTf+mhlWsPkahY4qS13v4kKGGOknI5Fo1nq5EbXL83EaOftSvd0=
X-Received: by 2002:a05:6870:9e0d:b0:2c2:5b08:8e42 with SMTP id
 586e51a60fabf-2e3c1ed9f7emr16579212fac.27.1747923998032; Thu, 22 May 2025
 07:26:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250425014937.3812976-1-peng.fan@oss.nxp.com>
In-Reply-To: <20250425014937.3812976-1-peng.fan@oss.nxp.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Thu, 22 May 2025 09:26:26 -0500
X-Gm-Features: AX0GCFtasETiZuNGdlMvkRCVQ4E8fN8ZJu-KkF_A9xx8QyFPXNOI67oep8lmyZo
Message-ID: <CABb+yY0dqgPhe5_p+=cyRAbSwSL+qCZXV1G+QQ2kQh7Axh_7Tw@mail.gmail.com>
Subject: Re: [PATCH] mailbox: imx: Fix TXDB_V2 sending
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, mailbox@lists.linux.dev, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_072639_678716_8B360BAB 
X-CRM114-Status: GOOD (  18.87  )
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

On Thu, Apr 24, 2025 at 8:51=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
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

Maybe    while (ret && count < N)  ... esp when you already increase
the timeout from 1 to 10ms.

cheers.

