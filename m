Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7859DE64ABB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 15:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:MIME-Version:Date:Message-ID:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zbnFH35asmkCf8F0a0DA4gUueKFBLRG9oFqW68XMwOo=; b=h1lSHV9fOb8Lofza+NvVnLLg+E
	tAofrEgt0eq5dhU3nAaiGVqFV+d4NOXRIivEzBM4gmB9IIxImLyvFvo18IPH3jaHKuKEGIuZB6P0Z
	M0af70fduoLZ/Rynj4YxK+ixlFhm6GM2oFIhF2JirX966tOeQ16RXmNkuIDw6ikhJ0V2BjuHqzihd
	4jyovhDAy1uWWRfj7Ys7mk9FniHBufd0Rvusz/wG520IDmccdCmd5jeblE6WLhsqJVIbQiJl+MB0i
	IqEbWTJSAwHrH5gvWe2MBCmBLAQsRyAjhCOflBON+l0WFjQWYs9E7Ve/a8scBdcsUPQ2n+bvYjbFs
	rJ2Whf+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIV45-00000009yll-1tWb;
	Tue, 03 Dec 2024 15:43:53 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tITts-00000009mQ6-22GQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 14:29:17 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5cfddb70965so7059488a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 06:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733236154; x=1733840954; darn=lists.infradead.org;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zbnFH35asmkCf8F0a0DA4gUueKFBLRG9oFqW68XMwOo=;
        b=oSc1PA7FJXU3A3fSZR+A/lkbsJinardubNyo7Y/P+9iTWOYtGklU9WbbKnKyRByTOT
         m9vdaRHb8IKbfncqY7EioWrvY+lGT7gsrcsx++RoVVfvpjekxuJTwPhyAsTSYufiPDAB
         vcrCEw/AJ85XQ5RuKrHgRBajp4vqwwYFwFwQhypowpGvvcdm+ddCCU6KI6H/Lh2tVBUY
         53E/RtX91k5w70OAIWXP+zs5ENSH2PKEe/xFpK4UEPfJCnN4zVXHi7P8l5D86Vk6xblf
         WLeLfMiO349LXQ4e4yP5rl0rbhFTXUbWBLIkZvdM72bfSnsvXPDJvVQh0u1jDFwtW8IP
         RdDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733236154; x=1733840954;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zbnFH35asmkCf8F0a0DA4gUueKFBLRG9oFqW68XMwOo=;
        b=gsH0kuXeQWX5NZLKMFzHl/tJ1JtdkGYNcxfdjDvmB1skcfIFJT1A4Y9zxCN06w4u4L
         doBmzJ5GNUe/S9HNb9SIA5niJaCnXvxEZK4nDnCe1lZfCeam4XeZRLc6uv78EBSd9RuH
         hAC+JSpf3uewSmMS3VtfFTJE3/amkeq5U0sM2PejIguQa8Mn6gv6BGFNxBRBpKHW5zTb
         HYHMaqrhajJh3mud9kHf417sCeQwMFa7cQ6bAs8PUgSqNCoDpQAAs08lmIBY1x9kn01H
         Aenax4nbrQRT46W24utRbuV5FYbISKJJH+v+1KB5hbyaqVLf12w6tPW/GHoHNQM2HsEN
         p1pw==
X-Gm-Message-State: AOJu0Yz7Y7SjmZXGz3QdIdsB2ziKETqGjdwifLAnYxZyReB1p1UZtZSP
	r052G8nFDSUURn2QjWj4tp0r1KEGZlZXmBa4eY23pDkIV9bfCuah6D869qSZb1s=
X-Gm-Gg: ASbGncuUp5CxM805y9ENF9q64L0tL8pBj+RBV4lfF8MDrT1mcXTWuoIr5n/1iOA/qe3
	mH7QX2eqsR8IZ7wV4Csf9ROELgDpcukYWyRcQCsqBcciHAAuikl9UfuA7t1rN0Db4Fzi/eB+fq6
	8Oz3Xlc5+O5D91RVIgoLkuci8bXzZQpiLebluFmVTA7Dd4Q0+hNvY+8JNrKBYb5qczrClZaQjei
	/2aHKqkEUKiwNAHCpVlXNkznS+ilWyUipTEOuSIWHbmtppCG64t2PHFUX1h
