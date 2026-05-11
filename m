Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1C6CD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 15:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3JWMhWSTBa1St/FT9EYONC8eNpWkZ18pjlnscArsjYQ=; b=zHAthjpIXLt7Gs84haS+nygg8k
	XraRbF4keCGMJ3Q7eN2HNE+Nr5AJ41K9zxetMizj2u1wPNFGq+/hWoOSR22xtB8Ihjmlk9RSdcGoq
	ECCYoei/difWmh+rRSWiacFI+gYsCF3HWEn6C38lnsIl7eZsFOE4eM6X6Qy81RWhxcA78VURL4mtM
	6ABgxpmsNPzVzQY/V4PtihjN8BnEEfpN4eL3MRawl6Nx1xUG+OsadK+wrA424Did5lk5uYl5UH6bu
	JRC+j0jBlCGVetpIWXBcn0VcUekNPb934B6WaoXE+802xnU55GmwptqRstLOkP+az7GQWn0K4dVsv
	eMQHVtYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMSkY-0000000E4gL-1M1H;
	Mon, 11 May 2026 15:40:54 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMSkR-0000000E4cg-1q7H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 15:40:48 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-393d6025f99so38759081fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 08:40:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778514045; cv=none;
        d=google.com; s=arc-20240605;
        b=RiseiTJat1YdJ1jwB/9VAGa2GduWTBQ6/9KN015FM9+DFRtMJ+qa3kVnQLbDFT6KeQ
         al6OSuMntmcJD45t0bucwXHS8BEphf/nnsJvpSVTQkm1IFAbwDl+MvS/MWxw9cIDvwxE
         mTeiC/Nr+WrNwJHE0znVLVhN4paofLsB7qoUBx0oxhjTcked5iNyMOyC3z0vKMXba3+5
         bS4egsDmq/Ll9CPLhU0z5O/ZqwCaOaQK2d74SmDdbI8fDdzBodzK8fkzlhIhLyxd/MpA
         CeQhCOqgoZu4WUrzcrQoDnk9ferC94v9ZCKujE0VuDUao7UcCUkGeJwGjrY3dGTysFFu
         4rCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3JWMhWSTBa1St/FT9EYONC8eNpWkZ18pjlnscArsjYQ=;
        fh=CcVIFMthLY/hxPGKl8x4JY4dn+XNluPajOg4Ql8KRmg=;
        b=FXCCWiLaEB7KBwCBw+cqq38LLoFU6PYfShDuqKbH9kn8qw6CERM0HnoyOvbjXVbexf
         8+PxFwyJYneUSGPv8rlhpnkPnLT9jIzxTjCS/8AG8acdeuT4TYiPXgiMblCAm8qjjbx1
         R2cT7Xb1vxheVKLlLN4Wh4jD+CvCY40Ix+CCNGc8vd3N2brzTcyFc9D3ntmTx2onnrkf
         pnGV1U1ZdhcO8zO4ud7NsLm6VixdnLGSmh1krdIGozfZcbqpfRMf5nPUwYk5/aXrioh0
         shq4HVqous03iuUk7161/HlTGox6I+FlLaUG7RIMEzWick2ER7bOK6ga1A46q0/DWIy7
         1avA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778514045; x=1779118845; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3JWMhWSTBa1St/FT9EYONC8eNpWkZ18pjlnscArsjYQ=;
        b=w+gpfI967mpWVsBjrJc5eMreAQIaBgbyBEvzvHRKOhLxwg4cJTZJi6kLTUcgSSsi5R
         X/nVazLdhNoJ4ZvOvSy8pOTf3ec7PiziOW0UOBH6q7ZrTV/gfaVzLGkCTR1g3LLaauml
         wEoido2AOfwGwrh1JosW59njBUF2aZroDTARx4/5vF+oTLIG9pUlXT2w5wg9l56lM5Zq
         qbJDVWBSQ99PhVihHdbyu/1e599+5NyncHMK4EEWjhIAN6UfEhQ8W3RbhKAe+8L1IRHP
         Xep7ZI2kkyQdcZ+Pxtgh/qMzKaBDHVeS/YJmqdqP7GtOrSqQhMgcsBUIRD13K6lip8cQ
         fDOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778514045; x=1779118845;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3JWMhWSTBa1St/FT9EYONC8eNpWkZ18pjlnscArsjYQ=;
        b=s3tawXb8UUbuTMjg82F5FgbSKHvMAg/kG0wwu5+krIKTASmpxycYhmGvnU/4CSZg/T
         OA64qJLPaIUIvxj524L3MB527aOLYdGoFuOEZB8W6KGocrtum3R6D5u+eo5fTnKpBYYn
         1CwuKJ+LHm6SJLKmSTmPpxc2Ge72ktuIR2Er6QnIKRxVMnTLPP7JtKb0IRIvcLFnxQi+
         9E9qyt6cU637ji6w3JVE8VdDdUd3SxAx6cijgZ8Xg4egqV1gRCCPqkg9QU9WU3Ga4jUV
         uWCVm78JIl2fwd3v0smTc6PyAsmLePgefwRFBoxyMvSe+lzaqhvATyWmetGijnFTGrcG
         9REQ==
