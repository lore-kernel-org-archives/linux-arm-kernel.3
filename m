Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE368C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 13:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SFrncxg8AQQiuXDWK0QdricKiYQ4QF6k7OcXsKbqExE=; b=Xu0NC+yVE4uA2gzXXTWDxAa+TF
	YlgB8hC9jCgQQWF2VeU8U98S/+W9B3Mhd3ImUQAQjXniFUSY1l/9Jkua8fxKIdx122OHLDOVud8jq
	Knh0dQjSCja8dD7jvckkWS/VVsmOFpr1BVW73fheLHLy5wVwL5spu+aKMWm8mPjnYqyA8RwjSPXu0
	pFMQ5nATRVMooSP4Orc5novCqX2tEAq5USLK9shETYufphWd0oLgSzAQg1+VIxlI0rUyxCIurNDeV
	5KdH09YfiXPjzLMS399OHxwRPuDjIiEus4xWpKK2DVbYGRXBaJ1mSPffWrcg8orgAE9ZzDNGfP50x
	PuK9LUuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4efk-0000000ES2G-2TXt;
	Thu, 10 Sep 2026 13:18:36 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4efh-0000000ES1g-2rD9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 13:18:35 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so12119085e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 06:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789046311; x=1789651111; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SFrncxg8AQQiuXDWK0QdricKiYQ4QF6k7OcXsKbqExE=;
        b=Zz/ecsOzK5FmQN+zxse1pAJKfV9u8yJoJU+v2rjECaeesA3+sAUObEkRdEpCLugvD7
         qyu3dEY63ZrxCHh4eUw/DuK0buS4SGhODOHP1l12N0hQMAztL7pdvLrwcHFJTf8CHlxv
         i/jsLLeKgTYOSD6Akw2hIMYtTD+YT0ivlh0PIU8fQFtum/Sa7FO38RIzncZo8tC1N3QV
         63va8ht+3r1/xelG4OxJn29YqbhfvoIJ48ZXZUaAcPsui2+YbA/0KkNon4L2KNl+p6pO
         494QKDPbFYbGqO86wqTr70oxEhvFIzQzewBdXJ1tcrQQzWm9zI/8+NICYXc+bPwy4kYV
         Qg5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789046311; x=1789651111;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SFrncxg8AQQiuXDWK0QdricKiYQ4QF6k7OcXsKbqExE=;
        b=jSDm5LOOev1IbevaRXuyayiZcyy5AMurRqJxZZaO/CLhurhDZUDQQMWHwwHoh5Tpqz
         DICM381X1jcsnaMhQhU6PHrTyfwKB1A9MBHc/1kGkWsfpsACZ2A1k/bmemGG7L7nceMY
         48bXcpzAkAR7Wa1YIa/N2XKGO0KoZxmxevYAvO93UyTXd+0rES/O0NeXdEviWo4ap2XM
         H0o7YINVdeTt65gkHtuFwrgy63/gdmhaRJNEGxSD9g12g4qPQtTNwzjtQFYqc5OVmYws
         02R/TGm34QI6FVFS2hOhe5DaIHqdqvZ5ssFnTaTVHUiNfo4oGJraxP2pjgfvWRS4G5vY
         /obQ==
X-Forwarded-Encrypted: i=1; AKwUvBwNnEZP/RgURNpHzjduB+BBYnXfE6MNWdFDiZxxD3THPvSxVpeOEs5Fon8bp4NPsYRKWtGyIlpnCJlkYZRwQLFV@lists.infradead.org
X-Gm-Message-State: AFuF++lpBmPFvVrPubU1Bz6N9GRUaARUFVlyx7cFGNSjvvRpsLDlSBjO
	js9Yt8betxcWWAnyRcUF8cEzD09+YFHiZJkdM11oEu4BHFpBefAs9USvBFeOYwDz/cE=
X-Gm-Gg: AYBFou2m52iSCOoCmPzpBpSIbCLUr6/C49mA2QBwYtPMU/BHDq5YYRVtBUjvGaHx+UU
	ehh98aRNPXPjG5qGwTXzWQ3nY3LEKKTOhMZ74HDi056eGPyTgLITXw6Z7VRNYYCyFgu9ZDyA7Vj
	8ROiWHma9Kvsfk9uPq0UfhQVjLdRIoxLCmFqEEfJJItkmFjVvNqSo8XdH4Wz12hG4nIB2EIRbQo
	Dt877IM03rqC0lyY21075jpYvc6EY7C90aNo68jsbUdK4YzLMBpfwATWN7moUarI4HJbdbJUB8n
	qFlbWXs5VqhzOZDV3WnX06UOAUbRDWpZjG1Vh1jNO601qOPkH5yDehJo8we02MddywGkTIc6F9d
	1eaqUxPRDbuIJjyT2hUTfU0OF9eRJE+DEAPmlvIdccUwO2d8TWwTl8FnQsEiZ8R9+M35mVmBcjp
	pkwUZO6ySjMfpUYczS6TToxne1NzG7leVIw6x5Rxtbh/+5Du9M0ngweInQWBwhqAiFKO6O+KRc/
	cXAB5c=
