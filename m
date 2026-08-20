Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ADB6C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 06:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5DS3txWmnShWeOSkYZcCOb4QBbjc4rEfH1Wqk5hfTNM=; b=FxwGWrh58gbwS27V+GgbJEMb8N
	FJcme8mStNUfAvzXBE+uJHW5pMm4uyD1COXzpZZQ6zbRfxHQCtLqaAt84638n8SPFIhjcsl4rgJ8V
	Hpf3J6qKqLEeSJKvjegFwcyJmRzwWghhjfFEmSs1Oa1Y0VEZq2z0Psm1gcUOp4jiFaK0G5AiO5ndG
	NLisa0P9uWb9SjLVxBkQdMDoJHtL5uu4h7of5FHbTkGmxOFRyXD8pol3DcNB6znt6x+OCBhu3bo5L
	YhC09ytcOXk1+xIU/yEmzeffpgqllcK+gIoHI6+eVUpGUXPbel7Bo4g/sy8zpzeX1rcFhH/gWW+M/
	psQXtYKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwwUZ-0000000AxiF-2Cgn;
	Thu, 20 Aug 2026 06:43:11 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwwUX-0000000Axhe-19pj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 06:43:10 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-66c744a00edso1731630d50.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 23:43:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787208187; cv=none;
        d=google.com; s=arc-20260327;
        b=pYix/0Q43FbcPk/ECHBrR7L4SDOBX/lxhtNEOSn+LNPSfic5+zjsDslgXZQxQNfcz9
         ZCSgSUqrZiha44XyaXagMz5xa9DeXtaK4OrWzoBF0xLXIY1FljNvj0IdiyVpsAAyH2fQ
         TToHyXxJzxMdwRhOzduJQiQ8aGHesKzcZzLflNVJh22a1hi5OScCcCxQYbDeKx9qDa0e
         QD1CS4INz+8fc5RP0IyPSi4Mc7aCm1u1rGqJidSNKWCQfC1aWRyl3sadBbRl1Nh0Iubs
         k9dppyz1KWvTe4o3jL6cGdsFNLigHzbH9tm4LriMwkD/lp970bY+xm+AiOg9UWYAKrzH
         6Wvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5DS3txWmnShWeOSkYZcCOb4QBbjc4rEfH1Wqk5hfTNM=;
        fh=BstybU1VLrwHSB9Cax0ZUgVMaWUjc537KuMvONQmwa4=;
        b=lCRYMDNUyo7Z5ier6ESUxc3e/AbzhOY4VSdxHUQ7r7sFdNG6Q6jHzEGZuYWT61Rj9z
         VitzshibvkDjaGXtP6VE/9xK4WizeS0DzNIPDJDm3QW7VgAv1iOevlELxRFmMRsyfsIU
         PSRzXajctYGveP8nZZnUJA9ffje+0Nn5sqSDfKMu12igHb7IP5Khfaub5XZhL+VBaxhw
         gc4B3Z4rbtZyxWKq2NxbipmDhTRIJ6XgpH1LslbNmtBaPk7Q5/Vo/QA+EgmF4hhzspWX
         J9N/sKUqD6KmKPrK1QBKpXc9Sg8OeNxnv4weocGuLYh80iRiJ1E7hU2t7BgK+wwEN5Ok
         HcQg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787208187; x=1787812987; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5DS3txWmnShWeOSkYZcCOb4QBbjc4rEfH1Wqk5hfTNM=;
        b=BfYn16o9+KeAk3aORWgokktOaYx9f5q8Ws8y3hVoHTRWpFGbNIzWu75C3HBTxs7s3V
         aFyMVcaaSec0NWsHwxII8fTV+vYCvOmhG1hR4UcxEhsFjEEEg4AWz/vrvwd0q1Cb5eNw
         hg7N5u3c+2nqz0VedwPdbqLX0CA4nlV9cF10I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787208187; x=1787812987;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5DS3txWmnShWeOSkYZcCOb4QBbjc4rEfH1Wqk5hfTNM=;
        b=DCzguTPt6MuxEZAOlG8JzyuGepKASkm+5gbYpogn4cGfrlVUohZD121RrL3u6iYeuB
         YVXK6ALiLRzoIrAYP6tWq+Km+KO98lYDTo8MZHK2Yy0okVoFmgFvl3UPXwFRKpHAbEtH
         8Fh8gjU2nGenCA2zlK9MJPlT67hzAjk8D4WCjqjaPciIjII61N53OdN6/PmUZq5y8W5n
         7vZn0MlJFfJPmxga6R82JXNDgDAZYgRC9qChvOlCUQNpnyTEcAiqIv4NOEul2ox10dLg
         7YHxOk7MCyxsRzmqCjDS6M7ssdffBV0ra5yD6JtwVXpGnOPq+nQ4ZJr7PLb3ExxXXacj
         er/w==
