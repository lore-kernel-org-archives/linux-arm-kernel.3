Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96409C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 10:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WEFboc1GBdXAA9WvCS/gR1Bseal3a2X9Ch7YA1eEJ9c=; b=Abep2vCcmJWsiOTzGj67x29788
	ITqCG8YaACCGM5Wlhb6s3bjOeUT7q1ro0K48us3FT/mAtmorM+h+SiHbdvD5cY3MjGRiZ5EeDnuNG
	eDZsxWJD/8SyvrnmG70tuNnx45mE0Hoo0u5egHbi9V3yzO8OD93qJ4LIQi0XzJnLK9HEdbkEZ3oBa
	dH83PVKKA8VbnuGHDbmXCNZpwpbqAM9JzwL/tCRw2IpEgqITQxN+JPptQ/cDdYQQaRgvKL0BmJ/kJ
	iUIlABaGBQj56St3wXLZdjed2JWsPoElnli9Jq0/CL0m+Jjke2g34wDAoB5pRJf4ivJg+dSYcCwDg
	qBnlUoyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7WxA-0000000A6b3-2Xvl;
	Wed, 23 Apr 2025 10:03:40 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7VyT-00000009r5b-3VsX;
	Wed, 23 Apr 2025 09:00:59 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1745398840; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lJgtMKWq6xOI2o+ZGlMrwdS+6YwQAEaoTr+OpCcs3SsgWhfkFSoYGo4WfwVmOP7yrxOzt3bzhqVzTiSvjWZEQRefHWqFyNnRek0HNZVH//8pR0I5F0dKJU8CDfFfxxyQMle4xPSdfvr2rKqiyIReDVtLg1O5gaM/9fND2U7PSr0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745398840; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WEFboc1GBdXAA9WvCS/gR1Bseal3a2X9Ch7YA1eEJ9c=; 
	b=fDxNID6hxMeFZwbYw3XmYCdjCo4XiAwqJNnJMuQF0BRMfLX1PZI+/lcavXFF6SPEq0CG4B99bL4K+vkvs1m3yO3hh9uoVjrofBimXuV8t7E6pBctA7sMnVmYxYMxhOHmtkdVaq2o5OsX6oAGLeIJ/asJ74NbS+6kfabC4GBzsBU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
	dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745398840;
	s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=WEFboc1GBdXAA9WvCS/gR1Bseal3a2X9Ch7YA1eEJ9c=;
	b=IbWWLfS/sg+vpsYTKWwUVP7NyM1PPY3FDC8FI4iQNoi6cdadB7tvM6bL0iAxRJ10
	2NmHHH13frKbxF9EsCc8sSbTBg+/BDwM1KtWkaVsAzIZPF7nwQ3LwWyitf1YJjrxzwV
	0XsOMq5q1G568jkdPRLpg+w8j9k5wneSYVCjY194=
Received: by mx.zohomail.com with SMTPS id 1745398837671692.7273249531318;
	Wed, 23 Apr 2025 02:00:37 -0700 (PDT)
Message-ID: <ce7a0b320ed41ebe76e9908ab3eac3780fc56764.camel@collabora.com>
Subject: Re: [PATCH 2/2] net: ethernet: mtk-star-emac: rearm interrupts in
 rx_poll only when advised
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,  Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>,  Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,  Biao
 Huang <biao.huang@mediatek.com>, Yinghua Pan <ot_yinghua.pan@mediatek.com>,
 kernel@collabora.com, 	netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Date: Wed, 23 Apr 2025 11:00:31 +0200
In-Reply-To: <20250422160716.71a16b1a@fedora.home>
References: <20250422-mtk_star_emac-fix-spinlock-recursion-issue-v1-0-1e94ea430360@collabora.com>
		<20250422-mtk_star_emac-fix-spinlock-recursion-issue-v1-2-1e94ea430360@collabora.com>
	 <20250422160716.71a16b1a@fedora.home>
Organization: Collabora Ltd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_020057_952709_8FE5A35E 
X-CRM114-Status: GOOD (  15.60  )
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

Hi Maxime,

On Tue, 2025-04-22 at 16:07 +0200, Maxime Chevallier wrote:
> Hi Louis-Alexis,
>=20
> On Tue, 22 Apr 2025 15:03:39 +0200
> Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com> wrote:
>=20
> > In mtk_star_rx_poll function, on event processing completion, the
> > mtk_star_emac driver calls napi_complete_done but ignores its
> > return
> > code and enable RX DMA interrupts inconditionally. This return code
> > gives the info if a device should avoid rearming its interrupts or
> > not,
> > so fix this behaviour by taking it into account.
> >=20
> > Signed-off-by: Louis-Alexis Eyraud
> > <louisalexis.eyraud@collabora.com>
>=20
> Patch looks correct, however is it fixing a problematic behaviour
> you've seen ? I'm asking because it lacks a Fixes: tag, as well as
> targetting one of the net/net-next trees :)
>=20
I found the issue by code reading and checking if the sequence is
correct with my other fix.=C2=A0
It seemed the right way to do in comparison to mtk_star_tx_poll
function that does check napi_complete return code before rearming
interrupts.

Regarding the Fixes tag and subject prefix, I'll also add those in the
v2.

> Thanks,
>=20
> Maxime
>=20
Regards,

Louis-Alexis

