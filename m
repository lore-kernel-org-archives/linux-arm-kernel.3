Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6549D59F75
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 22:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ILai9bLOUx0Z2Eqc+N+CRl1kc/d4p0whz90+c+6dUNc=; b=LkF9XjN+neNvAugJDOF4TXAB/R
	q+Sd2JTx+5If0dEpKyiQpkGq3u356eTR5/ydlM5GcfijFY9rOwKU4LcORa/4f3casHf/pwWT0vwr6
	/n4+IB+Ovoc5ifQ2ZBMyLxVwcqiGHY2E01VIVYiQ3JY2g27jSwZ+bYpx/RvLdkYIV8TwGBukxpdqc
	6R/RllrTr01rXT18ouSDvjXFKtsDJsmMg+qSqhrOS2x38JbRLtlGezGEfcarzi8aVil3NJo14HoQU
	eAJg+60Jwq6sWk+O6qGLjKB4eYuEYEr2WoJoNe1JhqzagVVcuNVxI3lztlEaNytSGs0dr5y1gFqYM
	D8SRW1BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8oJs-00000004tWw-0ZAw;
	Wed, 06 Nov 2024 22:16:08 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8oHY-00000004suP-0eUD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 22:13:45 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5c934b2c991so7274a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 14:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730931221; x=1731536021; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ILai9bLOUx0Z2Eqc+N+CRl1kc/d4p0whz90+c+6dUNc=;
        b=TSoq4e7TFs/3+McAFiPoXVUzw/Y6OzbGuAET6RpJgJDn/YZHAgcgZZuKKrMmYe7wrg
         1T6lBmumJOnIK4kizI3TL/apD7XQV9dl4NH6nfLKTH04umvJFKiDztwEtNlQeCqaLQpP
         iK3vaXuQ2LNG8VUxDmh73SbEKiEMhswl42mYZVLox+kGjKciqSVwNHKx/gguR/U2xWib
         x8auCRM7187WnT9fmVWhvushBR9oTgZ8M3LwAwT6rXKJWiKdwqpU1wFwBf+x2F7VXdIb
         e8A373Ls8abMWsLr9Ay8+alV4xbc+5fS1J1ndIsms2k3QsMBGhDLcNPhOJ+BdUtSYXDU
         IrMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730931221; x=1731536021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ILai9bLOUx0Z2Eqc+N+CRl1kc/d4p0whz90+c+6dUNc=;
        b=K1O46rctuN4ZxMJOYB5A+2C4FROYMLRfdIM8Z/vkOAIVT41baMQEO51DP+hzWysZRl
         nICSsYxc4jLrj6i+fGwrETPtWYR/bOELEq0gBaM89aa+bpmyJvXmJx7U9i0z3nJg4soy
         W6DC9iCOgJ9mgIBHWcfZO0buYmcMmTllpVtuWALvj6Ys6UWgy26nCBlaTDDBwRwewQes
         HbAx4TYVNfPRd/HXiwnin6TUMLuyt3wZPD6dRy/MIBeLVdmefAuFF+oTiIb/ckdZvOpN
         JBI7NdP+FGA/YUGdWMTzFvoD6DAh2m9JQso0gk4N6lVL/fy2tmTBpoM38ki+3GFI8hEo
         t/VA==
X-Gm-Message-State: AOJu0Yz6WuVqHhNYnuIEyAPJxFbOTlfhSHke/JJOOgzuGyP2stEh20nY
	vGqTsC+gK51E9agP95QfZ5FwgUmdA4IGYoIQTxaG3yb0UdIt5JxZMtRftZeNqCeNvPnQxac5lTG
	Wn7Q+MKdQnMV8BrfskcHrxFktd54qHUWTXPg2
X-Gm-Gg: ASbGnct6dgqqSDYNjc5vpMOC9VMrLjh0mrCr+nY+zNPD4vcVBE2Do0Ig1xgK2F+Cnj7
	VJC+GKr0BDjyBW2Etpwegeu47WLTL1MWnUGMAHMKPJF7oE6xxKoqYoxGV2Gk=
X-Google-Smtp-Source: AGHT+IGHpCshlFNg2yBXekMszUfYyPONoY0Z5soa/+V5wSVkPSv2nrTWlMmJoR7+edgW2cwuDYLsGWwS+ganjsQ4/2g=
X-Received: by 2002:a05:6402:206c:b0:5c8:a0b1:9c4 with SMTP id
 4fb4d7f45d1cf-5cefbcb8e25mr209547a12.6.1730931220726; Wed, 06 Nov 2024
 14:13:40 -0800 (PST)
MIME-Version: 1.0
References: <20241106185513.3096442-5-ardb+git@google.com> <20241106185513.3096442-6-ardb+git@google.com>
In-Reply-To: <20241106185513.3096442-6-ardb+git@google.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 6 Nov 2024 22:13:02 +0000
Message-ID: <CABCJKudxN=5Op96567rti9fYZXHWVLoWzGA8rJr8Y=t+8X9TNg@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64/scs: Fix handling of DWARF augmentation data in
 CIE/FDE frames
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, 
	will@kernel.org, mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, 
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_141344_406884_CFF410CC 
X-CRM114-Status: UNSURE (   9.95  )
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

On Wed, Nov 6, 2024 at 6:55=E2=80=AFPM Ard Biesheuvel <ardb+git@google.com>=
 wrote:
>
> Also introduce some error codes to specify why the patching failed, and
> log it to the kernel console on failure when this happens when loading a
> module. (Doing so for vmlinux is infeasible, as the patching is done
> extremely early in the boot.)

It's a bit unfortunate that we might fail quietly for vmlinux. Could
we store scs_patch() return value somewhere and print out a warning in
dynamic_scs_init() if something went wrong, for example?

Sami

