Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E60C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 12:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WJgZmqjC2QA9/uTc6kcbWKzkbTz9n7WrrEXRH7DelFo=; b=nunNTrtStnh9WYP31EnPzPqQ5J
	qoAj3fUTcB4mn+SSr1ss6OqfBdGnuWXblDxbAZH8vFp05NY+6WjCC7l13wtmTuMUZsrEWgGIjAyLD
	93cSsdxw7DxlCxgvH10VHhqNx4gmz8x//lY5MO/YmMOZnvg3bBuHwVHIbg/IvLFUA+v7EiA1F0P0o
	0JjQbPEVOGeV1tJWwBdvzf3G2zdAwDv4O9hPXFE7PM9XO3fQKVmMtxrBeq8XC5YHWOB7JeNynBBbl
	klU6QL97PTK1tp9jk0oBR/RuGiOySAjiZrO9lQAQ7zwjkS31YXLiSqrusS3qMGZY3F5PkUQJCBJcX
	M+6szhRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weAjM-0000000EVqr-1whg;
	Mon, 29 Jun 2026 12:04:52 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weAjI-0000000EVpt-2MF7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 12:04:50 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4924593f45dso42307525e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 05:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782734687; x=1783339487; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJgZmqjC2QA9/uTc6kcbWKzkbTz9n7WrrEXRH7DelFo=;
        b=C5NUHElDUreP7NH7qc442GFpRLo9dMfguMASou88Z4nhuK87xSgvpLgT5Z4obr2A1s
         6kE2uWITxfkLoVCcnBMj2O1SyLB6BAlGnoxlKfv1/gfOeQkpAPO4yCnAnSolfHBG7D46
         BtR9JAGj4bi+52BYwccctKJaNZnPhabkfVxJODB9hlWxj7jJCOYRrBeLsjoh3aonhVHb
         JNsBMqEe3eVFNH90J2wa8JF3Tn9aXjXjAvXiyWFIM2Omfo51kedObNjyLGpKo7kqtdYg
         bYhNb6n+Fm6Rn/UfTz5Q7NpUs2chz53u6qe33+eDDijGdSlihbA0BUP8nYAnYYb2Lc9a
         25PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782734687; x=1783339487;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WJgZmqjC2QA9/uTc6kcbWKzkbTz9n7WrrEXRH7DelFo=;
        b=r6qMB1p0XV5l+qBBggqZ6aygjvGgrtK5I3cGSwo4S4Xreu1cuSDhjcEZiNh57bjkhk
         hBH54gnY7WiWyXuTKXBuywlO9CTa/19vM0W9sDGRI2aNSn/Unma4tit84ilRJcEk2/B8
         KmVCCT83u121X26nt10g0LTri5+gF4h/dfzpqH3PcftJ7yL4MsIkJ4dJDhk3+i3L0+nv
         SOhuwCh0+mUmWYm88X4wb9cYNepfHHEGrc8VM9dJ0jdadS4GjRZALOZU8IDQbh3RxDz5
         DHcotFVaZXtqU/hrzWJHQZbUKUJLb0s+aqtpQQhLHbj38fQytvpHlsvnaP+fOEZw7Bt/
         8znA==
X-Forwarded-Encrypted: i=1; AFNElJ88nuJL/HdXn2UKo72EuDl8iSGk1fbXHojsEiiY+5ybDa8snjPAtnmXS/qUc42LL+S9k3c7eoRGn0M6huwaJ6Ow@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5pV/7c9yANJUsxYoH6BFEbAwJLdMSEbITs9R+PjahZdZ47Vi8
	zOnGa1rB8pUyYErEExoB3YZC+zMdFgfqnooRvq1h5bAOfmfj0af7UcIXi3U0ttN6x6k=
X-Gm-Gg: AfdE7ckeSKWbvi2C1aa1dtNzCkpz5geUaaFpjWgfQCZNwRU3ukDJ2Cyvj2Vnr+1Bdsa
	BPv2lID9N9tWlVCubz/bkRyIlCcqKmHIfMN2jwSgjn5h9GILg/gNxN41TEOy6SYYRLzxxE5AOFA
	/GUyqjMc8kyqvihjTAk6iVhh8VW0AvdU7p/QDCsr7qn38FVooTHT7eQ7LcbtjKWOyyqb27ImGOS
	eIrtZ3qb6J8aupnafRSRmDPb4KOvxNKMk4ikCA76vPZdP46WkwkHJulni3pKHrSdTunseHZJ7hp
	1EAwktmMagFCEBJKKehd8xDNfXBpY5UKvgZ38DNuds9iOX1nwNnN5XTLi0p6/0MKfQKRU0NUhGc
	OzQHnqpKb07Syykjb4joIS4Rn7J3Nq1bjaqMfuumiRIms6Pydd8lFPrgGgNWDp6ZI4tZQOcJ5CA
	NYOKC/3bOvJpM=
