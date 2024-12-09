Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3467E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 14:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fRIB2nsp6XQvGTjRfj9gLmtwiHmX0VmfSp+/67N6bk4=; b=Tl2MAxosNIgMESrnzVxmG+5P9P
	UMhynvHwxkvhp+N0TTiSVBDZ15kKJxM77dkD9b5S2omf/9fndg/6GI4E+kyLeNQ71d+C+/I/KinVZ
	sG7Y1cQhAD1ImDGIKrgLPKNgmVyD3rF6kDdCcVjG6pL494n/Xzdj/JicSZDMKHik3CSUCChiC5251
	CMOGIpd3RRaMMw9UnkusX9Y3HGUgaaADW+wCBc1VYhNsA59IwH7lken7Bq00wXxhM2dNL9ZHBlT/S
	kC3hxwHj0SQEjECWVIlyU7lebo6fBjNH2KVDxjTRXWTqmHl1qmvN96G0R7TYyTKzZjoekzmXorEGk
	tE2DFTHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKeOI-000000088gh-1gmQ;
	Mon, 09 Dec 2024 14:05:38 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKeN4-000000088RH-0X62
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 14:04:23 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5cfa1ec3b94so5618061a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 06:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733753060; x=1734357860; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fRIB2nsp6XQvGTjRfj9gLmtwiHmX0VmfSp+/67N6bk4=;
        b=DY0MGN/Wi9OReWpEKdoxdywLghA/RPnnV8RBq8FG9BCaXBRkT4ZJiiYzQ9abLPEmCJ
         1n2f8krMXvrItuVtnUhZrVtZkCqKzXUutA+1/9IdcRmlPbW4igo1i4hmC2Fq8z+/O+n+
         DQ2p5pFfznCUmQKQLARKzpUvcm1oAMPDNgKUzdVVhZ3TAvaw7A8DZwpYZotBmBsLrY68
         qqe8m5+wswm3BBzLabe14z8hmnM5gXpLA7JmVWbly/smL5sgg/KlcjLvurY7iDdmkEB7
         yRRZ9T/olFyNw2NrPnXLrSKFF+oFsTjg5d6C/xavQkc3jmyJqc+zm8lJ1xHqKmld3UuY
         yEuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733753060; x=1734357860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fRIB2nsp6XQvGTjRfj9gLmtwiHmX0VmfSp+/67N6bk4=;
        b=EHtwFhGTqJ03RVcFlVoOixx7gF38H+ebDS+BGUcPWGPdbFdOLsF+MwgIOjPhWYQ+Lz
         ph39OHeIP5fsuFFgqIAhexNT+jEF/GkaFJsj7YL82xwRc8/IH0r4IOWDQzEmjbjJlp/S
         a47FygNOfXwhcGjHA3bc9sVkj5X5dSFHeBZoRcwuprcpbxZ6VXfSNmvz3QlwID3y48zH
         6TY25sFb9YYjQJ0BsT2yDx2Ni09EzQ3l/PNVZVRXmDcLTAemZ6JJxaGWdoPgcLhzWaJ+
         IxloX2RcF0QqOXTUzYWbjP9qJycQ7rT4/Bq2RNTmnux2/O0/KB3SywL7StGOd2xslguv
         PSEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfgjygXftQPSFvu45HjadrfHG4QoeGUVM+RUjCgBGUioRQSaDwp2hebJY6FJ9M7V6fZIHDaKYQ6Vl/Mf6wKbAO@lists.infradead.org
X-Gm-Message-State: AOJu0YyY0UkKhrTnJheEt54mSOsyXKT+iswTvp6daEZm/grVkaNB4QH2
	1JPi/u8vXpvCgRcm4JTmseJZ/L+YIX6GGDy35PIueysxYW1fXo5ZlOHlDmH6noPr1Z5hUD7PmoY
	U9fKancKuBjWCWfl6e3XeK5MlGqc=
X-Gm-Gg: ASbGncvybqvicq14RIm1/ERFuP759vvjbGXFHtglnOkIoNuivykdnR2Jmb8T+2G8DhG
	LNoC4yPWgwJG98dweVLtSrbe7ZIWK5Ng=
X-Google-Smtp-Source: AGHT+IF6X/kzxH3Ns+wbjh/5Xo1lmvVUUhvP4Yyf7YNVCDvPnVicgmfDSkqPzdtR5TSI3rJCAqzK2xJLJuc/ivp5hCk=
X-Received: by 2002:a05:6402:11d3:b0:5d2:2768:4f10 with SMTP id
 4fb4d7f45d1cf-5d3be6fc21amr11979842a12.17.1733753060004; Mon, 09 Dec 2024
 06:04:20 -0800 (PST)
MIME-Version: 1.0
References: <20241209105237.10498-1-o451686892@gmail.com> <3279e669-1ee2-4792-9e10-8b40928de6b4@sirena.org.uk>
 <CAHk0Hov5k37=MtTBLWTj+Dwm4EXE0xGJS1Uc8xgyLtJxusqsww@mail.gmail.com>
 <c05f6ad8-2dc1-4ddb-b9c1-b2cddfe78819@sirena.org.uk> <CAHk0HotQ-=s+-FHh8pAOg10ivcRwqChG735qgDvuQd=4B1QQNA@mail.gmail.com>
 <678a223f-c4c7-4752-84b0-609acaa33ad6@sirena.org.uk>
In-Reply-To: <678a223f-c4c7-4752-84b0-609acaa33ad6@sirena.org.uk>
From: Weizhao Ouyang <o451686892@gmail.com>
Date: Mon, 9 Dec 2024 22:04:08 +0800
Message-ID: <CAHk0Hour4i92j70+C-x7BNGFoLhDEYW-1prU=R6rAX9T9T7auA@mail.gmail.com>
Subject: Re: [PATCH] kselftest/arm64: abi: fix SVCR detection
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_060422_168643_7C71F8D5 
X-CRM114-Status: GOOD (  17.97  )
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

On Mon, Dec 9, 2024 at 9:51=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Mon, Dec 09, 2024 at 09:26:01PM +0800, Weizhao Ouyang wrote:
>
> > > If we don't have SME we should be skipping over all the SME code and
> > > never even looking at the value of SVCR.  Looking at the current vers=
ion
> > > of the code it does that, it branches to check_sve_in if SME is not
> > > enabled.
>
> > Yes we should skip it, this is just a minor tweak based on the
> > current implementation, after all, we manually passed its value by
> > svcr_in.
>
> It's a fairly trivial tweak to make...  in any case, it looks like we
> also need the same change in the save path.

Yeah. I have encountered this issue with both QEMU and FVP. I can
help to add a check_sve_in similar to the fp testcase for the abi
testcase.

BR,
Weizhao

>
> > Which latest code version are you referring to? I think check_sve_in
> > is in fp testcase, not in the abi testcase. (checked the -next tree)
>
> Ah, yes sorry.

