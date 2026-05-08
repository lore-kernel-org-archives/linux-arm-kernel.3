Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA0BCD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 18:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vwKbiyHlwGwbovjlmx3b/YRsCDUYzrm+ibkGPEQXGFE=; b=yyD5tMwFcdPZIs6l8VdNu97zt2
	YqT03HQdipVyhyb1V57VKJAAKx2/8nOO/CeXLKyCRYAl1sI3BqMp1wElBmW6f5V3XE3U5I391bkfw
	ZHsLhRqnScBHunsrPa7C4zwSoUlSySdgP0GfxL/y3FUvuS8T+23L0RKGnjPu3aoSnPGQ4KtAGubmo
	8liO6wJl/DtaVxs8+izss6jCcC5kiOcpy1xfUzmDf6Bu71pu+jWbhk8lPYt+ieBw2B8eB8G9MkpQ/
	bLV2EVteV9ws/yTEvbeU7szbVJRUtDSzSjEbTBOMnuB5fxabSzzt8WnL8x8oJDhlpp6pFVeffiPF9
	/xJmuCFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLQKF-00000007Igk-0d3n;
	Fri, 08 May 2026 18:53:27 +0000
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLQKC-00000007Ig3-2AjP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 18:53:25 +0000
Received: by mail-yx1-xb129.google.com with SMTP id 956f58d0204a3-65c6a2158d3so1685755d50.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 11:53:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778266403; cv=none;
        d=google.com; s=arc-20240605;
        b=Vu7v2xhPC+TVgl1QADsOwGCNwvlQVCRW2XAkhM2LdNQavrZxGETqiegcaX8noM7OBD
         MbN/7g9Mo6MppTGMZSKlXQPFvWsVnQ9D/rJGhIbyJy6MbHzsnySzohPdcPDcXDd+bStJ
         m8R2CaVLN00PaU9q9thoQX/vRQu+RKmgsJaKPU1A1iO+1amyEHZnjzLFx2oV087wI/uE
         o0xfuSI5Tb6l8P1LrMAUeMiAmN6sImV1HRbPwQUBbRg6oDvClMLIrxBdZdsqQdhvfN3S
         dV2hZbuTpc122Nt84Ku0HKaPHyt7UuBsrNwrQ7GhV2E8NCCGhX0Qzi4CbHuD7Cl6+ruN
         9YAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vwKbiyHlwGwbovjlmx3b/YRsCDUYzrm+ibkGPEQXGFE=;
        fh=bK2rNTr8VoFE+P9C4PGkSwSZzZr0u2s4Qmin6Y5loa8=;
        b=d2Sb9tbjHm7iKNTTXUcG7RWDTOo4pW/isn5MBTAhVT5bpJNCna8vcypxyNDwMcFDw1
         BnyJkG/1gH76YBO7vOqp313ClkGUDk4x6S3boUzuNdcFUihYGBes44L9QEzpI96WmoB4
         2R0v+izWySftoQhKMF5hjDZUweX7T5w5PY+Z6rKFsL6gitwOUp1GbkX6r9eGSljtm2MD
         jNyTLx+WJHhZUMYou7Ijcwn/25kuRqnQvJ/9PguEOi1ZMbbDOWRuTq/Xm/1ridm1kuaZ
         huQsCxikG5XQkIwBDKVUESuzu8OYxlLC6mXWFtBle5/6tG2+YA50FRF3H4L4r0GGKxxD
         2wsA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778266403; x=1778871203; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vwKbiyHlwGwbovjlmx3b/YRsCDUYzrm+ibkGPEQXGFE=;
        b=pVDjhAOK5EppshNQe13A2lhNCzID5Qypvv8CkqU0y++yjlOe1P237ZNxqjoF8nlujE
         lX6lo9swfU9TMavD1aigqJTTTVnUhYYyUiSAexLlYeM5AAlQwUbnjM8F5kQxsYrqm9HZ
         eKUmbJVPp2tWLjBsCun3UhTm7QhQ/7X1Lo6g84ZOzmgMTt+7hQbMKizyadORHGUegkrE
         WBzN6XKP5TFYucrCBO+Y4et9qF4vQI1PUhiohBqThFETGNaWNs8c94X/2b36ALg6DVm3
         4ZJSZ66JbqnoT7DVR1v8s7AY5/FSUFq8l7d8OOWs/PY24Z9CHLfIKJ3a6rx9DmtBSrY6
         BsmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778266403; x=1778871203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vwKbiyHlwGwbovjlmx3b/YRsCDUYzrm+ibkGPEQXGFE=;
        b=NRAa7O9kau9hvlTxOgKzmV/IMOjLvxJ3eo/IjsBCYylNabY1KHPWlucoGtMX3VQ6SS
         dr+i+T9k825BLAfeFtp+Fw6M5Ruc0f2BgcJcLbQ9dt0hyKAsCS2i3YQ43njq3WH/WCvY
         wcw3NM1Aaf8a+NKa5BoqC2U58SWF543ur701A2w3gZLsJjdLOokx2IOaIs5VXcxHPREf
         U5QX9kPX8EoUPASq4qU4c/ckYhNLuy2TX2QzF/tVdhQ+qDEG76Rd26cBfekcwG9AuNcb
         gXW972PTkMcT+XAkliKkBdjc6aXiO7lPjWAae5fyjtLF9xaVoo24dBFXaJjQXmoYw95v
         mtbg==
