Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D08E77183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 21:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G/NWvy/T67wNQqnhJzeR7JlZsIpKitZV5e9Xln/qnac=; b=H+OYt1c2Pld9yuxd00OM0xqOQh
	j0L4KoCR849MDqWmhJA7pUseSjo2zWsY6ffgMfrII8kzhwi9IwGFDJhRdT+cXOsc3rq5JRMq6pPez
	Y1GjRxUDezqB2879A95loBY8qODucX4jRRMQIknYMJFkX54iJKn8SVkSyGrId0XH/5tqSCqqFRPrJ
	tCHzi/zc66zXlVlprtd17ubIpDZyq8DZWQ5tXJjrCudXrv0Vd1ow0+6aXDYz6ia15iDr2pBq8egwd
	fX307biWO/MJow0UVKf7mIp/lNav2DcPX+svyhPbvm8GTCZKAtjvvNupzlmGkSenzBkivF2lEouht
	AGCf+ojg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNIfo-0000000BRcx-3eKS;
	Mon, 16 Dec 2024 21:30:40 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNIeh-0000000BRRz-2ygg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 21:29:32 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-53ffaaeeb76so4935233e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 13:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734384565; x=1734989365; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G/NWvy/T67wNQqnhJzeR7JlZsIpKitZV5e9Xln/qnac=;
        b=U262x248Mfe2xyVKWjXnHiCQNyFrI67gxhMVDJSdc0QW8pLo1GpsFnlui7WMY9YzEW
         6dqlMKHpio2eKQ7cse3fTsN5iZFBA1TtSXuF9xnf9RkuLX/A0yiyIVAmtlNwZ7NySbhB
         vQspV1u4QaHq1qcSEK04C43X/o528Uokz4/XU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734384565; x=1734989365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G/NWvy/T67wNQqnhJzeR7JlZsIpKitZV5e9Xln/qnac=;
        b=gfpSZZn63eEHMDYax2uh/wJJhNzzKOZuapnKNfWsPV1pXhd1DisxxPY+FBHpGI3KSb
         fU1szryboJ2UmW0QbnrNIFa5kbpLSnWmkubLYub7pa7TRr+Ra4ffoZvZjcOQZmo7F7qo
         Ai7Q1JRhkO11NeIEGl0t5pvuJnBDA8hMHFp7ZJEeA21Enp26wxJleuOGss4xjuT7CBDW
         yVbu1fCBEYtgDOKlPH7+9G1jqp0o60v+1fWR7sgbRgZLDHaRQ4Ds/ZdB6L+mo5KFYnl+
         o4sRJ+tP5gCPPk8Fn+UUf6wa205Umrjhgtpa6O1vDlLGTcCGAsFcjVC/cAvANF//Rez3
         NBkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtYsKnngNdyleizqaFj30BaZmrRMyzX0pA2Y1owoLAjwbP81yhOxTZNlVHdfWA9JIzAn2l0yIPP6sOiztNrg+Y@lists.infradead.org
X-Gm-Message-State: AOJu0YzrcH5o0O+QPZUN3wbObET2szIFpK2U3rO2LJ818u2NKc5UpIce
	H7HwppCc203wlIe0hXAieI/glsGcMJUtmJMBne9vqJEl1msCdZWfeldi9BymU+Y6IyjoL/Hz1jJ
	/cg==
X-Gm-Gg: ASbGncv3q/KpRykroq1byDk8JnNTYyWGQcAuklyCqTk7qD8ftAgTiAxQokkpYKEx8LX
	7JZdyjtOd0DwT09poy9cVGYRfQZhArfek2aas2sTYqtFIYyViWeqc0fWubcw3c42Nh+gUUn5lgh
	c8NOKXuHeGZ7hF6rOYqNtOBTvj+iNUaq+/ev6662lKIE1p0nbBaV7CN2UcfJwE6ZpCSGRZE45gc
	53HKvLRA1OAEoNzdkYQ722ENdN6fUCcI8IQoBWpMMtZsSjgp9WeYi7F6ZQaQ0Fh6M89UpOVcRY0
	a3HVvt6MIVR71Cs1uIQV
X-Google-Smtp-Source: AGHT+IG15d9gFgNxUS9q2BEH+rj7KS4ypIo4MCfrQNgeuTxygpTIvvcK+VWxiUjHscU2f/k0hikSdA==
X-Received: by 2002:a05:6512:2314:b0:540:2022:e3b7 with SMTP id 2adb3069b0e04-54099b71a53mr4198731e87.53.1734384565525;
        Mon, 16 Dec 2024 13:29:25 -0800 (PST)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120c00193sm960510e87.150.2024.12.16.13.29.23
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 13:29:24 -0800 (PST)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53f22fd6887so4701627e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 13:29:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWGxKHyY04iR5YKfQzzWxlSlXwynCA0r19MFkkUWNhBHAgV5ozevkJlYcmiwPy2C2HFGh9PA7t3vtzeuR0kjQ5E@lists.infradead.org
X-Received: by 2002:a05:6512:b94:b0:540:353a:df8e with SMTP id
 2adb3069b0e04-540905ab051mr4197028e87.39.1734384562829; Mon, 16 Dec 2024
 13:29:22 -0800 (PST)
