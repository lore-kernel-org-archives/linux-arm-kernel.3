Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10CB9CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 17:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SrnuSv5qhMXlEsx73t70dgDKQOe4sGpC9//5bK2oF5o=; b=EwSLIa41eT65IkcC6SJgYkfF4C
	AUIAz7TFIlvubS0AX68C5t6Je4+ZVHdUxY51cdXxdTAlSh7lcw4tlsaiQpUR9GTnNixscVMfeHTlo
	iH4GnlKytXsqbs/ijnZvea+mvJRz4YNaUO90KcIIyNL4AiCow8TTC290A2ATbD/4Wgk67SZknqqle
	2BvKjKzjO56J7NgoX6dPPxGFS+ZRSP3r48MljjEg+629/O2bGVsoDbhRI/6I4T4zdN1rCWrngH/WW
	z6YqeN7sr9DMpiYHMMLBDnf5nHVj7S88ykXZ6JnVjrqZpHWcRTM9MMbRcz5BQv46IF27BONFM/O7W
	c863ygbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZej-00000006B7i-3fY3;
	Thu, 14 May 2026 17:15:29 +0000
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZeh-00000006B6k-0FEA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 17:15:28 +0000
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-651d6347a69so140838d50.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 10:15:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778778926; cv=none;
        d=google.com; s=arc-20240605;
        b=Ff6nBVGFpTmKtVa/AeIUpbtqA7NNRXt8iaLUMfbrBVsfWU3PTTTGcirqtPclM/LPYs
         UuqBJAockGemJIsv3jj3HRFWsA/2ky5XrREia5saeU+Khs7KJFwXnG3+JsvO3/6UR9YD
         7BAJGoLOcOly6SytM1Z8RdGcIvUS1j2MohmPmwU8ojsBziwk4aD8nSsO0V0G/QF05lgD
         1XPBsNfq/9qFP7DAie5ktcemT0WAZP2b2D8oGoHNAKhmWpWQTo/ITfoLGCE//wdI+dMP
         MziWncmWk1yWNpAR4obi1grmVSbui501EYb3fciItKMmzp+3Mr92KKYD1hE4+nrYD6ya
         dl3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SrnuSv5qhMXlEsx73t70dgDKQOe4sGpC9//5bK2oF5o=;
        fh=fSoTTd1Y5Nx6YNSqKOy3LWKNH9gZbGyHCoEV8DVT+Xw=;
        b=cVW1UtSN93ZqcHtEcHSBD7ZlYxQyOhjZrMFsfD5uKlWhOFWGeR7+CkkxELEoPnodVC
         L6hxUujzi0W9zcEY22qtQqj/cBdgQBCt5Bg0Zbona4/h7F1CHTYf8eVPs5pU+gBtIfPU
         BxNu/52KyXodH5cUgExn90o4OxX84dF70TzEE29V/e7E7M1CA+mxKpVIPpQwjZkaHJlc
         b6XePw0DlMzGLtoiK7eetT9f8/b3PHhc2Btgp/OGmEkM8RHglljig437duFGPni+Nbqj
         7UE7MCiF9/hG9tWitDaSZAGBRc8mapFrSUs8UgttGiHVZfC/NMbNjU0Jg+D4jSucC/gr
         FMPA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778778926; x=1779383726; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SrnuSv5qhMXlEsx73t70dgDKQOe4sGpC9//5bK2oF5o=;
        b=UBpYy8Q1oDw3rMgZx9iOMvBbIFV90vH+dvPF4olW6tZ6E1tm/tVYJ0o0wCtPotBQ//
         +nQB7MTqepB9m28ZiFAegVzI9FXnH4Ytgut2jL5G2QbCnH0F+D78CM7N11nabruzYoGy
         NwegZXBjBycDqvG4gxXaD2YH0xg15/Lz3NMxeEP9B24lMhLmAyG8vJKSMxN1jgxve+5k
         KRCkAmXDelv8cl1rBPBwF4qp9i1pQgwnSgZFbUuyrNK6C0E2eXKsErSs4pVtbUfcg7Db
         hOTkzRXHs8UOFpPdJ500p+XTx0kC72tPHQFa9riMrTmMz9ryuAOY32sE2wOECjmcDcUY
         xw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778778926; x=1779383726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SrnuSv5qhMXlEsx73t70dgDKQOe4sGpC9//5bK2oF5o=;
        b=QEAp7UMuUpU502pTBJ6U+Fs8ntymNlt3FuOLiDQ7aEgiUXam+VrF2YmKoUbt7VrAQL
         INcW3VaA5qZzMjRDaAwOgI8IiBUUnIr5zRNHZx2zR3Wvy2XlO0WKEREG5ubw37VnsQrk
         w0FDMoBupAQVhmV7fzhgi2kZJNfhr6Te/5spXzh3RM4mM7V6rOoMTfEA7muQB6Yva0R8
         mOZ9GBRgM7tCdQEh+us9ZtvfBawx5hdYJBXKLjO7zud2+DCszee/xMKSb0R3B9AzOXSN
         q65ihJq2iCdbRxRLnx2fxN4M/nID5sX9IyNONv+N1ZVjsxgFCOnEoJwo/vfTZbAE6jsM
         J7pQ==
