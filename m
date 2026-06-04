Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F75CD6E68
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 05:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dd5qbt0svs5X9PyH4+Z4KjGVOSti+IcuLa2FFG2ZmDM=; b=fDl2pNiKhjfcj7l0a78Uv7rBco
	KDSu4XgkqwulEObgxHGef2xtW5FMzoWbr3XUEpHHllORU7BhyWj6rM3+x9gYmVLnucjGJ/EFSlayV
	8zhum668X1AVeRfSMtBTlVeSSKWqljJPTDxaxqhrsp8DLjtoAdVFnZ1s83yvw/4U9J+x9zLILrMPT
	VUzMfLpuKaCMTl3FAFSqKZHhIEwwP6WTkGr51/Er77wI90317AB+uoRgIVF5+330fI5flHGd37NQH
	4v817Dd8JotPOD56l6ffm2gHOoKx3GTGsvufSFb4dGL2aCel5Csca7NQBhnTj2+pqkoADSxUkwwh4
	JnFXaxYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV0rf-0000000GBvE-2kTU;
	Thu, 04 Jun 2026 05:43:35 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV0rd-0000000GBu7-1moG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 05:43:34 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-485ecc0f2dfso257725b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 22:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780551812; x=1781156612; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dd5qbt0svs5X9PyH4+Z4KjGVOSti+IcuLa2FFG2ZmDM=;
        b=C2WJBoZIHsxZdYhb5U8BmxUjCHifDsDmwya9ucZfROpivHUNmt/AMCPtw9/l0GVSdB
         rO4V4EMbAA/pdwKGmQFF8MVk61IsErWWN0ASfZJ6JiMesT68bndwGrHSQSPGFRAveeC4
         Cc5APXaCr/lLmelYU8KbyhlDSTErsVyjbALxoW4hgdn9KwNvyDPE12DuoBbWKNF9WctZ
         rwaX2MB1gUjbJVE87QPHAjdIdoQmr3rHbg9CduxKnV9y6QWTHohCh9mhvPDx3OA8kht/
         VcEzEIm9kPdhby4Z+uWFRKw7JHY4wWXagSdOooMAWVwopWWKIgEvKh77OxPcky4njE+0
         WHIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780551812; x=1781156612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dd5qbt0svs5X9PyH4+Z4KjGVOSti+IcuLa2FFG2ZmDM=;
        b=kRuwaGvqGX9Jlac+arT4kUAOPDBJXVvoJSxIttKUIqAkCznmyDIQ+Xdrbu+NW/uUNs
         YlSLIi7jqU+/uSah3vKyS7kGeBFhqMLboecZUXUEXAIIDPYkITJK8WLVB3dc4BZqsc2j
         eNlZOj+R3efIBgxaaJGXFGUKvSFsf/M/kJMZ79ZvAvT/o1DTDgd9RM9lV/LV7o+3Fiaj
         nUQshGeOIaJShAFlqnHUppnGqMVRc5I/oxqL3ELNsvw+aRF0S1AI1o+UKQIaoO24AZUz
         FEekBFRPvNNaXHoZGG/4jQZZu7gdD9aD6dm8WVU9uGBnw2B7sROQyRLHPoNGHslViV+a
         pXXA==
X-Forwarded-Encrypted: i=1; AFNElJ8IK9NWRqK/dXHICMULYH3FUsnvfKBj+unXHInrC5w+pSI/BnuyFnZHSIA9tQV2C9FzsQqzMiZezaum3iPwHHoY@lists.infradead.org
X-Gm-Message-State: AOJu0YxkRE3WmjfvyCCgFosIFi+hNz5SExTkunIwu5rBastGcH1TVyXx
	Qk4s/lFsMRIDeCilHnVC5aSr2S26uI+1voJ8BI4iiG+4kCsUx47J4kRK
X-Gm-Gg: Acq92OE1dhJYJxUTSJD4OXzYCqVMOEYcIuMWqsRXw5Hb7G9KNEewumY6IJfayT5QGVt
	lbPLTcOqV8twSATD6WfcwIo6zsG17iRQRo2fTUA2YVTXdzAwZQKR1m5Liyzyv+FSbevHpvqu9Hm
	AnNOUFQTYJ4Tps0gFsgxqD3TLL4Wm/vuxY7ci8XF62kmNwaVBCrfCGi0NM6bEeoR1+ePDDQ7axe
	cknEM/3ApKahCLf7UAqFcAEen/JLq0tWGqqD0MQF92MMsmG/epTV7bKNxYtA/gAet7LM3qtBcxF
	9Yek/4fCpO+fwAEbYy9m8QgL/M9IYNrPJBcudSnRlX78fuk0nZ2UR+s5CYR4O6fRb4wiC5trjGw
	UrKuS0pEr/7AiXiqpS3+cieW10H6JrG21Gi8fzYLX5jeyk2qYiDOxN45SPxAWZAZvCMECtpof/S
	iK1qdyruOWz84RXsXYi3m1y/C9hmySTigYIzo898LhqeGs1ElDJOtoAub7N04eiyooixzrKDUkg
	ru4aSAD313FDVcPXiHDydJkKs5xhCZw3QjC7yG85W3+hNWZ8sQZ0YqmKzlHJhQOvza98Q==
X-Received: by 2002:a05:6808:d48:b0:486:4892:d562 with SMTP id 5614622812f47-4865a9a50b5mr3872126b6e.1.1780551812279;
        Wed, 03 Jun 2026 22:43:32 -0700 (PDT)
Received: from localhost.localdomain (99-61-165-33.lightspeed.sntcca.sbcglobal.net. [99.61.165.33])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e6e75c5495sm3197548a34.10.2026.06.03.22.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 22:43:31 -0700 (PDT)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: nathan@kernel.org
Cc: aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	bavishimithil@gmail.com,
	kees@kernel.org,
	khilman@baylibre.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux@armlinux.org.uk,
	lkp@intel.com,
	llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	rogerq@kernel.org,
	samitolvanen@google.com,
	tony@atomide.com
Subject: Re: [PATCH v2] ARM: OMAP2+: Add CFI type for omap4_finish_suspend
Date: Wed,  3 Jun 2026 22:43:29 -0700
Message-ID: <20260604054329.19450-1-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260525165527.GA18457@ax162>
References: <20260525165527.GA18457@ax162>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_224333_467319_E6D6ECD6 
X-CRM114-Status: UNSURE (   8.26  )
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

> are both pointing out that cfi_types.h needs to be included in
> arch/arm/mach-omap2/sleep44xx.S for SYM_TYPED_FUNC_START to always be
> expanded properly. I tested adding
>
>   #include <linux/cfi_types.h>
>
> as the first include line and both issues were resolved.

My apologies, I was switching systems and seem to have lost this somewhere
in the process. Sent a v3 with the include, thanks a lot!

Best,
Mithil Bavishi

