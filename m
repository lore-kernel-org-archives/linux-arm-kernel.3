Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B06CD374B1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 22:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kxdaj8XvuPU7tC1NYzWDQ//BWgRc9lqBUZULAQw0owM=; b=0zZZSgUFLGOEzeZz+1KX/NDe8w
	T0b0F/NIKw+a+Ac2m/PNJSGVs4kcb6IO88sZ1MOlcNKonTF7ssdcmXNBoSKoBSPLO/Q/W/mMvMJ8h
	FHv1O6bQ8LDbNMVqDzUelF1ggx5YciyqTixDFk5dAJHp0akDM/5UJLiH23XsTlybWIMkmLuaWg5wJ
	Se7X/CYxFnUJ96CiQ1fbKZksybziytjG1LZkeRZWnlpaU8eGAYd92BpIJTD/J9G6OYS14fNl33BiO
	ec/PMWM+uXbqCzjYdOv6e5popRD+9t7EQfitMCBKz4E10yguNl+kKaYZaK9WJvBMmlYfQnX3Jn/X9
	iNZihw1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRegX-0000000AAO6-1Jdv;
	Fri, 05 Dec 2025 22:53:57 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRegU-0000000AANi-2Wk8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 22:53:55 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-656de56ce7aso819028eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 14:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764975233; x=1765580033; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kxdaj8XvuPU7tC1NYzWDQ//BWgRc9lqBUZULAQw0owM=;
        b=tws6PZzq8QnlBFeCdjk1O8iY8peIx4ICB/3MaTSaEG4UAIp8wG99i+f1yM6+2N94g/
         KqQMyOAzGvmmVrvnVYeSiE6pfQ4Rr82EkmmUp0GJMcQK94dfR8HMmHYHSvv2eNuxsP+p
         hmmAwU7v5hU5XUMfgUUNLFCDiFT5qdfYjYvVj/LuMyHXI14d7LOHeEmj58tHJU+CAIxg
         iHPzZr7G484ATYBC3Al3uPul/CJap9YpzRyGTym6SoPYf30lXQP9Zgr6pQ7vqzqwyRjc
         1lmrw0BuOr36WvOI6VakBJeUOjUk/NFLYaWTnKcOiCK0aThJ8wV5+XcxjY3W+5lGcrN5
         81MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764975233; x=1765580033;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kxdaj8XvuPU7tC1NYzWDQ//BWgRc9lqBUZULAQw0owM=;
        b=kma2BUHWBx622Wp6kuFbTO8BP3DRxBlKvhpGldNCJUQSLiPCDLo1mJ9UQxRDw1NI3X
         cT6h5IXXW8kW3Yg21qvI9ya9KYz2ROsaAdMzqLGzdZL/KnePcOtKrQapUyrockO/V4wY
         25gAbi6uC/vuBQqmQoV8ih6MziVVXyY66FItXLQfSFmXfSz1SvDKIeaPaI6X+aNBNHIN
         y6aLwoZR2en/fxH/6bo3OtRjCvtwRq/cKj892+lz1EhMW3FTcoKJ40Qu0KvUULRLjLcU
         sskfPQf6aQhvM6V0m/gtBK4nNlXAQorA5TI+F649exTHxNU8C193Dq6u/MjeDfjgo1X3
         uZfQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1ulvJ+16PSuirUavH8+j3X6UukQUxmW4Mblsf4VVQruqmJlnd0vBmDD4f2dv+8Y2bwkQDBOOd/foWda4ILwY7@lists.infradead.org
X-Gm-Message-State: AOJu0YxoO8FLTzaQcsWNPwCkldFHOWGLtI8BaK3FU/iLT3Dz8MGEj9XJ
	k/BMRqhC8iq7qAhR4Imi2ypSsEoC7QoDfg9aqmhRdIVyCe8all0ND3fOYRq+/kMG+w==
X-Gm-Gg: ASbGncurZgTyknRYeKmTgITBKNvHa6LBRCRUBBt6CSGAAXpRFncAjiTI8ZK127Qc4eU
	V1GuYz6rZK8zlZamaikM6vT1HjKzPTr+FTHqU0u1sHNPweWDdhq1AXZwoR7syi17qbbmZP2imcr
	TT1Z+XdRjETBuiBKFFqf+0RmCguy568qFv5JW3WsRgezXdqirWyAGlWd7Z7vRCuWRyzBUPwQT9C
	7pvk9+PJjs8NQwGoogYnSZjerl0Kdk/Egpxsl7ACB7G5fxjH5S6xtvLu0MP5iIo0Z7D2qgbE9Hj
	Q+zeWY91D40m2ZLeAxPIR8XndZNKmmWNgfJlRqbOXsO2bm9Cc2GDJNlWKy2Vr/pbYvFyszRzFmK
	iXk2c2cgcKk3MjXFHiTmeCy1KLbSzYWXQ29bS1li0RKzBoVT106bmyp6jGgnByWXYPUvbM0zRvZ
	/+KPEFrpwY18TZSSU+sJJgr8dO5uCGy7e6py2tp3gxicOq57nJmGCrc/za
