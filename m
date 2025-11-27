Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC704D116E4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 02:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K4URCfDbXaJDpqc3Jy/ygM5tnfYeP0a6DjdNrUnYNok=; b=1Gk8HpBy0SHs/gPS3VC901BIwR
	xF6L6942NajkvUY+unU4YvB3RM2DV4qNo9hvQZx2Z/BlRyXku5xhcXwXxI2PGdGp+AW+EAPevSywy
	EYTB9a3SFSDrHbR8fHDYWEH8IdznfiKvdiEO1ncht37mxURIPB/e4ORHyvvl9yRFsa+4bbiVbAnRR
	4PoWF2WmVuBsHQ1GmS775ia5RvDviskzNNhXHj4kXqLOOWpAXzlhUXoHdJsKTJduc3Gezis1Wz8ac
	ubu85Y9cVA5h8VZR6CJY7O2Qj1IoV9Id+l9yhfKrmKrWINe+Zb8lbvXkwZqavb8Acs5mTEJ2Gk55M
	cxZ7hP8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vORcX-0000000Ft6S-464w;
	Thu, 27 Nov 2025 02:20:33 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vORcV-0000000Ft5j-0IXF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 02:20:32 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-477aa218f20so1667125e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 18:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764210029; x=1764814829; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:date:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K4URCfDbXaJDpqc3Jy/ygM5tnfYeP0a6DjdNrUnYNok=;
        b=KtPoM2OYhSd1gE3+UPfXeoJQ+jHC1e/ZwoswlhYVg5+bKh0VtvMZQ5n74X8eaqvlms
         C+aQOykzcczoWn/joGcfo1b+a4am6MOabN1Di5v1QLVQeLFbe+HvLY62gc+c+6G8t+yW
         +K79a3RLdPYwcYRWqVXzVaIJL/NRCxZdrGXfzwuFNyDCECOqjhpDf8pbv80LNk67BjaW
         6KyR6u47tB07uOAGNMpG25zw4DC3vLEMNVE6+Y4tmO3epFU/VAvz8uJL/TX6wcALltdQ
         zgKmFvlaX7mIOIopC6h1rquLrzFA+lEsY4TPP/09c0AjH4PLJzJQ/R9LJeGO0IqPw3uu
         vX2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764210029; x=1764814829;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K4URCfDbXaJDpqc3Jy/ygM5tnfYeP0a6DjdNrUnYNok=;
        b=b2e2pOO0MHuX0Ss+6YdkL7wsOxWmj3Pxe7RP9x14S6d2uMPlTH3c7IyBfyRVficPM3
         xvWHpk9McnBDd3iSt4dmfo5YKB8oAjQ9H2LS3gk8lBqp82Nm22TKD/qIjvW08TYEXto0
         a8kj40ArVNnwYwVH7j1yD/2dRBmNLh48VBgL2N4OQIrZsMbQUrNB9VjJGNb20hwiMe//
         fOBAV4dlXQFQhuKuhxHPeSG1N58GDEcyZnmV+E068O3ck1bSQ/AvO+Co9gQYDt3BmmQd
         goHcHSMQJ//LkkFDpeDZeNy2D8XI38/pnpeJsrY9rtDZpiy4y4mWYewTrOnyZvn6Xun8
         teGA==
X-Forwarded-Encrypted: i=1; AJvYcCUxS9EXbyiG6T1t1Q6+ErqBVfLDlImurcnFtHi6r+uxu4QT2HvrbukJfUXASAsdeooTv8sYE8z6AQyw2ew1x3rR@lists.infradead.org
X-Gm-Message-State: AOJu0YzgWhYHeeqIbfWT9NdHod0PyU4Sh6N9BccWryr2/Ua8NeCcwtrV
	7/RPVK08SS4QUY+v3UHZbDYIOVakwJP8MXZI/+xBHjjHEQMF4h0PCRDZWLQY1RcvvRA=
