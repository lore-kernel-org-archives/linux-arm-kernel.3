Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B527FD4415E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 13:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A6+ZpyLOhT3f784zrDc+JuNqMSJzBaJz/42VFN3wKV8=; b=LvOs3nmZsuRcg1MCAXx9vDyMyj
	Qe/aFDgc1tGjigab06LJhmGz7elAgpwHsOZnA56EavUDl8Ed6uifMukyNBBc7OnvYZqwknzDVUvee
	4t7OSyUJm82iKrtvjceK3UixhJNuCTMYh+K/O9W9m0XfuB+dNl6TkNIUZXqzVpBVSUWC9glt5/rkz
	BLR6woEW0efPb7qsplwV71epVr5M8nOwDKibMbOSDQ/RUwQ95gCyi5YphPePWgxugNGADtHzcYedx
	2ovS5QFhSCcNxmvRqhoIkZFaTVcV0xodkWDZi9noDmInA+nO9rYimtPp+UdiHp7LFxVPAEpSnacbu
	sanQrSSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDOdp-0000000Ca2y-1nrf;
	Tue, 19 Nov 2024 13:51:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDOcs-0000000CZrv-0HsV;
	Tue, 19 Nov 2024 13:50:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D03D45C54D6;
	Tue, 19 Nov 2024 13:49:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88D4AC4CECF;
	Tue, 19 Nov 2024 13:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732024240;
	bh=9Vr1MPxwkShYTEnVAMXZxxEd2d9QIO9yEbNZWlH0Ynk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kE39tds10t/0a1ApkP9EnGqw5CPnz15f1GVrfjpz2MxjDIEzJc4SaEJg2wEf70N6i
	 +THtoxb9YzAip4Lwe1MDsS24nxrH4c30Q/yoe0Vc4Tl05U2RIG08oap3Y70XjgGoc/
	 NVUlzuJLlZ0+umamW3ymW1I8UwmB54gXjrLsVtBwEnxyPu0kBNlhsRwtb9kDVq2YAr
	 P3BkLbpC0PnQACUJu4+K7lQd9DvBkBbBlczqaUDLMOnkSFetgOlhgR3Fe09Gv/5Wsn
	 IGrGtJ9ODQbo+s45rQaT1024Mypt3tPqMORQbbMgNhybGDV278s0C45G8z6zE4teti
	 2ut1umgy/O+ng==
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e3873c7c9b4so985496276.3;
        Tue, 19 Nov 2024 05:50:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWniD+R4CLTO4eCop6uOkYVSSbmkOmz+bZPvjJNwEZhLJ+Pw7h0y7QMYdeB8+V8j+jExIWSv6JUawGRs9jiXOgh@lists.infradead.org, AJvYcCWw2nSo7wzGWK79LRVcQkL23lQ7GgbmyxEXHgGyJhrBhUVaXISVjg6M2C+hvRhFAoMi5xRz5H3BMgmZ9KGHees=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw81K2Fxprbj1DYR78fGv6YnHPqGEF8y/ct2MXahbAje23LPA95
	nIDAcAy40f1vtg5jljZoIuArI2TaXXL6jMEOfwALtfQi3y+mm8Pyn/v5EaJ8hQKM40q5ojoVLet
	5RkG5v65rK0xSkteGyrQkhcmuEA==
X-Google-Smtp-Source: AGHT+IFrbVWEjcnnhPqVNNfoXdE4uWtL2uLFR/SuylPMYdOzh/UX0ZGOOJf3vv2vFR4zxFt6d8SFt3K6oxKtqNeW4hQ=
X-Received: by 2002:a05:690c:60c5:b0:6e2:1527:446b with SMTP id
 00721157ae682-6ee55bba6ecmr186681327b3.3.1732024239764; Tue, 19 Nov 2024
 05:50:39 -0800 (PST)
MIME-Version: 1.0
References: <20241018081050.23592-1-y.oudjana@protonmail.com>
 <20241018081050.23592-3-y.oudjana@protonmail.com> <20241031161906.GL10824@google.com>
In-Reply-To: <20241031161906.GL10824@google.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 19 Nov 2024 07:50:28 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq++_R3ZVrtrXYXbqODuHteJb4akq2NxMoyjO2wRvKYKdA@mail.gmail.com>
Message-ID: <CAL_Jsq++_R3ZVrtrXYXbqODuHteJb4akq2NxMoyjO2wRvKYKdA@mail.gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: mfd: mediatek: mt6397: Add bindings for MT6328
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	jason-ch chen <Jason-ch.Chen@mediatek.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_055042_148425_34C865AD 
X-CRM114-Status: GOOD (  12.50  )
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

On Thu, Oct 31, 2024 at 11:19=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> On Fri, 18 Oct 2024, Yassine Oudjana wrote:
>
> > From: Yassine Oudjana <y.oudjana@protonmail.com>
> >
> > Add compatible strings for the MT6328 PMIC.
> >
> > Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> > ---
> >  Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
> >  Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml      | 2 ++
>
> Doesn't seem to apply cleanly.
>
> Please rebase and resubmit.

mediatek,mt6328 is now flagged as undocumented. Please resend this.

Rob

