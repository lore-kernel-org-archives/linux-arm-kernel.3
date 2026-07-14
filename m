Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D563DC44507
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 07:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4otLa0osIIgCWg6PJhWGRKAbFh1CF4DbrLX8uzqDyWU=; b=nKQ2PACpJLukQ8i3uQPsOIAdA3
	jicNBUtzLQSF7eLbj+A5iXDg+6Edmr0n4oXYD5xiGW5AayM+dgzTjcxAKM96jl4FxrUcm4nuue5tV
	hElC9QZdK6w3TArJGu8uc6kIeYwyIa7ADfekeGDdfA3Xb4fVeO5ccpx7Rt9qXaNRcbNsIgBmzDf7z
	sH3vo3qkcVdYtt44xNXfJlSIhU5NlGAa39qM7vF/HBHjFlDbmqPi2lDybynh3Aeb6DCaOiUwVRpWd
	Zr+k/JUxhocQGBHTKKfygf4z/XwYZFac77W5Lx9ykJnMlP0WlymhEoIcu315nmwvLzp233gEnkqmZ
	VT7rrN2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjXUn-0000000B9Rn-3Vla;
	Tue, 14 Jul 2026 07:24:01 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjXUk-0000000B9Px-2xZU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 07:24:00 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6986287534eso7210713a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 00:23:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784013837; cv=none;
        d=google.com; s=arc-20260327;
        b=bG/pKICnLs1RfJXIQuCHGI4vElROuhIZgVcdpIfEviydYflv0AFkucMPc8rlI7Myj5
         Q4+B6F2m+MpQPBizLVMJ5LAyI8/EuGh1MJpXNuyXldEHd+wY+ADKAdExlYvZ3a50P+32
         izSmHxoDXm6+PfZcOtTpNRePMStRcDj3oBn+0+GgDdaQ6/KB3SKbjvhJcIDa6DX3ITsq
         +TQ8fW7gxJv3AYRcoWWIeo+G/nOH0S724La9Sxf070ThTXZGiNggl7pN0Ii7DJQXMNCx
         u3+Fq6Ayog0pNvuztXnp+qtQMYqa27vgCW53v22T3NZfJBpwfJvG9NkI4j4CyCWimWOX
         zUcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4otLa0osIIgCWg6PJhWGRKAbFh1CF4DbrLX8uzqDyWU=;
        fh=/lA2edQgoz6jtsYuO0zJk8XqR7KgsSaPe7f+2gtqiuk=;
        b=Lma4umjgBdK+tgInOKIdBWa7hYAibnBhDq6Ra1T1YvZd/d04V0YcQ63MdAARFV4S22
         t5Jo+mUykb/+Xth4/Puo1h/MxUxybIrLxMA2gh/frByNQnxn5U9ilY5sUoF+tXhdYOPl
         7+OpnNl154SVjsz5meYdvMGB/GQuCveDKP5BeeqDeAAF2FjOEbQW0bLP7wO/ZWFWxguD
         vOEKa4/ZkSzuv7fauLhPAXJQdM19TBYITNvMawRTxWuKhBVwRg9kAc9xAwI+/grVUFWH
         xAxD3fkMK6sF/Syc5fB5XXVdWBj/ahpd1AA+04INYDlB6Pc0PVCkaqoA32ErkGhaaqdM
         JgMA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784013837; x=1784618637; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4otLa0osIIgCWg6PJhWGRKAbFh1CF4DbrLX8uzqDyWU=;
        b=P7TDkKVKWO7naUhb1jUIT3Yk+zG9DYkWxZoIa7L2OodtilS6SWK+qC6dXQnamGPFl5
         XbjiVexydPASQtytHW4zHwSEHuNlaGqgks/qmv15DrCGXL121bwvooY0kEhA5HX2B8Kx
         G4zw7KTv/FMnqWO56qAXdpstU/PRl3RfZm0XZPJvQkzASsJL5avnJdFGPLB8zziDSJ7B
         tvDKCC81l9xS/0lwj4LBqQLUj8jFdyUQDrSHztCwjYGc/yJLxN22DPqHjHF47Qujp0iF
         JPJQFL4MeEsH1JAqJYrLQt/6TkcxlgZvVYtx/H7vD6FfER6vGgiBUHlXvQSaVgG8zgso
         OuXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013837; x=1784618637;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4otLa0osIIgCWg6PJhWGRKAbFh1CF4DbrLX8uzqDyWU=;
        b=BNFXEfiwmaywG0yMSbY7rmMLWAfotuS2kQ26pBiksZz+l+mMuetL5la5Wy+2WEVmSZ
         FJohsoPPL9BF0bgxnr81weGxlIoFv8L4wxi3ocNc4f9KL+oFPy4ebvwiBdRwb/FyvTTN
         iMIwYftYJJJ8Z11kZdAYJ8GHzhoqD4oytnXCojPthMFOWhLTCZE7ImmppjnxB6ZQre4i
         8ypl/ybcwG49KHsetuPltC5Gymneug/FBHWUuQg4vuHA3xnhfLcWWXm3LQo/FZA1kAc+
         V7BJKFdRf21ccjNMEJC+6LSO/6popyxalUMTZqVPe2GR3bKAUr726LtGMvmS1Z7Dc5iX
         nPRA==
