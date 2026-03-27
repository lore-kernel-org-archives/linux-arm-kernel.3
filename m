Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F99510F2865
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 20:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aW530qvB5irXoR+XfSPgDc8867LrOfDfRACII/Dw240=; b=0VKPDreC8sxh7Qs4a1+o8/w0VY
	+C+LRIMx+GnkQaDtG6qeBPpIwQPYit0oMsePlctXz3IFcxEN9Y31VLJdRrBOs79q+SAZACUWu41Nq
	ZFuy6WgTLY0xhRwlh01ZrAk7j4t3h09l5iyTYbt7cBX8plucQL16LLpk5ioAxlK2IV7NUi5opcLZJ
	vY1wOxJifmk+Dzm/4Z3yTeBw64RsALDlxbV+DwHI2dVZ+nR00PsKpCnMHcuCnWb2p387/TJ30CiYh
	Gpq9n4IQeQECbEox3CrFs9p7gIt3/LjHrBBfGE9pkvc5ibRScOlK9UzrPWiqnTEG+azvHdJtPUygA
	YRbqAaOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Djl-000000089yD-27nr;
	Fri, 27 Mar 2026 20:24:57 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Djj-000000089xb-2Plt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 20:24:56 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-66a9a2187a5so3971385a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 13:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774643091; x=1775247891; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aW530qvB5irXoR+XfSPgDc8867LrOfDfRACII/Dw240=;
        b=WWfu5fDD3btGvHf3ntL+mhXf0cJQq4dOYfnyo+15AQUya9chTL2pQCBQgYPUEN7pds
         2aGgtReuA7tZV17DP0BGns5DT7ADjEacGqskooEQXslKYCAKUdzLWzbzzqSFg3En/7OX
         ueCGuzbgTMyVd/eGH9HPLHyCCxY8U4pVzwUoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774643091; x=1775247891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aW530qvB5irXoR+XfSPgDc8867LrOfDfRACII/Dw240=;
        b=PoUs6+ReK6B1XhtaBiTrpaNItpISBjE2tqiL9J7JdyX2/PdmydqkPDr2TxXMa9UBmz
         iIA4WJfznCVWP/2ftyrYijZMY0RfxCkImXvyh3MB1zbyKf43W0AKVXdc6YidTS9vAohZ
         QcdutlmTxEbq32ZVmt47votWPLV3sTLw0ie+Ech8pK9wLavj+DOYM6Fwv7Mm9Phxiu1b
         fmhSOS/7f03fa4IkF5J200uLHVLXKK+CgignaQ6TlQynqMu7VzEU078+zlAKkGCGDZ8c
         5Gwgoc3K5h+/4olSHEM6UYj11dYO5Y5nkfiZWcOjoc8VsFxPOUY4XW8YbG5WwQDQndF8
         UbNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWixFLtrpu/KYT3lF5nibWaCuUVUpeGl1JobfPL8laJyjhfw2HoQenS/i/6/9AH9RRAe+HPtTauEOiwrPeK/pkD@lists.infradead.org
X-Gm-Message-State: AOJu0YzRdbYMKb0W606aY3GyuQQ9F08010nkE3vbFmFw2CyeUyx5ccmP
	Oi54ibawSmw4cZFp117P3rE/wzzUJaCQfvMgAkUdILXYYPKx9JLae3k5PShf8xvUlwCOe0nhnvF
	hC9axoQ==
X-Gm-Gg: ATEYQzwdmibAHgfmhBo5OvrF0NhNspI3T11hAWX1aBAxwkIciQfnqWw5dshU16Gc/WY
	JeaY0bdHHZXwqpilG+uedenXxISX2zQQvGFirEjLcIKfTFPnk/UYnJp8cuk6K1tdE6oxyv+WdAk
	VSY8hZFVibzj/TqQ9QuBPxU799eIs34BHzeMJceDCHiq/xkjTlObNuyLF5NsbzGSAK+hXcLXr0j
	nwuPPKGNo0Uy96SlEwoD0+8tLxbyxF3uGEUu6uSHDRjm3TPGtLgGOFBgawnGL0tzQKdN0XaDlfO
	NynZznBuotualn6S4OWCupkdpjsKJSmWM4G/mdU3j36o+lzVq4IMuMvpbSAHEmNHgc6U1GDN4X2
	FqhK6nkrNu+gzoWAaPJCM1H/4klmKA1LASx8/TTZa/1o2d75PvWwWhfQ2jS0EDKTgRIN8XozRdM
	/4g5GuQyWqyGx7bIyygMnTW7ajwKO5H9jWII2YWRRqrh2FkHnDrXTnf8HlYec59w==
