Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD51D46BE5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 17:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bQ28KNx3pxtawA1nFwPKCc2RQpAN4D6gIqSKFp3a8PE=; b=JSRsYitxfTX/NwE04hyfuJ+vUA
	qY31P+VAWcEgaBFeKRFjAIHYVbBSgSXFhd7A6RVNcuZ/4REoEWueIa2NIOWyC6McHCXXQXWIkxmRJ
	pdR0GZSdygAhRVCPkbD3ld1DN/mxshncLFoUPnmDTC+NiXFha7G4nlypFuzh/z2dEWnMXF9J9mp3Z
	Pq31i+jaeFvMvxGOlfwrOsP3M6UpBh6YFEevZKx2NkLhSif6kdWbwZkENdyYUmS07+ShV9mrgDYlI
	01fKJ0W25twro9heokz+nUMb3SvrQ0lVGQ74SJAXTgZ0vq4Fs1gO8D+pzBRG3UIAgMz8xAbLAefXG
	VGgBUP+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9aX-0000000GW7i-1PpN;
	Wed, 28 Jan 2026 17:44:21 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9aV-0000000GW7B-1KrV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 17:44:20 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-50299648ae9so121cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 09:44:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769622258; cv=none;
        d=google.com; s=arc-20240605;
        b=IfYOTepeiDQZcKiVTSbue14Lh52ckAYZc5kERH1wAcyC+b8JrbcFcyKeooz9C4e5SW
         KwrlnDGFyhef9EHOIdtdg23/ZsfNhn5F8Jm5JwwnwnSRvcTs8V8HrpIlvxqoApWe8cQ2
         E9tn6JLmQoYAAPJv0W7xJ8GLEtRt/9W0hI1v5oGFm7P3dtYkHumUlGyqfMyYjDAOMSes
         06MHpzoYxRu9ihebzmgL1C7IrUBwExLxgCXOyntLjBzCYQHTazSutTzJwscEJbRawy8C
         K45RymuWg2pKnDMvlvXwA6EBxoJcfhfKeph78ie8EjgOSyrE6mVmvkvP4RAB5XWYPBLf
         pCqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bQ28KNx3pxtawA1nFwPKCc2RQpAN4D6gIqSKFp3a8PE=;
        fh=/rh4VCJNm2l0mS9U6iwORfgVLQbXa6uqBAfxvcvLb2c=;
        b=QamkLhpoEArF5Wivmk0c7t0K4nSUZLmI7zaO10X39Pe/tnSAGfG5RbQrTeAwsfwwC8
         +vzJcvN1d05LGk8oGIZbIlFNBkjGHmYm3NjDfmuOrU8f8IVccTxlinwTtNRK1fNtZP4p
         3CwP2B2wAA4VJXaxc2DXcVSVeeEsy8eOOKmQGRbZPDjZsWhhoWzCz985JO5VBqk3/J5u
         GZNeZqKiU03um2nRBnkoQEMQ7YTJEe0qFRJT78XzRy5ylgBJC1soWzC+BQlbSkjfeuLL
         9ovnOajT7ql4MsCumFIo1IItaMW/Ws+Ys6pKpTHm4cSsxBjXiobKhU335Z1yHkFEDcjK
         fzKQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769622258; x=1770227058; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bQ28KNx3pxtawA1nFwPKCc2RQpAN4D6gIqSKFp3a8PE=;
        b=CBOmRpHqeF7CTlpWd7EBwInxTqh6ggnMhgn7HLS3/J3TUoErZ2Cm0I94RgB1lGbxKh
         KJmmBv/sW0+sBBJxn0wQahVSznAeIlFL0pFPYnSbkYiRHCpTGGANlkO9uT7ZDyVT+Jls
         sroyPfAlXGW+PWUyhRGOpLPr268poVHnuJivDbv76zfSvEQR3LXu1x9M4ueovKg+9Oj0
         xeqTQj3uZVqGhA6O7GUVrDN9pjcv03LaoE0BjIVeXzhg9VWsl+wVvlmta5NdXgzFrAzj
         1WY5d/LBCTbKfVMrKtu+6ngSi4o/kxM2BBjklJrVJkmSFryNYI2GAmTnGJxES/W+4kkc
         zHVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769622258; x=1770227058;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQ28KNx3pxtawA1nFwPKCc2RQpAN4D6gIqSKFp3a8PE=;
        b=oFFYT1fF3NxWKbdJGWu6iW4Uq+nAvWRnrfR4so35Q54nXgr2FhaxcOmVDx3fcnO8Z6
         NFLsR94tLzxv8KUQu4YwfzP21smfnsQB2Zbut/9T5AQyKA0Ile+gN9xlkQcNNTEuKARk
         UY/vsczo51IFh+aguwiqeQt7XLQOeSTDJsJXq3d+yFg83fHLP9jnKJ7OZ7xZgwRYImsN
         wGPM3YO0XQRm4xziSMi2X/xEcZ0CAffjBL8O7Y7IdxYoma6oCpQv0YPxuudpXKktyu81
         h3pPPNbsmfnISw3SX4SaDMx951zsNHv1fjSaOYKOUFsHvG50eM3vaDe6ORaoSZiB9GMk
         z5tA==
