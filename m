Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB06C54795
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 16:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9HMc0DzIN5ocrXZLGX5hiW5AlfZP52hbSKBuKVVgxw8=; b=biFrVBZYl6+Sgz++ySgD1gApuE
	rxpt3iQpuoajBF3PJk+GfBJRvf/mfKJlZs3BqCbCy2y3B+38QH2Bd1XS2PjqTDV3kI2e0FAJi5S2V
	H2MuanQ+H2R08BU70zm/For2M9IlvF3JSUXr7MK2rxQS+wIFYeo0Ade3sVST+07BKoO5MuC/QbxGm
	bKDruyLb+VXEccWgcbz0AENgNTSgc3/7OFojpDJB2WpSyCM429SY2T293quWHTdMqVgOT8+Lxn1FX
	Rp66PORahlud3sYOvodVeQE6PNwqBAZ/XRAKO1jmiOPZfqG7zrMpz3VCc1hvk5L8CH/L9O/gTc4do
	YFIGcb7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH3bm-00000009r1I-1ROW;
	Mon, 19 May 2025 16:44:58 +0000
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH2ax-00000009e7J-08D3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 15:40:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=9HMc0DzIN5ocrXZLGX5hiW5AlfZP52hbSKBuKVVgxw8=;
  b=BiEOr8lh1wbmqmPbg972i+TnuDfMlW9JpMOq4PXcQ00yckg/fDp/evN6
   TXLX0ltcbAsPdK/AvMslBPE98gezKlPvAAn38pHMJ8h5Roa+VDDC1nD+K
   WenDR9H3KIIeDXGfFefWZUTHbtRM9ZVPCq9Z9K9SJ9xzSjm0enLCaf/MB
   U=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.15,301,1739833200"; 
   d="scan'208";a="116972886"
Received: from unknown (HELO hadrien) ([194.182.8.86])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 17:39:53 +0200
Date: Mon, 19 May 2025 17:39:52 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Luo Jie <quic_luoj@quicinc.com>
cc: Markus Elfring <Markus.Elfring@web.de>, cocci@inria.fr, 
    linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
    Catalin Marinas <catalin.marinas@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
    Julia Lawall <Julia.Lawall@inria.fr>, Marc Zyngier <maz@kernel.org>, 
    Nicolas Palix <nicolas.palix@imag.fr>, 
    Oliver Upton <oliver.upton@linux.dev>, 
    Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
    Suzuki Poulouse <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
    Yury Norov <yury.norov@gmail.com>, Zenghui Yu <yuzenghui@huawei.com>, 
    LKML <linux-kernel@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
    "Kiran Kumar C.S.K" <quic_kkumarcs@quicinc.com>, 
    Lei Wei <quic_leiwei@quicinc.com>, Pavithra R <quic_pavir@quicinc.com>, 
    Suruchi Agarwal <quic_suruchia@quicinc.com>, quic_linchen@quicinc.com
Subject: Re: [cocci] [PATCH v3 2/6] coccinelle: misc: Add field_modify
 script
In-Reply-To: <1e3ba498-2bfb-4cab-ba13-5ab2c5b03ef9@quicinc.com>
Message-ID: <6fe2aed9-f29e-4a77-5f47-855cfefe1973@inria.fr>
References: <20250417-field_modify-v3-0-6f7992aafcb7@quicinc.com> <20250417-field_modify-v3-2-6f7992aafcb7@quicinc.com> <a1be0efc-a4c9-461d-a01a-8fb830b2c68d@web.de> <0ee48e2f-58db-49b0-b651-dcc0e517465e@quicinc.com> <43712874-6f1d-435c-98b2-30ac44d25309@web.de>
 <1e3ba498-2bfb-4cab-ba13-5ab2c5b03ef9@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-477211006-1747669194=:4212"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_084003_461948_B0578EFA 
X-CRM114-Status: GOOD (  19.15  )
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-477211006-1747669194=:4212
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Mon, 19 May 2025, Luo Jie wrote:

>
>
> On 4/24/2025 12:35 AM, Markus Elfring wrote:
> > …
> > > > -reg &= ~mask;
> > > > -reg |= FIELD_PREP
> > > > +       FIELD_MODIFY
> > > >                     (mask,
> > > > +                  &reg,
> > > >                      val
> > > >                     );
> > …
> > > With this code variant, there is no space prior to &reg, here is the
> > > example code changes generated by the SmPL code as below, is this
> > > expected?
> > …
> > > +++ b/drivers/phy/starfive/phy-jh7110-dphy-tx.c
> > > @@ -244,8 +244,7 @@ static int stf_dphy_configure(struct phy
> > >          i = stf_dphy_get_config_index(bitrate);
> > >
> > >          tmp = readl(dphy->topsys + STF_DPHY_APBIFSAIF_SYSCFG(100));
> > > -       tmp &= ~STF_DPHY_REFCLK_IN_SEL;
> > > -       tmp |= FIELD_PREP(STF_DPHY_REFCLK_IN_SEL, STF_DPHY_REFCLK_12M);
> > > +       FIELD_MODIFY(STF_DPHY_REFCLK_IN_SEL,&tmp, STF_DPHY_REFCLK_12M);
> > >          writel(tmp, dphy->topsys + STF_DPHY_APBIFSAIF_SYSCFG(100));
> >
> > The Coccinelle software is still evolving somehow.
> > Thus your test result can trigger further development considerations.
> > I hope that clarifications and corresponding improvements can be achieved
> > also according to such source code layout concerns.
> >
> > Regards,
> > Markus
>
> OK, understand. I will keep the original patch as below for now, as we
> need to ensure the script generates code with the expected style.
> +- reg &= ~mask;
> +- reg |= FIELD_PREP(mask, val);
> ++ FIELD_MODIFY(mask, &reg, val);
>
> In addition, below case is filed to request this improvement on the
> coccinelle project.
> https://github.com/coccinelle/coccinelle/issues/397

Thanks for the report.

julia


>
> Thanks.
>
--8323329-477211006-1747669194=:4212--