X-Received: by 2002:a05:600c:4712:b0:49d:2705:7030 with SMTP id 5b1f17b1804b1-49d270571ecmr45811495e9.7.1789046311143;
        Thu, 10 Sep 2026 06:18:31 -0700 (PDT)
Received: from [10.11.12.110] ([79.115.63.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e5fbda49asm9602715e9.3.2026.09.10.06.18.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 06:18:30 -0700 (PDT)
Message-ID: <f80d4081-d585-44c1-bb82-3d7f83462d1c@linaro.org>
Date: Thu, 10 Sep 2026 16:18:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] firmware: samsung: acpm: add fire-and-forget xfer
 support
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org, Juan Yescas <jyescas@google.com>,
 dianders@chromium.org
References: <20260612-acpm-fast-xfer-v1-0-1aa6cd2268ba@linaro.org>
 <20260612-acpm-fast-xfer-v1-1-1aa6cd2268ba@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260612-acpm-fast-xfer-v1-1-1aa6cd2268ba@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_061833_773985_ABFE8DB8 
X-CRM114-Status: GOOD (  15.49  )
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

Hi, Alexey,

Sorry for the delay.

And thanks for the series. Improving frequency transition latency by
giving schedutil an atomic ->fast_switch() path is definitely a
worthwhile goal.

On 6/12/26 7:34 AM, Alexey Klimov wrote:
> The current ACPM IPC protocol relies on synchronous polling
> (acpm_dequeue_by_polling) to process mailbox responses.
> For CPU DVFS, cpufreqs schedutil governor requires ->fast_switch() to
> execute in an atomic context. Waiting for firmware acknowledgments
> in a loop in such case also using udelay(20) under spinlock doesn't
> make a lot of sense. Experiemnts on Exynos850 showed that even with
> removed udelay() or with it significantly decreased, the firmware
> processing takes 15us...250us.
> 
> Introduce acpm_do_xfer_fast(), which implements a fire-and-forget
> asynchronous path:
>  - utilizes spin_trylock() to exit without sleeping if the channel
>    is busy;
>  - adds/sends the message and kicks the mailbox doorbell;
>  - exits immediately, allowing fast_switch to complete quickly.
> 
> To prevent the unread asynchronous responses from permanently exhausting
> the 63-slot sequence ring buffer, implement an acpm_drain_stale_rx().
> This drains the RX queue during the fast path:
>  - copies payloads and sets completion flags for sleeping
>    synchronous users;
>  - explicitly acks 'is_async' messages.

Answering your core question directly: the fire-and-forget approach
over the existing ACPM command queue (acpm_do_xfer_fast) won't fly.

The ACPM IPC protocol is fundamentally a half-duplex, synchronous
request-response mechanism over SRAM ring buffers.

Even if the host sets response = false, the ACPM firmware does not have
a concept of fire-and-forget on standard command queues. It executes the
transition and still pushes a completion entry into the SRAM RX queue,
advancing rx.front.

Draining stale RX entries opportunistically on the next xfer via
acpm_drain_stale_rx() is fragile:
1. If frequency transitions stop (e.g. CPU hits target frequency and
   stays there), rx.rear is never advanced, leaving stale responses in
   SRAM indefinitely.
2. Queue lengths (qlen) in ACPM SRAM are small. If schedutil issues a
   burst of frequency changes faster than the firmware completes them,
   the RX queue fills up. When rx.front == rx.rear the firmware panics.
3. If spin_trylock(&achan->rx_lock) fails, acpm_drain_stale_rx()
   silently aborts, and sequence numbers in achan->bitmap_seqnum leak
   until the pool is exhausted (-EBUSY).

For addressing fast switch, I see downstream that the firmware defines
a dedicated channel of type TYPE_BUFFER (async_dvfs). Frequency changes
simply write the frequency into the SRAM cell and ring a direct MMIO
doorbell:
(https://android.googlesource.com/kernel/google-modules/soc/gs/+/refs/heads/android-gs-raviole-6.1-android16/drivers/soc/google/cal-if/acpm_dvfs.c#97)
        async_dvfs_set_requested_freq(id, rate); /* 32-bit SRAM write */
        acpm_ipc_ring_doorbell(async_ch_num);    /* MMIO doorbell */

There are no ring buffers, no sequence numbers, no polling, and no
RX responses to drain. This is essentially an SCMI FastChannel-style
interface.

Is e850 supporting this?

Cheers,
ta

