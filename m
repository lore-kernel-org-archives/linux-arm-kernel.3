Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB628C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 12:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=210HKleKgbmFKKFSqfRC++HOJhEM15Vlg9VXrqpCJ6A=; b=uICP7zYj7yxwwc9h0xIK5bBSLq
	JJ9UFcdLuPtxtpoNTngqZIQnCf6QpuB5DIvNKjO/s8J2Hy6MR6OOnbs60SgbREYvd/rFuXAlIMNdr
	+bdBExG+tAlTxusBxTVKKeKvXfgV8xcLBfZTmrAirUILqylSgL/zrI/SPVslDe1D7JtOaQFeV4EY1
	gHMfVp6V/baLylAJBLmX8uQzBiaPYhnCMhxkJnoSRtmQhUePjkrEYqREhdV+Joro+n6K+IAuBT1id
	csHTp7ZKaSCVTXjRFs1wgDK+XoVTxjqRraX2uKqGcKk/PKM3MdHpfE31m7+aJqy0UKxUOF9WAikZP
	hbUKnUqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfGoq-00000004SqE-0YU9;
	Thu, 02 Jul 2026 12:47:04 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfGon-00000004SpD-1jZf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 12:47:02 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6983f20a8bfso3369216a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 05:47:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782996419; cv=none;
        d=google.com; s=arc-20260327;
        b=Z15eo2bh4CrMPgacaMj7NkEoXRq/RmpSOge2YmHp6msDo9wHwXhWs7Q0wZVrcCGJqm
         0VaNYy4mcDuZBESRfvPr4j1D6qSAivbAfp2smPKJod8amt8c1504GtHavZRRNP1i7M9O
         4SkfNUUvAyXUca6m530VkAAE01Xtyb3F0/tPIRLam0JPDw6y3zBPSGqrOvQ7+RO0Oswn
         Hf4twdyDN4+d2vi+ZZIWei/09wB8egKQfzAt/18JaC94/i7hs2EIJ7Hy2KNHkyzwUHpB
         lBLp5HJUkrf+FDIxd/HCSzJy0ziHb4uqQgMQ59Vo9ISOlkuYgihAor/xNNhdBKsRnl0E
         IHeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=210HKleKgbmFKKFSqfRC++HOJhEM15Vlg9VXrqpCJ6A=;
        fh=0LBC3GPM4W94ktDLsPL6B0Ya9UGW78Fwsk9J5/6PZME=;
        b=FCjCsL8R3+rZBuFTDnbI/UcWEr6xF3AmjDwu9XpUOESGh0PM5egWH8HpfUIO4YhrJB
         sruDr47QN86bumSMPU/jnDbtElC5qUUFAFtf5/8EtkbFxW2WteFxz0gnVgWvXQbBZAdJ
         amlczbq3EiuXGp9zER7DOmzP8h5nPc+u/yJsuzTJeAiXMCA+DRHRfXAFdSzN79YWy3ej
         a6zrIGcKuDEjvLx6ay6QdkyUJL81BttGigaNvXy1hc/RWdfuw+I0b0GKpP+/9n1FHjXV
         3OmZVIufh8ud3U2LIigEHTIHrboSXYLxGJhHakGJHL/yt6UV1kG5f/4xbhHc7cHmWxIY
         wcow==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782996419; x=1783601219; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=210HKleKgbmFKKFSqfRC++HOJhEM15Vlg9VXrqpCJ6A=;
        b=mFGKoY/qUbdiaR8GqpEr0/RIg4G3gzJdWGHBUqOJvDVtU+uhukYmPJ4nKmI1eCiKdL
         QdDvek1UfQNdS6FUKTPqXIJuJZ4eg3mAopQoZwed5xYUTWOyBzG0y9x4BnVeCbFBuBmE
         gDoabv3C5LDnqdShALSvhM/G4U2nLiKBSdkzzE8BBJK12GrxRxLc/poX3jzeI+tGcjZ0
         aey6hoVoLJnAqQj2ESQe7puhAJ0iy55RcB2A3k9ZhVi0XzHOwgm7qi+wTcBHWAxpNtmh
         l/0uADNlNCf6DW358yB/F9hUT0vgMPooyATEpBslAyzxEv9okt0j7fh+EZm6NMz36hVg
         IaVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782996419; x=1783601219;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=210HKleKgbmFKKFSqfRC++HOJhEM15Vlg9VXrqpCJ6A=;
        b=bHgGZnQLWOYTKcXlTnXz7GaHxSRO32mBJUL5ik25k2UciYPLqUuy1GoIGERo2h8/Be
         aH6xKZ83/zUKKsyvZGgojBBSI38l54z5cbxt7E9HOhBfm9Z3czH3Ww6YJCPUKDOluKsv
         DSQg7MFp06BFe6BIIYozMKIUBvOqHLVkpQjmbS98ZcRLww14kJf1/52j9Yb4xthAlDCk
         hQ6x3g2tcX+KyDGC7j0FKFIi1w4wJk/QeBWac9Q1L4/d/jZ5PYSnXx05erYtVjoNMM17
         gEo6ezkwQeNknRLBvPFoOVmDNBiSQcI9ctboebq3Y1Zp7cs1Sms/lh5qSW6DRc/AxGBd
         gG1A==
X-Forwarded-Encrypted: i=1; AHgh+RqllUSlFiZOf9b5r5WdMXed1OodBUdWjrgnNZF8afzabGRRcLJpThXCUF75b2tiR0ZyP7s2vHgGQ+RV8ZVgwEhH@lists.infradead.org
X-Gm-Message-State: AOJu0YxHD6ha/8zbZrt0uJIx6L7CxRena1AoaRtb+BzpiaDgg7q8w4lK
	FNwfSikh6yQQfzC0EaPvZHJ6Oqv5JHOfD4oyzs7q6caYJWUHFq3ARpemveR/G+GtpWE8jYQt62L
	hsFJ2Y/eb6fod6C0lYVE70b7u6a17WD3wruxEhAtYyQ==
