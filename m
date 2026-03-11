Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D281FCC9B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 05:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HsZ0aj30QzrWxLy9ik/IeJVQ3KkElzxj0uQiMmN5kNQ=; b=vDBb9Oc+1rAf5ZdTnqZWIX3GOn
	1q6VQiy5iIWhO5+Te3ZF/p9tcsc2NvXBTr272X/PpTFejb4kwBx6PvXV/UCl63RqCg3d/XCcqrcrL
	pYEb++FZEQ4p26y+zHDmbvlDL5ExmfsbFD7x89WfIdtJ6SIwsnrzLn9Tyrs951HPg4fvebFqgKjbY
	mqAqSol+FhrhJsOcQcU4OW0d13O/nIwZcY6ZJeIv89yaqfby76PqMNiZhhdPDTY1lgmaOc7cxqhKy
	S71xqWWY6QDc0hjbG/rCKOAscvBOQpEWFL4LgsbkKb9iGr2OkPQF7TJ4ySPbLRciqRhDSS9AqLaUi
	aWjhKPwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0CLX-0000000Ap8p-3E8c;
	Wed, 11 Mar 2026 05:43:03 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0CLV-0000000Ap7h-2Tmr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 05:43:02 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-c73c990a96dso415685a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 22:43:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773207780; cv=none;
        d=google.com; s=arc-20240605;
        b=ch29cnfLrM2q3y4Or0lQOyvH6EyyblzGtVa2gMswIYlvQ8dhQhrT5MzcB2AfzLaDOM
         OHlf20nyknBD4k0NWjVMf1yfcBQePRQUCZ2X4+1KfTmiwDA7e7Rgj5+jLmBdbRO8tLAA
         xAsmbgIzc+yNoi86Onujjhk5nfJmRMtXZnqNV9Z2p6dE8RcVum3j8xHng54TpTIJdsgB
         xRT+G6s4efn/qFIaRbXpURC6NaLN4q8FbBCyc0UlisDSBZbplMi20qkOiKl3hNdqzUyO
         BipKYJLCdpVvCFzLH/QFnceHQDRekV0ELWQpBFfvPDYPfgYkmsYRE92JHMxiyqjhgu7l
         8RKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HsZ0aj30QzrWxLy9ik/IeJVQ3KkElzxj0uQiMmN5kNQ=;
        fh=6vX5RXyJcjX17tiMv+OCX0WHEl8OfbgPurQ20cL7x64=;
        b=ap2X/IdXHrstGo2lEYwua2zOt3CyGaXOXp95Itgniz0haFGzmGGXwQj3KpPsmC3JCX
         4LGGRmDinMtJELtGNhlc5RyR7vo1B+T8aoIzy8Q6eU4gbb95stzRRTQ7vR99lU8nMkYO
         1K0ffZ3Iek3BUazyu9+GwBiWFhjr0FkeI/rl7CMZzKs+WuV5ykx5EZvxoSZP4gMpYj4d
         Z45f5cnZSptYXsAGxSSsaJenSOgLJkIggEG+6Q+an4Lh62hvLAqb9+VFQAcJaGkQDhMH
         DSTQiA6hDh43+3Y04AlY1TwKEcLuoakKxETkoCfgwjlOcBRB8CeF8Dj8t8HnxUWbndnf
         /PsQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773207780; x=1773812580; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HsZ0aj30QzrWxLy9ik/IeJVQ3KkElzxj0uQiMmN5kNQ=;
        b=USjyqUgGQEu6t8WKvZnDywclQzwVYhxvNsPyTbjyI9qHRVsn6HWmxhTqW2liZThqet
         u9di9n5rLFWT26zhdjyqi9cJQJCKiwpD+tP8O49uuJ+EqnW16QwKDin31oB4BQGugoy8
         ZCr8sXBROkAt8RRmVm6JmV34te4Sv0iHgYlbokuOHGfjOEJ1mPl/Nq3m2TCvGYnGl1Bf
         BebekAhemQtxcGOtZSadVRaGLnM7RnyTI2x7DrCiuWfHVXsOju1qC/N5nRUUf7mBwiWy
         Mxg36D9i/DWJRu1mmDK1UdoUaNFb2cQxH9kfyW45rHBgoS8dyFyniatD8tl7WSzZHSiG
         ql7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773207780; x=1773812580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HsZ0aj30QzrWxLy9ik/IeJVQ3KkElzxj0uQiMmN5kNQ=;
        b=Onsf6/pqpdmtmY/D+ycNg4YBfLU9eepu+xlqO1BaXQwQPVADN5Mf1INScE1D9oVTah
         ZiSAlYF6eYgSZFOT81XtgoKKcAYMWmxQoPwNjbjG8O3k/RwBtV4RbnHgkJmVBFt6CM8w
         3GyMFf+RK6bPVkLg7qwHZbicVY9EfkIxWnXGwmNuGX+Fw21a8142HtvRi1athJzHVPaK
         Lfmky9SceEhV+1rvLImohmnQEHmUTK+tWV8DDqLqTwudNUSlEguWfihZFnHZO74NMX+R
         +Q1dZfQ5jccWI/w5WBRkZyDyJeSc98kqOnJMhKlSTeiAlDCNbd9mSFB+Wh5GfXG69YCo
         K1rg==
X-Forwarded-Encrypted: i=1; AJvYcCXTN1+YYFAzeEjR3olGijwhUNzFss+3A7LDvJIkkzhqgnwokENfq0VbOyoBywL/YROD5g70S0NrySS14ZKtaqhn@lists.infradead.org
X-Gm-Message-State: AOJu0YzRHwKqg6FfFVDwBYb7wL+HcuY8YXV8v6yEpkpAylzpl1qfNBpS
	O0Afrhi1gMnAVGTUxffHkztxDcQx0zctY1ydNKhW1Bsei6nKV59W6SGTGcc+qRvJnyvJS0WRwXf
	jY7QsU3uMK/MVAd5FQndy0g9G0bPAiA==
