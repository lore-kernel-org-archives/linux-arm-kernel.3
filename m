Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E573CD4F2C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 09:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oIzgiaW8kA7BHlQhT2riBmgi7l2E1GpUatRNhNPxmqI=; b=VnGgMQHGPKy9XZQ9PfbE11edam
	cVRVNMReWTvAwxnq++O1CPAU3adL4kDVpYumvbwNDUbQF6mTh/MnRqOAztOMyZZTU+jPdy+1j4DIR
	Vg1qSBdpnrbxQ+FCYiIW0zwCmzH2xxzACqBGlF2qAMbEAmbs8ShkSlFyu0g0m1Tese2ShxBNZTAcq
	Rs4z2n3Yz+p8XgQ8/OLSEgb9HLsQHCWFGoknczsMiqtO38ilhlDao9EY4mmb95FavIG5S43tmD8tA
	Lf9IjIHX1zSJycEk6ciG0i/YSQAcd8t4C/2Wi4cCTLru0AyswswHkAwKw2EEcW4WwyqROjqtOHCo6
	6JAQfwig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXy5g-0000000Af5D-0p8X;
	Fri, 12 Jun 2026 09:22:16 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXy5c-0000000Af4a-4BzJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 09:22:14 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-4600cbb06deso458711f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 02:22:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781256130; cv=none;
        d=google.com; s=arc-20240605;
        b=cBiuuaX8agFn6AeYepHLRQZYEltTaT9azvlhxge6WVBhtcY65stVriP0krqmoWX8OG
         HAhO7IGdBTj6jk8/L8oMOmJ+3FwJx3ZAhMKuI1z6em8yC5t9s65eHOnQtUUzXuil4lRy
         dM07dxr7tEKqn/uEkVCaBbYlqnMrm4mCRk8vCvcyff2HSu5A6OMkVMkdocdYwxNT6j5q
         LYavss1XqjBTFWvCM81zRcWjyKXFwHGf4E9HseVDG8SJmoshcKfpl6LrYhETkW40MwTu
         qhq4g7iu7nQqPAAfmtaAtPVqBLHwjcQOtZ9Kzrpjn8Sn+WWMCiKpbnUVH1jYTfg+1h/c
         23fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oIzgiaW8kA7BHlQhT2riBmgi7l2E1GpUatRNhNPxmqI=;
        fh=wKR/XiQcsg8JQZOKPI5+gksrYfJfyCJJvmoKorFPYgg=;
        b=PJ8/3gHwHw51ma0+cDHQMDhxx3dvIq0NmAVM0/AWumulrfez3PKiDkEObT4d5rBtYG
         ZtL41p+0E0iY9TPG5SUDKRntWHwpruhrA/tu+GJhu3Zmmxmb3UTxr8Kt1FKY+hbh25ZF
         yocx9eGK9kvd6i8y+BvXH7JZfWaenC+m/s7NAolPg4pmIK73CvMTa3+JiwhQ086xvMzn
         lGaliMvl9+UlO3gWPVrhH1Yj0owzU7CsWnPu9cv1u8OO0O8jUKjq35HWxOWOQuKDYums
         W+WEV84ScOWAVmx7qPkOZgcFLODCeEJNfUj8LU7bPOnTlAAIVk4cmpTv7MB2MqLs0W32
         MhfQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1781256130; x=1781860930; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oIzgiaW8kA7BHlQhT2riBmgi7l2E1GpUatRNhNPxmqI=;
        b=RdtII3N0gUy+7bRW/NKv74hJ0lAbrYuEvJ3HF7QSFrfj86rOLagwTdfu+5A9s6mRa+
         KzPzSfZQE4Tyn5KkUE/H36wKBI9WYPIlm+o3d4AB9jdPdB0+tqrpWHo3vz+tdNMimeaS
         yJHddgVIqw2eF6S498VY+BWW00uaukTy5AhZVYKqA5pTgdzS/IMIDQBblVzobB8Ag10p
         pMjJqoHk067rynGH1+0+N9u06xy0nAH0Mczfp6sFNRuCLsncfqdiTDxPv6DWWlDokqAW
         P0wXxXSHAAyMBlmgda4qhai3/al1RlHoROu15OOcyNOFrqrhXORjARClsCqznnkP9wXo
         U3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781256130; x=1781860930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oIzgiaW8kA7BHlQhT2riBmgi7l2E1GpUatRNhNPxmqI=;
        b=k+/okV6r2h0sfrsWOhO45lVtLGh0YLry+9DKgyWCTTu6phIRHtsdKLG6GvWJIGsFMs
         2Sz+oyVfAYhsxH1yBGBAqQFA/ZUcEltOEE/XwYASIryyhXdnGL6uk0Thpqa1So3/lYVU
         yqTdYCh/XWPlJ4wYs4SqxTuxHq8ndnbAqEfWNT5LgdBgWtSx+1D66pjko+nepCayhZyr
         UwSjhXtTpO9uEhnHOth77BvBqWJBNxh6H0GvKNRzB1iyA92ZUgQ0+nO5Lqsx+70uPSsQ
         8huWOINzINYa019XKEC3PWQ1RaMkzGpEx02uhuKesRoTyFNUncrTd3vtaLSKxD4J6Zkf
         icvA==
