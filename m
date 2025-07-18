Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 033A8C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 22:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hDZ6HnS0PAr5DvEoQkLOyUrwIZTop7EVRhZ5TEimINQ=; b=RRkk10TNvV1Nfg1dsWjoJgHRvc
	4t5t1yCxH4ZzWPvIwJcrZPxu14rp8noxlmScfTgSfazPl8LcdECS9Yn+8Q7Jj8i2jCWPh82ESkMAS
	MYONpyysOLJf4TS2Hji0jOG6+h8gT3TG5IhPlybnF2YjJ7Pq7mO5a8KkGBjK1LbESPCUSoEG8rNHy
	Z74BeK17qV0AVMAGKFIVgyV2WUzPX7awUyZ6U++3K/eKqNjuWZIYQJ0QY/048/AZHVZNZSBt+ZntY
	x9zsrQUexuHB+wxL1cJPnvfuHF7kg7EvUl5eGFTSs9VgYAZjRZciHMERlPZtMwPQINu0rDp9d49Lw
	Af556g9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uctcL-0000000DY4g-3P5l;
	Fri, 18 Jul 2025 22:31:49 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uctYc-0000000DXsx-3Mfx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 22:27:59 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-235e389599fso65615ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 15:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752877677; x=1753482477; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDZ6HnS0PAr5DvEoQkLOyUrwIZTop7EVRhZ5TEimINQ=;
        b=MOoDk0U2fLIvLUkGfl9omRHQ9dib5n5fzMPLx2p7qa4it1xyNWZFveHVTn3EpjSMlR
         iGkHF/XPNd00YjdQwYNDg1mYkYR1dtBdh7d7QG+dy3i3Ee+s+xGmUHWHsnwv0+DqKvkt
         cqP1/exdW0A3D2RcidyN28mBO1aX4jqfp7rIHAVIwbp6z/j9tFRIm/gcOpRM+BrO+KnR
         qAYdoyhI6YUAh7Lf0DZ8SlubXE19Gnw6Dj6AX/224lnwvclZquXR2WesKXso0S72K0eY
         2qyviwg+lb9++aZufL/3f2d0878u/jQo/ZgPs4T48Rn/h73ODVQ5zrA/FSF4xwehsS+2
         HmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752877677; x=1753482477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hDZ6HnS0PAr5DvEoQkLOyUrwIZTop7EVRhZ5TEimINQ=;
        b=S5muFzFg9YCCtoy2+117EnzBP7/VbEtoTDYc7OzGRZQcpYsJhtYYFcwysashMMVkGM
         BPLOPtmYanww0OSlNDXD+9Do4Zi7o385AXIo0UIC03CxaNf2ZX8E0sukSBZ9njiqknvz
         6XUawHwmUga0Emu3wO8zxJr+GRKs+UmL54SMy0sg2C2GPnqKkO5QiDwke9uvmOFIG8St
         9HScnTd8Yc5EqXR7thgW2iQxeJoXCDOYtqLSfWN6ihq+lEeIW2VGve03cxuPhBrZmJ9E
         nNOkJKOPELgeaHmxTTiJCGFUUhKLnEyHFqUY+o8N6Vpz1ziTYXrRsS2J4EeGUWaRb9JA
         UDMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxUMk24MELF4O1i1KSmxdt4uq+6hx5UCzjkGMPyN3lpyJ/MKEWK+MsFE1sMic/4u0lfWv5ri3bmmCSV+JNJZ4Y@lists.infradead.org
X-Gm-Message-State: AOJu0YxrFDZIZQgLnzemmaQY6TghRMXPzgI14jUCJzFicDUzuGUHSgVG
	/34dH94GZMiaHMx0evDlfQtDZ6v3jrUMqMa4RmtUucsMMJum7RBWEnKoao6UETGX/3axcHNR8fT
	vXt9pDdILpqzIump1rPPsirYY4/ECzGMo1+tbrkf8
X-Gm-Gg: ASbGncvGYwJvD0I2jZOnzUz8iQiCS3+e0jcM6tI6mI70r+QKgLVkB8W/IjsvUaADhmv
	Ee/aB9IL6JJzhduPWD4axIry/j8zZplfMHn9v5TVBvwPuBpuWVlBty9uweQs2Hee2ju8/Nvy+Vv
	aL2pocQLj45TA0uYPiYoLjFj7C+zCK1WR11AFcXXqebCTj4hT0Lfi7JMjsKl5N8mHWZdzcqTLKy
	RpFdVyGdUJhfqU=
X-Google-Smtp-Source: AGHT+IG7V9XjEMPYRN0HZe1rxyqCjCUOSBNIjCe8hXo8zZDBXQhRHlxGGxTka1A4GvYQ9cx7K/41qHmPAAiVlpIGtM0=
X-Received: by 2002:a17:902:db0d:b0:234:bca7:2934 with SMTP id
 d9443c01a7336-23f71cf787emr1175965ad.6.1752877676690; Fri, 18 Jul 2025
 15:27:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250715225733.3921432-5-samitolvanen@google.com>
 <20250715225733.3921432-7-samitolvanen@google.com> <aHoyjx1xJJVP6Khz@willie-the-truck>
In-Reply-To: <aHoyjx1xJJVP6Khz@willie-the-truck>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 18 Jul 2025 15:27:19 -0700
X-Gm-Features: Ac12FXwwKL0Jg-_s27NPdE4p_SLAtT8QzoI6ZXv0ypXTyBz9FtBzpH3HXpHdavE
Message-ID: <CABCJKueFYAbLNQCZLxZx9rdi_F+Dif45=5afw3uwBd8VaZuxpQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v10 2/3] cfi: Move BPF CFI types and helpers to
 generic code
To: Will Deacon <will@kernel.org>
Cc: bpf@vger.kernel.org, Puranjay Mohan <puranjay@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Maxwell Bland <mbland@motorola.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_152758_843451_120DC13F 
X-CRM114-Status: GOOD (  13.32  )
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

On Fri, Jul 18, 2025 at 4:40=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Tue, Jul 15, 2025 at 10:57:36PM +0000, Sami Tolvanen wrote:
> >
> > +u32 __weak cfi_get_func_hash(void *func)
> > +{
> > +     u32 hash;
> > +
> > +     if (get_kernel_nofault(hash, func - cfi_get_offset()))
> > +             return 0;
> > +
> > +     return hash;
> > +}
>
> Do you really need the '__weak' function definition here, or could you
> use an '#ifndef cfi_get_func_hash' guard, a bit like you're doing for
> cfi_get_offset()?

Good point, it's not really necessary. I'll move this behind a guard instea=
d.

Sami

