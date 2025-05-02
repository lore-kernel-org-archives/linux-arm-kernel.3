Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FE5C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 17:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zwVDzOur7RIZgOEAv6FVzTh6NPuuDPam1fW7Dewd/Po=; b=NRd6vdnIjgNu8IE6oy83bcTsPI
	LmO63HFVzxctuHp02b2jeYVo2XZwfjiYChwnoAyH7aFcYXvscAAQiZukRyUTZ2s4e7BARrSkB2LoL
	GntKA2nvorBy9ygEDlmQcjI0eTNbdvARvd0T8MgVAQQRJVm139d5q8iT8O6anzMP/CGB56CHj4hWi
	ErU+c+45/OoqiclNBCKEN16PwLhpwLOUP877TVHfeKEb4jl0b7W/tEIFGZymbrGnSueMxp4Z5jEDS
	Q8lkgnHyLE+fvA1Ye8Jp9jCk7h+rnJMB0ZOBIFV3HQHBSA58F2jFZx0GTwBja/ygyjpFI+wxGw1ks
	1giGrZhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAu6S-00000002e4r-1EIt;
	Fri, 02 May 2025 17:23:12 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAtcs-00000002ZyG-3SnW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 16:52:40 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso3329850b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 09:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746204757; x=1746809557; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zwVDzOur7RIZgOEAv6FVzTh6NPuuDPam1fW7Dewd/Po=;
        b=bL7wyYgb/cUg1fc/D289k5Fq8XK+hXbSLgK5tv6wCFSl08bygT8JFcDYm5awU1UNTV
         XzSO/kYjiBrp7hgZAuM1f39vbd65cuqyl/gej+nsYZ4Wc2P6aQDhgld80lhfhoJFbMC0
         xlhWcNWX5Q7eh0LRSqWkHO6LMkh30TSFWu4d9sSwaJojSUJjeTLjRDRth7VV2RxmN3e6
         /qXJ4bZizSlcNpyPteltQ1+i7XIjKJr+w0c++Thl2b34n6Yg0VR+R0r8EU6ngI2W8EO5
         tU0R129LMSFhAkmKEe8WLvSTAd03h9J8xrcygAId4+TK0wh/+uJizzZDK5sQWYMGpbWS
         GMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746204757; x=1746809557;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zwVDzOur7RIZgOEAv6FVzTh6NPuuDPam1fW7Dewd/Po=;
        b=kzm/Gakhwk+6UBtnRIEfJFOIaBrDDEPSdFZk7NuGOH4y8Ky915kcBKQaMfDivvhlL6
         VrBCIsv6qhM/MvYbn7MaYtmW/9C7WiRKSD87zqvfJt+RLKLRNRZc3YSrYo2kqsPKgtjt
         YLpmYPfVA8PHg2y06ekvxzJE6jhVqBsG1MZU0tEfcCd0B6yw+lGteX01k/L7ztO+ShfX
         PqIOlstFP5VNoLB1tlqHU04aFgfoR6iqSuKSmw05LlYL5mtC1zQdLeAIMYL/OVW4sK15
         zF7QRxiIeW9uIAspBa2avB1vF9hD6F93getE6RA39jFtHvHLK2HsipUwfhzxhexvh4sX
         48IQ==
X-Forwarded-Encrypted: i=1; AJvYcCVziB7xtSH8WJkHetNzlJaa4jruhiJbuEXxWiHvkeaLMCyvWKivvPC53wG520xzmhMWlJZnWLv93H8SjSbq7sLo@lists.infradead.org
X-Gm-Message-State: AOJu0YyI+7Etqk5bnepH/Me9ucrJGxJIQIyIygPCxUIn674h0wVWm7mL
	9SgIx0b4yexWT+CTeb5U3BQLrxkCpkKnkfHDpuc3e2N9g0l+zt9EH+LvE/F+r9k=
X-Gm-Gg: ASbGncvOAC6hKJQfNbT09uxG4JqTE0KC3YBYAsvA41NyjE3GKkMLtNyu9PZZKEd2VHc
	CQ/vc86csycsXsRAKajDk/UrUN/YDLex6k1i/vMqWbMaQyJCqysMKCxuFqPwN9peTDn0g1+fTd3
	jygyR6Mk3ywiW7A8I8ERYa3Nqp8+KALBLL6IMla6oITedsfTrTS5vPTvWfGnbJqPSRsyljxtZjY
	WCg/iJCnEOzUXgOysUPGDDukVIwzAJ6z7g3xqd0vlFjKvE1Q4RM02t2v1SAGcJmrqdp1StpzrZ4
	fUFZJ3Z1EAi1br/h16qMqB3mIwJc4pQBa1Y+7I8=
X-Google-Smtp-Source: AGHT+IHL853QtPBvn6TRtsHQJ/I0TV+kdjSuCmTaYdabOIhgtftYO0dyIOU2uqAMhP2Xe4dVkYjrRw==
X-Received: by 2002:aa7:9306:0:b0:73e:1e21:b653 with SMTP id d2e1a72fcca58-740672b165dmr5326b3a.5.1746204757544;
        Fri, 02 May 2025 09:52:37 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3b56007sm1009841a12.17.2025.05.02.09.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 09:52:37 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Sukrut Bellary
 <sbellary@baylibre.com>
Cc: Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, Roger
 Quadros <rogerq@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Santosh
 Shilimkar <ssantosh@kernel.org>, Bajjuri Praneeth <praneeth@ti.com>,
 Raghavendra Vignesh <vigneshr@ti.com>, Bin Liu <b-liu@ti.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org
Subject: Re: [PATCH 0/4] PM: TI: AM335x: PM STANDBY fixes
In-Reply-To: <CAPDyKFrM7Qn2YtQKY+vCHP32Z_Ly-ECt=SU9EGojFu1ShktUpQ@mail.gmail.com>
References: <20250318230042.3138542-1-sbellary@baylibre.com>
 <7h34efy1yb.fsf@baylibre.com>
 <CAPDyKFrM7Qn2YtQKY+vCHP32Z_Ly-ECt=SU9EGojFu1ShktUpQ@mail.gmail.com>
Date: Fri, 02 May 2025 09:52:36 -0700
Message-ID: <7hldrfuf8r.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_095239_125589_8AABB202 
X-CRM114-Status: GOOD (  19.81  )
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

Ulf Hansson <ulf.hansson@linaro.org> writes:

> On Fri, 11 Apr 2025 at 02:30, Kevin Hilman <khilman@baylibre.com> wrote:
>>
>> Sukrut Bellary <sbellary@baylibre.com> writes:
>>
>> > This patch series fixes the Power management issues on TI's am335x soc.
>> >
>> > on AM335x, the wakeup doesn't work in the case of STANDBY.
>>
>> This series is specifically targetted at the AM335x EVM (which I don't
>> have to test), so I'd appreciate getting any test reports for this
>> before I queue it up.
>>
>> For AM335x, I currently only have the ICEv2 and Beaglebone Black,
>> neithor of which support suspend resume with RTC wake AFAICT.  If they
>> do, please enlighten me. :)
>>
>> I was able to do a basic boot test on the 2 boards I have with this
>> series applied on top of v6.15-rc1 and basic boot still works, but I was
>> not able to test the PM path that's being changed here, so any tests on
>> AM3 platforms that actually use this path are appreciated.
>>
>> Kevin
>
> Is the pmdomain patch(3) ready to be applied here? Please let me know
> if you want me to pick it up.

Not yet, I have some concerns so I'd like to see more testing on the
actual hardware, which I don't have (yet, but it's on the way).

Kevin



