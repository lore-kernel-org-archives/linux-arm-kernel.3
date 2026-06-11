Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A6D1CD98D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 08:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i8WaiBhZCg2JUQSyC77l4KARDvtWcKvB5SXOsU+dVgU=; b=gT1okqU9LwVUXawUSy8O7GYba8
	/DgzTIox46qrfh/1rq82wwVkUtPE7feklt5M1yQmVntTsNlYkpjyw/norNxJCram2fvnZFY3rSByU
	3SpHKjqUkl0LFnRmHyfx7oRWbgsPbsoacsy/GWSrKMpiK62zrRC6xCmwCOAGAL6HtRKarldAo6n7o
	h/2nhYiFD7iNGWRZzo8p22J2oIxYRGBwWEUg5W6tvH9mvrQLIV8QIxcohaftEtEoEJ73l6OeckTHd
	FK/ea3VVDPSjuNMZwMMy0lOwFSKtgVSyamISqLg2CoLIvcB3y9c7SscE6Lt9mDAD86DN649lusSOR
	SXb6u+Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXaUt-00000008y43-0dHn;
	Thu, 11 Jun 2026 08:10:43 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXaUp-00000008y3G-38VM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 08:10:41 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-45eecb8bf67so5751589f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 01:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781165438; x=1781770238; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i8WaiBhZCg2JUQSyC77l4KARDvtWcKvB5SXOsU+dVgU=;
        b=FP4qmyzMS/OGo34pTIzbP5QiKUvBu/3IplUoQL8IOk8kr7u45rDd4tLtlMTBaWLnoI
         PWwOzHtQPy5xSKm17E0ec6HFH3ughwfs4q5uAExUsoadZJXVzQbyUnyRarbmqLYFZnQJ
         cxoW8KbQdPfVybCbzWq+n1ETWllwRbl8Ze25ync298twTNFrGS0dI+VM0Y8Rj7V3Z3uz
         ZZBwNsOGSOBqLtmJNJPvVXK9c43Op2ylOnT3ELz19mqCHrhohYEMo/3eD5IJoVvTag+v
         dgtHhXl1Ta/WSVAyyPV1nlaApol3yl4ioxkAoKpTJcxdpYrTRlDmsW8c/Ot2ugkFtWK2
         Q66w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781165438; x=1781770238;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i8WaiBhZCg2JUQSyC77l4KARDvtWcKvB5SXOsU+dVgU=;
        b=FXfT66BP/sIukBdnFvfkZE4lz8WAVLyEJbuT8b96OIdPoLwZCwdFmVREHZyfKWc5j3
         +wN8FhO/JUnRCuK3KEQTmWFbKP6MbBqLyXAxyVDW30QnzifEWb4e9QfW+FY/YZ8/eNK1
         B8+5nCVM5U0NSCAJtoaqJySPpe33vwaeKQZuKTHUo+slU/uqLd78PS11uL0IKtGuOxQQ
         R2HYqLrgBa9XLyJzdX/iYucxSKl7L3cNGmsWxjjlF96z56jnuSOInKcgbVK1jat++gaw
         dQwda9i8JMfnGzMsA2F9FP9hruDVzI5akiWGorVDv711nMtdlMppTHFjD3JXd7ZmD3XT
         notg==
X-Forwarded-Encrypted: i=1; AFNElJ+RGt+amKMvCxS5pEBj19ew5Uhb3aYet0df0xwpwRKLnJs/cvPsmR9e83DzrfO3JQcmaiWt9eJ3a1ENIMwUGNhy@lists.infradead.org
X-Gm-Message-State: AOJu0YzWluPR8DVQaZpGJLjYOAEECDz2fY09T+QvmrOpuGJV/OWG78Yx
	Yj/oUrhMaxOJ2LkG9wiqKKUZz52ti4znX0QBFDIzbgAaJOIp5PrFIc65vnRiTMbGWUw=
X-Gm-Gg: Acq92OGAKB9fd4keVDmBI/eLnR5/C2DSuASF5omT0bmdMvdFoBcThPYhUPqryObEas7
	qF97GxtfJXKQ4Om4L/vQa+jVUFjTIa0DeVe86gAwD1WlIzfJ136fcfHoNUiYnURdgTkkmTKD39K
	gL3NRw3BXz3BMWnWoLRqn+rkrNf8q5l4pnzI1S+RCSDhtX8NycMdDMDwLknfCHN6iumIiGVJItn
	1dMP6N6jXe5HdiM//IH85fQIkMTCZrLBCJZz7hohwKi6c/lnDeaKZVlQ7vCGqfJaPkiXKSqMwMI
	OC2x4wiI+QvTmV9I4w2AJHeWW4Kn5Y23kuHcxqMC41YRJ1ak2YDAajVWOL8KF4mogke5cOu4JIg
	H0azImCoEhkGUCheIT3bAhK8X2s5BdCwK1wSZXFVSmBRMq7JQPovEG9/s3zPEX5rDLFk2FxFB77
	YjRe5r9F2kjwriF44+sgUzSrB58PWbquQyPiKrTvBPmDs=
X-Received: by 2002:a05:6000:46dc:b0:45e:ea65:d329 with SMTP id ffacd0b85a97d-4606758d002mr1861604f8f.7.1781165437896;
        Thu, 11 Jun 2026 01:10:37 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d1b:88ba:5161:3581])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4601f2e4004sm78864656f8f.9.2026.06.11.01.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 01:10:37 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,  Liam Girdwood <lgirdwood@gmail.com>,
  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>,  linux-sound@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-amlogic@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: meson: axg-tdm-formatter: Use guard() for mutex
 locks
In-Reply-To: <CAABR9nGC=f_hO7FX2RnRHLb5D2Tt9=qT_yv-Fv2y32AAoQy+sw@mail.gmail.com>
	(Bui Duc Phuc's message of "Wed, 10 Jun 2026 23:27:09 +0700")
References: <20260610102153.83367-1-phucduc.bui@gmail.com>
	<1j8q8mfte7.fsf@starbuckisacylon.baylibre.com>
	<CAABR9nGC=f_hO7FX2RnRHLb5D2Tt9=qT_yv-Fv2y32AAoQy+sw@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 11 Jun 2026 10:10:35 +0200
Message-ID: <1jo6hhebus.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_011039_796715_7CD53298 
X-CRM114-Status: GOOD (  18.97  )
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

On mer. 10 juin 2026 at 23:27, Bui Duc Phuc <phucduc.bui@gmail.com> wrote:

> Hi Jerome,
>
> Thank you for your feedback,
>
>>
>> I suppose it is OK but it does not seem to really clean anything and
>> make the code easier to follow in that instance, from my perspective at
>> least.
>>
>> If there is policy to systematically use guard() whenever
>> possible then OK, otherwise it seems unnecessary.
>>
>
> I have noticed that guard() has been adopted in several subsystems.
> Since this appears to be the only place in the Meson ASoC code currently using
> mutex_lock()/mutex_unlock(), I converted it for consistency with the
> newer style.
>
> Going forward, should new Meson ASoC code use guard(), or should it continue
> using the traditional mutex_lock()/mutex_unlock() pattern?

Can't say if there is such policy either. IMO it should be more a
case-by-case thing

The code is not better or worse with the change but you went through the
trouble of doing so, if Mark is fine with it, let's have it

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

>
> Best regards,
> Phuc

-- 
Jerome

