Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED261C3ABB0
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 21:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q7jhF8o/D6lmk3tfJaXQJC7Uck51GK/MCbYz8uYsAmw=; b=eGQgSGW7tyOG6TAwC8frnN//Hn
	msEjvAWqMSmChWBY53fFKgz5vDEms2HvFoa+deUlfdDTvvUn/pFTFIy9JG8K9kq2mCzP45jKmuRyU
	0nfOqyCAC7bTrbOMKD8QA2P44Bod7L4KLmeo2SnFm7CPx+yGDe4mJL9Up5LaACuzvJ+uCzETbiV5q
	/jRkKBa8VVz8qEbMMIy7IEhHKQ03WjuDA6euppBcTBNvxVGPNCHBQ+Fo2GyfNxYYYrFcc74Teydmc
	Q1OtJzY48B4eyDN+Dnjk7lHNmlsIciiQjHGLKIRVklaQDbdWgNfqqitL2ho6w9yiLxRPmKvJt22It
	FeL7bkBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBgyx-00000005zJK-2s5E;
	Sun, 04 May 2025 21:34:43 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBgx4-00000005zAx-0Nji;
	Sun, 04 May 2025 21:32:47 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-224341bbc1dso47135365ad.3;
        Sun, 04 May 2025 14:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1746394365; x=1746999165; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q7jhF8o/D6lmk3tfJaXQJC7Uck51GK/MCbYz8uYsAmw=;
        b=cE1lapuhHmwfmwmQ0PtX2z501Pta6sdBjhxe77mpGZKotgmOE94JkE5TaF9p862Drt
         voDooTjmhLzBnX1w1JrelDJHeCpvyRZOmLnsioFJ+NOtGUp8h1CPDGxBfFDIPbaaulLo
         W/D4hWFsFGn9UUpzr/NEa8drIooqZH1e04ksuA8nFI+2tYSUAcwQ1dWBH/TqgFcXzczU
         +qiaLUvlZgkDzxGqLQZdb0KcSHEsxY9vKtGWZ7AKI13PVeIaw91vGwgQqfd00v5FvU3X
         OUXFFYOyh4p5seXkLW0N4sT/ifSlolMwtoDJq+KVBO1/FNucju1RU0tBgfFIawJbQWWI
         lWxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746394365; x=1746999165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q7jhF8o/D6lmk3tfJaXQJC7Uck51GK/MCbYz8uYsAmw=;
        b=flDP1c6KsP8UukoAOg0DPtQQTX3kKqd2rIvmWqtMHOlayHwtD1U8DA16jvLxGbHyIk
         O7/P6WLj7i0AZGiGUTpfB14ymc0/A+Tw3eRtWV6QKLPJXU64tDzaaQZYWdjXgkqz1HrC
         cByuKKOuJ89gJ71zL6afPU0xTPjc3xuSqeItYcpwgRq26tJzmXlJ/2Gukgi/Zwc4AGWx
         MEYH/3h1yxfatPRB0gVPW5qKTUY70Q/jBPNNmwZXeP+MiWb4IQzb+ASY0DMNfAevnOgq
         /xL/Cb1V37zBJk4GwvhGwpesWz45oeRpu+v/f8aMAWgYPH/Zl1w3VcngOmF1O+FxG8iM
         Tgwg==
X-Forwarded-Encrypted: i=1; AJvYcCUbB5cI9oNvqdwFyCYKgyr3ADDRIQG5AKbzwZrxkgUByR2MDARaNFYMeixOxQEPbYZYuNewpjTRraIroYPS@lists.infradead.org, AJvYcCUvszr7WT/m9YDJQp4hjE/aX4wxVRSGGfP8eyzznN5C92rRHiL5wjdcxkyGRiskrFTno/xU/iLujJ/IlKCD/YLtKQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyUuqSZiGv8vK/GyFVpbxyKXyelTindqh3PYvT+XseK6WpHQXNt
	kqp/x8zj3b86qJbl0HO3lhkryGEP5kEiFrZF0cobw9LicrwjW1qj/dUwzUApCmHZfOEKTP7IPB1
	QeisVCzdDJDpZTkMPZ7Dx5F7UqZkqnBz3
X-Gm-Gg: ASbGncsvsGbLb+tWyM3bniExbKIvAv4W3HnI7zcxh+4NSlfVYBetVhHYErF+J5VwguO
	GdwjCeF8udf27mxcbaIzuYjlqBoKPyIanSQoV1HdweqJDOHqDJflrsp9JlCWI7ZMiNKGjlVZgMT
	D9kZsbgPkDVzJFl0IcxyNTA8O/ybJWFDk2AQnWHaQX/aivV84YnjNQahc=
X-Google-Smtp-Source: AGHT+IHH/nfY7aawda+5dqP8fu9k5FCWHizevZPZQCYz7HUea62/Pz9JW8anHy4Qa9uOMj4WeQphD+IA9QE9XTMVDwQ=
X-Received: by 2002:a17:902:d2c7:b0:220:ff3f:6cc0 with SMTP id
 d9443c01a7336-22e18c377c5mr110852105ad.38.1746394365180; Sun, 04 May 2025
 14:32:45 -0700 (PDT)
MIME-Version: 1.0
References: <edc560afe2a8763c93341d161daeb8b33ba606c6.1746199917.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <edc560afe2a8763c93341d161daeb8b33ba606c6.1746199917.git.christophe.jaillet@wanadoo.fr>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 4 May 2025 23:32:34 +0200
X-Gm-Features: ATxdqUHqROfRe8ULU08R_OGbVQNLhxSobV1JquQn41JtqjzAQCz4SzZnaHeJ7Fo
Message-ID: <CAFBinCC04F0PVd_wn2NmaTBn3WTLYDQEoRShU0mhrTiL0MfPCg@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: amlogic: Constify some structures
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_143246_131959_0AA9C583 
X-CRM114-Status: GOOD (  10.37  )
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

On Fri, May 2, 2025 at 5:32=E2=80=AFPM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> Most structures in this driver are not modified.
>
> Constifying these structures moves some data to a read-only section, so
> increase overall security, especially when the structure holds some
> function pointers. (This is the case for see meson_ee_pwrc_domain_desc)
>
> On a x86_64, with allmodconfig, as an example:
> Before:
> =3D=3D=3D=3D=3D=3D
>    text    data     bss     dec     hex filename
>    8924    3832       0   12756    31d4 drivers/pmdomain/amlogic/meson-ee=
-pwrc.o
>
> After:
> =3D=3D=3D=3D=3D
>    text    data     bss     dec     hex filename
>   12396     336       0   12732    31bc drivers/pmdomain/amlogic/meson-ee=
-pwrc.o
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

