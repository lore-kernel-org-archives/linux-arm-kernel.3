Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE4CC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 08:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fg7ScFrpAhGYL1bOoOF2peNB6lfD3/GoDR0u+tz557k=; b=rZDp2s0hasuSERRurokFlhyykk
	Ib71M/P7hhh7QGc7avmU7VMYBjdM/So3QYZQVJ6tP5j/xxeHoZZXe+7y0NTbFa/4BrbtEU8iOPXol
	mW5mgwfeDVVyrOBm9vv59d36LGDC5NdvOzXM9nqfN+ganloXCbHD21FZkfrFsV+gkE7R2JbOadbsT
	clRHf8yFfVulQ8gB1fPK5R2V4b2RLYnt8hBEcM1c8wiEOTj8M9IG63aUC77Nqlk7vRX4C3LcppNxt
	heuNetf+RQl8rangPj6Guegt1XXxF67XPIg7bRztmCijzIF+Wkyp9Xkf1V/rsz4VzpJBdJXDP1DrI
	ut//7kIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1bO-000000001CN-1HFC;
	Mon, 03 Mar 2025 08:56:42 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1Qu-0000000HZyN-0tmo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 08:45:53 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4399d14334aso38207015e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 00:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740991549; x=1741596349; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fg7ScFrpAhGYL1bOoOF2peNB6lfD3/GoDR0u+tz557k=;
        b=NLMAzepTqkC9CgdZ9Og/7SuQRxSyaj3/2vHD5/KbHGwnqo2idD+1uBr45ydahcCFuM
         CWu0YnKJxPoSo7JL9R797BUiHoQU5avx3kQE6pQRyrOsYMApEtJVMk81ke1jMJjNXkgF
         NYOVDSqTyVZOntql7z1d43z7Av04PeKittZy99HYc1azlE+oh8nvp/CcGTrWLmP+gwTb
         s1OsxCvYBgZ7t1LLoVjMyVx/jLMe7WrP0CyH5Na832BKYKHbv5kuK9WA0Rt1I+PzviYZ
         qTSvCh5Qjb8oukJnTYvczSeuyg+4Ob1WDSYA3pAJTotE94rlaPq223ghR56lLFNR/Cko
         yOOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740991549; x=1741596349;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fg7ScFrpAhGYL1bOoOF2peNB6lfD3/GoDR0u+tz557k=;
        b=iDLvAUlx4qHiv8FF3IMYgmAw333WgP3vMQPNV6hZP2RDGPMw7k+/ZWphNlisi3RlSE
         HQyKFFvIOvU8pzLXLf+dfsoiHkQIMbihYSomi1gQTV9thyA59BFt5BbUOgthVWvkWL1j
         VavydvwvumlqoCp1VbzEAFiX+L2u3o7TnqsPuchT7LRthBc7CTQiDHyflwBtdEsAtawr
         tHy3ToaCiuA80oC0nh9LrnN4BOBfse88Pq9FyBHcEymk95yef/GWgen4/brVKvMCOQ+d
         Ga0s2V9mdKHz3a+uJKhi0Ifzx3fedjvxdCwMECrSmYlvCkcrFPFPvOGGUyFbAgScAK30
         rEbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVICnwn8BFP2Rtp7v8pFoPi5/Zjz9gOxtUXGOiESNvUe8ayNRR2pYYy5L6hqhDnKab1MGcQtS+5xBR3ppgfJwfV@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4yjfzU74qmPWM2e4dmAsexPoIuKi4Mm5aytflJogys3zaNEM2
	YeRAumuA78AiCfT6S1L5WyyiAOD30wPbNirsueK8eZhMYpHRhHbTGVd80ycgOI0=
X-Gm-Gg: ASbGncvjfo2n3Q8/oAlf26TzFdiVAGU2FIpfE5C8L8uL4caIJmLW2e4qqzSVL1CdqfP
	Sk3XD1o3QuUR/raqAz0yxl+HcFnamMNP9k5weTMkPi8zip674VE//kstb8WfXewvI/kNSXpOvDk
	tCCnl2sFeNLiQ7T2yVOq7n3DGK7E6qjz/3/4FG3JyeI7krMd0EBYKr9vt1G7OOvqesqYoOhUff1
	Q7HW4E5VAXah+iYG6jC9pGcwIA4l1c7+RvmtbxJRbUZjO/M7hccccZ4B/mvOheQy5PMuAIx0dOD
	iwlqjMjgtDQvWEB/hIo70cMXYU1SnEc1GeQeJqtny6mdwNRc
