Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3282DC55174
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 01:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=edLN34k9foZMVhZcUUtF6FHiGZ8AVNOJWI7MIXQI8QA=; b=YZVoy4rTxPCYIipn5T7ukOB+bG
	g8ZFPhwe6al4QG9RU5dMfN2W0IS4aGYLW0iubAaEA9fpLucaiiSta64PjQRu3ENiiuA8bSOTDQPRO
	eyTEThzl+G2nxGZmtBYsbJ1hHqDV1W0vJ5SBJw+6rqOffEvEFEzlgycoVt4VnMmH6tXhvWFRMX6BP
	898EF5eTbcWk4YbAcTnQ8qgGY5SMLHbtPWpvz7kZ5TkhuYXcJZsCU7BaQA0Zvv1oi0zG4h6Zbx185
	4+Y0hgtr/Ci/57Es0//Mt6HndicD8KQnYWbxHMw/NdPNVhOzua7DckO1/CbvPr3KxtVRo3L8y2tVK
	VJ/suP8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrmua-00000004lZA-3RlI;
	Thu, 06 Aug 2026 01:28:44 +0000
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrmuW-00000004lYB-2FaK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 01:28:43 +0000
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-97723f98735so1053269241.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 18:28:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785979719; cv=none;
        d=google.com; s=arc-20260327;
        b=kptQooB2R3X7kA2hRh1SuX2c/vp31XZ6ZW6kWAbn29RQ933P6GC7+IypZ3OAnhAkAR
         CASxvhmLaLaH27hJ5WwQyIW3RM+bgKfFKX3UABWyfRdpxP+ciiRmTx+Fwu2j+SkmLxxH
         Vgq8bcaZUdHv9wkrpzcet/9hvOBk7QI/vtJBcI6Rgg0CkJ+8rxlYl1ALScAf0R9wl0C+
         dEH5IIZH92CxtB1ociokDHyB5b2ku05koTp/sGuaThNLv9wKMY/cmsl8x0kAz/I1IFAJ
         o9l1a7xtGaiyT/lCiBebb1zmzEGQARpuCNXWFnijSJjWXfihy3trPCq+Xhdf6ILJtUnm
         sziQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=edLN34k9foZMVhZcUUtF6FHiGZ8AVNOJWI7MIXQI8QA=;
        fh=DIOeTZEUXV5NZbdoWIjhJu2lDE+MhqnqY9OhGRWAOHI=;
        b=T9GTcEQBVY3uPsQ5FG/dbvV0tq3TsoHnCL5v18k98shCi9JHHqwxlJMu9Cou2uys2P
         TXYNoPki3v9q0qkwA7lys+YBE78Fafff4TZSv6xiflbX8A7sq5r/eye8i3ixjQy8pJHa
         RKIBsPmgkck3lKCrlcVe0BYBYCnLLpZ2wY8zE1wuuior/SOy1NUm6BawQchIbEIrmGcN
         IK4CmAlsy16yKIVy8dFbPtBldkgoH+yh4Lnpk83BYc0R3pU1h/QFipCMeYLSgMzRbkpc
         DJLMjNH2pfResTlEOjsJm4HmPtgYbIQCx4N6VDB/FBJGq6lBo6oUN7BJ0mgfVLDusHO3
         H1rA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785979719; x=1786584519; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=edLN34k9foZMVhZcUUtF6FHiGZ8AVNOJWI7MIXQI8QA=;
        b=ZJNrCzlIh72lBO6eOniqFCAQFgB6MuSURkMRwUGOW33CLiqPPw7NpeXd3MrqRHB/My
         tocU/veVqa2J6qRcR0CX9d7wJ5EZ6NIkFCZRKTIFrkcJeUdNRHvS8hxp9yzBs3E23XoS
         Ob47w6uHkqUacZTgI/rRVkJva2G5v/hDhSL46/9eynIqBbgvvgxnT7KWe2w+mI9Al1ra
         fp9J3T7xPuZ2rLjZjfyHqu5u+OtJNFx2kbR1SXnRJPjOizQBnZ/gc+ZbBUPG9hRY+Hg1
         OjsXBQExmbHFSzGbsW/veLfz70bDDqFHPDcPEzk0GdQm4dbaUxFm3l7WWLYzP9dJSSPG
         Zo7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785979719; x=1786584519;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=edLN34k9foZMVhZcUUtF6FHiGZ8AVNOJWI7MIXQI8QA=;
        b=U1aMTiIsIwmLWiBtzv6+3YgHuvOZLt1zPAcSvAe4gnKyTnRKps0QJ2I5JfSxaIVRby
         IsRdefG5wS5cQrpAMrpr0OdmN47ckUdJzce0U3F1iB3efMte5MPeMa5wxi9o6/alolA9
         8xz/rXWbiSbg1ARuMTJHMHrgq5onvw86KJJyTMdfNoVvn19dk4YsSBHmv82yDcSw24Ej
         LCF+TXTXf67oXu51DgJP7+ynfh8hLpdkWuPJee893PrSEfzbMrV50pXS22PZLMFVM0c8
         daRiImsLtWRl1frZJkyklWoIk2A7BcA4IHpn4HbejmYgu3JlD8/X/qkQSdmSbF245dk/
         n4JA==
