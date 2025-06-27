Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E24C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 13:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AkmKR0xYEDPjcPRcVgxirrVmqPeqBwtXBNYFyw4Tz60=; b=wsUbXP38pOkZ9GGK9IELUs2b33
	PFIN8X79lPFdu5lxJkbqryjIAHXk0TkptcLH2Xs4UFMMi00RzcRdbV6oZCdnlrFXcel8Uaxio5ryp
	VW/QxetKu2WugftAsQD96JpOPzYcaqRJJV8RMC7rM+7e2b7NpZE3KNvz5Eh0ZmRHg458WrjK7652T
	ZfSx8EySJ/0H1dBUcoLALhxmP0UBtUtMFcJVGi2fAfyUj9BMBTnRAr64HlukqlC5+wmfHaOXYqmke
	60CrDqMOmIWKbGkv67VhD0jI43uhkSLyvo/ypHZfRO5qhFr1q4aTZHBwIg43Jh/rGyQNxX18vyPuK
	IlEtFnYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV9Ga-0000000EnWr-12qq;
	Fri, 27 Jun 2025 13:37:20 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV8dm-0000000Ehka-2RHN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 12:57:15 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3a548a73ff2so1944085f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 05:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751029032; x=1751633832; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AkmKR0xYEDPjcPRcVgxirrVmqPeqBwtXBNYFyw4Tz60=;
        b=aoJ7t7B9FxJbAtD/3LODBa3TfEnm28WIwiIHR/Jx1FQn2mOikX20AWX2nFfsutX5uG
         rJe2kB9hapwUqCehHFn5+pwZ4/vx+SAtzYLnDhX1NAUrUQf0Et6+XCzizXUtQOy5TEFl
         gcgDXA2/fEzLMhf6yTH+y5BIvMBfLG/Sk33Z11m7+CwKG0G5ZhusEGxL17EdYL5kEWfI
         DCJVKGUMDA9gT5GueSuBu/G4zp0rJAFjWtfik/2xdrDAABv9pqTEUpI9LpaWK4cK0Ji8
         E29/MmfOBuOstCK0o1B2oDvSuQGF5rwCdKMXzizlVuMc+alBKSB+gkXA1gh4y190D2GK
         6WAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751029032; x=1751633832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AkmKR0xYEDPjcPRcVgxirrVmqPeqBwtXBNYFyw4Tz60=;
        b=uso+6P/TyRgL6WaUtITGLSdd7sgZGEHJbek/NujyGucoE5C1N2HbWZCJmWm+3yE1vz
         FkAC7hFo4wWhvPlrb5uE/qRi+FodCJ7ZlrfiGMgnh3RJaoUjKcfEG18xBLDZWdUXu5ph
         FOoo9UP51YZA57E3qBXxBCFRJqSsoj8YPfe5Jm+5+R/uL8aAwCkjL4a9SSQadh8ZC1ri
         S43oSnl+OS7gMeWS1dejb6W5TuJN6MyvxrWq3ylOjNt1pg+5FyAyg67qysYzsOlXCumd
         kg89HcTlQhbBabDUWWNzW6oQA4eYCrjtU77JVnEvdWDdoRdTrJ/toErggmAPtRxvLMDz
         hCCA==
X-Forwarded-Encrypted: i=1; AJvYcCXohQhIltpgahK8Ywaen8G/eyqStN4CGexRTXMyQES/3EIu6NuwMGHJr2pbMQoxs5X/DKgdX4nDSomNxdZmeIO4@lists.infradead.org
X-Gm-Message-State: AOJu0YxKVqcx6hNnyka6IbIjFBl+DWd+yqtxy0nsz7Q9It5fE2UXTw55
	LoxRiy5VxwwM4oe0pjOb9RQ21H18pmKbLLhe5FtgNb+gjMQJXxJe0K+9V8kW6Rn9dyXfTuc3BkD
	RB6N0Gk9/T07vIsS9N/CDaLhOONHoX/s=
X-Gm-Gg: ASbGnctOseYxJVTCz4j3nEbatIP9q6+kqKWV+7KtTRdDKvd39WdAYWPJCEKkEXnFho/
	Xr9ccpQSQsLIA2AYopXOFOMboiU1MswUo3RtYRlzBEqfMP0YvxJC3FpiRMH5f2HIihj55Lan5X5
	FqGbsJakZVxChC/2cLnlE0nAw/aAVcbxpmbCDgWoeRXJNA308ZXiqSLhI2c+sPrOfnR+O/2mpcF
	aw=
X-Google-Smtp-Source: AGHT+IHKdbl+eTMCuh88R2xCJ+XeeR6X9LKRFohCHCe+lllNLZxSZrhyD8AKsaAkbu5hHbSvhGJSr8N3tREsLIiIovE=
X-Received: by 2002:a5d:6a04:0:b0:3a4:d53d:be23 with SMTP id
 ffacd0b85a97d-3a917603853mr2155412f8f.30.1751029032221; Fri, 27 Jun 2025
 05:57:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250617134504.126313-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250617134504.126313-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250626230913.GA1338561-robh@kernel.org>
In-Reply-To: <20250626230913.GA1338561-robh@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 27 Jun 2025 13:56:46 +0100
X-Gm-Features: Ac12FXy-jDAZXET2UcOHcVJf9UsqPgrajzf1xN4jHF2Yc60kab9-PYhzOqIgUD0
Message-ID: <CA+V-a8tR=bWEwA1+iGHZojN-yPDORAR-hER-Euk-rVSQhn=CKw@mail.gmail.com>
Subject: Re: [PATCH v12 1/7] dt-bindings: serial: Added secondary clock for
 RZ/T2H RSCI
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_055714_628986_7DEAECD6 
X-CRM114-Status: GOOD (  18.49  )
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

Hi Rob,

On Fri, Jun 27, 2025 at 12:09=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Tue, Jun 17, 2025 at 02:44:58PM +0100, Prabhakar wrote:
> > From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> >
> > At boot, the default clock is the PCLKM core clock (synchronous
> > clock, which is enabled by the bootloader).
> > For different baudrates, the asynchronous clock input must be used.
> > Clock selection is made by an internal register of RCSI.
> >
> > Add the optional "sck", external clock input.
> >
> > Also remove the unneeded serial0 alias from the dts example.
> >
> > Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Hi Rob,
> > As mentioned in the thread [1] below there are no users of the RSCI bin=
ding
> > hence this change doesn not break any ABI.
> >
> > [1] https://lore.kernel.org/all/CAMuHMdUThuWxxznhjvcn5cOFCWOkb5u-fRYwTO=
oenDRY=3D4H6FA@mail.gmail.com/
>
> Please state this in the commit message. If you want to break the ABI
> you have to say that you are and why it is okay.
>
Sure, I'll update the commit message and send a new version.

Cheers,
Prabhakar

