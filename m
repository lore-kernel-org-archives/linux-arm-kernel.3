Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B16D715E8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Jan 2026 13:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WScG7iuZQ9eiR9kQ4vhreoRjVXS9H3zvxs3xz4eUmjU=; b=TE5/L+FLnX37vKd9Zbh2v5Zrpc
	rCFZdKwdKLaq/Q5al9wauFh7aLQwIW8Fz4Mrp90fprzm0liONTIepA/kxHX+v8c0CkUvCn0qUH/W/
	3Jo/5CUcAjc6ELeG18lLgWUhBZUiOoacRX5szd0w68Uu3QNtNEU6J75/5lPxNoGfVYWKiI4iD0ply
	ReqiqbJ1MmRUCJIDA8lYxrRug34pY/XnQXveW6XSiDGIviYRevCdJxeZbNrG9wULhNmTXcY1jVPgI
	M6yS6rSBIW12dYdF9djZZlUiRC/+ZC4VmjW++emJLoIMo68JPqlEanvG1WKch+kvkBRWyzy+V5nrE
	FfPFOKtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjdPx-0000000AGsv-1VyF;
	Sat, 24 Jan 2026 13:11:09 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjdPu-0000000AGsa-3Bj7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Jan 2026 13:11:07 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3530715386cso2833691a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Jan 2026 05:11:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769260266; cv=none;
        d=google.com; s=arc-20240605;
        b=WJz6zilhbT19R0TkAqhZfSx7ljaeTGjysw+2V6ygd3e6FXmOKhVOWss+hHpy3s/LhF
         SMuOvcEuuz7Cjv3aoejzbGSvXjhGpwT8pjL4795maP0DEqD26kbj3N2wF9EBIW5vQrFJ
         HmohV8TpdiGr0pMKcI9SxxZ4TtjOAbvFpecgzNCL6QNFw8ygQEOEy4UVVU1Y9yoXPEWj
         /LJKw+qwLKzMwxk8KzO0WgFzjPpeUfC+F8iuPBwDJQ7s+lDtVaPmbthZD2nAJQeJabUM
         hSmRmmAdsQL9lgiaM7zt7j8ZmExaCAJSKcX7ScZsjgJ81fRsi1K7OaHWnqATQkw19HjQ
         /ycQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WScG7iuZQ9eiR9kQ4vhreoRjVXS9H3zvxs3xz4eUmjU=;
        fh=R4VInBe5WRPX7di3bra1Rohp2/sjqO/p0zSZFWs6LfA=;
        b=L6LQHX5BgPJh3TPmKF5jHP8H5I18pzZd19x7RUL51w/9NNa5M7chSjwHBoXu55Sz/0
         COGEY3ozwxb28w3TXbOF7adGe/78buTWfzARGhbdCD20n4URVujK2nsiAcH1LUzKdVeK
         qf2dgXZKq2BrVwVdSD4vG8j7DzAu5HDHn8YoC/6WAxyafUd1RIt0x/xye/hDpnUy0ccv
         Xqn8Bcq17PAhgRYwE2C6GHd4PhIKCVbGpQ76qvuGuvWv8SG2Q+fgD73PDwcBr9hg+tZ0
         8J2754KisDuQc9UB4f+K+dvDJz7k9mPu4s8xQr/ghXiMWW09mtqdho32hpITOkqkwK9L
         xhNw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769260266; x=1769865066; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WScG7iuZQ9eiR9kQ4vhreoRjVXS9H3zvxs3xz4eUmjU=;
        b=PED9emM0UdkNR/QLCL86s+1liXezmi/k3lzD8Vyy6NDTadjgx3TFjONGL6HzteKTD8
         1Sba2c15tcBVZ10XVkRFhYDfEkCvHJ7Bp+uMuW7TuTuVyn8vMzVtDRqAQy9ogVtT9GfN
         5KK6rZqIjJSs8S3LatNQpCkHUWan/ZpIY3YJN3n0yON/c/dxuiAj/ecBgTpH/uSQzPbW
         KDOlbpau5Z4AebuW6WQiiJ9e96WmX0XK1kExusXkEBjYS43HCye0rw+QYK0jXfMpv2fN
         d4S23+vn09O5sigPj67a15UmykEcV0MPgjdq4E5PppO0nF+7j9CVx01W9Lrx/jv2rI+i
         IeDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769260266; x=1769865066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WScG7iuZQ9eiR9kQ4vhreoRjVXS9H3zvxs3xz4eUmjU=;
        b=jVNKtYZtMWEsMtS8POg/11dODGm9GlBm964IBiBbiUSZ7pT/yaldx/Kj3fj9wfPu8s
         K4VZZdS/eDNQIeNuE7uVS47XcaXG+AKyJ24YFXPLS6myTbwhPbGvlhl6uNRRoP5ei9Gd
         JbNHuEXA9QjSyAHCqTRPEkMTCNZ276sDSxobC2M46XeXngt4tYsc+Sny9vy0q6091UcW
         9lFFOBhluih2xwNhVneBcCm4ssMh5NXG0sEnFFjCya57W2TLVatF6FN5KMPaq2wor6T8
         E9GztjYYQee13s9/IRX1cTPRqI//0RTJJNCOtTPxcvI64eGajb+Nin5f2Bl16S26H3+t
         xtrQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5VqXXKy3TdWyQOlGM6WeMBode55mJlnn68Jsm7XKBgIfOHBqMp1j0aiHxh/GWKJQc8geHdBu1v8Ej5AKwHUxS@lists.infradead.org
