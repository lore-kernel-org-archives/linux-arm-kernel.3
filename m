Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 483A5C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 15:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=REEy6b10z80FpJq+c7VBu9J7y5yUHNB3/QON7VBOWJo=; b=XTB+f/vSW3hGYHOrY0XM1Jukhs
	h+ridNZ0wYSyjOCJIfqAD3NFB19kyT4WiQCoc2N4OEiKa7M1WjMcqNNI7Q76+VRDuGNaytBsbz9hQ
	GSJ50mkDC4bxLmKc905HQXURlkptQoRCNQg9A/K+sWLPf138g2fLTyMjxGdgoFzp/w/kE4rsjol7v
	DcCWaWocatClfs81frxrlp52G1tRa+pfz3DpC4sCq4ZWas+TB5ChNa8rwPqycPtuVqBKSHUn/R2vg
	KPOfInzCFh8WFA1AAjJJlp5AMb1nN8HCCMQXqb2oGcrmffjRlqzGxc8AOWaw+GM/jQ4M6loCGYhzN
	Eb1NXyXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Pyj-00000006hnA-0Slb;
	Mon, 28 Apr 2025 15:01:05 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9PkO-00000006fy5-0h5I
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 14:46:17 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-549b116321aso5977972e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 07:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745851573; x=1746456373; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=REEy6b10z80FpJq+c7VBu9J7y5yUHNB3/QON7VBOWJo=;
        b=ENsaO9nx2yMdvLV91SmPYdqDb6tikBQ76x3R7YWPlvQKBSzZss+vPIv83QSKs8f1NO
         pyo96yar6GcYgGxAZH7HqEQRhKPBRiz60f8QXEm7p7pMlDt5RT1J8POrk+5cmHf09Ut9
         nKYwrmBVnPGAHsVZhW7zOq7rSHz1XrTIOAyQcI2K0APf6P9sQP5h4XwgvUVKdcoVvJ81
         9I4crdhsCJNgYUTZIyDshXxgoV6GEqnJ+04njwaqJJ4GtodXu/NbLmVXqhOWrjW1dFmH
         6xQL4cyj1G+bDoi0GQJEPaJ1NwjnQkgfRitJdS4gMaczWP+P2kccoT8SbtJTgVgb2Lok
         YDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745851573; x=1746456373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=REEy6b10z80FpJq+c7VBu9J7y5yUHNB3/QON7VBOWJo=;
        b=HVB9mGsgL7bNmvu4rmy3W66eShUdhKUkji6cGHzq9izIIrtfNgyQ9nSdcVmM6/mrAF
         qneaIXIgTa+B1McAHOpzUPAB7Njz4sS8kPFDrlDSPYjIyrqgZO0j0A+QgBzyv8idl6mr
         1enOImttbi5oDmQsb38R+HrFGLBlpc3KH1fqlWWeoJ8g503roPUmYRmMPPzgSWBhz8de
         XWuGI0IrhkWPGyQakHNuY81hM6yAJv4oMo0NlVcS5sARXEhEEb3M/x0XomehIqHm3teA
         F9bk58x41UwTRXPWPFSjmFfcngGKtWyrcWHisxp7DbZKImOVQ7D53OAysFLGNZA7U377
         64dg==
X-Forwarded-Encrypted: i=1; AJvYcCUjUJ3iCD8Cexbidpvtf2zuSbWTe1qsiAPPrqhdnjhqXiN05Ai5i0ARVyXe9x++rc2qs1MeqLCtqXRlotp2ATpt@lists.infradead.org
X-Gm-Message-State: AOJu0Ywn+HJ40VmlJ5GGVNjLKskaqsa5cg53kWnD8FY0l7gNc8JNNovD
	qHY0TlGXkIa3XgFrXjJaLkjvi6GQVAGWwMkwacIGfhn2OtuwJUWeSd/eFt7fnznpb9Q8ApfNsgb
	kxa5bvnRfPuzn4qu9qEitOJ9DXFDy3G9a73gwEQ==
X-Gm-Gg: ASbGncsoYr37WWYNN5NpXVBnH0Spi79RtdzhZgapDRMyI3c47PRVuXHqDYopUX+nZm3
	NgEBKwacSinbasUjwOnGJT2upgHAhNKbtW53j5I+7G4uqW+cQdY+3+iyOzA7rOA9Or4blaPveMH
	cwSWemWBb8h7MNLZ98QtCe0g==
X-Google-Smtp-Source: AGHT+IFWNrvY2zhmFhQG3VtbUYY9jXh+oGkUXjhJfnL+1hK9N6b7ww8hmsko5k28gYHwQ3NKVlNFSCIpmpyiGZa1dOI=
X-Received: by 2002:a05:6512:b27:b0:545:1db5:f224 with SMTP id
 2adb3069b0e04-54e8ffbe01bmr2371285e87.11.1745851572916; Mon, 28 Apr 2025
 07:46:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250213130007.1418890-2-ruanjinjie@huawei.com> <20250320142612.396250-1-linus.walleij@linaro.org>
In-Reply-To: <20250320142612.396250-1-linus.walleij@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 28 Apr 2025 16:46:02 +0200
X-Gm-Features: ATxdqUGsQaqXShJ-EtsBmv3W1CufmpuxHhPZaYdywlnyB64XCFXLSvzLTFyW4v0
Message-ID: <CACRpkdZKaUtnv0HfTci1-_WekNkmJyNA3znx7cUgJW5NNDAYVg@mail.gmail.com>
Subject: Re: [PATCH -next v6 1/8] entry: Split generic entry into generic
 exception and syscall entry
To: tglx@linutronix.de
Cc: ruanjinjie@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	oleg@redhat.com, sstabellini@kernel.org, peterz@infradead.org, 
	luto@kernel.org, linux-kernel@vger.kernel.org, arnd@arndb.de, 
	paulmck@kernel.org, mingo@redhat.com, dietmar.eggemann@arm.com, 
	linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, 
	joey.gouly@arm.com, kevin.brodsky@arm.com, dave.martin@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_074616_210904_E747A48A 
X-CRM114-Status: GOOD (  17.53  )
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

Hi Thomas,

On Thu, Mar 20, 2025 at 3:26=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:

> > Currently CONFIG_GENERIC_ENTRY enables both the generic exception
> > entry logic and the generic syscall entry logic, which are otherwise
> > loosely coupled.
> >
> > Introduce separate config options for these so that archtiectures can
> > select the two independently. This will make it easier for
> > architectures to migrate to generic entry code.
> >
> > Suggested-by: Mark Rutland <mark.rutland@arm.com>
> > Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>
> If the generic entry maintainer (hi Thomas) thinks this patch is
> OK it would be nice to have it applied because it will also make
> the ARM32 transition to generic entry easier as we can work on
> exception and syscall entry each in isolation.
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Do you think this patch is something you could queue on some
tip branch for v6.16?

I don't know if either arm64 or arm32 is going anywhere with
generic entry for v6.16, but having this in-tree makes it easier
to split the task going forward. We can always pull it into some
branch or just wait for v6.16-rc1 to get this patch under our
patch stacks.

Yours,
Linus Walleij

