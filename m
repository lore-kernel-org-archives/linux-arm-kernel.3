Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C774BC02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 16:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/OOZAk573KBIPXdQ0sttl1zQn0JOhz1RA0dJ6LznH6g=; b=c84TY6ohs+9dBx3heHz0livTG/
	QaRVH0SuUc4wDT4JTQ0o5f0gie8msBDDv0fVDvK3+UrNAHjYxfarm5qq1Late1R2tZty8ZXxcexPg
	YVtEkdzt/eIUSEyJOK/V8BPgAUX3E6qCaGjq9AMgyq4jSYOK0wa+bC58HXBWA/7r+yhRa3sAJQMkR
	lHuecdDP0d9n6aINVo+dD0maJzT0Tn92KSkGVcNm9okoFROsd9MFxWywnRHXHa/w7r9zgDHqaCmpP
	DR04/S+2nU1OCA3iPNHzKByMVeIUmGN9Tw/JoXHJXu+hA96sIhMZIr27CNc/CINLorZKQ+csXdylj
	mRnQ+GHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb07w-0000000Cpck-19Ns;
	Thu, 23 Jan 2025 16:32:20 +0000
Received: from mail-qv1-f53.google.com ([209.85.219.53])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb06d-0000000CpSs-2ctY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 16:31:01 +0000
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6dd420f82e2so14184626d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 08:30:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737649857; x=1738254657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/OOZAk573KBIPXdQ0sttl1zQn0JOhz1RA0dJ6LznH6g=;
        b=oYwowT5jvEeCdi21BefhvbrnS7vjbh/e+YeQ8wU6ihN9ERT3QrPeHmNdZhxbhkCtpy
         Zr/g/1SuBja+gizmICJpqPSMCm9gZR2mb0jR6RLzPLy0ecSUAOYqhasmocE/oCIYGaDX
         8A3wNR/12zVqelrnfIqaXWY2Zw/fCutsxsjHOgejOT+idmFhLv7hbk0td31VA3Hp1wul
         t3I+nBOevGa5Q0hGG2knqmCcSzf7Dk9Q0K0d7IFuFnrYXtwL5HcMXgCiF3XFgtNdgZZf
         KT8/6Ian1dtn15920pObhF9qBe8/3rrjWDfUUEb3G3YN3BEB9LjI/o6gkickreT232iJ
         NtFA==
X-Forwarded-Encrypted: i=1; AJvYcCWTF1np9PPgfUzm5iSG90cP0j9BLw4IHenrTVgjxlhRB1ZSUfSwFnpcSmV4hppdbxTiD+u1KonfMC72SX229sZb@lists.infradead.org
X-Gm-Message-State: AOJu0YzFa+rjdBnUlvGOvRQEnR6dXVC1P3bMoEr9xC6sYYRcEz/JgU/Y
	jcE7by3bFe9xufs3BBBCzZXBjZ6vCEUpvfPVGl+gZsVXAoA37A6sjKcQxOXA
X-Gm-Gg: ASbGncuEzebe2pbEpVvHNDz4LAkE51SdXyVvXXKtHT6CdXOJg5s2S9iU9XzuYKz++tK
	ctnbkEUYJfFm7QuMC4lHRHUwaGCsxpOPVMWWToVU5HleltpyrMdrt5ZdH9K3tuCNWgs8tkoVkrc
	PnGTDdAPLz6zJ/1rx4rgsTncuOUdeKjCMahE5kMe0JRWg9ya9fKPL321reb7HEc/tOasiEXQesA
	2ss13ZUQZFIpX5wMuBnRx70GwZJ3rzSsuJsh0V/cPjv+SjGhq2siixSO61+dN3hXx/mVGGKrCsp
	03NhqQ2NuDyqNP6PyF6aWYhpYIcs9M4EdBIi5RRW8HLELg0=
