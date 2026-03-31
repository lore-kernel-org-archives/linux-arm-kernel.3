Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD5F9FF60FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 10:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BnoxrHI8V0kV/guwSoufvxK8u0LFfCUgHXBF1SjK/iY=; b=utKCmXyTaGmcQZ7nddgTcT0JuQ
	huEp8zSTxc/uuMbzPkVnq+WYGXJBCjESaLOiHlp8twK1QR2jyweBhgNBqpYYA+qkc6db3hpaHSFw8
	1cyPij5RBS/xGV3LgOZ26erHLwrezDGE4WqWJ3mca0+gduhxdDOKVk661E8bF8T4ubocqH8ZSjg9j
	hrDrNVfo5z4MzBN9P4VwOFTRAe7t1recKW9p00AryKxVZOvYEPtkflvvs9vmfzLNrdzJm8q1pYUI0
	6NgAQFQrXqALITxmWtrqLvjysQ+itJXF48RIOdnbT1lqOxOCZZGtvufoqVD4IUUOVlHFOgUYewk7k
	abgEIzEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7W1F-0000000Cjyp-3O2g;
	Tue, 31 Mar 2026 10:08:21 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7W1E-0000000CjyR-0PTa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 10:08:21 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2b0b339b8dbso74478995ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 03:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774951698; x=1775556498; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BnoxrHI8V0kV/guwSoufvxK8u0LFfCUgHXBF1SjK/iY=;
        b=QRVRHkYEYZDo67WLNlX0zzVuVl91y0+5PJnsXSolu62oVN+UL967tUYp/MTLrB9uXf
         SaMPjU3vssW4iRPxGzta5JcUnhL5UBu0EjMTQDx+0DsHHCDzATso487IzdT7bTBw66BT
         NnL+2LIFDUA8ndBQ7z6xJloMevyhv6+pCDm8Pc9NazpMMSR6JebduNJqeGCCIMP70A4O
         kfI7CyCSdm/Gwz250mUzBNBWJjy/jRl8awprOJefxH7LJbJCJjked2awfHSPqF1Pnrf9
         ZwFLpFR6bhygUqG7G2eG3gw68TfHbkJs7Rpv871DW82JZvae1RTnCW37bE0grDiE94dV
         Yg2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774951698; x=1775556498;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BnoxrHI8V0kV/guwSoufvxK8u0LFfCUgHXBF1SjK/iY=;
        b=rzxbNySIUgHySZO0l8LNH+pstPg8Uzrd7svJ8TAde8Syaq0/z741banjTNhnTroblU
         /vdoTm9kTBfRiHAnoamSysOJTSSEi+EKxzG4GVROWYBk9p5b4RlFYM9VpmGIfU0ZJhWQ
         N2Q6U5a23M+5TAotxSTUKE84dYenWNtmlfeDb7KbQvTEHKo2gVB3ZBj7UyQoKWABqeXx
         1bcYgIEbV7GBZ+++uwYAC+rCad9YhWVh2XyYjhY/Gu1NjH3FQmsaWN0nyxF8VouxNVdM
         VKMVLXauxpzvsW6ZleUJzV2t5vCWgPkSG4jhKN50R8hEkeezawzANXm8t7m803EA48uk
         YXLw==
X-Forwarded-Encrypted: i=1; AJvYcCUPM7CgAk0cUlzFiBfjFc/dPTM1El+29/oQq7a/I8wpSf7N76AABMT8OvUuQRRffmM4JjoE2DOOr36pQFi5PeiR@lists.infradead.org
X-Gm-Message-State: AOJu0YyrbaeliSq9HAv4BEbJkzxBINoMJ29w1g26rLd3sQvZTsV5NAUX
	bRTlOSoisXUHAom/D4ZsQrDJHZ+IwawuQHTYrv/cTAjOosc4XF4odR0fm7GIg+MfFQXjCJXN0UH
	ssTFsr8icao5cDTz0TVMG+qtwgg==
X-Received: from plbi10.prod.google.com ([2002:a17:903:20ca:b0:2b2:4844:461e])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2284:b0:2b2:51ed:4524 with SMTP id d9443c01a7336-2b251ed5756mr74227035ad.43.1774951698207;
 Tue, 31 Mar 2026 03:08:18 -0700 (PDT)
Date: Tue, 31 Mar 2026 10:08:16 +0000
In-Reply-To: <20260327220040.53326-1-jassisinghbrar@gmail.com>
Mime-Version: 1.0
References: <20260327220040.53326-1-jassisinghbrar@gmail.com>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260331100816.2222507-1-joonwonkang@google.com>
Subject: Re: [PATCH] mailbox: Fix NULL message support in mbox_send_message()
From: Joonwon Kang <joonwonkang@google.com>
To: jassisinghbrar@gmail.com
Cc: andersson@kernel.org, dianders@chromium.org, joonwonkang@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	maz@kernel.org, shawn.guo@linaro.org, tglx@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_030820_197160_354EC03A 
X-CRM114-Status: GOOD (  18.91  )
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
>  - Most already work around the bug via knows_txdone=true with a
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
>    combines tx_block=true with NULL sends, so the newly reachable
>    callback/completion paths are never exercised.
> 
> Also update tegra-hsp's flush callback, which directly inspects
> active_req to wait for the channel to drain: the old "!= NULL"
> check becomes "!= MBOX_NO_MSG", otherwise flush spins until
> timeout since the sentinel is non-NULL.
> 
> The only tradeoff is that 'MBOX_NO_MSG' can not be used as a message
> by clients.
> 
> Reported-by: Joonwon Kang <joonwonkang@google.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Jassi Brar <jassisinghbrar@gmail.com>

Do you have plans to backport this patch to other stable versions?
If not, I can send the backport for you to the stable versions that are in my needs.

Thanks,
Joonwon Kang

