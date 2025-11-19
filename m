Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 326B4CF34B2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 14:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sAF6O44vT1Mi7jeJcCwnvWvkPvnj9D57kUtkjUGBZbs=; b=OzfVIHnOV7blp58xAFvQsWXDZP
	L0ifU3WphnGAy4go2J1vTMsCCuYfLNcBNRJTGqprI0pWEYYXmaBpNpLBw2i5ifQ5tnSlJ3DCFt4/6
	RA5gJJkx8Kdn4f4zax+4SIQTuMPxgC3WIs449SnrvQUaY0Jw2uPcEg9pST+rFo6Sq4ZVGTwzp4hK8
	3oa6b5Sw1ajBLUTW3YCEztinMOYLRCtp93LGp1owmV218SWclJhTUgucAdtOQbUdtXAsXWYp/OZkS
	M77x46m9KgRhV8k3Qh+10c1W0zNhSvuwsDYGIq5kZEfKbElWuiXUx2e/3ke4DF2M1dc/lB0xCSAak
	5Qs5iwyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLisi-00000003Lfg-2ceu;
	Wed, 19 Nov 2025 14:10:00 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLisg-00000003Lf7-23GP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 14:09:59 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-787be077127so67431007b3.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 06:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763561397; x=1764166197; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sAF6O44vT1Mi7jeJcCwnvWvkPvnj9D57kUtkjUGBZbs=;
        b=ngsp6LJdZlbjo3jPuM3uLElnCWSkSZpLC1SzvCFycHO7XbETXRkJ03h54Sadixj/YU
         QfHzEJZYtZA0sBrHJbiaNJdrpt+uTA06FAJ7jBG56+CJF/Up6y8VDS03xoZmsotKwRSc
         65i07wteny/8wcRhtd7g3mL9515Ly0azDpf9gX/Pd3zUVIjnSNW4dMpyM8F8qqPfHfe0
         W5kgLLgvKVW88fde2xeo/UhfzfBooSK+sqz/+YS0L7dmRimHhV53ZtIMsUVZG1HaAYHf
         /FVy69cnFX6SfD7ZFT5kw3+bXPasU2Byayst0nXH2RkclPOemRAz9yEw9KDJmeys6E4B
         4Bog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763561397; x=1764166197;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sAF6O44vT1Mi7jeJcCwnvWvkPvnj9D57kUtkjUGBZbs=;
        b=LqMOVqwJiWCBNm9Rc3IvIfpZrEImwITWVThOmM8iEhNsc6BMS71UFsDMpjAeoSckor
         /R2cPXUe2xwOx3OzkHVRNFf8ifBrKe4RjT+Hdv4xNKCFEztg2pVqfT5hYytInFxXEA0t
         otV7CYoggShFy2DNhQeAqFYBFDRJmoNp0aTJxMmmktovzK7UMTAyggJ2QYoWMJhDLIUf
         NVA4e2PNNB4rWSxOCOiJdUSUlBXrQYE81N3pRdzOep0hWV5i5wIgSzXPHooYjvVEFdqt
         q3kB6RZatWNjw0gdUBiM83z5BT43GVNJsKsCOsM1MVHsdVkJZ42SfTR9uk59RcIcjPAd
         l17A==
X-Forwarded-Encrypted: i=1; AJvYcCXVyIXcwZZHPMp4eOBA9s6lcx7cvzlDJAHW9EmtPzTx3e8/rZr7u4lvddYh/6+Rsklpwa+Ra8YTJv4QjN+BXhO9@lists.infradead.org
X-Gm-Message-State: AOJu0YxQuCJI/3dS73T9rv08gmizf97nP9i2HShaCiA9W8g9PIk3A62x
	4L5rYknb6wAe6h0fRNUQ1tYjGO6oPhrvvnWE7diDsRQUOCR6JSTQwPNyUgP5LpY2Z5pqqJmjYKQ
	6Xq6uYwh8I7D1cYP3g5URE/vZA6mdx9306wuMcUKNjY1PYNnJklNkyhU=
X-Gm-Gg: ASbGncufdyVxhxNQApIBbF/4wTUM/NfjxIXh7U9HybYaOakTmAhG/SEuVufqsEfgUBe
	Br5KgTRDm/q5sZIJnObLQCrx+dwXYJuqJMLZUPnMdqbV5MR3LYut6Fsfho83OP4aDmu+EoHh1X5
	pi8hFrielLRexAsAgX3QUMg9+FrOQuZnYp+w6kGSukx4z4NWT7jfexshMmVp0FJ9nFAuzjksCO8
	bcKiHd6s10+DIiYC4EeYeHKcx7RDlot/meRauAkRd8HKfC6xm1JgPSVU1jyq1DMKk+KDgIgvSZV
	SA8kxg==
X-Google-Smtp-Source: AGHT+IHP6E49Qj73d/B4xepPnYRr8fxGgO50zw8XTKBQCHoFhJrGEfuTzbCQ39L2P4YWRz3nXJpXN2/2sI7cpVjUQRI=
X-Received: by 2002:a05:690c:2784:b0:786:58c4:7a21 with SMTP id
 00721157ae682-78929f4b0efmr168702047b3.69.1763561396960; Wed, 19 Nov 2025
 06:09:56 -0800 (PST)
MIME-Version: 1.0
References: <20251118121148.88165-1-marex@nabladev.com>
In-Reply-To: <20251118121148.88165-1-marex@nabladev.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Nov 2025 15:09:42 +0100
X-Gm-Features: AWmQ_blZTI0HEONzvyhOKKH_YzW5Got3D8XtC_2fvaieaZ5gnpDbY67xf-4Il70
Message-ID: <CACRpkdajTFSyabCUy-jG5M4bYXBCobvmQxAwy6dND_dkCon6Zg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: cix,sky1-pinctrl: Drop duplicate newline
To: Marek Vasut <marex@nabladev.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Gary Yang <gary.yang@cixtech.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_060958_554870_1958AC6D 
X-CRM114-Status: UNSURE (   8.47  )
X-CRM114-Notice: Please train this message.
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

On Tue, Nov 18, 2025 at 1:12=E2=80=AFPM Marek Vasut <marex@nabladev.com> wr=
ote:

> Fix the following DT schema check warning:
>
> ./Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml:68:1: [=
warning] too many blank lines (2 > 1) (empty-lines)
>
> One newline is enough. No functional change.
>
> Signed-off-by: Marek Vasut <marex@nabladev.com>

Patch applied!

Yours,
Linus Walleij

