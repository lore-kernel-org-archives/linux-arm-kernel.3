Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F075C43211
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 14:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UjaUcqumMacUQ9KI5r4tiOS1vn4x2pFxKB8z2st3wU0=; b=xIZGDZKJZP6j9sf3yRyuj4m7jj
	DjCaxwsyVDilfXbMOO9lMzKg4A2HIzcmG3KzonhtdJwAESpr0ywrFtJneW20CjolSJS1bme/8mSXm
	2SCbzk/v/uxDUvKvftpD1Dl9iwmRZRdNtRjmZD65TkhtEJQ4ZoEvpbogOw0WVrcsjFc1WIIJS4I5n
	ddCDhTxEUVGChOCmFshmpGUUgLW0BxyCdYylKpO4S+77Xr1oGdGVbxs2/2mqN6Wbrzq2L9pCBejkz
	I6TmBHxvKdN704z0vKJJgovXATLjK2knsl53EZa+zfSpbq6y3vzVyRI/NOc8FkaDH2mawkU12jT+3
	2jbOUNyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdTu4-0000000CY4X-2l6y;
	Sat, 27 Jun 2026 14:21:04 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdTu1-0000000CY3e-24Rl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Jun 2026 14:21:02 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-39ad188f6d8so17563311fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Jun 2026 07:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782570059; x=1783174859; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UjaUcqumMacUQ9KI5r4tiOS1vn4x2pFxKB8z2st3wU0=;
        b=B5cuxV8ogooDD5XUc+X2Fu9fOqw9XB9Yasqm0cMPE95DkjkzYRD9XJfq5Mnn/+Rb80
         xANioJdBKY0JWcp6e6zeSv/5xtODGoto4R8fLSXsTHp+mkFxf1iCYwvZi1OqU8WHPe7+
         eLrctUY2wOzDZyUb37pILgCCDO4zCLFouQJxQGq70NZnlWF49WeML6f1sFGAa8OkQBRi
         1KvYgsZfZuP8+7+/Y7ls+LD3FxGZi2OyAoskGeoFSWbkCaAJzl4W/p12tOteAYui4BX7
         vUPvp8UIJ+fTkYOEboIeszRQHhUZtINKtPNZHKb71eh1FJGbQ5tCeEsRia9L6t70ZC6R
         Q58Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782570059; x=1783174859;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UjaUcqumMacUQ9KI5r4tiOS1vn4x2pFxKB8z2st3wU0=;
        b=dswAleSM8uWBDd0pbrobBVG8szyrml9V3yRcnzIQgvnOZXF6YV0XMnZA1Axuqxiom1
         JnrWYPVLIyrAC0xH/g6ZvvhV9Wkn9v2gQVlpfFyZn8fXUbCbfL14/ETrdT17I1Hqs9Lh
         J8D1HxkDnekzHuppcXGxCKxhKvAKMF5ru9htMeqZVSbtnrXV7SvEHlUXSfxiCSx++kv/
         i5JML6WL8ZTgKOQUn/H498EMFsKi9ujJ5YOZKyCeefGVG1Q3X9Caa3RN6lId43ZIzu+9
         c1lke1XKfhNjqvRIcBJG/XX/S/SjW2fu7qt8k0ExZIrpD30SPecrp0ui4BapEWzMwwcp
         iAoQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr9PezofF+2bKIs60s+9Zx1OhodKv/9JKNNSKdqHeanED3QJOcLnPfsUDcgK/gphFrxfx7Ihq3XZvcadJNgu04O@lists.infradead.org
X-Gm-Message-State: AOJu0YzsmY6ZLyOE54/+NhJ+lHOog9zpSzbodu30URNhdrbXqOj7xKEV
	5CIgwXG4uHiIW0Y2Qg84bw20ZizGRPz1pprMF/0QecECuM1lZwSkzcVr