X-Forwarded-Encrypted: i=1; AFNElJ/9kVBmb/enOP7JJep464OBfJ+9tFNPdTcBwZAxQ7eHFqxqSGbSu9tOUtB/fn2x+ggBVVCqmrirrQg8ENJr4lpc@lists.infradead.org
X-Gm-Message-State: AOJu0YzeWxtyFMOS7EUimDxsdu1OxwHFQZrwxGvUExMhdSY/6bHYpKn1
	C7PEw+R3zs/4jUDvVA9vxcdXIL1DoGuFtTrJ1WBlxZ++/RpP78jQyX6Xgik0diL5WHzB9RGmaWu
	is94SoBZWw6TgQ6jtMQzC01tnlivXPEtV0D2UJmTU4g==
X-Gm-Gg: Acq92OFbmBOQQhNYw7sVwZExq9ECqgf7AxIliKaYRY+uVGeXa9GReZw+TUHZtEfXHE7
	rUdnbnN6vdzrQRM0P58CZt4iJ/x7FSU40NpwatspqZqrz6ZmTxfujfjZIUS46ymFBumXG+9EPiz
	oNSd9CaphhmJc9wXp9bpFHD+0rJy/mN3wSIYqDaRh1h0Q7XQ1+6nIshquABIMS4k43aLYWO8o24
	+K8wZXuc23wb4mRnkO3iVB8HbiacXsZWs2BO8FdXvv7SS+3PorJbhG83hGPI8k2dFf6U8uGa8+W
	slW5RRQWFkdBCEB99ZNm4TL8T6aQ1wfKdupTJxoMKYd1BFixh8KBFSsP0o7vp5lU98ta
X-Received: by 2002:a05:6000:2488:b0:460:21e7:330e with SMTP id
 ffacd0b85a97d-4606cb2a8f0mr2904399f8f.10.1781256130239; Fri, 12 Jun 2026
 02:22:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1780929570.git.gregoire.layet@9elements.com>
 <af322e76d34ad504e0bdec470293a017b489cfd7.1780929570.git.gregoire.layet@9elements.com>
 <4839c31f666b612799a795bb47c884901fd2a903.camel@codeconstruct.com.au> <CAFi2wKYzUDY5Gis9GaHdqeYdv-orHB+gWfLXkJBgbxfbnRgorA@mail.gmail.com>
In-Reply-To: <CAFi2wKYzUDY5Gis9GaHdqeYdv-orHB+gWfLXkJBgbxfbnRgorA@mail.gmail.com>
From: =?UTF-8?Q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Fri, 12 Jun 2026 11:21:57 +0200
X-Gm-Features: AVVi8CdF5t19WVOCmH1FEj_n0A_RJ0z1s8GXW9OuHAYckfZfTIh9iO3nGukhqk0
Message-ID: <CAFi2wKanAH+ekKz3eVtdiz=pjEvmKwSh1XhE-Xo7p=CCiSWpEw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] soc: aspeed: add BMC-side PCIe BMC device driver
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: joel@jms.id.au, andrew@lunn.ch, jacky_chou@aspeedtech.com, 
	yh_chung@aspeedtech.com, ninad@linux.ibm.com, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	anirudhsriniv@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_022213_453868_AF64B92E 
X-CRM114-Status: GOOD (  17.25  )
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

Hello Andrew,

Anirudh Srinivasan and I have found that IPMI over KCS using the
PCI worked with the stock ASPEED bmc driver (the bmc driver in the V1)
but not with the trimmed-down version in the V2. I have apparently removed
a bit too much from the V2 , but that's not what I want to focus on.

This brings back the question of where we should put the registers
configuration,
considering that two different functionalities depend on it.

> It is also possible to put the SCU initialisation on the
> 8250_aspeed_vuart driver
> directly. This could be activated with a specific flag added to VUART nod=
es
> ('pcie2vuart' for example) on the DeviceTree.

Similarly to this idea, we could include have the necessary configuration i=
n the
'kcs_bmc_aspeed' driver. This could be activated using a similar flag
,such as 'pci2lpc'
or 'pci2kcs' directly. However, this would result in a lot of code
duplication for most
of the configuration.

The issue for me is that, two drivers configuring the same registers
is not a good idea.
I don't know how to do this the proper way.

I wanted to add this information because it could influence the move to a
bmc_device driver that configures both VUART and KCS, over PCI.
This would be similar to the V2 bmc driver, and I fix the KCS bug.

Thanks,
Gr=C3=A9goire

