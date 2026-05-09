Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02135CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 16:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OjvQAKtsddCwvtPj5IUL1zdvC6FgIzquAG4/cEYySIc=; b=hH7OfKvPVvguMp9eQFiLEdraEU
	hTTnm2gVAK/9cMWSCbMmblxwTHuTZcp9eRtLw1Ca9/+Ksz/nAtdKz9wIHu3EujfAXM1egmxNpJSp+
	pL9/XWIwZHbjDQZcr4dzYgbV5cD3qVPvPC6Brk7ZR7yywfcuSXHWUxeX13W43RUEAiupWk6Uo6veB
	/OeSAomWlqjhPZUWvr6nvdUYUbYMFkmth6LlsbFJ1k/9hhdSADGbZ549/xxFLEUdAHXerjsFkiVfb
	RotJjinMYK+ZWOmGZ6P//SnGTLZ3VR5OHfnPs/VR5F0Av9jqAHrOuZUoIBT64sDKmPCfzzf5dQcrK
	Jjs1OIAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLkhz-00000009H5Y-1EHX;
	Sat, 09 May 2026 16:39:19 +0000
Received: from mail-qv1-xf43.google.com ([2607:f8b0:4864:20::f43])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLkhw-00000009H50-3BrH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 16:39:18 +0000
Received: by mail-qv1-xf43.google.com with SMTP id 6a1803df08f44-8b8e98fd885so26643976d6.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 May 2026 09:39:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778344755; cv=none;
        d=google.com; s=arc-20240605;
        b=Ydaj+m5kXzPYUVxNPbGRLlBYaaUF5tz5swmDdBQhCzU+CMRCm9B3pHqdEwfiQnbcVM
         DzWYTrxHQfLkepYUvYMU3s7iZ7hI/FLGloh0ZnyDCutJyLNWTFfdFJBiEMn3h68mdlvK
         ZVqxZDkvBmCWwy5dEa2AaDcq1GxMghJcg+Mx0jFqRuUuaIZdsjFr7DmwInC4RFox5Lq6
         VxgdRpdKMfum3EV7GZ47zIpRjFDlCg58sRfh+45U6FvM7zubFJRmtFp/0GE28SrOc1KJ
         VaFfKZgYoQr9OTDo1R5ZfPop2zi//M0Pp+1fFhCFFK6khXYo0HTH8HCD5heBUJqKRUl+
         Pk6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OjvQAKtsddCwvtPj5IUL1zdvC6FgIzquAG4/cEYySIc=;
        fh=a4Ul+YEKaX4MSbR/LoAfZxKbffSOuU0qEsmMg85WrPI=;
        b=BOF43vabR4Ay2s03PseYhAu2wWD8UMwWsQLRoxkhIheI3jPDon9t9+lrQmG4Xhyci3
         SqxFDhDWMKPAhXgAzgDaEi1VipiazI/XXKZ9pU0TYu5B7FhydhziPk8SIO9qaToK1dCk
         1BGUH6nwXelwr1V7hsPMDvuV+VOHgJRGEfGPMtGI9OAoEdcoMFwtHJlKaDPydFIXIwOO
         MRfaDqtpBnISU9H51Tz3pJhDM6+S0KkqEPhD43712EID/BkCkSH6vy4Ly3/z9G946zDu
         CGIKMtdniQ45BHhaetiiRtwoiptFwxPPBBgcqYA2ZILsr3ge2idl69xG1JPHIsBadEPF
         gCKg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778344755; x=1778949555; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OjvQAKtsddCwvtPj5IUL1zdvC6FgIzquAG4/cEYySIc=;
        b=BuKXs/SZLet2wDIga21OKKVX2lOxUd6E/3SnsRPvNy7OSPALiq/fe0twejXJnb0Ezy
         ux/pCCmBOvrvoG2fOKcsFRhy5RPg2lmeGThK4FuqCGON0z5TPW+OgL4eGg6iJf1Y/SQ8
         6PFErd55xOtXgdk1YWLfJKGMz+6xwJpD4l/UU9M+rbmeu1I1ZnaZsqHQM3QUC9Y754cI
         iz1+aZWS6hZOpr7pKZJak+UIIu1p2aUPpwhT/kbfrcy0y8MF/e3sOXAMhtNVjr9O/dhZ
         dzQq+PQozbb/NtZqyMSMRuucqcNNp5qw7qEsbXPI0etwBdvjDcoiVGSekpuyWqcnV439
         AHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778344755; x=1778949555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OjvQAKtsddCwvtPj5IUL1zdvC6FgIzquAG4/cEYySIc=;
        b=EPVibtXzsElgZpjeO8/P+jKRb11nFelQJMWk/NEi+ZTbxedNQ/sJu9+r73N4b70xMT
         qeeeEYVWy5HoAlBNa9jg2qbCBJoGawnt9eb4hbtjGRHLLXWGq9fUEL7VNOlc5EwtWdL6
         0W+H5PA+VG9CWT8gHk/mpAESEYOOOK0YqP6PvZhLFEONulQBapiX9Ce77gvq+h8L2gs8
         SrcK+JXLsmf3PF2d1pEocX9EhGy2vTzsC/SF/zMTCqCXQpoXMfVBNm+zJ9QzOJxd0gki
         I8goXFswVkcW5HOJ04+jcfmmJwHywS3VIDylRx7mWsWQjY8uxraKBr3OPc9DufwM0vm3
         6aOQ==