X-Google-Smtp-Source: AGHT+IHFhRnliDQG56ynaPUfrvYkb15pzZZPHThQqlHTj/wS5YVOBzORn8GShCTA0dGK9AIk0FRxfQ==
X-Received: by 2002:a05:6820:81c9:b0:659:9a49:8dde with SMTP id 006d021491bc7-6599a8ea4b3mr367263eaf.32.1764975232750;
        Fri, 05 Dec 2025 14:53:52 -0800 (PST)
Received: from google.com (122.130.171.34.bc.googleusercontent.com. [34.171.130.122])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3f50aa9675fsm4497431fac.6.2025.12.05.14.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 14:53:52 -0800 (PST)
Date: Fri, 5 Dec 2025 14:53:49 -0800
From: Justin Stitt <justinstitt@google.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Christopher Covington <cov@codeaurora.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.cs.columbia.edu, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org
Subject: Re: [PATCH 6.1.y RESEND] KVM: arm64: silence
 -Wuninitialized-const-pointer warning
Message-ID: <hafkvcj6frhjrzqotsdwws2buy7c6tfwjt5kkjkjc2emuxud7n@cv5vp4ftwvdv>
References: <20251204-b4-clidr-unint-const-ptr-v1-1-95161315ad92@google.com>
 <2lse2swdqrovimdsakgtriadki2fsvikhuetjzxztoui5hpsai@6mmc64ugt22k>
 <20251205002245.GA3463270@ax162>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205002245.GA3463270@ax162>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_145354_647469_4CA96009 
X-CRM114-Status: GOOD (  22.40  )
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

Hi,

On Thu, Dec 04, 2025 at 05:22:45PM -0700, Nathan Chancellor wrote:
> On Thu, Dec 04, 2025 at 12:53:58PM -0800, Justin Stitt wrote:
> > Quick correction:
> > 
> > On Thu, Dec 04, 2025 at 12:50:11PM -0800, Justin Stitt wrote:
> > > A new warning in Clang 22 [1] complains that @clidr passed to
> > > get_clidr_el1() is an uninitialized const pointer. get_clidr_el1()
> > > doesn't really care since it casts away the const-ness anyways.
> > > 
> > > Silence the warning by initializing the struct.
> > > 
> > > This patch won't apply to anything past v6.1 as this code section was
> > > reworked in Commit 7af0c2534f4c ("KVM: arm64: Normalize cache
> > > configuration"). There is no upstream equivalent so this patch only
> > > needs to be applied (stable only) to 6.1.
> > > 
> > > Cc: stable@vger.kernel.org
> > > Fixes: 7c8c5e6a9101e ("arm64: KVM: system register handling")
> > > Link: https://github.com/llvm/llvm-project/commit/00dacf8c22f065cb52efb14cd091d441f19b319e [1]
> > > Signed-off-by: Justin Stitt <justinstitt@google.com>
> > > ---
> > > Resending this with Nathan's RB tag, an updated commit log and better
> > > recipients from checkpatch.pl.
> > 
> > My usage of $ b4 trailers must've not been correct because this 6.1
> > version didn't pick up Nathan's RB tag. Whoops! Hopefully whoever picks
> > this up can add that for me :)
> 
> Looks like you resent the first iteration of this change [1] instead of
> the second [2], hence why 'b4 trailers -u' did not work, since I never
> reviewed the first iteration after Marc rejected it :)
> 
> Your 5.15 resend looks correct though.
> 
> [1]: https://lore.kernel.org/20250724-b4-clidr-unint-const-ptr-v1-1-67c4d620b6b6@google.com/
> [2]: https://lore.kernel.org/20250728-stable-disable-unit-ptr-warn-v1-1-958be9b66520@google.com/

Thanks for spotting this, I got lost in my b4 branches. I've sent the v2
resend [1]. Hopefully all is good there :)

> 
> Cheers,
> Nathan

[1]: https://lore.kernel.org/r/20251205-stable-disable-unit-ptr-warn-v2-1-cec53a8f736b@google.com

Justin