X-Forwarded-Encrypted: i=1; AJvYcCULW/bZugvWRF0w+RlS264Q/uF4i4Y0P/AgFJG7kiRlrihYZszy39M0zIXx35eRwVBnpwBES5n0EN9pHHP5x6KN@lists.infradead.org
X-Gm-Message-State: AOJu0YzQrRLH/+YOhptqqKTbo/neGyJan1vuJiJE9ZqegVhNQavdIkXJ
	0dPW0WvX/7Jm04cAogJ4wm33MgXKpiNK737CKnMQqB/HifNylY6hUeRgleoEE+toBrIAKcf+mOV
	nj1RUJ9TIcJOqt4Wx1wvO4BGBICBH9t9PLYQNgmGz
X-Gm-Gg: AZuq6aI3KCyiVnkToJ9EWjK+JmJMJJqBOZhXyEthgz2rAJv1px8ZJ7Hw5K4wOL1ukYy
	6SFFWsD2ldxUWcKvPJ6t3BEusudAEAYTJ5hb8uV+18jd5rtPZOwU1E1nTpgXpReH/xmgPLoYyLQ
	vWibLchLosHagmOYSl4xEMtSuEFOElTpZAdmG8jJopM6kRt5qgSNlKwu/SKK9R4KNM7b2HVCRSF
	qmlKNTGpkGrVvFqaAk2ZtMtfvBq4Y+DM+elK6enLSkisxVDasKm82yeNSA7CUvmxCbVQZacFUN7
	mnq4ZWs=
X-Received: by 2002:a05:622a:a64d:b0:4ed:a65c:88d0 with SMTP id
 d75a77b69052e-503340e241emr18057281cf.6.1769622257513; Wed, 28 Jan 2026
 09:44:17 -0800 (PST)
MIME-Version: 1.0
References: <20260126121655.1641736-1-maz@kernel.org> <20260126121655.1641736-13-maz@kernel.org>
In-Reply-To: <20260126121655.1641736-13-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 28 Jan 2026 17:43:40 +0000
X-Gm-Features: AZwV_Qjw_-4jQqLbJsa_gafDcYnoQTp1vBemlKSUmMjvAlynKsInG-LHMbmXpQc
Message-ID: <CA+EHjTzL6bNZ=sZoub3GY=VZ2bJ+4bFr4jkuiMMBCEqXuAkQPA@mail.gmail.com>
Subject: Re: [PATCH 12/20] KVM: arm64: Add RESx_WHEN_E2Hx constraints as
 configuration flags
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_094419_370916_A0EE4B23 
X-CRM114-Status: GOOD (  28.83  )
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

Hi Marc,