X-Forwarded-Encrypted: i=1; AHgh+RrbTV+yT8D48GAyfxuGBNZeb6uCV99EEtnB0pc1rhLLX2XAk5mmQyV1w6/4jim2Z4Xk//k6dNUAyxu+Vueq0pNy@lists.infradead.org
X-Gm-Message-State: AOJu0YzsoPiJpMJUKZP/r50Ezz7fhc934aZ8fopTf6a1IjgyapSUoWCC
	pOAncNixxPAHZKidEMHH8/MqFLklfrPU+opUKRhnqJDDH915s93pIQQ5s1IiYKcooka7OT+CrRc
	v9DTlgF7oBSFuHosvfi9cHhhUUKSH1Gg=
X-Gm-Gg: AfdE7cmX/6Vss6QwfLt2fu9SB2L0dsNNz2N7hYYjeBDFj0K0dCZ9yUFwXHZnCfuTSMZ
	KdLxqzScR+aKCtiZ3LYmoexoWR53xhGSnbIg2apdKDIuyzlIX+aOSiuL5TJovHgrKLTQnoH5icO
	iMxby7V7aCbA6y6SsXxQkaEsExPsvZBrmmY/LgAnwEN4FdOPC9QnUc34KtuPvK149S3DuOZPYn8
	Mb1lF25yn23DbD3C9EQipRs2DMQbGqdixGLAT78AWd2GuJ4DEx9RfGdLcoLJpjr2kQi+8Reh335
	p458Sg==
X-Received: by 2002:a05:6402:e94:b0:698:c13e:179a with SMTP id
 4fb4d7f45d1cf-69cd2a001acmr1004913a12.10.1784013836409; Tue, 14 Jul 2026
 00:23:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260713120840.17427-1-linux.amoon@gmail.com>
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 14 Jul 2026 12:53:43 +0530
X-Gm-Features: AUfX_mzvXnkQt9N3uwj4z53r62LfKGSebrr5Wzfs3imVuOH5yaZKNS9xAf_UWqU
Message-ID: <CANAwSgSz+e483m9VKkFZzSKzB1Tsd8kS20UcB3ON-cZ=J8gX+w@mail.gmail.com>
Subject: Re: [PATCH v7 00/19] media: meson: vdec: Fix lifecycles, race
 conditions, and stability bugs
To: Neil Armstrong <neil.armstrong@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"open list:DRM DRIVERS FOR AMLOGIC SOCS" <dri-devel@lists.freedesktop.org>, 
	"open list:DRM DRIVERS FOR AMLOGIC SOCS" <linux-amlogic@lists.infradead.org>, 
	"moderated list:ARM/Amlogic Meson SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS" <linux-media@vger.kernel.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>
Cc: Doruk Tan Ozturk <doruk@0sec.ai>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_002358_770177_BFBE6A4B 
X-CRM114-Status: GOOD (  22.70  )
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

Hi All,

On Mon, 13 Jul 2026 at 17:38, Anand Moon <linux.amoon@gmail.com> wrote:
>
> This patch series addresses a collection of critical race conditions,
> memory leaks, use-after-free bugs, and resource management issues
> within the Amlogic Meson video decoder (meson-vdec) driver and
> associated components.
>
> The primary focus is tightening session lifecycles, safely synchronising
> the V4L2 m2m framework callbacks, hardening work queue operations
> (esparser_queue_work), and correcting buffer validations to prevent
> stability issues like KASAN out-of-bounds errors or stream-on timeouts.
>
> Summary of Changes:
> * Race Conditions & Synchronisation: Fixes multi-threading and
>   execution races across stream-on, stream-off, job abort, and
>   teardown pathways.
> * Memory Lifecycle: Eliminates memory leaks and use-after-free
>   vulnerabilities by safely pinning, canceling, and sequencing
>   device removals.
> * VP9 & Buffer Hardening: Addresses payload handling bugs in the ES
>   parser, properly tracks ongoing buffers via atomic counters, and
>   prevents invalid memory writes.
> * Platform/DMA Adjustments: Adjusts DMA segment configurations,
>   canvas handling, and buffer sizes to match modern hardware demands.
>
> Note on an outstanding issue:
> An execution deadlock occurs in the driver workqueue path during high
> stress or long playback sessions. This stall is triggered when the
> Amlogic hardware internal video FIFO buffer becomes completely full.
> When esparser_queue_all_src runs, the capacity validation check is
> tripped due to a design limitation in how buffer exhaustion is handled.
> This blocks progress and leaves the workqueue worker waiting indefinitely
> on a core mutex lock.
>
> The resulting hung task call trace shows the worker thread blocking
> on the internal lock:
>
> Workqueue: events esparser_queue_all_src [meson_vdec]
> ...
> __mutex_lock
> mutex_lock_nested
> esparser_queue_all_src
>
> I have tried to address this issue, but the underlying deadlock persists
> under extreme conditions.
>
> Any feedback on this new appock is welcome.
>
> Testing was done using v4l2-compliance and active decoding pipelines
> on Meson platforms (like Hardkernel ODROID-N2+ and ODROID-C4) SBCs.
>
> The v4l2-compliance tests passed successfully via:
> $ v4l2-compliance -s -v -d /dev/video0
>
> Pipelines were validated using the following GStreamer script.
>
> [1] https://gist.github.com/moonlinux/08295ba1f17ce7155550773f2d2cb6e5
>
> Previous changes:
> v6: https://lore.kernel.org/all/20260530094326.11892-2-linux.amoon@gmail.com/
>

I will review Sashiko's feedback. I will look into these suggestions and
work on incorporating them to improve the code quality

> Thanks
> -Annad
>
Thanks
-Anand

