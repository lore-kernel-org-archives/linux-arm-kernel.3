Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE66CCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 08:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9FriGNAMQK60A3zi1qw0sJL8xNzp+kQ4bPAmGrninAY=; b=fe+TCDz9rXSKTWiNV6bVtekiOA
	VANURbfrxSke2O8j5mCQczJzhbneNcBB5xNr45bDjXLf4/p64Wopoz0Qd0v9ywB72H2F09wkrpDi2
	yljgr4jLFH5r6E86KVw73U23XMQ5d9fsIPiB18A75JRM4ktYUMeLypBVnTfu5WPiTz9IeujpWP5h+
	SHD8382fUbQ/kjHXkYpCRjdKy4+M1f7t5IhhN0DZqTz8H4Q6hWOrc1xgWrNW9BvBvvIqQcsleYupW
	hWB/+yMok1Y1eVHVYsN0SpZYOjepB48ZwS1Z0hrnI6TJKE7P7s4FC08wsx0yBX3Z1YBEoyVpOuRej
	EFxJv/ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuSGz-00000000Y8R-3bkV;
	Fri, 05 Sep 2025 08:58:21 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuR7v-0000000070L-0PGY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 07:44:56 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-24ca270d700so4339875ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 00:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757058294; x=1757663094; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9FriGNAMQK60A3zi1qw0sJL8xNzp+kQ4bPAmGrninAY=;
        b=UZ74neOtBmKLCuDxNt8azEqUpgrCWjKcOWz4FtOjZJF2u4so9CyflAmkcFURvwtA1K
         WKFPyj2fm/05cKDXZGWQmeQvKfJKTaMGxDJzpL/6Lexg2sZzRZaIHtTWp9gS9BUbyQss
         //2hH3FDRWWTmoTyub+u8D+Y0/SCKuuz5iPMzEW7qBI0VEErmLviYwRqqYJWHccdIyip
         49GdKd+yuyTGVfF7YYKMLwttBIS/no6pL6gTl2wePCBpAQubdCRcSy/cnKWfAtCoQpD4
         O68UTPeA83mQfqb53/+mJ9YY9ArDO1TFzZoTkFE0MAlT5KiSW4NdyFM+3AF8saryPZNO
         QfIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757058294; x=1757663094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9FriGNAMQK60A3zi1qw0sJL8xNzp+kQ4bPAmGrninAY=;
        b=N54Qnp/ez/MNRVWrhybpPLj7I1noLvnTV/Rgp1JTLoicQtjM3RRpqCMTk8jF5Rtvrm
         Jt3t8VFawbDNic0zmRHxnLtrxwqvhUkZ+IUT76GSxL5Yx9NXFf2UlIsmSeIdQObVf3Il
         9un668X6r4ecmYKRZV+5RARepML4vFB530IYVCpdo9sMW5dpvsbnKj4BdaxPikJ7bn1p
         MykyaZgXB0YvLxCxrz7QVQT7POju6199KauO+PJelBy/Xlg5GDRd1tSmuXbeutqntXv9
         iaGkFPYKdu1BGFHH1sviDcaun+cyxPGeysS9Nx9a6IO/8K1yxRdNiOFNSWCXf6ym9AIX
         +jNA==
X-Forwarded-Encrypted: i=1; AJvYcCUKMoObZW8Rk4kAP/lm9XHo3eDrLNhb/54kLRMIx8GyC+Mmjr7iHRFfhw8B0rzmEX+i+qJw1d4G5yCe1c6jmZHH@lists.infradead.org
X-Gm-Message-State: AOJu0YyMAIYEnZDqWWPpTfTc72SEkbN/jitlIeblejLTHt6OdrOw0YNz
	s/iePQRegK/Ntr8G/RZHkpMCs+f/H7CtyFeQY8HsK5hL2JfipUuQJUiEfZU2kPoojPhggTwBXO2
	dqLeZhk/RCMl9A+hlR8ZmfwfTZQWvHBI=
X-Gm-Gg: ASbGncvoRs/Oy8wlIZT2k+V6BsjqF9pMtM4OkX5x1IolWzJJvon9DxJqaWxHlBFkfoW
	o1Xd1/ZswBO33A/f1x13Sgy13ZjTmHsLIA1OFG1B94rxaAASpoMgHzF4WbjOIhxLjz0PmWLO9dw
	aLF8IqIkvYs1pRcnx49FiOIMTUQ+hw30NKXiBqCUo0xQGHe7L41DbHSAEMpbbgnG+yWgPHSFjWN
	gM5JqFhdZPGt4FLDR4QgQnxcNZdPl5N8LUCpjw3HzDn9bvHzjdJESK0bEnDwXPdpEEVcp3ojPLf
	MdTI1JMzHj2+bKeOVgJ9tMPqww==
X-Google-Smtp-Source: AGHT+IGp+cfcPTE7KjWQu/swfr5iYBHHS7MaJe/UBLnqHcZT/xW+eAFQaePAZ9b+NKm2RPENGVUXqKIAn3gIBqf29BI=
X-Received: by 2002:a17:902:d488:b0:24c:b6b6:e54c with SMTP id
 d9443c01a7336-24cb6b6e5f9mr45340275ad.3.1757058293921; Fri, 05 Sep 2025
 00:44:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250904033217.it.414-kees@kernel.org> <20250904070410.GX4067720@noisy.programming.kicks-ass.net>
 <202509040933.06AF02E714@keescook> <20250904200134.GA4067720@noisy.programming.kicks-ass.net>
 <202509041740.1007FFEA@keescook>
In-Reply-To: <202509041740.1007FFEA@keescook>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 5 Sep 2025 09:44:41 +0200
X-Gm-Features: Ac12FXxuAyzV67ABgZG5WJnwUzLnA_eITH6K0nXKAnUgoCmOACBUUDhH7lZTQYk
Message-ID: <CANiq72==vG_L35sQDGF6OFmTf=17qGs0k1NKiD17JYoforR30w@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] kcfi: Prepare for GCC support
To: Kees Cook <kees@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Vegard Nossum <vegard.nossum@oracle.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	Randy Dunlap <rdunlap@infradead.org>, David Woodhouse <dwmw2@infradead.org>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Marco Elver <elver@google.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Ramon de C Valle <rcvalle@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Masahiro Yamada <masahiroy@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_004455_137574_1CD9B058 
X-CRM114-Status: GOOD (  12.52  )
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

On Fri, Sep 5, 2025 at 2:42=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> Assuming Nathan (and Vegard? or other folks from the other thread?) are
> okay with the kconfig changes, I'll take it via hardening.

I haven't had time to take a proper look, test it etc., so I didn't
reply, sorry -- but I am following the thread and I am glad if we have
something to easily/properly support this, so thanks for this.

(And sorry for having triggered all this discussion/work -- at least
if we get this done it will have been worth it :)

I will leave a quick message about the commit message.

Cheers,
Miguel

