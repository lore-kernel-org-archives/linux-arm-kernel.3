Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E7BDC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 19:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fbrBbtetW+eFSRSujFwF+D0y+0c8n01YuDApoGFtoHM=; b=iRp/GNu96fmzVn5vMjy35EB8dT
	3mM+wWpybgCGb9FRi4RQgOt1dHcdL3cH5ivFu0MM0hGX7JwymSZvD+68zlDVLfpeQ8tPNAkUOlZ9a
	kp5VYu2kyjdNxu7+KeoboIjCMPQdS27dNN/N/4ZkJaaz3h/Gg4ljwXCsjaVSaRWxrJl4MwL7bQBek
	KymAVRTrjFal33fUf/RBo7lZMpEa/I03K0XQ5iRP23dI65ffMUYRrso56B67DM5oRwHJPuGoBgz2u
	B+hQ02qdyhLaZnCfu1OIMd9cmRDhgUxrdfIukglSG7YutX4DuBi1oN+cYCg7blu+fZQbB4To0Ydny
	dlmdV7qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdaPV-00000009Vmp-2qJW;
	Thu, 30 Jan 2025 19:41:09 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdaOD-00000009VdZ-1Y6t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 19:39:50 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4368a293339so13995235e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jan 2025 11:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738265987; x=1738870787; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbrBbtetW+eFSRSujFwF+D0y+0c8n01YuDApoGFtoHM=;
        b=O+71QufoPB2FZBnp8CO6kUwbtEYiKzJxVXy1hdrQTXIbT49k8IAp9s4CbGfB8EVscW
         watMp9x8IcocmpQhNekLJYYtsOSOqI6YN9p4mwa23h+UGdq78LWZD5JabczSRUmXYSE5
         7agq2Cpblf6CuAtIgnhlrLFPPiyc9oDojUXcJ60bL8q1g+809wg5SX2shlt1X+x88v0T
         ywEnYmvHarBFWj2zi2gNDfwx3N/U8QPmN4rwh/Ry3gXTZGEnh5fgERZcB4I7mqcVfp2W
         IPbdKnMXnN5qqLSHMGHnbIMvg7pD8SEtwgBEOOuQ6Q1Uf670gMVffKy0kKisldm0O6sC
         6gwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738265987; x=1738870787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fbrBbtetW+eFSRSujFwF+D0y+0c8n01YuDApoGFtoHM=;
        b=qQp/y5CbsPLUO9RV2QeEhx41RyVx+aNHoTpznVU1NsKykLGpuPhRf4h/o4qdEesoK+
         S/CvlLW260Eu6YB+1IMBd/LbAglZj4JhxMbIg4RmWN2oHsecJuTyUR8GFTl9a53xYwbQ
         UHblpoZqWl0IXj7yLpNqr+OIJvQbwmxI8hBIAXyZFzxEqD9yfhHc+RB1bq4X7mVpf1al
         ARF/das3IWAWPDmgMc/xLt1Kk2A8574S9r6fDQGdWq6y90wo2dkCEEhz676VPVfr+N5r
         +C/ifkuXJCU85yYdWtLKgPTHdKGIfy/yqb1dgTJgOtfGDuMX1xNmFj+TRvv5LezWx/eg
         KjWw==
X-Forwarded-Encrypted: i=1; AJvYcCWxD88tsZLlSjGxIx7K1vt4q8ZC2XycdA93/r0MMEnZVUFtgWb7Iqhx0d8qQAT2Hx0K9SFXWbTEuHE5OwO9+9eQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyXyn6t2RS9Kj59BsWhPUXk9QvoP+Wwlm+xLfqaa/S1u5mUJ1VE
	GOpddQOegQbbvfyKcaxUkbHvxajQNYHZE6RkkWfFAO0hvIjXA7cI
X-Gm-Gg: ASbGnct8VcvCGN0GFE4seofbJUmSS6bamN7mbaRRWV7U7wLbervVyBhn/5ZbYzVHi6o
	rYCXhELajneKNPhNxvzOG3y4zbXwC0fZ5eHy8PUXWlRfOGaG/n30oLFtvMRbSJ7rkbNRCDM/tw/
	lqBKN0RDnfTc093vBC4vu/Z5oFa5dcxlt6zUc1wfrU4bT/y/xs/PasnAxH9qKDWLgRJBL7zyYxC
	B44dEe3UtbSOiyepem7mwVaBEMorWOOF4rO+R6HOuW6Y01KEIobAX3fc8bCj0g4urhqdJEpf1Qr
	/WK7UWOuWsRE9Zzj6wZjGxrmrbN81dvJPCTM6U/sI7Hf7PLv0GmOqA==
