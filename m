Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE81C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 11:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6W5bZ7kV+SEAo1aKDYzV8iQ9Oc96d7635w7XhaN2yN0=; b=BqCqsO0jfE12KChHsQAKTh4BsN
	CBwucmvtUBMdWu/XdPyMjIP+afuBvuCsIiK3Wx1r42/MtUsj6yb9V8L9Z4FPRgDE8kbdPFszpw7eG
	kWWNs5o0k+JiBQ63Q9SW7niY18zmHROawugsmKxTvpqcnNCRGsFN1bh/qsw7uKySMy+JqUbBPVT07
	V9pAC2r53D+8ZzaVEz9FjH9P4HEIhPHFhEpEiy/mkLMtlCvZlxtHGCzvHRY3ZAStDH7XjeSbLsD3h
	/bpVJIdZHQwVoZJdwwWxaVmL5Sa5NKg6VUo2c67YNPd6xVeYjSQyz+tfqUprvhq50hp0mz1UGNGjH
	5sINEdLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9irg-00000009PnR-3pu3;
	Tue, 29 Apr 2025 11:11:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ipl-00000009PTR-2xUx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 11:09:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E8D674A6E6
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 11:09:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3148C4CEF0
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 11:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745924943;
	bh=6W5bZ7kV+SEAo1aKDYzV8iQ9Oc96d7635w7XhaN2yN0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kJoNtR21vvtiSK5I4AhujhMcNV+jG3JNu8FI7oxh5yfbV+ZGNOJAcf70SZ6ZSbSSh
	 WBA6V6p0QtkKVHNdfpf78MPtWIqpmwUBJlYJTzrZvhAcslEg+Ok3J8Th6QnSWh8qvV
	 10U4NKBGv5e21OLZCs4VfN9DALwLzye40muCMeiO6cNaIXV7O6k77LyqZA0oBKafXN
	 qVziuIj7I6gsva59f529qRXh9gygYQYEzDjUdqla68igWIwRnbbirGlzXeO2cbCs9r
	 PYgmQ9Ww/z9N3j3sDgyS4MQc7ykvmUy+DCcAa6TahzHBHr9YBfpaSxLoPgOHYximNo
	 7L0asRTv1pDAg==
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-400b64ac5fcso3654317b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 04:09:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXCWNksENyXL/3WdXpuEmA8KZKZ8P0gzOquQ5Lgk9AyZRt0JwfSglyENicovMH8StlL94EvIsh5I7l59e8261Tk@lists.infradead.org
X-Gm-Message-State: AOJu0Yzu2OtgIwawvfMwwRvzpNlkQ/CPZ+ABPEMHKHHU23n0GhlxDrqp
	0MAMSk21+ScMVleFObL+RtNmMuUTSpFgN5d0Pfw2JEnhvlQLWSdY9rtluuud4sFrSC32oHgs4nb
	3SBlD2gbEXZpRs91FGeSwIdw0P2A=
X-Google-Smtp-Source: AGHT+IFY4i+B3pR5hn7A2kqkAlnBnbb/HDJe+RY21qXj4tISAk0tiDxufLtwdDVT//wBwk48KcRpyo3+ep5C+qD0nl0=
X-Received: by 2002:a05:6871:2886:b0:2c3:f8e3:bdb9 with SMTP id
 586e51a60fabf-2da486a7a9amr1047877fac.28.1745924943157; Tue, 29 Apr 2025
 04:09:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250327195928.680771-2-csokas.bence@prolan.hu>
 <20250327195928.680771-3-csokas.bence@prolan.hu> <CAJZ5v0jmuzvo-xzGBDhGVBbY7svbrqEdi-SeJrx5BG=qtN6ZiQ@mail.gmail.com>
 <b38b27d4-c3d3-450c-8634-2e07f393a76c@prolan.hu>
In-Reply-To: <b38b27d4-c3d3-450c-8634-2e07f393a76c@prolan.hu>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 29 Apr 2025 13:08:51 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hRsXw45utNMEhLB=i56tsJDz8AvYfV2stPbtRHh09HUg@mail.gmail.com>
X-Gm-Features: ATxdqUES0FmjmyEqrlOpgBYB8t6ofrTgX8zGFUf5SN2x5tU_vCgg6l81l9wKEDc
Message-ID: <CAJZ5v0hRsXw45utNMEhLB=i56tsJDz8AvYfV2stPbtRHh09HUg@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] pm: runtime: Add new devm functions
To: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Varshini Rajendran <varshini.rajendran@microchip.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Len Brown <len.brown@intel.com>, 
	Pavel Machek <pavel@ucw.cz>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Danilo Krummrich <dakr@kernel.org>, Alexander Dahl <ada@thorsis.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Pavel Machek <pavel@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_040905_761826_931BE4D2 
X-CRM114-Status: GOOD (  16.19  )
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

On Mon, Apr 28, 2025 at 10:44=E2=80=AFAM Cs=C3=B3k=C3=A1s Bence <csokas.ben=
ce@prolan.hu> wrote:
>
> Hi,
>
> On 2025. 04. 09. 19:43, Rafael J. Wysocki wrote:
> > On Thu, Mar 27, 2025 at 8:59=E2=80=AFPM Bence Cs=C3=B3k=C3=A1s <csokas.=
bence@prolan.hu> wrote:
> >>
> >> Add `devm_pm_runtime_set_active_enabled()` and
> >> `devm_pm_runtime_get_noresume()` for simplifying common cases in drive=
rs.
> >>
> >> Signed-off-by: Bence Cs=C3=B3k=C3=A1s <csokas.bence@prolan.hu>
> >
> > I can apply this one alone if you want me to do that, but I could also
> > apply the other patch in the series if it got an ACK from the driver
> > maintainer.
>
> Did this end up being applied?

Just applied as 6.16 material, I'll let you know when the tag to pull
from is ready.

Thanks!