X-Gm-Message-State: AOJu0YwUpQkXHKbdzb6NBNx8XkQehJ7ATNFWLb/5WfM2Q5Na6+szcQJb
	7/2gv1lIHGU3NqBL95OMfsc3Duuc0RcyaLFr5mOBhoBwNs6Wx/iuFVxFOiOvsiGBVNwUFVBFNnl
	ai9HCxDQO8ALB04pOhGsHe6OvSgxWlKpb1sK6JH7JOw==
X-Gm-Gg: Acq92OHRfDEO/drO0UVmViA6SlXTvG2L+KY9ZDwNj8xl4MgiJ98r0NSXlL+iXX1hMMP
	hK4qbc0zx6PH5YuHlxoA/6ea3Fim3PwQXlnsI+X8PNLC2hg1vj1biWiOvfPJqPYqsYOBqo+mB9D
	yFlvV7YiG2ikUJZ1hoXVgUgSDZDyCQaUx9yvPPqQYdToGXeQd6/S0RplqkbFB8E30lWEdFzUivC
	4jH7aJPy4l3+9+nsTKjIPIQYlZX6hdV9NrEeyXhZn/1VkL6vBek6ecr5mRqJ+R16AM87UXXKxT1
	BIgc+fo/
X-Received: by 2002:a05:6512:1081:b0:5a7:4912:1a50 with SMTP id
 2adb3069b0e04-5a8e0f2ec60mr10052e87.20.1778514045188; Mon, 11 May 2026
 08:40:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org> <20260504144534.43745-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504144534.43745-3-marek.vasut+renesas@mailbox.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 11 May 2026 17:39:53 +0200
X-Gm-Features: AVHnY4LEtYRDfcFkDKKMsfq944FdAC52H0vJFxs1kLbNHgSvbuAlOvG-QOqCQEs
Message-ID: <CAPDyKFpO5RyaSGRZibAsygRcfs_En-TohTOrO6a7dUdVdzcuxA@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] mmc: renesas_sdhi: add R-Car M3Le compatibility string
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Brian Masney <bmasney@redhat.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_084047_497562_B392E2A3 
X-CRM114-Status: GOOD (  17.83  )
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

On Mon, 4 May 2026 at 16:46, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
>
> Add support for the SD Card/MMC Interface in the Renesas R-Car M3Le
> (R8A779MD) SoC. R19UH0260EJ0100 Rev.1.00 , Dec 25, 2025 Notes 7.70.
> indicates that HS400 mode is not supported.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
> Cc: Brian Masney <bmasney@redhat.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Ulf Hansson <ulfh@kernel.org>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-mmc@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: - New patch
> ---
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index f6ebb7bc7ede1..b716a518f2650 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -285,6 +285,7 @@ static const struct of_device_id renesas_sdhi_internal_dmac_of_match[] = {
>         { .compatible = "renesas,sdhi-r8a77970", .data = &of_r8a77970_compatible, },
>         { .compatible = "renesas,sdhi-r8a77990", .data = &of_r8a77990_compatible, },
>         { .compatible = "renesas,sdhi-r8a77995", .data = &of_rcar_gen3_nohs400_compatible, },
> +       { .compatible = "renesas,sdhi-r8a779md", .data = &of_rcar_gen3_nohs400_compatible, },
>         { .compatible = "renesas,sdhi-r9a09g011", .data = &of_rzg2l_compatible, },
>         { .compatible = "renesas,sdhi-r9a09g057", .data = &of_rzg2l_compatible, },
>         { .compatible = "renesas,rzg2l-sdhi", .data = &of_rzg2l_compatible, },
> --
> 2.53.0
>