X-Gm-Message-State: AOJu0YwOKeU0RPFPMSe7eBwSHMK/ff12qkX8z7bXk6D9XjLPMSnmMBIb
	wc8ktpNb8rISXoyMkpGV4MalI3ZNzHPrQ6EoBnaBvxTqymtvGjg/K10ym2dU7PE532Jfrl68k/m
	/1+6bkve286z8p4k8+iRm54eMDP7cBOk=
X-Gm-Gg: Acq92OE0w4BdvWmf3I1MKUIpoPC9tyuZDKI0FWVRLBgHhkiDrH1KR1GEEaF+irfg2nv
	Si0XAsVmIG2cJfP/ORc9SSJMf8tYQCwn9jdcspoKNpEIhnTDpsd823yatnFQXmAsZGoun8tm6Qy
	aHHgVWoZAkyUp6EYUK0v00wtNLOksrbpMDZUfmm80gh3OsTfqZVCsTPj+r8r+qP3ZZrhD4OziuC
	vvnIGbcgOqO6VWesOCk1vL1MSTksqcUoSP6UqlzMe/3P5OS2TRn6ZHBvrMqxjSvukcYcwnFMhM+
	/PuS
X-Received: by 2002:a05:690c:9d:b0:7bd:956c:336a with SMTP id
 00721157ae682-7c7e6680aa4mr38458997b3.13.1778778925673; Thu, 14 May 2026
 10:15:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260513170101.1858213-1-ekffu200098@gmail.com>
In-Reply-To: <20260513170101.1858213-1-ekffu200098@gmail.com>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Fri, 15 May 2026 02:15:14 +0900
X-Gm-Features: AVHnY4I52m6OqetD8zs2j_RpJSUkshaeW2w_brAl40byB_E35tL-5V_r53MTehY
Message-ID: <CABFDxMGDJ=Fzz37KJ7j=MD+d7n59L=jN1D1NPpQipMNujciCxA@mail.gmail.com>
Subject: Re: [PATCH] arm64: mm: drop redundant remap of FDT first page
To: catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_101527_506082_A0BBA828 
X-CRM114-Status: GOOD (  24.94  )
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

On Thu, May 14, 2026 at 2:01=E2=80=AFAM Sang-Heon Jeon <ekffu200098@gmail.c=
om> wrote:
>
> fixmap_remap_fdt() calls create_mapping_noalloc() to map the first
> page of the FDT to read its magic and totalsize from the header. If
> the FDT does not fit in a single page, it calls create_mapping_noalloc()
> again to map the rest.
>
> The second mapping redundantly covers the first page that was just
> mapped by the first mapping.
>
> Start the second mapping at dt_phys_base + PAGE_SIZE so it only covers
> the pages that have not been mapped yet. No functional change.
>
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> ---
> QEMU-based test results
>
> $ qemu-system-aarch64 -M virt -singlestep -d nochain,exec ...
>
> Count log lines from fixmap_remap_fdt() entry to return
> - entry PC : address of the <fixmap_remap_fdt> symbol
> - return PC : next address of each bl ... <fixmap_remap_fdt>
>
> 1) AS-IS
>   - 1st call (KERNEL) : 4935
>   - 2nd call (KERNEL_RO) : 14151
> 2) TO-BE
>   - 1st call : 4888
>   - 2nd call : 14104
>
> ---
> Hello,
>
> While looking into boot information, I found a minor cleanup point.
> If I misunderstood anything, please feel free to let me know.
>
> Thank you for taking valuable time to review this work.
>
> Best Regards,
> Sang-Heon Jeon
> ---
>  arch/arm64/mm/fixmap.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
> index c5c5425791da..f8aea5572f7c 100644
> --- a/arch/arm64/mm/fixmap.c
> +++ b/arch/arm64/mm/fixmap.c
> @@ -167,8 +167,9 @@ void *__init fixmap_remap_fdt(phys_addr_t dt_phys, in=
t *size, pgprot_t prot)
>                 return NULL;
>
>         if (offset + *size > PAGE_SIZE) {

Based on sashiko review [1], I made another patch [2].
Please check that patch as well. Thank you.

[1] https://sashiko.dev/#/patchset/20260513170101.1858213-1-ekffu200098%40g=
mail.com
[2] https://lore.kernel.org/all/20260514171304.2034930-1-ekffu200098@gmail.=
com/

Best Regards,
Sang-Heon Jeon



> -               create_mapping_noalloc(dt_phys_base, dt_virt_base,
> -                                      offset + *size, prot);
> +               create_mapping_noalloc(dt_phys_base + PAGE_SIZE,
> +                       dt_virt_base + PAGE_SIZE,
> +                       offset + *size - PAGE_SIZE, prot);
>         }
>
>         return dt_virt;
> --
> 2.43.0
>

