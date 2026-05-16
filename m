Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD54CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 04:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V8Rh4zLdk4DbxG4I/TJfE5EGq2t+0o38Iqvwi9s0NFM=; b=Lkxj2uHWCv9mJebTgQ2JbXeZuy
	ssKNh0nDS8CgDpdaVvrlOLHqgAnjB2VXLScKipBem5xUkN0cvwOrUY2oju9V47MsCzp3AbpVp5Vnk
	0QFyYVdUYsAROUp7F2tmVB4eQKikMVeTSgMgUFTWA/lySbbpF4ze9Zh3Y0ell6LUcfcRxxgZ91LoC
	iv771cusNlN3zMfpqx8AIC+yZa3m9KrfHHZrwKrLZ4wuq6CcxwwDrh8amwAX39jx0llD5wQeQPDl9
	Kck2ySF9PZ1ZZb2owd8uWDnKNxlH/9n58FXl58Kr3yDz2KKt2XDwUSRMVOYVOh/YBIIUkzmCDcyIZ
	Hc9noxFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO6qq-0000000A7DM-3pKe;
	Sat, 16 May 2026 04:42:12 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO6qo-0000000A7Cu-0p2g
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 May 2026 04:42:11 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-c80291e6237so364536a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 21:42:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778906529; cv=none;
        d=google.com; s=arc-20240605;
        b=L4Y/nMtWb0afoI/8ls70hhFuVOXFMUp9gh+tJCZkZlhUDA2TV5UkgHAGlOSSVMFHd+
         8s6zjarMhKnZ+IimlCfbXNx7FQXbqbTXt496Rvwxy72aoEMqtwKSYC/SeBOF2Dnwe0Wf
         GNpAy4axwMgxyA0UynHzJeO7ToUD+d4m7LC3Xbh/pqL5c33w3qYTsp67CqSjo+lOhDOy
         l6ZjCIo+3C+n+ZOk6k5FUPBFBr0kPNBNjHz7rGbdeh3scvZUJX4JX41QULbJIVspj2zr
         MDhyBl8REzTYsgEmJhAjINEFhzvou8y9FXqOIGrrLMy95o4iIiUhvZQAYQd9QeVU9y2c
         psMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V8Rh4zLdk4DbxG4I/TJfE5EGq2t+0o38Iqvwi9s0NFM=;
        fh=4lJHRw1maChbIMkpyiJ5pB70hN+wrUZh1Bd8i/Ml7fI=;
        b=OnBH7HPBf6f91r4X9dBI72KrFicTr0LyaSCeqcBVxoMH0oHgbNJXD6YQbmU0ZFkfb5
         2WzUPd85RwqMcgf3i0hlJe4mcON7qdknVoFKrIFsIoddfKIDCzToXn+zhpNfuAg/USgC
         es4TP/wUsixasMui02MoMF2vt8d4QjakG3K8JASN/SnrpiZnVwgfBiyw+UR6pyVy9FaH
         kZ7Oj9Qgf82IwOg0CgqAtpi/PLJqvOkcmrRyl3RWAdvV0lSk4I5NJdag5KreSwyRK8JV
         riUlgLPtE+gaRGNxFlIweiBHf5Rf0VJ2l3F6ew1CbfphdDLB+qRkXn7ygleuFOAEwunO
         5C8Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778906529; x=1779511329; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8Rh4zLdk4DbxG4I/TJfE5EGq2t+0o38Iqvwi9s0NFM=;
        b=EMUR2hrL7MwUYL9FINLSrBsBZWC+gfBHgR92ctLy3jjJcAgmu45Um3YqjFCLLEKz8q
         9paAv0yXWQNDYfPLZPDpz8RC0JWr93uhI16qs6Fo1AMvcyEkp1xsFZ3ZrPSvmzrLfNBb
         Xzw9iwVbWj/tyjsPJ/R/R8jRm1vfHu6I2+iZDg7XNwe7NaVK8VWu8772DBlm1sMtccL7
         or61H2qbnoMVc0+NFag7fgplS1JD3SubeTj/l4yLWX8jbVo+Od5e8D23a77TiQWC0ax5
         eUx2p6/b+DKdeIxAZUAl/DZtLGKBLHR7VIuI883sPiHU78Kl6MJuaPoMM714lbzyy23e
         r5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778906529; x=1779511329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V8Rh4zLdk4DbxG4I/TJfE5EGq2t+0o38Iqvwi9s0NFM=;
        b=DgnWXnC1UzEHEbpWmhaD4iIoD5/fuJ7cCSqmuy+yHTAUUBPUnCtS9T1ofu23yEdoEk
         /MEHmhNc6E2KOd/IWkZXSo9PgMFVGNvCUwkWeSlT8d3Pkt8627i7XTEnIitlxTeSKC4f
         Fr6GyXYAFpPbkSFRxmAC9SwQH6tUClAlXfz/YFZbe7rzWG3FPzyHN9/bsKsin0HqTxFr
         ZZmYVgwAvG99XPWVuTWtqF5H12rKewHpukFBQgsPAinhjL5lmh11a6+C1unYIceAGOf7
         XECE3Em1rkkFTU9pcCdiT4CZ2tzrarqAJV+nFFBbUWVv09xdUODqZMrHlzivA0VbDiSp
         MQ9g==
