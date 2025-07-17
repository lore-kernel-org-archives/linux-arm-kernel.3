Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E60BC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 08:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DDF4dAgrnw34VJPjjy2t0SDWi0MqtesXMSOxY10q/fY=; b=hNJv7mj/an22T6eOtV01YUSN1C
	XFkqNzznzCv3+Ok+a++s80CO4nGioOoUdUxjTEMa364HKDNqn++o63njcuYairpxtLVDhpRfIAX6P
	y20NfxuC2iMfuBd8cDBVU6bBSIgqRz2xO098oi9GaTUnrRB6dWw/UYfCGvMU1F8NyZhye9Flh+ezk
	tgzmsUXXGsRYAkZ5o3DjKz4xHCNAw/39b03450zwQ7BumdGHzVSV91M/OXMrBgRutKBdzC3AjFdca
	DAKmo5xhXGaLO/lPm5cbo/Nw8CzxQ3doyS/Mg152+PBAcCSHGDbqfBfU0he1mubvHNRHmi93DSSDY
	YnkvGnpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucK5n-00000009aaO-3wCq;
	Thu, 17 Jul 2025 08:35:51 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucJ3v-00000009RxC-2F8p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 07:29:52 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-312a806f002so116538a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 00:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752737390; x=1753342190; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDF4dAgrnw34VJPjjy2t0SDWi0MqtesXMSOxY10q/fY=;
        b=WCX9gYsQONUg2cZPVix8GA/k40nWDUkk+KfNGAWB3NvGt0lN8QhoJVUvdPDsRT4DdA
         5Lcu/sEboRDHACBz88xu15DrCAbeNBTTzwI4LH5DgrSpgSTMXLduRpAzj+cFFojEwwwF
         VsnftLbgGFjy+qMV++fVg7M9j2LKqPrMeEalDaZud6s84O0nkj+MTT84cVy8QY/20Oiu
         oMkSR/3tKwx+qN0XfDUFql5uE+2Wz/E33v1arqLWceS6j+4YTy26r77zfuCHSbFF4PTj
         XotMsmEbSz0JP/iTOdUyGdCgf+cEdMh6iDql+/lRAw1p565rDuXqYI77jsmVDGmlCAW5
         Viow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752737390; x=1753342190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DDF4dAgrnw34VJPjjy2t0SDWi0MqtesXMSOxY10q/fY=;
        b=OhfM16Q7uyneYEWQg3rIqjqMIyBxNfqeOqs/anyC1Xt/kfes2Hz0q0BiBP+tL3GPuV
         v1qWZv6aAPTXXS61JVQmIffFTkWY1qMIINHuqRSjR+OKAphAn0dd9wOFYFq+OV329Bz3
         RmtlfWZ+uRj/OBYGj1GQcFa2L2q3+ir8I7BUY576wuwea/q1MdsO32fXbLcWviIf6V8a
         NayRAPzGSJY2V6yBQZqcju9XkTrlqZgnaWugd6IaEY+5oYVX9t1GQ5qL4KgmX6cliPVw
         qRft3Y7M+GMcabmzNeqUAbJQ6ziLfHOHaq72dlEs0KREkWJkjhYt7rrN0Ao7Csgx4l1c
         yagA==
X-Forwarded-Encrypted: i=1; AJvYcCWbJ+rZi7EGi2X/upnRDn7BGy2eBZR4hYALYTnxuHVGYBuoCHLBSb3ewLxhbCeRmL09smBdUgt2BKhNE5iDxagV@lists.infradead.org
X-Gm-Message-State: AOJu0Yzlw/NRQ3cEeMtHG3T5N4DkHOxS4sG4ub9IDi84JIrmT6IBzM7V
	2G7+1JEbEnvKBCkY5Ro5egFEqwi3ur1nIXG022dD6t6wPLy6svIHxsYBwrGNl/00MUJv/T2IyYe
	ddGv76+iXJdexfTsujFvCiMbCrt/9URA=
X-Gm-Gg: ASbGncttEjAd6fSpvSicDt26qAbxvSJJv6aliHd6qP1f+ovaut9RUDbAPJ1bN25kd6c
	kf4D15vRYDwg0OY6GpMJxZSVQ1Yy83IJ/u1P27tMtv096lIpwYzHwQY5+CSsdedGPwFIURuT0ga
	zVs/YD5WrktgVeW6nxA6X+tqrJjJlC3ldaA2VzZofH+W1BzvANiMDomcBbQ+qRZcOMJFEvGZn6A
	BHCaEya