MIME-Version: 1.0
References: <20241214005248.198803-1-dianders@chromium.org>
 <20241213165201.v2.1.I2040fa004dafe196243f67ebcc647cbedbb516e6@changeid> <CAODwPW_c+Ycu_zhiDOKN-fH2FEWf2pxr+FcugpqEjLX-nVjQrg@mail.gmail.com>
In-Reply-To: <CAODwPW_c+Ycu_zhiDOKN-fH2FEWf2pxr+FcugpqEjLX-nVjQrg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 16 Dec 2024 13:29:10 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UHBA7zXZEw3K6TRpZEN-ApOkmymhRCOkz7h+yrAkR_Dw@mail.gmail.com>
X-Gm-Features: AbW1kvbmXu3MO-VJHQBuZxXwEAVNjn8ERCKhnS19UuE5S2BYm8ga04moQxlHz9o
Message-ID: <CAD=FV=UHBA7zXZEw3K6TRpZEN-ApOkmymhRCOkz7h+yrAkR_Dw@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] arm64: errata: Assume that unknown CPUs _are_
 vulnerable to Spectre BHB
To: Julius Werner <jwerner@chromium.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, 
	Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-arm-kernel@lists.infradead.org, 
	Roxana Bradescu <roxabee@google.com>, Trilok Soni <quic_tsoni@quicinc.com>, 
	bjorn.andersson@oss.qualcomm.com, stable@vger.kernel.org, 
	James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_132931_769908_D13E0F02 
X-CRM114-Status: GOOD (  38.52  )
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

On Fri, Dec 13, 2024 at 6:25=E2=80=AFPM Julius Werner <jwerner@chromium.org=
> wrote:
>
> I feel like this patch is maybe taking a bit of a wrong angle at
> achieving what you're trying to do. The code seems to be structured in
> a way that it has separate functions to test for each of the possible
> mitigation options one at a time, and pushing the default case into
> spectre_bhb_loop_affected() feels like a bit of a layering violation.
> I think it would work the way you wrote it, but it depends heavily on
> the order functions are called in is_spectre_bhb_affected(), which
> seems counter-intuitive with the way the functions seem to be designed
> as independent checks.
>
> What do you think about an approach like this instead:
>
> - Refactor max_bhb_k in spectre_bhb_loop_affected() to be a global
> instead, which starts out as zero, is updated by
> spectre_bhb_loop_affected(), and is directly read by
> spectre_bhb_patch_loop_iter() (could probably remove the `scope`
> argument from spectre_bhb_loop_affected() then).

Refactoring "max_bhb_k" would be a general cleanup and not related to
anything else here, right?

...but the function is_spectre_bhb_affected() is called from
"cpu_errata.c" and has a scope. Can we guarantee that it's always
"SCOPE_LOCAL_CPU"? I tried reading through the code and it's
_probably_ SCOPE_LOCAL_CPU most of the time, but it doesn't seem worth
it to add an assumption here for a small cleanup.

I'm not going to do this, though I will move "max_bhb_k" to be a
global for the suggestion below.


> - Add a function is_spectre_bhb_safe() that just checks if the MIDR is
> in the new list you're adding
>
> - Add an `if (is_spectre_bhb_safe()) return false;` to the top of
> is_spectre_bhb_affected

That seems reasonable to do and lets me get rid of the "safe" checks
from is_spectre_bhb_fw_affected() and spectre_bhb_loop_affected(), so
it sounds good.


> - Change the `return false` into `return true` at the end of
> is_spectre_bhb_affected (in fact, you can probably take out some of
> the other calls that result in returning true as well then)

I'm not sure you can take out the other calls. Specifically, both
spectre_bhb_loop_affected() and is_spectre_bhb_fw_affected() _need_ to
be called for each CPU so that they update static globals, right?
Maybe we could get rid of the call to supports_clearbhb(), but that
_would_ change things in ways that are not obvious. Specifically I
could believe that someone could have backported "clear BHB" to their
core but their core is otherwise listed as "loop affected". That would
affect "max_bhb_k". Maybe (?) it doesn't matter in this case, but I'd
rather not mess with it unless someone really wants me to and is sure
it's safe.


> - In spectre_bhb_enable_mitigations(), at the end of the long if-else
> chain, put a last else block that prints your WARN_ONCE(), sets the
> max_bhb_k global to 32, and then does the same stuff that the `if
> (spectre_bhb_loop_affected())` block would have installed (maybe
> factoring that out into a helper function called from both cases).

...or just reorder it so that the spectre_bhb_loop_affected() code is
last and it can be the "else". Then I can WARN_ONCE() if
spectre_bhb_loop_affected(). ...or I could just do the WARN_ONCE()
when I get to the end of is_spectre_bhb_affected() and set "max_bhb_k"
to 32 there. I'd actually rather do that so that "max_bhb_k" is
consistently set after is_spectre_bhb_affected() is called on all
cores regardless of whether or not some cores are unknown.

