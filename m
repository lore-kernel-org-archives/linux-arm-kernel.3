Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C4AFEE4F2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 18:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CzbAnz6T/IhzT60BwbsGo7FPW25EednVTt62Gcqnlt4=; b=jrRg7wG7jOm4b4DEjNHYtoKz3d
	5dtUD8TlW9LMyd1+g1aqb8RnB5+SKKa8A97OiNc2pYce46oUi/HzvWGnxS1DTRKvBuJxfQ9pkC4bN
	LyWxpECDSD6ntQATUiU0BIf/+8k6ODJ5KV6gpj8RBXzwEWmw7Mw1Sx0tzb4V2NrYQXSLmgvrtSrdf
	HDSxLv0pwyTB2Do6/nwG4GduSdqxUWu0Z30DG6dbzJYX2g6w4IRTRKRGpJnJ2ouYsePuPA/2tTlnR
	vtEYWxtIw8rITKtMwRGgLd+6eVacYkXjjeECsjDH9Jri2IjWEE3/8FnnQgZLVIxNQ2O9Rh94Gt8no
	dbXgquUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwOcL-0000000A7yR-2Trx;
	Sat, 28 Feb 2026 18:00:41 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwOcJ-0000000A7xD-2Jit
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 18:00:40 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-506a1b23c05so37435851cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 10:00:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772301638; cv=none;
        d=google.com; s=arc-20240605;
        b=hs2jmrjur0Y7Q0/eIfLzjwAxPD85ZRgHNpPIYe2fIJlqSEMAK5KteZvwq8VU2klJ2i
         KB3jfu8SwJJm9MMWfmOxAaRO00U0BYGfzWH1ZhjXJWQN21LPaD6xf9Tr20TxHug9xEV7
         5Ymi9abn3W1am6VWOIkQTC9ceduNEW9/OlgCJe1vbQPrK7AHFFTRxS87v7trZOS41uuQ
         9/+sqvHMdj4fqBtuTa67qXpdjDJCOnYQCUPFiIj4TbkgmV+IYb8wGZJeDdWkPgXrJoTj
         nAQL51cJabMiZxtdfzZ81SAbKSomHSVVB81GdhHp+SW2Qn7AOS5rqxiTTIN/ZN33aagu
         RSVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CzbAnz6T/IhzT60BwbsGo7FPW25EednVTt62Gcqnlt4=;
        fh=EUqyV6i7eb9/jvSo4cem1+oZqT5/p7fDr6UvYXEqYy8=;
        b=cVw6I4gBqMhI6HQUOFCJwe4006lB1v2sgp3Gc++XM0D2LAbNeEfR9HySkoUjbaTV1f
         J+iH7a5xceQOYlvnKLc2jq1PX4QUaLYrEhWIMEIQoZJid+447gYsLDqbeuuE+L64361E
         8Rb0PEtsEdoax2uZEa5t6qjIHEklQx+3rmQhuqRXEJswKekEB9YcXNnTWHhot+jGAjaV
         x4qI0K6qXLbkVrsGLvSpajyNAw7/azjCAxgJ8d6oG0tpajDTWR4Mv5STYNvYGPFvYLsy
         FZnFH+W4XtrUZ7GXAX6eYEII2q6tBhLwFV4FS8pcR2Id0C5rf+pDr22eiIJFxJNj28jI
         3cRA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772301638; x=1772906438; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CzbAnz6T/IhzT60BwbsGo7FPW25EednVTt62Gcqnlt4=;
        b=Q+Ga0A3pHi2wFe4bTMQAkYzSxsqkjakjiQCZKfLsbswTfG6QGatdaYbSt2qYXTFA5d
         7LUsUwRve9QBKrlZJh/F915hH919n5JDGz49EjXSIi2Y2OPslsL+6IOqs52irnZcK6xc
         /OoQoRKadTP12aeNcfHTDSoX6vOqU+NqUC46+UeMw609SOGLacLo2ctQTzO3URonvkyf
         7WiFmSl6lJwSI9K29ilGTSOLLDJXleUt/m3olYVvKXtwfEdZy7qmNJpe/dT5CZZSBywJ
         q1RAc/Nd1srBtUmMS/n9Z+die05k6rgU1fKHtPGIp53gPD70TK1kyQVxp/z07xDHwxf+
         bPSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772301638; x=1772906438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CzbAnz6T/IhzT60BwbsGo7FPW25EednVTt62Gcqnlt4=;
        b=frfqv0gLr9IqUJhiwxID/I2GqVUVtYTtbbM6vlRjjsWb8GIHqdLYmrqgRaef5lMBCJ
         XejRMHq+6zYvjqAOVM0S9sekC7Bv+AJDCOu+ZY+IvDub2PTbCauQiqbl5AZbMoK5V0ID
         PV0K5t3w5dv5j65liOccpiNrbtx/tUwqyq4ChZOLHdwxy7KXIixvzWDx9t+LaK7RlO56
         G4BmfOcEeaDFh8DJGIQq+4JQC9JbUEHu8KZrlYM0ZEaWSJICOyPZCW5eVZ1UIPfu0ERT
         B33cPoeKdpmS5PWCKWfncmdJ6qGNb+KBIgs050GbtWmrzy2IGfGBXm5Ldeqa9KsWRWZg
         fUkw==
