Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FBBCAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 23:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yljnIlU4v2VwJK3/t+Nwxj+G8c/okseAmLmguNulAtk=; b=5AJ1fGwTjpdXLQZfNVRpaEonj5
	Of0j0A/+Pp4inBxeTR3ERGYVgiu2eqKFqvC1ACrysY0Pqiu6KGO4buKY9YZ6TBE0QOmLntgZL9N6c
	ewSogRA19eR5GquE1xT+PymkmljusF8yxwCdeHUqliI1rsuZi9sMhuw5syLRUC0ZESFLND/HM4DRR
	948wCV/RVobQqfkvhbnmw3WwD3H2pkjJWlMK5SiAiUEhf4hu4kdBwVeREJiyh2m8lEc3EyOyvlaV4
	sRcmKGi5UEVmBCWfCSLc/CeyQxFfU+yCd1aDg9RKOp6YYXade3CBAIsB/zbdW0riAjj9WSkTpxzbA
	MlFC/Jtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v31HQ-00000000di3-1cqU;
	Sun, 28 Sep 2025 23:58:12 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v31HN-00000000dfq-3peZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 23:58:11 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-581b92e680bso4893251e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 16:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759103888; x=1759708688; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yljnIlU4v2VwJK3/t+Nwxj+G8c/okseAmLmguNulAtk=;
        b=TY33NZ7hG9uq7WP1A0FYHT1uD/lJy3+Eljm3e+9HotuzqnQQSzlgYAMTbNcIzcInEt
         +7EJyWlHmymqQQ1YXhW1cOzSkquA6sjzUgN9VmxG9Adg9QonIi0cGIX0kkl3wgIFT/kA
         086yfKxgMctPWiKIxdlQ421YIb82V8lUPeKs+mnhHWMUQsApnBe79o3S84JOpQkqErmb
         hTLd+7x1ISh3151C0hRTFOL1p5uEyQPzGK3mPT1RF+qk8LzirT3y4dONEVXHeNBGC9XJ
         ceIwdIIOgNpG6m0vmQ6YEKWpeftSWOrs1Yy2CXdlU5pU3l2GDbHjzfjVYrpJvfs/Udej
         X0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759103888; x=1759708688;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yljnIlU4v2VwJK3/t+Nwxj+G8c/okseAmLmguNulAtk=;
        b=CXynGiVPJIvMNT3OHhk4Y5WpbtxSW+8My//u2XPNsfcnBUc0QVR2gPThpa8cEgaVus
         hJ2lsOcEzubFQ3g/APcEUc1ZB5fAv5DGe9obpEsciquCmz9FddloWtFlVgrfnEMryfQY
         Nfj3c3IN9yRnzxzSFAC43kq1NNfyHtuUhIE5k3DYNQcuMQJns88dDr05zZhygZsp0UmN
         zzfrHrkKs9MGdYbm9MxEIOzo+upPpxLd840/3EOAEZ4hYoxD9I4jLDtwU/OIo37aJ86N
         l8V+2lqbRRNjDILIgOC+ZypurTDOzlN3zw9VCs7LD0X0L1+NqEq63NYr6JNgqIILO/f1
         rbRA==
X-Forwarded-Encrypted: i=1; AJvYcCW5vxP4Gd7nA8K+EeVT6to6C5O6qW/qktOYhgUOT1NZja/z5Rq7JapaoKcLLRLInAudXbdkWXKhl/Qysg0J/F8P@lists.infradead.org
X-Gm-Message-State: AOJu0YyrK0oLECtFmpZj2JMbGKH7wcWm5rdW+7dC9PNqVSratka2Yr1t
	tCWMPKEH6I+I+zgritJDrIxgoCq4lQ4dPPYa8RL7fj8OnI4MImshA/h+
