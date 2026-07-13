Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C5CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 08:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cK7IMBHRP2FdUnWCkfnYLPOObmzv4mtZRa495nyVkt0=; b=zsrcEpounT8ntl4bbEqvHt9UsT
	6Wd0gFvQW+Nl2+nN4netOE+xSkeFVLLxlbSBrkvcw1niyLSIs7u6DxOICcoxYtSfG76/7rWpyJSR6
	xh8BU3n8O4Xz06RnUaJJhIEiMz6NbWHa5saNUXzBl4EoeS2cjmK+lOyMAwIWZa0ps9XC7HG2rABQ6
	EDpoYpoHjkoW6OMwWnUsfmhH2qNabKQeB2MfJr3i4zLJRkn1k8Rkmoa4BQXrTMlIwTS9ZvRMxVhuT
	A4X5h9py8rbBDCFDGUyarFpBdVWlVWUUdK4SRRWHg7ydt6fHW+NtRIsoof4sNMwBDD8PaTVYOtOtF
	XAPajijQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBzW-00000008Zk9-26Pk;
	Mon, 13 Jul 2026 08:26:18 +0000
Received: from mail-qk1-f179.google.com ([209.85.222.179])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBzT-00000008Zj9-48zv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 08:26:17 +0000
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-92e50979c71so283029885a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 01:26:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783931174; x=1784535974;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cK7IMBHRP2FdUnWCkfnYLPOObmzv4mtZRa495nyVkt0=;
        b=E9UE4moNJrNcA+ycyG+F2ID9WMy6DG2k7jA/ibhsYlTlLyLFzxPSSMTk5VSNghhJ4e
         L6wjCX2pPrYKjftN1Bxhe4TMlDgs2tLOpjsrYWq5PZIVQSzNXMZrPagkqOxajnfCjKww
         z8IKxV1eWVRX4a/X/ZyXEICPvIHgSR92wEuzG1vw37vSTW1kUJLn7PbZMcKc8MeM1NCE
         kemg6bMpe7+1uSaSPP9kaPGHKHOQJTHuRUqRp2gic/mK5EaoezWzKIYqM0CjcyvH1ORk
         QpvZ6nyO7rz5YRrrAuzsGVdH6CdzmiKlYxqEBu2pMx9xB1jZdv2NdwaTyip7LFRYwCKh
         CiEA==
X-Forwarded-Encrypted: i=1; AHgh+RqiZN1G0qaXzbzqqW0eR07hsW4dYuLP9ucc0FiljCA/ewmbr9BNLIcns0nOVrY4w0bGF1i7J5irPCo4UEebXidE@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/UWhJEFJTCPnng7wnx8I9jYqzji+9VtftZXZXbmW8p9+lgMji
	kKCTlFWWLokbcrJBBbz3hhkKuDQ3S8WPEUNb2pPik59yhzdqdFztIrGz7/NDOJmO
X-Gm-Gg: AfdE7cnr97V1pqroLv8QF0fHsabHyIUj2eesu15GgE/B20m/UXQK1KNs25aj5x9eenY
	MxD7ELtEHyau9daMVulxfdqTmARLHp6TBw54Sgxo+Vsz5Fzhgx44E940GUdbEhjEtwAwE7aWWzc
	wi5uDOW9sQrcTKLOtn9oipQRsDnYDPhajWx20D1USMin/LNYrh/S/dvB9xclinMV+C/ESifWnS6
	xqQvUvI0kevCnMKeS/55Gk6NPn0fQXE4twH5F/i2ERzFODf1SfUTiRv5eJk7OqG1WMHgRGm5tOn
	kKTxtSXZ6CLJ5oXqo2se9eTyjAT7YqV+osMoQZvWZ3lRbPu60305xWbGTMvetJNwnZSGnJyWVbq
	Xe8g+ieiav3Wl/killH0efZqynIAIauV8ly2bk2cGbhkNh5AwjXQ7N32Puv/d61Dvu8jwJbfyCU
	XzsRgu1+iPHW5zdyg2AHxdT+fgrkEW8eeXizBnM4KBKg3vCELJ608BWsG9VI/i2GwS
X-Received: by 2002:a05:620a:bc9:b0:914:cb07:447e with SMTP id af79cd13be357-92ef2b96b37mr873771885a.5.1783931174359;
        Mon, 13 Jul 2026 01:26:14 -0700 (PDT)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com. [209.85.222.175])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5d36a22sm1011792285a.39.2026.07.13.01.26.13
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 01:26:13 -0700 (PDT)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-92e50979c71so283028485a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 01:26:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrBMWxJF1xcCU7AubTjA2EG4hXONDMV/ODqndVfE6FT+Eqm+FvuifdCCaP0yBy86F6/KKn+pl61aFEBSlTLICdk@lists.infradead.org
X-Received: by 2002:a05:6102:f83:b0:6f0:3c5b:ce7a with SMTP id
 ada2fe7eead31-74533d7c9f8mr5298165137.17.1783930755575; Mon, 13 Jul 2026
 01:19:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1783505142.git.geert+renesas@glider.be> <50f5804f00c55cd60604d00da1bf1f1dc912ba8d.1783505142.git.geert+renesas@glider.be>
 <alQTnZwVRwpVTVUf@monoceros>
In-Reply-To: <alQTnZwVRwpVTVUf@monoceros>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Jul 2026 10:19:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWMS0ymenXwSasZ7f5aTcK30kTxq8U2W3Dhj43y1UAcTQ@mail.gmail.com>
X-Gm-Features: AUfX_mzM4sxy25iOR9jBU-xAME53IzNcexx6a8MgetXZ4RYeb2wzLaySAOrHbao
Message-ID: <CAMuHMdWMS0ymenXwSasZ7f5aTcK30kTxq8U2W3Dhj43y1UAcTQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] clk: renesas: Add R-Car X5H CPG driver
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_012616_027771_FD434E41 
X-CRM114-Status: GOOD (  17.66  )
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

Hi Uwe,

On Mon, 13 Jul 2026 at 00:22, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
> On Wed, Jul 08, 2026 at 12:15:08PM +0200, Geert Uytterhoeven wrote:
> > +#include <linux/mod_devicetable.h>
>
> Please don't add new users for this header file. Only use those
> <linux/device-id/*.h> that you actually need (if any).
>
> Ditto for patch 4.

Thanks, will do after the rebase to v7.2-rc3 ;-)

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

