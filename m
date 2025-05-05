Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBB0C3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 11:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9GMQp9j85OZqKlkrHyZMpU/XUq0rYEnvHyaTGQjhBF4=; b=Ig73QLNldvyoWddZvR2342rIqf
	bcuj0j3L1QjiKD0nwh00Mi28ZrWWDQ3jPWir3F2oITMJVWiBgjfzMMwMY8/sobbmJofNDlhFXtDJy
	c7V7t4x0vLHqeV3fLtlgpR/RN3myGV+6AszFodj6xVru7PlXVUmGJcNW8CJXf8NnS5+7xAg6jeWsF
	b0Ra+ubdFZsmMyjnN1uyMus8BcmPoUSRFJTHUopeOI3JESUnu5uL5HoSAlIkkosynAEf4qq5IIR8a
	dgr9UNNBjtCf/1oEk0frnBfGeP8eSu3eJ4yoMVvBzeVRIG0Iacyk6NwXziBcKSBIe+0elgBTwPm/U
	wG5j7+Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBuFT-00000007CV2-3hyR;
	Mon, 05 May 2025 11:44:39 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBu9r-00000007Bi9-38hT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 11:38:53 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-3f8ae3ed8f4so3082739b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 04:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746445131; x=1747049931; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9GMQp9j85OZqKlkrHyZMpU/XUq0rYEnvHyaTGQjhBF4=;
        b=QSn7l1bhYDPN9IWDhO/VvFJqyb/hG8NYFe/0K7XatB0uwkeNLmKYLWZHxfWvDqlRZr
         R3yj6rGOee2hmmq5Z8742isrhtV2pE6mclbKR5eD267QGzRcRBZc0h2xblBoFJFeuBhO
         JDLdoo+j/k9e/zMjyTVWS1++YoES0aHpVBT56A3RlAVZAo/1MIXGDqUOkcYC0OOALWNO
         jw6yMy+uxlg3ujHS9jUjYvt+r4/yTxsAUAkgqJb89k5YBN7FUhV0ZE/nzwRCujKCmE75
         91bjQ6Q5mfer4cQTbdH5jAR9f+VFX9jJWRk+SpJ6MFnER9X+NsdiXxNCq6FpPM2EVuE4
         dsbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746445131; x=1747049931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9GMQp9j85OZqKlkrHyZMpU/XUq0rYEnvHyaTGQjhBF4=;
        b=n0WHzeBc7F28apejmgnpVMy6VyF+meLMTT5K1znpFm7+tdUlMkWeYpAMwUQvopLubs
         IThaHLl2J5yx7xn6V2SYT3AQONT4TvuSL4qM4xbXCSHXc7D8jaEPOKpTnEijdpMGD/FE
         2PR5puLT1oHt+Hr/dzYm3k6QsS6XMkLyxGplhTLgYmMpWP9mj9vtoJiw7jspoVmo1jqO
         1Oem49OQHE8c0UNs1ueLI2UpQQP3MxzNlQKeroP91j8HKo9XmYIxLxTIBKWsnVMTB9gS
         YFe1ysFDmAAlyYonINusQFaLe2tjyPPPVqb29WyWUIpnYP5Lmza6JbIrZ4f+ArchMI10
         ZlsA==
X-Forwarded-Encrypted: i=1; AJvYcCVnwGeyF8m3unauLMkuxmEDS3XicBvfmPibPs3BW6hnrT2YoOn2KcJFi+aF8u61KN8Kf3wg4QfKvwp5WofQpkID@lists.infradead.org
X-Gm-Message-State: AOJu0YxY4YmntzkD85x97DHa5v6AF+MJqFnKsy+Il3XRPUq+MNxxAfJj
	Wdrd7eTvs03yXYCd84xlTi0Ki+Wun3xRE+wGy9dCnohSfK26BCMO/cZosmAw8lE3hNql+Fhvgu2
	LL9YyG4qKinyfWBprZnzmcd6YRxUZhfh7U/oOJg==
X-Gm-Gg: ASbGncv9XPp3vL2ZEzUsPhQvooiRfOxWmATujllNu2HZqNTDqnz9uTrqsN7aQiMqi/u
	3rEn/aoRGQJndMuofGfQjNcfHhp81tFpFRj8HuiNEQOwSdB2NYpJYEgzdjeHQEtmhtixDo+idyJ
	FR7zd1Gkv1xy+eSDqCpaCLHtM=
X-Google-Smtp-Source: AGHT+IFsXXtVZfrIMVAYeKVEaw/tyOZiD5EOR3pAScS4csZ0mXU9Ezu4MEU3Ox8q9DYU0yBa6wml39ms50QahdcbUm8=
X-Received: by 2002:a05:6808:1a1c:b0:402:11c2:253e with SMTP id
 5614622812f47-403536715ffmr4977375b6e.21.1746445130746; Mon, 05 May 2025
 04:38:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
 <20250502100049.1746335-10-jens.wiklander@linaro.org> <aBTpiMIevmAmp5vr@casper.infradead.org>
In-Reply-To: <aBTpiMIevmAmp5vr@casper.infradead.org>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 5 May 2025 13:38:38 +0200
X-Gm-Features: ATxdqUHaC_cUwJGh0_wJGsfxAOxe5bhlKMecpe-U61GAupKguhd7Rz5skfHcbL8
Message-ID: <CAHUa44HOq91O0yUWVUKcUzYv9j3xqOU3WsDg9KDXiExcdPO8fQ@mail.gmail.com>
Subject: Re: [PATCH v8 09/14] cma: export cma_alloc() and cma_release()
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sumit Garg <sumit.garg@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
	Rouven Czerwinski <rouven.czerwinski@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_043851_783954_7295B876 
X-CRM114-Status: GOOD (  13.21  )
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

Hi,

On Fri, May 2, 2025 at 5:50=E2=80=AFPM Matthew Wilcox <willy@infradead.org>=
 wrote:
>
> On Fri, May 02, 2025 at 11:59:23AM +0200, Jens Wiklander wrote:
> > Export the two functions cma_alloc() and cma_release().
>
> Why?  This is clearly part of a larger series, but you've given those of
> us who are subscribed to linux-mm absolutely no information about why
> you want to do this.

I'm sorry, it's part of this patch: set
https://lore.kernel.org/lkml/20250502100049.1746335-1-jens.wiklander@linaro=
.org/
 I'll CC a bit more in the next version of the patch set.

It's needed if the TEE subsystem is built as a load module.

Thanks,
Jens

