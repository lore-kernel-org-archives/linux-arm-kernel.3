Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B30CD4855
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 07:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6U9R02UyT6PCn4mJzYYl/CPWidpbIlIhzjolxdPX7hg=; b=Uf3/W65X+ru/c0pvcHRUp9z9oP
	iBOH1dheHrx46pNoddqzFn4Bf5q2uC8912Uq3W+luS3uZlPd34UsJOpyRa0z/E2GLh5enc1N3hicw
	ItZQHvqyD62kiYrFz/Z3w0zw+PcYXIM+M/tvzZuFmsbHLQplGHG9ZBcWkprb8vSpEiU2a/l+WV3Bb
	mN7MH1nC60qvIPkj2lNxcW9Pdhf3kgJ6mOf/zAZkBC4KeLFdXngRWNUXOJ5udxqCq7KYqmmqFlvCO
	m3y11k8CcmcC3plMlxUXO75Bx2HV8JdHrUyCljZVAF8/xYsJN8J0mS/rpFNV0SKhsbANtsoE2jx+N
	NHuGB3aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMhCd-0000000Frqb-2eOH;
	Tue, 12 May 2026 07:06:51 +0000
Received: from mail-vs1-f47.google.com ([209.85.217.47])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMhCa-0000000Frpz-2qsE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 07:06:50 +0000
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5ff05af29b4so2017351137.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 00:06:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778569607; x=1779174407;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6U9R02UyT6PCn4mJzYYl/CPWidpbIlIhzjolxdPX7hg=;
        b=W4mMYcXEspdpHFS4DngyssbQ1GMPQcx+f7CTkvmmbNjDt94wp5AFBA5+rOja6Q5CLG
         u2tHHGHCGjHKrWDciNY34hutoZuEOqjU8V/FYCp3KXTQcR4pUH/+zgDETR6hN6asPdK1
         t8TA/Dtjz+Gd/qrHWaGSPC2bpOvESO9gaogNo2aV1BKjNLM7fZ8fvRCH0QWjcGYEQ5Zh
         QfDaBq7/DGHwDXqRmjMR13svzSWy7R4LWPPOPiXIbaFamY7rZTi+h3Er1gDT0SC3HqgT
         WeiNuilOel6gRmVxViaH7hn94qdEDYabzJ7VPs/jml5zSuW89NDA96JSXP2d68VNMsmd
         VvKQ==
X-Forwarded-Encrypted: i=1; AFNElJ8fp7dsvArdKQtythpqaqdGLT+JhHk3iHrFy81rYngXdA/mmpHUa3SZ1Kv/yYnKCjRgFXDjgM/6i3RQ9j/6w/2x@lists.infradead.org
X-Gm-Message-State: AOJu0YwJXzNBRdvr4CFKG9R1bTF0/VsCiTfsKxt6u3ZzvkwYSgT9OsDC
	ja5r9E4czIBKs7wKNggyAkmdWlUbGCk1w1/JBnCD8dISgmAcU020qR1lsJYGaFMJ
X-Gm-Gg: Acq92OH5cIQ0FJpw0h/EVBya2TgHovsr6JYDsGe6oJhxD9NpVWfjYnt+4H5o5qGMBWT
	5mOwr1KsFEhTZWKhVCnMJXvglI9UgEcJmPUdf+sPpknCP6xUsNyl11QcIMDfjyxmtIJX2/1F2mP
	N0DuBycuAVOnH6wOzza7982lUdxSrTAmcZTjiwp8+FOq/o2R8ruuhcULS0ljSmBN/WxTYguw6KL
	aa+eStAd0JIDkQLYvjdLy5Tw/nA+myAvhbMUhVlmf6QJ/u9bIYM4bMBJsv3yQ16rmwdVdnVl8Ju
	Uh+sE3hty1b0ClKLytgwHmXMZZx1Lj+EInifvxwGsoHqjnxiUjp1BMv4TEu8Q2HpwCa1d8r3kd7
	TkyDaBCFi1m5dhxViY1iaJLv6uIPnznfkJCpYZlAxqi407gBaGiulpFeRyQK79X90ffVwVrGUMk
	KiOkYgNrSOP49di5g0JCDhGotjpQPva0CeX3qORo3aXsH/y/qCQqZOHP4oA/ltJLQl
X-Received: by 2002:a05:6102:5694:b0:632:6cec:435f with SMTP id ada2fe7eead31-63610fcbdcamr651455137.0.1778569607059;
        Tue, 12 May 2026 00:06:47 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95f219f6fc3sm7250929241.4.2026.05.12.00.06.45
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 00:06:45 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5751e12c524so1793317e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 00:06:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8Ag5UkpqW9HQSfFb3hb9tcmULyQRNYjCtuXMaguempYDhGogxMH7B8TPVxooTlkf3YsETLMosdDAhxuzwsXXTf@lists.infradead.org
X-Received: by 2002:a67:e7c5:0:b0:631:26f6:701c with SMTP id
 ada2fe7eead31-636187cd6ffmr637420137.31.1778569604976; Tue, 12 May 2026
 00:06:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260511211841.284809-1-ben.levinsky@amd.com> <20260511211841.284809-3-ben.levinsky@amd.com>
In-Reply-To: <20260511211841.284809-3-ben.levinsky@amd.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 May 2026 09:06:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXn8G-nJ-=_eVRnZO_1nzWuP-AjTVL5SWH-D1w2F2QVfA@mail.gmail.com>
X-Gm-Features: AVHnY4Jzn5XG3w_TFgzZrTYfNPhFMcAA9wRYKEMGtDIRqvMdxDHMc6dhfvtpVZA
Message-ID: <CAMuHMdXn8G-nJ-=_eVRnZO_1nzWuP-AjTVL5SWH-D1w2F2QVfA@mail.gmail.com>
Subject: Re: [PATCH 2/4] remoteproc: switch exact-match drivers to wc-ioremap callbacks
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-remoteproc@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, tanmay.shah@amd.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_000648_870101_89D4B65F 
X-CRM114-Status: GOOD (  19.41  )
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

Hi Ben,

On Mon, 11 May 2026 at 23:18, Ben Levinsky <ben.levinsky@amd.com> wrote:
> Replace the exact-match carveout map and unmap callbacks in the
> existing remoteproc drivers with the common wc-ioremap helpers. Leave
> the zynqmp R5 TCM callbacks alone because they also clear the mapped
> memory and are not exact matches.
>
> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>

Thanks for your patch!

>  drivers/remoteproc/rcar_rproc.c         | 33 ++---------------

This change also makes sure mem->is_iomem is true, which looks like
a valid bug fix. Do you know what was the impact of not setting
this before?

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

