Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E88A9CF2562
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 22:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zLlk6UkFi9AiavKeSo3Js0efbItcHL5Vz7KXQEkD25Y=; b=s7Hso8faPWxNk1srkqAr4hWbXb
	UsCrU8Akbkx9X1fnXFbop6tUjQ0v6R3oxZbga+ib/U3LHXPaATIk6+yLfbASVFiaduIinhQBWOZvS
	y/rpZr8fxH687WHIqZj10w6+pbTcHqBD2FNB/mGrzfrLG1C2lgTscFKrvedn4RMIwXf6HJIe0XDHG
	EgAgildZ6V75h8MuVC8+Xuy4qDVsKyEnIaAoSrDCaINutLa2j2fMdFc/idwfvzMAafySZ3YEJx2hO
	kRnLpirWOqamUQYG2/LvfqTXhWEDpJBVxM9SaoiIpx0F5vHhDhXKMJfK5pygJcGCcvRltQYu//PRP
	BcqvfZjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLUUS-00000001COi-3eJ1;
	Tue, 18 Nov 2025 22:48:00 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLUUQ-00000001COO-2fgN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 22:47:59 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b75c7cb722aso202916566b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 14:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763506075; x=1764110875; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zLlk6UkFi9AiavKeSo3Js0efbItcHL5Vz7KXQEkD25Y=;
        b=LtdzvXtYw3UnfN3G+XQElxY0jfOyEKj8G0eWicsJmY2S/mZojMt4bcErnzLWEZLGS8
         k7aVRrKpw49mx3SF9Tjh/xiXNd0SbnN8lIsOp5QSARwtPoHA1Gv+8SYBDPA7T9FT7wyc
         0VAoT8d3DgHIA7CS5GrQ+aFrdwGHVymzAqQZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763506075; x=1764110875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zLlk6UkFi9AiavKeSo3Js0efbItcHL5Vz7KXQEkD25Y=;
        b=TR3N6UWnLzQktwFHKV7xvIlVqI7ZuvO2fSnR1shrPyMrxxAl1q3oB1TB9RRzgEYgn1
         Eev5cSvpr42+W3Huh0IZiynrYR/jZKSBJ8D3tISOpWV+MRiy2XRL8txiqEuxFeAl5qtv
         nmy2CCHb5JdeYTP+8+KmVMNYSto8USmWdYxc+GP62RxSHj3ew0PYIrEBxw0O0rIB95XZ
         VcvReH1yLRuRBveIoQU/q1Bn+t+WR7qMbnGc1XqUOkQxfkRPGMcUSzA0aID9k+zRUic+
         s6tqgxpJYmdNNdGMCE/03AovDzOdDDbsSFkndCd5tGJ8I+vRbSqjI8RE48BN0YlnFAe5
         eI3A==
X-Forwarded-Encrypted: i=1; AJvYcCWbHeJM/zD5KahhKdAVaYmXfXYapVnO5ZXm1Lfw6FwBMXQyo863WQQP8NJ2pr7wEhwq/NlJmAfa0QiAqB8wAhrt@lists.infradead.org
X-Gm-Message-State: AOJu0YyDLzRD5UfEaKfz+XsgLUzRI7agJlntESeJu0gyE66ZVwH697dZ
	vJV/JArx+NwGJCsibsH/kcQYfwFxwIOzJQAU25DKUthxMpZ+VydRcAPimigCwrWSxwL0jBDK5qE
	ugyrVbA==
X-Gm-Gg: ASbGncsH5JWnZEu1dvhATvjw0MHoy7EDdn1El5XlDRO9FyTRlb5qDsyDm2clOY87hkV
	PsyfC4FBItQigRGJ7el7OOkzK42phajTJxy3MGnJWegUdYhgmgMHOBvOSI6XyZ7h2MQDVlI6mPy
	APTDf7TGHsbozsBQpOIAV7sm+lzMevVOHHGWpJXAJ6CLCCd2vRz0iAadkYxGIDGcyWOh71DC9ct
	6uT2cjBb4d+I3gzMSR20QkoFYz6ZxU+58N+tyIAAwNS+xEHEDU8CNsaRnwCaop84fa1LU/66mZh
	QBmROoTtYvCuJcUBu14PMtwO0OU0TPTgQS5WSf0Z4Rp81MWt3TU5NzRzE4v71ZgLaUeSjjnyoiQ
	jVD1Mfrtcdpz82FUTgpuu3sty54eo2bwQKbFdATIPQwQrRu/7ILYM2MAyuHmIW7pfr506GQ6ZUY
	ycO9T47h2u68xN/hfXz54f+kDhooSR/a6mxaBCH2scAppZfuPIA1A78s9dEDfi