X-Google-Smtp-Source: AGHT+IF/rwfQ02hzxSPa/HierYFresTwqYZotKdawVYIIDlojGDMNBd4Rhwu+Z+PnUUHdT92q8KlXA==
X-Received: by 2002:a17:906:3d31:b0:aa5:41b2:e23e with SMTP id a640c23a62f3a-aa5f7da9717mr177867466b.30.1733236154425;
        Tue, 03 Dec 2024 06:29:14 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.200])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa599955e1fsm624455266b.180.2024.12.03.06.29.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 06:29:13 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------dlfINo7mYeBLcRAJM6wF46WC"
Message-ID: <d4a10ba4-e580-4fe6-9706-d3ec6e5856e3@linaro.org>
Date: Tue, 3 Dec 2024 14:29:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 8/9] coresight: tools: Add configuration table test
 tools
From: James Clark <james.clark@linaro.org>
To: Mike Leach <mike.leach@linaro.org>, coresight@lists.linaro.org,
 Suzuki K Poulose <Suzuki.Poulose@arm.com>, Leo Yan <leo.yan@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20241127134256.2254851-1-mike.leach@linaro.org>
 <20241127134256.2254851-9-mike.leach@linaro.org>
 <9cb1ef5e-eb61-4177-a039-4049850196a5@linaro.org>
Content-Language: en-US
In-Reply-To: <9cb1ef5e-eb61-4177-a039-4049850196a5@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_062916_530364_EC056F85 
X-CRM114-Status: GOOD (  24.84  )
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

