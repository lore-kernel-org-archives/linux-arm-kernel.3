Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE47C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 07:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8fmUSDAgYoEUGpnG4dyr2raLElAF9zIG7tCsXwnwAGw=; b=WgZyU+z/f873DFwcTpiHfG6Kul
	Bq+/vCWj9GKebWZ/qiwhip0jwfdbx5cUNedtC3V8tcfeQf/XDaUtSHKINf0h9KOX4ULCWMnj1GQzj
	CLmLNLMDAPzZqH9IbZ2OKyiNMM59GO97Lgd0+oDGS3YDmsYe/3Eb5l8JYNhz1MZvhhICg+G5f9TK+
	gX1gq3SkX6A5JjgGJs4jYLsN/76Y+nv8b1OOwlzcH8DXOo0FlUruduqEGvH8pvz/VIalj9aBpBjmE
	eWxTfILj8I8xE/E32kQ3mPeqo81w1s9vEGisec4xHwq/pVp+gwKbJhHE7xBtnG42QqPcaHmJMSAUT
	tVnd7baQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB5PY-0000000HViz-1j8m;
	Mon, 28 Sep 2026 07:04:28 +0000
Received: from mail-lr2-x0e.google.com ([2a00:1450:4864:38::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB5PV-0000000HViV-3DSU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 07:04:26 +0000
Received: by mail-lr2-x0e.google.com with SMTP id 38308e7fff4ca-3a65a351692so15031231fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 00:04:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790579063; cv=none;
        d=google.com; s=arc-20260327;
        b=Msn56NBa2DP64FICFYA/Bhg6Zorm9enl0mhrIBt95WYPad3CSMikxEeMXM8f2E7H53
         CZxgN4YaUuePcrK2QaUP+Yf9RkEQXL5xUrAD3gAO1fLh0rBdN0j6a0ItQjFVdxypHqzD
         1OIfle6Ca51tTVWGEmsB7z/I57LhlUmWa8Z0SlAbtPg6Cas6j5Xh5QcqI8ZuVvdMh0m5
         YmOibK/BGarAinGbW/Ocw616SCPuTgGAYjNkfxthf98g9aANmpqyzG64RFpZuT8QoAIf
         CKnvn54CP4mEDkh2U5/3nYq57zbJg/ph/UE07L94xb7tCofKEDPow2v14IVeHNEUfRFm
         W4LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8fmUSDAgYoEUGpnG4dyr2raLElAF9zIG7tCsXwnwAGw=;
        fh=OCpo4EgvnO/m/shz2db5iMgqwnAVOBIqGZ6RJlAatdA=;
        b=cuGpqAtAvZ2t/mu7ojNv3g3D5hJTLyvZzHwEqAJCSx4mc749bqMlHT5VSQIFsfmOZm
         R6phX7AI7HfxdkyfcGtdMurf1Axx6E8Bp8vV0ZYaaproMxTS2+X0T4HLilljF8BnYpxd
         iUYETm4FLmJZDOWImESAyC5XYcj2F2MNHF7Lzt6uJJZrJ77DPKd3/bTqmSzYKR5yJGZc
         YLkDmC1Zoz+W5x2iK5wqeT1fwWRkOXakVZ01W6+aOVlb4JIPn3NZDYE/yULuLrKgp2sd
         LWVrZqHCAAN3sjSOYSj0Be7fSBXSvr1w3JdtcPrFWPW3Ta++9QG5aihElzsVv8r1vfDx
         4Atg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790579063; x=1791183863; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8fmUSDAgYoEUGpnG4dyr2raLElAF9zIG7tCsXwnwAGw=;
        b=X9MJK0EOVF67w0AX+VyJZq8UXcEHrj544jlDwZProkPc18hKtRh8u//Oq50uvGioE/
         Z5kNwg71mk7tJv0H832zh1wGMwMzzycvpcjgpm6Pl9p1RVPC9esijaCtoPSQDg+URRmr
         /6meYEZpmYxffXNnh1aqpzzm04+5FwQCaFs185p2Zt31VEfB2ZFhzAUvWJBiugBaTlr3
         N9mBWYdB+ihd7ewFGisbuQG0TJPvemYiKVRDkZeoKyPj44Ca3Dyh40XCZxgPLUrFMaXv
         jQo3NiaiCoS2VNLSUHRxqGm6Ng9Fe0kj+15IP8WHFiXyhRKUZn7bzUPsWUueCy5TsHu3
         dUcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790579063; x=1791183863;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8fmUSDAgYoEUGpnG4dyr2raLElAF9zIG7tCsXwnwAGw=;
        b=KQcM4Gz00YV2SPBY9Wy3fnWsssKlp2WDBxl9qHJEAWzVsXpyt0061YvNf01ELYIjYE
         r0HqIJ6/MDIr/GYTC4DfBwFtz8iOI3dKHoltlhHJ2L7yILlm34BmDy1DqKa3Jw4zl2Yw
         qmSL18g+ASGIe2Tm5s5G5ce+OFSJcFZOZ5NvuWiH9puEVrm9KbeIPSdXquf4sFQfrbc2
         8DUljYB5NgMDUAjfbAOWyyv/E4jsPYqL3eYCCGlbuBw3zUBjsgHriIQYBrEVbZo1OjWt
         l00ztnMkvl2NkZLuyGmP3/DeXicjZi4+DgHZ/gwPuh6Bo4WZiJMRzelI8Q4wV7zoMHr4
         fd2g==
X-Forwarded-Encrypted: i=1; AKwUvByNAFO1lXQx9iHalZYh9bQuqwcVj5uUHQgGjevKC/xeLgsWd3zZB8dA0CRbsKVjPBw6vPaaoajzdZbhcMbQOonI@lists.infradead.org
X-Gm-Message-State: AFq9FYLFjWPGxhLS9Z0HpgQQImGWYU2ALWqFn3PUNz1J1J2j6mS/KLT+
	Gd4QwEnyLyknH32GMY3BdwtwL3QG8VFeu7cvhEiofz1QodIxYSVIhkZcH1VY+0P3BBCs8JARJGK
	95iHWGoNb/+LpCRi5UUNsWrlWyLLNqF8=
X-Gm-Gg: AYBFou3MyyTB3gNHfBAh/je5BYx747l3+4CCrQwaYaOl1vQu4s7Y3CU8nMijmeP1gWm
	AcNWrzWFHcMBQAhUcacrH+jsu2Z/9UNK0CWmbYTbu2HMs0AjBkgde+YZOlq7WLt2agvdIcXVK97
	m21dqtlusi7ixfUFOQovji7H93t0liy6SAsjJSHeOFAi2sxDrOx/V4XX4Dzr6mzZpStre8CAFd7
	PKhhR/caTfSXEjUT0yrkdlqFPGtFrnLmzgrljgki6I6XKtsu+7iXbGegBOJTHnN/KvCfUVtPeBb
	QxCU4j28IfOUo109q+ArbY4VyCp5uWxZObPFTdiZJILiEg34gUnC0w==
X-Received: by 2002:a05:651c:1990:b0:3a6:16aa:23c4 with SMTP id
 38308e7fff4ca-3a63c435595mr33846191fa.26.1790579063267; Mon, 28 Sep 2026
 00:04:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260927073843.346910-1-maimon.sagi@gmail.com>
 <20260927073843.346910-2-maimon.sagi@gmail.com> <6ab4896c-c4d0-499b-befe-045cafa8e470@lunn.ch>
In-Reply-To: <6ab4896c-c4d0-499b-befe-045cafa8e470@lunn.ch>
From: Sagi Maimon <maimon.sagi@gmail.com>
Date: Mon, 28 Sep 2026 10:03:57 +0300
X-Gm-Features: AclHuK_wqe69CS137GKI_RXY7GDJiYuGuITU57U4UyfMY3zuTBaG8dDbNTOU8AA
Message-ID: <CAMuE1bEvTE5-MyXyP8Y_qekXEk8Uf0QUUFJ6DfFpc89TdYd4rA@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] net: axienet: use device_property and fwnode
 APIs for probe-time config
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, radhey.shyam.pandey@amd.com, michal.simek@amd.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux@armlinux.org.uk, 
	vadim.fedorenko@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_000425_829662_8A466C9D 
X-CRM114-Status: GOOD (  20.51  )
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

On Sun, Sep 27, 2026 at 8:55=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > -     lp->switch_x_sgmii =3D of_property_read_bool(pdev->dev.of_node,
> > -                                                "xlnx,switch-x-sgmii")=
;
> > +     lp->switch_x_sgmii =3D device_property_read_bool(&pdev->dev,
> > +                                                    "xlnx,switch-x-sgm=
ii");
>
> What version of the core is being used:
>
> 6c8f06bb2e5147b2c25bdd726365df8416c13987
> Author: Robert Hancock <robert.hancock@calian.com>
> Date:   Fri Feb 12 18:23:56 2021 -0600
>
>     net: axienet: Support dynamic switching between 1000BaseX and SGMII
>
>     Newer versions of the Xilinx AXI Ethernet core (specifically version =
7.2 or
>     later) allow the core to be configured with a PHY interface mode of "=
Both",
>     allowing either 1000BaseX or SGMII modes to be selected at runtime. A=
dd
>     support for this in the driver to allow better support for applicatio=
ns
>     which can use both fiber and copper SFP modules.
>
> If this property is not needed, please leave it as OF only.
>

It is not needed here.  The X2's MAC is wired to the FPGA fabric over a
fixed link in "internal" mode, so there is no SGMII/1000BASE-X switching
to do.

> >
> >       /* Start with the proprietary, and broken phy_type */
> > -     ret =3D of_property_read_u32(pdev->dev.of_node, "xlnx,phy-type", =
&value);
> > +     ret =3D device_property_read_u32(&pdev->dev, "xlnx,phy-type", &va=
lue);
>
>   xlnx,phy-type:
>     description:
>       Do not use, but still accepted in preference to phy-mode.
>     deprecated: true
>
> This property is deprecated. So it should remain an OF property and
> not get expanded in scope.
>
Agreed.  v2 converts only what the software node provides: xlnx,rxmem,
phy-mode, the MAC address and the PHY connection, for the fixed-link.
xlnx,switch-x-sgmii and xlnx,phy-type stay OF only, and so do
xlnx,txcsum, xlnx,rxcsum and the "dmas" test, which the X2 does not use
either.

Thanks,
Sagi

>         Andrew

