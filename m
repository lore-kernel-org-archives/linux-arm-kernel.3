Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C8AD6CFA7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 12:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q38jzkPx1g60SamYoKJC73aUm2LWWuKa/1fao66YJYU=; b=q/aZeX70nimfeEF1bdGD8KA1jd
	7hKIvQ9gk4fWWMh6iqfX43ofjz+IZd8kHQShFDlx1g0c0Y4l0NMCsNDIFqrKSZ0uh7ub6T2s/o4V7
	5FCm67FnhJF0RcNow3v89qCVn9KrtMcWUiYWufOAfOZ7v1irIZIvyappPyt2HyZKM24HKCL3zKAaL
	NcQ5fo9vHQ2aMB9aK15RQUXAiwP81DwTDzrlJubhgr7ftLp3fQve/zITadVnUhW6YW+qre20HyP9+
	drA3mAQPz5qIJgz/gEELzATDes2vbX8JENScWwqObdrRzfcfG5ZMDO1DgRJ0wiMJx9vtjFpWD9cKY
	pBIfVbgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjGPj-00000008vBv-1dbe;
	Fri, 23 Jan 2026 12:37:23 +0000
Received: from mail-vs1-f66.google.com ([209.85.217.66])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjGPg-00000008vBH-1bh7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 12:37:21 +0000
Received: by mail-vs1-f66.google.com with SMTP id ada2fe7eead31-5f547823192so417912137.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 04:37:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769171838; x=1769776638;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q38jzkPx1g60SamYoKJC73aUm2LWWuKa/1fao66YJYU=;
        b=gwNTp+iQyqHh0lep0NKoa2XHAcuZeCupbENL/SQK7VQPVbDf/4RmL2aJex5eHILYAE
         4reT7ITR1X37Oj3Ta1xvEx3zskwDeSevTtTXw4qnHlnwLBp6NQ6OOn6+t5tEP4cU7jXc
         sBWioTCsLNc8d8Yj++Mz9CVYVDhwlJv6PMy9WHOMdkuC+pPQTrPLFNjsRY3VGYmSzyDm
         54t5dK4Jy3pcw7duZV/Tu1CukyQmbh4vQIURWnc80RWA3M+r+64tNw7kcNGQyd5WinsG
         HyEonp/Xk/qM89bnAisPpgrpMitmW8AR4JOdh+zA9miBM8wlf02x9lXK2d9iaTtPUDDX
         5ZTQ==
X-Gm-Message-State: AOJu0YxK39CrmD/orN8W0xkjIE3NcBCh48Mu5x09hJy446r31Vx2/2tg
	J8fPROgs/qUK0MQ9ithKp4tOWh6w1awKM2BEVkGGSV4nMjgIUV4BKPQB7B07xjbjMWk=
X-Gm-Gg: AZuq6aIZuDu+Z7Rz+9JQMjpwjQgKkpWt/lJXDRAkHPd5csCRgn6mExg0ypPe2qtZPly
	YyfOxnUTfqxLcFCiQzU6V0Q8bvv3bM1OJTHlfaT6e13D2Qm+Xgduf6H6oa+08GRhEYabgd49s13
	i8R7+/SQapmN/aWSJl6OqB+ghfDenwPWQ51RR4tHRzHgMuUB0JzBuxRuqVrJIth6s0FS3SCHdNe
	lIxVJ8U3VgudHjrfa0nARnNcNVHn1++/us7iRtuIJyl8ePTyUt/N4Xuz99eArzhMCmiXraLUW4n
	Jqb9bzooheWKDjsglhxFKswbyV2Js7OXrBZnFMLJ9sBkdSEy10xMwaJ/UPlNCm0b4wbphuQlvLO
	M/RGOgWtFw4xU6j3WapMfuwbMMwySvcAQdC1Es94LUhzMmi6/xrNy5Q+her9Qv8nCuOS7MsU/mi
	otwASewTATxrPqPGnLyMy67Z/V+TF/ABekiDnAKHK/9LwGTieA
X-Received: by 2002:a05:6102:510a:b0:5dd:a616:69fc with SMTP id ada2fe7eead31-5f54b9e82a7mr762399137.9.1769171838027;
        Fri, 23 Jan 2026 04:37:18 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f54d40ff71sm516616137.5.2026.01.23.04.37.17
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 04:37:17 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5f547823192so417901137.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 04:37:17 -0800 (PST)
X-Received: by 2002:a05:6102:943:b0:5de:db29:5c07 with SMTP id
 ada2fe7eead31-5f54bb837a7mr778264137.19.1769171836999; Fri, 23 Jan 2026
 04:37:16 -0800 (PST)
MIME-Version: 1.0
References: <20260112234642.225993-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260112234642.225993-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Jan 2026 13:37:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXEVbpMS3WHeKM+0ceBe6kL4=n+Cqvx5cMqru8wtBitkQ@mail.gmail.com>
X-Gm-Features: AZwV_Qiqc9hwYXhdCgYeyWKGptEN-lT8NQP_8jN-_ExihaOm9H0gRxTpdmQNyzc
Message-ID: <CAMuHMdXEVbpMS3WHeKM+0ceBe6kL4=n+Cqvx5cMqru8wtBitkQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: Mark OTP and HSCIF0
 pins as bootph-all
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_043720_423112_C40CB792 
X-CRM114-Status: GOOD (  18.53  )
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

On Tue, 13 Jan 2026 at 00:46, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The U-Boot SPL is responsible for initializing the hardware and it does
> also initialize HSCIF0 and its pinmux, mark the HSCIF0 pinmux as needed
> in all bootloader stages. The SPL also uses OTP to determine the exact
> V4H SoC variant during DRAM initialization, to determine which is the
> maximum allowed DRAM rate, mark OTP as required in all bootloader stages
> as well.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.21.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