X-Google-Smtp-Source: AGHT+IH1rn+8O138IhjNBRadHWq8+cEErY4CWHqPCTFEqaAs7J4/j+DHYeKkm7iAaVn025BNHNENdA==
X-Received: by 2002:a05:6214:2aa8:b0:6d4:1ea3:981d with SMTP id 6a1803df08f44-6e1b223031emr390772386d6.43.1737649857552;
        Thu, 23 Jan 2025 08:30:57 -0800 (PST)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com. [209.85.160.177])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e20524693fsm133066d6.45.2025.01.23.08.30.57
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 08:30:57 -0800 (PST)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-46c7855df10so17424121cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 08:30:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXsYbVkQK5SSdMeYv5T4CtzlhapKE8cXMIv1EC+tLDDzwcyb4gfqw43tijAybp6IIclAObwNyobVXSfU1b3jY4O@lists.infradead.org
X-Received: by 2002:a05:622a:47:b0:467:5d0b:c750 with SMTP id
 d75a77b69052e-46e12a690e0mr384445131cf.22.1737649857108; Thu, 23 Jan 2025
 08:30:57 -0800 (PST)
MIME-Version: 1.0
References: <20250118111344.361617-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdUTQ=4K8P_TgTp_b=NDdimgXJgW_nhO1ZJa11C846Bubw@mail.gmail.com> <61d3d9c1-cb43-4b29-81e2-1c6f189191d0@mailbox.org>
In-Reply-To: <61d3d9c1-cb43-4b29-81e2-1c6f189191d0@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Jan 2025 17:30:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUCEshShnrNgxcLy1ii=OKt957aofEKm-1NRdzwMQ1p_w@mail.gmail.com>
X-Gm-Features: AWEUYZnhg-6RrWKZLzBa-_4Pv7SVHAFC90S4-tDaNOpf85kbrAi3FkAdF0fGMVI
Message-ID: <CAMuHMdUCEshShnrNgxcLy1ii=OKt957aofEKm-1NRdzwMQ1p_w@mail.gmail.com>
Subject: Re: [PATCH 1/5] arm64: dts: renesas: r8a779f0: Add labels for rswitch ports
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_083059_664255_F3C51AF2 
X-CRM114-Status: GOOD (  26.51  )
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

Hi Marek,

On Thu, Jan 23, 2025 at 5:20=E2=80=AFPM Marek Vasut <marek.vasut@mailbox.or=
g> wrote:
> On 1/23/25 4:25 PM, Geert Uytterhoeven wrote:
> > On Sat, Jan 18, 2025 at 12:14=E2=80=AFPM Marek Vasut
> > <marek.vasut+renesas@mailbox.org> wrote:
> >> Introduce labels for each rswitch port in the form 'rswitchportN'.
> >> Those can be used to access rswitch port nodes directly, which is
> >> going to be useful in reducing DT indentation slightly as well as
> >> in DT /aliases node to reference the rswitch ports as ethernetN
> >> interfaces. No functional change.
> >>
> >> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> >
> > Thanks for your patch!
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > i.e. will queue in renesas-devel for v6.15.
> >
> >> --- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
> >> +++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
> >> @@ -974,15 +974,15 @@ ethernet-ports {
> >>                                  #address-cells =3D <1>;
> >>                                  #size-cells =3D <0>;
> >>
> >> -                               port@0 {
> >> +                               rswitchport0: port@0 {
> >>                                          reg =3D <0>;
> >>                                          phys =3D <&eth_serdes 0>;
> >>                                  };
> >> -                               port@1 {
> >> +                               rswitchport1: port@1 {
> >>                                          reg =3D <1>;
> >>                                          phys =3D <&eth_serdes 1>;
> >>                                  };
> >> -                               port@2 {
> >> +                               rswitchport2: port@2 {
> >>                                          reg =3D <2>;
> >>                                          phys =3D <&eth_serdes 2>;
> >>                                  };
> >
> > Would you mind if I would change all rswitchportN to rswitch_portN
> > while applying, for consistency with other Renesas DTS files?
>
> Go ahead, but also keep the commit messages in sync .

Sure ;-)

> I can send a V2 too ?

No need for that, as I already made these changes locally.
Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

