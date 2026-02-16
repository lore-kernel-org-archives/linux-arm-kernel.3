Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB64E63F3D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 09:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9KcAyYM/+QmM79Ib7dGqCC4dBkpE2RdJ6RsVIfszKMk=; b=2pDuFNJDUsnWdTNo8VTMz4MJqS
	s5gxnstiQGLpxunuHOiBSzohgsAUYc0+8fFvCpiiRr2tzT9GujGf+iFgkEGRImsVbHrHAmF4EWwhS
	ZcOxHF4Nd3Ugq6chAfRR3OmoSpZwYs02wZto/Bijo6KHR07cM6DSFg1w2SyX7Lng99BhnKxbNc9v5
	o+YF3TWfAV4Baq5PhEEVndEPTU4jriHc7yS6fQBpqmlnFU/QRvD8tEE3wlL+ZXdrSQ9tA8doDW6AH
	5cIDMwDNvO7PSeXiWh/cVhOkKpk2AY3KsqOUiq2apenQkboiYNUHRVG20tfb0pbsuld5L5Kise3p6
	CcRvnecg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrvEq-00000006IQk-49mC;
	Mon, 16 Feb 2026 09:49:57 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrvEo-00000006IQP-1AU4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 09:49:55 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-64ae1729637so2623469d50.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 01:49:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771235392; cv=none;
        d=google.com; s=arc-20240605;
        b=FCfrROPCsRSre6E2kiJDRYnHh4omb/LzEYuWQWyUmglEfqv39bLEYhniWivyKvCxQ5
         +s3GoWO5CfMHBgcYZ3WvVGYXRRO9U8isHJ+T/WlrZl/HsIarW1ZOJUqXuWj68uEzSrFL
         y+evysfJ/ZwRnY8WfZ82gzDndBpDw2n38lNhlY89BaU0ufr/3IbBclY5gmOh+1lKCkE1
         fsSudWVUwDLEZ+8nzf2tvXN2yPfGAk08efTI988vK7oMsOMA0TrBYiz6Ep40TqHGRdw8
         DRiE0/n/MkJFYg9Ft6+RYTsYCQ//Xrxk6swIftW6V+sILs+QD8cnXtFNBnVe0O84Iz5v
         xIBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9KcAyYM/+QmM79Ib7dGqCC4dBkpE2RdJ6RsVIfszKMk=;
        fh=KNYf58T0JKEiqiVFDQa13G5ey2ZYQpQXvUEoDH7BpUk=;
        b=HKspPfc51V3V490SxqJ/LKBq4Zdi4RAUCyXFeDo8H5z/c1PCSRLDRAY/ro651vCpcb
         7ODLz0/tE0xlCn3OzX3cd2CaFFaueAUB0oCY4v+Oldy037pieO4fXunB+8N2v1xlJ3v1
         mrHAXIu8YJqB2tKRTprslRjosntXLbldqRueRWWmq5GhYE74taseGyHeUm/VkGi7Zvom
         zQOveuSGtxBb+rjEe2LIAciBcy24aj+WUv2QJ9B64mBccPIA9aiIbBp27iPjBYZHLFhB
         lzt9g9ONUspZ45EOTPclSc/bOgaZ+zgBIrlYm1unkInECNYLvQjG53n5NAnWkekjUlZa
         72Lg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771235392; x=1771840192; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9KcAyYM/+QmM79Ib7dGqCC4dBkpE2RdJ6RsVIfszKMk=;
        b=f+oS6tX/lHLfROCffZnIhwpnj0NBTpwh3t1KGpwkF8/uXq6DADLxTfEvidfwju64Sg
         sw/OxXd50SRDJV1H+ds3mqNIdzS7/iHEBtHk0Z12KUupd/WWgnkhEHTR+rPgxCf9THO/
         ALyi3r13cQHjukwm+8EBFBHIC3njyeEcg/7jHBv4wAMT3CxfyzhRxsHZYn9Cr+LkyDOj
         dmz+Bb+1MRk1Fk68LIdefbzPDj0N4+TDGBat9Go0K24rSOubDIrBfnX1ToZrexVR4xjm
         GgQ4x8hw0yPtT3y0FMHbWrcp81qYNzwnF7yYHpC0Za+pfAkuCw4OEJZl0Tpqma0U3xdS
         uwCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771235392; x=1771840192;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9KcAyYM/+QmM79Ib7dGqCC4dBkpE2RdJ6RsVIfszKMk=;
        b=sqNJknVrOYkSsM/pXE3SSjMTQyAKnyAztE2vZnRq2J7bRbA+JE3dvoYNY7N0psvkiK
         Rsgdz4D0NPhxUerlAswfOapLcQnSmN/x9V+9aS0NugUx8Ev3ukt1izKiuLL2SR/MUuWa
         oblg8IDesmW9lv0/FC34TrTbuvnzgNWQFR7NRSh/gaGvL9Q78ibWPacAxiUQAb0B5j43
         lZ9dWB4lvEV9MM+OxLgNv0M3d2+RAKpO4vQNWk7/6bKgFSe43JLWwrc/EZ4KYRs+nY9w
         v9aFNsSZF99+rBYV9RZiVXKbqsH1pJa8o6sDRplmeYV+tBHezslQbwj7ADy1kbIu1Qs9
         iGIA==
