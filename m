Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A863C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 00:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3G/3+m/lRjbsgB6Uj67QoFbCFOBM3izr4BbRlnuiWfc=; b=fZ495ZWUak0dxNWBm18LdU024Q
	GwhHwKU92wyxx9xH1KFluhEg9Cs6se7bZDmvP3+wf45Yum31N2YLq1vRbaXrsrLJ5TFB7tBu1LmwM
	NbNg9jKZx4WwQNMLDBTTGUQWJ0WTJGR5nrHFPB9/oMW9/bOeDUhpThzQW88pjxrHYa5zKcCz/L1sK
	UxVnxGCDp3RG35JevrkwSxC2hBzss+rkiyKRJyQLgeDI+vOLZHrahSR8anJ3kFh4NWhLILV4WJV+y
	ivZMCMsXFhL9Sn9SxA0Wpdj8nkg/q98AR1T0eG9h0YMH6a16i94I/3fqm1Ut+3x3RsKjCRIGr3mn8
	mfk3d0kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn5ce-00000001uRB-3Oz0;
	Wed, 26 Feb 2025 00:50:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn5b8-00000001uDn-3OXZ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 26 Feb 2025 00:48:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3G/3+m/lRjbsgB6Uj67QoFbCFOBM3izr4BbRlnuiWfc=; b=kWRtBTuXRGjjxwiPZxgFeV/zXr
	uihYHfudI+iwbi0qZJm97OIXHC6E7P5QsgnfHdSXbF6Bz+3SjZ9CF6vzYn5xx2wfz7Mg1XN5ccsrI
	Ja25vM9wIqKpP/YlNZo+7Scjsi7FB39jkSB6XRQ0MuFFF3K8w38N1Bd80TPy2P4vQMwnqSoxYh0gp
	qAnpghXsewG2zipxgPwamzXakD2NaF40IJSCVulf8wMIKxjau2/HLci825jHYqJ5afSlaYy2BUZZc
	HI/IeFIki4/x94H6QHX8/fomK8WPjCC+Mi+UEqLkWEWOLf9fAZ1PqEouTBGz/cH7+Zjx7lzr/GtLc
	VwtWhzQQ==;
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn5b5-00000003TZp-2Tbk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 00:48:25 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3d1925db9e7so55015ab.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 16:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740530900; x=1741135700; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3G/3+m/lRjbsgB6Uj67QoFbCFOBM3izr4BbRlnuiWfc=;
        b=QS34ANo6huqw9gTFjxtIiUgDwjM/PkAIHlf++qB3t1dcInhg9ABXtTzEbxe3tjk1sS
         Ul/w66FpaAqrGeI0vXIwaNwaOBi1KyCfSUEgqN8M7ao1UOp6l+Bx9p2tjX7mY5xPri3a
         r9Y3CrTD0RhxMEy/5FRTWxHNr4FFiajFsdWod231DV5VU6v4X3rmmRC3hyvLi9dFTLYE
         H/KaOectKFWegSmhsgppcJtDzIY6c4cLgLhSNFrLQo0RfmKiCKd1jps/leltEKE1+DC1
         MFJqwDdQdWu7xcrYCZ+uyfGqANtrGd5qAi87CZoXrZWbsoHhNG7lVdbNka5jzNkFfjkf
         2FjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740530900; x=1741135700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3G/3+m/lRjbsgB6Uj67QoFbCFOBM3izr4BbRlnuiWfc=;
        b=lihglHm9FCat4bsAZwAi4ih+4OaqF/vjiHvt3Z9RuEyvg1yFH7TKtnLjqOdi8PpD5Q
         D4c7UZkDUrX/iRyyxDivdswrFwLSs02ldaFIwai+DTn64PidDW9pkJVGSBWGXRt30dpT
         T8QKcXZWImzRePf1+2AZC+/WC3+RvwOpwazzB+TE0ggh+Il7i3Zy1Y+4fOGNPLD2LUCj
         Ue75lD1SpxazqKwmHsKaQ6TYewjCbRkb7mDrf4QFxIZATiRAbAl/HYYzblJbY1Iy2+7N
         1c7CRGCg1t8KLfSG0/io94dOun2O3AhjByqIuVvOT1Z2sa/4/0xpKRT/7I72eA2D3YJs
         kEuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxulJb23rPYEHSSDkpJrzyWlWvtE3A+JC7fqYsmqYxqfKlkRT6SlqCIx2i6pKg5TlzkvI8g1qDy3a7q9hcclXy@lists.infradead.org
X-Gm-Message-State: AOJu0YzucwBL4+lHje2bdfmwQyt9JVYRfhDj3kJT+e6gAeqPozuB8o1W
	MIEH3OWp5x/mHjXbRn6hNQ8G4EwuZVvZSScvNDEDk8fmJke5R76APDDqOqy6tPd+k2pE/a4a4tu
	BHyP/zRaoVNEvdh0ez3JedJG4wOdpsF2LxYCu
