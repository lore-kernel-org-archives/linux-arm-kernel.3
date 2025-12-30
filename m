Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF81E9412D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 08:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TKytMjDcx2cEgvRyAJOuwCgpAgUbSodYKmBemClDjaM=; b=GWpKesuBJoEDfOSBJKoALo9WDL
	nUaEzryht5SL1jcxQwmWY4h1gc/3Ey1vrilC/xjPILs6IJ/O7qJc60oHD+hEF43iS34UE9OOHr2av
	hV9ip+Q93v6SixyFD80gVX5LOIIYtuXKm5zMCmhXKAKpVmKdG/WNWje8zvBW6ywNQ2IWc/AhUvNP3
	amuT1ZSlQLcT6BK1XmID+XEQTjFzSfjfaw/X5Jdl3eSDTkos8dlstuZz7xblVUJpBMcEGi3XvxhPi
	Ai9nvvpHJVD+gf1neoyMGAhhuaDmDsk4E6ftE9HrElT/PzTFd41lHz/RU+hDAMhy2NKte62kJ46rN
	3XHTuJJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaVRB-00000004bIs-19bs;
	Tue, 30 Dec 2025 08:50:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaVR6-00000004bI0-3AYE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 08:50:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767084633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TKytMjDcx2cEgvRyAJOuwCgpAgUbSodYKmBemClDjaM=;
	b=dp/CvCmY0c45pt7oNwop83vwess7RJj781yLXRQGL3BIqA1JFQ32EmYYyNc4cAvkLE1bXq
	C3xPdDAJQqHbXWbj0r/zurGw47oHGK0n1PfPnMC0t/TrpWOVHNRHnM3F6/m7ZzIttyIxeZ
	yEcS8nduMhlBG+HtO/HWc3WX9t4bYb0=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-306-6Lq_FMlqPt-7ltw2YqbmrA-1; Tue, 30 Dec 2025 03:50:32 -0500
X-MC-Unique: 6Lq_FMlqPt-7ltw2YqbmrA-1
X-Mimecast-MFC-AGG-ID: 6Lq_FMlqPt-7ltw2YqbmrA_1767084631
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-3fda5f60035so6407050fac.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 00:50:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767084631; x=1767689431;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TKytMjDcx2cEgvRyAJOuwCgpAgUbSodYKmBemClDjaM=;
        b=BbDP3HpvjA3jVQnexHeQuhApeYSmBMIw0GUgkYcYOt3fZzZtZUdoDMqemfQIxXQFnW
         qQDxD9u2YoeelmgBWrtTL2D6Bjck+MOWo0ds8FMZeQsE8t+UmeQ+jGaIanh43SyTNadH
         k+V7aygcvE4mp64TqYti1F0x/vVmN9HmSNnkkskeMg9joPw+px3DPJZwU7rVNF+KB10k
         G7fToqB88xRlcEDKyVbHAzEqShlR3u6gtvYhA1f3OnkYQFVBaBimaTa0/nmp6b6Ay9n2
         xyjkZZUJ3oTVyXEOt4+KHoy0qIiLF9+rY2p9RN/eR/6m1lLfVR4C/i2bJhkEfhMujFsS
         sV2g==
X-Forwarded-Encrypted: i=1; AJvYcCUkAIXOpoRc4uOrmCuls5grzkBpqOKn58bCbDM3i8n76EuzYuDWnXO8W5b5GtZGOnx4FdnoK73GZAGK/KlUDIli@lists.infradead.org
X-Gm-Message-State: AOJu0YwuBy0c2YBPidLO/UaGCzDIQ1xOhODzgGahisDHQUmcV7dCajz+
	378apnIXHriMTQRuoTgyK8zOatHOabD1tXCjGR42n6gsAZ87Mjvwr6DbN5dAZZtBj4JdN+bQEZ7
	2IDXf02GM91wYwsm95jomiuv4N0v/t299OnCIkxP/R7AOq2+rX5/dlsZQA+hQ15B8Wd8Z8GdQt4
	3J
