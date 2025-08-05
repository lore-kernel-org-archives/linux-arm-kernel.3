Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9406FC87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 09:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XoPxFNcgJAdEsyWsliRUUMh2F6p8LJA74DV0vc4jgz0=; b=TG9irlfZ2Ka1bEnszOuqnaCnEy
	B9b1qjjFVhwaXvhnZqOwhQBSsLGYfDC1uM+EJZZYh4Vy39hqSuV6JqC/hA5n5o5SSTaUATQTw3J99
	q1MHAIMZ41Q7kNn71oTDZ0IBIOg0rsJ8iXK20XK0UKKh0lYUD9Kgpylcjj/fO6sQ6RWtUkDmyRDFY
	i3mVxaOd7FbPUHItiwmxjioWY/u3Uew/WzPsgF4ht5OwIT0IAS/HR+4NnhzyRvQAfX8Tg4RG9ggc1
	ed1CvJZj83F/vknHcnvLo7KnejZK7E1T+IjJM1oKMXCnzfSgPi6kUjlKSO720avyvz6CCiikEnL7X
	iuApxKqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujDfq-0000000CJfa-2EG4;
	Tue, 05 Aug 2025 09:09:34 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujDDM-0000000CDG8-42Sv;
	Tue, 05 Aug 2025 08:40:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=XoPxFNcgJAdEsyWsliRUUMh2F6p8LJA74DV0vc4jgz0=; b=0AJXyO8ipdWn0DQG5vvehlul4J
	rT6iw99nglWoNXDFrqsorX1kPXe7qSddRSeNwmcwkbnDBIWFS1+F5bNXR3/EjdHvXOOI5pbllTwJF
	ENDybyQu5HAY/qfFgl9x8LIPgUwlyIMWIR3yA92I7HrxhIFA4i77bZz80XUlnqWo+cIIpULtJKah1
	H9Xe8mGj4v6+GLoo9i9Rnlp8WAge23Me5DBLTFw97KbLdgUd9PgZvp4ji4Sc/G9idpMH0AKObcEsC
	QLw/ONECJyeoYcuiFbatVCJFb4lxSjV+/lKhbmV4W82WuoGgO8dQFXtfaUoNQ10/APkKP6cl7F9qX
	07tsTzMg==;
Received: from i53875aca.versanet.de ([83.135.90.202] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ujDDH-0004kH-KH; Tue, 05 Aug 2025 10:40:03 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Detlev Casanova <detlev.casanova@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Miaoqian Lin <linmq006@gmail.com>
Cc: linmq006@gmail.com
Subject: Re: [PATCH] media: rkvdec: Fix incorrect NULL check for
 iommu_paging_domain_alloc
Date: Tue, 05 Aug 2025 10:40:02 +0200
Message-ID: <2196043.OBFZWjSADL@diego>
In-Reply-To: <20250805061833.3670085-1-linmq006@gmail.com>
References: <20250805061833.3670085-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_014009_033067_EABE6B81 
X-CRM114-Status: UNSURE (   8.47  )
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

Am Dienstag, 5. August 2025, 08:18:33 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Miaoqian Lin:
> iommu_paging_domain_alloc returns error pointers on failure.
> Replace the NULL check with IS_ERR to correctly handle error cases
> and avoid invalid pointer dereference.
>=20
> Fixes: ff8c5622f9f7 ("media: rkvdec: Restore iommu addresses on errors")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Going from the (static inline) function definition [0] to the
iommu_paging_domain_alloc_flags() function [1] it uses, the doc states
	"Return [...]  or an ERR pointer for failure."

So this is the correct fix,
Reviewed-by: Heiko Stuebner <heiko@sntech.de>



[0] https://elixir.bootlin.com/linux/v6.16/source/include/linux/iommu.h#L858
[1] https://elixir.bootlin.com/linux/v6.16/source/drivers/iommu/iommu.c#L20=
46



