Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDDC6CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 17:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BCBIbBYTop5A6jYeRu7ELO0tniBU6tTB+IOx31qQ3MI=; b=KsJ/hBiZ5dlLB6b9hf3TTf+8C+
	lfLohVwmNb8QeZg+IQCYy8hb/geJ4EwxJfD6J10fRt3i86Rc0VppIRrcJff3JCBir94KklWFf1I2L
	gB8IxQbm/XPNJt2rz+1kLVWdv1gLT2PrRDX7NwM2fpWxUAxZxrJF444ZK5fuc6ty/oJYSQlpwa9ww
	XBlx0jgisHljYX6Eddzjh7IeLihQgLVftVrkoSW8w6cxIPt74cTVX8NCEHRPK29PlutQW5qn0JTtM
	+1hJbBxSrXT76+28KKig4YoelCxXgTOD7vde5qFIFV0mBNXQKLxRhGUZwCO2tOyRaGSElOC5vGUZ/
	IZ+Tw0+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3eXG-00000005vEH-04u4;
	Tue, 30 Sep 2025 17:53:10 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3eXD-00000005vDU-0f6B
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 17:53:08 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-84dcf6f28e0so637966585a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 10:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759254785; x=1759859585; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCBIbBYTop5A6jYeRu7ELO0tniBU6tTB+IOx31qQ3MI=;
        b=FXMW7xVeCFKs0LvaBApJEk13GsAMba5iffWdQnRRGt89+q6Sn1uUio78qUvQKdz7lt
         KnTU6yuPVme3bJoFRaUpTQWE3qHSSFCOzGEeyQ3khFaH0REVSUy3WBpgsm82uhTr45j4
         SDG/kJpNFFOpwHWmLXBC7WGh5+lflz8wFVD5d4Z5kVc5Xckyg0JYoMBgzj26JNPSWd8t
         s0auEdIX+CMFTRhY0T2zS8ZzSSwQKwrS7pZsOu0n9+RMgwEcEiEmxhbBYTAFxvf9yt+a
         RXN8r5PZVIsEmFjjlUBAKGgwCQOkO2lW8hrjXFUqbbK2ctkbXTAgki9LrAVCde/v85E6
         MF8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759254785; x=1759859585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BCBIbBYTop5A6jYeRu7ELO0tniBU6tTB+IOx31qQ3MI=;
        b=SMLXqW60XNL564juk0f9Wgc/G1GAV7UWqV4OH8pANABWXs/OSCjttWh4eOFhVJaW9Y
         dfMCiGo6w77XQoC0IigK36/VsbnZOJUojOu4tqreX1NI+1sZbHUAOOgU42kagjtN1sJr
         lD/zGDZCRogEklk6MzDQu9NSb1FknrEMqeXY9Ewf26+rrM6ugFzGfC58arCWg35MeqNg
         Gmz6DnL1GWWgeLZnjjykz3o7eXXDU0j9kYN1n1nnnZkizj7RV/chaV2Uv5hoDDTxl8Bd
         A4vtA7WYehplvQfgMQyXGTOR1sJRe4JY6R+PVh6fc3aNN3JnFoFO53v0b15rtpdqUf7D
         4GPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXf6+CppJDd1OsHZ1XyXkIlYRXtJ4aMVuytI3cZ8IhJrteKQbSLLny2Soo0l59KjI8AOPz4YmoJVQOKbFEi6ksY@lists.infradead.org
X-Gm-Message-State: AOJu0Yzngj0WyCFugaZwKe4eFi6aRrHDP0BnA5Dw/7xB8lin99+2ACIc
	9Lbb03N3ZYJHd12rNG3l+UxFpoAI/Yk2A40EUv3UYjk74fhF/SFpnFCVIgNbZL+jdvYwVo4giUr
	0XsYJuuGMbfg+wLFFBwVYPzADN12gbXg=
X-Gm-Gg: ASbGncv3i6yVr4mAOIUrNdg9ctyYB30NAVkLoWGqBzoMMy8e7LUu/75ozqvSUB6MKm+
	2DmMr/KJaTmrGVXCUkOEtKcfzlT/fAPbJF0W1yAJB/w20I4NMIJvmEUNNl8D5GUlrPjF1mj+m2T
	2rNLzH0bzPrKz32VG2eMx7YVkeWbeKTdkSso5RCRDe+Feu7F+3Tw0xzSedr8k9cbosHB8eEJ/m0
	s5x48T+k/385PWOqlQz7Dhzxp70TTLQ
X-Google-Smtp-Source: AGHT+IH3LG1eaMCJQrs7hRvNNQFjTHAdF3HnSynbQVUv0PZozyh21VEl+N59P07/3LqK4vgOsVNfabWZJIcEr41/YrI=
X-Received: by 2002:a05:6214:2686:b0:78e:c5c7:1209 with SMTP id
 6a1803df08f44-873a6a8cdb1mr8752126d6.56.1759254785247; Tue, 30 Sep 2025
 10:53:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250929065714.27741-1-jjm2473@gmail.com> <DD57IZJQ4FQM.3T5791FLUQ8KQ@cknow.org>
 <CAP_9mL6+uoeG7LX8YCcUFjoU13De1CdPFqxNNfoJvOdsOrYo5Q@mail.gmail.com> <DD63EEOKPWNV.3IK12D6CFPTQZ@cknow.org>
