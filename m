Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEBFC3600E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 17:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tf/nVXRs8M37VNl8JutluOwbokflRbc83AMXv062mpA=; b=hhSs3ICNdsfTiM101uWJCOJRK7
	xqwC/SVKEPBy9eLKqlxDWOO3D0qShZzFIw5S0UM/4IYMEVo2/V0gSL0vvUr5UArkBrThIqOFDH7vS
	0qUyH8XH5PVAb9H0mj8STHji+vHOxevaBbLHS7JgdXeZj6J4td8rjv3SZ1pCB91aLWHpz9BNpLdZx
	mMdCtrx/vm0xlqpxc0+EfOiiuOn3mLqGaXrzXRX3OZncGQJYU0UP/+gv+MsOav2FMbO5/edLzXTJE
	bbLjjTXXKbCTLxzwm2FdiHCcvvqMWIl29878AoLx9yw5Ndl/8s06zoB5mJ5sc8Qbj4pZxow0Qi8fy
	+toAO3Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txUap-00000009C2u-1v2C;
	Wed, 26 Mar 2025 17:31:07 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txUVb-00000009AQt-03OI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 17:25:44 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ac2a089fbbdso17094466b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 10:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743009940; x=1743614740; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Tf/nVXRs8M37VNl8JutluOwbokflRbc83AMXv062mpA=;
        b=WWW/fHWtdymU13DDjlUOkJfkcBWqhJ4zEDhgNzmcQQov/+sBQmZt7irFo0Pgenspya
         ODQF0XCSpHmzve8txK/OJeqybjDROOYDsMN1M2JljiuXJtDEn70cXeIKChafF4eX7j6N
         n+lCQkYTPbCQB7+RfsL5oRRolfpBW5yZyh09I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743009940; x=1743614740;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tf/nVXRs8M37VNl8JutluOwbokflRbc83AMXv062mpA=;
        b=aD8uvcl1DgEJ0symnVBd65EX+flrhKdUjZ8leBIHJRzQ1aXpocxHzxNEcJMkPcRwM6
         CJTtQTKd2NRMoWe7FEQ6pZm75Ray6UYfFs3r1wQbV/TDrNE3uG20UDdn0PH/f/NNDzwF
         /5Y4T6Jlejazx1EX57XLE7mbO0IDqr7xEycKNmqm0hhqsGF1BZTocMzWoM7fZZRD+xiz
         9g1SqyG3g3cC6FbjM1VhFxou2cC/2cTwSa0lNxagv9gjrIixvfi9ZWBMBiYoNCYVT3kQ
         pDdbTHrq6w00kHSPz0u1yN4u1aRgYNfoxvusaZvI2YiqOcdKnaNoKfXM1nlwEv//n4Zt
         RbHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtZF9OUIxSSDJQ5TE5q0uWj6yKkuGQUwjknRJHaU4aAncC0z25cS9xRLB1wr66LIx0F0ejz0l4Y4Z7mR/ER/B5@lists.infradead.org
X-Gm-Message-State: AOJu0YwdmstOg31k08Qub/qBOceqj3lEGilStJjViLaNEkFFkeJ9OHxv
	fBh7dfRE63XB7vNxvQkKWQZxtW482XB8TQNW2sNXzAXk9bZUkUQxUuqmW7d4ppFu2dJMyGv8uxR
	J4mAxtQ==
X-Gm-Gg: ASbGnctlp0RROXvklml1Swfrl+HBwPzTkRt9GQivQF1jh/KfCyfZF0f8wFF5B/+oF6z
	dxPeC0aBa8WtDhDThNgbDYnw9f7PIuB7Z7YdtjVcCxkjbdr81fj1mu9OsYEQZdv40SXsXIlHiOF
	hPom/09RlKdnFh/y1bgYrKuVERvOGHTJWb+lx5KMyWd3cVzjaTCXoiHZyuiO0DQoskR0dnviixa
	wfPXnRhrvMFYe7aGiTLgT2+8DrhJZWChow7yIQ5HHEm04B0mdny2g0Uhh9/ISkuML81Nwi5eSqj
	2XS9PPCVG5Svmp1wB7T55eVJx5fvviPJeo9fA0Q8bfObMdv0SD77ujYsC2/DFWN437pwR74+OJ/
	czludYmEFQ0vmLrVJqio=