X-Forwarded-Encrypted: i=1; AHgh+Rqt1UDD0GLgRiRBswSk5pesEP7k785wrNhT/hYQ67Oge4ISllnmFGjiPeSOxOGmzoSaxV2Wgor/qwkHDCmSP33y@lists.infradead.org
X-Gm-Message-State: AFuF++lojBL/yBMnUrm82ItSajp4Gq95+s6vb0F2krThTB3KuIpZDngy
	w0AuctbrF89t+EgL6ipndjWQ2o2wgCl5f2Lhroq924Yjh9esONJElWruoZHrio1T2r0Il4N1+FK
	QvGnQLweXaIMX2ubFkAqgrEPL5wulwP/YwrEfTqcs
X-Gm-Gg: AR+sD13VaPQrIpJ45mkjsWOnqqdPej1mZy37rn23FE3pNYEdnK5aY1IZAxIX6HV2ymm
	ZGdEUaf/7ruuU1wQSiKjQ5yEHsvo0Xdt9HauYUNaWH8vSNr8xe0slKTe37JjKRkUYWklT/FiCgh
	eA1iTlZwd3CE4hv19HcKoFjANi4Zge0HsM8+O5AwhvjV6NwMLBPgbdraMCDrpicmfsXLHH5yqUo
	TXwquM0GYyJ33rBIHDj21QjbbmHkmDdAknCKlz4WgWdVEMILhIxZDDmIsC71lqDzQ80+HtrgN5C
	e+VvH4vbwmrTwhcmpXLcmpFCWp0UN4RLPvlqDX4VzA9kqV8BOI1CggX8FVzJIWxNbB8RG+6lDys
	=
X-Received: by 2002:a05:690e:161b:b0:667:debe:494f with SMTP id
 956f58d0204a3-66ccb6baa16mr2792320d50.44.1787208187320; Wed, 19 Aug 2026
 23:43:07 -0700 (PDT)
MIME-Version: 1.0
References: <CADOrJmbTyrGGkq+9OJDXCgTa2HvNo8BWxoE6yjafcrOq7WNamw@mail.gmail.com>
 <20260817215428.84740-1-gvalkov@gmail.com> <20260819-generous-nickel-dalmatian-b6bb08@quoll>
 <CADOrJmYfBe3ADun_kFjFSH6YOSTX7Vu3UsFsL57yuRdaQ=eJCA@mail.gmail.com> <e554c007-67e3-4fbf-b85e-5de02f649e83@kernel.org>
In-Reply-To: <e554c007-67e3-4fbf-b85e-5de02f649e83@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 20 Aug 2026 14:42:56 +0800
X-Gm-Features: AcwNN1VnLR1aHYarg7cpxijdC4GmIDA-AAePy3yNd-kTz7zpQyFEH66e6jDxZZE
Message-ID: <CAGXv+5H7AhZgZ06r9KO3HLZ9Cymkai+Cv9SgVTuSC1PjgGf8hg@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: net: wireless: add flag marvell,ignore-regulatory-hint
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: George Valkov <gvalkov@gmail.com>, briannorris@chromium.org, johannes@sipsolutions.net, 
	andrew@lunn.ch, krzk+dt@kernel.org, francesco@dolcini.it, 
	johannes.berg@intel.com, kees@kernel.org, miriam.rachel.korenblit@intel.com, 
	rafael.beims@toradex.com, avraham.stern@intel.com, error27@gmail.com, 
	s.kerkmann@pengutronix.de, gregory.clement@bootlin.com, 
	sebastian.hesselbarth@gmail.com, robh@kernel.org, conor+dt@kernel.org, 
	Frank.Li@nxp.com, chunfan.chen@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_234309_365047_30EF4198 