X-Gm-Gg: ATEYQzzo/q9eaTq9w209pqVRdT76CLxCMD0pyo4WlLVzRIgg2eMmi0mSXjuwb3UxNbZ
	LsZn6Mxhhad+yF3iJ6+QxcfNTfCA+anPK1DLd30tVfuC0d7KCaetYWS2DAVMRUCnL5+qXpRY4v/
	ai6Zlqs4OAD4EYOD9Uh0t0h16Kemm0LQvphpC3+3rPn8g0747+p9s8eDehTwUiJYPcc1yQU0W3V
	JVDgGMkUgTQbGEKOvADG4NS1cf3tEt7D+N1tOueiD2JrPrcBJCE66gZOXdxIHb6joHa5WsW2NN3
	zqcyfKAk/bwlrDCb9ISK8GSvB/X+7k+qiy7OUwMv73BWOLEGG/EmMZI3vv6+OPIqGcxE
X-Received: by 2002:a05:6a21:458f:b0:398:791a:9caa with SMTP id
 adf61e73a8af0-398c5ec806amr1236794637.18.1773207780121; Tue, 10 Mar 2026
 22:43:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
In-Reply-To: <20260310200513.2162018-1-sanjayembedded@gmail.com>
From: Luka Gejak <lukagejak5@gmail.com>
Date: Wed, 11 Mar 2026 06:42:48 +0100
X-Gm-Features: AaiRm53yOPVigtTBWqUrHQSRYbaimfIQ_tKWwOGhPWuEPWqnKrEs0Ob5KWiVmFM
Message-ID: <CADRnA90=F5rRtWWJtSg7mA_QLzQa5Fzh3s2RzXDJtOOTiitzrQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] drivers: Simplify cleanup paths using __free
To: Sanjay Chitroda <sanjayembeddedse@gmail.com>
Cc: jic23@kernel.org, m.tretter@pengutronix.de, mchehab@kernel.org, 
	p.zabel@pengutronix.de, tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com, 
	yunfei.dong@mediatek.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, johan@kernel.org, elder@kernel.org, 
	gregkh@linuxfoundation.org, pure.logic@nexus-software.ie, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	kernel@pengutronix.de, kees@kernel.org, nabijaczleweli@nabijaczleweli.xyz, 
	marcelo.schmitt1@gmail.com, maudspierings@gocontroll.com, 
	hverkuil+cisco@kernel.org, ribalda@chromium.org, straube.linux@gmail.com, 
	dan.carpenter@linaro.org, ethantidmore06@gmail.com, 
	samasth.norway.ananda@oracle.com, karanja99erick@gmail.com, 
	s9430939@naver.com, tglx@kernel.org, mingo@kernel.org, 
	sun.jian.kdev@gmail.com, weibu@redadmin.org, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_224301_637637_EB2A3146 
X-CRM114-Status: GOOD (  16.36  )
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

Dear Sanjay,
Would you mind explaining why you put so many people into TO and CC
fields when sending patch series. You should stick to maintainers and
reviewers from maintainers file as others can still see it on the
mailing list(that's why you CC kernel mailing.list related emails).
Sincerely Luka Gejak
P.S. If you are including me in further discussions or patch series
please use luka.gejak@linux.dev instead of lukagejak5@gmail.com.
Thanks in advance.

On Tue, Mar 10, 2026 at 9:05=E2=80=AFPM Sanjay Chitroda
<sanjayembeddedse@gmail.com> wrote:
>
> From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
>
> Hi all,
>
> This patch series replaces manual cleanup and explicit kfree() calls with
> the __free attribute from <linux/cleanup.h>. This modernizes the memory
> management style and simplifies common error paths without altering any
> functional behavior.
>
> The __free attribute provides automatic scope-based cleanup, making
> resource management clearer and reducing the chances of missing cleanup
> on early returns.
>
> No functional changes are intended in this series.
>
> Testing:
>   - Compiled with W=3D1
>   - Build-tested on i86_64
>
> Based on:
>   <linux-v7.0-rc2>
>
> Feel free to share your valuable input in context of the cleanup API.
>
> Thanks,
> Sanjay Chitroda
>
> Sanjay Chitroda (7):
>   staging: greybus: simplify cleanup using __free
>   iio: ssp_sensors: simplify cleanup using __free
>   iio: st_sensors: simplify cleanup using __free
>   media: mediatek: vcodec: simplify cleanup using __free
>   media: chips-media: coda: simplify cleanup using __free
>   media: allegro: simplify cleanup using __free
>   staging: rtl8723bs: simplify cleanup using __free
>
>  drivers/iio/common/ssp_sensors/ssp_spi.c      |  9 +-
>  .../iio/common/st_sensors/st_sensors_core.c   |  7 +-
>  .../media/platform/allegro-dvt/allegro-core.c | 95 +++++--------------
>  .../platform/chips-media/coda/coda-bit.c      |  4 +-
>  .../platform/chips-media/coda/coda-jpeg.c     | 39 ++++----
>  .../mediatek/vcodec/common/mtk_vcodec_dbgfs.c |  3 +-
>  drivers/staging/greybus/camera.c              | 27 ++----
>  drivers/staging/greybus/loopback.c            | 35 +++-----
>  drivers/staging/greybus/raw.c                 |  6 +-
>  .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 13 +--
>  drivers/staging/rtl8723bs/hal/sdio_ops.c      | 37 ++------
>  11 files changed, 78 insertions(+), 197 deletions(-)
>
> --
> 2.34.1
>

