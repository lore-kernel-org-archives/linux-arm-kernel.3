Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4067AFED9E5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 15:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/l5us1DzDkOOEZxIUdfNfNp9iE+g2IxdTh54cegGBx8=; b=N89J5GGZw0wbeysXCE6a3IWsjQ
	5AZA8NjwSt7uc3xTYzqMqiXi+Pc076+x4Z09xR4xji2szLoEdDT3QxJbV97LP5YuTcCjcIj/78MTL
	KkDbfiW8ybPxAHS85jcMjOp5YANq3TVQefQthEpF8PhRVAmg0Yaj4Ue9HwAE/5XDBRq5OIO3kazJ/
	VewiYbMtsGCvP3gI3DWfoyorkeNFyytr8woe9cp9JmSZX/feZoxEh2NX8YupKLirVZDVM2V2QBKG8
	VyGe0zfHAxvSmfm9CharM0d3N77JRO0IeBkQHFoJzndhI0j/QiFFXfrJifFKr74r8V5kpP0BYHGvg
	MXSTBVAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2WJB-00000006jrG-0hHK;
	Tue, 17 Mar 2026 15:26:13 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2WJ7-00000006jqg-3lkR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 15:26:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773761169; x=1805297169;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=U6HAOSeXpFA2xVKYhwIX8W3T28VbdLC3tfuXap/m1NI=;
  b=HtN6xl4aYr4it3NjuFaeG489i9ZrDDKXUTlu70TNC4CcFY91y4Tvud14
   nNsZ6P3oV71EPAsi3jKjRSzxaIdPHi1V06z0d2D6U55YoAWfMlxnt+F4h
   1tah2oRrRhOy37WaWoi5pL23K7eOiCTc6UwFcKwFM6XosHpjtDFeqRBNt
   7W4g+lj+WS9GvaVXBqILznfsvvHzyrsQEqua/7X1/K9p/21de9+t2FKPD
   27juCPYvI170md538btTISXFiXn4x1DkpQSoiK3kPjL41OjYSSEFeqtVM
   fZ8JUPWXPwU/5SmKSZHo5/Dp6lzI4e8JYk/M1OoxqBHhMOlLKszPyU8Jv
   g==;
X-CSE-ConnectionGUID: 3lB1qrh5SI+/ZySkKP0pJw==
X-CSE-MsgGUID: 32CJSLvCSJagzO9iZCydeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="73814368"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="73814368"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 08:26:07 -0700
X-CSE-ConnectionGUID: RgYiXBrtSTSlzqFAWWH6Ig==
X-CSE-MsgGUID: MrSQlNn4RuOayo1ru5RS2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="221356702"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.161])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 08:26:01 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 17 Mar 2026 17:25:57 +0200 (EET)
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
    =?ISO-8859-15?Q?Pali_Roh=E1r?= <pali@kernel.org>, 
    Lorenzo Pieralisi <lpieralisi@kernel.org>, 
    =?ISO-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kwilczynski@kernel.org>, 
    Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
    Bjorn Helgaas <bhelgaas@google.com>, 
    Madhavan Srinivasan <maddy@linux.ibm.com>, 
    Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
    "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
    Tyrel Datwyler <tyreld@linux.ibm.com>, linux-pci@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, 
    linuxppc-dev@lists.ozlabs.org, 
    Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: Re: [PATCH v2 3/4] PCI: pnv_php: Simplify with scoped for each OF
 child loop
In-Reply-To: <20260317133322.266102-7-krzysztof.kozlowski@oss.qualcomm.com>
Message-ID: <f4a8c26d-99ee-2f12-ddcf-cda2aaf0cf5b@linux.intel.com>
References: <20260317133322.266102-5-krzysztof.kozlowski@oss.qualcomm.com> <20260317133322.266102-7-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-823548865-1773761157=:968"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_082609_949851_F4BA388B 
X-CRM114-Status: GOOD (  12.88  )
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-823548865-1773761157=:968
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 17 Mar 2026, Krzysztof Kozlowski wrote:

> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
>=20
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>=20
> ---
>=20
> Changes in v2:
> Tags
> ---
>  drivers/pci/hotplug/pnv_php.c | 19 +++++++------------
>  1 file changed, 7 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.=
c
> index 5c020831e318..ff92a5c301b8 100644
> --- a/drivers/pci/hotplug/pnv_php.c
> +++ b/drivers/pci/hotplug/pnv_php.c
> @@ -215,24 +215,19 @@ static void pnv_php_reverse_nodes(struct device_nod=
e *parent)
>  static int pnv_php_populate_changeset(struct of_changeset *ocs,
>  =09=09=09=09      struct device_node *dn)
>  {
> -=09struct device_node *child;
> -=09int ret =3D 0;
> +=09int ret;
> =20
> -=09for_each_child_of_node(dn, child) {
> +=09for_each_child_of_node_scoped(dn, child) {
>  =09=09ret =3D of_changeset_attach_node(ocs, child);
> -=09=09if (ret) {
> -=09=09=09of_node_put(child);
> -=09=09=09break;
> -=09=09}
> +=09=09if (ret)
> +=09=09=09return ret;
> =20
>  =09=09ret =3D pnv_php_populate_changeset(ocs, child);
> -=09=09if (ret) {
> -=09=09=09of_node_put(child);
> -=09=09=09break;
> -=09=09}
> +=09=09if (ret)
> +=09=09=09return ret;
>  =09}
> =20
> -=09return ret;
> +=09return 0;
>  }
> =20
>  static void *pnv_php_add_one_pdn(struct device_node *dn, void *data)
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-823548865-1773761157=:968--

