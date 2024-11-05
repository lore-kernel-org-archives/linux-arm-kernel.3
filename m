Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F80D1267F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 10:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EEyErTaFotgB2UGJ1zywSwEt27+ao/0XQEozI2hYQys=; b=mDTqB6Mejjhi9dahyKj3bz5Qtq
	fnldqegMvcbPxrI9xUIeYNppBk0tYw0D7Zb/N8wQKupQEOVeYfBDmxjQ5bFwQF51DsUSxOflhZQgb
	qIgpF0eNPndzeG/cpzcyftdLm7DuboIl5YlznENQ63NI4wXbLIeq47gR4vVN5MW4D6q7o9Wy01Lst
	J5SzAMz+PKgSg5jVQjdcW1DbV0NnleSqiMtdENGfP0vVWi35KO16MNBYw+ef6qcXIViMqemBm74rt
	66YUNmdqee4YY9A0nNblFRD7tLdvTx3KUKAhj52nzf/3pNXinkDs6dUATkYPf+r79eLGkDVG/Htgd
	eo8+6UUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8H8m-0000000Gihk-0hj4;
	Tue, 05 Nov 2024 10:50:28 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8H74-0000000GiZ4-3lnW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 10:48:44 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2fc96f9c41fso55766971fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 02:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730803721; x=1731408521; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EEyErTaFotgB2UGJ1zywSwEt27+ao/0XQEozI2hYQys=;
        b=GUr7DweNhKEbgLwAG1R4fN1MJgc5s5sBmgv0crCsptjY1Dty7utk8eQiEXnW0WM6D/
         UlMfXCjH2BmYxfbk//H7FrYhtbt7hAnp1JzXgdlqKDNA0HIlQWSMZr20sTY57YDReJZx
         GNkB/cbqjZJ93mrRIFa9uXucXx+SMFLjx7b0RBOwuBw4rHhYp6oL+3jfixD3ZlmqDFSf
         s4VcDYbl7sA0lJAms1jO5U65W9hgmMD/6ZID8K/xI3t4YwLad91pNL5RyIu512FdU4+X
         coAfeSDKyBDHNEHEvxH5Dg72JGsv1ReKSrdjDl24f8ABLfSJ3VscOeZushkJyQfrAbRE
         ns4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730803721; x=1731408521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EEyErTaFotgB2UGJ1zywSwEt27+ao/0XQEozI2hYQys=;
        b=L6bTP5miLqCyP67OGLrzb7XwT/ZFepj3J4gIDVfmR2kxWnN4dMm+OvIgaCYSJ6OhkR
         bgbiGH2ctM07CE/kU9+qswejIo0QvbsiGIUEiO8FpsdmnxHISVftwESbBUmK0Y6EZ7EE
         ztA9/ieo3AgXnaGb/xVZVl7YDp8h9DDb5WFiTSaHAVJcZB7qMsXiXOyhfv6u2gYteBEi
         FhN5DVzrZ0mZvJMttJlFGEc9zb9kp/7+/rLh7VUkOH6wZJUnC1CKtLEKsuGaaP2ad0ao
         JO3YP0z3k4ZPPIGwW5O41W3lJn8gMvXkPrNLB1FYDALtTNrfCA/ExIt9+ufJ8PzG6PKL
         +Mpg==
X-Forwarded-Encrypted: i=1; AJvYcCWcG/IqAePyiwP0hUKCxUhnDTY0Ovt+L/dd98+hvMukApWA33/09yZzlAdwykN3yh50+oWdy0zasEJ/V/xyK6SS@lists.infradead.org
X-Gm-Message-State: AOJu0YyJ9qie8RP8CWi5kJszl4ha24Q25nAGD68GSvTr18OOOEJ+y5NP
	nnr299O3Y1afOjcQZGIv6G+/vegSKi04Z5Kxy0Xsp3FITpjdUh86ArcwgrI4lB6dl6d67horyKq
	dc0vAdL0lxHDr4uvuhQ2Juz1XqnpIBw==
X-Google-Smtp-Source: AGHT+IG8lyaNErIet7KUEx+3Ey0QVQ7V/6TntPE+9Abi+rJ104OGSqERWvIyDPQsR/HAb5AxwbvCpdFNKdNm6ESk1Ss=
X-Received: by 2002:a05:651c:158d:b0:2fb:4b0d:9070 with SMTP id
 38308e7fff4ca-2fdef25741dmr57407361fa.10.1730803720362; Tue, 05 Nov 2024
 02:48:40 -0800 (PST)
MIME-Version: 1.0
References: <20241023185841.1183706-1-festevam@gmail.com> <20241024-pep-proud-d714705c9ddf@spud>
In-Reply-To: <20241024-pep-proud-d714705c9ddf@spud>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 5 Nov 2024 07:48:28 -0300
Message-ID: <CAOMZO5BSZ4YAZ7Lqa3eGP9Wx=Ed7cgug==_UZqc7F57=XCJv3A@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: timer: fsl,imxgpt: Fix the fsl,imx7d-gpt fallback
To: Conor Dooley <conor@kernel.org>, robh@kernel.org
Cc: tglx@linutronix.de, daniel.lezcano@linaro.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_024842_957240_5B44B006 
X-CRM114-Status: GOOD (  11.64  )
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

Hi Rob,

On Thu, Oct 24, 2024 at 2:05=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Wed, Oct 23, 2024 at 03:58:40PM -0300, Fabio Estevam wrote:
> > From: Fabio Estevam <festevam@denx.de>
> >
> > imx7s.dtsi correctly describes the GPT node as:
> >
> > compatible =3D "fsl,imx7d-gpt", "fsl,imx6dl-gpt";
> >
> > Document the fallback compatible to be "fsl,imx6dl-gpt" in the bindings=
.
> >
> > This fixes the following dt-schema warnings:
> >
> > timer@302f0000: compatible: 'oneOf' conditional failed, one must be fix=
ed:
> >       ['fsl,imx7d-gpt', 'fsl,imx6dl-gpt'] is too long
> >       'fsl,imx1-gpt' was expected
> >       'fsl,imx21-gpt' was expected
> >       'fsl,imx27-gpt' was expected
> >       'fsl,imx31-gpt' was expected
> >       'fsl,imx7d-gpt' is not one of ['fsl,imx25-gpt', 'fsl,imx50-gpt', =
'fsl,imx51-gpt', 'fsl,imx53-gpt', 'fsl,imx6q-gpt']
> >       'fsl,imx6dl-gpt' was expected
> >       'fsl,imx7d-gpt' is not one of ['fsl,imx6sl-gpt', 'fsl,imx6sx-gpt'=
, 'fsl,imx8mp-gpt', 'fsl,imxrt1050-gpt', 'fsl,imxrt1170-gpt']
> >       'fsl,imx6sx-gpt' was expected
> >
> > Signed-off-by: Fabio Estevam <festevam@denx.de>
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Can you apply this series via your tree?

