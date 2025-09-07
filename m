Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0545FCA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 23:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KIfk6frd70J09D632jkKiJEAKatZHG4CbE7Z7DikGFw=; b=3o4nW4mGNB3LB5Kzcfgi8+HQ/e
	F0eVvA51JPZHgnPotf8ZGLeWtf59rB5VTEZzxKxxY34gEpFRPpviX201vyHb8vB3VKgWhpCS+f/Yt
	1YiVeJk6zSFrJXMZJmpY4opO3/N5qGGUUfLByLClxxs65HXVT7Dcll16vJQ/lR8Gx5a6rRHbShjkD
	H7tH0cxy/6SZKyT8t7znKEH5hUkvapVPpUNyfLe8QntfPxAxxinESGOPrc9S477LrqBFuby2+BqBW
	J2COzffnCm4dDwDi36/PXh6HaV4wfJ0njkSMyRG60zZN4yTW/QeBA+8Ksjgibbe1+0LBJzS+/TjrZ
	1UZRoUhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvP2c-0000000DPIB-0amO;
	Sun, 07 Sep 2025 23:43:26 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvOzm-0000000DOVW-1NdV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 23:40:31 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-628f29d68ecso224938a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Sep 2025 16:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757288428; x=1757893228; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KIfk6frd70J09D632jkKiJEAKatZHG4CbE7Z7DikGFw=;
        b=e9ZrDRmngL8yJHLQsm7weyJX8Wo6KE+NWEmWOEx+89y5KE07R5KrtUq/O7H30+gC4H
         +3JDZFX1JpYVG1YlvOkhgPJvGRI5fiHAmBrXFSfqkz3VJjQurzwGdPhzJCtgCo/KkBr8
         kRD0gTg9Mjpb2o9Tm51OZUhfl+QtrtzLx+AKLlTY+99nX42zledGY+cpqeXBTA+2IK9r
         Wa3KN2YE9CjcZQXZE6fvsy6DgSOcSqZSzxY0tn2UQCifjiq/lvkO3jsASDpw3CEyoixS
         4aIcDNS5JQLPMn3ZePbXK84dI8wmyLsjmXjbYr01529tA5rFhWdbgwz84wRIVkcJQ8VG
         ZFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757288428; x=1757893228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KIfk6frd70J09D632jkKiJEAKatZHG4CbE7Z7DikGFw=;
        b=sc4zuEc/QIMjMhLa1u+vvJavuw5p9rs1+Au/kiT1zfiPJvqH07HTR9lPvCGD9h5uYk
         FMGH8kCB15m8SmbMFracN/lJ0aSq7nAzarupU7L2GhXULva8qhZXL0/D1OlcGEdKGvIY
         wzspvm5OBaVVMkPr5DoOY9EsRPllVVtP+lgXWWrBxoLwCBYiiuhk9e8kdXVJRQyy0sg2
         0AzJyM81DCA2KY2FfA8wBJt5SycWR9nB8Ie9RDt0x/d1kAsr1f0jg5GhgU2YIYwuQda3
         /PZBZU0oSmb9KT5s/CNtH4Uiipm9rrbmgx8cQtWu46D86e4kQnHQjtwVQ2i4dSXwzvVW
         L6pg==
X-Forwarded-Encrypted: i=1; AJvYcCVs4bMC2bl1/a4UbQc4/+LkWmdN5xefkd8V9lN7nx2BcZIrpDPf1zNs2MDMYIBgKPxbB3Nluyapr+SIcbT9C8S9@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4rRVpoM5iDnhR2DRMRbA0q9KvBUMzTt01DGq80Ijp4QKTO4d+
	nItM0HAQrfvQ4bdvDiz2npHOokySbZ+6G9DyGpkgD5iDiF588cTW0ZD9vsn/G4JK4PW2z/b9aVj
	HpC0W7/1JFDzkFE67pzpYXfBG49t0IWo=
X-Gm-Gg: ASbGncu+jOruwJTm558pR29QlEA2cT2DG7jVxPHOTnD8NoVvQ5KyIc1LZPh7Q9tezsr
	M0FSDFFGhUVy6fQsFmMpsR6C+OpDQzU4vpsaTzGSC9KgwN5E/X+PvKEa8CS8jB4cpDSW17Cp8zv
	piSkE8DMay56BBpK72JJg1nX3fYzb04o0lEmHA2AQVnIAvw4W7iZlPxAN6OduwMqCwj05h5qQvb
	8aik7P62K4bNVHSI1M=
X-Google-Smtp-Source: AGHT+IEv+pfin2n2WVdDiraQ3MNCakbx7vGl4DkVZg1HBnMeIk2bI+gUQVWL5GKYVfsbA9kVROtbcfuFdcnsXhQHcEs=
X-Received: by 2002:a05:6402:35c9:b0:628:4ae6:3a4b with SMTP id
 4fb4d7f45d1cf-6284ae63f4amr2072920a12.1.1757288428117; Sun, 07 Sep 2025
 16:40:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250907102303.29735-1-klaus.kudielka@gmail.com>
