Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F8AF513F4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 06:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EGovAVgDeech9oAFJyAwU6fo6Sipfg2mUwR4uyiECh8=; b=let5ofK7ne1GhA6ezNPF6yFxHd
	M6h5YwO0PLmlTkOdwxLu5RITBmBkINaKY06f2Owk43mKmw1iXNoU8s/GePcF8sPpuBY4HLSePXwby
	g3a9iQyfARWaCp/ojcQLGuRm26e3Ogx8uSeSPsY7/2Z5yMbts+oJQ/ho6JSmDS/1CWG04ykFHm4QV
	Vtv1+8uu92N16zrPIHYnZh+xIpHlwyXKtSko+Melym3VzmmMKqZ6nXrqjm2uxlfQm0BRMZ3qQgmFB
	LgB2meEWO/zM/igNcLyP0avwpXy7Ym+H7f/orbLR2mD9RRoEprc/3n8qe8hkoRkEMy5DAlEEDzZrN
	5totikuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyOKa-000000034Dk-453V;
	Fri, 06 Mar 2026 06:06:36 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyOKY-000000034DB-3cmf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 06:06:36 +0000
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-5ff9f2e1fbaso1087797137.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 22:06:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772777192; cv=none;
        d=google.com; s=arc-20240605;
        b=CXlzxGzrAQtXjNt8OG66wV+hnD5DLd8bz8iwlGzzxbv7pOV0Xeb7+cQW6bKexifVIS
         o9z6mQq2LB9YCekbVqxbKg60wkyFUl6Ek3DIPSiGWNmbUdAy5sAsFImsJ18he1R5RIry
         y5s3Udy2Vk75Cek2xnIUW5My/t25zGpjADI+Jn4ShWEYOgB58xipjpkQ0VnTcluLyOW9
         E48ZJmZPmUVUiLTeygalwCbWBYxHxbtNCfInT9utffO9SSwwsXLhn+8k/K5W61z2WJUf
         z9dSkJWlKnTTM8gt1Su0W5XKJKKeRMJhvnB/gTI1oo+gcooDtRkUogk3pfq9Wio1p74I
         PbiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EGovAVgDeech9oAFJyAwU6fo6Sipfg2mUwR4uyiECh8=;
        fh=tFGhVXrFQIGySV5j7DLPIiK3qMWGZNLJzVjgA0yNmzU=;
        b=HatoWptrUHl5bGHqWTEuQQhlO03A/HdfGCEI+Fok/wrKCj4SFCQ50dwC1J/eyJ0L4j
         8M+SWN+R0LFW9LJpuGZH4ZQkXaAsU5GTaYuaXvw5bSQSVTOHxa8pIPK9B+N1XFo3ZFCg
         H89e7Uy7XYb1oWnyMrpdZsdLFKXy1BrvQbcYli5thaZkEfSg0LDKSyWJCj8x3bHcfRGU
         xbrwzWwUwXyvsiREqvvmNF6J3fXAnr4xM9I/B86dwz3pAv6BzbGo+Y5osj+QaelqmEAO
         JBatcmkgS4spjUtq/AYlVjXyyYB3eoUv7QUu5t8WIBPbKX487Zl6ZS3w+fbp28ns3Vha
         M8yA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772777192; x=1773381992; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGovAVgDeech9oAFJyAwU6fo6Sipfg2mUwR4uyiECh8=;
        b=HAnDev9XJUtd8OxlPW5rgTTbYmp77LjThrcd9DGEm+jRnPrjdfWT/siDbvQJiLtmBR
         7wwliWp3u9dGftwdtP/Mwa5/iD3tq1oyP8JUEOdLy+DOCZpPQpskesElWfBiW64GELbL
         Pr11SZVdnPiaZ0K3seeIfhxgrCC0gvBpKwpu5RUP9qFwUgYJZy54LEzVhbKGZc+UsMMr
         nDjgs5vOjFUNCf1eORxTO2OgFfnbpv3qiJRXQcw63lz8t0ldXIyYrOhufsGH1cfaSvWk
         ymS7cT2ilQnROvJlOilDyM4Jk7u/J/xrz5yYz0id/C/LW2rb+RaGurWVnmiTUVwv2oBT
         DjqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772777192; x=1773381992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EGovAVgDeech9oAFJyAwU6fo6Sipfg2mUwR4uyiECh8=;
        b=jPzDpuXXXohlSxwX7m759JpqFjeCh5z6C4inAd9NrsUGHTUCTR3Xna2s1pDxwh8dPg
         JcS8peBv8EFpue9wWc67aq1Yx7I6d5iqkiBdCKHc30q0hA/NQwwOAI+TIXEW/8+Nj3g6
         uZAgwG/I9p/W6eTnWr3qkck/6ucJTy81Umo+tUMjMBlSoCHT6k7umDjQwQ+iRkS5dfOh
         X7wcfRiEtXXjtdxUL2tPjViy9rSVkBy9pLlovZiJH2zca7ow4CiNQK0iEQRE9QVPf7Kc
         Ka46uSHgXe7Zb3c17TrjEYZ0P7oim2zGfuVgwEk0kdWsuPpkC2WfsHDcmvYQ9yOyFcJm
         IhQA==
