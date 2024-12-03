Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3EC6E74AC2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 16:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6QU1EnJ1BaXMVfYiRhAHSxvTRukbAoSNbyni68t4ov0=; b=CCSGW6dKOACzjRhM1Y8nOnsSct
	CVnHLu2Re8YYda5x22LWFFf8SEFOCX0U7j85kFV9uygQUmsu7UclJRdLFAI8JjwnoRoK+Dt9WjQsz
	Cwntq9TGm2F3Ady+v6l5Jt/aujmJKMEBTnHk9pV1t1eBIbGkMbnTBgFROxrhrv72Rb6t119GCdXeY
	FKBCxd1uN8zHTFPpjPfNKnzK8RSGwwA2Wt2HhMGaLtArfTtCtrxeIO2kE5jLnaIvI5CVQZSFp6J7a
	loiBDqYPXQW+1Kaf5Ty8MrxUOkOZzg0NTrf5L/BeLVwFZa8el4OQVl9fp50nnaloIeltSwXs23y4V
	NBnl2T0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIW09-0000000A8Sw-3K1a;
	Tue, 03 Dec 2024 16:43:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIUpy-00000009vbv-2xuu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 15:29:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733239757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6QU1EnJ1BaXMVfYiRhAHSxvTRukbAoSNbyni68t4ov0=;
	b=ERc8R8C3OspZ0sxJIq7HldS15/ulZgM4RtlcC8GhpkMQUdKFqlr26yfjS0lvmzsmQ5Ji9f
	ZtSNGL/LbI3xMBU7rUO1gqJXB6weRDZIO0t2aCQlrMDHaMgmjmGWj8knH0Q6r/A+sS5H7Z
	bOlxU6AhWfKfE8gwnPi13AqcphYwN5k=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-2Vxy6k14P_idofXtzW-6oA-1; Tue, 03 Dec 2024 10:29:14 -0500
X-MC-Unique: 2Vxy6k14P_idofXtzW-6oA-1
X-Mimecast-MFC-AGG-ID: 2Vxy6k14P_idofXtzW-6oA
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-71d53c323d0so962915a34.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 07:29:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733239754; x=1733844554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6QU1EnJ1BaXMVfYiRhAHSxvTRukbAoSNbyni68t4ov0=;
        b=vA3YfcfupDvIjHKe02I9bmLawZpd3mcPPMydPjW5dgSj/mkZditYj9iFnmR/SSY+7D
         a2/p2Wmy3QRfKE5hkHe2IGgHsKURW5lMEtOVWxYn34zbwUEHh/2lQvXfmrAfMprV8XI/
         XTB8FmmM0HRcoa06ubHk0Xa4iuLjtCfaPKii8jBiVutG10p50tfgxAVYJ1R1drHpvu+F
         T/nfmUmcAhDsOxUSgBNyVAMiHK3SEqTBk8OK83DBozEYYRFDnPQjmFdw7flycgJQqdSb
         vG23CASH7NOvUDj6a26d4ZEdOz5BMk0c2rQFhZCwPZLNfOta6iEYbGEQh8xTgI3Turay
         2UXg==
X-Forwarded-Encrypted: i=1; AJvYcCUXO1Y+VL56bGxQpXCkK4OwBNcB9/4K61gsvWasbHpeLTysNMFVz7u1XdBFzipm1BtiGJCubt13BGg9se2RvLWQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxdadm1VbrY9Fv7qZBzrT06jGBDb30mV01CvMUp+8c/mJzmw6Y4
	8R/TCYBbXF1EGuiFKzUAt6A/nJviTEU075Adgc3uvQUFONyhCpJquRGELxaPiRjNaTCHLIh1cN7
	CAVPMDLvlyMKnC2+k+XYrgETMhb7wXyP3PCBEhxXutEHNghYAqv7PmXMlS/GUdURxVLSlDsZYFi
	Ptlyc3ebZQfSC34umIINTHILsbquv+T+ScVphKl3xuwwvCy6M=
