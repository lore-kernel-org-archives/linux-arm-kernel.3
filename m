Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68482E92FE3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 00:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/OOpbynk6cMUYk6IoIP11teU4BYuiO0Neyv7rdgKSCc=; b=CB5IsxUOoNo7yfq9efxO49eGpb
	xCyJgeGaEsIIWjq58oqOjAAoQ/b98ErsCMDmG0Y2yp99dVFAQFIPoHd49qk4e2rg8I1HOwOZdV/Uw
	JSzxMKMlXWm5OZaPdoMYBG8E5u54VQlnQUbBvOl9c6E9JYNMjnMiwNFWLPJ6xdM1qy75pJ2ZiKnre
	QVxc+aTR7mOJZdEehq6+Mg8OI1h0JALWoMqEsKXVN2u0wNN2of0wHL7kxRVNQkY7Q/usTZIkYZ4I9
	MXCyAGhK+lASEi+02dtjEcd+QGaPPPze9s8oR3EGp2Sdjbf13dD920uae7XdAsoMkqWAG5nqqzw6e
	SLXhtg8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaNni-00000004BhA-2RfY;
	Tue, 30 Dec 2025 00:41:26 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaNnf-00000004BgS-45ir
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 00:41:25 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b7ffa421f1bso1814760066b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 16:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1767055281; x=1767660081; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/OOpbynk6cMUYk6IoIP11teU4BYuiO0Neyv7rdgKSCc=;
        b=c9+42AyPfRW9MChLw/v0rNTab8XxsvHZ+QnkOx984riGM138gfJrooa23Q4YLmnTYY
         B0zpeElDmUIzFDdOElSpWvJ/wWcAmgZezv90wOWDCOgEQ37JM4i09SGhYHUhl95P9uL2
         zVu5gwsWWErAFKukl3c7cdeN6tUGejahkVOrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767055281; x=1767660081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/OOpbynk6cMUYk6IoIP11teU4BYuiO0Neyv7rdgKSCc=;
        b=U+k4/jE/zaKIT+1e6ty4Nb0UOG0WAHD1a9dAC8Z/k/I4+iTRcG6PRvz63KAb7iU06l
         +nE3yDgCm6U6Uthzxi7WXALU6onlpJfnbhQIrW7v8heOBKT6Ed3bkRn5bM25uSHcw6A3
         m3CgojzvgymSlmDIOZMmyE5kAO8hD2VZrQmpI1xKTddnMueYJvpra8nsjdKNg9DBnir5
         aSEkes5D1SIuT3CzpBo/mU+Ii8lr2mJ/vJCgODQW65EkzSaU1DVe1gCo1OIcLf0gixkB
         6I7kBDCDFEAN6wsy68zlNUXIetFheSVSKwouV6MU7/KOCzx6hxs5oPQmca1tG050r5Ck
         fJxw==
X-Forwarded-Encrypted: i=1; AJvYcCUdjMkNmZy+NmheyNGuGt62FcT2LACNzCfmTBFQEkKd2mrKJsmhn4nkOdWznMo+V05LYr1VTrlomuJU0kSfX6wT@lists.infradead.org
X-Gm-Message-State: AOJu0YxD4lVkCpnR9TLaUEzfSMo49FLDV61GgiVIQgM9RtAuH0lSj56V
	AHIN9jfbNz/SQX1WNY3U5OvT7I/hjtaQoc/3ntKaOp7B1Nl5+mVaCLfpDp9QIdeDv13nDrmSeRR
	xt202Rc0=
X-Gm-Gg: AY/fxX65e0LRQBjLL90n9mM5MtEowPs6NK8/Kar0Help8Y1IZZz5VgoMwK54kO4b7SZ
	Wqc7s44zxJLKj3IsOoKuZS3MX43wr9OMvTLulFuEAPJ+332cfiylp/+divyuqf/8x/SgmFm9RrR
	XjabHivvA+KDoUWVt+ERYpHmHzGWq2NWHUQtU+fl/4fUArr8peHo0MpP8X7lj1RkzK3KJOWIt1U
	RAX1bSF4gYLKtp5XttXGrAbjAUaPJi2VY5bdJLzd+TDy+v63ElJ6X3x+LOTaJgk4X7iS8pccnJV
	8OoHwigndHfTrbVZEEtX5iH6n+Sd5EyUeBubF8AU1Z1rlCAh2ic8FN/C/oo1/xDqxWAhUhnXuHl
	31l3PadzB0t5MRgHy7e93j2fKJTS6J+PONQ5FjpqeC2AnSYdWjF/4U6zBVUNWtcSYBnZYM+EPkB
	hxhIMGsiw/+JIAchQtB7sGBR24e3KtMEcfFHadj6Iqg1CpYSwgrYzXX197acNo
