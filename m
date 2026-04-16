Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE1D0F8D75A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 15:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8zH9hi6FYBeNQQuf6UwLY9hmQzsEbubp5EckZRTMdhg=; b=xCg1ukfS0sReVnvbnCjY/ppJG7
	XhNuqctRUv38xZwhy7PD8L+zVbXtJwsJx9c2Pd0FQLTT/nhYhYKRjGtYDqLly5q1GXK2j4Mrfl+0R
	yP2HyldlGxOH6k/ER9Aou/jG6mfGAgUvc35UxltTbHMOIipLlhxi/B75nRMVSOq97BAZb6O8615Kb
	WpUsr9WaPdv8VoXW63p8Jk+G1+itQUtExySN+FwSY1S/1c0gCKJDE0N+hfMsGcRcqFc6TEuauHwHR
	R0F9vbqtxsmg/kafh1bI82e/1pfeZ1sPeDYQHFGCy5M8U+8Upsam6JyJn2amPTtYBq08Lo2o7m3l+
	nBVcP5pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDOlp-00000002d7i-19S5;
	Thu, 16 Apr 2026 15:36:45 +0000
Received: from mail-vk1-f174.google.com ([209.85.221.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDOll-00000002d6y-32RE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 15:36:43 +0000
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56d95bc93e3so4821517e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 08:36:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776353800; x=1776958600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8zH9hi6FYBeNQQuf6UwLY9hmQzsEbubp5EckZRTMdhg=;
        b=TlQI1KU30bY1F9QUB4W96Ct4RjFdWYc/AM9mshvFOSW6ycy+kNO3Bs6pdcUSDUoQ1Q
         AUET/2FulSoh+FWEE5Z/Exm/WNjUJFwzBUSGDlcwFCiEHL7ZW2hix5X3/k5KfvhaoIc9
         IYXlVrqe9JFoaqw7gxSMuPd0ok4dP+LBPs+c0qHpU7W1Si4jhv1YPt+MFE/RrMROiCZt
         7o+XrvfueX6sCChAVC1zTIp3r1ONdgPUt9ufSNpSsyt6Mu5R8BCb+vE9X98eWAds5gVi
         2J2VLt5WO6jJM8W7PTDkCa3Xcocirs80f+3MOogxDBqinRFbqCxYM5V1D11jBlOHtABS
         s8Bw==
X-Forwarded-Encrypted: i=1; AFNElJ/v6hgeAJh6VCmRuMcskt+kiChFti3SZ7vqKWwYh9QUSLYvxlG80XMSAAIZfwhXRomD+VhFH8KDpKRozb+MZptM@lists.infradead.org
X-Gm-Message-State: AOJu0YywxaWybS9NZoqhoHzlZQb7SU7JQLhPy1VPX+E28p9L3Ik1qqYD
	XkcZ2POL0uPBV2msoyT+ssQoOvBFOW4mzAiUL9bCuWek4PiD27LcSIEASacOBUmx
X-Gm-Gg: AeBDievmW/wbHBellCLMPcqIT2z3yhj0GlzAp7zVJ127YgvNSdAM4g0BpMsERGUjIik
	WGfimjAt8L3kPbhKuK+8kR9mpS7UBOSz3xiPadeVZ6GfU//8IMecbIGtL83c0Xup4n3z1XYLbVQ
	CAHYTIpbW1PD4gR+GTCsc0p5ZubIvjg4nQ7/fQd3GAuSHpIh686ZTs0KZzORIJTXBLgdq46USpM
	JgCSSRIMPa+8lS1emJhPyvU5YoCNwrCqNVwkdb228K+J/WGLxe4BarYYQXi8Q3Go4EvQ3CEpDJ2
	S6BmTb4cd/DOAaiK9Yib9aP812qLAZbGnjfQ5Dk6079afo2uceFxxEaVsJBBiNMdjKibLavtPzR
	DJ6TY4mH9loaAc6enNotdWrol+gQyaNryfKpK1ZYMXe484fU2lU2G84KHtINDNtc9HScd4flC8F
	eqto7Vx/BPthb+8lZ0jLPR05iOrAI7fgBmlLPSpWe7aGeZUbe1IAvW9/d1e5cc2ud4maBqL3MwZ
	W0=
X-Received: by 2002:a05:6122:828d:b0:56c:d862:37dd with SMTP id 71dfb90a1353d-56f3bd131camr14190620e0c.14.1776353800032;
        Thu, 16 Apr 2026 08:36:40 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56fa20db746sm176247e0c.3.2026.04.16.08.36.39
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 08:36:39 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56f75445470so2219437e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 08:36:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9TfSvuIGJpuJQAux2nrQHuka9F2zKMbj2/k1lkef/LowIRvWpwFwj19RaqxCrjBmds/AOXnCtBZ3yFF5fFbIIs@lists.infradead.org
X-Received: by 2002:a05:6122:828d:b0:56c:d862:37dd with SMTP id
 71dfb90a1353d-56f3bd131camr14190502e0c.14.1776353798877; Thu, 16 Apr 2026
 08:36:38 -0700 (PDT)
MIME-Version: 1.0
References: <459d360a8332f92b3766b30814e7e1c76169aaf7.1767719254.git.geert+renesas@glider.be>
In-Reply-To: <459d360a8332f92b3766b30814e7e1c76169aaf7.1767719254.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Apr 2026 17:36:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVOQX5LLWPxhXdg7ZsnbKF6qW3OOz5Gu2j95ij50aJt6w@mail.gmail.com>
X-Gm-Features: AQROBzCrrciH5Y9cjKT2tkJaRWMpjlRUqFQfN6t5xgfDiDoLUiDQUyEP54r5jSM
Message-ID: <CAMuHMdVOQX5LLWPxhXdg7ZsnbKF6qW3OOz5Gu2j95ij50aJt6w@mail.gmail.com>
Subject: Re: [PATCH/RFT] arm64: dts: renesas: r8a78000: Fix SCIF brg_int clocks
To: Khanh Le <khanh.le.xr@renesas.com>, Vinh Nguyen <vinh.nguyen.xz@renesas.com>, 
	Phong Hoang <phong.hoang.wz@renesas.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_083641_793570_55F98B18 
X-CRM114-Status: GOOD (  19.43  )
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

On Tue, 6 Jan 2026 at 18:09, Geert Uytterhoeven <geert+renesas@glider.be> w=
rote:
> According to the documentation, the internal clock input for the BRG is
> SGASYNCD4_PERW_BUS=CF=86.
>
> Fixes: c13a643e2c491f5b ("arm64: dts: renesas: Add R8A78000 SoC support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Untested due to lack of access of local hardware.
>
> This is consistent with SCIF on other SOCs, where fck typically runs at
> 1/4 of the speed of brg_int.
>
> The correctness of the clock rates of the various clock sources can be
> tested by forcing the use of  "fck", "brg_int" or "scif_clk", by
> commenting out all but one of the four blocks below the "There can be
> multiple sources for the sampling clock" in drivers/tty/serial/sh-sci.c.

Confirmed on actual hardware, will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

