Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FD0C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 10:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=73c+mDPTV3enfh00xFQH0rkQ3B7hoaOfs79Gig8ynL4=; b=lNL1epR9rG5FV9iGjG6adUbSk6
	DpDYi6wX3Mjk1IT5Pqezuoiwrbp8W7ch37SCMPIctO135Muu06OSZ/O40XyoTnY4aBBVHr5O42qf+
	TnGLTnTofacVJQu/W21WBozATZfIois4hGL8va8+XJN0qSG08hPQquR0DfbfEACrgSfIVB7SnPAWH
	npJ5hPO6BcFUx+TQC9zm9AbwFyBtl6dKX0fcC8CbYniBJt2qilqwUOqaqIrrg1pJzNuK45rMpYhgf
	BqAen/oO8/I+rrpGLxaRx1pQeRzaJnbX8AjZC1kATaeZILI/7WqlN5UuzR29fST3T7Os+9boPUiVs
	wRtX/1mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0HgK-00000008Y8t-1rgL;
	Thu, 03 Apr 2025 10:20:20 +0000
Received: from mout.web.de ([212.227.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0HFs-00000008Si0-2f0z;
	Thu, 03 Apr 2025 09:53:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743673965; x=1744278765; i=markus.elfring@web.de;
	bh=73c+mDPTV3enfh00xFQH0rkQ3B7hoaOfs79Gig8ynL4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Gs6IRBSP30nqBoVeW2m1+w37RYHjZS/3Xoi7eLsKGvsNN/bFKsw2/1W30XAJ8NG7
	 35iYnymvevIJdmOxl9z/QqsiMSX1XM6G8w9ZXvMGZaeKqANUyIR4BYNpaZ9UCSB/t
	 iHcfV+UpAoQGoCOiAiTZOZudkX1QO3Al3gWZRNxI4EBmSB3GW/B+bHPR33eL7pdrz
	 4KB2nI4KlqIHemmYmsI1yCPjvSXV8XKLhcyVkv/aPzTBVQFzlp1Yauh1S26j+QD/D
	 6R9l+iZSiseYo91FGF7OsGx2ckkT4a3gH8qs6PnPGHnk0QkFbOHvmFZKLn/IaJdfV
	 EvoylHTGYio9O0ZV1A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.50]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MgzeZ-1tSZWq0xRd-00ZikS; Thu, 03
 Apr 2025 11:52:45 +0200
Message-ID: <41f9ad4b-382c-4945-82ac-ec38bee87937@web.de>
Date: Thu, 3 Apr 2025 11:52:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Henry Martin <bsdhenrymartin@gmail.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chad Monroe <chad@monroe.io>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Peter Chiu <chui-hao.chiu@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Shengyu Qu <wiagn233@outlook.com>
References: <20250403065251.64749-1-bsdhenrymartin@gmail.com>
Subject: Re: [PATCH] wifi: mt76: mt7915: Fix null-ptr-deref in
 mt7915_mmio_wed_init()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250403065251.64749-1-bsdhenrymartin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rMLkyUnskGPkc7CWGHQK0eH2zwgXWMQzE9a9IajwH62GgqYqjvN
 tGX03ua54yJuhNQ3KNuKe4f58fK6oBxHaVa6MKzEKMld2Y1jFlSDVX0epXnx52t3W364gkR
 gpLuVOGXzmiZqoBK50Wmd7cDVqWfCgXtsb+DzO775fp9ap/PNy9wee3eIPMcOfNMUL2CJ0R
 70uZfgZ7z3xr42aY5m8UA==
UI-OutboundReport: notjunk:1;M01:P0:pD0NSjZ9QWw=;/baeS6cvg/lHM2Kyl7abZ4oanhf
 o+3hFID+PCwZrrDLY26nD2hdcwEFUmUrq+z7MtMNKtcchbTSfVyJR2SdFujvBcOnBdqJpwItV
 l6nxkTz3601pODWIPaRYRLAgQRQ1SxietJCd8fRjcNcJXfwrHlh0+xRdfCrXqXK79DMii6rd4
 JzpK7hEgQW46dqrOAHJrjTmmC177feCJVktrA9t3PRxQbKBBZXlcCeiD+1htQi3NjgBxxXBBd
 Pl4LYjdbclzx8HRdTXpanLfHWW3EseVrHr2U2q1DQoOXZblH0tApHhdX+J8gQF9olLb8p2DP4
 qRdD0g3nL3siaQHEz6jWN+sCBjYt/q75VmyJCPDdALV+ZSUZp9J8tI/TNRL5iPauLwcNE9kFB
 wmTf2ukFtILVy3kcULVLWWIZjq0DCmKrj+bc0v1n2z4pDxIjulbGEDBTtKrHoVxH7HLtg4Z70
 kgdD2CJmoglxs2pMmkAz50wDy9RabVbUVllKVfM0Wkcb428cNIu+q0vBIe7L2EdSPWXF0FkXI
 FzGrJbd1chORjvbLAGntd/AEjDsT0J0uQl9Ic+mKxudBP7GVLmBv4+CkpasZIYHDtqYymUTwy
 qUsfwoKDNmOEzhRRqGiZxVpsMhfgCjdebxXeRnNHKgDSXoX1RKgMClBM9riDjvqGCsGKJXcxj
 fKLIlKQ7m+QM2UeGuoKLB9GAzQzUktce7+x61fF0jngx6Gm+kGYNzIL6aJfWFdIPFwSzhSG3Y
 MwRJopsdiBX8JkunzqTyx69jd+hQN9yf5W9xW6hXHX/t9YZvYy2jYzcYYab44bqmFYEwXpbqx
 /wUH+azhxuYEUtySNf+asyfA9OR2C0dJodcIIPEn4YwLjoow9xQBY0dO5Cfxe4OGL74ZCoTM2
 H4tfiD2VMZ4Eps7EF+Q2DlAlw/i+T48V5ROTnYkN0XJGoz+DwyJh/sXsDL9EV4M7bII1Hkezo
 G2WuX04Lkn32+jSzYqHmGhZRgIKiYngquinFFOFSbdxWhOoHJqzdmrS8+0GYtG0sq5UY/2Cjr
 wWk6Z0PjGQ251rh2eDyiCEc+pmIjDjBKtZkfMdamAhOTM7NW+mqxUCqxmRZNIba8U9rqFx8O0
 v+JeW3QBNAZiO6KdV4SB8y+Bi7/Vr65aHE8I9HHOKPfA1hYiZRsQWaDXlyTfHGSqYpM4mUMUz
 CYMj4uZWKKOFzV0ZtQY3VyrhACbVAuKShOO5VYuF9QsfApLxKppxZDRvURE7CZ4GvGwWCjIS0
 HcqO78XXQ/rLAQJJxI1ahmnbMoNFgnmKCwuPY8idCZ5WMpfwZqJmfUOMqO760x290xE9vhuhf
 ilVIAg7of4C18GB138dvksDDgZTQxi6K91vC5ZbUMUsVWABdT6PMYOOyqvE03kcWkbW41Ml+o
 JpDDHeWMZQfcDn44YhkLu6Xe6ZgXS2n7IDkzXo6Yx8tzkE1g4D9dkJqP5uiWPUyRv6ewg2f/I
 AkmhkbJXtI06dD5n6YQ1tOz0fR6OTIaf3nzgKEAu6xfnQhacf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_025301_063436_D5FE6269 
X-CRM114-Status: UNSURE (   6.52  )
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

=E2=80=A6
> Add NULL check after devm_ioremap() to prevent this issue.

Can a summary phrase like =E2=80=9CPrevent null pointer dereference in mt7=
915_mmio_wed_init()=E2=80=9D
be a bit nicer?


=E2=80=A6
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
> @@ -651,6 +651,8 @@ int mt7915_mmio_wed_init(struct mt7915_dev *dev, voi=
d *pdev_ptr,
>  		wed->wlan.base =3D devm_ioremap(dev->mt76.dev,
>  					      pci_resource_start(pci_dev, 0),
>  					      pci_resource_len(pci_dev, 0));
> +		if (!wed->wlan.base)
> +			return -ENOMEM;

Can a blank line be desirable after such a statement?


=E2=80=A6
> @@ -678,6 +680,8 @@ int mt7915_mmio_wed_init(struct mt7915_dev *dev, voi=
d *pdev_ptr,
>  		wed->wlan.bus_type =3D MTK_WED_BUS_AXI;
>  		wed->wlan.base =3D devm_ioremap(dev->mt76.dev, res->start,
>  					      resource_size(res));
> +		if (!wed->wlan.base)
> +			return -ENOMEM;

Would the function =E2=80=9Cdevm_platform_get_and_ioremap_resource=E2=80=
=9D be applicable
in this else branch?
https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/base/platform.c#=
L87

Regards,
Markus

