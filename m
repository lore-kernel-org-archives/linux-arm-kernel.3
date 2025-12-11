Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1363D3E78B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 03:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+dZbewwDzBWlvebvoy6iusw7eoZACCSch/+Y0U1qkdQ=; b=Vq3asVLQl21Z3DfZ/dfLXnqoUL
	Hwsq6nbKGg9ICCkwgODkBMsJ9L2KT6Wg5buCIytYiwQev8NwT0LOor7YAuz2e3wyY1VmjkEoNYJ/p
	iZ3cwBKAEviM+BidJJSaoBUQNzk//ARhMmTjK765W/Y8EcHaNGHCPFbAckuJ4WTrGT3bI7HVxSWOB
	4E7P2qq/GKTZ/c+b5vaWKdIx8il4OuxVp5RJ3z92MfcRPz5MANUGT+1w+QeUoqe6Bu9sa2VJdXtO1
	uBGzdy35KOknM67vmb/K5XrHrQVDOjZ3o/jR9yR/JIMcyOOQfFdyFNWhD1rw+Qpr/GROKXdKNX6Zf
	yFvBxolQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTXO2-0000000GAO0-0akk;
	Thu, 11 Dec 2025 03:30:38 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTXNx-0000000GANL-3hcl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 03:30:36 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-3ed151e8fc3so318946fac.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Dec 2025 19:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765423833; x=1766028633; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+dZbewwDzBWlvebvoy6iusw7eoZACCSch/+Y0U1qkdQ=;
        b=EUPB6PW2lu0o/G+KUv49BPgP0xOkY8eN5QkbNm5iBS+GQghWb4A6nHYaOeqJKjwnjW
         T3JMkzwEXJZa+pbqHGWJhYgedzCZx1c7E67Pnp9rx8FriH0h5JU8VDOtLmgt5tm06Mwc
         yguN9LiWkib8+akibaWIwIg7Pervw2HwNzcYRz5VWDZr162/FgKC5+cHIXvbxfCKNUKA
         jK3BKARHRgPIIsuBArskAUhCwUNAO5UASp/gMu45xVI/gQ4OKpRkJpL/eMx/UnloRas/
         WmR9FAFDY3MuEh+6D29mUYFptQiJR+utzORHOxn3RgsVlb03uipr/Zse7Z3Wmoh5HjjI
         wUgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765423833; x=1766028633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+dZbewwDzBWlvebvoy6iusw7eoZACCSch/+Y0U1qkdQ=;
        b=minS0vvHHrjmPvAmmIEts3X6/udobwLlGYFe/bgcU/ahA0SOU+/FwaL+quWawGLpUh
         VBIQAKaKedqKSwvosZxb9SHAT0CpCEBhtJD21r2X2ogEifewGXnsvudY+taXI5W2uJKU
         0sw5oGqZ4c/wD52aHRiRIE2fAkuuMxjxunNWN/GW589kd00suy85GxIquK5kFYQQoStT
         6t+GNekUgtJL92C3q/bDgmsBDRRPbAMzgo/LSOJFUYaZWnIWgLw8qd8JNFWNR/vW97PU
         xBTy8edTcLNlZwKiZHitKn9buihcrcm/pDhkLiccbJX+7evVSr86YHR4Rf2EI1cyy1J0
         l+Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUBZIxviaus6jkNcHEKzqsO9p9SUfofoSu0qmHvhQ8tXTRqzcWaWYSgAwRafQgs0ytY//uRYxyYZqnbxI95U/l6@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0a0pt5l8nTl1jIqRThjxEji1mv940vPRYlS2wU4/35/a8FwWo
	sP4bRvrDy75AacWj8n1FhPDsvzhiNwkTtmYaCKW4P2K1fbwcGF0NNtkOXgvtmmzaoLZt963tmJ3
	dw1eGKNpB/bivt947fCua/G5vA2eyk8S2qg==
X-Gm-Gg: AY/fxX7dGRE5X5H1f6sxhJMCJr71BQ/4uM8hgXvQnQ6pst6pNYe8mC1u9M0tjBQ50z3
	EVSn2uRCwvLppbjiEEPAS4g5kxK7r/7U5idcdbFNobHF+R1n3Niz5rgOjCfrO0BOAsCx5k/6Ni9
	IgV9y7YsRsJZrUmHV5QYyJmsp8HgwKup1/CsCb9r4OWBhX18qxiWxdfnIzREl7RAMyyUIksM0Da
	+rmyBhwrNvr/O3UUhNtjJAVoHpxfe1LDiAz94qp+kdchHYJaUa0r7RMsUieqQhnQtkg67FC
X-Google-Smtp-Source: AGHT+IEgKkI79pLBRP/HF49YoYDIq25ggwSqD2yL98qzcsn3vpnXcPLDyB5+ALaQdK9drKkVbdok0PPpbCudpEJyrwc=
X-Received: by 2002:a05:6870:d299:b0:3ec:3f3e:b61c with SMTP id
 586e51a60fabf-3f5bdcae8fbmr3013014fac.46.1765423832740; Wed, 10 Dec 2025
 19:30:32 -0800 (PST)
MIME-Version: 1.0
References: <CABb+yY0Uvkc4g0=gi79j+CCJzKkeuHGD9u_6P5ScAFkNS0F+2w@mail.gmail.com>
 <20251211112343.51f4ff1c@canb.auug.org.au>
In-Reply-To: <20251211112343.51f4ff1c@canb.auug.org.au>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Wed, 10 Dec 2025 21:30:21 -0600
X-Gm-Features: AQt7F2p7uN3G-M67y5yUKaGUa6azLY2qsgQkahRQNIBhCl4szFfWNPylZvTBAsA
Message-ID: <CABb+yY2PhSgWTpiv+oGVtcX3HidMniUQhb=EeHBEBEbfW3sSow@mail.gmail.com>
Subject: Re: [GIT PULL] Mailbox changes for v6.19
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_193033_923440_1CB274A6 
X-CRM114-Status: GOOD (  10.04  )
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

On Wed, Dec 10, 2025 at 6:23=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi Jassi,
>
> On Wed, 10 Dec 2025 17:31:04 -0600 Jassi Brar <jassisinghbrar@gmail.com> =
wrote:
> >
> >       mailbox: mtk-cmdq: Remove unsued cmdq_get_shift_pa()
>
> This commit causes a build failure.
>
> I am disappointed that none of these commits have been in linux-next
> until today.
>
Sorry, I will take care of that in the future.
Regards,
Jassi

