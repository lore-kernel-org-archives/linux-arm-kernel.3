Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62BB9C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 15:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BQGG8yXln03K6MK1Xes3T7st55EA/EQ+1R+tmJIGLy4=; b=LIZImE0DJ0tc1Llp5oFbaWhycG
	S2NZ3zSOulGpneBuOGKMyfSOvFRmA1VqVHs6fDvRfsE6Nd91Tj2BalxS0m3eA95dBp2WY4FyzfECG
	ybhfN0X1Np+ppP32vula/lqlqxrpUeilvR9SgFj7ZKAvYJjxOsN2QCzpG6+UM3Fq9vcgJcp3r16RH
	rmAd/w4fZeSF8HOv6avFWQIpEPQfZ6lmTTDhumetMCrrkGLieFiTAlG0OwkxonIQYBl5xc0dAP7FO
	Uy11Lym8Fami8/dklIA9G3asCaYC3DBfJQ5IehoXAo+8ujAI71SIg13m1HS/jhFnNexlWlSvBqzAZ
	/uYzP7LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7aAc-0000000EpK9-2axS;
	Fri, 18 Sep 2026 15:06:34 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7aAa-0000000EpJT-32LP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 15:06:33 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d8fb334ddcso7310115ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 08:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789743992; x=1790348792; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BQGG8yXln03K6MK1Xes3T7st55EA/EQ+1R+tmJIGLy4=;
        b=r0KIX8WSYBcMUu7tm2SFQn2uDP1lB4kqRcLJOyOiQ5JTq4lHKqVyynC5QrlOR9FYE+
         izx/X8pr+Q/bSdTRo+UyICNRit1ct2SNqdJy0oGMOGjZFm3IJGlVdMvL4NnGuL6lGJdE
         XMDlLQchhW4vBITHCgBYkiiJfUYupaokDGBELsEboZ/IFpOiQgHyZ6xFf2LBC9tf/q6q
         G1fv+9huZb60D5kJyP4ETpF02PJ72B56KVqyqdf7pzhNT0M1aOrIHDItQEp1YHFQqNlR
         4QI3gCfWNb1QtcAX86MLguOLt6fnmTrr9IR24+bf1gL/lY79Hr8J38ascvH/DUzJesyp
         09Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789743992; x=1790348792;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BQGG8yXln03K6MK1Xes3T7st55EA/EQ+1R+tmJIGLy4=;
        b=yjyg5tsL55yUGn2U+PeDOI0kzhu3nfj7jfx4M5T4zf+lbfhag6QYLjUXvkBgWdG0pu
         t5ITwfjBR3sAwKKBTWOg5PoO8aAtZd13Qe9S074/M51L1SmoNWR/RJ0pmpFsnYyez4fZ
         fx9SLT5VF1XLhPZH+okMcdYiUytlaEWgCm2hXcCYeFldXkxGtrRw3k3h80UrvdGLIOlq
         8xXgsKrqIRKIhtopPU8HaIGd9JschC8x/kBIhE5YrkKT3GrEREovo1pdYPM2pAXPZF+J
         QOxOI2jk5ZwpEz9GWuJIiymS4uYs4vjoI0U9bjltQ3CDGNAiRLMgjLB2sy0wWCuI/Xzj
         3LpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwgyUR46bFVBojCUqxmJQZ9Jlv7rcb3BLm2hw83N8MWWiPi6mTg3F6hjfEZ+kbyRgfWhpELBpagLvOy2Rgh+edB@lists.infradead.org
X-Gm-Message-State: AFuF++k4iCVecpiiu8HTrJSmlaD61z7S8BBwzKpTe8sTOxUJqtRW9oGQ
	B5wEK9niYG4v/LTIkIqQjqgLSN1+RJY9bo9HMtBEQdwocqSx9ag4Tr/n
X-Gm-Gg: AYBFou2FsQjYvERqC4oiIlmfwYmGDdNXWzkfBG5Aq+Adrc393wHRKr6aQvkPvoOq5kj
	RMa8B58xSqAwBhAXmxNqkYS3xSd5uNNh97AlGizfpCdNjG6v0axGtR8gJk3MSDCLB8tNEZDrPLQ
	K/STtzHHr5leRUOU7Cy0Cu1T2B4qesI0sTYOiQjt9sLe52wqjsoj4U9X3Yl0Ui0vY21Qhe7x9sn
	7Oefy4DE+lAVxZy8jm9nzbpLHKAotUiExWMyDpFZMv0vDI4NalLa6jKIGnM9WaCo9PcPgBZDGWi
	+UTKmVcESjBRaAlPqRzDF2fU3pVSNeu6uy8P7f6fi5DnnaCMArxMpVlPsI8kmdn8pe6RoV3Zglr
	5Vjv3dQli1BePWb/Xmt7p7zBlKbTPuW6NfR6RADaqVS+urOAgaZASQWB+fsPuLYlJGeH94VZ7mK
	m5TVzGZvmhCGxBS6BjNqIXsdVMZ2I+tQQ1GNy+jL/hoY+EAExzCUr6ZiyEFxy925dvXXmz7laLc
	IcqVXPHH1QUc2J/YdRbQcY=
X-Received: by 2002:a17:902:c947:b0:2dd:ad73:c93a with SMTP id d9443c01a7336-2ddb1bca6e2mr61754635ad.27.1789743991725;
        Fri, 18 Sep 2026 08:06:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb75819d7sm10071215ad.54.2026.09.18.08.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 08:06:31 -0700 (PDT)
Date: Fri, 18 Sep 2026 08:06:30 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Kees Cook <kees@kernel.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Kees Cook <kees+treewide@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] hwmon: scmi: Fix info[] allocation type
Message-ID: <2d9e2846-23a7-4580-a1e9-31b81eb74577@roeck-us.net>
References: <20260917211344.i.911-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917211344.i.911-kees@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_080632_759487_482FAE58 
X-CRM114-Status: GOOD (  13.89  )
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

On Thu, Sep 17, 2026 at 02:13:45PM -0700, Kees Cook wrote:
> From: Kees Cook <kees+treewide@kernel.org>
> 
> In preparation for making the devm_kmalloc family of allocators type
> aware, we need to make sure that the returned type from the allocation
> matches the type of the variable being assigned. (Before, the allocator
> would always return "void *", which can be implicitly cast to any
> pointer type.)
> 
> The assigned type of "scmi_sensors->info[type]" is
> "const struct scmi_sensor_info **", but the converted allocation type
> would be "const struct scmi_sensor_info ***", as the size was taken from
> "*scmi_sensors->info", which is one level of indirection too many.
> Luckily both element types are pointers of the same size. Take the size
> from the element type of the assignment target.
> 
> Build tested ARCH=x86_64 allmodconfig with GCC 16.2.0:
> drivers/hwmon/scmi-hwmon.o
> 
> Assisted-by: LLM coccinelle
> Signed-off-by: Kees Cook <kees+treewide@kernel.org>

Applied.

Thanks,
Guenter

