Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7ACDCDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 22:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=56P581cyET3p8pfSvFHStxu8oHOszFLpsAJpj8hvZRg=; b=QxCzQVyaMnSmk+36x+NEuLeVKV
	sXpcTtdvXNpK8lBfx1V/iG7QI1vQ7S3Mor6rEGbsxgdFs4eEOJdCexOg/lZpkXBysFWsR9iKp+zem
	8i5A9NU3YAUdNcTiKrlH9TWp4QFSQu5gz9609eB/gpj2jY7SMgX2JbTMqh7PZeJBJgn7mFzFw1o5D
	GQAXrxlPch78Sh1BiXqf89Mg5amZA5ijENqPMdXK4sz0EOj4Sp4+dVwv282SUCfKw7foF7p0B8K6X
	V+2F7SCE/zlN6X0bKXP6ff2e9VprCw8hrNLDyTRyP9xfV8aR3cRZIUmTCpIPUlnYBsAM4y/WT38tR
	AiWfDGXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcWUD-00000008Pst-36Nd;
	Wed, 24 Jun 2026 22:54:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcWUC-00000008PsT-02pC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 22:54:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6BFF243232
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 22:54:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FCB11F00A3D
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 22:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782341663;
	bh=56P581cyET3p8pfSvFHStxu8oHOszFLpsAJpj8hvZRg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GAm5f3UJm54F7qj3ACcwYfMiGhx0fpiVaO2rFqe7P93zV07FTHwTKz1bXSlkOHfY5
	 TB/A9TbrlhZ5dNEYrabhUw5qDFvF8QVCFjphUnvqkmohy/6K7usTVDt4R5FeqxBd/N
	 YlfUKleNA6S67dMaaUf0dYF/71Qj88x1+iv5suPtjNOJlCdD+UqQsdfiwYXDKF03jK
	 cxN0hdjXlFfWNhB3ieru21GjQxxJmnPKtaH/n+hLoR6SCDF910PlwmFYmNSBIneJhg
	 7jZfRIcX9945y0F+OpbmHA0RI5Py6ZJsX2yI2fde1JdeKi6iRBGe+ZWIvMqiq+MOFp
	 0EzoksAhuaRDA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5ad578c49afso1644791e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 15:54:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Roi2MnEcesR7rd/Ob7lvBNU5W48RJ/+Y2JN9iLoTxe4FZmKQhmYnFzAzYn1Gd6jZyE86WFkKSWuU4M0eczOSJP5@lists.infradead.org
X-Gm-Message-State: AOJu0YwxEMULrQubMdySuG4iT5I32ryo3vYIDxxhL5HOjSrNx8iudm9d
	m2WfYYdAhjG7Pb7TV6Kk3OBLAlqidPBeOgUVI4i6P59/zUUS3ZpyXl2Ze6e/y6jcCWcDG64chJP
	E40xuUB/0P71TkLzH+sETc82V5NQoz48=
X-Received: by 2002:ac2:4909:0:b0:5aa:6e60:1983 with SMTP id
 2adb3069b0e04-5aea1f4cc2emr7661e87.24.1782341662098; Wed, 24 Jun 2026
 15:54:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260623-i2c-fault-reporting-v1-0-6db1a8aabf18@mobileye.com> <20260623-i2c-fault-reporting-v1-5-6db1a8aabf18@mobileye.com>
In-Reply-To: <20260623-i2c-fault-reporting-v1-5-6db1a8aabf18@mobileye.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 25 Jun 2026 00:54:10 +0200
X-Gmail-Original-Message-ID: <CAD++jLmze1K8LnMniv1gNTxXnW87AOF08vcPXnsASXn+75WG-Q@mail.gmail.com>
X-Gm-Features: AVVi8CfWKmNuDtu_CQ8CzYherOgZFOOUsqFP_TlnPojbQL-Ikm-PqOSDWXEzGJQ
Message-ID: <CAD++jLmze1K8LnMniv1gNTxXnW87AOF08vcPXnsASXn+75WG-Q@mail.gmail.com>
Subject: Re: [PATCH 5/7] i2c: nomadik: change print level for fault messages
 to debug
To: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Jun 23, 2026 at 6:32=E2=80=AFPM Dmitry Guzman
<Dmitry.Guzman@mobileye.com> wrote:

> i2c-nomadik driver prints error message on every faulted message. This
> is not a good practice, because in I2C a fault not always is an error,
> sometimes it is the expected result. For example, scanning bus with
> `i2cdetects` prints over 100 messages in dmesg (two messages per each
> target address).
>
> To avoid excessive prints in the log, change the print level from err to
> debug.
>
> Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

