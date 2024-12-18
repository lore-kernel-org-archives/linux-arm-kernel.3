Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0491E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 17:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BhIbkShSV59R5JCXz2hrDMjgzzBOjFz+Dlxz+KTcoWQ=; b=KvHIqFM1YbnFKy1iUrK92yYe8R
	W1wwI5AXjRWqvbGPAFZRmH5mC/jlez09/vx00Y2KdzX6A9yFALtOehXB+nSfed0L4j6nxQ2P1105k
	uV6iBvvdMRX7ba/OColcXgyZK+bkPrfNM++nlbXUJm4NJF979j1aVkBwOZFoecu2sK18DmrtbWevk
	tI0SZkXtZobc4Y74bBfEreZEqJsrpMpn8EhEXz/SgpLEAs0h2EdfFRfGV3JDIwVEsK8MVdmDH3sij
	Yq4rymPZN74ypLPK1JW5cWMu/4jUP5wFShQUIPcGQWrUJ0WfEyJksRYIE7Q3hypljOnDTyLaKk4eq
	zOk00d3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNy1N-0000000HKy1-3F8K;
	Wed, 18 Dec 2024 17:39:41 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNy0H-0000000HKpk-2IcO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 17:38:34 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-3035046d4bfso36607351fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 09:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734543509; x=1735148309; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BhIbkShSV59R5JCXz2hrDMjgzzBOjFz+Dlxz+KTcoWQ=;
        b=ems8C873EZhyJVglsHI8EWFjeKVw8Yjz0BK4EZL1ebIILVxfMoONaWaNr0nZQFK1jn
         pwCb3FPyemsI9kz9YW4uE2FWQd0N6ATW/QMqX4G0NbdoDV9bKTz6b7Z5NcOzT+g+puVR
         U47IQqhiL1mJp5ecp3SISDHDKG90KMSbeBsNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734543509; x=1735148309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BhIbkShSV59R5JCXz2hrDMjgzzBOjFz+Dlxz+KTcoWQ=;
        b=i+Pm2i+KHt+pWMxYDO7gHj2fG1d+VNi2BZ9NpI5iuwDw3Aq8+BMDdos8LYb4aXzEAz
         uG4M953f71Ww6jwn1Q46s52nFUskr1Z/nnwUidCRQu6q4RLGDp2VKXVMkjJeK4zWClCh
         LZxzkSTLi1HpeD2d8lhH5ShXqZrUKT9xPHsTelJzow7jdPBD+OfnRZkHeFsWcjDnqUiT
         t7+xD69/tiB2vqMSA0jR3JK/2FRJXS982rXIhtCmJA9ls62I1b4OZM4x1U6Km9v7TdP3
         n5ogPthRm/ow8blr6Uu8vcnCOinZgcAcBbP/PSzm+t06B8bvZJi2UI1laYIb50B3QtC+
         8ang==
X-Forwarded-Encrypted: i=1; AJvYcCU1vssjB+8FOTDH3T2KlZcY61Ze687JO7SAe1D8/tFOhqNXK6ih8HVU87UXL5hTnEO78Dn6uTlI+scuy6F+QGYS@lists.infradead.org
X-Gm-Message-State: AOJu0Yzjc+aPVefcS7mOJizisqrCPUyf0JJFQdyEg5gqUc3KFDryubEP
	Su5UiWrAr48222R8qdTPQw8dP1VSj2Zjzbm3FQ/UcecI0vHaiFalSvEv/mJueY1CQpueuJtyFmi
	hKTa2
X-Gm-Gg: ASbGncvGJrpZzTIwl3bFHDjzz4wcEb33laTMarOYxWZOOf/L9Z08UEbJYMdxYdYekDH
	puME7Hi0pXdKb5Zzmu+gApgG10sbxbgkILDCXLII0Pt1edMLzOxj6yrIPDQi+AmHSb/ApLyQx3T
	8pg4nB+bW+1n8K9hb29I+LhJhMSFYHQyHEkkWgwNDlHtBOe6/VlzFHHzxnv7zjdrRioccSneMPT
	nWedri3YiHgpftEnx3QGBcTGulfPVovSXteLAgCMeQq5iMW1aDD4OLNTPXsACvQKsfoU8MBd2pm
	+Z41KS70fg3G+kgh84OL
X-Google-Smtp-Source: AGHT+IEgU5ZiwHZRejuZK5tnnh+6Kz9WZK/WrMjceOJ1NPTxOLEz9JIWd3XCylGqUpe5Zl/rb1ppQQ==
X-Received: by 2002:a05:651c:b24:b0:302:1c90:58f5 with SMTP id 38308e7fff4ca-30457680f07mr2128771fa.1.1734543509485;
        Wed, 18 Dec 2024 09:38:29 -0800 (PST)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30344175b6bsm16425321fa.75.2024.12.18.09.38.27
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 09:38:28 -0800 (PST)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5401e6efffcso7727686e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 09:38:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWLRYqmaD8X19lNzaOoWQJn5YPdCyGgOcz/62feCMCkz+tmzPNu5NkhJ5DEYfykhJWnGRduVMUctHYU9t9LdQVg@lists.infradead.org
X-Received: by 2002:a05:6512:2313:b0:53e:2fdb:4de3 with SMTP id
 2adb3069b0e04-542210256b4mr179533e87.44.1734543507103; Wed, 18 Dec 2024
 09:38:27 -0800 (PST)