X-Google-Smtp-Source: AGHT+IGpKE7Xwql6x+dfghjVcPLc+7GCO0f3s03I9+vINqgrnqS87x+wD8n71frCSyCK+IPmdf7M8h+CCtrDqBIT4wg=
X-Received: by 2002:a17:90b:1348:b0:313:f9fc:7214 with SMTP id
 98e67ed59e1d1-31c9e6ec8c7mr3596901a91.1.1752737390348; Thu, 17 Jul 2025
 00:29:50 -0700 (PDT)
MIME-Version: 1.0
References: <4c459085b9ae42bdbf99b6014952b965@BJMBX01.spreadtrum.com>
 <202507150830.56F8U908028199@SHSPAM01.spreadtrum.com> <c34f4f606eb04c38b64e8f3a658cd051@BJMBX01.spreadtrum.com>
 <CANiq72=v6jkOasLiem7RXe-WUSg9PkNqrZneeMOTi1pzwXuHYg@mail.gmail.com>
 <24e87f60203c443abe7549ce5c0e9e75@BJMBX01.spreadtrum.com> <aHftocnJcLg64c29@google.com>
 <7afa22cbbb85481cbb3fabb09a58bd63@BJMBX01.spreadtrum.com>
In-Reply-To: <7afa22cbbb85481cbb3fabb09a58bd63@BJMBX01.spreadtrum.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 17 Jul 2025 09:29:35 +0200
X-Gm-Features: Ac12FXybXl51xhyGUacxmi5kHiXFRNN_uQ8UNQosRGKU2Urpiu5evh4hcAyLZNM
Message-ID: <CANiq72n3L6JE-pfR=8x0GUU++=8nPLw44oNEV1shdsHqXbts8w@mail.gmail.com>
Subject: Re: Meet compiled kernel binaray abnormal issue while enabling
 generic kasan in kernel 6.12 with some default KBUILD_RUSTFLAGS on
To: =?UTF-8?B?5YiY5rW354eVIChIYWl5YW4gTGl1KQ==?= <haiyan.liu@unisoc.com>
Cc: Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Matthew Maurer <mmaurer@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?B?5ZGo5bmzIChQaW5nIFpob3UvOTAzMik=?= <Ping.Zhou1@unisoc.com>, 
	=?UTF-8?B?5Luj5a2Q5Li6IChaaXdlaSBEYWkp?= <Ziwei.Dai@unisoc.com>, 
	=?UTF-8?B?5p2o5Li95aicIChMaW5hIFlhbmcp?= <lina.yang@unisoc.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, 
	=?UTF-8?B?546L5Y+MIChTaHVhbmcgV2FuZyk=?= <shuang.wang@unisoc.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	"kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <christian@brauner.io>, 
	Suren Baghdasaryan <surenb@google.com>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_002951_575971_68402579 
X-CRM114-Status: UNSURE (   8.83  )
X-CRM114-Notice: Please train this message.
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

On Thu, Jul 17, 2025 at 3:35=E2=80=AFAM =E5=88=98=E6=B5=B7=E7=87=95 (Haiyan=
 Liu) <haiyan.liu@unisoc.com> wrote:
>
> The config file is included in the compressed file kernel_artifacts.tgz w=
hich can get from ' http://artifactory.unisoc.com/ui/native/VERIFY_ANDROID/=
1746740/PAC/sprdroid15_sys_dev_plus_sprdroid15_vnd_dev_plus_sprdlinux6.12_k=
ernel_dev/ums9632_1h10_64only_k612-userdebug-gms/sprdlinux6.12_kernel_dev/u=
ms9632_1h10_64only_k612-userdebug/' . The path is 'kernel_artifacts/ums9632=
_arm64_kernel6.12-userdebug/kernel'.
>
> Can you get it?

If you mean to report upstream, then please post the config as a
simple text attachment here and clarify how to reproduce the issue
with an upstream kernel, as I and others have mentioned since the
first reply.

Cheers,
Miguel

