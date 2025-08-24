Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EAFBCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 18:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cJNInCKotokpg08dFdCyoptfoiTsDxT23ewwFqVxTWc=; b=sjNm817OeTAsgjrjTh5xzTNUJt
	CVQ4BB3Mkf6yc66wVTM5hHpwhiB8J4Kx62Dmb9ZHroe1gfD8BrKu+SS325b7OQlO8ME7UjrJrZXkN
	XHjVwpOdjA/BuNre0NGL+1mBqwEscLdkaXoIN+r2nz9hBeB1huqzMkp48tMEZvT0Qfye+8cXEr0Nz
	s9Hw9fpQCamGq3KxII2H06O4AnUjkkOvyeflP6RcpG3R5JjUESo6i30t/MHCYU/Ppc7jOBWDiwKdA
	8cgWa/Ji9lYRlaqEphIUAfJdsy+if3oLEleE+q81P48vgxMRYx0ezLWgT/nuIkHA4GeHYzILGxGg3
	ISxEhtQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqFgm-00000006Skj-3au5;
	Sun, 24 Aug 2025 18:43:36 +0000
Received: from mail-wr1-f51.google.com ([209.85.221.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqFaU-00000006S6v-2SDB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Aug 2025 18:37:07 +0000
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3c7edd71bbfso1034603f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 Aug 2025 11:37:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756060624; x=1756665424;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cJNInCKotokpg08dFdCyoptfoiTsDxT23ewwFqVxTWc=;
        b=YrgIEs3V9UCii/WQPjGzUXfCQmz4ZT5a4tgQYN95FU5n/YSnhkZf+p09JZeT7/VYNt
         fsfCQGK0HpK0//6mixc7shW1ltxTnnrEKYIXU3/zORrhB5/SlBziNCBOTg/yrCDrPMbl
         WAXWNUrPGpwLeOPiiqgbzplYG5N2hDjb7uufQiEOxPaKTtmfPOUei1hOL1FrKgU/Vx5s
         vAifRfm8xwJvm9aY0rONU9V6d6pRsKtSczxFixwV2Ue8OLWqn3KSyjtLJ3YbA9xVIout
         /ZVPTGRHY381Srha9+TkbLFklJSMxOtcVWvZKPyNAl9rRYXR10v+5aRkkPmZmUU07lgf
         Fofg==
X-Forwarded-Encrypted: i=1; AJvYcCVgOSiovIemILg1JdXXzksUkLqqSdHDI38Ymi0oaUyOI9ZtjeWJjh9LF3Ed7HQcV9dsSu+S0KZTOlcYm4qPba/o@lists.infradead.org
X-Gm-Message-State: AOJu0YyhS2ni7qmrQN2WXQrz5ujQOI0fHSNun+PdH38yJkY0L2G3/JEo
	XvCrmCAizfLHtKWk32uT8Fiz738gBKiaHpjZ7hPg6XQs2jnFy0RgXayg
X-Gm-Gg: ASbGnctG/Otw5D5USU5xrrHlAOORg5VSPbUOteePWw1KIpk+RQ16utQeKJcxpbkZDwa
	5b9NmsWS45EOBI0CZlkGcGDYdxjrc05CJUJiA/1u9sKLh8BspX3xCbJQspBP3A18XUN7sc5pb3T
	18GPJ3cQEmVYdd4gPgpIlSU3dAiORedcI+JGFKAFJlWwBYMU4jGLrlKApMouU6OEdwRnkXpSHH0
	EnWh4yYzH46zIWSdmVIIG7RPqTO9rlASiJr+00iQduSHhpwiVhXIb7gApMUQl1afp9p70Frm7P/
	qxMDH0C+kcwH+AHfh8jXKAlPLc5dDBHL00NwAU2dhOBAk+6DqX2XiZDcBSkJ8zaX4oAIRgPMsVX
	q7hmZKfo20LGeT7xks9rzmccy9GzjZlJYMwoJbKrHZ8CEDqi4xhAJ+IAHFdcd0DqG9hj688RaDS
	/x9bFtzF56XpmeH4CRiQimxAhf6yBzMeUsQRCnbnC/QtcBmoIYJiRjBury
X-Google-Smtp-Source: AGHT+IH5j0UvIS82bjhhqeCU8DCDhmiIbkeoK5enM/feDWHI+hOlE37X2eJAFtCPWPCGzoWvQE05+g==
X-Received: by 2002:a05:6000:2089:b0:3c4:4e8:2539 with SMTP id ffacd0b85a97d-3c5dae0572dmr7290484f8f.14.1756060624369;
        Sun, 24 Aug 2025 11:37:04 -0700 (PDT)
Received: from ?IPV6:2003:e0:6f2b:f231:547b:d9c0:96ec:4a8d? (p200300e06f2bf231547bd9c096ec4a8d.dip0.t-ipconnect.de. [2003:e0:6f2b:f231:547b:d9c0:96ec:4a8d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c70e4ba390sm8680981f8f.12.2025.08.24.11.37.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Aug 2025 11:37:03 -0700 (PDT)
Message-ID: <dafff4b4-f022-453e-935f-6d79c4c57292@dietpi.com>
Date: Sun, 24 Aug 2025 20:37:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: wahrenst@gmx.net
Cc: arnd@arndb.de, bcm-kernel-feedback-list@broadcom.com,
 dan.carpenter@linaro.org, florian.fainelli@broadcom.com,
 gregkh@linuxfoundation.org, kernel-list@raspberrypi.com,
 kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 mcanal@igalia.com
References: <0c2840c2-241c-4f98-9518-6a3676286823@gmx.net>
Subject: Re: [PATCH 4/5] staging: vchiq_arm: Create keep-alive thread during
 probe
Content-Language: en-GB, de-DE
From: MichaIng <micha@dietpi.com>
In-Reply-To: <0c2840c2-241c-4f98-9518-6a3676286823@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_113706_628961_DADF4A8D 
X-CRM114-Status: GOOD (  13.54  )
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

 > Okay, after disabling all VCHIQ users including VCHIQ_CDEV and 
enabling DETECT_HUNG_TASK, i was able to reproduce it.

 > I will try to fix that.

Hi Stefan,

is there any progress in this regards, or a way we can help? Would it 
make sense to share the issue to the RPi Ltd. downstream repository?
https://github.com/raspberrypi/linux

We ship images with downstream RPi Ltd. kernel packages, but with 
non-GUI/server setups and low memory usage in mind, we disable/blacklist 
camera and GPU related kernel modules by default, and reduce the 
dedicated GPU memory to the minimal 16 MiB, so that our users report as 
well these errors every few minutes on their main console, until GUI, 
video codec, or camera features are enabled.

I am thinking about letting one kernel module load by default which 
releases the hanging task. But the majority of systems are headless, and 
really don't require any of those. Reducing the console log level or 
muting hung task timeout messages would be another workaround, but that 
could mute important messages as well.

Just in case someone else is in the same situation: I found the VC CMA 
driver "vc_sm_cma" module to be the lightest way of releasing the 
waiting task. Other than the camera/video modules, it does not pull in a 
large stack of dependency modules. With less than 32 MiB GPU memory 
(where the cut-down firmware is used automatically), it fails to 
initialise, but releases the vchiq-keep thread regardless. Its size is 
also tiny compared to the Broadcom camera/video drivers.

-- 
Best regards,

Micha (aka MichaIng)
DietPi project lead