X-Google-Smtp-Source: AGHT+IGyfOmPHIinH0NTiwSqG94XZ4maAGXmnX8tzDJ3IcJPgFhV+uavMYUROzEPoaY6HrDRC4cNnw==
X-Received: by 2002:a17:906:c38d:b0:b83:1327:890f with SMTP id a640c23a62f3a-b8313280196mr1154153866b.25.1767055281030;
        Mon, 29 Dec 2025 16:41:21 -0800 (PST)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916b66e2sm33828500a12.34.2025.12.29.16.41.20
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 16:41:20 -0800 (PST)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b7ffa421f1bso1814757766b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 16:41:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWAfguFpAA0xjQ9+9NM1HekzRfS/W/M7vTuJqqRLD3v1CZnCRC7xDeUpD8Z15pz5lem2ArWh1tLYEIBtjEb7Ki7@lists.infradead.org
X-Received: by 2002:a17:907:7708:b0:b72:671:b2a5 with SMTP id
 a640c23a62f3a-b8020400974mr2870792466b.3.1767055279778; Mon, 29 Dec 2025
 16:41:19 -0800 (PST)
MIME-Version: 1.0
References: <d7f3b00d-beec-41f0-b157-7cfb871f9a46@linuxfoundation.org> <756e3f65-b2f2-4da3-985a-17754a7a872d@t-8ch.de>
In-Reply-To: <756e3f65-b2f2-4da3-985a-17754a7a872d@t-8ch.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 29 Dec 2025 16:41:03 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjO-7uR5HBi-MFnkxAxjhpgfbAQ+HCMKPiXFVwM+AJ7tA@mail.gmail.com>
X-Gm-Features: AQt7F2oRj4wh9ZDjWvoh2Rob4-m_u3jMhQym1nFoxdYfh4pzw2gAPmxOpJxWfUs
Message-ID: <CAHk-=wjO-7uR5HBi-MFnkxAxjhpgfbAQ+HCMKPiXFVwM+AJ7tA@mail.gmail.com>
Subject: Re: Linux 6.19-rc1 mediatek mt7921e broke badly
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Eric Biggers <ebiggers@kernel.org>, Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, 
	Mario Limonciello <superm1@kernel.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>, quan.zhou@mediatek.com, 
	Felix Fietkau <nbd@nbd.name>, lorenzo@kernel.org, ryder.lee@mediatek.com, 
	linux-wireless@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org, 
	shuah <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_164124_152746_3735D81F 
X-CRM114-Status: GOOD (  19.35  )
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

On Sat, 27 Dec 2025 at 04:25, Thomas Wei=C3=9Fschuh <linux@weissschuh.net> =
wrote:
>
> Hi Shuah,
>
> On 2025-12-27 02:07:24-0700, Shuah Khan wrote:
> > mt7921e doesn't load on my primary laptopn on Linux 6.19-rc1 and proble=
m
> > still there on 6.19-rc2.
>
> This should be a duplicate of
> https://lore.kernel.org/all/CABXGCsMeAZyNJ-Axt_CUCXgyieWPV3rrcLpWsveMPT8R=
0YPGnQ@mail.gmail.com/

Hmm. I wonder if we could instead do this:

  --- a/lib/string.c
  +++ b/lib/string.c
  @@ -113,7 +113,7 @@ EXPORT_SYMBOL(strncpy);
   ssize_t sized_strscpy(char *dest, const char *src, size_t count)
   {
          const struct word_at_a_time constants =3D WORD_AT_A_TIME_CONSTANT=
S;
  -       size_t max =3D count;
  +       size_t max =3D count - 1;
          long res =3D 0;

          if (count =3D=3D 0 || WARN_ON_ONCE(count > INT_MAX))

(intentionally whitespace-damaged patch, because I want people to
think about it).

It basically says that if the size of the 'strscpy()' buffer is N,
then we do the "word-at-a-time" only up to 'N-1' bytes, because we
don't even need to read the last byte of the source, because we will
always NUL-terminate the destination...

That would basically make it ok to use a destination that is one byte
larger than the source (in order to fit NUL termination that doesn't
exist in the source).

The downside, of course, is that it means that we possibly miss out of
doing the last word of the copy a word-at-a-time. But possibly not a
big downside, and it would make strscpy() able to deal with this case
natively.

The *real* issue is that we don't have a "source is this big,
destination is that big" version of string copy.

Normally that is a non-issue - just pick the smaller size of the two.
Except for this particular case, where the destination is exactly one
byte larger, and wants to be NUL-terminated while the source might not
be.

I haven't really thought this through fully, which is why that patch
is very much whitespace-damaged. Somebody else should verify my
thinking.

                   Linus