In-Reply-To: <20250907102303.29735-1-klaus.kudielka@gmail.com>
From: Tony Dinh <mibodhi@gmail.com>
Date: Sun, 7 Sep 2025 16:40:16 -0700
X-Gm-Features: AS18NWDpPNk77PgRKeHvncLRxtTlmHzoOk26pQIt8CrbvhfVuOfOvCiOdgLhc0Q
Message-ID: <CAJaLiFyuKdkEg4yqqv2-_ZgBKqhZNU_mZL9nuELrmNYaDz-SaA@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: mvebu: Fix use of for_each_of_range() iterator
To: Klaus Kudielka <klaus.kudielka@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>, 
	Jan Palus <jpalus@fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_164030_373762_A810C004 
X-CRM114-Status: GOOD (  24.61  )
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

On Sun, Sep 7, 2025 at 3:24=E2=80=AFAM Klaus Kudielka <klaus.kudielka@gmail=
.com> wrote:
>
> The blamed commit simplifies code, by using the for_each_of_range()
> iterator. But it results in no pci devices being detected anymore on
> Turris Omnia (and probably other mvebu targets).
>
> Issue #1:
>
> To determine range.flags, of_pci_range_parser_one() uses bus->get_flags()=
,
> which resolves to of_bus_pci_get_flags(). That function already returns a=
n
> IORESOURCE bit field, and NOT the original flags from the "ranges"
> resource.
>
> Then mvebu_get_tgt_attr() attempts the very same conversion again.
> But this is a misinterpretation of range.flags.
>
> Remove the misinterpretation of range.flags in mvebu_get_tgt_attr(),
> to restore the intended behavior.
>
> Issue #2:
>
> The driver needs target and attributes, which are encoded in the raw
> address values of the "/soc/pcie/ranges" resource. According to
> of_pci_range_parser_one(), the raw values are stored in range.bus_addr
> and range.parent_bus_addr, respectively. range.cpu_addr is a translated
> version of range.parent_bus_addr, and not relevant here.
>
> Use the correct range structure member, to extract target and attributes.
> This restores the intended behavior.
>
> Signed-off-by: Klaus Kudielka <klaus.kudielka@gmail.com>
> Fixes: 5da3d94a23c6 ("PCI: mvebu: Use for_each_of_range() iterator for pa=
rsing "ranges"")
> Reported-by: Bjorn Helgaas <helgaas@kernel.org>
> Closes: https://lore.kernel.org/r/20250820184603.GA633069@bhelgaas/
> Reported-by: Jan Palus <jpalus@fastmail.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D220479
> ---
> v2: Fix issue #2, as well.
>
>  drivers/pci/controller/pci-mvebu.c | 21 ++++-----------------
>  1 file changed, 4 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/pci/controller/pci-mvebu.c b/drivers/pci/controller/=
pci-mvebu.c
> index 755651f338..a72aa57591 100644
> --- a/drivers/pci/controller/pci-mvebu.c
> +++ b/drivers/pci/controller/pci-mvebu.c
> @@ -1168,12 +1168,6 @@ static void __iomem *mvebu_pcie_map_registers(stru=
ct platform_device *pdev,
>         return devm_ioremap_resource(&pdev->dev, &port->regs);
>  }
>
> -#define DT_FLAGS_TO_TYPE(flags)       (((flags) >> 24) & 0x03)
> -#define    DT_TYPE_IO                 0x1
> -#define    DT_TYPE_MEM32              0x2
> -#define DT_CPUADDR_TO_TARGET(cpuaddr) (((cpuaddr) >> 56) & 0xFF)
> -#define DT_CPUADDR_TO_ATTR(cpuaddr)   (((cpuaddr) >> 48) & 0xFF)
> -
>  static int mvebu_get_tgt_attr(struct device_node *np, int devfn,
>                               unsigned long type,
>                               unsigned int *tgt,
> @@ -1189,19 +1183,12 @@ static int mvebu_get_tgt_attr(struct device_node =
*np, int devfn,
>                 return -EINVAL;
>
>         for_each_of_range(&parser, &range) {
> -               unsigned long rtype;
>                 u32 slot =3D upper_32_bits(range.bus_addr);
>
> -               if (DT_FLAGS_TO_TYPE(range.flags) =3D=3D DT_TYPE_IO)
> -                       rtype =3D IORESOURCE_IO;
> -               else if (DT_FLAGS_TO_TYPE(range.flags) =3D=3D DT_TYPE_MEM=
32)
> -                       rtype =3D IORESOURCE_MEM;
> -               else
> -                       continue;
> -
> -               if (slot =3D=3D PCI_SLOT(devfn) && type =3D=3D rtype) {
> -                       *tgt =3D DT_CPUADDR_TO_TARGET(range.cpu_addr);
> -                       *attr =3D DT_CPUADDR_TO_ATTR(range.cpu_addr);
> +               if (slot =3D=3D PCI_SLOT(devfn) &&
> +                   type =3D=3D (range.flags & IORESOURCE_TYPE_BITS)) {
> +                       *tgt =3D (range.parent_bus_addr >> 56) & 0xFF;
> +                       *attr =3D (range.parent_bus_addr >> 48) & 0xFF;
>                         return 0;
>                 }
>         }
> --
> 2.50.1
>
>
Tested on these Marvell Kirkwood SoC boards: Cloudengine Pogoplug
Series 4 (88F6192), ZyXEL NAS325 (88F6282), and Synology DS112
(88F6282).

Tested-by: Tony Dinh <mibodhi@gmail.com>

All the best,
Tony