X-Gm-Message-State: AOJu0Yx0c2lX5ljvk02VAd8YbgSTN9yWmuAjM1gMHLPdRvja4LmS5GEx
	2W6FWaj7VOEjsvdbNLe23+McStOm33qtogHdczkRW/QWQMlebxH+U7mg1xKIsjI2UJuYrTLsVbi
	IhElyWfCgHBloDAy2gKqVTCIrl7lJuJ0=
X-Gm-Gg: Acq92OHSEgxcdE9XEJaGv4fXy3F3sJ6mFttp+zEKuoaJs1pM+Aivky24zutm8+hV7Nz
	udkEX71lDnVZEIYmchI3dkBNZsV96nERUP28KPQrQvsDNDgejmlA7NGBfFR4cpj9WRpi+a770LI
	gDMyr1xa702xvFLV7Cw5pDlPw11SK/jWZFesSvQPs5aa7PJqoVLJYQc9yjqXbPgX9nVMj1AqLSh
	gDUObMKfFq+MdnkxsCM8kWFDzD8eevmWL8UyAMjB7zSwfk+mPnW2jILc5g3RTuH/mp7pKYBblEC
	nRSS60OsepnIu+zeJU0yygkAMZ2OQ1noAYmdgJV8O/+6p3bV/iaL5uzEF7gP6Y4zsd+z951YNQP
	ftUR0nzpRn+ANow==
X-Received: by 2002:a05:6214:310c:b0:8bd:de6d:c344 with SMTP id
 6a1803df08f44-8bdde6dc669mr190711176d6.20.1778344755322; Sat, 09 May 2026
 09:39:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260509012247.14990-1-enelsonmoore@gmail.com> <21e1eeaf-5c8c-488e-89a5-123fc2cc7b1d@bitmer.com>
In-Reply-To: <21e1eeaf-5c8c-488e-89a5-123fc2cc7b1d@bitmer.com>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Sat, 9 May 2026 09:39:03 -0700
X-Gm-Features: AVHnY4KwbterUhlugcW_6pZ2ileRIcVWTQ4UTQB6XTT_Ceh7o1QHPSSaCQg7jZ0
Message-ID: <CADkSEUiMKAQkRKek1fRpb=RtC99AzZm25emGbC75RzQYDct-1g@mail.gmail.com>
Subject: Re: [PATCH] sound: soc: ti: rx51: remove stale reference to machine_is_nokia_rx51()
To: Jarkko Nikula <jarkko.nikula@bitmer.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-omap@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
	Peter Ujfalusi <peter.ujfalusi@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_093916_840242_1DF9C92E 
X-CRM114-Status: GOOD (  13.88  )
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

Hi, Jarkko,

On Sat, May 9, 2026 at 6:07=E2=80=AFAM Jarkko Nikula <jarkko.nikula@bitmer.=
com> wrote:
> Not fully true since machine_is_nokia_rx51() still returns true on RX51
> (N900) and driver loads successfully both before and after your patch.

Thank you for testing the patch and pointing this out. I didn't know
the kernel still considered the machine ID passed by the bootloader
when booting with FDT.

> But true you may remove this test so please update the commit log and
> you may add my tested by tag:
>
> Tested-by: Jarkko Nikula <jarkko.nikula@bitmer.com>

Okay. I'll resend the patch with your tag and a fixed commit message
after the 24-hour deadline.

Ethan

