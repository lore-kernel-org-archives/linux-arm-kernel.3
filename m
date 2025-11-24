Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4DCCFD318
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 17:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ni6ryahXA4WhKdPgeajWMOfblZG+42XfxR7yeQeGziE=; b=F8Y1vJrH8sUmVmMsIR0VHE7g62
	/Jr788n77O6y87mZR550uosvnAT6+RxVfGnPQIpNmKIO1CkUtx3WK6mXY4kloA5dIQzu81A4UcR5u
	CmRxo0KoV0NbQfDa7/LEgXxpLfiin+w2uOvqtG+D6nqUBdBC9F4uOp2yoF8gl9pj/RxvbSrzXBckt
	K8tt7ciyUQvFxyWqAH/iA1Zy0o+8HesPWobkB4SpkipruvqK9eKb3Hc82BuC5byxIodK2Up/exvbz
	GEqKQ6OPIsLxE5Xy0LuKiUrKT4o9KLRH+eaMuX9ISR1m620O1f5pJOuObvsQ1RdxNKxSUMXJYMKGP
	1tu3ykJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNZzi-0000000C4GO-1VTx;
	Mon, 24 Nov 2025 17:04:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNZzf-0000000C4F1-1A6d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 17:04:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EC47944140
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 17:04:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9F4BC4AF09
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 17:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764003890;
	bh=ni6ryahXA4WhKdPgeajWMOfblZG+42XfxR7yeQeGziE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=im4OP44fxcV8oBiXqMZXwaFtVS4yC5hoDr6iH4M/56YLQZOOKaRle7OQov/Qnlgpc
	 pweOpV/Qx9+TaPNP1i64KV9t0z1kwKpRZHEl/J3XlJC+cR+wqtv3oO8T3HsjEmhsrU
	 ZtVBinn//9N8lupqgYuMpHVTmkr/1WpTaxJqeZFFs5ZzEB/cnxrzd6v+Cv9nfPUHID
	 p7UIXEGSLpaf/Q67sQEMT1wDqa7UVI7zjqvecNs5hfGGIYGz+6abqQqYBsgMSYc7qn
	 XhyxLD1u4+AfK9rfCUrFTgWqsCPefTxj02aekr97RvlQqXNTGyPfxQk2KneFbFI/b6
	 uJjshK0d7lslQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-594330147efso4738548e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 09:04:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUjYYPg+zvjPfIzcdOnr0ZxX769l7fZXF5PaYH+VbtfKfNdoieZMwmZyhcMvG0Pzw7fp+U+9AtfyMsnUTQxA/4Y@lists.infradead.org
X-Gm-Message-State: AOJu0YzvmfVMKmPeoiQ9OfxhAGUoIj9fsEXIThvmDjftaXRpqvSHSjTn
	ysi/Nr7tjcS/aOrleUgQzVcOnQ1nq7CZ8sWNaw35RwYhcSDIFtWrnG11rPOQ+eNM/6hGJsX9tWD
	5oguNvUBRgQbTwUpCB4SJyawhsheCV4Q=
X-Google-Smtp-Source: AGHT+IGGU4X2n28nXl03AZEGYJ2qP+YdFmcNyxyi9o9xFWaX9qXe+5YYYmW9XiGzz0iE7mMdFpmgf1MgItGyyi+uahA=
X-Received: by 2002:a05:6512:1282:b0:594:4c90:8415 with SMTP id
 2adb3069b0e04-596a3edab39mr4528817e87.27.1764003889213; Mon, 24 Nov 2025
 09:04:49 -0800 (PST)
MIME-Version: 1.0
References: <20251124165116.502813-1-tzimmermann@suse.de> <20251124165116.502813-9-tzimmermann@suse.de>
 <CAMj1kXFu4=L=ROVAaRORG5HMmYWHb6OXQf6pJ3yAZpeDmfmSeg@mail.gmail.com>
In-Reply-To: <CAMj1kXFu4=L=ROVAaRORG5HMmYWHb6OXQf6pJ3yAZpeDmfmSeg@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 24 Nov 2025 18:04:36 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFtsneE3dFgUx6Hd=iBhD8YpvjfTSi-KZpuNaXfX07KyA@mail.gmail.com>
X-Gm-Features: AWmQ_bkKMcK7WGWFCCrQ1b9TEIPkREY9pqhPyguPzmrEL1z0shGOixam-7jvNpI
Message-ID: <CAMj1kXFtsneE3dFgUx6Hd=iBhD8YpvjfTSi-KZpuNaXfX07KyA@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] efi: Support EDID information
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: javierm@redhat.com, arnd@arndb.de, richard.lyu@suse.com, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-efi@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-hyperv@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_090451_337564_4C6C1EC1 
X-CRM114-Status: GOOD (  14.58  )
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

On Mon, 24 Nov 2025 at 18:01, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Mon, 24 Nov 2025 at 17:52, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >
> > Add LINUX_EFI_PRIMARY_DISPLAY_TABLE_GUID to the list of config-table
> > UUIDs. Read sysfb_primary_display from the entry. The UUID has been
> > generated with uuidgen.
> >
> > Still support LINUX_EFI_SCREEN_INFO_TABLE_GUID as fallback in case an
> > older boot loader invokes the kernel.
> >
> > If CONFIG_FIRMWARE_EDID=n, EDID information is disabled.
> >
> > Make the Kconfig symbol CONFIG_FIRMWARE_EDID available with EFI. Setting
> > the value to 'n' disables EDID support.
> >
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> Why are we adding a new config table again?
>
>

Note that LINUX_EFI_SCREEN_INFO_TABLE_GUID is internal ABI only
between the EFI stub and the core kernel.