X-Received: by 2002:a05:600c:1d86:b0:490:d354:bcf4 with SMTP id 5b1f17b1804b1-49266885dc4mr247452875e9.27.1782734686627;
        Mon, 29 Jun 2026 05:04:46 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d21:f5d5:2d3c:23a7])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49269071d05sm317487775e9.11.2026.06.29.05.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:04:46 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Christian Hewitt <christianshewitt@gmail.com>,  Liam Girdwood
 <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,  Jaroslav Kysela
 <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,
  linux-sound@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF
 datapath on start/stop
In-Reply-To: <CAFBinCD5bn5VixbomCz0nmHuopBmgh0CJc-V4jY2vdXhoP_VCw@mail.gmail.com>
	(Martin Blumenstingl's message of "Fri, 26 Jun 2026 22:41:24 +0200")
References: <20260626080422.4191435-1-christianshewitt@gmail.com>
	<CAFBinCD5bn5VixbomCz0nmHuopBmgh0CJc-V4jY2vdXhoP_VCw@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 29 Jun 2026 14:04:44 +0200
Message-ID: <1jwlvha6xv.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_050448_615998_2CA14324 
X-CRM114-Status: GOOD (  19.82  )
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

On ven. 26 juin 2026 at 22:41, Martin Blumenstingl <martin.blumenstingl@goo=
glemail.com> wrote:

> On Fri, Jun 26, 2026 at 10:04=E2=80=AFAM Christian Hewitt
> <christianshewitt@gmail.com> wrote:
>>
>> The I2S FIFO soft-resets its fast domain on start (AIU_RST_SOFT bit 0 +
>> AIU_I2S_SYNC read in aiu_fifo_i2s_trigger), mirroring the downstream
>> vendor driver's audio_out_i2s_enable(). The S/PDIF FIFO has no equivalen=
t:
>> it only toggles the IEC958 DCU, so a stale datapath FIFO can be replayed,
>> producing the "machine gun noise" buffer underrun - on start when switch=
ing
>> outputs, and on stop when playback ends. The latter is audible on devices
>> with an always-on S/PDIF-fed DAC (e.g. the ES7144 on the WeTek Play2).
>>
>> The vendor driver resets the IEC958 fast domain (AIU_RST_SOFT bit 2) on
>> both enable and disable (audio_hw_958_enable), and when reconfiguring
>> (audio_hw_958_reset clears AIU_958_DCU_FF_CTRL then resets). Do the same:
>> reset before enabling the DCU on start, and after disabling it on stop.
>>
>> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
> This matches the vendor driver, references:
> - fast-reset SPDIF is triggered on enable and disable: [0]
> - fast-reset SPDIF is triggered after all of the configuration is
> written, then DCU_FF_CTRL is enabled: [1]

Take what the vendor driver does with a grain of salt, especially when
it comes to audio

>
> [...]
>>         case SNDRV_PCM_TRIGGER_SUSPEND:
>>         case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
>>         case SNDRV_PCM_TRIGGER_STOP:
>>                 fifo_spdif_dcu_enable(component, false);
>> +               snd_soc_component_write(component, AIU_RST_SOFT,
>> +                                       AIU_RST_SOFT_958_FAST);
> It doesn't seem to make any difference, so just for the record:
> The vendor driver first triggers AIU_RST_SOFT_958_FAST then disables DCU:=
 [2]
>

One could even wonder if there is any point in applying a reset when
everything is stopped, if the enable path will apply this same
reset before anything else is started again ? Does it really changes
anything to the reported issue ?

>
> Best regards,
> Martin
>
>
> [0] https://github.com/endlessm/linux-s905x/blob/c1391ba1116aed801aaabfd9=
c7bbb76fda9801ec/sound/soc/aml/m8/aml_audio_hw.c#L1016
> [1] https://github.com/endlessm/linux-s905x/blob/c1391ba1116aed801aaabfd9=
c7bbb76fda9801ec/sound/soc/aml/m8/aml_audio_hw.c#L979-L983
> [2] https://github.com/endlessm/linux-s905x/blob/c1391ba1116aed801aaabfd9=
c7bbb76fda9801ec/sound/soc/aml/m8/aml_audio_hw.c#L1016-L1018

--=20
Jerome