X-Google-Smtp-Source: AGHT+IEQ5gIerplrLBCNz9iWi2EjC22riC6x2aUD9LPOL3RMv31foO6V/nmZEr2WkFVBKnwbDjXW6Q==
X-Received: by 2002:a05:600c:4e8b:b0:43a:b8ef:4dce with SMTP id 5b1f17b1804b1-43ba67041bamr112726745e9.11.1740991549553;
        Mon, 03 Mar 2025 00:45:49 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b736f75ebsm153130965e9.3.2025.03.03.00.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 00:45:49 -0800 (PST)
Message-ID: <4d0042850eb4d9898559b56505291c4e849d44c5.camel@linaro.org>
Subject: Re: [PATCH 00/18] a few rtc driver cleanups
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski
 <krzk@kernel.org>,  Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Hans Ulli Kroll	
 <ulli.kroll@googlemail.com>, Linus Walleij <linus.walleij@linaro.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet	 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  =?ISO-8859-1?Q?T=F3th_J=E1nos?=	
 <gomba007@gmail.com>, Dianlong Li <long17.cool@163.com>, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-amlogic@lists.infradead.org
Date: Mon, 03 Mar 2025 08:45:47 +0000
In-Reply-To: <20250301203658839d5482@mail.local>
References: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org>
	 <20250301203658839d5482@mail.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_004552_250729_036BDD6E 
X-CRM114-Status: GOOD (  21.50  )
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

Hi Alexandre,

On Sat, 2025-03-01 at 21:36 +0100, Alexandre Belloni wrote:
> On 28/02/2025 14:07:13+0000, Andr=C3=A9 Draszik wrote:
> > Hi,
> >=20
> > While looking at RTC, I noticed that various drivers are keeping
> > pointers to data that they're not using themselves throughout their
> > lifetime.
> >=20
> > So I took the liberty to drop these pointers and this series is the
> > result.
> >=20
> > The last two patches also convert two drivers to using dev_err_probe(),
> > as I looked slightly closer into those two. They don't exactly fit the
> > general subject of removal of unneeded pointers, but I wanted to share
> > them anyway, since they're ready.
> >=20
> > All of this was compile-tested only.
> >=20
> > Cheers,
> > Andre'
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > Andr=C3=A9 Draszik (18):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rtc: max77686: drop needless struct max7=
7686_rtc_info::rtc member
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rtc: s5m: drop needless struct s5m_rtc_i=
nfo::i2c member
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rtc: aspeed: drop needless struct aspeed=
_rtc::rtc_dev member
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rtc: ds2404: drop needless struct ds2404=
::rtc member
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rtc: ep93xx: drop needless struct ep93xx=
_rtc::rtc member
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rtc: ftrtc010: drop needless struct ftrt=
c010_rtc::rtc_dev member
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rtc: m48t86: drop needless struct m48t86=
_rtc_info::rtc member
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rtc: meson: drop needless struct meson_r=
tc::rtc member
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rtc: meson-vrtc: drop needless struct me=
son_vrtc_data::rtc member
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rtc: pl030: drop needless struct pl030_r=
tc::rtc member
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rtc: rx8581: drop needless struct rx8581=
::rtc member
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rtc: s35390a: drop needless struct s3539=
0a::rtc member
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rtc: sd2405al: drop needless struct sd24=
05al::rtc member
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rtc: sd3078: drop needless struct sd3078=
::rtc member
>=20
> My main concern with this is that as soon as we introduce irq support,
> we are going to need the rtc pointer back in the struct. But I guess
> that most of them are old enough to say that nobody is interested in irq
> support.

Thanks for your thoughts Alexandre - I don't know the history of
these drivers and don't mind either way. I can drop those patches
that would require reintroducing if irq support is added in the
future. I think overall you're OK with keeping them, but please
let me know if I'm misunderstanding :-)

>=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rtc: rx8581: drop needless struct rx8581
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rtc: sd3078: drop needless struct sd3078
>=20
> I guess you could squash those two with the previous ones touching the
> respective drivers because you are the one removing the last remaining
> struct member.

Will do.

Cheers,
Andre'