X-Received: by 2002:a17:907:15c5:b0:b97:1d24:bfe1 with SMTP id a640c23a62f3a-b9b5035812emr193805266b.22.1774643091451;
        Fri, 27 Mar 2026 13:24:51 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b225b9fsm9652266b.62.2026.03.27.13.24.50
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 13:24:50 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so20193095e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 13:24:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXNb7phUB5HTA0B2xvkVkTMfA3PRWwHFFAltTfcYxm3UsCwVB2PWadAu/jvJG+qTQGK7ed/P/uMhkJzKhI0F6LM@lists.infradead.org
X-Received: by 2002:a05:600c:3b24:b0:485:6ec7:2df with SMTP id
 5b1f17b1804b1-48727d5f7a5mr61669335e9.8.1774643089905; Fri, 27 Mar 2026
 13:24:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260322171752.608486-1-jassisinghbrar@gmail.com>
In-Reply-To: <20260322171752.608486-1-jassisinghbrar@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 27 Mar 2026 13:24:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VUOvwep2MeHfOzzH+a+QKtnnR5JhrfFXq7YGSyy-KNag@mail.gmail.com>
X-Gm-Features: AQROBzAYATlS_6ouS5s_yD1CPKYng7i69F-k_C5EZKwEWeb_CvOdWaEnKgnIilE
Message-ID: <CAD=FV=VUOvwep2MeHfOzzH+a+QKtnnR5JhrfFXq7YGSyy-KNag@mail.gmail.com>
Subject: Re: [PATCH] mailbox: Fix NULL message support in mbox_send_message()
To: jassisinghbrar@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	shawn.guo@linaro.org, maz@kernel.org, stable@vger.kernel.org, 
	andersson@kernel.org, tglx@kernel.org, joonwonkang@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_132455_655744_4B6536BD 
X-CRM114-Status: GOOD (  24.23  )
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

Jassi,

On Sun, Mar 22, 2026 at 10:18=E2=80=AFAM <jassisinghbrar@gmail.com> wrote:
>
> From: Jassi Brar <jassisinghbrar@gmail.com>
>
> The active_req field serves double duty as both the "is a TX in
> flight" flag (NULL means idle) and the storage for the in-flight
> message pointer. When a client sends NULL via mbox_send_message(),
> active_req is set to NULL, which the framework misinterprets as
> "no active request". This breaks the TX state machine by:
>
>  - tx_tick() short-circuits on (!mssg), skipping the tx_done
>    callback and the tx_complete completion
>  - txdone_hrtimer() skips the channel entirely since active_req
>    is NULL, so poll-based TX-done detection never fires.
>
> Fix this by introducing a MBOX_NO_MSG sentinel value that means
> "no active request," freeing NULL to be valid message data. The
> sentinel is defined in the subsystem-internal mailbox.h so that
> controller drivers within drivers/mailbox/ can reference it, but
> it is not exposed to clients outside the subsystem.
>
> Fifteen in-tree callers send NULL (doorbell-style IPCs on Qualcomm,
> Tegra, TI, Xilinx, i.MX, SCMI, and PCC platforms). All were
> audited for regression:
>
>  - Most already work around the bug via knows_txdone=3Dtrue with a
>    manual mbox_client_txdone() call, making the framework's
>    tracking irrelevant. These are unaffected.
>
>  - Poll-based callers (Xilinx zynqmp/r5) are strictly better off:
>    the poll timer now correctly detects NULL-active channels
>    instead of silently skipping them.
>
>  - irq-qcom-mpm.c was a pre-existing bug -- the only Qualcomm
>    caller that omitted the knows_txdone + mbox_client_txdone()
>    pattern. Fixed in a companion commit ("irqchip/qcom-mpm: Fix
>    missing mailbox TX done acknowledgment").
>
>  - No caller sets both a tx_done callback and sends NULL, nor
>    combines tx_block=3Dtrue with NULL sends, so the newly reachable
>    callback/completion paths are never exercised.
>
> Also update tegra-hsp's flush callback, which directly inspects
> active_req to wait for the channel to drain: the old "!=3D NULL"
> check becomes "!=3D MBOX_NO_MSG", otherwise flush spins until
> timeout since the sentinel is non-NULL.
>
> The only tradeoff is that 'MBOX_NO_MSG' can not be used as a message
> by clients.
>
> Signed-off-by: Jassi Brar <jassisinghbrar@gmail.com>
> ---
>  drivers/mailbox/mailbox.c   | 13 +++++++------
>  drivers/mailbox/mailbox.h   |  3 +++
>  drivers/mailbox/tegra-hsp.c |  2 +-
>  3 files changed, 11 insertions(+), 7 deletions(-)

This looks reasonable to me. I have one nit, though. Can you please
add a snippet to the beginning of mbox_send_message() that looks like:

if (mssg =3D=3D MBOX_NO_MSG)
  return -EINVAL

I just want to ensure a client doesn't decide to simulate the
old/weird behavior by sending this sentinel value. ;-)

Other than that:

Reviewed-by: Douglas Anderson <dianders@chromium.org>


-Doug

