Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B55BCD8C89
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 03:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JxgxsJuQ0c93NDW8hY2lkxvNwmM3g9PEppq7lXseJkc=; b=KKwczn9cZ95oluD2EacKZSqAa2
	oi1qYErwpSEGpudFJywRRQFgcz96hqcIL4FlNq1L46LMmv5TXr0GzAKFrodQud4Ss4vMf1MHiTFdo
	3uk5VOpYXl8tJaKc6ouFPj1ZfckIiGWEF01xHqaH7W7A+dSpuwOBVB2/sPDNS8HuxJiRs/l4pQkpk
	sPrtkM0Ws/RD6GsiT89JNpO03B0igPhH4wovfi/eB43CxhXhxvEv9pyPqKaSFkR/DFkOlg3x1YIde
	aTH5gLakbHD0IEGKfIeuts3Af7GSz0VvfUmDt/vBNo95pU1aD8dB1Rj0nlS8gog6HG27jBqIPA+q9
	JClZ/gJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW4PW-000000020Zq-0DSj;
	Sun, 07 Jun 2026 03:42:54 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW4PT-000000020ZR-2qbX;
	Sun, 07 Jun 2026 03:42:53 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:476d:c684:fe78:389f:7375])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C8156A6;
	Sun,  7 Jun 2026 05:42:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780803743;
	bh=WzsLg7Z9qC8yOvkZpd9qvN1UgwK29122xoI8S1PEp54=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=miBfHbCyZGRu8C4CWPM5CXmZr7rkKp8Nt6tsUAgU0jbvtrP5EMVYH8uy1bdPQ5jMO
	 NhLjW5jnH6W2q9CTj4T9drJDD87jSfI8IdkKGZQJc8nNftZIXezO4SLIH3LHGrKtw1
	 8/TY+OjIJYdmcWH3VTwnfQYgs79PFhamHUEZmmdQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260522-bcmpipm-v2-1-a3da66cbc9f0@kernel.org>
References: <20260522-bcmpipm-v2-1-a3da66cbc9f0@kernel.org>
Subject: Re: [PATCH v2] media: bcm2835-unicam: Fix log status runtime access
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Naushir Patuck <naush@raspberrypi.com>, linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Eugen Hristev <ehristev@kernel.org>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Eugen Hristev <ehristev@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, Hans Verkuil <hverkuil@kernel.org>, Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Ray Jui <rjui@broadcom.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Scott Branden <sbranden@broadcom.com>
Date: Sun, 07 Jun 2026 09:12:44 +0530
Message-ID: <178080376439.9570.13838570363760506422@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260606_204251_859168_DD86AA57 
X-CRM114-Status: UNSURE (   8.89  )
X-CRM114-Notice: Please train this message.
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

Quoting Eugen Hristev (2026-05-22 20:58:50)
> When requesting log status, the block might be powered off, but registers
> are being read.
> Avoid reading the registers if the device is not resumed, thus also avoid
> powering up the device just for log status.
>=20
> Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 ca=
mera interface")
> Signed-off-by: Eugen Hristev <ehristev@kernel.org>

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

> ---
> Changes in v2:
> - changed to use pm_runtime_get_if_active()
> - add corresponding put()
> - Link to v1: https://patch.msgid.link/20260521-bcmpipm-v1-1-3eba88d88045=
@kernel.org
>=20
> To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> To: Florian Fainelli <florian.fainelli@broadcom.com>
> To: Ray Jui <rjui@broadcom.com>
> To: Scott Branden <sbranden@broadcom.com>
> To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadc=
om.com>
> To: Sakari Ailus <sakari.ailus@linux.intel.com>
> To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> To: Hans Verkuil <hverkuil@kernel.org>
> To: Naushir Patuck <naush@raspberrypi.com>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: linux-media@vger.kernel.org
> Cc: linux-rpi-kernel@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org

[snip]

Thanks,
    Jai