X-Gm-Gg: AY/fxX6mr+K7znyA/hNSDoNDZ9B29dEp/cNwfCqFZ7GcXx9EZDeIwHlQJROSec4wqLh
	ncYSUePHBqe1ztqlOfCZbtbnXBxEY5OLoK7Lu2PF0+eTm+FpwqWVj8l43au45t7tfUoNyWgKE8+
	npK4fWeVTneMuol1Prj5CS0edhaiD3naGDxldOqSr9vp4jIOYFSGod9oAHlye+o3FEjGIc/1OoE
	AbTUG/KOehBr4f9g1q+aYjM6YhSa65tlIWdLYRciRVTAHWPdjVRcL9SoupedJPTM2IfAZMVfym8
	xGx+ocyiuk7nmvzweHYnz3OF5YoYwIKz4TMb/jIk8wtbTyqf7gAd3/2LnTPDiyC2VYS9U2wAV4F
	S
X-Received: by 2002:a05:6870:7d8a:b0:3e9:35d4:213f with SMTP id 586e51a60fabf-3fda56056b2mr15471524fac.10.1767084631231;
        Tue, 30 Dec 2025 00:50:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGMfpvG2CCJxNM6ePOW5CvdhtIiGZOipOUwNDSwmNEEJmtJ5IiPBkGWUWkmOkbvP8RoitQvSQ==
X-Received: by 2002:a05:6870:7d8a:b0:3e9:35d4:213f with SMTP id 586e51a60fabf-3fda56056b2mr15471513fac.10.1767084630711;
        Tue, 30 Dec 2025 00:50:30 -0800 (PST)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3fdaa92b5basm19742429fac.6.2025.12.30.00.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 00:50:30 -0800 (PST)
Date: Tue, 30 Dec 2025 16:48:14 +0800
From: Coiby Xu <coxu@redhat.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>, Baoquan he <bhe@redhat.com>, Dave Young <dyoung@redhat.com>, 
	Kairui Song <ryncsn@gmail.com>, Pingfan Liu <kernelfans@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, open list <linux-kernel@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" <devicetree@vger.kernel.org>
Subject: Re: [PATCH] arm64/kdump: pass dm-crypt keys to kdump kernel
Message-ID: <aVIR84RJSv42YEP1@Rk>
References: <20251226141116.1379601-1-coxu@redhat.com>
 <20251227-funky-swallow-from-pluto-910b9d@quoll>
MIME-Version: 1.0
In-Reply-To: <20251227-funky-swallow-from-pluto-910b9d@quoll>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BkFuLOshgjjkFFqOBwg3nx9IsKlM_5W009J4GwNcYJY_1767084631
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_005036_868206_859D014C 
X-CRM114-Status: GOOD (  16.60  )
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

Thanks for your prompt feedback!

On Sat, Dec 27, 2025 at 02:14:16PM +0100, Krzysztof Kozlowski wrote:
>On Fri, Dec 26, 2025 at 10:11:15PM +0800, Coiby Xu wrote:
>> Based on the CONFIG_CRASH_DM_CRYPT feature, this patch adds
>
>Don't use "this patch". See submitting patches.

I'll use imperative mood in next version, thanks for the reminder!

>
>> LUKS-encrypted device dump target support to ARM64 by addressing two
>> challenges [1],
>
>
>...
>
>> +static void __init early_init_dt_check_for_dmcryptkeys(unsigned long node)
>> +{
>> +	const __be32 *prop;
>> +
>> +	if (!IS_ENABLED(CONFIG_CRASH_DM_CRYPT))
>> +		return;
>> +
>> +	pr_debug("Looking for dmcryptkeys property... ");
>> +
>> +	prop = of_get_flat_dt_prop(node, "linux,dmcryptkeys", NULL);
>
>Where did you document the ABI?

Thanks for raising the concern! I'll send a PR to  
https://github.com/devicetree-org/dt-schema
and include the link in next version.

>
>
>Best regards,
>Krzysztof
>
>

-- 
Best regards,
Coiby


