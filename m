Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06096CA5FE3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 08:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8UOj4UBtpSDtB1u/mynjbblWtbQNRWQi1yFF6YRu1C8=; b=dGoOpV3YttpkjI2XXFfpsnVkkA
	pcWKlAuJvbILI0nqQmQ7c3vHALjQqVjh7fRv+j7kqb/6SXrp/DnxFm9dzURiPDisCjMHht1HgQI91
	0JdfdKtHbGfJOouHYEgPOTYZhpyMghVd8D/gFkPNcNPXV70A5a6fiiFnqDew1gagjVDmGe9VZIqmr
	rvcJ5yGI3tG2Hy7VcMPMBx4OtL8db1S5uuGH5dpvTjh06CT94QLtTkorDbmHxkBo8wEdtws6jJ82U
	Y0RqzKowEou3kYkNFEqFxrzjqVl1QV+irPElTQ88YB4Ml5Bb3bB8eNOOf1DLgrrYLSN7H4W8bFGUI
	zkFnhJyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCupz-0000000D9z5-0eIw;
	Sat, 03 Oct 2026 08:11:19 +0000
Received: from mail-wm2-f13.google.com ([74.125.225.141])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCupn-0000000D9vx-154N
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 08:11:10 +0000
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a169d33ef6so1160605e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Oct 2026 01:11:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791015065; x=1791619865;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8UOj4UBtpSDtB1u/mynjbblWtbQNRWQi1yFF6YRu1C8=;
        b=Tij6sdSjslS7rRviENKLWhRN/qNR8gWkN7uct5rEIJydfJlMUjvOmfU3UcchL6eVxa
         vPkP3bnDKfE/AdCV4fDhfZWwFT/0AtpuygxrwTrGS/mH/TOfhcQVYG4oznZlf0msoSkK
         yjUjo/pIUkMR9Jl2PBlCDEfg0y+hYBURm7CQ6bmWZniqtGMBuUEfg/SgdAj/jMt5twoH
         jlw2boSzaddXqas0tTuJ1xuNJ0aqtrZGUgrEMKb95G/G8h/bqX6SrwV4AziSP4gYmJY7
         qX+4b+oub5YOx2JDzzm2yAVxty6ysqxahw6Vjb/iI/8Chv4guFPSALdtB/mU0zeBEt++
         X4yQ==
X-Forwarded-Encrypted: i=1; AKwUvByvE3/3JXPbC57qzODb6cdptRA8jWPagNxfKkvM9VsBMqU638vT1J1jlWVt69Hdmg1PE6xbO2tLC8mO4Onyq4Ve@lists.infradead.org
X-Gm-Message-State: AFuF++m8lD9gHkEQ3z9agiu63qnJ79CoqvRBFcHZgp9J+IvD/E8xG7Kg
	QO0VwgWpsAAMztRA025DNnKeixllOCtjn117JamYgBA35IfSGrKldEr3I33E7bZ1
X-Gm-Gg: AYBFou08P9j9az69DgvAHM1Wy3VWIXPwYbSBOE1kjXxzz4+8Kq4XcPplg3SJS98YNOX
	6QNM0SgqJlL2wy/0VcgRwHWtWxp4HPJD+wmdc408L5B+dCrEj1iw8WrF2nZ54iavOk0sHsUQE0E
	v5BsciannUiV1FmxISPwzvBWncArae8Lck4k9ymNK8L+xVFNEeGoLN0b6S9Ns4wC+otMmTh5sRu
	X1FFfeqLuKgoQ7nupuioLjGWMEuOCKriVJ7b7bb4pTh8ktGDjsuvecQcI6HEkWwliD47CSMMz4z
	5jARkqQJEFq1NdT1qPftwmDOhzz686yDrWQsu+Y92gmLhkbP4+cPOfNQeRC+EsmwdQruR+TeXum
	usc2ovCDqlp2TFhB4gPnYrCxdNkLSbVnA/VazdGBt7Rqa1eJNfg/FnMELuKLyKY9++ErHbXamv0
	AXIIeFrcMae73qrGoWVUqc/UnUAPA2XzcZLKNIR67eug1hE/WRZwouNbn0nk8gzKxN9ETJ+1x2Y
	Z8D7tPIB5vJj86SHi/fCKsQ8Y6N
X-Received: by 2002:a05:600c:a011:b0:49d:4ef:bf70 with SMTP id 5b1f17b1804b1-4a02756716amr80264645e9.10.1791015064857;
        Sat, 03 Oct 2026 01:11:04 -0700 (PDT)
Received: from [192.168.1.135] ([84.68.183.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b82253e7esm10140636f8f.0.2026.10.03.01.11.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2026 01:11:04 -0700 (PDT)
Message-ID: <b3ed6eb7-2d32-436f-a984-45366389d0da@linux.com>
Date: Sat, 3 Oct 2026 09:11:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: mmc: amlogic,meson-gx-mmc: document
 the T7 pipeline clock
To: Rob Herring <robh@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Chuan Liu <chuan.liu@amlogic.com>, Jian Hu <jian.hu@amlogic.com>,
 Ronald Claveau <linux-kernel-dev@aliel.fr>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260905153234.133217-1-tanure@linux.com>
 <20260905153234.133217-2-tanure@linux.com>
 <20260916203701.GA1463751-robh@kernel.org>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <20260916203701.GA1463751-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_011107_317315_4F6306AF 
X-CRM114-Status: GOOD (  15.42  )
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

On 16/09/2026 21:37, Rob Herring wrote:
> On Sat, Sep 05, 2026 at 04:32:31PM +0100, Lucas Tanure wrote:
>> The SD/eMMC controllers of the T7 SoC are physically far from the
>> NIC_MATRIX bus fabric, so the hardware design inserts a pipeline stage
>> in the middle of the bus path to help timing closure. This stage is fed
>> by its own gate clock and, when that clock is disabled, a controller
>> that starts a DMA transfer can never complete it.
>>
>> Allow a fourth clock entry, named "pipeline", and require it for the
>> amlogic,t7-mmc compatible. The other controllers of this family keep
>> the existing three clocks.
> 
> Did the SD controller not work without this clock? If it did, then this
> is an ABI break which is evident by the current warning in linux-next.
> 
> Rob
Yes, the SD controller doesn't work with this clock, so I don't think is 
a ABI break, as the current code doesn't work and the board crashes a lot.
And a few patches got merged from my work, so I will resubmit a new 
series for this.

Thanks
Lucas

