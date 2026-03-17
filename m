Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25E2FED9E5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 15:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KIQ6xtapd9/L6M5LvJi2i18CX9YCdA7sE0Usfp9KiK8=; b=QqubuTtkXMbr1kBaNBcI7bcLGE
	pmw2reb32ql3UptcIX6HoiQODXEsY0xkjspOX2pNosCOOp/ouSjBYdNd2QKPKDU+1+0O3DRocd3V9
	+CNBbdlCpqz/vI4LFIsI1jtCB40/MLZfcg/XUYClyxQodGDSjPT/dkYeIo8UJ0uP0yY436VdE92hW
	ddjm8KjDDE4HDtoGEWx8LaN5NIjEzyH3zV3ngY7/M2/d46cKrbtSMp7EhnBfTXYMmc4LiSXsLTJ+v
	m+hLOLcB5BsskbAcEEoyMZ8EhJpp7uQGSXzoX8Jcsz+zYS3MpplC48gnpYTdV+B2oIj5yB3MfRvY3
	HCR+70ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2WJX-00000006jv4-1zia;
	Tue, 17 Mar 2026 15:26:35 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2WJU-00000006juY-2iEH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 15:26:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773761193; x=1805297193;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=hYXp9a2NLaQVekWjZ+4yth845DCIClXSayYXXsM3Uyc=;
  b=SDGYmgmOhg/jH55ElbeQ/cDMqAiBtRH4GQABiLrJP2pEZV/MCmuaBVzT
   Ttuv6r1yDnG6KgEDonGsL9+8Ta2G9O7XDqk8oZ2bqkNL590J7R2PNMnlP
   1VI6uznO2i6IDBm81rdBpbr0schJhKaherrqsvSgxQrATQEYX/6CsCFfZ
   l2w1c+9wTpZEOdFLKA/7JeyraVmWXzSLIFAvVBx3XpRX8icFwUnUC/2/w
   jTmFXVCuDoz/PZte8odbVsTjKpXrzPiYOtzPuk+a7/P6EH809puqTgRYF
   hQPzjCk8OqJSDXLHz/XZsJiR3kw6eK1n0981qQOzHuXJJryirRyzmeIHq
   A==;
X-CSE-ConnectionGUID: BulBhPIQQQisqQ1nfgvb6A==
X-CSE-MsgGUID: 68x8ZTdwTw+r7lqVNxQE+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74681344"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="74681344"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 08:26:32 -0700
X-CSE-ConnectionGUID: ZST71INmRsKeCKApGPuKCQ==
X-CSE-MsgGUID: m12kp4T8QlWEYWIU2Ok2MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="245322289"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.161])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 08:26:25 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 17 Mar 2026 17:26:22 +0200 (EET)
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
Subject: Re: [PATCH v2 4/4] PCI: rpaphp: Simplify with scoped for each OF
 child loop
In-Reply-To: <20260317133322.266102-8-krzysztof.kozlowski@oss.qualcomm.com>
Message-ID: <b983a05b-2d90-2a88-4b60-49c6c5ee777d@linux.intel.com>
References: <20260317133322.266102-5-krzysztof.kozlowski@oss.qualcomm.com> <20260317133322.266102-8-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1763753626-1773761182=:968"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_082632_721549_2D4D9068 
X-CRM114-Status: GOOD (  11.92  )
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

--8323328-1763753626-1773761182=:968
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
>  drivers/pci/hotplug/rpaphp_slot.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/pci/hotplug/rpaphp_slot.c b/drivers/pci/hotplug/rpap=
hp_slot.c
> index 33ca19200c1b..67362e5b9971 100644
> --- a/drivers/pci/hotplug/rpaphp_slot.c
> +++ b/drivers/pci/hotplug/rpaphp_slot.c
> @@ -82,7 +82,6 @@ EXPORT_SYMBOL_GPL(rpaphp_deregister_slot);
>  int rpaphp_register_slot(struct slot *slot)
>  {
>  =09struct hotplug_slot *php_slot =3D &slot->hotplug_slot;
> -=09struct device_node *child;
>  =09u32 my_index;
>  =09int retval;
>  =09int slotno =3D -1;
> @@ -97,11 +96,10 @@ int rpaphp_register_slot(struct slot *slot)
>  =09=09return -EAGAIN;
>  =09}
> =20
> -=09for_each_child_of_node(slot->dn, child) {
> +=09for_each_child_of_node_scoped(slot->dn, child) {
>  =09=09retval =3D of_property_read_u32(child, "ibm,my-drc-index", &my_ind=
ex);
>  =09=09if (my_index =3D=3D slot->index) {
>  =09=09=09slotno =3D PCI_SLOT(PCI_DN(child)->devfn);
> -=09=09=09of_node_put(child);
>  =09=09=09break;
>  =09=09}
>  =09}
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-1763753626-1773761182=:968--