On Mon, 26 Jan 2026 at 12:17, Marc Zyngier <maz@kernel.org> wrote:
>
> "Thanks" to VHE, SCTLR_EL2 radically changes shape depending on the
> value of HCR_EL2.E2H, as a lot of the bits that didn't have much
> meaning with E2H=0 start impacting EL0 with E2H=1.
>
> This has a direct impact on the RESx behaviour of these bits, and
> we need a way to express them.
>
> For this purpose, introduce a set of 4 new constaints that, when
> the controlling feature is not present, force the RESx value to
> be either 0 or 1 depending on the value of E2H.
>
> This allows diverging RESx values depending on the value of E2H,
> something that is required by a bunch of SCTLR_EL2 bits.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/config.c | 24 +++++++++++++++++++++---
>  1 file changed, 21 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
> index 1990cebc77c66..7063fffc22799 100644
> --- a/arch/arm64/kvm/config.c
> +++ b/arch/arm64/kvm/config.c
> @@ -26,6 +26,10 @@ struct reg_bits_to_feat_map {
>  #define        MASKS_POINTER   BIT(3)  /* Pointer to fgt_masks struct instead of bits */
>  #define        AS_RES1         BIT(4)  /* RES1 when not supported */
>  #define        REQUIRES_E2H1   BIT(5)  /* Add HCR_EL2.E2H RES1 as a pre-condition */
> +#define        RES0_WHEN_E2H0  BIT(6)  /* RES0 when E2H=0 and not supported */
> +#define        RES0_WHEN_E2H1  BIT(7)  /* RES0 when E2H=1 and not supported */
> +#define        RES1_WHEN_E2H0  BIT(8)  /* RES1 when E2H=0 and not supported */
> +#define        RES1_WHEN_E2H1  BIT(9)  /* RES1 when E2H=1 and not supported */
>
>         unsigned long   flags;
>
> @@ -1298,10 +1302,24 @@ struct resx compute_resx_bits(struct kvm *kvm,
>                         match &= !e2h0;
>
>                 if (!match) {
> +                       u64 bits = reg_feat_map_bits(&map[i]);
> +
> +                       if (e2h0) {
> +                               if      (map[i].flags & RES1_WHEN_E2H0)
> +                                       resx.res1 |= bits;
> +                               else if (map[i].flags & RES0_WHEN_E2H0)
> +                                       resx.res0 |= bits;
> +                       } else {
> +                               if      (map[i].flags & RES1_WHEN_E2H1)
> +                                       resx.res1 |= bits;
> +                               else if (map[i].flags & RES0_WHEN_E2H1)
> +                                       resx.res0 |= bits;
> +                       }
> +
>                         if (map[i].flags & AS_RES1)
> -                               resx.res1 |= reg_feat_map_bits(&map[i]);
> -                       else
> -                               resx.res0 |= reg_feat_map_bits(&map[i]);
> +                               resx.res1 |= bits;
> +                       else if (!(resx.res1 & bits))
> +                               resx.res0 |= bits;

The logic here feels a bit more complex than necessary, specifically
regarding the interaction between the E2H checks and the fallthrough
to AS_RES1.

Although AS_RES1 and RES0_WHEN_E2H0 are mutually exclusive in
practice, the current structure technically permits a scenario where
both res0 and res1 get set if the flags are mixed (the e2h0 block sets
res0, and the AS_RES1 block falls through and sets res1). This cannot
be ruled out by looking at this function alone.

  It might be cleaner (and safer) to determine the res1 first, and
then apply the masks. Something like:

+                       bool is_res1 = false;
+
+                       if (map[i].flags & AS_RES1)
+                               is_res1 = true;
+                       else if (e2h0)
+                               is_res1 = (map[i].flags & RES1_WHEN_E2H0);
+                       else
+                               is_res1 = (map[i].flags & RES1_WHEN_E2H1);
...

This also brings up a side point: given the visual similarity of these
flags, it is quite easy to make a typo and accidentally combine
incompatible flags (e.g., AS_RES1 | RESx_WHEN_E2Hx, or RES0_WHEN_E2H0
| RES1_WHEN_E2H0), would it be worth adding a check to warn on
obviously invalid combinations?

Or maybe even redefining AS_RES1 to be
(RES1_WHEN_E2H1|RES1_WHEN_E2H0), which is what it is conceptually.
That could simplify this code even further:

+                       if (e2h0)
+                               is_res1 = (map[i].flags & RES1_WHEN_E2H0);
+                       else
+                               is_res1 = (map[i].flags & RES1_WHEN_E2H1);

What do you think?

Cheers,
/fuad




>                 }
>         }
>
> --
> 2.47.3
>

