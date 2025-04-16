Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A383C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 01:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V1HXQ+Xi113ayzUNabjj8NTshwQmo5mZvOv0N53Neb4=; b=Irhu6Lj0uDNnKS8sHn3Rb+44yg
	Urqv4jPwB5sq3ZpBVkZmiL/T+nNY2gXNzxe77lJEn0bzpx9Eiq9Im85Zlhm7SfjRabS1J5AZoT2do
	V4jP0ydU90pXgVbrOWhCyPcb7bu6kxtmkoeD+iVINdeOf8S0yFpstrFmntIM7r0akUuLB4Pqh+SMp
	Eon4tuwVnmaKH0pOge8RRFUx0KeXzjgo3Pr80TWEr+qmavgqkF+BHSy8El1oFl8AFHON7CKhlwxmm
	FeJ9Sm+c7dVPvxu+OIBS12p8HglNoLaUaBdQophxBFhR1fQXTWffNe8Z5/1kpJEfiSkr74s0CfaNG
	L0uM0ZWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4rm3-00000007ppH-1uBf;
	Wed, 16 Apr 2025 01:41:11 +0000
Received: from mail-ej1-f50.google.com ([209.85.218.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4rk9-00000007pUe-15fk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 01:39:14 +0000
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac73723b2d5so1232531266b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 18:39:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744767550; x=1745372350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V1HXQ+Xi113ayzUNabjj8NTshwQmo5mZvOv0N53Neb4=;
        b=Dk1QOdj1AFiPp7bX+ZN4MCiV5QQ0Xci7ZodV7nyLZ4GMbOWB7buBQ8yHNqe8MGwo+f
         FkelcctmI+njTI2KwLQAFTbLhYS/44uxYVBllHLhfJxNP9KIcx+qa/lk33tiIt8pYLIl
         N0CCoTzDYJrbo53t87TDuehkb3HBR6oHhBQKSim10bjF1dcKceUw/+m09nPyRLGnm6zX
         YfS+rtLbGWvsRp3rMWtZM9iWUWq6zuS4OHUFy5rKuTGWv0jSt3NvltPD+kgxaXWFV7O+
         szU7FWijfO3aZdY/dGks0XZBpfAymQc/6ayg5dLtjDJ4XE9HLqXLb4HGT2gUIP5GDUea
         uNZA==
X-Forwarded-Encrypted: i=1; AJvYcCWrBSEFPD08vPAGKy/p6mMv+rziJBw6IENvoD8IOMZBOzFFDVuKz5aiP2TMmvwONP3UOyUI0XsZBBUeJSzaxmT3@lists.infradead.org
X-Gm-Message-State: AOJu0YwOnGjlbNw+kVWb5H9/gliCCZOnZ6V3OCFFhL+bdKEKUcaxLKYt
	nOaLusIYpXtTLSVcImmPegwfqH33O2UpizaiH/pELWCHPeyyeK6p244+6ZPFWHQ=
X-Gm-Gg: ASbGncvdce0oswhJOL3XSp0CiTgDR8ICi8w74bmw0nGHHB+BZMBtEB/f5yWW6ZM5GDo
	+Y+1klLy8g7BVq4F2PKxwMpEsZG/+I7+GJH7YLBr3w42nmNUssSvXOspK/EMVLLBc1cU+q0J96G
	c1oHpRKTx9kP4O+ZH+BCuBNVVXe5gVE4qvAyNO8r0Qhhnjg3FmqqA4qnhK3L5d0QhQMBkuT0fi9
	RNcj3EbcTEpMKaQRR3gGxLTSlhoEn2qyOlNWT0Fcks/OjSntzZRkkt1eaNkPzQzGA14m4Z8F7ok
	GPF6u/J29PrCQAARbVKWTP51oz2rP+uCJ0k7J7OYr6pgEKyoUbiLvbbNiGGDIIW+qnAOf3c=
X-Google-Smtp-Source: AGHT+IFRnkyDhx0qWx96yWiu6kWgFaychaXvCXwg+NZZYSwK9++f33ZZwJIAi6FvrrQsCmpHQcV+zQ==
X-Received: by 2002:a17:907:9495:b0:ac1:e53c:d13f with SMTP id a640c23a62f3a-acb384e267cmr109873466b.50.1744767549959;
        Tue, 15 Apr 2025 18:39:09 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3d128959sm27925266b.112.2025.04.15.18.39.08
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 18:39:08 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-abec8b750ebso1044745666b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 18:39:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXydciv8eG4a5OrZNMxFIJlCXO8K5wWHx3aiZjuqtA1R4eZCnYhCRemPaUwxwsRxtnmjAqNzS2fuJEbl+nlUNVG@lists.infradead.org
X-Received: by 2002:a17:907:6ea1:b0:ac6:e327:8de7 with SMTP id
 a640c23a62f3a-acb3849df86mr88724666b.42.1744767548484; Tue, 15 Apr 2025
 18:39:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
In-Reply-To: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
From: Neal Gompa <neal@gompa.dev>
Date: Tue, 15 Apr 2025 21:38:32 -0400
X-Gmail-Original-Message-ID: <CAEg-Je9vfqKe8tThUNxy2hKGGMYR4F2RJaKXqaXJx8f856Oncg@mail.gmail.com>
X-Gm-Features: ATxdqUGM2YL7UPwB2q8EHrpPvcO9cfPSM4k-2kB4UVuY2Jof3nZs232BzqVAc98
Message-ID: <CAEg-Je9vfqKe8tThUNxy2hKGGMYR4F2RJaKXqaXJx8f856Oncg@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Apple/PASemi i2c error recovery fixes
To: Sven Peter <sven@svenpeter.dev>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Hector Martin <marcan@marcan.st>, linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_183913_300736_10312913 
X-CRM114-Status: GOOD (  18.10  )
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

On Tue, Apr 15, 2025 at 11:37=E2=80=AFAM Sven Peter via B4 Relay
<devnull+sven.svenpeter.dev@kernel.org> wrote:
>
> Hi,
>
> This series adds a few fixes/improvements to the error recovery for
> Apple/PASemi i2c controllers.
> The patches have been in our downstream tree and were originally used
> to debug a rare glitch caused by clock strechting but are useful in
> general. We haven't seen the controller misbehave since adding these.
>
> Best,
>
> Sven
>
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
> Changes in v2:
> - Added commit to use the correct include (bits.h instead of bitfield.h)
> - Added commit to sort includes
> - Moved timeout explanations to code instead of just the commit log
> - Made timeout recovery also work correctly in the interrupt case when
>   waiting for the condition failed
> - Used readx_poll_timeout instead of open-coded alternative
> - Link to v1: https://lore.kernel.org/r/20250222-pasemi-fixes-v1-0-d7ea33=
d50c5e@svenpeter.dev
>
> ---
> Hector Martin (3):
>       i2c: pasemi: Improve error recovery
>       i2c: pasemi: Enable the unjam machine
>       i2c: pasemi: Log bus reset causes
>
> Sven Peter (3):
>       i2c: pasemi: Use correct bits.h include
>       i2c: pasemi: Sort includes alphabetically
>       i2c: pasemi: Improve timeout handling
>
>  drivers/i2c/busses/i2c-pasemi-core.c | 114 ++++++++++++++++++++++++++++-=
------
>  drivers/i2c/busses/i2c-pasemi-pci.c  |  10 +--
>  2 files changed, 96 insertions(+), 28 deletions(-)
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250220-pasemi-fixes-916cb77404ba
>

The series looks good to me, especially the new patches.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