X-Gm-Gg: AfdE7ck3vj3kG1R50El8nUJTz0mEH6LWsnoDjiLQPGYQxGisWHIv2AyE+O2ud6VP95/
	EiJxfMeRPge/by6VCzLjRusVTPH+9Z/ZJoqe3TqlhjbP1qwSiIL+8CL+icLIZevUSAMLTZmFrU7
	DLobkPPHwuBBK3RN7ums1NzTN1pmg7qoSiFgPAoaqyz+GZk78nxPLZeVtNKbqbT5LrLiR69GEa9
	C0iyo6gbLp/oUftN7VzJ6sj4XkVpBhma/UwrEU4D71GTfk2GB4LDxPLIqqOfH+3trOa7RkwgmAq
	pRxLquJMEK5YSeNe1O29vAeiVTRNXj1gakTVbHrz/DGjpZRZ07XsEXZW4TAo5zWNbO9tbpaYwuV
	qXElUGKjTIbgZcbxsn/WKSTWInEzBReYAqZIs0qLnHJKLCaEKBVxwzOMcJH8w/0mLo+WwUJ0Zs/
	EKGSGy3wmL4g3n3n+F/KhvCAEDe5EZ2qCYdUHOsG0rXw==
X-Received: by 2002:a05:651c:435a:20b0:399:99f9:3a17 with SMTP id 38308e7fff4ca-39ae15d1919mr7629901fa.21.1782570058841;
        Sat, 27 Jun 2026 07:20:58 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999b1b1a7esm59752681fa.40.2026.06.27.07.20.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 27 Jun 2026 07:20:58 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH v2] ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF
 datapath on start/stop
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <thanni.i9bbkrc1oza2@postmarketos.org>
Date: Sat, 27 Jun 2026 18:20:43 +0400
Cc: linux-amlogic@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D982B214-552D-4E21-AF98-4367C5ADC62D@gmail.com>
References: <20260627125030.808058-1-christianshewitt@gmail.com>
 <thanni.i9bbkrc1oza2@postmarketos.org>
To: Ferass El Hafidi <funderscore@postmarketos.org>
X-Mailer: Apple Mail (2.3864.600.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_072101_549194_8AEDFBEA 
X-CRM114-Status: GOOD (  14.35  )
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

> On 27 Jun 2026, at 5:08=E2=80=AFpm, Ferass El Hafidi =
<funderscore@postmarketos.org> wrote:
>=20
> Hi Christian,
>=20
> On Sat, 27 Jun 2026 12:50, Christian Hewitt =
<christianshewitt@gmail.com> wrote:
>> The I2S FIFO soft-resets its fast domain on start (AIU_RST_SOFT bit 0 =
+
>> AIU_I2S_SYNC read in aiu_fifo_i2s_trigger), mirroring the downstream
>> vendor driver's audio_out_i2s_enable(). The S/PDIF FIFO has no =
equivalent:
>> it only toggles the IEC958 DCU, so a stale datapath FIFO can be =
replayed,
>> producing the "machine gun noise" buffer underrun - on start when =
switching
>> outputs, and on stop when playback ends. The latter is audible on =
devices
>> with an always-on S/PDIF-fed DAC (e.g. the ES7144 on the WeTek =
Play2).
>>=20
>> The vendor driver resets the IEC958 fast domain (AIU_RST_SOFT bit 2) =
on
>> both enable and disable (audio_hw_958_enable), and when reconfiguring
>> (audio_hw_958_reset clears AIU_958_DCU_FF_CTRL then resets). Do the =
same:
>> reset before enabling the DCU on start, and after disabling it on =
stop.
>>=20
>> Fixes: 6ae9ca9ce986bf ("ASoC: meson: aiu: add i2s and spdif support")
>> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
>=20
> You may have forgotten to add Martin's R-b here.

100%, but I also missed amending the commit description for the v2 =
change so
there=E2=80=99s a v3 where it=E2=80=99s been added. Sorry for the noise =
everyone, seems I am
a little out of practice at submitting things.

CH.=

