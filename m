Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F3AC56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 16:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UpSZxsO2+OojqlTHRs9iVFREpITIpLS70LTpaRzcVr8=; b=tE2EehXEhVxP03xt9/MTwfyFR6
	7L/gyS53kveb0OkP5bXuMWrqs1k0SEQR1BpoQ5JPQPm+czNGEamS8CfgBP72YSXeM5rvjL4rL8tYS
	ldHsJDaLv5627+U5JQIpCNuCLVmMAl9aOjaUeV0tLB1VnnTryTlpNvEz8HXnBrFeGDN9AGXzCyD2W
	jUFpjqhCSb6iyMdsOAv6RuhTmx6pBymPNWnmvDbZNA0cy5M9YcfO68v8ldfVr0+Xdye6cL3UDWPWr
	6NV1V6aZTsalxIjD6BrO6NmxrqTGj1v1XVfEp4d8RWcRumrvYATKp+UMn7tj9HnUswlKf8cZI+kAn
	mja69x5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1It-00000006Fx9-2suq;
	Thu, 06 Aug 2026 16:50:47 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1Ir-00000006FvV-0M3D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 16:50:46 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2cc891373e0so30460655ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 09:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786035043; x=1786639843; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UpSZxsO2+OojqlTHRs9iVFREpITIpLS70LTpaRzcVr8=;
        b=B1MiSxaPBrkL0Go7jwBgRzVuZfJqpyMYbOPAUknSi8ciVNsEB6s/zpe/bc8lm6xTtV
         S0+IsPfkLjIXPXko0sevl8cPNiwOxANp7pKXe/dFw2UUMruhgzuFz07mOKS41I5XVmeo
         lDjbkr+G/kreOEjO6WM5cCND4E3WmNihY+QoM238GYBqeacV/yMx7z0KwB7RjbWnHyqu
         gKtqIUoWBsmBEHV1rwqIRIh7M70MiELddRp69BKtx6V2syiUE829yWUWdm34ZCenChyS
         XjfQarU78Rle2s5M9XTPw/05RKalMu3EB1mrBdKNRo2x5GYY9QdpI+hGLiHjHgShgt5D
         6yxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786035043; x=1786639843;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UpSZxsO2+OojqlTHRs9iVFREpITIpLS70LTpaRzcVr8=;
        b=LumpfgV2UGcktcTQls5/Vz/wxWtqmRFvYsr2oTV4aQvniFu0SBicKZeFea5c6MAHsm
         PnEJtDNjkTqd7Oq0htQusCD2/XsESwj2MlyHb1XjeVmOfZwNdIsB9b0qyvv979r9oLxO
         u3WUfxh4VSc7+JyxNG9JjAnckahU1jukIa9QoTSfamIBKW9VTZ8JXQA1L88fvfgR46sO
         mz43k+Sebh80V6I9jocW3Lvbix4KyK0xBpICIcGWzI+2zxL79tc4pIAuKkXMcPuANQ0A
         b9vC/SpD/anixqbFhw2JhTnHZkI5Ol0Ja+mjaVVoLjtjRHA38UkpRsDEiQX1J41zzpJM
         P18Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrf89+GEWvAG551U0ShwSwrC5JHNBgt4Oxoibn5vlPG65WtWDvPO668BgSlz6kp3BKWSAPr/PhYkwjj4Yi4YwKq@lists.infradead.org
X-Gm-Message-State: AOJu0YzZxvHDy/IQpQKQnWpL6GlRrqOfA+O/XlRKvkAjlPadflO7VKGT
	I3MDn23Zn9g5Z3do9DyK3/wu+NA5LAxsaWfgTv4yhQfghzwKK0tx8gl2
X-Gm-Gg: AR+sD11RNLU9sC8Z+m3QBx9Vi1xQU4lViFREH85zytQBWkXKI2sO6UD9rUCcRZRo7sH
	NJ1uhVSaiwURI4cszkx7QdY/f2iEGGWuohHOAnY8hSuR5ApCyDocXYFqQrTIvhPz95lv10QfNUF
	rjL6USLhZPtovvcyR/DsL0x2b6yxwCyT+g9zNz/jZmVqATD84j+qreUUc62icZ5TktxUwdfs1i7
	4xRhE3rlLbGRgrve6xZegvirPFKoP6DJh3X8qJ8miRgiHMAkDwGWdfDoWTe2CwzBWimVP9m2yNP
	lGtnLGtw4fqWPH6c6c0mx7wGdAZ2K3to+4YVmTeE65YX15MNZ3Ar37A01z2uRB48IRQlBoVK5lz
	RanII639ABm5h+LYVlzhNIF+Oh/MZehc6txW5G2xB2rE0Jz7Fq4KGRh3nXwSzgN65uoR0t/n0w9
	YYA19AnUoPqaTj7aJROJDJxwOm6KkPB0bbFSGguQVRYIKImDsEnVHVuRT8uBXLg2p9Sfp6
X-Received: by 2002:a17:903:2ac5:b0:2c9:b8b7:5d27 with SMTP id d9443c01a7336-2d0ca712d8fmr201739305ad.1.1786035042793;
        Thu, 06 Aug 2026 09:50:42 -0700 (PDT)
Received: from [192.168.1.113] ([223.122.38.120])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa4ec8c7sm34434975ad.80.2026.08.06.09.50.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 09:50:42 -0700 (PDT)
Message-ID: <0ea8c38b-0230-4ef3-acac-e43208d7c9b2@gmail.com>
Date: Fri, 7 Aug 2026 00:50:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] Apple NVMe fixes for macOS 15+ firmware / M4 support
Content-Language: en-MW
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Arnd Bergmann <arnd@arndb.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260806-b4-nvme-fwabi-v1-0-bde19ce8db04@kernel.org>
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20260806-b4-nvme-fwabi-v1-0-bde19ce8db04@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_095045_119902_FBCB82B7 
X-CRM114-Status: GOOD (  20.73  )
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



Sven Peter 於 2026/8/6 晚上11:27 寫道:
> Hi,
> 
> This series fixes a bunch of bugs that were working fine with M1/M2 NVMe
> controllers with older firmware but are now starting to bite us.
> With macOS 15 a new firmware is installed for the controller and both
> XNU and the controller are a bit more strict now. This firmware is
> required once we add M4 support.
> 
> The first patch fixes a panic that can happen when the controller fails
> to initialize, which now happens for the first time with the new
> firmware. The other fixes then make it work again.

For the whole series:

Tested-by: Nick Chan <towinchenmi@gmail.com> # pre-M1 controllers

> 
> Best,
> 
> Sven
> 
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
> Sven Peter (6):
>       nvme-apple: Destroy the admin queue on removal
>       nvme-apple: Don't set a DMA direction for commands without a data transfer
>       nvme-apple: Never set the opcode in the NVMMU TCB
>       nvme: Add a quirk for page aligned admin queue buffers
>       nvme-apple: Require page aligned buffers on the admin queue
>       nvme-apple: Drop the PRP null check chicken bit
> 
>  drivers/nvme/host/apple.c | 32 +++++++++++++++-----------------
>  drivers/nvme/host/core.c  |  5 ++++-
>  drivers/nvme/host/nvme.h  |  7 +++++++
>  3 files changed, 26 insertions(+), 18 deletions(-)
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 20260806-b4-nvme-fwabi-000386148b21
> 
> Best regards,
> --  
> Sven Peter <sven@kernel.org>
> 
> 
> 