In-Reply-To: <DD63EEOKPWNV.3IK12D6CFPTQZ@cknow.org>
From: jjm2473 <jjm2473@gmail.com>
Date: Wed, 1 Oct 2025 01:52:53 +0800
X-Gm-Features: AS18NWBqxahGz4XH6x393wNkZ6fur-x0rbKIBXXIMh5nx8Rk_7tlCv4UZyCM6zo
Message-ID: <CAP_9mL4CtH1n9RoYNif7bPZ0Lm72zAFyUZzO9xzMUVkrU8n8VA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] arm64: dts: rockchip: introduce LinkEase EasePi R1
To: Diederik de Haas <didi.debian@cknow.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de, 
	quentin.schulz@cherry.de, kever.yang@rock-chips.com, naoki@radxa.com, 
	honyuenkwun@gmail.com, inindev@gmail.com, ivan8215145640@gmail.com, 
	neil.armstrong@linaro.org, mani@kernel.org, dsimic@manjaro.org, 
	pbrobinson@gmail.com, alchark@gmail.com, jbx6244@gmail.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_105307_206436_B50C3DEA 
X-CRM114-Status: GOOD (  29.79  )
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

Thanks for your explanation! I got it.
  Liangbin

Diederik de Haas <didi.debian@cknow.org> =E4=BA=8E2025=E5=B9=B49=E6=9C=8830=
=E6=97=A5=E5=91=A8=E4=BA=8C 19:19=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon Sep 29, 2025 at 8:09 PM CEST, jjm2473 wrote:
> > I have another question. If there are reviewers or co-authors later,
> > do I need to add it to the commit message and send it again?
> > Or should the reviewer or co-author add the message and
> > continue to deliver the patch?
>
> When you get a Reviewed-by tag, you should add that tag too to a new
> version. But there's no need to send a new version to just add those
> tags, the tooling used by maintainers picks those up themselves.
>
> If you 'just' get review comments, then you'd usually just
> improve the patch and you could reference it in a changelog item (to
> indicate you addressed it, ttboyk).
> If you think a reviewer helped you 'significantly', you could choose to
> add an Helped-by tag, but whether you think someone deserves some
> credits that way, is up to you(r judgement).
>
> (Co-)authors are usually known upon first submission. If you later find
> out that that list was incorrect/incomplete, then you would add
> Co-developed-by + Signed-off-by tags on a new version.
>
> HTH,
>   Diederik
>
> > Diederik de Haas <didi.debian@cknow.org> =E4=BA=8E2025=E5=B9=B49=E6=9C=
=8829=E6=97=A5=E5=91=A8=E4=B8=80 18:20=E5=86=99=E9=81=93=EF=BC=9A
> >>
> >> On Mon Sep 29, 2025 at 8:57 AM CEST, Liangbin Lian wrote:
> >> > LinkEase EasePi R1 [1] is a high-performance mini router.
> >> > ...
> >> > [1] https://doc.linkease.com/zh/guide/easepi-r1/hardware.html
> >> >
> >> > Signed-off-by: Liangbin Lian <jjm2473@gmail.com>
> >> > ---
> >> >
> >> > Changes in v2:
> >> > - Change deprecated "rockchip,system-power-controller" to "system-po=
wer-controller"
> >> > - Link to v1: https://lore.kernel.org/r/20250925055906.83375-1-jjm24=
73@gmail.com/
> >>
> >> You received an Acked-by on patch 1 and 2 in v1 of this patch set.
> >> You're supposed to add that to the next/new version(s) or explain why
> >> you choose not to do that (bc f.e. there was a major change, but that
> >> does not seem applicable to those patches).
> >>
> >> Cheers,
> >>   Diederik
> >>
> >> > Changes in v3:
> >> > - Fix typo ('status =3D "disable"' -> 'status =3D "disabled"') found=
 by kernel test robot https://lore.kernel.org/all/202509261328.Grjhp029-lkp=
@intel.com/
> >> > - Link to v2: https://lore.kernel.org/r/20250925092037.13582-1-jjm24=
73@gmail.com/
> >> >
> >> > ---
> >> >
> >> > Liangbin Lian (3):
> >> >   dt-bindings: vendor-prefixes: Document LinkEase
> >> >   dt-bindings: arm: rockchip: Add LinkEase EasePi R1
> >> >   arm64: dts: rockchip: add LinkEase EasePi R1
> >> >
> >> >  .../devicetree/bindings/arm/rockchip.yaml     |   5 +
> >> >  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
> >> >  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
> >> >  .../boot/dts/rockchip/rk3568-easepi-r1.dts    | 692 +++++++++++++++=
+++
> >> >  4 files changed, 700 insertions(+)
> >> >  create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-easepi-r1.dt=
s
> >> >
> >> >
> >> > base-commit: d0ca0df179c4b21e2a6c4a4fb637aa8fa14575cb
> >>
>