X-Forwarded-Encrypted: i=1; AJvYcCXqk0Vq8xHyHsZ88z3NoR/3RRbkvmTrCtd28pyyb5ligg/KAIKDZlsnAvAbdhBZzbQJLV15TPEfU4cS0+94Hirp@lists.infradead.org
X-Gm-Message-State: AOJu0YxdjUNkwFwvjl32ceRf25XGtkBN7w2/H9l7UyKFEmc3D+Ub9hNu
	f2itLBYZVA5UhIwq8a9cGxNRC3ok5iPHz4NYXznwOG93LgKi36XYiK5aBQZPoZBaDdmCfvm9n8l
	8X3hSbSVuGY/1KOFgd7FZEPJ5g0sY2qQ=
X-Gm-Gg: ATEYQzxISGjDr3BMpaPqLfSebhoDfIt8W3Lg/h+tcxfb57zb+zuM5Q1BE6p9p39yH7K
	e/Ua4gNSoV9q9BqskazZCwssBI0qIcbrpGJQOklwYtiQJb1VrDS4H4XtF0Xu7AJ+HXMioburEeh
	Bvsf0Djo9Xf1nJymrhSsgY1WSRYitRTr1VlRjaRtA88M9CN9D6oRiv64Bf0EeBkKo+ot/QLpBg8
	fxULEb5NycdWSPXUToEJEq2OC1xwMDVQvJ71pu3BmGJEFMVYCYKcusX6Teuvs1jfzV0OpSa5RQN
	ngTyXg==
X-Received: by 2002:a05:6102:c02:b0:5df:8f4:61e6 with SMTP id
 ada2fe7eead31-5ffe61bf1f4mr409120137.32.1772777192540; Thu, 05 Mar 2026
 22:06:32 -0800 (PST)
MIME-Version: 1.0
References: <20260302-add-new-eeprom-node-v1-1-2bcf87bc22e4@gmail.com> <fd932aa3f0cae64f40c3b207657032e7bf61066a.camel@codeconstruct.com.au>
In-Reply-To: <fd932aa3f0cae64f40c3b207657032e7bf61066a.camel@codeconstruct.com.au>
From: Colin Huang <u8813345@gmail.com>
Date: Fri, 6 Mar 2026 14:06:21 +0800
X-Gm-Features: AaiRm50kmoskXtONuaiHe2cCtn5FjwA6MJ2fKHVggzbYT0hgr46ptkqqm2zNPM0
Message-ID: <CAPBH0A9oatx7U2+3dvGVgonHEm+yq5TFM9mTcdStau2Lk1XytA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: anacapa: Add eeprom device node
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, colin.huang2@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_220634_913384_5F0523F4 
X-CRM114-Status: GOOD (  15.56  )
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

Hi Andrew,

Thanks for the feedback.

In our case the only functional difference between DCSCM rev=E2=80=AFB/C an=
d
rev=E2=80=AFD is the EEPROM I=C2=B2C address change (0x50 =E2=86=92 0x51).
Other than this, the hardware is identical and all device-tree
described components share the same wiring and behaviour.

Maintaining two separate devicetrees for a single=E2=80=91byte address shif=
t
doesn=E2=80=99t scale well for us. Only side effect of listing both EEPROM
nodes is that the non=E2=80=91matching node produces a harmless driver bind
error in dmesg. It does not affect functionality on either revision =E2=80=
=94
the correct node always binds, and the unused one simply fails probe
and is ignored by the driver. From a system behaviour standpoint both
board revisions operate normally.

So the trade=E2=80=91off we chose is:

  * One DT shared across all revisions =E2=86=92 low maintenance cost, one
source of truth.
  * A benign bind failure on the unused EEPROM =E2=86=92 visible in logs bu=
t
functionally harmless.

If more hardware differences appear in later revisions, separating the
devicetrees would make sense. But given the current situation, keeping
a unified DT is the most maintainable choice.

Thanks,
Colin

Andrew Jeffery <andrew@codeconstruct.com.au> =E6=96=BC 2026=E5=B9=B43=E6=9C=
=885=E6=97=A5=E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=888:12=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> On Mon, 2026-03-02 at 12:20 +0800, Colin Huang wrote:
> > eeprom address changed (0x50 to 0x51) in DCSCM rev D
> > To support previous rev (B/C) and rev D,
> > add eeprom device node for DCSCM rev D.
> >
> > Signed-off-by: Colin Huang <u8813345@gmail.com>
> > ---
> > DCSCM rev D changed the eeprom address from 0x50 t0 0x51
> > To support previous rev(B/C) and rev D.
> > add new eeprom node for devscm rev d.
>
> I feel different hardware revisions may deserved different devicetrees.
> What are the trade-offs that lead you to avoiding that?
>
> Why is it better to cause driver bind errors on both revisions?
>
> Andrew

