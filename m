Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96927C36007
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 15:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=keE5UAE8I7WQVpj+EG1JG1WPFCAgkdvUmiHSr+M5kNk=; b=dzL58kBmOXuEgEkVyDUK/PcyuN
	d5ykKBImd7nlwJz8p3bO3ZKK3Z+xU+MvuithpWRK8RowjWqyd1eCf9EK2L5jlV6aXELDndY+QlAGb
	YgWEVpTRXmEtk6cI2aA7VWnlZvEdWU8SzphmHZ6i5TFXCuuGEHhiKuM+jjEc6ktaoV+q5X5fCUDhs
	TTNCmY+6OcsHZ9C3JTK9Gini1KVPPjLUY8AsAkAMRAG2zGQK8UTGczDXbb1Ui3exuTkvLbfORijKk
	szxIRs3ChflA+D8qCgFth4aSEAJTGuig3ueb1A/iM5OjmIt0hG1Sk7VE8umANXEY+zepj2RLGWxBM
	MTdj3bMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvemR-0000000FOKO-2Fhx;
	Fri, 21 Mar 2025 15:59:31 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tveiL-0000000FNT7-0dVM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 15:55:18 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43690d4605dso14777795e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 08:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742572516; x=1743177316; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=keE5UAE8I7WQVpj+EG1JG1WPFCAgkdvUmiHSr+M5kNk=;
        b=2573rcMMptjhOI7HmbVch7XkmnMIl0kU3rY0Skc1UleL4wouh70SMO73aM00lK29c3
         HwME37iP6ECnATpGoo9NjrotgyZmvEBwMWVaWScz91zEGHf0khpRnfL+0DTCrFTLc6q2
         7sFZsC2n7UqZg6JuWAXRTX4CkQoZFTYdcNtF5lY5h4V8Pzwo0Tc/Vq9OYhrOtVJWD6ar
         wlufP9yw5/iDwWqIF2qZAnJcR7Ay+ryX63L2Px1MdKsFYmXx/WR+asGtdmn39v/uy7DQ
         H40iTVy1lhV2BPThNWclLs1Lxe7Q1wzyD3+we7pSzK2SiUXxMi2ufblFPWAgxwbGcSl/
         ImDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742572516; x=1743177316;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=keE5UAE8I7WQVpj+EG1JG1WPFCAgkdvUmiHSr+M5kNk=;
        b=isDTA46LBbWW1CFZQ0xZ3sB45HSQgVcccJHoMRttunrAwaw7Q9TQ+wgBU0w8jhsVOh
         X1PskVKs+c5Xr0EN6+oxv+TJH0CaJI/izms1yBvMXtB4LUTcTYOu43DOUOSYy+rxyB1e
         TTlM9phVI6SNeYDYRM8CkKBhqVh0Pzs/gKWM2GyYx7dceWDx1xIlmMt/lqOYVn6SOZfe
         lwa+Chd1BAvMeObhTzmF6mh5quC3okZW5YP3Cn0xEEreOfgBkBk32b63IsvxT2RY7FDE
         2Flrn0viL7NBrSAZU8CK3ayBjlsYU14l+c/UFCullsrBLFAvatvOK2qxB4g/ltYx4C4D
         0STQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyldqap+d93pfv1ttbuVJ42Fqw0/XDQmLC0wgHDrGuGzEX0v+xC9MgK280K0BTRf1wWpbGV5xnOXpo/dQNTslN@lists.infradead.org
X-Gm-Message-State: AOJu0YyCMUHLH/MQAj8F+tJIGWZNRWonVwnM0rTUJN5o1ZxuDQdahuJb
	s1GT7KXKuOG0CpUc9imAEGgfaPIf6j/xZonWJlAEjqX4UxzCSXSLPPmJCGi5wA4=
X-Gm-Gg: ASbGncvG2h9I7jNQPrUo6lccnE7Z3VXiBveTu49ZC3YFh8yNXw8rqhAVEyi+DFIIlM/
	7/QPwVsc7Ps8U4MJ6rvgUGrO9LcCXhTBnZXiytKMoTo23gsVoyfcdRW28c2TeKuD5fObBiAq9i/
	5mrW35KmFJ+P0EYhpvFHbZpSmpuCfEEXXT8kwCFzaExHWbVX15W+ouY+q+DDfJWhWuFN6ofDdO9
	fjMeP21y+LHDIEkxQAdaj7lexndahVpSKYBJrsB5BdB0NARi5GGzDMJ7rw24lCCdD2wx9t0IbQf
	ICZJ6GB/PwosJxn980riraFrQ+DK5/J68AyVh/MnT3GxPN6uPqcKq2c=
X-Google-Smtp-Source: AGHT+IGf7f6p3B2QWzXbSlTw1NK0pPjUROlEz/T5BuJywHA6Cp2/lY5juGyE3geEn0WI2gDMWjaauQ==
X-Received: by 2002:a05:600c:198a:b0:43c:fd27:a216 with SMTP id 5b1f17b1804b1-43d52376b88mr29455795e9.23.1742572515585;
        Fri, 21 Mar 2025 08:55:15 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:2102:ce42:30c0:9b40])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d43f3328bsm81162415e9.1.2025.03.21.08.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:55:15 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] clk: amlogic: drop clk_regmap tables
In-Reply-To: <1j7c4i2xq5.fsf@starbuckisacylon.baylibre.com> (Jerome Brunet's
	message of "Fri, 21 Mar 2025 16:46:10 +0100")
References: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com>
	<20241220-amlogic-clk-drop-clk-regmap-tables-v1-2-96dd657cbfbd@baylibre.com>
	<9f1d69ebe1ddce5dfc170e986c9213f2.sboyd@kernel.org>
	<1ja5cp8f87.fsf@starbuckisacylon.baylibre.com>
	<88fe909ab182d1f17f6ef18161c7f064.sboyd@kernel.org>
	<1jfrlwb69r.fsf@starbuckisacylon.baylibre.com>
	<ed20c67e7d1a91d7fd8b921f156f56fb.sboyd@kernel.org>
	<1jmsg2adgu.fsf@starbuckisacylon.baylibre.com>
	<697b634770d789ef8ff0e05cec9465f5.sboyd@kernel.org>
	<1j4j205ark.fsf@starbuckisacylon.baylibre.com>
	<5109de7fe1a1a8467118daf80c7b7f8a.sboyd@kernel.org>
	<1j7c4i2xq5.fsf@starbuckisacylon.baylibre.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Fri, 21 Mar 2025 16:55:14 +0100
Message-ID: <1j1puq2xb1.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_085517_198402_4A38B4F6 
X-CRM114-Status: GOOD (  16.09  )
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

On Fri 21 Mar 2025 at 16:46, Jerome Brunet <jbrunet@baylibre.com> wrote:

>>> 
>>> I admit this is heavily inspired by how devres works :) but it does solve
>>> the early clock controller problem and does not scale with the number of
>>> clock registered.
>>> 
>>
>> I don't know if devres is a good model. It's about tracking allocations
>> and things to undo later, not really to track things to do when called
>> initially.
>
> My point was more the decoupling it allows.
> Maybe it is me being too picky, but what I'm trying to do is related to the
> clock type, so it bothers me when it scales with the number of instances
> instead of the type.
>
> More generally, something devres-like allows to register an attribute
> and link it to a group. Then the group members come and just pick what
> they need. Whatever manages the attribute does not have to track
> them. That is pretty much aligned with what I'm trying to do.

Just to be clear, this idea is meant to live in /drivers/clk/meson, for
a start a least, not as something generic.

-- 
Jerome

