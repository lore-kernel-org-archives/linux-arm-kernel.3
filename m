Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC9CC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 18:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z0FAINHMrT/mXWSwLLS5ITQiWYyUydXHEsbDIHwLkNQ=; b=j1xMy27oXI0eDn/1GyBD7x3aWb
	RJ4kMZbFUkM2YASKqX9nhXOTQKdizLEPBDwwWVTI9e0fsLoOnP+bz3PMrBO1q60m7PCDS5buhoV+G
	SXWwnmLneiLwzCSY6VHqrHr/8NIcVS8TA8u5K9OidfbOS623PGUPJUl5pXeBecxofeE5/SWzgtl2E
	V2LOb3mH7izUSo3w9XjjY79Vx4gFBqIH+3wwv0s2P88eRbqncf4SaXJM5GcK/L+OH401BbhCDJNS/
	+IHHlHZstpDzeKvO1wI4/9TQ/49MZGJgS1aP/1PCCSHKcZlGiU5IMfpYEkBWVYfE9XaZdJVP/oiO7
	1oq5MRcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaIHu-0000000FUDU-3eIo;
	Fri, 11 Jul 2025 18:15:58 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaIFY-0000000FU0A-3vUX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 18:13:34 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-32ce1b2188dso22472201fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 11:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752257611; x=1752862411; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z0FAINHMrT/mXWSwLLS5ITQiWYyUydXHEsbDIHwLkNQ=;
        b=D/iVAXqF601LGlmM3niRqM25qNVDCVn3ew05vXkP6CezuZeVImcd4Dsf1R8YMAHcVy
         X5hCSEf/h7mZ9wptv+aeDDdiTIKtsoaDZ1qThZ5XG9uKZntTqoArqvaiWFR2kxQgaN8K
         UwtLrTyjDkJ74UYqSragvdtlMhHk2RIcBT5fiOS0Y3e47W6PyCLML5OEP2vVNF3lJx/E
         yCkxa9l8ySN3JiRoBSdeeCzRLtvwqwoNRZQVIPpu4JJ9Dwn6x/kVhXtLwoMXVFoOam9n
         nSNCs8L9my4vCCfabACoharzr7d8c3PbBoLaarLoZZTX1g+jt4WOHJjvv5NX0Gq6pL/X
         5O1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752257611; x=1752862411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z0FAINHMrT/mXWSwLLS5ITQiWYyUydXHEsbDIHwLkNQ=;
        b=PUwVe4AppzygWCJYOt3r6WcmRvfKMBw3x3I0zwY7JZYZG1/1WzCwA0hiMpBwkAQRgy
         5t9F19Iqua4kYW6ctUjkB3lMmvXTPI5iKa//TTO/dE5eh21HrMlorNYQ+XqSrEyLtXuH
         qiz1ixwnij+QOAy8LW3s4uwzIOoxAH8rwxkv7VPR280LjO5bH+M3a0BANemvVaib8FMH
         fieAXLdMn5NxRc8Cq5zFUbodtHlLO39a9VADqg4HruZhBk97AsestQE4/ZXSR/NfruKR
         hYWitX9qY+a87QGKt+4oTWgS2P99fxUICU/qSZW7eUCGbBfLvYBX8PWSDFmE//hwAvxB
         Irqw==
X-Forwarded-Encrypted: i=1; AJvYcCU57PSskh0wRxNSm5PHsUZD7HvmUTnqrbkHSwy/tC/AeqLsWXq0qIElsHefH3rHX4Nhp5feviNbqgcupYF1D2xq@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0MYzXjaa/6YD+RGfGCUTyurfgBd7OQCz1+Fs7LX9D9gq+BcB5
	3Lv18uw+rZisEk46YlxN3rninUd6CxtoABhNRu+ihnqjOStVXxZfgL3TpkjtlYa6wTECLHJ8WC6
	t77TEWqqg1prjaEUaVpnz9DTJ1rDVgXRnT8tWLwtbxKheAJj72SLQ
X-Gm-Gg: ASbGnctr4BoIAGdNYmtNgb/MCVzeCoUMU4IB/TtwQyFoIMkz5EuEMrJ4V11bB67gbFj
	9W8GON6gYLAkuQhP6ML2Tf/Vm8reMPi38Xn68PC/qUSEh4uulAcr8W1yEHjL0wUAF8QfaNTidBO
	6TJH9xBiJ0xh86Uh+svLRmdID4hCxN6tfavrbeo8XjEHHvJVnulwjbowUKfNFkNgv7YPixACeeA
	K0ZDoR04xjZPjQjyA==
X-Google-Smtp-Source: AGHT+IFMuBYHoAN7PSAu45/CxJxrRKT9IAF0+U0X5QcMw4v0k+dSQgdIENHIG/kIkaAP4cg8rAILHrMXlK3Z+M3lDSE=
X-Received: by 2002:a2e:be83:0:b0:32a:85ad:2162 with SMTP id
 38308e7fff4ca-330532d0602mr13483321fa.7.1752257611064; Fri, 11 Jul 2025
 11:13:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250626080923.632789-1-paulk@sys-base.io> <20250626080923.632789-2-paulk@sys-base.io>
 <20250704233535.4b026641@minigeek.lan> <20250705153825.2be2b333@minigeek.lan>
 <aGm8n_wJPiGk85E4@collins> <CAGb2v66s-nWA2dFRpgX6DbDET3dWOm1jPKWm1k9SmGSqhTWoWA@mail.gmail.com>
In-Reply-To: <CAGb2v66s-nWA2dFRpgX6DbDET3dWOm1jPKWm1k9SmGSqhTWoWA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 20:13:19 +0200
X-Gm-Features: Ac12FXygNb9Ktxv1UdTrJbOKhH4l5d3j_PT8j5_pIzh_inLuA-iMK4HxDAsC-Wg
Message-ID: <CACRpkdZSXRxhNORJv5TTaf=B5dpUgXfL-PBW1qH7uKC24o=Heg@mail.gmail.com>
Subject: Re: [PATCH 1/5] pinctrl: sunxi: Fix a100 emac pin function name
To: wens@csie.org
Cc: Paul Kocialkowski <paulk@sys-base.io>, Andre Przywara <andre.przywara@arm.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_111332_977151_4428656B 
X-CRM114-Status: GOOD (  17.49  )
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

On Sun, Jul 6, 2025 at 5:04=E2=80=AFPM Chen-Yu Tsai <wens@csie.org> wrote:
> On Sun, Jul 6, 2025 at 8:00=E2=80=AFAM Paul Kocialkowski <paulk@sys-base.=
io> wrote:

> > > So I would very much like to see this patch moved out. Is it just in
> > > LinusW's tree so far? I don't see it in -next yet.
> >
> > I don't think the patches were accepted for over a week so we can proba=
bly
> > still act. I will send reverts, unless maintainers want to manually rem=
ove
> > these commits?
>
> I can drop the dts patches from the sunxi tree. Linus might be able to
> drop the pinctrl patch.
>
> You definitely need to send a revert for the DT binding patch that is
> already in net-next.

I dropped the patch from the pinctrl tree, no problem.

Yours,
Linus Walleij

