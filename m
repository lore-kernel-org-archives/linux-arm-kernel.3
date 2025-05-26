Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C50C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 14:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zUalJN5MUy3YAR3UhbDJtGyL6WBv2slh5mtlXFKO8b0=; b=TQ3B/X917/RARG8VlB3kS0uEOY
	qiOzBqIcGgeS+eSd4uqj0XBcJm5WTHgzxBFZPeaGrPyOI7kH0OUe2VU0LIOU4Uq5o7Rh0mgSIktNJ
	bNTny0i8m8ViNzY20jyUq3qlv2BAhGQWJuoi5joVa3oZB7py5VFvgQjGACpi2LFgvJiBt+sZqyVUv
	qmvGJ37buZmbjtDntgyeywkQyqm0a9h4Z81JkZ8QCaUAhrqTaa0o0BLtelZErPIj+I11e09Eom5VM
	jXnxmxHOL19po7Pi9Lr0HyHw3eBJYEnt3g0YbeSuEf7wARpiYLJ/q8hUPcS7v+TBXKmfldD05B41T
	pjFdi6ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJYVq-00000008xz2-3dvq;
	Mon, 26 May 2025 14:09:10 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJYTi-00000008xhd-1pBI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 14:06:59 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a36748920cso2349533f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 May 2025 07:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748268416; x=1748873216; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zUalJN5MUy3YAR3UhbDJtGyL6WBv2slh5mtlXFKO8b0=;
        b=VMpoaGcmu/8S4K+5YJgNt9+6bmsPYNQqy6utE+7stgiXmjFcLHbtE0AjKhK7EuYdD7
         uCtzDh9LjDf8hO18I/jbQb9jBDuODtBQKrh6nlREy81GifOFQkJNR5LWHVDRLwruTwof
         f+KSiCU7U5wksa5kT7rgAKu5+FoOLpRN/XPARvZ9VriYMl/pU8+P1dSQ8nAEpbJw48Ib
         zESfZy9lehPs/Gjs+WKpSSusFRO935pNIZZwk3ntulpe8cEEgupJ5r0o7Ejh+2hocrws
         88FITIbOn6ctfszC+JRxv0TItunltDjgeD6zSZvqLhvCKOAQVkKCd74o7ZZYWtx+D7yZ
         ZnSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748268416; x=1748873216;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zUalJN5MUy3YAR3UhbDJtGyL6WBv2slh5mtlXFKO8b0=;
        b=j2m2DSi37cDsJSTl3QPDqwsFWDso7sEZUMognCSe8yvzDTD9NAZHAe7jBkEs6RA+YO
         fTuPDI8h9CyaMVvxDZFNBvbncBYUmQjEZyv5yfQ3iUyAd+560XobLva3Vf8Si2K56pxq
         5Q2boIIPIM6gaotJEFl0UetJ58Rk7v4pK61AA80+gkWlJ/cVqENDPC1d9s9h3J2Gq0o4
         fH3BthUnhoXkQ8wzvozG2OYllyyZSe5H5eoD+orMpsUvT9vht1zliOrMzoZSd01KVs96
         MwVWLZ7dCaeYnEdhxtMRkNABM3OzgfuZ6KEScCN4Dg1GcondUpUfH7xWUB6SiBKC/5Zk
         chSg==
X-Forwarded-Encrypted: i=1; AJvYcCWP6kVAaFq8TCUW8nep9rjXa8YhG3+0yXaWyOh/InuH47vwccGbjOroeRO8mfEgmyBrXGEPENQbuFbT9N96Lm5g@lists.infradead.org
X-Gm-Message-State: AOJu0YzFL1i31YEjwRCfGo1BrWzOqbecZ/4nT5UI6ZqkYDHVbZkZTo1B
	UBAjhW3Hjrkn78wE2WEFbrPbvYh+cHlkZ/dXZmx0ZB7+L4l6btdM9sCWHDACYpXrPoI=
X-Gm-Gg: ASbGncumB4uybvPlXsMdpfMMOGj+w2i2DOY/SJc2vvr9P8FbpPCQc0Ihg1WMv+vEPbS
	zSqLWndDdO+DCtVO/vAeX8F+uB1WS+n6Ia5dWAzFHVMS4wFwoTr14mBOqe4Qxjw1DTsecne/jce
	Nxd37StVe21wjpSp9PVypm8r0vjD54NsUDzOIbu2WeHziD/zBdzRNcXqBJDiPVXwZY2feLudwUE
	ygJ22hzA0ZP5xu0ZfgiCFSU2w4bRrXbfsTGUOtWPtFrEBm5Tv9j4uc15uno561jFO0rGDjKgOR3
	pL3PQ+IAMaYqWLEIAyD6y4SHOEXE4Uz3Qtw7RUkXZyGDQT9M7esK