X-Gm-Gg: ASbGncv1I+L2pGkVNFXSmvKt1+rsSZbK3jZ0TULrHq3dizx3pxa1w03AWTJWNoFE5y/
	6TU7zD11+DX4hPttO87XRaaIMi7mdzSOOKeQYSrfU+mQmTxan21Fr3lvmexYn+D9K87EjeD6egM
	Fe+5gPzNoUGafO10O0NCJqa+HARwtFjoZBt/fhapUf5XY5NnkRTdZ22fs+jS4brwEsDxrEbnYHx
	C0oiyc97gZnF0KLoK871spKyOFMYTb5XTlV5g40AwngQBHR3o5vvoItbP1u91WsQWoqwY1mLDCa
	pnU/8s7KvSKoyr9/sGKXedzBlVu5oNQFmAvpqTOn/efa81Q96pcddKg9Yt+SC4Kp0FgGCjwv/xe
	IQfPDhAtO68rybXqbbHPRYAIe1OwA8dIBL9ddSc/LDHExVd4Ke5ImQMzlcwRqEJfIOHjuFccQWj
	D8hGsRMKQPLhGKw7OClIE/0FwuQwg7XMRl
X-Google-Smtp-Source: AGHT+IGspC1YV2yyiMXXnAe8/Td7EsFQhaqJU5qYzu5f0NQl+Us+ioM0vDMgGxEbw6PNx9+MNqPMRQ==
X-Received: by 2002:a05:600c:474b:b0:477:9dc1:b706 with SMTP id 5b1f17b1804b1-477c01b494fmr204934695e9.19.1764210029052;
        Wed, 26 Nov 2025 18:20:29 -0800 (PST)
Received: from r1chard (1-169-246-18.dynamic-ip.hinet.net. [1.169.246.18])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3477b20b5d6sm67743a91.6.2025.11.26.18.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 18:20:28 -0800 (PST)
From: Richard Lyu <richard.lyu@suse.com>
X-Google-Original-From: Richard Lyu <r1chard@r1chard>
Date: Thu, 27 Nov 2025 10:20:20 +0800
To: Thomas Zimmermann <tzimmermann@suse.de>, ardb@kernel.org,
	javierm@redhat.com, arnd@arndb.de, helgaas@kernel.org
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 0/9] arch,sysfb,efi: Support EDID on non-x86 EFI
 systems
Message-ID: <aSe1ZBXa3JBidhem@r1chard>
References: <20251126160854.553077-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126160854.553077-1-tzimmermann@suse.de>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_182031_161248_79B59205 
X-CRM114-Status: GOOD (  25.27  )
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

Hi Thomas,

I am attempting to test this patch series but encountered merge conflicts when applying it to various trees.
Could you please clarify the specific base commit (or branch/tag) this series was generated against?

When testing on the next branch on commits 7a2ff00 and e41ef37, I hit a conflict on PATCH v3 4/9:
patching file drivers/pci/vgaarb.c
Hunk #2 FAILED at 557.
1 out of 2 hunks FAILED -- rejects in file drivers/pci/vgaarb.c

When testing against 3a86608 (Linux 6.18-rc1), the following conflicts occurred:
patching file drivers/gpu/drm/sysfb/efidrm.c
Hunk #1 FAILED at 24.
1 out of 2 hunks FAILED -- rejects in file drivers/gpu/drm/sysfb/efidrm.c
patching file drivers/gpu/drm/sysfb/vesadrm.c
Hunk #1 FAILED at 25.
1 out of 2 hunks FAILED -- rejects in file drivers/gpu/drm/sysfb/vesadrm.c

Please let me know the correct base, and I will retest.

Thanks,
Richard Lyu

