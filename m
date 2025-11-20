Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC23CF9C7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xddyj2kYoR4heGDWkbtFPSJ9q4h0bul8sTtvUXs9eYA=; b=PYloWRh/9Fr8k8gp5KYhlBUcvK
	ROyxgc4vccR7nz//pS4vMEDR/nQ26Db0Bm+YleapSdZD8IG/fwDfmcfcFHQJQI/gxVhDOQsLa2t64
	MEjsYxfdAE8HnUfGDFQ+di8mBaVAZtj85C1CS3KCNRJTP1M+jQ+4Y7qjCJbIxV/awWsOipqElMY6O
	A/VCoeMXVa8ZRiL3weymf78iajcXPwUPNILopG1VbqJTIXRhOzZRhUA2ABOSNLWICOJN6+l4tb6bi
	LbdvpCEJfU/LLOrCymlCZ1jTUDzOUJWQuqny4J5rH3VN/vAjI4UXP3LrIYvkC9vp77Zf0qt4N+ygj
	UqgADwEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8vl-00000007BtR-3Ru7;
	Thu, 20 Nov 2025 17:58:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8vi-00000007Bsa-03s3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 17:58:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763661527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xddyj2kYoR4heGDWkbtFPSJ9q4h0bul8sTtvUXs9eYA=;
	b=VD/lk/TSliZDY6/yxffMzwKDut0ZACKxwhX5sUeNYSi3GcX3i3X1p6K+scrnhjM51vkYKr
	xdr4xu0rq0rBTi/4xzCuSZnN4PgfVFHHrB2lkXHndNKRXlG3VkHWfKV+bcykpf3Q2EcFuG
	5EclaoRhP6PcurmeA1+vOGFuARWOHxw=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-X6UZ4MRFMMWbIilIOAM-ZQ-1; Thu, 20 Nov 2025 12:58:45 -0500
X-MC-Unique: X6UZ4MRFMMWbIilIOAM-ZQ-1
X-Mimecast-MFC-AGG-ID: X6UZ4MRFMMWbIilIOAM-ZQ_1763661525
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-89ee646359cso350345885a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 09:58:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763661525; x=1764266325;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FBAWQgLEjTxMhY3wdWptXKZF7ghZZcFHnbvHOBx3cmI=;
        b=f3gaEfujRRejjpCytV2p51ykKcTabGSop6WeuyxPj2DwT7cUOeqdIvjCTkv9jywrj3
         gDh6w29hTSlo7Qf0R8A1vkNprzkSQc7cucC9ReYRNicfDV12p2JcoGBfA7Ep7OlhvP50
         Bf8/H/5xL2wo3XiKfAh3z5AVzCqp/3E5q3VauAKWDf5XC5mPS0q2vdisxUjO4l7p4M0o
         17+APLZ/rS4hQgIjivsYTYILrx/DlH/zjROTkv2+GEKnxgtsPUugbh2j3YXrwxgFSMfd
         XhngZBkVxGgDMnMGfG1dTcnDNB6CFgidWmTrFSok6nVvLOkpyWSC/+x+r1VSLlJNORGJ
         2fOg==
X-Forwarded-Encrypted: i=1; AJvYcCXWA89ABsJ2pbL3Ae/bNjLyd3Ew9ioJWS7Sevp4Fd0uK/X8Ig/VjKFox3uS2wZ9eQrSlSdpBjnywMMDbUuWgZId@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1gg+Go5pbKpe0Ar6ElJotnbcOivtZk1ubf22JLSFK44TmWpjI
	gKgAV6Wnwu8LGLj9V179ClqoWIvMquFeN9yHtm6gOoCw77yKIACedByIDLtghbIxWW4Noa+o4as
	3U3e5VwmEiWkYGjMpLMy0vP/8UdGRVHng/2+aewk/l0HkimtlGIGxo+PWVtQqsgvteuXQ9mKeFK
	8x
X-Gm-Gg: ASbGncsDdqNdqHg+sgUprh+89czI2iSfe5xcfT1SmjopaVbMv/Q8FFb8pYWIugV1zYG
	Pb7zwp39pvcVnZe4HGxlgZd2Z5AD9DhD70OoEhXmZKpHrZgJB3iPNHVo2U07FKa93osFnPkQDnt
	KjXcJ3qocvH0S4pE3FijsCZ4D6upf8JptnPCfaAJNJZ8LUrk8Gvj5irtvhd/LIaIUf3nZfujPIF
	6B0il8kOqTOpECSdF9qS1eE3CSuzvbOvjGnqAbyR9conPciJp0VPK9mnQAn2lTT47gi17ECW2vG
	4DOPb1NViMia1NbuI8uVtYZybp/tBfehiGDKy2NAYj4CcmCE9Vv/jZqWNLmyNYoeJoICh3r83Ga
	HvXPrLbdIGbqzCh0zi8C2d84k1BquwDQ0oUd3uJe8nuHucdWF7TKaJUg7tkPY1lPl3AHDjLZYZY
	hj
