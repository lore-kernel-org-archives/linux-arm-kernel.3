Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F80D6ACCD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 13:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0pJ4f5/AA0Na3QRUimWC4sZ6Mc3cd4bD928BKUzVBg8=; b=vDveZm/aOdFVrekplg39SVAIes
	rH+JtshkE9zVynHqh35kzAG0QSjZgLuQVapr8SRzQZflgyadNfGBH05hFkTN0SQsmhOV2rPaBeoCu
	RxHwHgsWU6uqkjyIL/UI+rNB7WKMOJPSPQm7ztXmJZr0PMSRfZ5WPW40NsCQ/B9WycAnvmMWzvw7Y
	XwGwwqtLaQdQL9n3y0LEQpODKChg8WYQE1OMgboUsPmqbbWUXXmm9yUxrhA0cNB8b+iCigxJvnd89
	j+ulnw4n/qK3YsqvHTNVdFnscyXEzGLwd887fi9utXfmb1BkQO7iSrVONYXyYCHdMPGTEVMdq12jm
	qpRJIB8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGHq8-0000000DCxs-2SQV;
	Wed, 27 Nov 2024 13:12:20 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGHpA-0000000DCqW-3hXH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 13:11:22 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-e388d853727so6201430276.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 05:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732713079; x=1733317879; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0pJ4f5/AA0Na3QRUimWC4sZ6Mc3cd4bD928BKUzVBg8=;
        b=Z+6zxDnk3P0XIjUBuh7ChTz9+5bV8ETw8hwg6mmQlFqcc9ogrlvV9Dk4p84VLdfXUx
         hUSJgbG2VkQOysQQelEemPU/YB2LTKhzNebUL6EajD6Fe7FJ/w3k0uXsWPVWn4uWsxvY
         SmjiGWhILizPXpGEgvlSyYrsT53EVZDhtvo3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732713079; x=1733317879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0pJ4f5/AA0Na3QRUimWC4sZ6Mc3cd4bD928BKUzVBg8=;
        b=pEk1ukuLWnSYmkfYvCmj0RtnHJARzOzoo+M8Ggp35aq2Ek4L57cHam/mH873uULD/Z
         ++m+1gAcpK1mFn+ZkiVJ+5xCWnu0xm85l/sB3Ok62f6lu3eujozehLAIfFs/wduvgfWa
         3AXTeecnIvZOKqhYwWVv0N3JxvRvAJAh6BzmTAnW+p5W5j1MByrbS5/fJUt7Z1m7rDx/
         Le1BFOa0aGZp7wJvMEVAZSmWYIAgmQFCgPE+q8Z12apMqo45Jt1oVngtV4a3/oVViY5h
         ElC+nO+SmH5rdDEXLJKm7yylGGatN0bcnh9s/MEdMpsPoh4BY/1IxEtbRzC9TU1CjMio
         ngWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXF0kc2+G3hZOruSh1zrvmArqK8vSD+RwpSTDGZ7RPd4teJTj4YlTZm3f5ZpT0CMFhMCV77cQ9nfoc5Z40zVV3R@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7+84oiIbQ1Q46HW+pY39RPqTsaNx7ynpGO+kaEkyjY7JIGkQf
	WeT1VqzVCV/yPr1NBUG3tLf3Ywt9BXsq5SdriEjUlIQctXzQ6mqhJU0byyNffFoJErcJCp+CI42
	NTVv65ILNMECRPjlk7AgmotYHlxW1mPfcgF0T
X-Gm-Gg: ASbGncumbRk9kWJ9rGEBtVcznzzclX0pl+bNoT4w3YVaQ+qIi4YkSdKJiwU0qr+fTDv
	tnhwpoGn5w4Va84cRfid8jW9xBU68aqdu
X-Google-Smtp-Source: AGHT+IGHme/L5ioql1/e+CfRbka6xoxAYc90GtctpaIvtM30KbIeIU6v/mBHT7nNurKZ5GDi7Le2AMYnuUIp2KUuv5k=
X-Received: by 2002:a05:6902:cc5:b0:e2b:d3da:46c8 with SMTP id
 3f1490d57ef6-e395b93642dmr2466586276.37.1732713078836; Wed, 27 Nov 2024
 05:11:18 -0800 (PST)
MIME-Version: 1.0
References: <20241126103632.419469-1-wmacek@chromium.org> <20241126103632.419469-3-wmacek@chromium.org>
 <473283aa-fc84-4b3f-93bc-653c9d83c837@collabora.com>
In-Reply-To: <473283aa-fc84-4b3f-93bc-653c9d83c837@collabora.com>
From: Wojciech Macek <wmacek@chromium.org>
Date: Wed, 27 Nov 2024 14:11:06 +0100
Message-ID: <CAJrw_jmqfPaOsoT1pneoFuUg9ws1CsDgy3YdqWPE5SoK7Lrv+g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: mediatek: mt8186: Add Starmie device
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Chen-Yu Tsai <wenst@chromium.org>, Rafal Milecki <rafal@milecki.pl>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_051120_911296_A2EC400B 
X-CRM114-Status: GOOD (  20.48  )
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

On Tue, Nov 26, 2024 at 12:35=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 26/11/24 11:36, Wojciech Macek ha scritto:
> > Add support for Starmie Chromebooks.
> >
> > Signed-off-by: Wojciech Macek <wmacek@chromium.org>
> > ---
> > Changelog v3-v2:
> >   - Cleaned up DTS
> >     - Re-using dsi_out node
> >     - Removed unnecessary delete-nodes
> >     - Moved touchpads to per-board dts
> >     - Modified 3.3/6V power regulator node
> > Changelog v2-v1:
> >   - No changes
> >   arch/arm64/boot/dts/mediatek/Makefile         |   2 +
> >   .../mediatek/mt8186-corsola-starmie-sku0.dts  |  31 ++
> >   .../mediatek/mt8186-corsola-starmie-sku1.dts  |  31 ++
> >   .../dts/mediatek/mt8186-corsola-starmie.dtsi  | 465 +++++++++++++++++=
+
> >   4 files changed, 529 insertions(+)
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-starmi=
e-sku0.dts
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-starmi=
e-sku1.dts
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-starmi=
e.dtsi
> >
>
> ..snip..
> > +/*
> > + * Battery on Starmie is using a different address than default.
> > + */
> > +&battery {
>
> I didn't ask you to do it this way, and that was for a good reason.
>
> Besides, you haven't run dtbs_check before sending this.
> Give it a go and you'll see why.
>
> Regards,
> Angelo

I'll update patches tomorrow once I get my Starmie back.
Meanwhile, to limit unnecessary turnarounds, I think I'd like to leave
the /delete-node/ for battery. In case status=3Ddisabled is used we
still would end up with the "battery" alias pointing to the old node.
That might be very misleading if someone ever tries to access battery
node using &battery link. Something like below.

 /*
  * Battery on Starmie is using a different address than default.
  * Remove old node to avoid "battery" alias pointing to disabled
  * node.
  */
/delete-node/ &battery;
&i2c_tunnel {
        battery: sbs-battery@f {
                compatible =3D "sbs,sbs-battery";
                reg =3D <0xf>;
                sbs,i2c-retry-count =3D <2>;
                sbs,poll-retry-count =3D <1>;
        };
};

Please let me know if you're OK with that.

Thanks,
Wojtek

>
> > +     reg =3D <0xf>;
> > +};
>