On 2025/11/26 17:03, Thomas Zimmermann wrote:
> Replace screen_info and edid_info with sysfb_primary_device of type
> struct sysfb_display_info. Update all users. Then implement EDID support
> in the kernel EFI code.
> 
> Sysfb DRM drivers currently fetch the global edid_info directly, when
> they should get that information together with the screen_info from their
> device. Wrapping screen_info and edid_info in sysfb_primary_display and
> passing this to drivers enables this.
> 
> Replacing both with sysfb_primary_display has been motivate by the EFI
> stub. EFI wants to transfer EDID via config table in a single entry.
> Using struct sysfb_display_info this will become easily possible. Hence
> accept some churn in architecture code for the long-term improvements.
> 
> Patches 1 and 2 reduce the exposure of screen_info in EFI-related code.
> 
> Patch 3 adds struct sysfb_display_info.
> 
> Patch 4 replaces scren_info with sysfb_primary_display. This results in
> several changes throught the kernel, but is really just a refactoring.
> 
> Patch 5 updates sysfb to transfer sysfb_primary_display to the related
> drivers.
> 
> Patch 6 moves edid_info into sysfb_primary_display. This resolves some
> drivers' reference to the global edid_info, but also makes the EDID data
> available on non-x86 architectures.
> 
> Patches 7 and 8 add support for EDID transfers on non-x86 EFI systems.
> 
> Patch 9 cleans up the config-table allocation to be easier to understand.
> 
> v3:
> - replace SCREEN_INFO table entry (Ard)
> - merge libstub patch into kernel patch
> v2:
> - combine v1 of the series at [1] plus changes from [2] and [3].
> 
> [1] https://lore.kernel.org/dri-devel/20251121135624.494768-1-tzimmermann@suse.de/
> [2] https://lore.kernel.org/dri-devel/20251015160816.525825-1-tzimmermann@suse.de/
> [3] https://lore.kernel.org/linux-efi/20251119123011.1187249-5-ardb+git@google.com/
> 
> Thomas Zimmermann (9):
>   efi: earlycon: Reduce number of references to global screen_info
>   efi: sysfb_efi: Reduce number of references to global screen_info
>   sysfb: Add struct sysfb_display_info
>   sysfb: Replace screen_info with sysfb_primary_display
>   sysfb: Pass sysfb_primary_display to devices
>   sysfb: Move edid_info into sysfb_primary_display
>   efi: Refactor init_primary_display() helpers
>   efi: Support EDID information
>   efi: libstub: Simplify interfaces for primary_display
> 
>  arch/arm64/kernel/image-vars.h                |  2 +-
>  arch/loongarch/kernel/efi.c                   | 38 ++++-----
>  arch/loongarch/kernel/image-vars.h            |  2 +-
>  arch/riscv/kernel/image-vars.h                |  2 +-
>  arch/x86/kernel/kexec-bzimage64.c             |  4 +-
>  arch/x86/kernel/setup.c                       | 16 ++--
>  arch/x86/video/video-common.c                 |  4 +-
>  drivers/firmware/efi/earlycon.c               | 42 +++++-----
>  drivers/firmware/efi/efi-init.c               | 46 ++++++-----
>  drivers/firmware/efi/efi.c                    |  4 +-
>  drivers/firmware/efi/libstub/Makefile         |  2 +-
>  drivers/firmware/efi/libstub/efi-stub-entry.c | 36 +++++++--
>  drivers/firmware/efi/libstub/efi-stub.c       | 49 +++++++----
>  drivers/firmware/efi/libstub/efistub.h        |  7 +-
>  .../firmware/efi/libstub/primary_display.c    | 41 ++++++++++
>  drivers/firmware/efi/libstub/screen_info.c    | 53 ------------
>  drivers/firmware/efi/libstub/zboot.c          |  6 +-
>  drivers/firmware/efi/sysfb_efi.c              | 81 ++++++++++---------
>  drivers/firmware/sysfb.c                      | 13 +--
>  drivers/firmware/sysfb_simplefb.c             |  2 +-
>  drivers/gpu/drm/sysfb/efidrm.c                | 14 ++--
>  drivers/gpu/drm/sysfb/vesadrm.c               | 14 ++--
>  drivers/hv/vmbus_drv.c                        |  6 +-
>  drivers/pci/vgaarb.c                          |  4 +-
>  drivers/video/Kconfig                         |  8 +-
>  drivers/video/fbdev/core/fbmon.c              |  8 +-
>  drivers/video/fbdev/efifb.c                   | 10 ++-
>  drivers/video/fbdev/vesafb.c                  | 10 ++-
>  drivers/video/fbdev/vga16fb.c                 |  8 +-
>  drivers/video/screen_info_pci.c               |  5 +-
>  include/linux/efi.h                           |  9 ++-
>  include/linux/screen_info.h                   |  2 -
>  include/linux/sysfb.h                         | 23 ++++--
>  include/video/edid.h                          |  4 -
>  34 files changed, 321 insertions(+), 254 deletions(-)
>  create mode 100644 drivers/firmware/efi/libstub/primary_display.c
>  delete mode 100644 drivers/firmware/efi/libstub/screen_info.c
> 
> 
> base-commit: d724c6f85e80a23ed46b7ebc6e38b527c09d64f5
> -- 
> 2.51.1
> 