X-Forwarded-Encrypted: i=1; AJvYcCXh+za5j2NnnGBdlZtZ4zI2uyHgM1/WXvtJvWXEYjoGxBgTbLMAccGOcXJ/EOsAC9cckKZbC8zZeReavoomiTz6@lists.infradead.org
X-Gm-Message-State: AOJu0YwIElIXhHowtj1V/E51GTX+7qZijj937KW8i74Wk9NcVLahDwHV
	T2F0Be1akMh9oLApJAgxC9DwAlpqnVwKltzy9yztmsGUk6fTkv5WHJ1HVWRUvmTU9A4/LfRIQUV
	SmX0Z58z60cjvHI1FZ0M4t8LUHJJn0WY=
X-Gm-Gg: ATEYQzwNi6S8J/2Ksl8nOOd6cJnwc1YawdXX1BAN8Yc5HugdUlczEs8fvaIrJbjBEcJ
	vafrUW4VJ+L0dg84jN/8ezNV21OjTIgd83dDeMBp2FTEueR4zhhNsqh2kDSPwXRiQolKGReMCMK
	oHz5MKQG0JPwctsuRL9P3nZszmWX43JtLbX4t9nC9KRLpx6413OY4kA1PfIbkoWfuQiUlugigJI
	gV/SjtFDLKbjV1POzhAUuF6WFzpuwk3PkCQ/b8h1CRGtD8LCHRu5I2ok6Hp/mWO0JYRAotPHpem
	ZGmdNwEuoR1grYfJDEZ/xPlw
X-Received: by 2002:ac8:5f4c:0:b0:4ff:b211:6aa6 with SMTP id
 d75a77b69052e-50752796176mr90990561cf.27.1772301637636; Sat, 28 Feb 2026
 10:00:37 -0800 (PST)
MIME-Version: 1.0
References: <20260111092833.466263-1-akkun11.open@gmail.com> <6a499e1a-80fe-4fc3-af77-b5d31f689d7f@collabora.com>
In-Reply-To: <6a499e1a-80fe-4fc3-af77-b5d31f689d7f@collabora.com>
From: Akari Tsuyukusa <akkun11.open@gmail.com>
Date: Sun, 1 Mar 2026 03:00:26 +0900
X-Gm-Features: AaiRm512V9E6SYs2_Yyac0rJXDDdrcUO_TD7gqKE_u9D1yEofE0XT1GKOLrzGEk
Message-ID: <CAKr_iV40A8=8e4Bqez-mbq6Jt+ZVNH=Vbvk1mQPZq1Z_feu+ng@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: common-v1: introduce per-function
 multibase control
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	"moderated list:PIN CONTROLLER - MEDIATEK" <linux-mediatek@lists.infradead.org>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_100039_601065_0AC3BB55 
X-CRM114-Status: GOOD (  13.16  )
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

On Mon, Jan 12, 2026 at 5:31=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
> Thanks for the patch!
> What you're saying here makes a lot of sense, but there's one big questio=
n for you.
>
> Have you considered migrating those pinctrl drivers to use a PIN_FIELD_BA=
SE()
> like it's being done for all other(/newer) MediaTek SoCs?
>
> Why would this not be applicable for those old ones?

Hi Angelo,

Thanks for your review and sorry for the too late response.

I am developing the pinctrl driver for MT6589 and initially based
it on the MT8135 driver, because those two SoCs are very similar.
However, I realized that the hard-coded multi-base settings in v1
are not compatible with MT6589, which led me to create this patch.

After looking at v2, it seems likely compatible with MT6589 as well,
so I will proceed with my development based on v2.

Also, this patch has two flaws:

- It hard-codes the behavior of mt8365_set_clr_mode, which would
  cause issues if there are other SoCs similar to MT8365.
- spec_ies_smt_set expects the IES and SMT registers to be on the same
  base; if an SoC does not follow this, additional handling will be require=
d.

Please ignore this patch for now.

Best regards,
Akari

