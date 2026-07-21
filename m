Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C0CBC4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 23:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kilXo1oxIH6hK33OgqJOAGTQt22AcFxstIL18rwWXUU=; b=qZrzYOKDxyJHM39miO+cMvoxD/
	/4GcDDTVAO+yYjmqvtXwxADPkBq2OR9D0/gWGZMtHuv1IIzEYW7rOy8TsUG09HVIVETWILV7VHiEl
	hV1axy0bzKhswnjvDLQ4RsMtfx1IHt1PYNoQg8H0neXJSMQwGWtNQqWu5uL15A4TO6ndLbakPiw18
	IPE8TLzv+bxZQQ8y3au0Rgu80dcjzLves7mtj6Kc0Go8cbw8EZapfgAPplBtAevMgyEjnDpvIJfja
	opscX265BJw2JUH8sfkbADNtKJxoS5nHgGt/X5yvOoE4FEn8xPvGGpuLJsEQRqmFrcOd8l79p3Af2
	0fCUxPnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmK35-0000000AbST-2h5L;
	Tue, 21 Jul 2026 23:38:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmK33-0000000AbRp-3JJp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 23:38:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784677132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kilXo1oxIH6hK33OgqJOAGTQt22AcFxstIL18rwWXUU=;
	b=iWqzRHP+QJAkUvDa0d/Yd16aEhDo32XotFZLn4ZruE+FXNdKOjujOT8H7s/5amP3AUnjx/
	qZucQY6hXgmNS6+jvuDpO+CgtJBRLjgl+Ev/vAwfe9pb7GOwPZmpbiTIW06KO7OFhxzR3F
	gyxtVIGyrhp4HLTuqjSN/3UDmUYSfN4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-831ct9tsNteNayN_2309Wg-1; Tue, 21 Jul 2026 19:38:50 -0400
X-MC-Unique: 831ct9tsNteNayN_2309Wg-1
X-Mimecast-MFC-AGG-ID: 831ct9tsNteNayN_2309Wg_1784677130
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e695a3b28so1160054485a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 16:38:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784677130; x=1785281930;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kilXo1oxIH6hK33OgqJOAGTQt22AcFxstIL18rwWXUU=;
        b=lBugzyecf6ICOfN6V5FU2pbv+9xHM5P4CyI82wEqHQHEGZEk8mklTiNeS/k4AjfGcp
         bzfblh0GNwpKTfwG6+866L/KOeYNdjkFacmg2HLAR0cQ18mZhu9btrqZhAkV7dwyPCVU
         TPBX6+oLKAGZ+rfxsGurG3Ba+2i5TbqWoFZf6v3TI241sYzfi1pkBj45Q++1JBhZ2eu1
         ukekM2rD4iceWCOg2RWEUCSMWU7bdqZ1xGonYbbjTiEDC2zd7IO+byHvTrs0YUlUXVmZ
         JtXnqndXLseM0uW+V0oyOoVkfH4kcZwc+YVWSZ2JBOzZ2VSElkuVfVt11v7cj8GvGKyW
         XO8Q==
X-Forwarded-Encrypted: i=1; AHgh+RriBicsIBEFtgJIp9bygyM5CMquvWZxxBFePSei6nyTVi3K4IcS9A49bBQhd03X2G28Bv59byAu/JpsjJEKOFDJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxHjACdxvcazZCkCxYdOl6TaaXP0vK1uR1jiJLFVwsk8/5DPZXZ
	2tH2mWle8vXlmHP1pJOdks5bOlfHmAXlYjvkj8F26KHOtS1Bx3jRPWXDeWZt5ozgyK/WdF2J2st
	WrKf4QzLrvwQgqH173e+PaVqkXm6PD1OxDTW1W5aqlVF/Y6DnWuegT+yh7LaLsHNhKYNakZYQS4
	/9
