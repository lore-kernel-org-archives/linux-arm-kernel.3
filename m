Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC5DC8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gBzvIT3GFkBSLfKgD0eHJCY11TPcf6eJ4FO6sX8esZI=; b=28/qn/N+YhLgJhXoz3Tas4qCl/
	OO+AC+7ExmuVjYvcoZr6Y6lupOVbtAY+iV2MyT/rutE9w1HkGTlxNUzG0TrkO5ASyYk80sobwJ6vB
	QxQoCeI7yg2SRW3U5VPV2kvpotV9+OIp8pnl4w+oQjqeNGkA8Z2dZBdg4TofNTOj9Avjqkay87BIa
	beVZcoVdo0dtKwfJoyfbGu2p2cr2guhbNTiu5rRZ+NSCLbzoLaf5o5lwJgMJ+L0QUlM6y9lsvBt86
	fjfJAaNMGrM3oAe+h151vcxvyovsYrOoq+W24yC8n5XIAN9rs0WxXtDSVLUgZerRkklcpK5TUfDtq
	hYxmSNwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgMT-00000002R2y-1v8k;
	Thu, 28 Aug 2025 17:24:33 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urbU6-00000001TnA-1tfr;
	Thu, 28 Aug 2025 12:12:08 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-324e2c12f43so158500a91.3;
        Thu, 28 Aug 2025 05:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756383125; x=1756987925; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBzvIT3GFkBSLfKgD0eHJCY11TPcf6eJ4FO6sX8esZI=;
        b=LvQ8ZJrjoRWI63H2lsPTzNIqsQlrevxPu8ladX829sYWI2Qc/lBHXUJMBYLoQeJGwb
         TZl9PsS8cxqB+MP7ilqLmtNyVFFFXP0SHtLTOZwWW0PIZvf7Y1DLuGZqEOBP0QQ8KbUl
         8b5/MHZourJ8f87v1PPQ8C9cFMMehvTmdKzrYb1AJf5f99xQo5NQD/5YZZ8poHMEW0hv
         O54oo/BJoH0JVaHh/4lEbg5aiUh1djCMwXk5uOU/V0sKXJ6Zm8fGuH3epQCF3wuY935+
         qAKZrKr3nMbgYSYeR64yMVROQ8AzKc07afJF6GEhOeJeNdYLSzbJDc12mJe2iKKtpx1d
         NYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756383125; x=1756987925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBzvIT3GFkBSLfKgD0eHJCY11TPcf6eJ4FO6sX8esZI=;
        b=nehtUEiB5xRv7hktgVyOz0c/fus+1dbvLT0vHmyyVM7ei1kXqS9KrA03pvAcKWLB08
         j0y5gE5dFUuqtWGbZFY587xrcbNTGjV/MZ0HBhaZFfmJOeHB/grkOYcBdZwFs3EHYMLO
         rsnm7l0ppQwCrJcNykOxf4u6DihEAUPeJ3DWE/EYlrV6XP8h9TvS80B+RtQsxsxMg2G7
         9ai+ssYwFQNd5HU1pCUm2QooyvQ975dbydYw3ddhTruaHowvqHjqqOpxd83SjCnCOo4v
         K8ePajy67qnwo6mnWWZVk9iwfDeY1c6HEWiGHNuhvIb+cMQW3IarJsKmObpuQiMKNSl2
         mXHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSAWQP3YdR2GvjQUZrWHiPq61GjsciPVLN3i2BhaXYn/sT6YWWkiPtdKNPwikBZSwvPtLhMzDoJ5xp2m0=@lists.infradead.org, AJvYcCXd8ooBP1FkKRr0daoPMUWsXM8wtvo9/0AT8ElKAG+K+W9YAMJDDoHc0QuiL1/WFx7ElA4nEIOCKoAGo8vufgOg@lists.infradead.org
X-Gm-Message-State: AOJu0YxbZJxgKkseUkmgMTkrPIeCxhFfUfG3JrVj5LlxCIg+DDbuJS0I
	A7MiVkcDO3kAK49rCYFlk+fniqAO175Hw+kOXr3fttyy5p7zprHC2aPAlp5Z1jHb24L9hKV7f+b
	mSvVCV4nx/yg9YnEmm5r0G0N7JqhEjhI=
