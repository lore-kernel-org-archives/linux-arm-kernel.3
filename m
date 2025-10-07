Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE9DCCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 13:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t0N+x/VGNAQttY2sxorx9dZNMTxHZKG1OWxQ7z8PFso=; b=UfzNCGrsm4AhhBhT4fMAkHxXMT
	xZn4qJbVwUGjuXAgNw0OywBXXN3AqUqE92iC1gMCGxsXUuzoRcYbXiOTNTv2Gi4s9sWnk0axQG7Qb
	wHwUJff3inPO7F+LW16YuKbSQa/scXLBaJXqbrkqXS18C2HzgmMwLgQgq5vlaAILASTxKYguRYV6G
	t6sRpTG29BBtCn9VdClM3jTxWQok6Y/ZU4FkrtNXvNhVnfOEv3FV5O2Cc1at+s2wC2aP0ZiKcUA9w
	1DSJ30faegaeWFE+cAUTG8pNdkvEUt9DEN2oqTtKgCpbX5wepPTIWYAiriiIjeAO1uh4mpGhFiVS7
	K2sX5ZbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v67Vi-000000022TX-1haL;
	Tue, 07 Oct 2025 13:13:46 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v67Vg-000000022Sw-0QOb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 13:13:45 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-33ca74c62acso54259461fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 06:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759842822; x=1760447622; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t0N+x/VGNAQttY2sxorx9dZNMTxHZKG1OWxQ7z8PFso=;
        b=eyTlkfknlzKXSxJxInMax0vEtK+6o0YOgUtNiwglBHrRGIyk0MCWVa6HA8nVSOUW5l
         5WKlp5MpNI/fjbBBJVtlvuCfnL88v8+Lkphtb9+6cyXhkGkvk5exrMtkw6Zeu/X7s09c
         zdDhKVF50czaPflQ771mA9J8k+Vfn2ExjMldfuqfolRSI3K+H2KRyEfs65hrq5K01m2B
         sAHkJW1o8SS8pYdbQ7G5WJetjR/vFglb8oIR2WD4GQBZQ+m9SveqxIA4Cek2I6JuP+wY
         OspTMoMzqFcHDqdxNzJpP8N2vYO/i/Z4qQPJuHQk4NwIrvQzFLzBIl4mpNbur74AiMz+
         +3LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759842822; x=1760447622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t0N+x/VGNAQttY2sxorx9dZNMTxHZKG1OWxQ7z8PFso=;
        b=v6wwBuSkFdYKXXtui+PJ7lXgR5aOUj9nL6RiQdh7TKYP5ZwPyPp2eW6ODDBn4tNsk7
         bfpFOj0N4LvX8Qr9eq8w7gD1sPzUbaNc7IGsE2NOYQus7U4kKwzeazUBvnmIxEgxmV8c
         0sbZORvVoXatqngSHGe0aGFl4BueZx4/Pdbfp72gWCPdzkdHOzjUajeKdgiGOKjXs/k2
         oexGFtIw44iS2282HVbjPmqtm35jx5dyfLVZS0/neGmUkF85Q13GvDCQ6cw7jSB5rXdJ
         imlEoXoeEsm+b/l52l6H0aa+BN9iv7dYxUymnvMc5R+ybkPGQz9/F0/YbNEQWJ+vA9uW
         6uUw==
X-Forwarded-Encrypted: i=1; AJvYcCXomuaFhtQzQI4hIk7YFInDkmL3/esNE8e7eh67seuwfykMQV4P+MJYTjR0Q0LMAwIxeGOyQogGZleqjjBFMrLf@lists.infradead.org
X-Gm-Message-State: AOJu0Yxmdt9xQd3HvOqf7VjqSAiivt1L8RO2Jg86b+Qd0n1yWcceGfaJ
	SBM7N2MOyqyJreCGSlDDU9mgAhkGpsB18MTIBiZvoK5sS5MwQJk7/j/cwO238HaJE4TnA/4ppY8
	f/MPPJqFHl5051ogXFLfkPWzxyas7b/A/Rga5EVZcUQ==
X-Gm-Gg: ASbGncvktZBIyUhdWO3deOS41057AiTROm+UHhSDbw4fyij3aL2JLWv/bbj1CH3tuc2
	hy/pelliukOEy8CeyRZq2Jk3qSvOgify7AuBhCtEMYpBHGHN5QnICABWBzlmdYCCfEjGK9Q0K91
	GCaOFk81FFat/mqUcZOJUBe7sbsmeJ1E0zNR5OpYrs2VJh46n6gEo6ussxVlaKkrCkYNWFtEAb4
	H/BSIisDpx/nUqy5hPT2pF8QH56871PL4C2N1k+gZCXEieEQX4S+Mw49d9wgsY=
X-Google-Smtp-Source: AGHT+IG7P5Lsywws5bBPOT8E7JIpupmd0eu9fkYQI1gC/FvLSNAcnVdx2QxXsM+KX1p4mn8AU407934CqwjnV4QazxU=
X-Received: by 2002:a2e:9a14:0:b0:36e:21a0:f212 with SMTP id
 38308e7fff4ca-374c38477a4mr56218171fa.29.1759842821852; Tue, 07 Oct 2025
 06:13:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <0b402bba-0399-4f93-873e-890a78570ff7@kernel.org> <CAMRc=MfwEHGV-HZQURR3JNg1HatAeWO17qbRmkWUXTSBWj5jSg@mail.gmail.com>
 <80347dcf-419b-489e-9b0e-d901fbacc71a@kernel.org>
In-Reply-To: <80347dcf-419b-489e-9b0e-d901fbacc71a@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 7 Oct 2025 15:13:29 +0200
X-Gm-Features: AS18NWAq4ASQRRUa58ojinY89n-hm2wwAP_Re2fgpRgz7dBtx-tBmKEba_o3nR0
Message-ID: <CAMRc=McaZV=tUkzDGMYxXqkuEYw_KasKcv8QGdjw709UYZuGhg@mail.gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_061344_161868_AF266A36 
X-CRM114-Status: GOOD (  14.08  )
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

On Mon, Oct 6, 2025 at 11:55=E2=80=AFPM Srinivas Kandagatla <srini@kernel.o=
rg> wrote:
>
> >
> > If they were called "reset-gpios" then we could (and should) use
> > Krzysztof's reset-gpio driver here, but we have many cases where
> > that's not the case and the names (and implied functions) are
>
> Yes, these codec drivers are due to be moved to use reset-gpios.
>

You will still need to keep support for the current "powerdown-gpios"
property in existing device tree sources so that doesn't change
anything. And what about shared pins other than reset? 'dc-gpios' for
display, other 'powerdown' instances, 'enable-gpios', all kinds of
uncommon names like: `dlg,cs`, `wlf,ldo2ena`, `speaker-enable`,
`maxim,enable`? It's not likely we will create a separate abstraction
for each of them. What I'm proposing is a sane, catch-all mechanism
for shared GPIOs that right now use a rather wonky hack. Also: the
drivers have no business knowing that they request GPIOs that can be
shared. This is why I want to hide it inside GPIOLIB.

Bartosz