X-Forwarded-Encrypted: i=1; AFNElJ/LTYRcgiNZQa6L9F+Bpof5JQh+ScI1li8pzwB5i77+D4dDycFgkskJfJB+COSAFxiFKBhpYtD3If6b9IC3Ea3w@lists.infradead.org
X-Gm-Message-State: AOJu0YzarXu64/xXQd3L7/LjoxkltyM14vg+92lk7Z3W1I03/wYPgo1t
	K5fJTy1fiseyJVjaYR/0IZp62bVb4TW1GaTHCCyW7h/FwPPkVP6MfSg6XhrrHRhyySDQsz9neGG
	QDR0xrWP/YunZLXKWDCdCHAm/dvTBNuo=
X-Gm-Gg: Acq92OHXtH96Pui0YkQMCZyPRFd0W03sKz0V2grMRktZ8zml8LaVL/VWrMkNa2+DUCY
	SRZEt1WgvO2OclXykAy9ak4ZJrGg3P7cdFlu55HgCeC9htzeiPRH+/0btTv34vyQdAB5/aQW+Xz
	Jm3Si5CP7+iPhDvUaiECrTmXIViRZHrtc9XyUQ3h+0rmUwmvFbK06fW+1USYsp06H7Wea3g4GB0
	WTeVYumGxCj6YmNq7F+mF5SsFCJ3jD2UUsVN9xJEB0mjdHJZ+aaFfbghJvITzkVFBYY8OGb9Tw/
	StAIMhaVGqHDu6rXk7vXJYp4JMnoj4Ypbb3t7lpn3I9tBkt7KS/clXuU+FBkjLFnslaDVzKUy5P
	jqnTvHIuSAjk/rxP9ssu0TOOizKos1VCN
X-Received: by 2002:a17:90a:c106:b0:365:c8e3:ec53 with SMTP id
 98e67ed59e1d1-36951c953d1mr7210638a91.20.1778906528768; Fri, 15 May 2026
 21:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260516-atmel-v1-0-674fb4707af6@gmail.com> <agfXl-FiZ-PN_cGT@sirena.co.uk>
In-Reply-To: <agfXl-FiZ-PN_cGT@sirena.co.uk>
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 16 May 2026 12:41:56 +0800
X-Gm-Features: AVHnY4ImmFjH8rHc5xVGey21fu2ZKT2avAYpf9JXGJ-yEfs3n1n9B8uArB3txUs
Message-ID: <CAN4SLj3H3Sc_N42KnYMzgpe8LcFE-6EHeNxnBY2o35jP74_BkQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] spi: atmel: two fixes
To: Mark Brown <broonie@kernel.org>
Cc: Ryan Wanner <ryan.wanner@microchip.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Radu Pirea <radu.pirea@microchip.com>, Richard Genoud <richard.genoud@bootlin.com>, 
	Wenyou Yang <wenyou.yang@atmel.com>, linux-spi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_214210_429221_D1690285 
X-CRM114-Status: GOOD (  10.92  )
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

On Sat, May 16, 2026 at 10:34=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Sat, May 16, 2026 at 01:20:33AM +0800, Felix Gu wrote:
> > Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> > ---
> > Felix Gu (2):
> >       spi: atmel: fix resource leak on DMA buffer allocation failure
> >       spi: atmel: fix DMA resource leak on probe error paths
>
> This needs a rebase for current mainline, I didn't check but I suspect
> it's conflicting witj Johan's fixes.
Hi Mark,
The two commits are already based on Johan=E2=80=99s fixes:
commit ebf99aebc458391893c598f1caddd42bfcc97fc5
Author: Johan Hovold johan@kernel.org
Date: Wed Apr 29 11:13:16 2026 +0200
spi: atmel: switch to managed controller allocation

There should not be any conflicts.

Best regards,
Felix

