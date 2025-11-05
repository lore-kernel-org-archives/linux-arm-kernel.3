Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E734CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 22:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iBkyGpcDemQpY2M094SqDLojxus+6NpH3+OHJK4/jHI=; b=eErkIivfgKv3XTxcVvSwC1rdm9
	eIeeTRanJwxDbK/d5YCwxsEI+uYg+DwuYN2N5BKg8iERoEjugVK6w6EIrwSWZKPzggDyIcVnBu1PR
	4bQi//JZHvifvNk10IRV2pNXdj82Y6Y5RgqIXktR00ENgdyXEOVf++YEUs4RianyKaGfkN5eavDW8
	z4qAwbln9snGx7kuQnWfblqREGS71edJF5fp+urTgKoRlSIzJfQRYodv/5JSecdK3OSNXoASiHVZ+
	qHqN51KN9njtiiqkAJgf26lHQ2FFN6JnDrvfsq1+JKvN4wK+K201nCmmwxnxcxzpYgknSfZT+G3Q+
	mlWdqjjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGleX-0000000EYx2-0K5a;
	Wed, 05 Nov 2025 22:06:53 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGleS-0000000EYwX-110d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 22:06:51 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-295f937d4c3so2667445ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 14:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1762380407; x=1762985207; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:to:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iBkyGpcDemQpY2M094SqDLojxus+6NpH3+OHJK4/jHI=;
        b=tajg8SxFgrFIgWCB48sLq64Lu+b77TvFTX/oOuY8FhpenoE55hGQ8EyIL+aysr4PeM
         2bDaOBS+BKsGAXe3X9Ff63KOnXw1G4d0ZYJKscDW+1O6klGDvT+Y5eLD4JVCANrVRWam
         iiMYRvD6UVgd6RO+7jXs+9X8OEY08MZgn2jHACQITYpWoxGS9v5pHLQa2x+WaYOcofNN
         PclI0mnS6Z+waiyAH+IM19DvLSlB2G4qTOnQ8a0wnEjtaGAfuCwttgJC9M/oy8TRgiFz
         gNwF9nk5UW46hBgHY7LF8b0Q+XBkcnTRahzK2V1AKWBApegWUbwAJXNkGilSwJxCpuVK
         P9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762380407; x=1762985207;
        h=mime-version:message-id:date:references:in-reply-to:subject:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iBkyGpcDemQpY2M094SqDLojxus+6NpH3+OHJK4/jHI=;
        b=HYZaK9TpM42bs3TN6KPgI11N3Vg8WsBlIKcQuIiPYlgLWmeBytwA6F1EXkMS0hHz2f
         QfRhTvZEPeruFePFzbTYi2e7FxOuSK+rrs28KGUJS1kSj6fwU2HRi6X0WRWIPc2fb8wc
         DB2SLXpxwuUOMP63HxbdmsBDrA/KPt+tBz231Y6U27JPVA+hTnwxjqcfxuBWKiteHhqO
         SUdLnPK7DabVE1mq/3YA7jU8s14B/jWy5bUpfO/qLqfTMenvCD0kSJg2i8/hDDyL6Na2
         4DhIY4bIDkUqFQldUu+iXsis/zBiIC6BjQH4MRSZcE9RKDU5d/96t3lGWkMqmvVzTVAY
         huoA==
X-Forwarded-Encrypted: i=1; AJvYcCXEZAJiuti24aR2AfrZvUtC9JaGXFO1XaI+NK6LJ4xBUWpEcVMNSRVqQJZJwUoM1Z9Ujw1ZofKpfNXbQQ7VF7Lo@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3MNBhfQ3DEL+UtfoOo287X4ZeG78jOxKz07m9TFvGc/TOpN/F
	ATn7UlGkjMgboutBAADXvZvxr3n1zNH6QbKHTjSQkTXC6lzdAcjtfytsegnaA1+hzUo=
X-Gm-Gg: ASbGnctSzhMkkOU1mFgPRkx7pVV/1Zv/UM+9eA5qqzcemRcpkOEz2rO2iXtUY46M7uh
	wi5HzWD8lD/Dr2dmuVWj5mJux5ktWWh0IdS+2JQtupwN1OvwAFbAmXWCIKxYvy3iwTiwV+QSV1o
	/W9yNvdjjfEVOGJaZ+bHpirvg+G+ZVsw5dqj1ibcmSlGJq83jl1oyynkSU7uK8IUEc+3o2LjSJc
	kCxSFPRneZg4d/7s48pQTuNyFs2aX+AvuVIEr3MGgPxcon0Xgx0ociYZTBbD0OQiLh4o8Z4LKgN
	kZ35vz+6QRQzwU1We0qAGizCkVt7pFQ0N8cpgcG906nhKJh3ibbD8bi5Jj6UmbRpAjYkRS4fm8r
	ATSssQZLGtSwQt3R/zARgn9BG9kvCLX1JctMT64MXlW2IxZaa2YrJppyo2aSn6ESrBfyHtcRsLA
	==
X-Google-Smtp-Source: AGHT+IHXI8ToUsXPn1H/3Ag+W1Lf4830EcbI35NKWBjF1weadPXztynkJTg8EPbjmSTpnwucHe3dOA==
X-Received: by 2002:a17:902:ce90:b0:295:8da6:24b6 with SMTP id d9443c01a7336-2962adb1280mr71683995ad.40.1762380407441;
        Wed, 05 Nov 2025 14:06:47 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096dbe4sm5587205ad.11.2025.11.05.14.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 14:06:46 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: aaro.koskinen@iki.fi, rogerq@kernel.org, tony@atomide.com,
 linux@armlinux.org.uk, tytso@mit.edu, lukas.bulwahn@redhat.com,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH] arm: omap2plus_defconfig: enable ext4 directly
In-Reply-To: <176229761977.2840692.1048568589731485574.b4-ty@baylibre.com>
References: <20251013120753.101582-1-andreas@kemnade.info>
 <176229761977.2840692.1048568589731485574.b4-ty@baylibre.com>
Date: Wed, 05 Nov 2025 14:06:46 -0800
Message-ID: <7h7bw4i16x.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_140649_741302_065F7FD1 
X-CRM114-Status: UNSURE (   9.37  )
X-CRM114-Notice: Please train this message.
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

Kevin Hilman <khilman@baylibre.com> writes:

> On Mon, 13 Oct 2025 14:07:53 +0200, Andreas Kemnade wrote:
>> In former times, ext4 was enabled implicitely by enabling ext3 but with
>> the ext3 fs gone, it does not get enabled, which lets devices fail to
>> mount root on non-initrd based boots with an ext4 root.
>> 
>> 
>
> Applied, thanks!
>
> [1/1] arm: omap2plus_defconfig: enable ext4 directly
>       commit: 810c5ef6efe9a2be3203a50de781d9050e8b9920

I ended up dropping this patch because it conflicted with patches
already in Linus' tree

  c065b6046b34 ("Use CONFIG_EXT4_FS instead of CONFIG_EXT3_FS in all of the defconfigs")

If this is still needed, please respin.

Kevin