X-Google-Smtp-Source: AGHT+IG1x867jSi8kWDH5zDU2tcL7d12VRtivnQD8mtxbcJXqisK0w9ViRn5m5TY0tA+nnUGZnYMhg==
X-Received: by 2002:a17:907:7b91:b0:b70:fd2f:6a46 with SMTP id a640c23a62f3a-b736780c18fmr1973857866b.20.1763506075421;
        Tue, 18 Nov 2025 14:47:55 -0800 (PST)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fad41e5sm1456204766b.19.2025.11.18.14.47.54
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 14:47:54 -0800 (PST)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42b2dc17965so4908316f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 14:47:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWe3j+QirGPmMm+52mpmckqeRnC4MRvtuhkHBG4qgS0pERBN3rXbKX72sb6gxcQJPzshOD/eYwzt0Cd0XtgAYBL@lists.infradead.org
X-Received: by 2002:a05:6000:2210:b0:42b:2e65:655f with SMTP id
 ffacd0b85a97d-42b593499c8mr17946628f8f.19.1763506073874; Tue, 18 Nov 2025
 14:47:53 -0800 (PST)
MIME-Version: 1.0
References: <20251111192422.4180216-1-dianders@chromium.org>
 <20251111112158.1.I72a0b72562b85d02fee424fed939fea9049ddda9@changeid>
 <20251113022719.GA2281498-robh@kernel.org> <CAD=FV=WUXK_xs4taxs8Q4kxqvkNYE+Ftk3N=N7Nm7yKEvUMtAQ@mail.gmail.com>
 <20251114152005.GA893333-robh@kernel.org> <CAD=FV=W5=AVYeZvz_LxC2-7U83yErY0JGc2nZQ37Pf54FH8++A@mail.gmail.com>
In-Reply-To: <CAD=FV=W5=AVYeZvz_LxC2-7U83yErY0JGc2nZQ37Pf54FH8++A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 18 Nov 2025 14:47:42 -0800
X-Gmail-Original-Message-ID: <CAD=FV=ULAvZ3CkSta7bA5ANhen83RJZ2=qczvPM-gC-_eqTfeg@mail.gmail.com>
X-Gm-Features: AWmQ_bl_hw6vDHu8MkUl7OQYNBNjD1FAMZQn03A25BwsYvwyfHESZ3LQca8v3-E
Message-ID: <CAD=FV=ULAvZ3CkSta7bA5ANhen83RJZ2=qczvPM-gC-_eqTfeg@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: arm: google: Add bindings for frankel/blazer/mustang
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Roy Luo <royluo@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, William McVicker <willmcvicker@google.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_144758_711581_631D26EF 
X-CRM114-Status: GOOD (  22.08  )
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

On Fri, Nov 14, 2025 at 10:53=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg> wrote:
>
> > I think it would help if you described what you want to do more
> > generically rather than mixed in with "add a new SoC" and send that to
> > devicetree-spec and perhaps boot-architecture lists. Present the
> > problem, not just the solution.
>
> Sure, though I think the problem has been discussed at length in a
> number of situations before (mailing lists, conferences, etc). Each
> time it seems like it ends up being too complicated and folks hit dead
> ends and stop trying to upstream. Downstream just keeps doing their
> own downstream things because there are tons of people all hitting the
> same problem and there's no upstream solution.
>
> IMO we need to start moving into the realm of solutions. I understand
> that upstream doesn't want to accept some poorly-thought-out scheme
> that will cause long-term grief, but at some point it feels like we
> need to accept something that's "not too bad" so that we can at least
> iterate from there.
>
> After re-reading all the above, it feels like we're not that far from
> a solution, though perhaps you'll read it all and say that you hate it
> and that we're not as close as I thought. ;-)

I've taken your advice and posted to the devicetree-spec and
boot-architecture lists. To connect anyone that was following this
conversation, see:

https://lore.kernel.org/r/CAD=3DFV=3DUx7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnF=
S7zoJA@mail.gmail.com

I've done my best to include all the concerns / points that were
brought up in this thread.

-Doug