X-Received: by 2002:a05:620a:29d6:b0:883:b565:1acf with SMTP id af79cd13be357-8b32749c608mr633794885a.60.1763661524992;
        Thu, 20 Nov 2025 09:58:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQjuYnyNUCtoiqgSWFXqZwfTOJ3YABSpke0OuFWsE6r3fNUq9NnSWQn2HnLmxFjKwF9Y5Cqw==
X-Received: by 2002:a05:620a:29d6:b0:883:b565:1acf with SMTP id af79cd13be357-8b32749c608mr633791585a.60.1763661524583;
        Thu, 20 Nov 2025 09:58:44 -0800 (PST)
Received: from thinkpad-p1.localdomain (pool-174-112-193-187.cpe.net.cable.rogers.com. [174.112.193.187])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b3293299b3sm200510185a.2.2025.11.20.09.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 09:58:44 -0800 (PST)
Message-ID: <73a0863a70d558efaf29d6b988f3fec6312a22a9.camel@redhat.com>
Subject: Re: [PATCH] PCI: host-generic: Move bridge allocation outside of
 pci_host_common_init()
From: Radu Rendec <rrendec@redhat.com>
To: Marc Zyngier <maz@kernel.org>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Bjorn Helgaas <bhelgaas@google.com>, Manivannan Sadhasivam
 <mani@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof
 =?UTF-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>
Date: Thu, 20 Nov 2025 12:58:42 -0500
In-Reply-To: <20251120113630.2036078-1-maz@kernel.org>
References: <20251120113630.2036078-1-maz@kernel.org>
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: x49QLmqo-kJOHi7VgzcqqN92WsFdJ2IRymwY50-_YQw_1763661525
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_095850_124919_F344E312 
X-CRM114-Status: GOOD (  24.33  )
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

On Thu, 2025-11-20 at 11:36 +0000, Marc Zyngier wrote:
> Having the host bridge allocation inside pci_host_common_init() results
> in a lot of complexity in the pcie-apple driver (the only direct user
> of this function outside of code PCI code).
                              ^^^^
nit: s/code/core :)

> It forces the allocation of driver-specific tracking structures outside
> of the bridge allocation, which in turns requires it to use inneficient
> data structures to match the bridge and the private structre as needed.
>=20
> Instead, let the bridge structure be passed to pci_host_common_init(),
> allowing the driver to allocate it together with the private data,
> as it is usually intended. The driver can then retrieve the bridge
> via the owning device attached to the PCI config window structure.
> This allows the pcie-apple driver to be significantly simplified.
>=20
> Both core and driver code are changed in one go to avoid going via
> a transitional interface.
>=20
> Link: https://lore.kernel.org/r/86jyzms036.wl-maz@kernel.org
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Cc: Radu Rendec <rrendec@redhat.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Manivannan Sadhasivam <mani@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Wilczy=C5=84ski <kwilczynski@kernel.org>
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> ---
> =C2=A0drivers/pci/controller/pci-host-common.c | 13 ++++----
> =C2=A0drivers/pci/controller/pci-host-common.h |=C2=A0 1 +
> =C2=A0drivers/pci/controller/pcie-apple.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
 42 ++++--------------------