X-Forwarded-Encrypted: i=1; AJvYcCWcOxE1Ytr09//DMhPCFusUhuOl5NkUKqji+P4o5otrETtHrtovieskNLQoTjG8HRsPBAri2MpJytYG6v0+74Fw@lists.infradead.org
X-Gm-Message-State: AOJu0YzGXtknrkTl/CJXi0X/7Q0v/UcrXfu3e0GuoAwxfP3z8n3UnBD1
	E93Nlxrj2cnxcXo4DARotWyToK790uBRxrpkgwwt8sgBfkMIm2DHHCOD5nokP2WB5MZU/bMz3XO
	YtQelMHK+qb7tY5qh71BraIc0cGPxH4GRbMnSJ6nrlHfuZsWkuFTujb+N5Q==
X-Gm-Gg: AZuq6aJ2YPfuljX3Fbu+8Efi1pNGxCQVvJThsPh9JN1FpRBD+5Tl+PaJWj1j+U0A1df
	Qbs6nNiZa2XS5du+RW8uHbfdgXq2HmBMcWKvF1+iu9euUq6XltAG3XsA8Hj8F4hhZL/0pXOA0We
	lblV6MespFcfB26kvihiE+PLj0xyKdzG5nLNvf78CQDmAcUw85GfndklJvm300GyJ2qFJgXn/zq
	Rzj1eyCT9/tXYUNM3JJpiluVX4JpAxJEPC0ldEg1+OWndAkVCM1ttNBIag39lGQajEeJ729SUxf
	14GyztWhRWnh0FFytXcOwq2ti/r1FG7txaAXjrekanWhLslOe/3ZWN21+3zRA3ODerDkzs62ne8
	WjxuSV9L4Z7t1PpfPUgkkjiU2IXM413olTSfHfjBi8Pf4mo+MNeWPJSo4Bo9Xpob+Yn4bwQ90L8
	eMzEHxNucBOlPMZaVpfS+mxzcJhVzV9ASP/WjbkXhz0Eyry3Q+sgmp2qarDj+kAo0OiNLvvN7Ig
	et1M3CRQfQD6pRAX0I1DUJsy4B4wnpJ3IGStJPro8D6CsXQrZSvRZqJUP19jYQn8ZMacqgDJAeG
	onV8lwWXThXJKe4v+BA/pS6xCpAIa9sjA/pt0PeEGW2t
X-Received: by 2002:a05:690e:1503:b0:649:44ac:cc01 with SMTP id
 956f58d0204a3-64c21b18a02mr5405053d50.55.1771235392354; Mon, 16 Feb 2026
 01:49:52 -0800 (PST)
MIME-Version: 1.0
References: <20260215110628.34293-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260215110628.34293-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Mon, 16 Feb 2026 11:49:16 +0200
X-Gm-Features: AZwV_QiWccMZyM72m_4_u3dE4MCMJlyOZRCqnU7JaUjXWUFD4VNEgOXyE-7aI8E
Message-ID: <CAC_iWjKQA0k+DTFpTDGieCK0qNL3=BCSiOPOtCo5gvdOtXd-cA@mail.gmail.com>
Subject: Re: [PATCH] efi: stmm: Constify struct efivar_operations
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-efi@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_014954_343912_DF9F82FC 
X-CRM114-Status: GOOD (  17.64  )
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

Hi Krzysztof,

On Sun, 15 Feb 2026 at 13:06, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> The 'struct efivar_operations' is not modified by the driver after
> initialization, so it should follow typical practice of being static
> const for increased code safety and readability.

get_maintainers doesn't include me in the cc list?

>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>

>  drivers/firmware/efi/stmm/tee_stmm_efi.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/firmware/efi/stmm/tee_stmm_efi.c b/drivers/firmware/efi/stmm/tee_stmm_efi.c
> index 7b04dd649629..3bea2ef50ef3 100644
> --- a/drivers/firmware/efi/stmm/tee_stmm_efi.c
> +++ b/drivers/firmware/efi/stmm/tee_stmm_efi.c
> @@ -14,7 +14,6 @@
>  #include "mm_communication.h"
>
>  static struct efivars tee_efivars;
> -static struct efivar_operations tee_efivar_ops;
>
>  static size_t max_buffer_size; /* comm + var + func + data */
>  static size_t max_payload_size; /* func + data */
> @@ -520,6 +519,15 @@ static void tee_stmm_restore_efivars_generic_ops(void)
>         efivars_generic_ops_register();
>  }
>
> +static const struct efivar_operations tee_efivar_ops = {
> +       .get_variable                   = tee_get_variable,
> +       .get_next_variable              = tee_get_next_variable,
> +       .set_variable                   = tee_set_variable,
> +       .set_variable_nonblocking       = tee_set_variable_nonblocking,
> +       .query_variable_store           = efi_query_variable_store,
> +       .query_variable_info            = tee_query_variable_info,
> +};
> +
>  static int tee_stmm_efi_probe(struct tee_client_device *tee_dev)
>  {
>         struct device *dev = &tee_dev->dev;
> @@ -558,13 +566,6 @@ static int tee_stmm_efi_probe(struct tee_client_device *tee_dev)
>                           MM_VARIABLE_COMMUNICATE_SIZE +
>                           max_payload_size;
>
> -       tee_efivar_ops.get_variable             = tee_get_variable;
> -       tee_efivar_ops.get_next_variable        = tee_get_next_variable;
> -       tee_efivar_ops.set_variable             = tee_set_variable;
> -       tee_efivar_ops.set_variable_nonblocking = tee_set_variable_nonblocking;
> -       tee_efivar_ops.query_variable_store     = efi_query_variable_store;
> -       tee_efivar_ops.query_variable_info      = tee_query_variable_info;
> -
>         efivars_generic_ops_unregister();
>         pr_info("Using TEE-based EFI runtime variable services\n");
>         efivars_register(&tee_efivars, &tee_efivar_ops);
> --
> 2.51.0
>
>