X-Forwarded-Encrypted: i=1; AHgh+RofZewPg2z3HbCL+0vGa9Agb8JpW8rU38qdctC1dHVoX8D7Hpkjo61cMwoHLVnnvOoBxrQuLEiG+wfAuqySq8uk@lists.infradead.org
X-Gm-Message-State: AOJu0YzkDTTQ0S+MUcY1aLyKpBtARv0hwxbbwCVYokQ7uv+gPQakk93/
	3yGhBeiY5FMhN3q7ESPfdoAr7RqqgXq7UoIvVPHDDlf0ueZz0p45ifdQ7qUl28Moe2quWgOr12E
	N/o4xoOhZs7DaO0PsZ9W3w/0yKmAWYF4=
X-Gm-Gg: AR+sD12wS2O6nFl/kWTxXG5JF0livyh2XuNFPtasEScqC2Rg9vx3fkzkheCLm7jNQC2
	aB/OFr4wr7XMui+WULRjZXgA8do0QFCNJWBg064GSRC1WHt23H4vkW/ahhTXsd514KnKZCTROz7
	1qRtibhkhPEaoHNfTd6zpWXLQuJFgkGbYtwd4QIPOLiB2/WGLnWXB1FZna9MBUxbZCOyp1EHhKn
	9woGQ9MgaBt14NpjBollHavgb1A4s+QtNe5vY1XhgQgOK1rte1t1PkNB3Wc62scf2yFHssP2AK3
	WZvv7BCZplBINMNrOuGtlNFs4ZYAGjO0xIgjHDsPWCRIPFgP/np6LY9wNlsgOXvvuQpv/PJGJe4
	WEXW8bO6PsNvS0qiQDBoUI2Tu921UIhs1cceltewCy4KUoWdh5eCak9G9tNsGOFicWC8uDvgN8b
	S3vFR0qa155j6tWWPywA9u5oKxA9sA3XuqfneAa7iK8LApaxY=
X-Received: by 2002:a05:6102:5689:b0:739:4fa1:50aa with SMTP id
 ada2fe7eead31-760e8f3596emr3241387137.14.1785979718818; Wed, 05 Aug 2026
 18:28:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260804-submit-acx00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com>
 <20260804-submit-acx00-of-dynamic-v1-v2-8-3eef49ff1d8c@gmail.com> <30bab755-3356-4d4a-a939-8488aa487874@lunn.ch>
In-Reply-To: <30bab755-3356-4d4a-a939-8488aa487874@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 5 Aug 2026 19:28:27 -0600
X-Gm-Features: AUfX_mwRHCzyF7gAfwi_ObKJnDFQfjNsCJSXem_hxMypqW9gycQbdES8PR3dd9k
Message-ID: <CADvTj4r5y7ME1jb1OxnvjXoQRhpnQq1L=QgdUE7ESNgS2jzTBA@mail.gmail.com>
Subject: Re: [PATCH net-next v2 8/8] net: phy: add X-Powers AC200/AC300 EPHY driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lee Jones <lee@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_182840_583389_C6C1EB40 
X-CRM114-Status: GOOD (  17.28  )
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

On Wed, Aug 5, 2026 at 6:38=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +static int acx00_ephy_disable_eee(struct phy_device *phydev)
> > +{
> > +     int ret;
> > +
> > +     ret =3D phy_modify_paged(phydev, ACX00_PAGE_1,
> > +                            ACX00_PAGE1_INTELLIGENT_EEE_CONTROL_REG,
> > +                            ACX00_PAGE1_INTELLIGENT_EEE_ENABLE, 0);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return phy_clear_bits_mmd(phydev, MDIO_MMD_AN, MDIO_AN_EEE_ADV,
> > +                               MDIO_EEE_100TX);
> > +}
>
>
> > +
> > +     /* Set the hardware default before phylib reads its EEE advertise=
ment. */
> > +     ret =3D acx00_ephy_disable_eee(phydev);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret,
> > +                                  "failed to disable EEE\n");
>
> If the PHY is capable of doing MAC based EEE, that should be the
> default.

AFAIU it's only capable of PHY based EEE

> Why clear MDIO_AN_EEE_ADV? This does not stop the user from
> re-enabling EEE for this link mode. phy_disable_eee_mode().

I think I was doing this since I was trying to align the driver defaults
with the vendor driver defaults which disable EEE entirely.

>
>         Andrew

