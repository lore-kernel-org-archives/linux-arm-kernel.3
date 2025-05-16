Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ABE8C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 13:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8EAaXCcBODOqPPRNoOnVtfPFAMjr1gPjPXMHsuSlMuo=; b=etayJcuQ44wW0R1psFTDeGw6vT
	zim04VozWJ3i9lhOr2pZTiR9ptGvk/IybAUJUomKuOVHCK6eb3UavDerbtgNDT4N2MRMtLyhJsVWs
	v9uR8nBhs0fZnG/zCkx+P3mDIFNgWv9z1CEVHnL74f+XVztHa+LX1/xyyiOT3MQ6M06vLSm/H331N
	exMl3GBTW0FoKuB3LvPV/UCWLZ597RTEKBZ2bmJYKO715lz/EG+LlE8GR2KK3+m+QstNKcP1RA1Ax
	a/BVjpdb3e0qjb2wIiw+kAxwGpMCHToq3S9iP8X1UfZfa4ml3U+HnI0TAoZotnxQMxd+D35TKSERn
	QDk0ahlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFujo-00000003Skx-3DNe;
	Fri, 16 May 2025 13:04:32 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFuhm-00000003SXp-10xv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 13:02:27 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-476b4c9faa2so29642561cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 May 2025 06:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747400545; x=1748005345; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8EAaXCcBODOqPPRNoOnVtfPFAMjr1gPjPXMHsuSlMuo=;
        b=LCaRNJYgfNJ6v7/+PNJJooCdMjjbCzSM7akON3QZueYHeKUT64OO1DgKaj8v6R1TL7
         E+df14iXImRbrCnABUisuX7uOPH5EWDMwzOeBo8mRlTnyxWCakHJUuh8xj1d+TsCtPdf
         qTEXzGDZTgAMZ/s2MdGwr1w/0rdxY8/ZN2e1xnYcUWTOwG7JyeOpsfhe9prs0MfKbGIW
         A014408SF1FCXU2eQH1/y7X0+7O6zrrcXoY8PUFNd2Mxyp3bQ7MRyzUPoPaEARlpQVWa
         42rSQYhL5jHFyfUDN9+R9uj2dtALiXyQ6lapt0DTJwROdu4Q2vtCbZi329ERGKXmuS2S
         vK3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747400545; x=1748005345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8EAaXCcBODOqPPRNoOnVtfPFAMjr1gPjPXMHsuSlMuo=;
        b=Rh37PEwR4tLDBHQbqySjnoQUOzw5HXR7rX/NQhD9T7iuYzUebEjRt0dQmCoSiSR/W7
         AG49Aa25ly1SN8KBc6aKMYXpI4rh4oejIMVRNOcTDERQmLZm0FwA5KZEbou66LaDHzi7
         qlyjg/xy1wU23AtoHR3/2q/87rhDmg6lyTkeDtS3lvZxovonifXd51Jq/QhgawLATbT9
         pBFc6GnpJNCzv/BpfFSfvlGipGebJwE2x4kic06tpm8T0qdYLLchVXngrafSbLYE24/L
         oPuGwLHw4q9ilPzYyE3zWLJ2LZpzVPhjrok6r06LbyUrKeDUZF/5ebijxdg7df7Tb0uv
         5G+w==
X-Forwarded-Encrypted: i=1; AJvYcCXStcDeL6qXedWgHcjv8Ez2AcBhJqNNBPn/XhvUOXqvDsLDM9enUxqyxw6A8zgH9aPJx/pIfIhrubdXdSNQ6V5o@lists.infradead.org
X-Gm-Message-State: AOJu0YxnNCVdjrA3toEsPUxuRpSfUoeas0OZOA++uz8g+kwvq2xQL46K
	2JHot+ctRjjd3SDE1w0u2WV/KA0u6yZtn3z6KucncV3onBCTTP4VDYqnwANKRCymk0rTPWckhsK
	UYJijQlyPGWp5AoKy1xUZimyeZxtBf10=
X-Gm-Gg: ASbGncvgIIF/OdjRdLtF+JojYPOIMpUEqEq1F/dLq9FD6kUpTtxSUft34OASGQ2FHRw
	ujyRoODCXQSSlaz6u34omZdXKnKo9Ajjqds4Bn5wnEsG4frQHcEccj6D8JCsBY4csGCx41c6+70
	ITCs7I0JBkhMujcOupXn3nt3ja2tNtgS0jPYoWL39CObw=
X-Google-Smtp-Source: AGHT+IHZyJqid//wCBlVNP3pcnUuvkjajKER+xeFHB1o8i8ij6OKhPHYHUDAmLQb9yNNQCp7v0lXFOO9XZFKzyx4pHM=
X-Received: by 2002:ac8:6f1b:0:b0:48b:5656:bb01 with SMTP id
 d75a77b69052e-494ae352f98mr41415291cf.10.1747400544544; Fri, 16 May 2025
 06:02:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250515-vt8500-timer-updates-v3-4-2197a1b062bd@gmail.com> <202505161430.wdURc0TG-lkp@intel.com>
In-Reply-To: <202505161430.wdURc0TG-lkp@intel.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 16 May 2025 16:02:13 +0300
X-Gm-Features: AX0GCFuUyfeKPyuuQKwLTH_a0JHlANkAjiXIiU8TmkAt1AD4XrUds-vQSs5nQng
Message-ID: <CABjd4YykcZckQFfyuSpMtCJybq2nQuj9TYAP2S7RfivPLYPUnw@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] watchdog: Add support for VIA/WonderMedia SoC
 watchdog functionality
To: kernel test robot <lkp@intel.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_060226_283277_9DD7ED82 
X-CRM114-Status: GOOD (  14.54  )
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

On Fri, May 16, 2025 at 9:56=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Alexey,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on 92a09c47464d040866cf2b4cd052bc60555185fb]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Alexey-Charkov/dt-=
bindings-timer-via-vt8500-timer-Convert-to-YAML/20250516-025729
> base:   92a09c47464d040866cf2b4cd052bc60555185fb
> patch link:    https://lore.kernel.org/r/20250515-vt8500-timer-updates-v3=
-4-2197a1b062bd%40gmail.com
> patch subject: [PATCH v3 4/4] watchdog: Add support for VIA/WonderMedia S=
oC watchdog functionality
> config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20250=
516/202505161430.wdURc0TG-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250516/202505161430.wdURc0TG-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505161430.wdURc0TG-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    drivers/watchdog/vt8500-wdt.c: In function 'vt8500_wdt_probe':
> >> drivers/watchdog/vt8500-wdt.c:98:44: warning: conversion from 'long un=
signed int' to 'unsigned int' changes value from '6148914691236517' to '328=
7081637' [-Woverflow]
>       98 |         drvdata->wdd.max_hw_heartbeat_ms =3D -1UL / (VT8500_TI=
MER_HZ / 1000);

Will change to U32_MAX in the next version.

Best regards,
Alexey