MIME-Version: 1.0
References: <20241214005248.198803-1-dianders@chromium.org>
 <20241213165201.v2.1.I2040fa004dafe196243f67ebcc647cbedbb516e6@changeid>
 <CAODwPW_c+Ycu_zhiDOKN-fH2FEWf2pxr+FcugpqEjLX-nVjQrg@mail.gmail.com>
 <CAD=FV=UHBA7zXZEw3K6TRpZEN-ApOkmymhRCOkz7h+yrAkR_Dw@mail.gmail.com>
 <CAODwPW8s4GhWGuZMUbWVNLYw_EVJe=EeMDacy1hxDLmnthwoFg@mail.gmail.com>
 <CAD=FV=X61y+RmbWCiZut_HHVS4jPdv_ZB8F+_Hs0R-1aKHdK4w@mail.gmail.com> <CAODwPW_UNVkyXKxyhZv830bhzsy5idu6GiuR9mut+-qGOtv1pw@mail.gmail.com>
In-Reply-To: <CAODwPW_UNVkyXKxyhZv830bhzsy5idu6GiuR9mut+-qGOtv1pw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 18 Dec 2024 09:38:15 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VtTsUsOmW+SxiUXuUZoXSFYXY4ApzmMm_ZzxWKAvTMBA@mail.gmail.com>
X-Gm-Features: AbW1kvb6h8dQi0-AL6QfO49fCuboqPkZd7iKe9aC5hYSbnNdq3yQxBbEFEWpW7s
Message-ID: <CAD=FV=VtTsUsOmW+SxiUXuUZoXSFYXY4ApzmMm_ZzxWKAvTMBA@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] arm64: errata: Assume that unknown CPUs _are_
 vulnerable to Spectre BHB
To: Julius Werner <jwerner@chromium.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, 
	Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-arm-kernel@lists.infradead.org, 
	Roxana Bradescu <roxabee@google.com>, Trilok Soni <quic_tsoni@quicinc.com>, 
	bjorn.andersson@oss.qualcomm.com, stable@vger.kernel.org, 
	James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_093833_615082_A7BAB462 
X-CRM114-Status: GOOD (  36.20  )
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

On Wed, Dec 18, 2024 at 8:36=E2=80=AFAM Julius Werner <jwerner@chromium.org=
> wrote:
>
> > Given that I'm not going to change the way the existing predicates
> > work, if I move the "fallback" setting `max_bhb_k` to 32 to
> > spectre_bhb_enable_mitigation() then when we set `max_bhb_k` becomes
> > inconsistent between recognized and unrecognized CPUs.
>
> A clean way to fix that could be to change spectre_bhb_loop_affected()
> to just return the K-value (rather than change max_bhb_k directly),
> and then set max_bhb_k to the max() of that return value and the
> existing value when it is called from spectre_bhb_enable_mitigation().
> That way, max_bhb_k would only be updated from
> spectre_bhb_enable_mitigation().

Sure, you could do that. ...but in my patch series I need to add
_another_ static boolean that's updated in is_spectre_bhb_affected()
anyway. I need to add one to the new is_spectre_bhb_safe() function
that you requested. Specifically, the moment I detect any CPU ID
that's not in the "safe" list then I need to note that down. If I
don't do that then later calls to
is_spectre_bhb_affected(SCOPE_SYSTEM) will return the wrong value. So
while all the other "static" caches in is_spectre_bhb_affected() could
be removed because we changed the default return to "true", the one in
is_spectre_bhb_safe() (which causes the function to return "false")
can't be removed.

In any case, the predicates updating the static caches predates my
series and IMO my series doesn't make it worse. If you want to post a
followup series changing how the predicates work and can convince
others that it's worth doing then great, but I don't think it should
block forward progress here.


> > I would also say that having `max_bhb_k` get set in an inconsistent
> > place opens us up for bugs in the future. Even if it works today, I
> > imagine someone could change things in the future such that
> > spectre_bhb_enable_mitigation() reads `max_bhb_k` and essentially
> > caches it (maybe it constructs an instruction based on it). If that
> > happened things could be subtly broken for the "unrecognized CPU" case
> > because the first CPU would "cache" the value without it having been
> > called on all CPUs.
>
> This would likely already be a problem with the current code, since
> spectre_bhb_enable_mitigations() is called one at a time for each CPU
> and the max_bhb_k value is only valid once it has been called on all
> CPUs. If someone tried to just immediately use the value inside the
> function that would just be a bug either way. (Right now this should
> not be a problem because max_bhb_k is only used by
> spectre_bhb_patch_loop_iter() which ends up being called through
> apply_alternatives_all(), which should only run after all those CPU
> errata cpu_enable callbacks have been called.)

Actually, today is_spectre_bhb_affected() is called much earlier I
believe. It's installed (via cpu_errata.c) and called like this:

  is_spectre_bhb_affected+0x124/0x2d8
  update_cpu_capabilities+0xa0/0x158
  setup_boot_cpu_capabilities+0x20/0x40
  setup_boot_cpu_features+0x38/0x50
  smp_prepare_boot_cpu+0x38/0x60
  start_kernel+0x90/0x438

...but then spectre_bhb_enable_mitigations() is called later and by
that time is_spectre_bhb_affected() should have been called for each
of the CPUs:

  spectre_bhb_enable_mitigation+0xbc/0x340
  cpu_enable_non_boot_scope_capabilities+0x74/0xc8
  multi_cpu_stop+0xf0/0x1b8
  cpu_stopper_thread+0xac/0x148
  smpboot_thread_fn+0xb0/0x238

I agree that it doesn't seem to be a problem today, though.

-Doug

