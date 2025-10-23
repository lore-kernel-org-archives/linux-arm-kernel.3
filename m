Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2333CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 08:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MDPnol5k9sUN2ZAsl6zEedZ+Z/hOhaCzyGH2D4T8L54=; b=Zkw7wY9HVQ6dWpiHYNFlWv+ms5
	ZhCydK7GDE/afiW+DlSEGISLGXEgYsnVXZ+Zz99UOSwwah+lYiy5e2eARkqcqsbuA02UWy0uWImHt
	SztnVEGCQk46D7HWt4SHdBzIb1I35TKShuxKtXcY0FUvHQmGryYyF8h5F64Xa0p/0dI38Mg1G5oSQ
	sHemz0WKIrWHcpAUR2kXzPQOO5Vu2SrWrRIn442KMT9hvbfr8geycdnhBSBe77vMpeUt0+eKU8sUz
	sjTqJa6LyQpaZFzpBSgwJ8C1ErKizzr0LY8B6IPKEiNqDS3KEX/DbPyyDHdfIC7nKXY0gJcMJGNfo
	da7omgBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBqj1-00000005Yz7-2hsr;
	Thu, 23 Oct 2025 08:31:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBqiy-00000005YyD-20Dv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 08:31:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EF93F455B5
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 08:31:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEA59C4CEFD
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 08:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761208267;
	bh=bFoOFvqHEoQk620s/iyc0FwUv0/+PYvVS9nDEBN1DGc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rczCHipRMct75wabc6EWWhjvu2ktMfl9mYmKrMiqQIIQlubasW4cUoHtKHTz7/wve
	 pG9nEUVX6fmRC/G8TENPbCjQQkqrso7RdP4KASV+x2sn/jlzc+2uZXBoRvuniMzO/l
	 j9le2fQ7PRa2o4/zt2EgB//1wGufYLWomuKJXy9KNbeLZkHtQ4pcH1VXjHzMbgz/ny
	 fmMIfq/jT1FlwFQBSp+EcvLpMneHn0Jq7RNyN8hGD+l/Xikng6wyhVBEgVgw87vdQX
	 CJIMXT8NZGSVqSp9cRhmPNGlQYUNn3egzh+0FdLZKkIecRmn+L1ftNYJ9bv+rbN29q
	 5QaBPbov6LzdA==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-592f5fe03dcso492385e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 01:31:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXyVvuDrpdSVb5p1iaGBfHMRgTAajZQg4fI7ucvluqlXxdsQTTzpwrGCDgiNPLuQtQxCRvn4tuReBI5Y4sNxfvX@lists.infradead.org
X-Gm-Message-State: AOJu0YxA32+XU2AnacWTnLCzCAbiH8tzbJBWG79pUkc3F4MttJd3svpT
	QeGXC7MN2/3Am205UVkeXOe+zQYYODk1vMpx/bf626tm40Ecimp1Bz4c0osP+nYTP404LvdxE1N
	TgJVzsX5Hhd7AVA0ozAsRryZiqub98/E=
X-Google-Smtp-Source: AGHT+IEhcLf5FIRwByJaSQnfDpZsBKep/9aXOLRRWcORJP4c6v5Nn9uvZ0mdqWItpwlkTlQdKxUgwjjzv9WgOvAqi9Q=
X-Received: by 2002:a05:6512:3e18:b0:592:f315:843 with SMTP id
 2adb3069b0e04-592f3150ac3mr1217650e87.50.1761208266234; Thu, 23 Oct 2025
 01:31:06 -0700 (PDT)
MIME-Version: 1.0
References: <20251023082129.75612-1-maqianga@uniontech.com>
In-Reply-To: <20251023082129.75612-1-maqianga@uniontech.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 23 Oct 2025 10:30:55 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHs3vC4TEWg1ogG=N8Dd5L0rkQ=qAFLWKiAA5yi_He3GA@mail.gmail.com>
X-Gm-Features: AS18NWAqPnAyqoEewao8d7Q2_zh3PAnOF7TqO_cE-DS3GzEfQDx2JtSNzXOLUjg
Message-ID: <CAMj1kXHs3vC4TEWg1ogG=N8Dd5L0rkQ=qAFLWKiAA5yi_He3GA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM/efi: Remove duplicate permission settings
To: Qiang Ma <maqianga@uniontech.com>
Cc: linux@armlinux.org.uk, linux-efi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_013108_556376_4A386688 
X-CRM114-Status: GOOD (  18.54  )
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

On Thu, 23 Oct 2025 at 10:22, Qiang Ma <maqianga@uniontech.com> wrote:
>
> In the efi_virtmap_init(), permission settings have been applied:
>
> static bool __init efi_virtmap_init(void)
> {
>         ...
>         for_each_efi_memory_desc(md)
>                 ...
>                 efi_create_mapping(&efi_mm, md);
>         ...
>         efi_memattr_apply_permissions(&efi_mm, efi_set_mapping_permissions);
>         ...
> }
>
> Therefore, there is no need to apply it again in the efi_create_mapping().
>
> Fixes: 9fc68b717c24 ("ARM/efi: Apply strict permissions for UEFI Runtime Services regions")
>
> Signed-off-by: Qiang Ma <maqianga@uniontech.com>

No, efi_memattr_apply_permissions() uses the /optional/ memory
attributes table, whereas efi_create_mapping() uses the permission
attributes in the EFI memory map. The memory attributes table is
optional, in which case any RO/XP attributes from the memory map
should be used.


> ---
>  arch/arm/kernel/efi.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/arch/arm/kernel/efi.c b/arch/arm/kernel/efi.c
> index 6f9ec7d28a71..d2fca20d912e 100644
> --- a/arch/arm/kernel/efi.c
> +++ b/arch/arm/kernel/efi.c
> @@ -70,11 +70,6 @@ int __init efi_create_mapping(struct mm_struct *mm, efi_memory_desc_t *md)
>
>         create_mapping_late(mm, &desc, true);
>
> -       /*
> -        * If stricter permissions were specified, apply them now.
> -        */
> -       if (md->attribute & (EFI_MEMORY_RO | EFI_MEMORY_XP))
> -               return efi_set_mapping_permissions(mm, md, false);
>         return 0;
>  }
>
> --
> 2.20.1
>