> =C2=A03 files changed, 14 insertions(+), 42 deletions(-)
>=20
> diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/contr=
oller/pci-host-common.c
> index 810d1c8de24e9..c473e7c03baca 100644
> --- a/drivers/pci/controller/pci-host-common.c
> +++ b/drivers/pci/controller/pci-host-common.c
> @@ -53,16 +53,12 @@ struct pci_config_window *pci_host_common_ecam_create=
(struct device *dev,
> =C2=A0EXPORT_SYMBOL_GPL(pci_host_common_ecam_create);
> =C2=A0
> =C2=A0int pci_host_common_init(struct platform_device *pdev,
> +=09=09=09 struct pci_host_bridge *bridge,
> =C2=A0=09=09=09 const struct pci_ecam_ops *ops)
> =C2=A0{
> =C2=A0=09struct device *dev =3D &pdev->dev;
> -=09struct pci_host_bridge *bridge;
> =C2=A0=09struct pci_config_window *cfg;
> =C2=A0
> -=09bridge =3D devm_pci_alloc_host_bridge(dev, 0);
> -=09if (!bridge)
> -=09=09return -ENOMEM;
> -
> =C2=A0=09of_pci_check_probe_only();
> =C2=A0
> =C2=A0=09platform_set_drvdata(pdev, bridge);
> @@ -85,12 +81,17 @@ EXPORT_SYMBOL_GPL(pci_host_common_init);
> =C2=A0int pci_host_common_probe(struct platform_device *pdev)
> =C2=A0{
> =C2=A0=09const struct pci_ecam_ops *ops;
> +=09struct pci_host_bridge *bridge;
> =C2=A0
> =C2=A0=09ops =3D of_device_get_match_data(&pdev->dev);
> =C2=A0=09if (!ops)
> =C2=A0=09=09return -ENODEV;
> =C2=A0
> -=09return pci_host_common_init(pdev, ops);
> +=09bridge =3D devm_pci_alloc_host_bridge(&pdev->dev, 0);
> +=09if (!bridge)
> +=09=09return -ENOMEM;
> +
> +=09return pci_host_common_init(pdev, bridge, ops);
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(pci_host_common_probe);
> =C2=A0
> diff --git a/drivers/pci/controller/pci-host-common.h b/drivers/pci/contr=
oller/pci-host-common.h
> index 51c35ec0cf37d..b5075d4bd7eb3 100644
> --- a/drivers/pci/controller/pci-host-common.h
> +++ b/drivers/pci/controller/pci-host-common.h
> @@ -14,6 +14,7 @@ struct pci_ecam_ops;
> =C2=A0
> =C2=A0int pci_host_common_probe(struct platform_device *pdev);
> =C2=A0int pci_host_common_init(struct platform_device *pdev,
> +=09=09=09 struct pci_host_bridge *bridge,
> =C2=A0=09=09=09 const struct pci_ecam_ops *ops);
> =C2=A0void pci_host_common_remove(struct platform_device *pdev);
> =C2=A0
> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller=
/pcie-apple.c
> index 0380d300adca6..a902aa81a497e 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -206,9 +206,6 @@ struct apple_pcie_port {
> =C2=A0=09int=09=09=09idx;
> =C2=A0};
> =C2=A0
> -static LIST_HEAD(pcie_list);
> -static DEFINE_MUTEX(pcie_list_lock);
> -
> =C2=A0static void rmw_set(u32 set, void __iomem *addr)
> =C2=A0{
> =C2=A0=09writel_relaxed(readl_relaxed(addr) | set, addr);
> @@ -724,32 +721,9 @@ static int apple_msi_init(struct apple_pcie *pcie)
> =C2=A0=09return 0;
> =C2=A0}
> =C2=A0
> -static void apple_pcie_register(struct apple_pcie *pcie)
> -{
> -=09guard(mutex)(&pcie_list_lock);
> -
> -=09list_add_tail(&pcie->entry, &pcie_list);
> -}
> -
> -static void apple_pcie_unregister(struct apple_pcie *pcie)
> -{
> -=09guard(mutex)(&pcie_list_lock);
> -
> -=09list_del(&pcie->entry);
> -}
> -
> =C2=A0static struct apple_pcie *apple_pcie_lookup(struct device *dev)
> =C2=A0{
> -=09struct apple_pcie *pcie;
> -
> -=09guard(mutex)(&pcie_list_lock);
> -
> -=09list_for_each_entry(pcie, &pcie_list, entry) {
> -=09=09if (pcie->dev =3D=3D dev)
> -=09=09=09return pcie;
> -=09}
> -
> -=09return NULL;
> +=09return pci_host_bridge_priv(dev_get_drvdata(dev));
> =C2=A0}
>=20
>=20

You forgot to remove the `entry` field from struct apple_pcie. It's no
longer needed now that pcie_list is gone.

> =C2=A0
> =C2=A0static struct apple_pcie_port *apple_pcie_get_port(struct pci_dev *=
pdev)
> @@ -875,13 +849,15 @@ static const struct pci_ecam_ops apple_pcie_cfg_eca=
m_ops =3D {
> =C2=A0static int apple_pcie_probe(struct platform_device *pdev)
> =C2=A0{
> =C2=A0=09struct device *dev =3D &pdev->dev;
> +=09struct pci_host_bridge *bridge;
> =C2=A0=09struct apple_pcie *pcie;
> =C2=A0=09int ret;
> =C2=A0
> -=09pcie =3D devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
> -=09if (!pcie)
> +=09bridge =3D devm_pci_alloc_host_bridge(dev, sizeof(*pcie));
> +=09if (!bridge)
> =C2=A0=09=09return -ENOMEM;
> =C2=A0
> +=09pcie =3D pci_host_bridge_priv(bridge);
> =C2=A0=09pcie->dev =3D dev;
> =C2=A0=09pcie->hw =3D of_device_get_match_data(dev);
> =C2=A0=09if (!pcie->hw)
> @@ -897,13 +873,7 @@ static int apple_pcie_probe(struct platform_device *=
pdev)
> =C2=A0=09if (ret)
> =C2=A0=09=09return ret;
> =C2=A0
> -=09apple_pcie_register(pcie);
> -
> -=09ret =3D pci_host_common_init(pdev, &apple_pcie_cfg_ecam_ops);
> -=09if (ret)
> -=09=09apple_pcie_unregister(pcie);
> -
> -=09return ret;
> +=09return pci_host_common_init(pdev, bridge, &apple_pcie_cfg_ecam_ops);
> =C2=A0}
> =C2=A0
> =C2=A0static const struct of_device_id apple_pcie_of_match[] =3D {

With those two nitpicks addressed,

Reviewed-by: Radu Rendec <rrendec@redhat.com>

And thanks again for spending time on this and creating the patch.

--=20
Radu