X-CRM114-Status: GOOD (  41.45  )
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

On Wed, Aug 19, 2026 at 8:27=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 19/08/2026 13:42, George Valkov wrote:
> > On Wed, 19 Aug 2026 at 12:42, Krzysztof Kozlowski <krzk@kernel.org> wro=
te:
> >>
> >> On Tue, Aug 18, 2026 at 12:54:26AM +0300, Georgi Valkov wrote:
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/net/wireless/marvell,s=
d8787.yaml b/Documentation/devicetree/bindings/net/wireless/marvell,sd8787.=
yaml
> >>> index 930b700b73d0..5f235cb9f3e5 100644
> >>> --- a/Documentation/devicetree/bindings/net/wireless/marvell,sd8787.y=
aml
> >>> +++ b/Documentation/devicetree/bindings/net/wireless/marvell,sd8787.y=
aml
> >>> @@ -59,6 +59,12 @@ properties:
> >>>      description: Calibration data for sub-band 3 in the 5GHz band.
> >>>      maxItems: 502
> >>>
> >>> +  marvell,ignore-regulatory-hint:
> >>> +    $ref: /schemas/types.yaml#/definitions/flag
> >>> +    description:
> >>> +      Ignore an incorrect regulatory hint from ROM,
> >>> +      so userspace can set the correct regulatory domain.
> >>> +
> >>
> >> Same comments, so you just ignored entire feedback?
> >
> > Do you mean this feedback? I already replied to it:
> >>> Anyway, property looks like SW choice. You must describe hardware
> >>> instead.
> >>
> >> I am sorry, I do not understand what you want me to do?
> >> Can you please send a diff or a clear description suitable for people
> >> who have way less experience than you?
> >
> >
> >> Again: you need to describe the hardware, in commit msg, in property
> >> name and in description. You cannot tell SW what to do, that's not the
> >> purpose of bindings.
> >
> > I still don't understand what I should do?
> > Can you please show me an example of the changes you want?
> > Else I'm likely to make a wrong guess and implement it. That obviously
> > won't help.
> >
> > The commit message already describes the issue with WRT3200ACM and WRT3=
2x.
> >
> > About the description, do you want me to do something like this?
> >     description:
> >       Ignore an incorrect regulatory hint from ROM,
> >       so userspace can set the correct regulatory domain.
> > +    WRT3200ACM and WRT32x are known to need this.
> >
> > About the property name or flag, do you want me to add a separate flag
> > for each affected hardware device?
> > - wrt3200acm,ignore-regulatory-hint
> > - wrt3200x,ignore-regulatory-hint
> > - the list may grow if someone decides to add other devices
> > - and the driver will need to support all of them
> > - that doesn't make sense, because it isn't scalable
>
> You need to describe the actual problem in the hardware or firmware, and
> then name the property and description accordingly. "Ignore regulatory
> hint" is clear instruction to the OS what it should do - ignore the
> wireless-regdb package/instruction etc.

You probably have it backwards. The driver is taking the hint from the
hardware ROM, which is fixed and thus wrong once someone carries the
device to a different country. I.e. it is a quirk saying the _hardware_
region should not be used.

Whether one should override the certified settings, or be able to do that,
is a whole different discussion.


ChenYu

> >
> >> How did you fix the threading problem I mentioned in v3?
> >
> > How can I fix a threading problem?
> > I don't really know what the correct thing to do is, once I forgot to a=
dd
> > a version tag in v4. So I just added v5 in my next submission.
> > I'm new to sending mails using git. So far I've learned that I can do t=
his:
> > git send-email --thread --in-reply-to=3D<Message-ID> =E2=80=A6
> > and I use the last Message-ID.
>
> Do not attach (thread) your patchsets to some other threads (unrelated
> or older versions). This buries them deep in the mailbox and might
> interfere with applying entire sets. See also:
> https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/s=
ubmitting-patches.rst#L830
>
> Look how correct thread looks like for v37:
> https://lore.kernel.org/linux-devicetree/20260819-imx-se-if-v37-0-5ef5de9=
ff1dc@nxp.com/#r
>
> Look at this v5 thread - it is one huge chain:
> https://lore.kernel.org/linux-devicetree/20260817215428.84740-1-gvalkov@g=
mail.com/#r
>
>
> Best regards,
> Krzysztof

