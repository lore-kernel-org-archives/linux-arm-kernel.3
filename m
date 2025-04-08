Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D0CC369A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 14:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T6AUPajIn+F2nfpZeAdCDfLBKZuZZ8TRAyr9PXK5qRA=; b=IFPRQePn+Bzotk7/dnJ3OgRXFX
	DQ179ela3nRA+7/FkEH5SvyNrp+0cF0o1TwV7r4hnMMluV63RvhRq1ljxNcS5lv5BPDULRoLXCd+V
	gruy3wvBtvCfiEg4LzxUZFo9kcJENc3ZAcp/50k9DUzRrGcUGYTJwBGtS4V4i4zGNCRINptgzWnOu
	JdCpDjtXL4//9HeHtOBOUHLRRZojU+jn+vcX4Jv2NVyBMEdCBeo6SMo3VKFdchY2fekfT22b6uSTE
	xoHiinIW5GrsE6l7vqoQ+O2onZ0QXl8bazcJWmmHtTlEEfNnonsf+9WydJwfWYGZWdpmNe0OmKqW7
	glBhZswA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29vW-00000004NW9-42Io;
	Tue, 08 Apr 2025 14:27:47 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u27oY-00000003xCW-1IEA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 12:12:32 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-54996d30bfbso2608511e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 05:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744114344; x=1744719144; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T6AUPajIn+F2nfpZeAdCDfLBKZuZZ8TRAyr9PXK5qRA=;
        b=iBPbDuCwZhx6/cOSUwI4hVNrEG4NM6iUVSSt6I29DJmmAQpZ2XBuzCwfGA8A9+Dkjo
         Stu+maGX/EOuQQ6uC/ASZLq5suqJDVXY+HU6NBKfR9RSYcGqd83r/5QbAoBN97FjIT7z
         2r56IuBdOUjxBLIexPgi70W9DmFNeJWHyMjhS95/9GMMnG/IcWkPezHA1EB3gYNmokpr
         C4MejBelhd8JyuuYsWoUSVLUw+fWbMuGlCDj2/lkGKYRbQfhsTx93mJqUfYqaLlCiLoj
         rsGjOlXALhLXsv7Pz3B3WNCzlJdhQlhfmgS22l5kTujSieKGGyzZROhRFcbnCu7VFPBI
         ia+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744114344; x=1744719144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T6AUPajIn+F2nfpZeAdCDfLBKZuZZ8TRAyr9PXK5qRA=;
        b=iWjZ0gk91Y9DQOGEy+8iPozqEE+WSNiBv4WAub/3ZczMBmI3tOOfJ60jNwNTwBOz4+
         sywVzsQUJZMiTA4TLooEn9UZvLNhR0sU0hSwqwzjjItmZdycsRYzzl7RGZBf+aTvhi5m
         PgsRgxxxn7J6OAeNNYOYtYxqganHk/gKXWxQKeZ6I99Sx85ttmms1aazvXhXrcTgi2iR
         FcgthOKH9q9inhunClQWhjwOAXGNrkcFt88vIrdk11EKp+HKXE7CHdUfhaOn0PZyJflw
         2oDKtNefxkpQ6N5D6/apVzWGroqlNlirA7gIPQ/jZDjdLqn8vCjOA/hKb6KmTjeiCAE5
         LNlg==
X-Forwarded-Encrypted: i=1; AJvYcCWPQLytWD12UvJDEaTVOTWGS1XV1F+BYrHVTd2OZhiVZIkiuG2oZ6mlAcDPQDJfFRcZGLK+uyrUeHAT74dXO+PP@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg9dZPXIE7sUYVNJ05HDTVDh4IDyxzQliyK/o+e51ssAmamWSI
	0xLO8e4JsFDzOBrVIRB02j8Kyd75dbu2WO4OoeZ6J3HizYCVbCCSjjnmpwd4pmdgcZSli4ZUhu3
	pVCVTInVNMXYUgH5sb0tZRcDTYYIG94JwxF+CLg==
X-Gm-Gg: ASbGncv74KG+9I3Ywk4D8W7TaEEOh56mNhQ7+i8GyRiRtpxZvDpn/nXxzbDavDRjUUq
	m8eTJp3Rebz6cLymW9Rq0xjViCP55cFzJrbwkyrpKRrdqubkYCZtWVcpJ4xPzz5zaRvaVDYemT6
	VFNWg7Xw0kbEnDi4j2v7wf/fQipCK8T0ovZ6LvDxvJAxrr0O4qrbR0uUSpUjbKb03mK3nG
X-Google-Smtp-Source: AGHT+IENthHAV5l+KymW3LDJPEDbaINTNIXvJ8Gl40s2FDrufFFpjg080dzcRguD7FiAlFgnXWdvad3pq/qk4qOQGO0=
X-Received: by 2002:a05:6512:3b24:b0:549:8675:c388 with SMTP id
 2adb3069b0e04-54c22808b63mr4893242e87.52.1744114343947; Tue, 08 Apr 2025
 05:12:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-arm-v1-0-9e4a914c7fd4@linaro.org>
 <20250407-gpiochip-set-rv-arm-v1-1-9e4a914c7fd4@linaro.org> <b032eea6-96c9-4511-8085-da9f5655c252@lunn.ch>
In-Reply-To: <b032eea6-96c9-4511-8085-da9f5655c252@lunn.ch>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Apr 2025 14:12:11 +0200
X-Gm-Features: ATxdqUGj5_DJHO53tE5rgfz-8N3LeX0iU314_nS5WJM402uEpv_AgAzVCN_GOkY
Message-ID: <CAMRc=MfC7GukR5ZidkZJA8LMZaVXyqeygdUBz9v3oDmw8k+OPA@mail.gmail.com>
Subject: Re: [PATCH 1/4] ARM: orion/gpio: use new line value setter callbacks
To: Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@kernel.org>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Russell King <linux@armlinux.org.uk>, 
	Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_051226_609443_3F95C14C 
X-CRM114-Status: GOOD (  15.71  )
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

On Tue, Apr 8, 2025 at 2:03=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Mon, Apr 07, 2025 at 09:09:18AM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > struct gpio_chip now has callbacks for setting line values that return
> > an integer, allowing to indicate failures. Convert the driver to using
> > them.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> What is you intended merge path for these? Have arm-soc take them as a
> whole?
>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>

That would be best, yes. I'm not sure how many of these platforms are
actively maintained.

Arnd: you were not Cc'ed on this (get_maintainer.pl didn't show your
address) but could you take this through the arm-soc tree?

Bart