X-Gm-Gg: ASbGncvbZ7tRxF+Co1SgGWU1zJBKpq8JFIvkn85V4fZcomWcY515IncxeIuz8rOmOwf
	ku3b/DvwMz3Ml4fboFGskP1iUmfE6UQ==
X-Received: by 2002:a05:6830:2aa5:b0:71d:5290:4b0a with SMTP id 46e09a7af769-71dae4057famr723610a34.0.1733239753809;
        Tue, 03 Dec 2024 07:29:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHowgZk/e3MXb1mhieu2vCwR76idfUlz6/II/BUj2dbmWaA1ntB1qRuQmc4QRLODYAXY7IRZgLgXUJnlG7wXdE=
X-Received: by 2002:a05:6830:2aa5:b0:71d:5290:4b0a with SMTP id
 46e09a7af769-71dae4057famr723600a34.0.1733239753522; Tue, 03 Dec 2024
 07:29:13 -0800 (PST)
MIME-Version: 1.0
References: <20241126-am69sk-dt-usb-v1-1-aa55aed7b89e@redhat.com>
 <2nuncc5rscu6h74ylaiu6yozg34aoigaj5d4uzvdtolt5q7bmv@6hacpxyb2532>
 <CALE0LRtUN2N_Z05jH_BMSg7yvirSRob0pSErmQxTu8AatmODgw@mail.gmail.com>
 <CALE0LRu-Sx5oTVNY3hm+Msu-zb04a7_ZD+r3xF1eRfR_WtK0VA@mail.gmail.com> <wbsg3fmco6rwjj7vtiqtqv7trfjor73j7rjx7efnlafo4pz4bc@awixm2iygd55>
In-Reply-To: <wbsg3fmco6rwjj7vtiqtqv7trfjor73j7rjx7efnlafo4pz4bc@awixm2iygd55>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Tue, 3 Dec 2024 16:29:02 +0100
Message-ID: <CALE0LRvZNnNJ8jBG35bU8Ev5Fvr2400O5qXUsRn0zufkidJeJw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am69-sk: Add USB SuperSpeed support
To: s-vadapalli <s-vadapalli@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dasnavis Sabiya <sabiya.d@ti.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 556YmdMlPnHg3PFWHFWcBEl_073qbJd3xufZzh-g29k_1733239754
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_072918_831177_65F7F431 
X-CRM114-Status: GOOD (  25.53  )
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

Hi,

On Thu, Nov 28, 2024 at 10:58=E2=80=AFAM s-vadapalli <s-vadapalli@ti.com> w=
rote:
>
> On Thu, Nov 28, 2024 at 10:47:42AM +0100, Enric Balletbo i Serra wrote:
> > Hi,
>
> [...]
>
> > So I changed the dr_mode to otg instead of host and tried to configure
> > a usb mass storage gadget but unfortunately didn't work, but this
> > could be a driver problem, I got the following error
> >
> >   UDC core: g1: couldn't find an available UDC
> >
> > As the devicetree should describe the hardware, and as far as I can
> > see it should support the type-c port act as a gadget, I'm fine with
> > changing the dr_mode, unless anyone have more information about this,
> > the thing that makes me think a bit more is that, in the TI kernel
> > this is set to host, so I'm wondering if I'm missing something or is
> > just that was never tested.
>
> Are all interfaces (Type-A and Type-C) functional as Host when the
> dr_mode is set to "otg"? (Do USB devices connected to the interfaces
> enumerate on AM69-SK?) If yes, then it could be a DIP Switch setting
> that is related to OTG mode of operation or a USB-C Mux that needs to be
> configured.
>

Yes, all interfaces (Type-A and Type-C) are functional as host when
the dr_mode is set to "otg". Looking at SK-AM69 Processor Start Kit
User's Guide (Rev. A) [1] I don't see any DIP Switch related to the
OTG  mode. Looks like the type-c connector connects directly to the
SoC through a USB HUB (TUSB4041).

[1] https://www.ti.com/lit/ug/spruj70a/spruj70a.pdf?ts=3D1733215039014

Regards,
  Enric

> Regards,
> Siddharth.
>