X-Google-Smtp-Source: AGHT+IFLepIxGJjAgO2AjNfFqZPeZLjwVwV2ZkU0AwONirbSdRL3crExoCefcXQt9SkOGFBBVI0AIw==
X-Received: by 2002:a17:907:1b24:b0:ac1:e18d:a738 with SMTP id a640c23a62f3a-ac6f88001f2mr56898266b.3.1743009940129;
        Wed, 26 Mar 2025 10:25:40 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efb64952sm1067656966b.105.2025.03.26.10.25.38
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 10:25:39 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac2aeada833so20073866b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 10:25:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXM/NCOTz5XhqWObZzr0DJKluP2dDQC/VnKmYf6hE1eGkurm85S+gp8IPB8j5Bkq2aIG7qYBa6ZQmfYviK+IPd+@lists.infradead.org
X-Received: by 2002:a17:907:3f1f:b0:ac2:32a:ee2f with SMTP id
 a640c23a62f3a-ac6e0d34700mr405560666b.17.1743009938565; Wed, 26 Mar 2025
 10:25:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250325195322.3243734-1-catalin.marinas@arm.com>
 <CAADWXX-0hMgpyeQw_7Ko14hNMciqSnKJAROEWS5vwAdMKUt_zw@mail.gmail.com>
 <Z-NHugcLdLqkEHFR@arm.com> <CAHk-=wg_HipugbtswxFnekQy2g_ksKKXj+yht8naj2FEMtRMgA@mail.gmail.com>
 <20250326124025.1966bf8a@gandalf.local.home> <CAHk-=whwmmU+hv1SyMoyr8yAGP2JiAAP+g5BZaMajzAukzrM9w@mail.gmail.com>
 <20250326131200.1c86c657@gandalf.local.home>
In-Reply-To: <20250326131200.1c86c657@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 26 Mar 2025 10:25:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiXEvC2r=Sa_tpYjd=g+AxZDxxjSdq1WADTvZYZ9oUi_g@mail.gmail.com>
X-Gm-Features: AQ5f1JrBx5kuViM5WHNXW8YzlTQ_bduJ7gLngRyjIWCWOOPEj676hv5PA0NpEzc
Message-ID: <CAHk-=wiXEvC2r=Sa_tpYjd=g+AxZDxxjSdq1WADTvZYZ9oUi_g@mail.gmail.com>
Subject: Re: [GIT PULL] arm64 updates 6.15-rc1
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Steven Rostedt <rostedt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Konstantin Ryabitsev <mricon@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_102543_064208_439551FD 
X-CRM114-Status: GOOD (  10.45  )
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

On Wed, 26 Mar 2025 at 10:11, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> So it definitely goes through kernel.org.
>
> But it has no DKIM headers.

Funky.

There's definitely something strange going on, because your *previous*
email to me did have the DKIM signature:

  Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF624C4CEE2...
  DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;[..]
  [...]
  Date: Wed, 26 Mar 2025 12:40:25 -0400
  Subject: Re: [GIT PULL] arm64 updates 6.15-rc1
  Message-ID: <20250326124025.1966bf8a@gandalf.local.home>

and gmail was explicitly happy with it:

  ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass [...]

but then this later one didn't:

  Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CDA5C4CEE2...
  [...]
  Date: Wed, 26 Mar 2025 13:12:00 -0400
  Message-ID: <20250326131200.1c86c657@gandalf.local.home>

and for some reason gmail also didn't actually react to the lack of
DKIM on that second one and only talks about how spf was fine.

Konstantin? Can you tell what's going on?

               Linus

