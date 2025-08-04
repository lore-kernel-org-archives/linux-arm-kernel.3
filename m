Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B12CC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 11:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jTfwzKdFO4Billpr1agzWiIuczhIZbl+uk2TO52W1Ms=; b=JOa6Fi6gWvjeo+RXIifSeJ15Rd
	O2P0KCCW3rOei3RCVx64tz1Wcgjdo5QxBNYrQR5BYPj4F++mwW0EwPn2k4/L+hKHbw+1XARH0ALGR
	hmrjWTqLvrnxqhqp3Ysa+oZOFRN5loge7/VpUyZqIRUJJ4jqXF/NBJlMasRoWVhlfzLl7Q4fMNUI1
	GEUyQo6oghkOUVDDN6eODt24e3yUPjgTRYszyh5VxhOe4QmgSM5F+2n73iIEgoW8EaakSYh/mLuAO
	kLkNd300MMqm+JMn07szJGcrJAnAKNgbKIn018YyEdf8pFqA4TrNu3oHn9CgEwj2vTyFYVvL/xSI7
	XLg/rv+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uitAw-0000000AGuA-2FXG;
	Mon, 04 Aug 2025 11:16:18 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uisqJ-0000000AEWj-44sk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 10:55:01 +0000
Received: by mail-wm1-x344.google.com with SMTP id 5b1f17b1804b1-45994a72356so10241545e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Aug 2025 03:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754304898; x=1754909698; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jTfwzKdFO4Billpr1agzWiIuczhIZbl+uk2TO52W1Ms=;
        b=Ca0BawqDlEwYVgn86HkLmsJeomXrH3Dk7wNiPDTy/RwYFHMpm6QnjbLyUHx4tfTDCv
         aERSjxGOkH5ShKBFZLYt/KMLg5SdEpvaGoxFyGN+4jzRUtiTx41tsiU8Fw1atV1I8jV1
         jih3Z0HHnizLixE87BGssMpYpq0wuIOn3Sx3sm0a6CKP8PuZB2MQeqmU8zF81xjcAO3P
         /mHqy+oTKie8tWowyh1I+ps+Rfq0Qj+sveK88gGcAW+WqRErkcKDfkU7oSWZuwkrUELA
         nFij4iRFaQQkk0Zh2qZdYYvkMaFvpK2wwNrGStLMflr4JpZdcqLp9anmZJDtnbLMi1iR
         C82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754304898; x=1754909698;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jTfwzKdFO4Billpr1agzWiIuczhIZbl+uk2TO52W1Ms=;
        b=ma6xHaFkBByiCw4IogmJLWbXnW9QFLJAtkT1zVtJoB8EX8eEpiCBSTVYIP7oNre6we
         TiN52ck35v68rTB5OvuIigbbJ2R6Qjq0joSVSLtAxCVeOEGV9bj2wiW0dDdnpTEpz+B1
         YUR1kLOqxC1AvJRbfuByyoYRPXnu4RjvGV6/6zgHFO/2U+9h5gQIfzYVIZxifb5qvXVi
         pyBWkSfitRGHIeJFiBwU7WmLx9wHwrzhh6Clmi7L1yc2rSeav2czuA6JqqXXgcI/99dz
         rSmkOYNtB/ki3wd6Jdjh2QUbESJDRqlJxsEy+eUnJiqMzi2ldYbyq86j0+dfR1DQnHYS
         PM2A==
X-Forwarded-Encrypted: i=1; AJvYcCXRwaBfYS1u5DJSJAHNiHtyaLDJ5YTpP2wLGbKxNYSzKJfS1WheNXG0fb/ItSrfGMoHZZD5erGatkczDTIuTelw@lists.infradead.org
X-Gm-Message-State: AOJu0YxS19uHcQr/oILn6jLaS8nxzZk3R/TZXmhDNtmKLGB9EZlyElTd
	yhFNXCtNVF4UMNMjW/sNEPG8wXmyCqwK0VpPpFKfbbLsQ/iWvR6ct6bXB4EH1p0sy2s=
