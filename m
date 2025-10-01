Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D1FCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 08:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sLy1r4an6UfTJPaHkyT9U6fPTve0eRlEi9oZ3JIBjEQ=; b=NfltEvXc0XC6sRNY/7xbpb2e0r
	QuoSc1Y2y+itbZOOuF2nGuhsrMz3xrpgcxfdMrbWuyk+cqAVpvzxqTtuaVFJooLBlOnJPc9GRuv8T
	Q95mPXJ9KyY4jhZ2qb5HSOVK6cq3mf6tQzVXuFsrN0FQfMp1kb59pB3t8TgTetYJg1z5NRlqn2N8z
	rDA22YoWDJcRwcgJZa8neZDpjQrV2E3oXB1R8W0oL3wqxFVLYcMNc5RqVgyR52NbtUpoyWVS4h5JM
	x5NdS+W8FMDHUsDbylL/BEA/1VnkjuAwaRBIhrVdpKnU3KSK2cAoYC40u7cDJnzugO2orD4pxjgFR
	JAa5/Jaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3sbV-000000075V3-13dq;
	Wed, 01 Oct 2025 08:54:29 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3sbS-000000075Ua-3Prm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 08:54:28 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3324523dfb2so6676802a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 01:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759308866; x=1759913666; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sLy1r4an6UfTJPaHkyT9U6fPTve0eRlEi9oZ3JIBjEQ=;
        b=gHGTv5xOf/+vdl9hvNrmoN70xANAhK0ORU/HPYw3f5BlenbTEd4siwpuClFlB4nUx7
         F+bhmHVdlC40h3JhRuxSMY8OLTyuF42CGhbNuOCcM966BynS/bcqt/xJoeJm4gNezoQ6
         JKoYJgSlezAU4BCPALER6eIgVNBqU7pu1l/HNQLBi3d776awiUvwfdwdKU6WEGHtVICO
         n20eXbucSLOH3svC28XjVV4GHftgVRu20gRQZgInoEz02/g/l9LPvh+j5KA8MnABk8cb
         cyK58/LWjvYxg+alP0//Wt3YREUkEpvY4mmEi4iQZz72TKToxGP125WYyGRFLbzaRZex
         BNQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759308866; x=1759913666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sLy1r4an6UfTJPaHkyT9U6fPTve0eRlEi9oZ3JIBjEQ=;
        b=ClF7nS0ggHpJAFLKUKLALInbnrENzlevV7A1KJHHJXIPLyaexjwwqDUuRkZhDnf4ZX
         XH7qIUTXuM9qBPki2PNFTuebdPguJ5AS3jy2t1fy99NmFWbdz3tapDmOlNVaewX3COdu
         TpyOJGqqTeGJucYw/gqBeJhIvJPUFfESaJLHnd6o3nKkCtdwhyp33elOBA/zxlnnzlSj
         yEIAs/pWNQNzXesfUDBHBO/YjAOD4aQ0mGwFQbkaxMYRyP/xvFpscNf1OfJn6PloYQYu
         fhCNKf249md4YWSILOQrJ0LICxfCSjaLzaGmhkiP3M0ncTrrbwQFAm0FlX2nVx9r1ILw
         mL5w==
X-Forwarded-Encrypted: i=1; AJvYcCXk3REtbmSzI4pqWqMpMjTRxJVsDFRjO/Br++c0iUwbhjBjz4D6QQraJ50y4Vhpjsq7RAi0Mwvkx/WafT45zlL+@lists.infradead.org
X-Gm-Message-State: AOJu0YxkcLkwunLVpygt6j6Ec3jo6RXh4jXZGErqfu/PiPCGTUATTmde
	Rw/z4zn8avRDiuLfEevr61nO9S/1yYMW8x/YVk5JMBv7CSIGVSKH4fG2gdY+gHAGJfUuedN/asI
	m6UN7xskSFl0z/von6UUu7C8jAaY2vVU=
