Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 081B0C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 05:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QcxcTXxA+rFMlTOa3pgLfmdjd6Gb7RSOSP8Ix0+TbY4=; b=pOQQi5oZqREAGUg53Rcs1meNl0
	FnYIsHQamGb1Kww9s9aGZIOxUiQ6rrQV9g2bja9GdSAT+owQXgJlmWE9LJRFBZZGUeCdoj0/7/X4c
	DcBi+MVARmqQIi8xH3kGzurjeEzgY5wFkgGFPWBt6Oc731hTHrlZyYXyN+ROC3bjZGACRp00leXIz
	nGkJIieS/VoVTUwtbdai5kENaCR7kbdFeHT0tbASR9ZGqq0XDwdi+NIZH28KTUl1TrANmNBEdHEei
	8ejRIvCDCLAU5sF0rkcKWjtZ5cMRlyqRfO8RsXErxC8KeHpD8TnCnPfCj/xsJr8xG47MdVbrloId0
	ZDrvf7AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thMRi-0000000GHdk-1jrN;
	Mon, 10 Feb 2025 05:35:02 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thMQK-0000000GHWD-0LzB;
	Mon, 10 Feb 2025 05:33:37 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6e451fdcae2so14966316d6.1;
        Sun, 09 Feb 2025 21:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739165615; x=1739770415; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QcxcTXxA+rFMlTOa3pgLfmdjd6Gb7RSOSP8Ix0+TbY4=;
        b=IXDqPyiDZN/WaKKIYSRBBKGRjQmb2N9ZLlL3uyKI0cSnHbiE4H7j0eWtHFcObCNXBl
         BnyegpvtqfXAaI2WUz0hgvJadCCh0iUbdDDfmFsTQ9ml9RMc6la1FDFtnbLz3oE8pXZM
         scsJXMDxC/4QJ9pW1FIx/7KX9blnRkUYIteRHX+Vl2YAH2p8JmyPxfBE9UkE4bo6wCFk
         GkUuimkVFAE2d3P4lT99K2cP/sUJq9WD38qgI+TsvLeCpMb77YLnGBZ83sc30xGXTImq
         GC7OUbFPE7kAhoNLUbsTbLrs7dicW6igloP8m9l4WtkVQR5T7LYtLG5gETk/XtuQE8J/
         m8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739165615; x=1739770415;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QcxcTXxA+rFMlTOa3pgLfmdjd6Gb7RSOSP8Ix0+TbY4=;
        b=FIHNuWL7gfwbO6QUJPpAgnEj5Q4pANaJ4LjkaWu9RNM7bwS137RlRa0ttk3EAqUz4x
         bdustWB2dU3lASdENRwZz1MszpQY2uuBsz3pRdmUZ04bME1uBen8mBDvJ1LVVc8I2HZh
         bA3SjptU1REUIYSuFj4rJtsUBdpbK0x3yAO3iq6rGsZrWa9nf2Uflie+IqFrl8cAzskX
         yKHY6LGv23kVvZI2hxxNl/6xirvDW9jKp/VJSCkPgKCw5A2N+KKCGZ3Ru0P4GUPu5WeY
         NytMM111IzZEc0oT5h7NQRpxZ9w2dmz31kbKue6alSKlwfBW29hMgdr4ZxW7xTKqgQZK
         dt4g==
X-Forwarded-Encrypted: i=1; AJvYcCVxe/9tk6GZJPxW+W+b8DjqAsjLM/4M6a2Zpq/155OdE2R7DhTsTDzUqtlBX1p1LEqLHil7jQg2CZKrLl0=@lists.infradead.org, AJvYcCXVOnzl23G2yZL+gel2pceSOBsLNHUU/c85RsVkpI40aCUMvnFZf2RErP3fCd2IamSvkmlSyzLaL7/qjMwVAjZ4@lists.infradead.org
X-Gm-Message-State: AOJu0Yye0EmVGKIawQxamuTQhw2yHDwBJCOJwLmw5F9UNncc1aaRmYM1
	3aTApChFe869Mw+RIyebrnLWcDVeWCyHMiAJ3Rf/p8yqZDOFNqqo
X-Gm-Gg: ASbGncvIcszU76QQF1SOfkIt55mw88vZyneIcy1qDpu7ulPbHjAosjmx0xQI9ceSplC
	iuMthkH9ZkejjeI99SzTA61UqKNLmyJkq+k3rPaqs6fb/aPyPAOvet/GbplVJ6KBfg3t19EqZhO
	udI46K+0erF+ssgqYhHLlXTJtchYeWxBYJ8i+d1scZNTo5r/Pmgw85N/Ez2ZP6UQcdQhtVtYsqg
	AM+d171bblnjfP9+E3GLnc7OJGvMdDwDR9HoK6Y/9dv+hzPOy1M/6c7OMXvd4ObevM=
X-Google-Smtp-Source: AGHT+IHOrT53o+O66ja4z7uaRdoPjEYG77YMak440BC7vH/+FiPz/BQZLFVDeZD1BTKSAYp8R+3oaQ==
X-Received: by 2002:a05:6214:194d:b0:6d8:a258:68bb with SMTP id 6a1803df08f44-6e4455d8759mr131696556d6.6.1739165614939;
        Sun, 09 Feb 2025 21:33:34 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e448819f8asm32926166d6.121.2025.02.09.21.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 21:33:34 -0800 (PST)
Date: Mon, 10 Feb 2025 13:33:29 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Yixun Lan <dlan@gentoo.org>
Cc: soc@lists.linux.dev, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sebastian Reichel <sre@kernel.org>, devicetree@vger.kernel.org, 
	Haylen Chu <heylenay@outlook.com>, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH 00/10] arm64 support for Milk-V Duo Module 01 EVB
Message-ID: <eoeyutuu4mrpsu7snkk5ll6kmm4344qsgbnncss6gerlcvvea7@usuf5v7w5ffp>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_213336_126954_CBE49C9B 
X-CRM114-Status: GOOD (  12.78  )
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

> It would probably make sense that the whole series would go into SOC tree,
> even though technically nothing prevents the reboot/reset driver to come
> in PM/reset tree. If everything would come together, `reboot` command would
> work out of the box.
> 
> [1] https://milkv.io/docs/duo/getting-started/duo-module-01
> [2] https://github.com/milkv-duo/duo-buildroot-sdk-v2/releases/
> [3] https://github.com/sophgo/sophgo-doc/releases/download/sg2000-trm-v1.01/sg2000_trm_en.pdf
> 

This reboot implentment across the RTC and 8051 domain, which is
still a big problem to be upstreamed. This should be designed 
carefully and needs further discussion. Adding these two syscon
compatiable may be not a good idea and cause some problem. I invite
Yixun to this talk and he may give some useful suggestions.

At last, I prefer this goes to an separate patch series, and
implement with rtc device.

Regards,
Inochi

