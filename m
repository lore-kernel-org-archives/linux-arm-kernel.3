Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC37D59D92
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 10:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0tb/1VpCPVFgloHLNFl73KUluXt5M3902QRNEkET+pg=; b=xh5A0hl9lq4AHVUYkqu2chI7n1
	DwtKZYx5OHDr/ZY6HVRhUe+a656tgl4KGfUvbeTGULmattrnY3OmekszjnT43fh2QEjsAt9NFjuCT
	fbXxBRKmqQ9SdtqitAqZmrFKjtbLVArQ2QrPpIHz3Yz9/GWL3r/7+vnOs9q2TUUlopjNR6LbKGKgE
	qf9RVU0sgdGqQQ05HtUUZxE7Is1rh8Zl4pm1EGZx9aIOSrTUFUWN+XtmKFEwF4d1alyydqF2n8kaq
	sFWFi0HyTxZv8VX5whSIeqa2xTCWVoebIYpijJtD0hfTrgHsLFZayUwijPn3sjmSLfABhrfW9mJRD
	ye8NCTXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFsfR-0000000AHp7-1zMS;
	Tue, 26 Nov 2024 10:19:37 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFsdI-0000000AHI7-0d2a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 10:17:26 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a9a0ef5179dso776544866b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Nov 2024 02:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732616242; x=1733221042; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0tb/1VpCPVFgloHLNFl73KUluXt5M3902QRNEkET+pg=;
        b=AVAAkVSgA5VPhQyPNo5lRHkagTxYir27RwuGyKqog+KI0siIHSGb9yZC6CsjlKTGqR
         wA/fgBDCTBscy830ssVhypsspx7Es9tBip2Ttpson+inipblMqCVFrseu4Wjee9b2Yoq
         NC04nA5FlH29ySK7sJ4bkiFmVRpdnaAD19YJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732616242; x=1733221042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0tb/1VpCPVFgloHLNFl73KUluXt5M3902QRNEkET+pg=;
        b=EgnEphr7+A6fiJtTscHHcKXhYi+Dnay5vVwlVjl4bcdtlKheRbyJWv2oxWGPE764xX
         z3gHcYWHQqjBVnBSoyNajDaDjKwlfmkWwWaqBDMb0yZGTWbHCRJAt5hMehn5EfdMQsTs
         3boMZ6PgcFiPD7UMG+c2Iqw9mEym1/YwZomi23PhfIcVbeTOC6/EYizbjfk4nQjd2Kba
         mjAT/9cVcd1qUn/U6nB0o56SWSARwm5eLWnmO7Tgx7PdcO8gvSArSC/S/hvD9o7bfS+4
         +ZVnaPkPca9A3yBlBAXjPFPOTsmsXgAAfg/aEHGvtGGCvNDHczlu24QNODJW+vX78oZ1
         S6bg==
X-Forwarded-Encrypted: i=1; AJvYcCUdId5Qd4G64ONs3/Sob5Zr3aB8S2K5ite12sucYw5dz1MEH8kjehb1eDahiOCRPy9yr0W4jXKMkNmCdjobsdfF@lists.infradead.org
X-Gm-Message-State: AOJu0Yxb1JhJ/I/CpPy2XwfqWrQ7lI6mygGK1o1BEqFrkqWQJmJ0T4bV
	q1j72qqfGOSoY2rJW7pq3deExx5pYP3Q/FRHxx6Y8KTHk3vlmV38amzuryMEgoF/4tDmBskggtO
	uIA==
X-Gm-Gg: ASbGncsGJp6QSEcpDqVIjWkeXnsiq/YINmqw+tDugtCGV01gB9a7A7A7XOak1vreTyN
	+dMfiNebu2oD5W40D6ZRms/pB9fclJ4C4X1/1G9x4reZIdNBIJJDII9vg1RRpjUsvUIO3ujhznc
	nu3mU6dxwSyO++pwJxJNxvo4NzuHiLrBBcGdHg9fnya5yQYYLt6eME9XMOVSdZ7PCsTpIkuqRLA
	XNF60CpHwlP4veromaRjD1usJP8BlfMIe+9U2NTQCVDeO87jj/SOCPoaWq6U0dv6015dGnogidi
	MA6TYNMtmNnnBGCt
X-Google-Smtp-Source: AGHT+IFO8iCq4zqd+8gLMB0g98dQh8HakwF1G2HOVdnwO9up1PS3gafatBy2wgEdkGuUDPo3sjFoow==
X-Received: by 2002:a17:906:3cb1:b0:aa5:2d9a:1528 with SMTP id a640c23a62f3a-aa52d9a1585mr940458066b.60.1732616241743;
        Tue, 26 Nov 2024 02:17:21 -0800 (PST)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b52f781sm580805166b.108.2024.11.26.02.17.20
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 02:17:20 -0800 (PST)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5cfc264b8b6so6669a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Nov 2024 02:17:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVNSHFeUJZlhRoaL0tTQ0Kq2IDCvsrsF2uGTXPCj2JxcAfqQ6QpLy/3SryGksXEQVfwGSFaGfQfw3IX0fhmZSiU@lists.infradead.org
X-Received: by 2002:a50:9505:0:b0:5d0:b76:3ae1 with SMTP id
 4fb4d7f45d1cf-5d06f5111c2mr40797a12.5.1732616240006; Tue, 26 Nov 2024
 02:17:20 -0800 (PST)
MIME-Version: 1.0
References: <20241126-damu-v4-1-e746eec2cb52@chromium.org> <9004a82a-56a3-4d88-b0be-7e9d45932607@kernel.org>
In-Reply-To: <9004a82a-56a3-4d88-b0be-7e9d45932607@kernel.org>
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Tue, 26 Nov 2024 18:16:43 +0800
X-Gmail-Original-Message-ID: <CAHc4DNKNrOUPJ+3DE+f+78-SAeQkuqEHqFXmwwaPTG+ni_1MMw@mail.gmail.com>
Message-ID: <CAHc4DNKNrOUPJ+3DE+f+78-SAeQkuqEHqFXmwwaPTG+ni_1MMw@mail.gmail.com>
Subject: Re: [PATCH RESEND v4] arm64: dts: mt8183: set DMIC one-wire mode on Damu
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hsin-Te Yuan <yuanhsinte@chromium.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_021724_179629_30C86341 
X-CRM114-Status: GOOD (  15.86  )
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

On Tue, Nov 26, 2024 at 6:05=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 26/11/2024 10:57, Hsin-Te Yuan wrote:
> > From: Hsin-Yi Wang <hsinyi@chromium.org>
> >
> > Sets DMIC one-wire mode on Damu.
> >
> > Fixes: cabc71b08eb5 ("arm64: dts: mt8183: Add kukui-jacuzzi-damu board"=
)
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
>
> Where did this happen?
>
https://lore.kernel.org/all/01020191db901d32-5c318445-b8f4-4f4d-86db-316dc0=
db04ec-000000@eu-west-1.amazonses.com/

> > Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
>
> And this?
>

https://lore.kernel.org/all/5a668114-2ae6-4217-9614-b690c0870849@gmail.com/
> > Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
> > ---
> > Changes in v4:
> > - Add Reviewed-by tag back, which is dropped in v3
>
> This resend is very weird. Didn't you get a replies that this was applied=
?
>
>
> Best regards,
> Krzysztof

This patch had been applied but was dropped due to missing a
Signed-off-by from the author
(https://lore.kernel.org/all/20241009071543.5230cf79@canb.auug.org.au/).

Regards,
Hsin-Te