X-Gm-Gg: AR+sD12ARQD3bJr2Ar0Jl5tTryvdjjvrjqXQ0dUW+jvbk18oNm3K4HLifjFMPYX9mbX
	KNOj2MpZCZ6ouLFHZPdHFCyJo8XTa2OV25rCpQDt1ECaA15hosVM0zx4UX+qvEPsAjd7Ti83W0K
	KdktVGQPl7cBznYFBbrHf44lZHlm5a0W2RZYhjAqB5dfxbYZDceBD3ctf35aHrlZTZQDyeJp7YX
	Ijr2OCerFTt3rcTDffyNdYl+7D+p8LzHv+hJyBrFo2eTcmrbQ84ShOLuM7E3olUTENJ+iA/aFr7
	L3CZvSsom/x2roIzrXmTHlSt3bsOa8lxBFZxRkcU79STta2GkxCC2zGqeISWXnSfSSsKmpILgdV
	63uAJ4L2lQNny6Bp6jeAoUZOo44eQvUhYCaQ=
X-Received: by 2002:a05:620a:a489:b0:92e:c0ac:aeb6 with SMTP id af79cd13be357-930f302196dmr161609685a.40.1784677130046;
        Tue, 21 Jul 2026 16:38:50 -0700 (PDT)
X-Received: by 2002:a05:620a:a489:b0:92e:c0ac:aeb6 with SMTP id af79cd13be357-930f302196dmr161607085a.40.1784677129543;
        Tue, 21 Jul 2026 16:38:49 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f68a9c76sm20047685a.13.2026.07.21.16.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 16:38:48 -0700 (PDT)
Date: Tue, 21 Jul 2026 19:38:46 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v10 08/11] clk: realtek: Add support for MMC-tuned PLL
 clocks
Message-ID: <amADBr_DnBeGh2jg@redhat.com>
References: <20260713155630.3054636-1-eleanor.lin@realtek.com>
 <20260713155630.3054636-9-eleanor.lin@realtek.com>
MIME-Version: 1.0
In-Reply-To: <20260713155630.3054636-9-eleanor.lin@realtek.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nat0wSzGvWpU-RnZ7_evWM76i4ivv32Pd_tbMS9zefA_1784677130
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_163853_902984_323AB27F 
X-CRM114-Status: GOOD (  17.12  )
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

On Mon, Jul 13, 2026 at 11:56:27PM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Add clk_pll_mmc_ops for enable/disable, prepare, rate control, and status
> operations on MMC PLL clocks.
> 
> Also add clk_pll_mmc_phase_ops to support phase get/set operations.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Jyan Chou <jyanchou@realtek.com>
> Signed-off-by: Jyan Chou <jyanchou@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v10:
> - None.
> ---
>  MAINTAINERS                       |   8 +
>  drivers/clk/realtek/Kconfig       |   3 +
>  drivers/clk/realtek/Makefile      |   2 +
>  drivers/clk/realtek/clk-pll-mmc.c | 430 ++++++++++++++++++++++++++++++
>  drivers/clk/realtek/clk-pll.h     |  13 +
>  5 files changed, 456 insertions(+)
>  create mode 100644 drivers/clk/realtek/clk-pll-mmc.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1fffb1fc5de1..0c8b98ecc4a5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22747,6 +22747,14 @@ F:	drivers/reset/realtek/*
>  F:	include/dt-bindings/clock/realtek*
>  F:	include/dt-bindings/reset/realtek*
>  
> +REALTEK SOC PLL CLOCK FOR MMC SUPPORT
> +M:	Cheng-Yu Lee <cylee12@realtek.com>
> +M:	Jyan Chou <jyanchou@realtek.com>
> +M:	Yu-Chun Lin <eleanor.lin@realtek.com>
> +L:	linux-clk@vger.kernel.org
> +S:	Supported
> +F:	drivers/clk/realtek/clk-pll-mmc.c

2 of the 3 names listed here are under the new realtek entry added by
this series. I'm not sure how common this is but it seems overly
granular.

Brian


