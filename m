Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 372A4D2ECF9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 07:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jeZXHXCd0A7wzXTSmrVaLmedn4oD/inYVEuWEpVtc1E=; b=bYj79POxDD/A/L
	H1LqtYw7NHcvP2fmGWJtbTukS0EryHUqcOcn6XPE8cw1ISCnSdr5MMpfZt128pyKjaVl53rnouLIo
	RFYIwzBMB0l8yCZdqWIuXi1+kMo1xixrJ2MIjLm5Bk95SeLMk4PsxOFFsjcC8cu+898uGkphrMt7D
	VpClLKUqpuBr1Qeoje8+/KAaWMNIrO+HUjymktbnNtvk4z6OFQImvoE9+ugblsgtuKplWtaSjjDDT
	ncs67AsKliBEhBxN5elO67KGprm7dGpgj0AzDzkcHUT+xMKpYgqF72jDVFwA3kYSop204mKjiBFuo
	QaHIt+/12aAinwX8tYyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6a9-00000003NhM-3uKz;
	Tue, 20 Jan 2026 07:55:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6a7-00000003NgP-0Rm9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 07:55:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E203844314
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 07:55:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4956C2BC9E
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 07:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768895717;
	bh=TMLsqINFJyrKXhaZG2FJM4ezyn4y9q99PGcQ/6K3rFU=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=LNi/4U+YXla5CSde8B0UCcyl6TTmcg7RDk+rUCKE2Tuo5l8q54R2Lzu4cZkF3aPCP
	 36pRRmhzO4jcrstA4tyuI8kz9n4HRzKauNmo7obCQXKUfQtonJRC9aGSB+dwUPkfa4
	 rhKzNB0KpHv4miU2MlP0UTlPfcCP0+Ita2ZTdzVupQuQr6wB3vNMRXLfNzh49YgY4j
	 0JfNyf1/93p1u3C2IkqFcqNLVfkavlUVDKw2WrJKxCRzO0D7ieKLc0/S6ETJKm1frc
	 CMAFrWYGDFvoHaJE3MYihNWFCSzrEHgqXD/PqAdaFNNOwzzPZ/4DnjVdHAWy9oJdRR
	 AEjvSrMg/OQTQ==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-382fd8aaa6eso46155101fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 23:55:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXPIFsk+dYTWbElzplkiEn55+JJN102nea3P82y1s+eQlMZfsmAg0sKMNKMDYQa4lHp8vSwKGMjmgVky1zSX9a9@lists.infradead.org
X-Gm-Message-State: AOJu0Yws1QTMrbUUIC7ULjvQaPhgrLnkpUucxdVsnytGfUDVCrgzdtts
	DWM3LlUTEn8YyIwK3me3Xc5RlN+hiEnBKfnfdA2kV4Ivs7U7g7dJO/asQwab8VvrjuRILXXwZ07
	TER5DSFlPY5LeqrYnCTFbM7l8dcFuGVo=
X-Received: by 2002:a05:651c:1443:b0:37b:97b7:a048 with SMTP id
 38308e7fff4ca-385a54354fbmr4917361fa.17.1768895716136; Mon, 19 Jan 2026
 23:55:16 -0800 (PST)
MIME-Version: 1.0
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com> <20260119-soc-of-root-v1-8-32a0fa9a78b4@oss.qualcomm.com>
In-Reply-To: <20260119-soc-of-root-v1-8-32a0fa9a78b4@oss.qualcomm.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 20 Jan 2026 15:55:00 +0800
X-Gmail-Original-Message-ID: <CAGb2v64uUhbEkB+iFjs5FGYR8E7=2nyNxDi646PmnygBZa6hQA@mail.gmail.com>
X-Gm-Features: AZwV_Qj3MBFPhHKAOhUS4trI6djFD2VyeTyhcWYMtPVh-frJE3FOzmJGjGidA8s
Message-ID: <CAGb2v64uUhbEkB+iFjs5FGYR8E7=2nyNxDi646PmnygBZa6hQA@mail.gmail.com>
Subject: Re: [PATCH 8/8] soc: sunxi: mbus: don't access of_root directly
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_235519_181232_EED3870C 
X-CRM114-Status: GOOD (  18.58  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Jan 19, 2026 at 6:40=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> Don't access of_root directly as it reduces the build test coverage for
> this driver with COMPILE_TEST=3Dy and OF=3Dn. Use existing helper functio=
ns
> to retrieve the relevant information.

I was somewhat expecting a matching change to the Kconfig to add
COMPILE_TEST to the "depends on" line.

But maybe the case is already hit with ARM=3Dy && USE_OF=3Dn ?

ChenYu

> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/soc/sunxi/sunxi_mbus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/soc/sunxi/sunxi_mbus.c b/drivers/soc/sunxi/sunxi_mbu=
s.c
> index 1734da357ca21b249740e089698275507ea98a8a..8bc5f62ff258837d3f3b30cb8=
4b60d1872b31c27 100644
> --- a/drivers/soc/sunxi/sunxi_mbus.c
> +++ b/drivers/soc/sunxi/sunxi_mbus.c
> @@ -118,7 +118,7 @@ static const char * const sunxi_mbus_platforms[] __in=
itconst =3D {
>
>  static int __init sunxi_mbus_init(void)
>  {
> -       if (!of_device_compatible_match(of_root, sunxi_mbus_platforms))
> +       if (!of_machine_compatible_match(sunxi_mbus_platforms))
>                 return 0;
>
>         bus_register_notifier(&platform_bus_type, &sunxi_mbus_nb);
>
> --
> 2.47.3
>