X-Gm-Gg: ASbGncse1y6B4Rb4MauegGChhtNRtE1glC0WOl4S3m5zoRaGZYEUs4HWPs/L6bnc9OJ
	lCbwKLeFJBb8ChW744qUaw8FIZJO9gf82eCbq7Q+elwKdklLjdvwgtizIB/PqiHTss2YHrpnA8v
	e0Ii/uqda1uoXrwYToX3B3XG1a1XyyA+TF3iTWLrPLQs+1JxIskkVW2YCTJBEZplhtrRyod9fvB
	Gkw4hWNDUyqi0T9rKli9ICkTKnyhZd/ZF6aIa89AUKXpLXUJ4FeHFV79Trk8lLISDCZrgd+Gst9
	+BEIseUZOLN1d8gH7IDa0qEivyL4l25PKMOXWxIItM5Z+boTLklx4V+9vW+cooiOCjqsfy/321a
	z6N8C3t/kEStu6r1tSt0iS2pDo7YH2KHa4KnabUrOHQlkqL8=
X-Google-Smtp-Source: AGHT+IFatLnH+CWKbIPVnt1XCGsPTWuZfxlrZtyuUOcPTm0iQtnY1bAc/cnSijrrtlSR3Mk4EECIMg==
X-Received: by 2002:a05:6512:3052:b0:57b:968a:6df6 with SMTP id 2adb3069b0e04-583066e7e35mr4445802e87.18.1759103887574;
        Sun, 28 Sep 2025 16:58:07 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58316c1d303sm3761723e87.123.2025.09.28.16.58.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 28 Sep 2025 16:58:07 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] drm/meson: add support for 2560x1440 resolution output
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <CAFBinCCsTqsn06A5oVXGTW6PgmSQH0bHE+8PSftyWNRAbYUTcA@mail.gmail.com>
Date: Mon, 29 Sep 2025 03:57:51 +0400
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Dongjin Kim <tobetter@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C8A273D4-5F5F-4BD8-911A-67EC9C3FF1F4@gmail.com>
References: <20250927130239.825060-1-christianshewitt@gmail.com>
 <CAFBinCCsTqsn06A5oVXGTW6PgmSQH0bHE+8PSftyWNRAbYUTcA@mail.gmail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_165809_973167_50CA9F77 
X-CRM114-Status: GOOD (  23.11  )
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

> On 29 Sep 2025, at 1:24=E2=80=AFam, Martin Blumenstingl =
<martin.blumenstingl@googlemail.com> wrote:
>=20
> Hi Christian,
>=20
> On Sat, Sep 27, 2025 at 3:02=E2=80=AFPM Christian Hewitt
> <christianshewitt@gmail.com> wrote:
> [...]
>> @@ -894,6 +908,10 @@ static void meson_vclk_set(struct meson_drm =
*priv,
>>                        m =3D 0xf7;
>>                        frac =3D vic_alternate_clock ? 0x8148 : =
0x10000;
>>                        break;
>> +               case 4830000:
>> +                       m =3D 0xc9;
>> +                       frac =3D 0xd560;
>> +                       break;
> Initially I thought this was wrong because it's only added for the
> G12A (which is also used on G12B and SM1) code-path, leaving out the
> GX SoCs.
>=20
> Was the 2560x1440 mode tested on a computer monitor or a TV?
> I suspect it's the former, so I think it expected the code to take the
> MESON_VCLK_TARGET_DMT path, which automatically calculates m and frac.
>=20
> I'll give it a try on Friday as I do have a computer monitor with that
> resolution - so any hints for testing are welcome!

The original patch is from Hardkernel sources - I=E2=80=99ve picked it =
several
years ago and then updated values semi-recently after 1000ULL changes.
The user who originally requested that I cherry-pick it (and tested it)
was using an Odroid N2+ board (G12B) with a Dell monitor IIRC. It=E2=80=99=
s not
tested by myself as I only have TV=E2=80=99s not monitors, so it will be =
good
to have your confirmation (either way). If it=E2=80=99s wrong I=E2=80=99ll=
 be happy to
drop it - I=E2=80=99m just trying to upstream and offload some =
longer-running
and allegedly good patches in the LibreELEC kernel patchset.

Christian=