X-Gm-Gg: ASbGncthyJUCZNyoqGflYZRAP+bYBmNzQ1dc7MB/HSwZ7wXNSdrMv2Ac+PDZLlgMcQV
	hMjemSM9Kxk7Xrmmx1cJ1swJHaJnqS2XNTubp0RliOUn8Qgq5eLV7JGHy1IRkETmOeTJa64VBBs
	rXN6PUEyTV+0bFx0q8y2QjyZBcDvtFtzKZMfr0/AKc5gMRKh52MdwTL768u/5NFcScMfd71q4GG
	F7LTKQZQQYtZTijpMfROyWDNEypuytOfyc1o5mOM94WHfvat7MR0wFSt8s5FfWnB1eUcpMLdryl
	edE4tDGMzjxI8u8HDuepaJ8iGTGeh/VETjbrRR6PoLod5mZwbTUc3RFTGNPDLKxdK8CYuxJz+n3
	Gjt7kwOo08fKcmxQGVEPJThceixeVLRkzPKQbsoeSzizP08Hr0XGER3HkEqgLvKu50X/nJ9zkso
	iSrXYVaS3toA==
X-Google-Smtp-Source: AGHT+IHolr1jpSS8jZ3V5wzzwBRxkUohemu1Nv4CGTNmDUpUc5jSaT3JjX0JSbIFj/1+2LYoFZrMMw==
X-Received: by 2002:a05:600c:5246:b0:456:1281:f8dd with SMTP id 5b1f17b1804b1-458b5f190f6mr71240945e9.12.1754304898475;
        Mon, 04 Aug 2025 03:54:58 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-8394-58e6-9e1a-64e5-71bf-cbcb.ipv6.o2.cz. [2a00:1028:8394:58e6:9e1a:64e5:71bf:cbcb])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c453d6esm15241180f8f.37.2025.08.04.03.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 03:54:58 -0700 (PDT)
Date: Mon, 4 Aug 2025 12:54:57 +0200
From: Michal Hocko <mhocko@suse.com>
To: David Hildenbrand <david@redhat.com>
Cc: Eugen Hristev <eugen.hristev@linaro.org>, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-mm@kvack.org, tglx@linutronix.de, andersson@kernel.org,
	pmladek@suse.com, linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org, corbet@lwn.net,
	mojha@qti.qualcomm.com, rostedt@goodmis.org, jonechou@google.com,
	tudor.ambarus@linaro.org
Subject: Re: [RFC][PATCH v2 22/29] mm/numa: Register information into Kmemdump
Message-ID: <aJCRgXYIjbJ01RsK@tiehlicka>
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
 <20250724135512.518487-23-eugen.hristev@linaro.org>
 <ffc43855-2263-408d-831c-33f518249f96@redhat.com>
 <e66f29c2-9f9f-4b04-b029-23383ed4aed4@linaro.org>
 <751514db-9e03-4cf3-bd3e-124b201bdb94@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <751514db-9e03-4cf3-bd3e-124b201bdb94@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_035500_010116_C885900F 
X-CRM114-Status: GOOD (  20.80  )
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

On Wed 30-07-25 16:04:28, David Hildenbrand wrote:
> On 30.07.25 15:57, Eugen Hristev wrote:
[...]
> > Yes, registering after is also an option. Initially this is how I
> > designed the kmemdump API, I also had in mind to add a flag, but, after
> > discussing with Thomas Gleixner, he came up with the macro wrapper idea
> > here:
> > https://lore.kernel.org/lkml/87ikkzpcup.ffs@tglx/
> > Do you think we can continue that discussion , or maybe start it here ?
> 
> Yeah, I don't like that, but I can see how we ended up here.
> 
> I also don't quite like the idea that we must encode here what to include in
> a dump and what not ...
> 
> For the vmcore we construct it at runtime in crash_save_vmcoreinfo_init(),
> where we e.g., have
> 
> VMCOREINFO_STRUCT_SIZE(pglist_data);
> 
> Could we similar have some place where we construct what to dump similarly,
> just not using the current values, but the memory ranges?

All those symbols are part of kallsyms, right? Can we just use kallsyms
infrastructure and a list of symbols to get what we need from there?

In other words the list of symbols to be completely external to the code
that is defining them?
-- 
Michal Hocko
SUSE Labs

