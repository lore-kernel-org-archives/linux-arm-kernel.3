Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B411CD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 00:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2eXLg7+UTj+6M1socVzRC9ljt9/JbCjjIXt/BSPxboo=; b=vRbZy7C7saCvN/Y2Q//UgWD6xE
	clUR4PE67ifUnFEadtLORdrJwVdcQhiV7wNumguHGxbbtEEgOSQfpLBNEBQoCgak6Z4Mst/SMqHco
	BbRV/0/uFGPywJnChR9vK4EDu+heYESRMneO2mQ+8K4IDMPNw3X3umXCVjeefWDeI4lCV0+jPz7D6
	UJzPE73J3uJ5LZ9vYPyKpSkNxcTz88pP6GxjyTQtd1zrUac8kl8zDRemeiHpdAYllW6RC1RfrHa7L
	V8i/KH3vKENGrEcr1L0mrRZ0Gz7y0RDUxOo1QfLzqspxImfmwBSA56VAdcaFPLdTtbgB5PTZA+Qpk
	kIQG3mcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUwE8-0000000FySY-1tEQ;
	Thu, 04 Jun 2026 00:46:28 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUwE6-0000000FySC-0TZH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 00:46:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1780533984;
	bh=2eXLg7+UTj+6M1socVzRC9ljt9/JbCjjIXt/BSPxboo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=CVv5ds54j2tEMkFa79CFllq32/Z8FIgSA/RsoPnNTkAtg8wb+SE4WQjpXhqatfnsD
	 K+d0MF5P96nBL4zxDgyvBPcpV395qpnRustt1HWYRUi8yy2XyeYPZh8AvhfmqV9jV5
	 SMCNOlWH1czQADzOIhgn6SWURqgHjoNkvd4Oo3etTPPn1bX7ylIN/Uvin56yWPN3R5
	 fdBKGur4lRUfUXdk99+h2GdZ10ogAAwWyOSppCgVEe17s2kYmGRbHPE8AjOYXBaAiO
	 /aU8AZ0tVpdHzQ0js0iwf0JdM3W+hb+GBAMzbixN+YCU6i3LA+6ihBoTgkEPh2kw30
	 dictAnWtyQq8w==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B9D7860087;
	Thu,  4 Jun 2026 08:46:23 +0800 (AWST)
Message-ID: <3b4fec04093d4f890a67df8b3d2e255b220d776f.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 2/2] soc: aspeed: add host-side PCIe BMC device driver
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: =?ISO-8859-1?Q?Gr=E9goire?= Layet <gregoire.layet@9elements.com>, 
 Andrew Lunn <andrew@lunn.ch>
Cc: joel@jms.id.au, jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, 
	ninad@linux.ibm.com, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 04 Jun 2026 10:16:23 +0930
In-Reply-To: <CAFi2wKY7ECbxSbtsO1W9KEKFET67yKg+C64jtQHFY05DRzhfKg@mail.gmail.com>
References: <cover.1780409151.git.gregoire.layet@9elements.com>
	 <a8e1396af1b6db38bab13383c6ba303e8427aefc.1780409151.git.gregoire.layet@9elements.com>
	 <ecc3bd49-829f-49b8-b3b1-4f16363ea5b9@lunn.ch>
	 <CAFi2wKY7ECbxSbtsO1W9KEKFET67yKg+C64jtQHFY05DRzhfKg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_174626_352865_46EC1FBE 
X-CRM114-Status: GOOD (  15.69  )
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

On Wed, 2026-06-03 at 15:43 +0200, Gr=C3=A9goire Layet wrote:
>=20
> For the rest of the driver (shared memory, doorbell and mailbox), you are=
 right,
> it makes more sense to implement rpmsg or virtio than just raw shared
> memory binding.
> These are software-defined communication channels and not hardware-emulat=
ed,
> so they would fit better as rpmsg or virtio drivers.
> I took the SDK driver as a starting point without questioning its structu=
re.
> I have verified the VUART was working correctly with the shared
> memory, doorbell and mailbox setup removed.
> I can split this into VUART only and defer the rest for a separate
> rpmsg/virtio work.
>=20
> So I propose for v2:
> - Remove the shared memory device, the sysfs doorbell and the mailbox
> from this series.
> - Retain only the required configuration and initialisation on the BMC
> side driver.
> =C2=A0 This should mainly be SCU and PCIe device configuration but other
> initialisation will be reviewed to determine what is required.
> - The shared memory, doorbell and mailbox features could then be
> addressed in a separate future series, likely as virtio based driver.
>=20
> Would that be acceptable?

That sounds good to me.

From a brief inspection the driver also had support for both the 2600
and 2700. Something to consider is just supporting one of those for
now, and adding support for the other in later patches.

Andrew