X-Gm-Gg: ASbGncvRmazznZzYXIYAW0Drg/bEK/fiAg+//DqEB+vCNbmgMrlXzK8d9YEcdpVqMjB
	B/hOiX3PwiNXAPP6YBFhjXQ9OvgFwbGWy2rrRRg/upRk+l5Ideh1JxXc5LaF5Lt6hErWCNpZ6uR
	mdokwvvZB3IgqKQKBHyaRuchyZvr+C+3cLSlWugAZYfONAo5r5dj0o14fQ4lWoDCCIUUMobjwZx
	v0b9kqxIFq6w+4qhxJY2Pxte/jVXtt+OxEneENe4JGkVDZ8VXkeGGu2EuW0D4CltJAcnrrGr0Ai
	t7vlYzlLaqlbMm17pEyoYwVu/EiPdL69vgCCUMVOEAz8iXY=
X-Google-Smtp-Source: AGHT+IEHY3yqO9UJS3OJVe1SDsi7P25l1Vl9fz/i5xssn5nzwTw3KmrO7fDBd0I6tpqkx5s1cY/itDMI0psIb4lzmPQ=
X-Received: by 2002:a17:90b:1d03:b0:327:c9bb:be51 with SMTP id
 98e67ed59e1d1-327c9bbbf98mr469357a91.1.1756383125171; Thu, 28 Aug 2025
 05:12:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250825141316.work.967-kees@kernel.org> <20250825142603.1907143-5-kees@kernel.org>
 <CANiq72kc7Ky6+7Ny7jR04s8vU-g23qBQC0rQrOZDxDzXT+m1TQ@mail.gmail.com>
 <202508250834.E2456B9@keescook> <CANiq72mQsLqhpX29NP3Zm8HZ5m429tSXjgFcRYJM3e=Zac1G1w@mail.gmail.com>
 <9CCDBE93-7DBD-41D0-B9B6-05900F2AB1EE@outflux.net> <20250827013444.GA2859318@ax162>
 <56c2b1ce-00a4-403c-9927-79bfd9a23574@infradead.org> <20250827193815.GA2293657@ax162>
In-Reply-To: <20250827193815.GA2293657@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 28 Aug 2025 14:11:51 +0200
X-Gm-Features: Ac12FXyJC97cqOYkicibM9SLfUWzcvxlb3Xn6gpRe98j59S9iV5Oq9n8aEdlnuk
Message-ID: <CANiq72nX7d3XQtQKDdeUh2RFy5HqSg360m4pzesJyBP+y9K7FA@mail.gmail.com>
Subject: Re: [PATCH 5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
To: Nathan Chancellor <nathan@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Kees Cook <kees@outflux.net>, Kees Cook <kees@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, 
	Puranjay Mohan <puranjay@kernel.org>, David Woodhouse <dwmw2@infradead.org>, 
	Jonathan Corbet <corbet@lwn.net>, x86@kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_051206_491104_23B1E866 
X-CRM114-Status: GOOD (  15.95  )
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

On Wed, Aug 27, 2025 at 9:38=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> I am not sure I understand what you mean here. With the series as it is
> or Kees's suggested fix, oldconfig still prompts the user to enable
> CONFIG_CFI with CONFIG_CFI_CLANG=3Dy in the old configuration. Both Migue=
l
> and I allude to that being fine but it would be really nice if users
> with CONFIG_CFI_CLANG=3Dy were automatically transitioned to CONFIG_CFI=
=3Dy
> without any action on their part. That seems to be in line with how
> Linus feels even as recently as this past merge window:
>
> https://lore.kernel.org/CAHk-=3DwgO0Rx2LcYT4f75Xs46orbJ4JxO2jbAFQnVKDYAjV=
5HeQ@mail.gmail.com/

Yeah, I think for pure renames one we should try to avoid churn if possible=
.

> Another idea I had to avoid this is introducing CONFIG_CFI_GCC as a user
> selectable symbol and making CONFIG_CFI the hidden symbol that both
> compiler symbols select. After a couple of releases (or maybe the next
> LTS), both CONFIG_CFI_CLANG and CONFIG_CFI_GCC could be eliminated with
> CONFIG_CFI becoming user selectable, which would keep things working
> since CONFIG_CFI=3Dy will be present in the previous configuration.

If we are OK with something like this (i.e. waiting a few releases),
then isn't it simpler the `def_bool` approach I mentioned? i.e. it
means one less symbol and one less rename later, right?

Cheers,
Miguel