X-Gm-Gg: ASbGncvZOlopV6fh2FVQ3RwwgS0842yzk6MZ8ZzKm15V5K5rKeLJSZi6+J6KB7j1s3j
	71yxMGKHtwHsC8GaguKZKCroBbQbEljseQ3zcqZTrYK+dCdwUu5DZtoEWCPrcluDcdqXE7D7Xlm
	LvGROMV3qrRo3HbB1x7T+UfGuFZfxs5BUVFEEnWg==
X-Google-Smtp-Source: AGHT+IEonmoXFq+Ql657Kw6dLSY0rgGUEYIF0fLPMaaamVLsEFg6KhJOepe80hFReyd4EBHGAz+Lg9VVLfRxSPLAzbw=
X-Received: by 2002:a05:6e02:3dc4:b0:3d0:507f:38dd with SMTP id
 e9e14a558f8ab-3d3048be45fmr6716235ab.5.1740530900058; Tue, 25 Feb 2025
 16:48:20 -0800 (PST)
MIME-Version: 1.0
References: <20250217114831.3225970-1-kevin_chen@aspeedtech.com>
 <20250217114831.3225970-4-kevin_chen@aspeedtech.com> <e43b5f8f-37e4-4468-b3ca-5059a5e6f3c3@kernel.org>
 <6fd7cd57261ddf9831f57dc4c637b24e9f8982d9.camel@codeconstruct.com.au>
 <PSAPR06MB4949C65DF5C034BD6B40C9B589FA2@PSAPR06MB4949.apcprd06.prod.outlook.com>
 <d4945482509cad0bf3e8cd93c1fb21bac2e0c7f2.camel@codeconstruct.com.au>
 <TY0PR06MB4960EA7255DF0BDF235F0D9689C52@TY0PR06MB4960.apcprd06.prod.outlook.com>
 <ba2757fd02b3e7c8f9c862c76f2cfcd2b6bfb41b.camel@codeconstruct.com.au>
 <PSAPR06MB494947E21AB39369ADFA8C9489C72@PSAPR06MB4949.apcprd06.prod.outlook.com>
 <f7369d6205e05c7aac3f3de7cbd08c3b08960d75.camel@codeconstruct.com.au>
 <CAOO6b=udHyXx3QXyUE=siuuJopanUxzbFeBujtqWRy=j2ut4fw@mail.gmail.com> <0008bab55f56252016406e06f147ef52f058bb86.camel@codeconstruct.com.au>
In-Reply-To: <0008bab55f56252016406e06f147ef52f058bb86.camel@codeconstruct.com.au>
From: Mo Elbadry <elbadrym@google.com>
Date: Tue, 25 Feb 2025 16:48:09 -0800
X-Gm-Features: AQ5f1Jrgg80yi8orSiI63M_RmdhldZtwHc2ZYNn_1MdwWw5j1deSt788HIVdze8
Message-ID: <CAOO6b=s4CyVvCP8Gb_OGWCMX3ggs9sm6_WnqEB1h6ScVVJppDQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] soc: aspeed: lpc-pcc: Add PCC controller support
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Kevin Chen <kevin_chen@aspeedtech.com>, "joel@jms.id.au" <joel@jms.id.au>, 
	Z-ChiaWei Wang <chiawei_wang@aspeedtech.com>, 
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "tomer.maimon" <tomer.maimon@nuvoton.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, "lee@kernel.org" <lee@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	Jenmin Yuan <jenmin_yuan@aspeedtech.com>, BMC-SW <BMC-SW@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_004823_855957_D3BE9490 
X-CRM114-Status: GOOD (  19.48  )
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

Hi Andrew,

Understood, your comments do make sense and are the right way to go.

I agree on not rushing, we want to see things moving forward but
properly as well.

Thank you for your help,
Mo



On Tue, Feb 25, 2025 at 3:28=E2=80=AFPM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> Hi Mo,
>
> On Mon, 2025-02-24 at 20:34 -0800, Mo Elbadry wrote:
> > Hi Andrew,
> >
> > I agree that a small layer of abstraction is needed to provide common
> > chardev semantics to userspace. I think that effort can come where both
> > Nuvoton and Aspeed unify their design and agree on a common abstraction
> > layer.
> >
> > I think such efforts may take some time for both to unify, is it possib=
le
> > to get this upstreamed (after addressing all other comments) while both
> > parties work on an agreed unified abstraction layer?
> >
>
> Given Arnd doesn't want bespoke userspace interfaces in the SoC drivers
> this will need to go elsewhere, perhaps drivers/char or drivers/misc.
> Greg and Arnd maintain both, so the patch needs to make a convincing
> argument to them. For my part, my comments are just opinions based on
> my understanding of the use-cases and the SoCs involved, and the desire
> for reasonable devicetree and userspace interfaces.
>
> I don't think it's right to try to rush things as devicetree and
> userspace interfaces can be tricky to change or remove. Rushing tends
> to be painful for all involved in the long run.
>
> Cheers,
>
> Andrew

