Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298F7F53D6E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 16:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gxIv5A/7LppNvLw/5xO3s1KDlHKvNsqys1mKlpYe60I=; b=1C/4ACqSkOk0kqwc4WX3G4CacF
	/lnvrRTHBrmM6w8BvzaEGwZ7AU6QbKilnEL+gBy96sE8YyytIlIo8Qh9hBOttGdEOCa7lUB1rCtFn
	o1HLXYMVW+WUaT5rldscJ37qIfeZeF46wxukG25tN5UIpkUIoh+jPXQ6sWz3ejdCmzcRZ6jaGhTor
	nEZPWetsPtneDjG+OcZQiAKu60ko1eumUOnnII3oTk1RWKKSNuOi1d4aQT3EUIAfKVLsiN+1vjWE9
	wy7dS750yg2YMYIrFqmRKd/42JGPwcxJbIq2H3cx6/rgET0d5KgaSqjAxZsbZijpfBtt+YhxX7ipz
	IZyUsTSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2AOU-00000004PBl-04KU;
	Mon, 16 Mar 2026 16:02:14 +0000
Received: from mail-vk1-f174.google.com ([209.85.221.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2AOS-00000004PAd-0C96
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 16:02:13 +0000
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56b955696ebso102486e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 09:02:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773676931; x=1774281731;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gxIv5A/7LppNvLw/5xO3s1KDlHKvNsqys1mKlpYe60I=;
        b=AxSGwY2ip8FbUZfWPu9umnKr4p2r/NFRw3h8CzEv6xBoDmJnb/Mnya+9wnqa/yAmBL
         EBFC+3GTmYZY16Qp9u8EI2uxbhe6HsgbdNqvOfSJvRK8SFYPuaNDbDfmO82qQD/HFPb0
         2iF/S5+oWkdtLmKKB8riBduIdxqaeQu/UbY526XMwqenqoDqpsMdDaBwNA7avp/YTjV/
         pYmude8NnukgC0Gq06ry6UPd3IriASPY9QGPerYMWmLwzJ+8V8zElP9RiYOxtB7iJVYo
         FyTyEcMWfBJCfxq9JN2XokmayctnuntJgO8jepbpSNE0lVoNePS2I+MC+oOE+L151fDb
         5PNg==
X-Forwarded-Encrypted: i=1; AJvYcCVKVjzrl7fCTxinhF7oTAwv5IIgMjp69f8nNK4I4Ccau6sGVLz8ZcciRME0MpOEdcoTm4m51noXk1fn34I8J1q/@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4QMEM+7sjmgcIdYsnQSoGdPnk/G8W9zBM7MYlk4Yb3epQlFEF
	ctlhTPraYxlNZ3eGS1gEMbCgZRKOhgh/5oHUxC4wIxqVPZJrIu9eA+BPRIEfNfsd
X-Gm-Gg: ATEYQzxhGG2vQlNlqJMS4TkJWpfzyXCCGAOQoGQmAlm5ARrxRNinlYsMEPu/9IKhmGJ
	7CxRxeWyT1gbG+hAtJvChCpIgNGRbwbO0dH8zP4Ug8MRMTjcDLGE2hZhP/jmwsDyzaEhsqIkXTv
	nhzR3Nc+81Q0ByQDsnfg8IcKtZ+dL8WwN9LoQF/QH5f8p2dGDm3T+nqXlbVTJmy8MkGh/PJnDcM
	LOuMjnv9rNFWS7HDLhl0WA3JawrvoKvXziDEGBIUjw9ZIkvcG05znt8z6Zo2uAuTt8A04R/rPxf
	3M/3NFbGqvsWDwGtMA4nyVoiimyYrJmQeLNH247PHIZxRy9RfwjQxmzQI82Xnxo7okkUa+BwAK4
	g3RW1xdGmdBix5UGzm4xe6ipUn9CMyWQYAYZQClXD9lw9kjDZafxBEXomeEb7uO47fQ9cK+CBNC
	rAhVPxYGFMlLrr42n+X5CYCUTTTtQFvcxS81D7EhMntjd62A+HYH+f2S6TTtv09d8A
X-Received: by 2002:a05:6122:2ac3:b0:56b:7252:cbbe with SMTP id 71dfb90a1353d-56b7252f14cmr2576867e0c.15.1773676930381;
        Mon, 16 Mar 2026 09:02:10 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b84300190sm1838756e0c.18.2026.03.16.09.02.09
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 09:02:09 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56b65ef9441so2664257e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 09:02:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX6Yk9GUJGNgMR3TXhJRnpcfovetS/C5g0nDO9n8kc/MLThiLc3ImyvMTkUldlpu065WjKdlj9V5T93kWdNQumN@lists.infradead.org
X-Received: by 2002:a05:6122:35c7:b0:559:6960:be0d with SMTP id
 71dfb90a1353d-56b62971a27mr4668648e0c.13.1773676929318; Mon, 16 Mar 2026
 09:02:09 -0700 (PDT)
MIME-Version: 1.0
References: <51de914cddef8fa86c2e7dd5397e5df759c45464.1773675224.git.geert+renesas@glider.be>
 <abgn70W3kYZcZpg_@pluto>
In-Reply-To: <abgn70W3kYZcZpg_@pluto>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Mar 2026 17:01:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUb0=kMhCWk4tD4dJTGvSp8fShO=4xM8k6iqcYU0-wG=g@mail.gmail.com>
X-Gm-Features: AaiRm53uOIxgf_DJ9NKvMNXm8lHCsReBFW-7ybb2n7U6nhLuqhnqvVgwyg7V9po
Message-ID: <CAMuHMdUb0=kMhCWk4tD4dJTGvSp8fShO=4xM8k6iqcYU0-wG=g@mail.gmail.com>
Subject: Re: [PATCH] firmware: arm_scmi: Support loop control in quirk code snippets
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_090212_087245_37915F0D 
X-CRM114-Status: GOOD (  24.39  )
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

Hi Christian,

On Mon, 16 Mar 2026 at 16:55, Cristian Marussi <cristian.marussi@arm.com> wrote:
> On Mon, Mar 16, 2026 at 04:34:40PM +0100, Geert Uytterhoeven wrote:
> > Each SCMI firmware quirk contains a code snippet, which handles the
> > quirk, and has full access to the surrounding context.  When this
> > context is (part of) a loop body, the code snippet may want to use loop
> > control statements like "break" and "continue".  Unfortunately the
> > SCMI_QUIRK() macro implementation contains a dummy loop, taking
> > precedence over any outer loops.  Hence quirk code cannot use loop
> > control statements, but has to resort to polluting the surrounding
> > context with a label, and use goto.
>
> I was just now writing the quirk for the Renesas issue and realized
> this limitation :P
>
> Do you want me to pick this up with the quirk template for Renesas issue
> that I am writing and post all in V3, or you have already the quirk too ?

I do have a preliminary quirk, but I don't think it is ready for
merging yet.  Getting this limitation relaxed is something that can
already move forward, though.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