X-Google-Smtp-Source: AGHT+IFn52fIeGag1IWUAYwZ0XrL+fmHEWUQ8gimnAH86GvLzi97W0zr1r99vIRe5MeCAnEzOnrUPA==
X-Received: by 2002:a05:6000:1886:b0:3a4:c909:ce2a with SMTP id ffacd0b85a97d-3a4cb489a8cmr7582347f8f.45.1748268415632;
        Mon, 26 May 2025 07:06:55 -0700 (PDT)
Received: from [192.168.2.177] ([91.116.220.47])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4db284261sm2418574f8f.67.2025.05.26.07.06.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 07:06:55 -0700 (PDT)
Message-ID: <3899c82c-d6a7-4daf-889b-b4d7f3185909@suse.com>
Date: Mon, 26 May 2025 16:06:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 -next 08/12] arm64: dts: bcm2712: Add external clock
 for RP1 chipset on Rpi5
To: Andrea della Porta <andrea.porta@suse.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof Wilczynski <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Linus Walleij
 <linus.walleij@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic
 <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
 Stefan Wahren <wahrenst@gmx.net>, Herve Codina <herve.codina@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Lunn
 <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, kernel-list@raspberrypi.com
References: <cover.1745347417.git.andrea.porta@suse.com>
 <38514415df9c174be49e72b88410d56c8de586c5.1745347417.git.andrea.porta@suse.com>
 <aBp1wye0L7swfe1H@apocalypse>
 <96272e42-855c-4acc-ac18-1ae9c5d4617f@broadcom.com>
 <CAO50JKVF6x_=MUuzjhdK0QotcdUgHysMb9v1g0UvWjaJF2fjDA@mail.gmail.com>
 <48AFA657-5683-42A4-888E-3E98A515F3B1@broadcom.com>
 <aCIk40642nXZ3arz@apocalypse>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <aCIk40642nXZ3arz@apocalypse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_070658_487669_CBDEEFA7 
X-CRM114-Status: GOOD (  24.02  )
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



On 12/05/2025 18:42, Andrea della Porta wrote:
> Hi Florian,
> 
> On 15:02 Mon 12 May     , Florian Fainelli wrote:
>> On May 7, 2025 5:01:05 PM GMT+02:00, Andrea della Porta <andrea.porta@suse.com> wrote:
>>> Hi Florian, to accept the patches, what would work best for you?
>>>
>>> 1) Send only the relevant updated patches (maybe as an entirely new
>>> patchset with
>>>    only those specific patches)
>>
>> Only the updated patches work for me. I don't think there is that much coupling between the DT changes and the non-DT changes (other than without DT entries nothing is activated)
> 
> It's a little bit more involved than that:
> 
> - Patch 7 (misc driver) depends on 6 (RP1 common dts) which in turn
>    depends on 1 (clock binding header). Should be taken by Greg.

Greg gave an Acked-by so I think Florian is good to take that patch. Which 
leaves us to the clock patches (driver + dt-bindings).

> 
> - Patch 9 and 10 (board dts) depends on 6 (RP1 common dts) which again
>    depends on 1 (clock binding header). Should be taken by Florian.
> 
> - Patch 4 (clock driver) depends on 1 (clock binding header) and
>    should be taken by Stephen.
> 

Steven reviewed the patches (driver + dt-binding) so he is waiting for a new 
version which addresses the review. He offered to either take them and provide a 
branch that Florian can merge into his branch or provide a Acked-by tag.

@Florian what would you prefer?

Regards,
Matthias

> So patches 6 and 1 are in common between Florian and Greg, while patch 1
> is in common between everyone in the pool.
> 
> If I uniquely assign the patches in common to one of you, the others
> won't be able to compile their own branch because they will be missing
> the dependent patch.
> 
> If, on the other hand, I duplicate common patches to each of you to
> make the kernel compile for veryone, you should remember that there
> will be conflicts due to duplicated patches among different trees
> down the merge path.
> 
> Any advice about how to proceed is appreciated.
> 
> Many thanks,
> Andrea
> 
>>
>> Florian