This is a multi-part message in MIME format.
--------------dlfINo7mYeBLcRAJM6wF46WC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 03/12/2024 2:25 pm, James Clark wrote:
> 
> 
> On 27/11/2024 1:42 pm, Mike Leach wrote:
>> Add an example config table generator to test loading configuration
>> tables.
>>
>> Provides a table buffer writer function that can be re-used in other
>> userspace programs.
>>
>> Table write format matches that expected by the corresponding reader
>> in the configfs driver code.
>>
>> Generates tables and outputs in form of binary files.
>>
>> Add a config table file reader and printer. Takes in config table files
>> and prints the contents. Uses table reader source from kernel driver.
>>
>> Signed-off-by: Mike Leach <mike.leach@linaro.org>
>> ---
>>   MAINTAINERS                                   |   1 +
>>   .../coresight/coresight-config-table.h        |   5 +
> 
> Hi Mike,
> 
> Isn't there some convention about maintaining a copy of kernel headers 
> in the tools? Especially as you wouldn't rebuild the tools after 
> updating the kernel headers so breakages might go unnoticed.
> 
> [...]
> 
>> +
>> +/*
>> + * sets of presets leaves strobing window constant while varying 
>> period to allow
>> + * experimentation with mark / space ratios for various workloads
>> + */
>> +static u64 afdo_set_a_presets[AFDO_NR_PRESETS][AFDO_NR_PARAM_SUM] = {
>> +    { 2000, 100 },
>> +    { 2000, 1000 },
>> +    { 2000, 5000 },
>> +    { 2000, 10000 },
>> +    { 4000, 100 },
> 
> The comment above here looks like its for example1, this one does vary 
> the window size.
> 
> Probably only example2 is enough, I assumed they were different but 
> example2 is basically the same as example1 with an extra preset list. We 
> could comment that the second preset list is optional and delete 
> example1. Saves people reading more and wondering what the difference is.
> 
> I tried to make an example that doesn't use an existing feature by 
> reacreating afdo from scratch which I thought would be a good example. 
> It's pasted at the end.

I've attached it here instead


--------------dlfINo7mYeBLcRAJM6wF46WC
Content-Type: text/x-csrc; charset=UTF-8; name="coresight-cfg-afdo.c"
Content-Disposition: attachment; filename="coresight-cfg-afdo.c"
Content-Transfer-Encoding: base64

Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKLyoKICogQ29weXJpZ2h0IChj
KSAyMDIwLTIwMjIgTGluYXJvIExpbWl0ZWQsIEFsbCByaWdodHMgcmVzZXJ2ZWQuCiAqIEF1
dGhvcjogTWlrZSBMZWFjaCA8bWlrZS5sZWFjaEBsaW5hcm8ub3JnPgogKi8KI2luY2x1ZGUg
PGxpbnV4L3R5cGVzLmg+CiNpbmNsdWRlIDxsaW51eC91bmlzdGQuaD4KI2luY2x1ZGUgPHN0
ZGlvLmg+CiNpbmNsdWRlIDx1bmlzdGQuaD4KCiNpbmNsdWRlICJjb3Jlc2lnaHQtY2ZnLWV4
YW1wbGVzLmgiCgojZGVmaW5lIFRSQ1BSR0NUTFIJCQkweDAwNAojZGVmaW5lIFRSQ1BST0NT
RUxSCQkJMHgwMDgKI2RlZmluZSBUUkNTVEFUUgkJCTB4MDBDCiNkZWZpbmUgVFJDQ09ORklH
UgkJCTB4MDEwCiNkZWZpbmUgVFJDQVVYQ1RMUgkJCTB4MDE4CiNkZWZpbmUgVFJDRVZFTlRD
VEwwUgkJCTB4MDIwCiNkZWZpbmUgVFJDRVZFTlRDVEwxUgkJCTB4MDI0CiNkZWZpbmUgVFJD
UlNSCQkJCTB4MDI4CiNkZWZpbmUgVFJDU1RBTExDVExSCQkJMHgwMkMKI2RlZmluZSBUUkNU
U0NUTFIJCQkweDAzMAojZGVmaW5lIFRSQ1NZTkNQUgkJCTB4MDM0CiNkZWZpbmUgVFJDQ0ND
VExSCQkJMHgwMzgKI2RlZmluZSBUUkNCQkNUTFIJCQkweDAzQwojZGVmaW5lIFRSQ1RSQUNF
SURSCQkJMHgwNDAKI2RlZmluZSBUUkNRQ1RMUgkJCTB4MDQ0Ci8qIEZpbHRlcmluZyBjb250
cm9sIHJlZ2lzdGVycyAqLwojZGVmaW5lIFRSQ1ZJQ1RMUgkJCTB4MDgwCiNkZWZpbmUgVFJD
VklJRUNUTFIJCQkweDA4NAojZGVmaW5lIFRSQ1ZJU1NDVExSCQkJMHgwODgKI2RlZmluZSBU
UkNWSVBDU1NDVExSCQkJMHgwOEMKLyogRGVyaXZlZCByZXNvdXJjZXMgcmVnaXN0ZXJzICov
CiNkZWZpbmUgVFJDU0VRRVZSbihuKQkJCSgweDEwMCArIChuICogNCkpIC8qIG4gPSAwLTIg
Ki8KI2RlZmluZSBUUkNTRVFSU1RFVlIJCQkweDExOAojZGVmaW5lIFRSQ1NFUVNUUgkJCTB4
MTFDCiNkZWZpbmUgVFJDRVhUSU5TRUxSCQkJMHgxMjAKI2RlZmluZSBUUkNFWFRJTlNFTFJu
KG4pCQkoMHgxMjAgKyAobiAqIDQpKSAvKiBuID0gMC0zICovCiNkZWZpbmUgVFJDQ05UUkxE
VlJuKG4pCQkJKDB4MTQwICsgKG4gKiA0KSkgLyogbiA9IDAtMyAqLwojZGVmaW5lIFRSQ0NO
VENUTFJuKG4pCQkJKDB4MTUwICsgKG4gKiA0KSkgLyogbiA9IDAtMyAqLwojZGVmaW5lIFRS
Q0NOVFZSbihuKQkJCSgweDE2MCArIChuICogNCkpIC8qIG4gPSAwLTMgKi8KLyogSUQgcmVn
aXN0ZXJzICovCiNkZWZpbmUgVFJDSURSOAkJCQkweDE4MAojZGVmaW5lIFRSQ0lEUjkJCQkJ
MHgxODQKI2RlZmluZSBUUkNJRFIxMAkJCTB4MTg4CiNkZWZpbmUgVFJDSURSMTEJCQkweDE4
QwojZGVmaW5lIFRSQ0lEUjEyCQkJMHgxOTAKI2RlZmluZSBUUkNJRFIxMwkJCTB4MTk0CiNk
ZWZpbmUgVFJDSU1TUEVDMAkJCTB4MUMwCiNkZWZpbmUgVFJDSU1TUEVDbihuKQkJCSgweDFD
MCArIChuICogNCkpIC8qIG4gPSAxLTcgKi8KI2RlZmluZSBUUkNJRFIwCQkJCTB4MUUwCiNk
ZWZpbmUgVFJDSURSMQkJCQkweDFFNAojZGVmaW5lIFRSQ0lEUjIJCQkJMHgxRTgKI2RlZmlu
ZSBUUkNJRFIzCQkJCTB4MUVDCiNkZWZpbmUgVFJDSURSNAkJCQkweDFGMAojZGVmaW5lIFRS
Q0lEUjUJCQkJMHgxRjQKI2RlZmluZSBUUkNJRFI2CQkJCTB4MUY4CiNkZWZpbmUgVFJDSURS
NwkJCQkweDFGQwovKgogKiBSZXNvdXJjZSBzZWxlY3Rpb24gcmVnaXN0ZXJzLCBuID0gMi0z
MS4KICogRmlyc3QgcGFpciAocmVncyAwLCAxKSBpcyBhbHdheXMgcHJlc2VudCBhbmQgaXMg
cmVzZXJ2ZWQuCiAqLwojZGVmaW5lIFRSQ1JTQ1RMUm4obikJCQkoMHgyMDAgKyAobiAqIDQp
KQovKiBTaW5nbGUtc2hvdCBjb21wYXJhdG9yIHJlZ2lzdGVycywgbiA9IDAtNyAqLwojZGVm
aW5lIFRSQ1NTQ0NSbihuKQkJCSgweDI4MCArIChuICogNCkpCiNkZWZpbmUgVFJDU1NDU1Ju
KG4pCQkJKDB4MkEwICsgKG4gKiA0KSkKI2RlZmluZSBUUkNTU1BDSUNSbihuKQkJCSgweDJD
MCArIChuICogNCkpCi8qIE1hbmFnZW1lbnQgcmVnaXN0ZXJzICgweDMwMC0weDMxNCkgKi8K
I2RlZmluZSBUUkNPU0xBUgkJCTB4MzAwCiNkZWZpbmUgVFJDT1NMU1IJCQkweDMwNAojZGVm
aW5lIFRSQ1BEQ1IJCQkJMHgzMTAKI2RlZmluZSBUUkNQRFNSCQkJCTB4MzE0Ci8qIFRyYWNl
IHJlZ2lzdGVycyAoMHgzMTgtMHhFRkMpICovCi8qIEFkZHJlc3MgQ29tcGFyYXRvciByZWdp
c3RlcnMgbiA9IDAtMTUgKi8KI2RlZmluZSBUUkNBQ1ZSbihuKQkJCSgweDQwMCArIChuICog
OCkpCiNkZWZpbmUgVFJDQUNBVFJuKG4pCQkJKDB4NDgwICsgKG4gKiA4KSkKLyogQ29udGV4
dElEL1ZpcnR1YWwgQ29udGV4dElEIGNvbXBhcmF0b3JzLCBuID0gMC03ICovCiNkZWZpbmUg
VFJDQ0lEQ1ZSbihuKQkJCSgweDYwMCArIChuICogOCkpCiNkZWZpbmUgVFJDVk1JRENWUm4o
bikJCQkoMHg2NDAgKyAobiAqIDgpKQojZGVmaW5lIFRSQ0NJRENDVExSMAkJCTB4NjgwCiNk
ZWZpbmUgVFJDQ0lEQ0NUTFIxCQkJMHg2ODQKI2RlZmluZSBUUkNWTUlEQ0NUTFIwCQkJMHg2
ODgKI2RlZmluZSBUUkNWTUlEQ0NUTFIxCQkJMHg2OEMKLyogTWFuYWdlbWVudCByZWdpc3Rl
ciAoMHhGMDApICovCi8qIEludGVncmF0aW9uIGNvbnRyb2wgcmVnaXN0ZXJzICovCiNkZWZp
bmUgVFJDSVRDVFJMCQkJMHhGMDAKLyogVHJhY2UgcmVnaXN0ZXJzICgweEZBMC0weEZBNCkg
Ki8KLyogQ2xhaW0gdGFnIHJlZ2lzdGVycyAqLwojZGVmaW5lIFRSQ0NMQUlNU0VUCQkJMHhG
QTAKI2RlZmluZSBUUkNDTEFJTUNMUgkJCTB4RkE0Ci8qIE1hbmFnZW1lbnQgcmVnaXN0ZXJz
ICgweEZBOC0weEZGQykgKi8KI2RlZmluZSBUUkNERVZBRkYwCQkJMHhGQTgKI2RlZmluZSBU
UkNERVZBRkYxCQkJMHhGQUMKI2RlZmluZSBUUkNMQVIJCQkJMHhGQjAKI2RlZmluZSBUUkNM
U1IJCQkJMHhGQjQKI2RlZmluZSBUUkNBVVRIU1RBVFVTCQkJMHhGQjgKI2RlZmluZSBUUkNE
RVZBUkNICQkJMHhGQkMKI2RlZmluZSBUUkNERVZJRAkJCTB4RkM4CiNkZWZpbmUgVFJDREVW
VFlQRQkJCTB4RkNDCiNkZWZpbmUgVFJDUElEUjQJCQkweEZEMAojZGVmaW5lIFRSQ1BJRFI1
CQkJMHhGRDQKI2RlZmluZSBUUkNQSURSNgkJCTB4RkQ4CiNkZWZpbmUgVFJDUElEUjcJCQkw
eEZEQwojZGVmaW5lIFRSQ1BJRFIwCQkJMHhGRTAKI2RlZmluZSBUUkNQSURSMQkJCTB4RkU0
CiNkZWZpbmUgVFJDUElEUjIJCQkweEZFOAojZGVmaW5lIFRSQ1BJRFIzCQkJMHhGRUMKI2Rl
ZmluZSBUUkNDSURSMAkJCTB4RkYwCiNkZWZpbmUgVFJDQ0lEUjEJCQkweEZGNAojZGVmaW5l
IFRSQ0NJRFIyCQkJMHhGRjgKI2RlZmluZSBUUkNDSURSMwkJCTB4RkZDCgojZGVmaW5lIEVU
TTRfQ0ZHX1JFU19DVFIJMHgwMDEKI2RlZmluZSBFVE00X0NGR19SRVNfQ01QCTB4MDAyCiNk
ZWZpbmUgRVRNNF9DRkdfUkVTX0NNUF9QQUlSMAkweDAwMwojZGVmaW5lIEVUTTRfQ0ZHX1JF
U19DTVBfUEFJUjEJMHgwMDQKI2RlZmluZSBFVE00X0NGR19SRVNfU0VMCTB4MDA1CiNkZWZp
bmUgRVRNNF9DRkdfUkVTX1NFTF9QQUlSMAkweDAwNgojZGVmaW5lIEVUTTRfQ0ZHX1JFU19T
RUxfUEFJUjEJMHgwMDcKI2RlZmluZSBFVE00X0NGR19SRVNfU0VRCTB4MDA4CiNkZWZpbmUg
RVRNNF9DRkdfUkVTX1RTCQkweDAwOQojZGVmaW5lIEVUTTRfQ0ZHX1JFU19NQVNLCTB4MDBG
CgpzdGF0aWMgc3RydWN0IGNzY2ZnX3JlZ3ZhbF9kZXNjIHN0cm9iZV9yZWdzW10gPSB7Cgkv
KiByZXNvdXJjZSBzZWxlY3RvcnMgKi8KCXsKCQkudHlwZSA9IENTX0NGR19SRUdfVFlQRV9S
RVNPVVJDRSwKCQkub2Zmc2V0ID0gVFJDUlNDVExSbigyKSwKCQkuaHdfaW5mbyA9IEVUTTRf
Q0ZHX1JFU19TRUwsCgkJLnZhbDMyID0gMHgyMDAwMSwKCX0sCgl7CgkJLnR5cGUgPSBDU19D
RkdfUkVHX1RZUEVfUkVTT1VSQ0UsCgkJLm9mZnNldCA9IFRSQ1JTQ1RMUm4oMyksCgkJLmh3
X2luZm8gPSBFVE00X0NGR19SRVNfU0VRLAoJCS52YWwzMiA9IDB4MjAwMDIsCgl9LAoJLyog
c3Ryb2JlIHdpbmRvdyBjb3VudGVyIDAgLSByZWxvYWQgZnJvbSBwYXJhbSAwICovCgl7CgkJ
LnR5cGUgPSBDU19DRkdfUkVHX1RZUEVfUkVTT1VSQ0UgfCBDU19DRkdfUkVHX1RZUEVfVkFM
X1NBVkUsCgkJLm9mZnNldCA9IFRSQ0NOVFZSbigwKSwKCQkuaHdfaW5mbyA9IEVUTTRfQ0ZH
X1JFU19DVFIsCgl9LAoJewoJCS50eXBlID0gQ1NfQ0ZHX1JFR19UWVBFX1JFU09VUkNFIHwg
Q1NfQ0ZHX1JFR19UWVBFX1ZBTF9QQVJBTSwKCQkub2Zmc2V0ID0gVFJDQ05UUkxEVlJuKDAp
LAoJCS5od19pbmZvID0gRVRNNF9DRkdfUkVTX0NUUiwKCQkudmFsMzIgPSAwLAoJfSwKCXsK
CQkudHlwZSA9IENTX0NGR19SRUdfVFlQRV9SRVNPVVJDRSwKCQkub2Zmc2V0ID0gVFJDQ05U
Q1RMUm4oMCksCgkJLmh3X2luZm8gPSBFVE00X0NGR19SRVNfQ1RSLAoJCS52YWwzMiA9IDB4
MTAwMDEsCgl9LAoJLyogc3Ryb2JlIHBlcmlvZCBjb3VudGVyIDEgLSByZWxvYWQgZnJvbSBw
YXJhbSAxICovCgl7CgkJLnR5cGUgPSBDU19DRkdfUkVHX1RZUEVfUkVTT1VSQ0UgfCBDU19D
RkdfUkVHX1RZUEVfVkFMX1NBVkUsCgkJLm9mZnNldCA9IFRSQ0NOVFZSbigxKSwKCQkuaHdf
aW5mbyA9IEVUTTRfQ0ZHX1JFU19DVFIsCgl9LAoJewoJCS50eXBlID0gQ1NfQ0ZHX1JFR19U
WVBFX1JFU09VUkNFIHwgQ1NfQ0ZHX1JFR19UWVBFX1ZBTF9QQVJBTSwKCQkub2Zmc2V0ID0g
VFJDQ05UUkxEVlJuKDEpLAoJCS5od19pbmZvID0gRVRNNF9DRkdfUkVTX0NUUiwKCQkudmFs
MzIgPSAxLAoJfSwKCXsKCQkudHlwZSA9IENTX0NGR19SRUdfVFlQRV9SRVNPVVJDRSwKCQku
b2Zmc2V0ID0gVFJDQ05UQ1RMUm4oMSksCgkJLmh3X2luZm8gPSBFVE00X0NGR19SRVNfQ1RS
LAoJCS52YWwzMiA9IDB4ODEwMiwKCX0sCgkvKiBzZXF1ZW5jZXIgKi8KCXsKCQkudHlwZSA9
IENTX0NGR19SRUdfVFlQRV9SRVNPVVJDRSwKCQkub2Zmc2V0ID0gVFJDU0VRRVZSbigwKSwK
CQkuaHdfaW5mbyA9IEVUTTRfQ0ZHX1JFU19TRVEsCgkJLnZhbDMyID0gMHgwMDgxLAoJfSwK
CXsKCQkudHlwZSA9IENTX0NGR19SRUdfVFlQRV9SRVNPVVJDRSwKCQkub2Zmc2V0ID0gVFJD
U0VRRVZSbigxKSwKCQkuaHdfaW5mbyA9IEVUTTRfQ0ZHX1JFU19TRVEsCgkJLnZhbDMyID0g
MHgwMDAwLAoJfSwKCS8qIHZpZXctaW5zdCAqLwoJewoJCS50eXBlID0gQ1NfQ0ZHX1JFR19U
WVBFX1NURCB8IENTX0NGR19SRUdfVFlQRV9WQUxfTUFTSywKCQkub2Zmc2V0ID0gVFJDVklD
VExSLAoJCS52YWwzMiA9IDB4MDAwMywKCQkubWFzazMyID0gMHgwMDAzLAoJfSwKCS8qIGVu
ZCBvZiByZWdzICovCn07CgpzdHJ1Y3QgY3NjZmdfZmVhdHVyZV9kZXNjIHN0cm9iZV9ldG00
eCA9IHsKCS5uYW1lID0gInN0cm9iaW5nLWNmZ2ZzIiwKCS5kZXNjcmlwdGlvbiA9ICJHZW5l
cmF0ZSBwZXJpb2RpYyB0cmFjZSBjYXB0dXJlIHdpbmRvd3MuXG4iCgkJICAgICAgICJwYXJh
bWV0ZXIgXCd3aW5kb3dcJzogYSBudW1iZXIgb2YgQ1BVIGN5Y2xlcyAoVylcbiIKCQkgICAg
ICAgInBhcmFtZXRlciBcJ3BlcmlvZFwnOiB0cmFjZSBlbmFibGVkIGZvciBXIGN5Y2xlcyBl
dmVyeSBwZXJpb2QgeCBXIGN5Y2xlc1xuIiwKCS5tYXRjaF9mbGFncyA9IENTX0NGR19NQVRD
SF9DTEFTU19TUkNfRVRNNCwKCS5ucl9wYXJhbXMgPSAwLAoJLnBhcmFtc19kZXNjID0gTlVM
TCwKCS5ucl9yZWdzID0gQVJSQVlfU0laRShzdHJvYmVfcmVncyksCgkucmVnc19kZXNjID0g
c3Ryb2JlX3JlZ3MsCn07CgpzdGF0aWMgc3RydWN0IGNzY2ZnX2ZlYXR1cmVfZGVzYyAqc2Ft
cGxlX2ZlYXRzW10gPSB7Cgkmc3Ryb2JlX2V0bTR4LAogICAgICAgIE5VTEwKfTsKCnN0YXRp
YyBzdHJ1Y3QgY3NjZmdfY29uZmlnX2Rlc2MgKnNhbXBsZV9jZmdzW10gPSB7CglOVUxMCn07
CgpzdHJ1Y3QgY3NjZmdfZmlsZV9lZ19pbmZvIGZpbGVfaW5mb19hZmRvID0gewoJLmV4YW1w
bGVfbmFtZSA9ICJleGFtcGxlX2FmZG8iLAoJLmZpbGVuYW1lID0gImV4YW1wbGVfYWZkby5j
c2NmZyIsCgkuY29uZmlnX2Rlc2NzID0gc2FtcGxlX2NmZ3MsCgkuZmVhdF9kZXNjcyA9IHNh
bXBsZV9mZWF0cywKfTsK

--------------dlfINo7mYeBLcRAJM6wF46WC--

