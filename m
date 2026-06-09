Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7468CCD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 12:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eJ1OSm9/KIDrT2NrEfcCEO4AojH4TTKtl/a1h/iLbMY=; b=eDQ5kChPs9vui367rHSnij2fod
	RWmuAjxKW+y7mLQ91vDMXFbtmMMEI74J+0UeJ6D7qMOO9MSazUJhbuHOqACaQ8uk3XhN2BgIH9Gyf
	uVDw2kmJIxenLD21vpzqIYIPL2MibZvxSj6lBz86sGQNBQJvtt/dXXI6C3e7aCK2ZneAMu9BshBtS
	cxpS0NcT+tQqgagCWpU+017s9+yv08Kw/W0AUAsBoPUuoGSu3liYs9LOD80JQmmoqhspS6n3e4kTg
	zMNOhtZHMuAJS02w/34iczCbjbLt+XeGSNBccU/j7Z0P1Wv0X4sve3/YL8ovGboiAyboe5hn/qguV
	m2P7UklQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWvCS-00000005ULq-1M1H;
	Tue, 09 Jun 2026 12:04:57 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWvCP-00000005ULK-2HNg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 12:04:55 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-68c19f1f3ceso8587258a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 05:04:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781006691; cv=none;
        d=google.com; s=arc-20240605;
        b=EFaJ3hJqGejRu1ajQXt2+kDmYalQziiajRyZtuaLIXjn8g2VJlAMu4fW3vLDjldLRJ
         sfGCsIomRTvjl8mhL3bClgsISf5+9E6WC5BnGecmmwNI4kBc3ndjR+t/WqUFYP06gf6z
         O/EYzDil1bs/et4hjNl7+YvgoSRFOA/K/+8SryQnn6Bt+qHY074vNZOTu/3gPd54eNpb
         Ew5Knj1xgpDbhqxaEltqZZZsCT9WmzOZ9qKB/0AuFDgesTfcS2u4ayrABSp142mZHxnR
         k3Pp9zg1tSQrz+kgJqe/9Gf2dblt25rtSNlYrFLkOLrhWAW2y9jZE0YMjoLdxFJ9LRvY
         bSGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eJ1OSm9/KIDrT2NrEfcCEO4AojH4TTKtl/a1h/iLbMY=;
        fh=IkY57jSs5zLSJoIrHjZ41mCHebuwcW61HMiLAOZGk34=;
        b=DfxKG9T+87kQ9a/mrUJsD+ZtG5hlP+Yr+ujneQ9fFXK4qetBfqy2Y1PKYM/pCmAC2O
         anzPC/7oxvsmJep2ACNRmDH0Zv+Bcyx/saZ22uIaJRCif0ch7Q4IRnDMcW1P1L9T2CaL
         yrEvdSFpeoHXGf5EscF+YZmDzcucP3VmE0NMfjePge4TZU/h6tr4YdxGimwBbGBiJ2Lm
         FbfkrafD/13CYomJFtjaVvCnwRlz22w3qdJc5grBOeaDnofAEO87YoIA3JPWQBaDhl7i
         KP3oWXiuXg7sVgScWnEzAE6Cbhc1lGp1rM9ctnIk4JGGQUjS9/YGCEkfIW32qi7LkW5f
         Vksg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mongodb.com; s=google; t=1781006691; x=1781611491; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJ1OSm9/KIDrT2NrEfcCEO4AojH4TTKtl/a1h/iLbMY=;
        b=LunPhxydzDNMcnAUxvvdb+SgXoOJ9q5VvXUUsP+j6lJcwFWwuHOggnFGeK6SiJfL7N
         +ULYQInTZ7Uo7U8wcPB0Lq2PwAxcr+MXG72hceIZADSvZSQ8QhFgaXeCd6EmSYdF/lZG
         lT+a8Zu5A4hisxcLF95LpOXAl2UFQOIire0nc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781006691; x=1781611491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eJ1OSm9/KIDrT2NrEfcCEO4AojH4TTKtl/a1h/iLbMY=;
        b=hMtk3T5DONiF2rwaY33NuGbd8xcRA0GSC4dcvtynwRhVfYfWPuG+RuAuCYcXs5NKE9
         8diAHxpWpCcGtohsDh4QwxupmqHqmtpX8ycN9gfeI4e2FeqDVQjXpL4IjO9czwou2lJa
         gUe4q6Q15o2V4+4hAPLx6qmoSrLhWQhtxgDYJRcw8tJelFuZB7AmxSXd0LJD54m4PHoL
         fA9BR+Ag00rQ9v4VLxgGZqKIAS5cLd1yOJoB3R8RG+Pdhrz0s2ANBplTg3WHrK80odjb
         8s5JIIzq6cM8E/gSvQN9mCX59tXwd2R5RxtA4aDGy2u//LlJRDVayqC+lqzpS0hP+4P7
         cOsA==