X-Gm-Message-State: AOJu0YzqS0ZvDwVfH7J68Nc299fz37C61LHLLiKQTYa5EtciYRlOT5G+
	Z+RQxm5IrHc6VRKdCnmUyadjdTffVs2NzI1e1XgB3ohBehJWWQAtlLEev6cugO4LGIfaWtjJ0j3
	k3O0vEk8wREWzGUAPj/HJYluFSLLqhjk=
X-Gm-Gg: AZuq6aJPKtwgc4zpdl8cs0f4z79s+R+gF09lJAtQ1H77uaGw/fcYGufNSY0UR+d3g1L
	Hv9666Vk74PJ7Dk1bQSUQKfzdoEYza703ra+n4Q/Ryt6xw7Uqqu/4oJFEwkMkfCcsrgRUrV/PPf
	Qy0TXhasZYGiZWw2yJNqbgKcz+xVWjT4FkvmeqE53HIO/oC+9FuBmTcglKi5bKThr8tlg9vt9zI
	xW1Bd+156lGpCureKVLR/p9868PUyFOcspjBr2iv09OhlaLzcR52OyTqMpkzofIMHetybRyfimo
	41dGqnk2+v0TXRPFovpXm4o8se0+jw==
X-Received: by 2002:a17:90b:560c:b0:343:f509:aa4a with SMTP id
 98e67ed59e1d1-35368f2be10mr5326690a91.36.1769260265480; Sat, 24 Jan 2026
 05:11:05 -0800 (PST)
MIME-Version: 1.0
References: <20260124-pci_imx6-v1-1-6f4379fc5160@gmail.com> <aXPMyYeFVvDjSMhZ@lizhi-Precision-Tower-5810>
In-Reply-To: <aXPMyYeFVvDjSMhZ@lizhi-Precision-Tower-5810>
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 24 Jan 2026 21:10:53 +0800
X-Gm-Features: AZwV_QggnlVdXjeVSFlMBfY0oUjAdJOUKqSfuiS6Rl6oqAQRydYTbQJb8y5wbyo
Message-ID: <CAN4SLj20j8FW_AKAEG3kPBk5GH_hmWMU7fZUQM3TsQfZV7koAA@mail.gmail.com>
Subject: Re: [PATCH] PCI: imx6: Fix device node reference leak in imx_pcie_probe()
To: Frank Li <Frank.li@nxp.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Trent Piepho <tpiepho@impinj.com>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260124_051106_803380_CF32BED6 
X-CRM114-Status: GOOD (  21.96  )
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

On Sat, Jan 24, 2026 at 3:32=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Sat, Jan 24, 2026 at 02:18:49AM +0800, Felix Gu wrote:
> > In imx_pcie_probe, np is obtained by of_parse_phandle() and must
> > be released with of_node_put() when it is no longer needed.
> > Add the missing of_node_put() after of_address_to_resource() to fix the
> > leak.
> >
> > Fixes: 1df82ec46600 ("PCI: imx: Add workaround for e10728, IMX7d PCIe P=
LL failure")
> > Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> > ---
> >  drivers/pci/controller/dwc/pci-imx6.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/contro=
ller/dwc/pci-imx6.c
> > index 1d8677d7de04..3ae02712d3f0 100644
> > --- a/drivers/pci/controller/dwc/pci-imx6.c
> > +++ b/drivers/pci/controller/dwc/pci-imx6.c
> > @@ -1675,6 +1675,7 @@ static int imx_pcie_probe(struct platform_device =
*pdev)
> >               struct resource res;
> >
>
> Please use auto cleanup
>
>         struct device_node *np __free(device_node) =3D
>                 of_parse_phandle(node, "fsl,imx7d-pcie-phy", 0);
>
> Frank
Hi Frank,
Thanks for the review, I will fix it in V2.

Best regards,
Felix Gu
>
> >               ret =3D of_address_to_resource(np, 0, &res);
> > +             of_node_put(np);
> >               if (ret) {
> >                       dev_err(dev, "Unable to map PCIe PHY\n");
> >                       return ret;
> >
> > ---
> > base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
> > change-id: 20260124-pci_imx6-f97d70887dfc
> >
> > Best regards,
> > --
> > Felix Gu <ustc.gu@gmail.com>
> >

