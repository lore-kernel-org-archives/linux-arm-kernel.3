Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A584C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 01:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PoRoAAkPPBuR69LGmDgJzLuMGmZ8psP041boRYo8zvU=; b=zi0jD4YVbFazgTY8O+WDDKYUgo
	t/BwbRMJ6eJVRbaaHh5XMM7eDlOrKEpCq7IHxAlYfrYUkB0pk67LcIa4wQwJ8fozjlCL4IBgBDj2t
	0Qt88Wh+x/Isx8GYEjC+Ri+A2NMODAf0wuHIB4TiqK8f71JeEonOB192heqoAIFLzzvPzTAnIuDUA
	ETwqzlMdpRnDnejEMM0fy4l+vz5YJlNwyqTjUFe2cRLZSDlQQvRRbSrzVbPRZVic98EccCUhq1+4u
	OdWemJQHF2oijr2g1xKhQeQFjIhhfZXUQ7H/rcCbw0BjST1tsd90CHO/jta3Yi4eP/rDK/ERzbmZ5
	NML5a0Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuLsM-00000004MSH-1iBJ;
	Tue, 18 Mar 2025 01:36:14 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuLq8-00000004M3N-0ggm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 01:33:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1742261633;
	bh=PoRoAAkPPBuR69LGmDgJzLuMGmZ8psP041boRYo8zvU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RgpdrTVAI0X/Bp7kAD0o3uQI+apgWXfXXglB+hBR8dgCNRQIG6CdgyvUrhjOjEnjg
	 9GdgnsQjosBOqJXz71WW3TgrVmdWnOIL48yhskDwK6idlAH/Y7IddHuo2smrcbVndQ
	 5kYYjX5+fZ3Js/lGbtH+LEHjGFeC6im5tuF7N6OSxvwS2ziPZkRe++0I4HW/Jiut6v
	 jOn3do/4O5CrQbkAfJlOnz2osaT0Ydh2EuWACE1uC2rTdLan8nrTpLG4oOiYfFkCsU
	 ZyqNxihU56U4b+PxXCThwfFDNON3zegoknyvxpj00jQwtQRBIr/clfN3MVcSpf/OvJ
	 GqqvwjTghX33w==
Received: from [192.168.68.112] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D6A6777BB4;
	Tue, 18 Mar 2025 09:33:51 +0800 (AWST)
Message-ID: <57f42b7d08b816bc1a2e25d7f5932c3b2166c074.camel@codeconstruct.com.au>
Subject: Re: [PATCH] usb: gadget: aspeed: Add NULL pointer check in
 ast_vhub_init_dev()
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Chenyuan Yang <chenyuan0y@gmail.com>, gregkh@linuxfoundation.org, 
	joel@jms.id.au
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
Date: Tue, 18 Mar 2025 12:03:51 +1030
In-Reply-To: <20250311012705.1233829-1-chenyuan0y@gmail.com>
References: <20250311012705.1233829-1-chenyuan0y@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_183356_399263_162595EA 
X-CRM114-Status: UNSURE (   7.50  )
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

On Mon, 2025-03-10 at 20:27 -0500, Chenyuan Yang wrote:
> The variable d->name, returned by devm_kasprintf(), could be NULL.
> A pointer check is added to prevent potential NULL pointer
> dereference.
> This is similar to the fix in commit 3027e7b15b02
> ("ice: Fix some null pointer dereference issues in ice_ptp.c").
>=20
> This issue is found by our static analysis tool

Which tool is this? Can it be run by others (me)?

>=20
> Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