X-Forwarded-Encrypted: i=1; AFNElJ8sA40nG1k+NzGMu2CAlXPy+QwpVWsbwi8pIu7+CWhqUS8DnE7O0KGRZ7kTVRXHimfF4skCvlG3f3WHjhcuUwP7@lists.infradead.org
X-Gm-Message-State: AOJu0YwipQWhNrUhsOA5QvomaiKlbAVihlCvxHX7Xzn/mOaEBgCw9SAm
	ciKpiUg3m8fz++d5ln+RZ2rd76A9lcL1OZlLW87k06HqJDsef7U8HyJ9FDeBNVcLi+2opdmQsVE
	pReBdzNjSlOLsiiNw/DRHrEKtYdGMaIHOrM+7MQhNxRPhIUS3ciUw65dZ6A==
X-Gm-Gg: Acq92OGwHeCotxuYd/1JmNipT35d6JDThXyz972myljQ6Xl3BPtUzXaxGGcg170FOQj
	Ep1lgpPJUVhn3n1L0Ikmbjqc86jgVYas/y+cO11DWjx2wBzIXVZ1DDEDiJWhNbn0lBCekEI8gYq
	lzKzOjHJg7tH8ao0vhVZdGWJDdyvnfXPi8MvvsWCcoP70PoaiONkiQFrVKmyH+fb2w45MjxVFbU
	7UMdf97xMaTgVlR0MeO1YLO1rh1pzQqeY/q+E/gnCbxiVfSxvoJhHPx1ZyIgeIE4FVwaC9a58mS
	eQuYfvnprJdvSyX8
X-Received: by 2002:a50:9e62:0:b0:691:28f1:6ef8 with SMTP id
 4fb4d7f45d1cf-69128f173ebmr5122555a12.22.1781006691033; Tue, 09 Jun 2026
 05:04:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260508142023.3268622-1-mark.rutland@arm.com> <54ffcf73-dfc5-417c-b9d5-6dee551f8d39@huawei.com>
In-Reply-To: <54ffcf73-dfc5-417c-b9d5-6dee551f8d39@huawei.com>
From: Mathias Stearn <mathias@mongodb.com>
Date: Tue, 9 Jun 2026 14:04:23 +0200
X-Gm-Features: AVVi8CeCCqiGdzCv666p7SMShA1AjTOgQ9cwBdn5c-CpK4xLRAao0rd7RUSOlY4
Message-ID: <CAHnCjA1dGNH07YkWupg1THAmBhW=o4C+uhHbbcRX4edMj2rmEg@mail.gmail.com>
Subject: Re: [PATCHv2] arm64/entry: Fix arm64-specific rseq brokenness
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, ckennelly@google.com, 
	dvyukov@google.com, linux-kernel@vger.kernel.org, 
	mathieu.desnoyers@efficios.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_050453_742601_8B067CBB 
X-CRM114-Status: UNSURE (   7.66  )
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

Did the arm64-specific fix to rseq not get backportted to 7.0? We just
ran our test suite against 7.0.10 which has the other rseq fixes and
everything was fine on x86_64, but arm64 was frequently segfaulting.

I had an AI agent look into this and it reported:
"""
The fix (commits b9eac6a9d93c, 82f572449cfe, 99428157dcf3,
411c1cf43039) first appeared in v7.1-rc1 and will be included in
v7.1.0.

The three commits backported to linux-7.0.y:
- 663121edad54 =E2=80=94 "rseq: Revert to historical performance killing be=
haviour"
- d242126fd21a =E2=80=94 "rseq: Implement read only ABI enforcement for
optimized RSEQ V2 mode"
- fb742945d61a =E2=80=94 "rseq: Reenable performance optimizations conditio=
nally"

The arm64-specific fix (411c1cf43039 "arm64/entry: Fix arm64-specific
rseq brokenness") was not backported to any stable branch =E2=80=94 it will
only appear in v7.1.0.
"""

Is it possible to get 411c1cf43039 backported to 7.0 or was it omitted
intentionally?

