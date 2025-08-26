Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC1BCA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 14:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mTDpa33JS2qApYszgwNnpSK7UHfHjgv5egclBQN5xTA=; b=AOk5t791dKQGeectmfb2/06kMZ
	uimCX7xWtIKCaLfXCzBR1VA6LwPaJXsXKhHZgdo36pnJPG5tYTTfGTFMLRBkp5An+OTtSpXgh9QNR
	O5foLfel7nOiqLCdJOOzso0XDiZ7wr2ngUpC37z/hGVePlH5G5GFAbHQGlPnRflQJldenorEtXYRl
	OushyJj5iFw9RjHtasp3Xfp8y4TMekRlZxLRhy0GebaHLETCNp1VcOaRIblCOEcyochLbj0VMAot0
	tgJ2ih+uzMnJozX2QWQ2SBJT9M0z//6ggOprKjT6u29avZhPGfhSBD6W6pCv+vgimjHgyzlGURiWk
	bZ0CM9uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uquKM-0000000CCOm-2yiO;
	Tue, 26 Aug 2025 14:07:10 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqtnM-0000000C74a-0VQt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 13:33:05 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-3ec3b5f05e8so12599985ab.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 06:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1756215183; x=1756819983; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mTDpa33JS2qApYszgwNnpSK7UHfHjgv5egclBQN5xTA=;
        b=hunYYfCRU103no1TkTpMy+eCiiYgA+ZgvikN1uebpriLyCUj8wfmxShIdxxvjWYg1Z
         ACt536m6S8f9TfLwh3iPNQEtnVKFzZD/W0tmxHkKNIF/1ypj/INmNWI3SL3MMpfY8349
         XMaejryXCFeRQntclvwquE/6Ax9+CJwI0swsunejVqhf0OfqyPC78OrKI2Am7OkGD7L6
         D+2t0cFXcXx3RG1Fr1GtK5K2wsrBebIV1JO2VUpgq26kcVuX6ApXWQrmrMyDtK8byyvt
         aEafi30kjd6HAL64LJjmPL1ZsRpiMg3VExWBBPt9yoxAujmevmKdO/pk7yPvZsbob1gB
         aBBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756215183; x=1756819983;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mTDpa33JS2qApYszgwNnpSK7UHfHjgv5egclBQN5xTA=;
        b=D3DcG0vC9jSrx/5GDNnaXcrRCvd3eoFXUeNoQV0sxt/vmYHOwuXEe0hFQYJZZwLGNK
         cjy+qA2L7DQ4p4gYXJTH6OkQgozSaITORq9faBoQknEezRIJ59apZBPqsFq9ComZpnXf
         AFXCJxqY9r9xq9DzzZo/aCympAnGbHo5CvBCdjMXRNemPqTk8Eb0oxlINHViYN+OfMVa
         gc2is/sPSGlcYpMPbdkra8beJEQUKHXpNl2fRu259lQUR7LQinkorOFnxEDCmIk1sQ9s
         k+JgfbOfUGqdvFbSDvApoUsa0/iMrjUmQl98gK5AEVqsPEfZAPP3oXKk4terv47fKqbe
         YmQg==
X-Forwarded-Encrypted: i=1; AJvYcCW2omM0BsAzZPhfr6U6T5bm1UrsngEUVB5W96nHSGumfrJ+UvqjxhxnStotBKyQdWXr3nXIFsn/1rdW1/c5cRwu@lists.infradead.org
X-Gm-Message-State: AOJu0YwNgo5DCvhCVKiDT8r714C8MneKX5o9YNAFAS2FCybk+IDxmAyx
	KLm2lh8OJpLxGl2qFc3V8hTLaeUUxdAQocYVtg4s9iY+uwPJriVFs5fIuHGNttkasJo=
X-Gm-Gg: ASbGnct1Iwk2N6CM9aRFRDY1dgB7s6DnJZgrElBbUN8HpCaJB6oGMDyayKyYCXLtTYw
	hGb0V+ESWRD8kk3UwS0eywF0RO0lsrrF7F3wtsH6HOfFu6fEiVHgAeusR2royIed9GsULj/dhTW
	yeY4XULftE/taNoSfEgTNxq1IUSphKHNgRX69mtj+fCJtT3lH40xwZmXoywxN++P+z12fI2r/Nr
	Ahc/L6XvcZuPgi6OMrKCnvUsF0qWQ6hCemBR8iwo4mSHFwzfQ+IrY9rO5FGkGIi0sSkksGdssRr
	/fnbnGFjtl2aG81VOawQuig57hOJFL10ULA10Se+2oeqjX09Fk3oOxUoFw9Kj9slUlkBbADor1C
	rmawAX/EtmNbpJ6ij2fR3SQ5349l33A==
X-Google-Smtp-Source: AGHT+IHyeNqFLofJtawZSGlF7nwnpmwOET4pLDhklPZVdBrPT2USiWbLxPrFpiB4fDQsUH70NQxHfA==
X-Received: by 2002:a92:c244:0:b0:3ee:7c7a:c880 with SMTP id e9e14a558f8ab-3ee7c7acb24mr41586495ab.28.1756215183022;
        Tue, 26 Aug 2025 06:33:03 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-886c8fa63casm630889339f.17.2025.08.26.06.33.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 06:33:02 -0700 (PDT)
Message-ID: <4d8cfe65-a8fd-4f3d-a324-8873f4016ad0@kernel.dk>
Date: Tue, 26 Aug 2025 07:32:59 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] floppy: A couple of cleanups
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Helge Deller <deller@gmx.de>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Fourier <fourier.thomas@gmail.com>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, linux-block@vger.kernel.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>, Ian Molton <spyro@f2s.com>,
 Russell King <linux@armlinux.org.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Denis Efremov <efremov@linux.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20250825163545.39303-1-andriy.shevchenko@linux.intel.com>
 <175615490112.25116.3742797696959119744.b4-ty@kernel.dk>
 <aK22kUhlxlyvVLax@smile.fi.intel.com>
From: Jens Axboe <axboe@kernel.dk>
Content-Language: en-US
In-Reply-To: <aK22kUhlxlyvVLax@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_063304_272011_28163DBB 
X-CRM114-Status: GOOD (  15.61  )
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

On 8/26/25 7:28 AM, Andy Shevchenko wrote:
> On Mon, Aug 25, 2025 at 02:48:21PM -0600, Jens Axboe wrote:
>> On Mon, 25 Aug 2025 18:32:54 +0200, Andy Shevchenko wrote:
>>> There are a few places in architecture code for the floppy driver
>>> that may be cleaned up. Do it so.
>>>
>>> Assumed to route via Andrew Morton's tree as floppy is basically orphaned.
>>>
>>> Changelog v2:
>>> - combined separate patches sent earlier into a series
>>> - added tags (Helge, Geert)
>>> - fixed typo in the commit message (Geert)
> 
> [...]
> 
>> Applied, thanks!
> 
> Ah, thanks! It's good to know you can take (and actually did that) them.

I've always been happy to apply floppy fixes or cleanups, I just treat
it like any other orhpaned/unmaintained block driver.

-- 
Jens Axboe