X-Gm-Gg: ASbGnctpZ7Y+KI45lDIs2b/JDG5WHH9SAzY4rnSABCRE/FwZqfWiPJYwkaJiZ0gt6r+
	+1LH8ieC3enEHXYqnmhh+iwKArDVirXCQCA1x6kOTNkz0rhe9H27Ldx1iG7dwvqQ1Q2jp+xe1j3
	AqdqZA9dPNk+l9yC+DMDnlzJaT/wYTi/avKvh6mNryyvSfoHuJNs1tQ2LS1MaOzzKIulb+UrMqI
	OsJUumfSCPu/LV9MA0buemA+t0ktqsEjLx7PaCWxhLShogXRTHCiiSbCNDyjQQUaQ==
X-Google-Smtp-Source: AGHT+IFkHVvzIlBnrVeHVBtBctgazh/MCfsQv0mLNCnxfXKJW1PT7QAVMcEH+xX6FJvFAD4mRgwQJtqqKlzNOAz6QnA=
X-Received: by 2002:a17:90b:4d0a:b0:330:84dc:d11b with SMTP id
 98e67ed59e1d1-339a6f36367mr2940411a91.18.1759308865859; Wed, 01 Oct 2025
 01:54:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250917074812.4042797-1-kevin.tung.openbmc@gmail.com>
 <9bb9929a-8130-48da-983e-2901a7c3da36@lunn.ch> <CABh9gBew1=hbJvg1Mhg5dE7Lr_Z442_kbBX6zTs_6_C2NRyLbw@mail.gmail.com>
 <7e6f568da28d7a63738b6ed22b33db3df4c478c9.camel@codeconstruct.com.au>
 <CABh9gBcoWbXurPo0f9U9+gz8k6gttUvj=NMMDVfgjo5dgaTLSA@mail.gmail.com>
 <CAL_Jsq+zBK1CBJX0XcaqaYeOPUhoRE-nMeYvkTNwQovJ+dakGg@mail.gmail.com> <090d0e196fd0f814b5385f2c6e47e5196f0be649.camel@codeconstruct.com.au>
In-Reply-To: <090d0e196fd0f814b5385f2c6e47e5196f0be649.camel@codeconstruct.com.au>
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Wed, 1 Oct 2025 16:54:14 +0800
X-Gm-Features: AS18NWDyzaFR3D4tmBrIV6Dx9lyGm72vUyiAB7CZStN-eawEDelhMt9miv_jN1k
Message-ID: <CABh9gBcaUbwR9ScT_xSYo3q6FHZaMyXYewByPQoReUp1pktcEQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] Add Meta (Facebook) Yosemite5 BMC (AST2600)
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_015426_858865_2DD59CA2 
X-CRM114-Status: GOOD (  21.31  )
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

On Thu, Sep 25, 2025 at 8:16=E2=80=AFAM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> Hi Kevin,
>
> On Wed, 2025-09-24 at 08:34 -0500, Rob Herring wrote:
> > On Wed, Sep 24, 2025 at 8:05=E2=80=AFAM Kevin Tung <kevin.tung.openbmc@=
gmail.com> wrote:
> > > I also checked the work with `make CHECK_DTBS=3Dy
> > > aspeed/aspeed-bmc-facebook- yosemite5.dtb`,
> > > and the warnings that appear are not related to these patches.
> >
> > Um, they are related because they are warnings for *your* platform.
> > You don't care that there are warnings for your platform?
>
> Which is to say, by contributing a DTS that relies on the ASPEED DTSIs
> you're now part of the community of people interested in maintaining
> support for ASPEED SoCs in the kernel, and it will be appreciated if
> you could help improve what we have.
>
> If you could pick a warning or two from the DTSIs and contribute
> changes to address them that'd be great, as this improves the situation
> for everyone.
>
> Andrew

Sure, I will look into contributing a patch to address some ASPEED
DTSI warnings and improve the overall situation.