X-Gm-Gg: AfdE7cl2LySSsQbrYg1JghdoZL2aj6AW6aUojp5gzCXhA9l+F1HXIjLXnOhYFEW0zOv
	5+VuJN1p0QDzwRsgacyxCeGgpC8NmKEy6Ofl0JSXIaOYWrsNdXzmF3ofwQhb2KnVJx7KvS5wkGZ
	3sud/8qWNIjceb/gKosDXuPWeC2vnO6ShVoR5f6ECp+noLTfnZLUeUZzED7MlCSa/BVWp4uT7Dg
	RHgAfQFPsJfX7MJX45sEVJZpnDNe138ALuj3TiCLbAoAKxkAr7YsMcGXMsSoO2zcUDEZYgnq8Xt
	nuvoCC7VGTgmmoNADmnNrvJwkA==
X-Received: by 2002:a17:906:d0da:b0:c12:64c6:bd7 with SMTP id
 a640c23a62f3a-c12a9e053e3mr203835966b.21.1782996418879; Thu, 02 Jul 2026
 05:46:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260203161917.1666696-1-vincent.guittot@linaro.org> <akZcpgDSjAg6gcok@lsv051416.swis.nl-cdc01.nxp.com>
In-Reply-To: <akZcpgDSjAg6gcok@lsv051416.swis.nl-cdc01.nxp.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 2 Jul 2026 14:46:47 +0200
X-Gm-Features: AVVi8CfnsNCvDc67RDsUnObGKCXWxD40T6JSCY5QNMiAlpanyxUGcJsCLPpkpdE
Message-ID: <CAKfTPtDT5NiFcgozfxec0vBi4663fhnNdQGRdGpF6VwpKSJU-g@mail.gmail.com>
Subject: Re: [PATCH 0/4 v2] Serdes: s32g: Add support for serdes subsystem
To: Jan Petrous <jan.petrous@oss.nxp.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, ciprianmarian.costea@oss.nxp.com, s32@nxp.com, 
	p.zabel@pengutronix.de, linux@armlinux.org.uk, ghennadi.procopciuc@nxp.com, 
	Ionut.Vicovan@nxp.com, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
	horms@kernel.org, Frank.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_054701_481638_DBD6BF1B 
X-CRM114-Status: GOOD (  21.59  )
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

On Thu, 2 Jul 2026 at 14:42, Jan Petrous <jan.petrous@oss.nxp.com> wrote:
>
> On Tue, Feb 03, 2026 at 05:19:13PM +0100, Vincent Guittot wrote:
> > s32g SoC family includes 2 serdes subsystems which are made of one PCIe
> > controller, 2 XPCS and a shared Phy. The Phy got 2 lanes that can be
> > configured to output PCIe lanes and/or SGMII.
> >
> > Implement PCIe phy and XPCS support.
> >
> > Change since v1:
> > - Fix compile_test
> > - Use devm_reset_control_get_exclusive()
> > - Fix s32g_serdes_phy_set_mode_ext()
> > - Manage devm_clk_bulk_get_all() returns 0
> > - Fix s32g_serdes_parse_lanes() error management
> > - Move xpcs filein drivers/net/pcs/
> > - Add pcs_inband_caps()
> > - Fix functions in phylink_pcs_ops
> > - Fix MAINTAINERS
> >
> >
> > Vincent Guittot (4):
> >   dt-bindings: serdes: s32g: Add NXP serdes subsystem
> >   phy: s32g: Add serdes subsystem phy
> >   phy: s32g: Add serdes xpcs subsystem
> >   MAINTAINERS: Add MAINTAINER for NXP S32G Serdes driver
> >
> >  .../bindings/phy/nxp,s32g-serdes.yaml         |  154 +++
> >  MAINTAINERS                                   |   10 +
> >  drivers/net/pcs/Makefile                      |    1 +
> >  drivers/net/pcs/pcs-nxp-s32g-xpcs.c           | 1006 +++++++++++++++++
> >  drivers/phy/freescale/Kconfig                 |   10 +
> >  drivers/phy/freescale/Makefile                |    1 +
> >  drivers/phy/freescale/phy-nxp-s32g-serdes.c   |  953 ++++++++++++++++
> >  include/linux/pcs/pcs-nxp-s32g-xpcs.h         |   50 +
> >  8 files changed, 2185 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/nxp,s32g-serdes.yaml
> >  create mode 100644 drivers/net/pcs/pcs-nxp-s32g-xpcs.c
> >  create mode 100644 drivers/phy/freescale/phy-nxp-s32g-serdes.c
> >  create mode 100644 include/linux/pcs/pcs-nxp-s32g-xpcs.h
> >
> > --
> > 2.43.0
> >
>
> Hi Vincent, all,
> I'm taking over the S32G SerDes/XPCS upstreaming. The effort has moved in-house
> at NXP and I'll be carrying it forward, continuing from this v2 rather than
> restarting from zero.
>
> Vincent, thanks for the v1->v2 groundwork. I'll keep your authorship on the
> patches that originate from your series (Co-developed-by plus your
> Signed-off-by) and build on top; I'll send you v3 off-list first, as you
> offered.
>
> A v3 is in preparation and will come as an RFC, with the v2 review comments
> addressed.
>
> Vincent, if you're OK with the handoff, a short ack here would help make the
> transition visible to the reviewers.

Ack

Thanks
Vincent

>
> Thanks.
> /Jan
>