X-Forwarded-Encrypted: i=1; AFNElJ988dsoLS0x2SHHhmii2eO8/7cYmmqbAo5IO81EPE5DWbgu50D0KcnWXikOIP71eGwxOTTqKKLDxs31wnysd3oE@lists.infradead.org
X-Gm-Message-State: AOJu0YypfDaK2ZRlLqeyeO5VBjL9BM08BonOnUkO7vCUj01Xdpn+1tnr
	t30NimZWD+RmSMTyD/fIFkW+IPO8yo0pYL4R9n+XXxzP35Xwz3mXhCt9LnnUzV5mDiwTmoachet
	c3Jb/KC4hHDOIbnJrhNPIMHj35llvtDE=
X-Gm-Gg: Acq92OEMTnZIIVdlN+l3AVMGZvvg7Tl72Yuc1GJWFA1+QXOIpkTtYNgsysc9ucJIvYG
	dajyZGlIPL3qnRonRNFUok18/+n/z9QKsLtQ+pI/78ekT6+3hrkmxrV0UtwrdpaaDcageb816nR
	VdRzZukAwl3Ty1uTtdnAhDi2PilV19EttmBTSKMD2FMU/tQ3/sFnx4WoyhY9B5e0IMwzCb9QzAX
	LtIvyqd9T0obTXMOs/EerHNcbLZdWQlWPmfnAJO24Nnx8Fmh+Ntq7P+p14ebtnv2eqv+MNwp3PP
	grD+hGPXhw==
X-Received: by 2002:a53:c7cc:0:b0:65c:6897:26e4 with SMTP id
 956f58d0204a3-65c799defd8mr10248971d50.56.1778266403159; Fri, 08 May 2026
 11:53:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260508124513.17752-1-m32285159@gmail.com> <F98D1BE6-7B28-4A36-A372-2431EA151E1E@gmail.com>
In-Reply-To: <F98D1BE6-7B28-4A36-A372-2431EA151E1E@gmail.com>
From: Maxwell Doose <m32285159@gmail.com>
Date: Fri, 8 May 2026 13:53:11 -0500
X-Gm-Features: AVHnY4I1DIa3PLbL-302Uohv4QH5c75pDs0f5bfSZhMVGMyA6hyHYjDxMjEv8J0
Message-ID: <CAKqfh0Hmchpq5zvK6Fd=VCqWXN+1FKyWxNyF1O=3zsVEM7HJUw@mail.gmail.com>
Subject: Re: [PATCH v2] iio: adc: xilinx-ams: Replace spin_lock() and unlock()
 calls with guard(spinlock*)()
To: Sanjay Chitroda <sanjayembeddedse@gmail.com>
Cc: salih.erim@amd.com, conall.ogriofa@amd.com, jic23@kernel.org, 
	michal.simek@amd.com, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_115324_563886_FBE5B46A 
X-CRM114-Status: GOOD (  11.97  )
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

On Fri, May 8, 2026 at 1:50=E2=80=AFPM Sanjay Chitroda
<sanjayembeddedse@gmail.com> wrote:
>
> Hi Maxwell,
>
> Thanks for the resource cleanup change.
>
> Overall looks good.
>
> Also, there is opportunity for guard(mutex)().
>

Thanks, of course I'd also be happy to do the transition to
guard(mutex)() but it seems like something for tomorrow evening since
I've already submitted a lot to the mailing list.

best regards,
max




>
> Thanks,
> Sanjay Chitroda
>
>