X-Google-Smtp-Source: AGHT+IH+dsWzoPqJ1FZkEn31AznVDwohTc/WMVbBodZ7oPmqAAzLBa26jUpO3bFpM05kGf7eu9Dy3w==
X-Received: by 2002:a05:600c:3501:b0:434:a7e3:db5c with SMTP id 5b1f17b1804b1-438e2446708mr43887285e9.11.1738265986805;
        Thu, 30 Jan 2025 11:39:46 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc2ede0sm68629125e9.21.2025.01.30.11.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 11:39:46 -0800 (PST)
Date: Thu, 30 Jan 2025 19:39:44 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: lkft-triage@lists.linaro.org, open list <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, David Laight
 <david.laight@aculab.com>, Arnd Bergmann <arnd@arndb.de>, Dan Carpenter
 <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, Ankit
 Nautiyal <ankit.k.nautiyal@intel.com>, Suraj Kandpal
 <suraj.kandpal@intel.com>
Subject: Re: linux: master: x86_64: gcc-8: error: call to
 '__compiletime_assert_909' declared with attribute error: clamp() low limit
 dsc_min_bpc * 3 greater than high limit dsc_max_bpc * 3
Message-ID: <20250130193944.478cae8f@pumpkin>
In-Reply-To: <CA+G9fYtNfM399_=_ff81zeRJv=0+z7oFJfPGmJgTp6yrJmU+1w@mail.gmail.com>
References: <CA+G9fYtNfM399_=_ff81zeRJv=0+z7oFJfPGmJgTp6yrJmU+1w@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_113949_417274_27EC79C8 
X-CRM114-Status: GOOD (  16.04  )
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

On Thu, 30 Jan 2025 15:01:21 +0530
Naresh Kamboju <naresh.kamboju@linaro.org> wrote:

> The x86_64 and i386 build failed with defconfig with gcc-8 toolchain due to
> following build warnings / errors on the Torvalds Linux master branch.
> But gcc-13 builds pass.
> 
> First seen on v6.13-9485-g72deda0abee6 on Jan. 27, 2025
> Good:  v6.13-7644-gc2da8b3f914f on Jan. 27, 2025
> Bad:  v6.13-8265-g9c5968db9e62 on Jan. 27, 2025
> 
> i386:
>   build:
>     * gcc-8-i386_defconfig
> 
> x86_64:
>   build:
>     * gcc-8-x86_64_defconfig
> 
> Reported-by: Linux Kernel Functional Testing
> 
> Build log:
> ---
> make --silent --keep-going --jobs=8
> O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=x86_64 SRCARCH=x86
> CROSS_COMPILE=x86_64-linux-gnu- 'CC=sccache x86_64-linux-gnu-gcc'
> 'HOSTCC=sccache gcc'
> In file included from <command-line>:
> In function 'intel_dp_dsc_compute_pipe_bpp_limits.isra.80',
>     inlined from 'intel_dp_compute_config_limits' at
> drivers/gpu/drm/i915/display/intel_dp.c:2547:3:
> include/linux/compiler_types.h:542:38: error: call to
> '__compiletime_assert_909' declared with attribute error: clamp() low
> limit dsc_min_bpc * 3 greater than high limit dsc_max_bpc * 3
...
> drivers/gpu/drm/i915/display/intel_dp.c:2506:25: note: in expansion of
> macro 'clamp'
>   limits->pipe.max_bpp = clamp(limits->pipe.max_bpp, dsc_min_bpc * 3, dsc_max_bpc * 3);

The code is:

static void
intel_dp_dsc_compute_pipe_bpp_limits(struct intel_dp *intel_dp,
                                     struct link_config_limits *limits)
{
        struct intel_display *display = to_intel_display(intel_dp);
        int dsc_min_bpc = intel_dp_dsc_min_src_input_bpc();
        int dsc_max_bpc = intel_dp_dsc_max_src_input_bpc(display);
 
        limits->pipe.max_bpp = clamp(limits->pipe.max_bpp, dsc_min_bpc * 3, dsc_max_bpc * 3);
        limits->pipe.min_bpp = clamp(limits->pipe.min_bpp, dsc_min_bpc * 3, dsc_max_bpc * 3);
}

with:

int intel_dp_dsc_min_src_input_bpc(void)
{
        /* Min DSC Input BPC for ICL+ is 8 */
        return 8;
}
     
int intel_dp_dsc_max_src_input_bpc(struct intel_display *display)
{
        /* Max DSC Input BPC for ICL is 10 and for TGL+ is 12 */
        if (DISPLAY_VER(display) >= 12)
                return 12;
        if (DISPLAY_VER(display) == 11)
                return 10;

        return 0;
}

Although the little functions aren't static the compiler can assume that the local
versions will be called and inline them.

It can then move the clamp() code into the conditionals in
intel_dp_dsc_max_src_input_bpc()
It then sees clamp(limit->pipe.max_bpp, 24, 0) and quite rightly complains.

Broken by 160672b86b0dd

	David


