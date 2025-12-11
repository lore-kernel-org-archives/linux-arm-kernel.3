Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC42CD3E79C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 08:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2X9fr0ZGqhI9r7USka/MTvJqmePaDtXMWQ0HxFh6CQk=; b=JX5SCemYL+o9XEOdzFwJ6H+hRt
	KAQCEp7MK45bvNGjZdVtLyzCnLSrkU1EN95g5wlBl/j7GZe2qkPCJ/sxPCsfKcvkGvZr/V+IIQbzW
	GbRLaywJdYkS3emkpxnI6PmV1t/ic5j14SK5UQSiS9496PFJTuflW14o+eIb4M5tWb4N9b3We4nFp
	lsNEF+JIouuPHRgkM2q09m8fSm3v93tWrhQnLCUFGmMisDpvXxMVdrVBgoZYfS+g8e5dm3RZrxYCR
	Etwvo+ncgyMH5oke+b1tAbwUiZtlPpoeFy1UdKoU76EEjsMM4eU37eifbHsRg6Uj+dZedi2szcShw
	DzDcH3Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTc4S-0000000GNhT-3xdf;
	Thu, 11 Dec 2025 08:30:45 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTc4P-0000000GNgb-20ro
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 08:30:43 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-42e2b90ad22so209293f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 00:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765441839; x=1766046639; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2X9fr0ZGqhI9r7USka/MTvJqmePaDtXMWQ0HxFh6CQk=;
        b=jn1+EcBURQPT/DFj+yYqF+ynJdcL+HON2ZIvRK08moZCyPWYRG2yf/R7uODmug3ouT
         T3JVepnPz5p2ZHA5snJTMqvCjj/rYFzmSEelLVYMVRw8T5ZJsFYXVODQnODShA+yxP4+
         /Y7+1DdSlSXGUp7QxEXwZeEysS1XjcGBDkr4H2I6u1rQ3jfeILjip7X8o1LUTSk23svC
         rn9FRO+jtQGmjsnvaLtPHEr11gRiS1Mzkj6xp6Idi2QuZ8VR8/2prVcVvWU76REDR1xp
         RIlr7bYT4mF9FpoI29pCrHesaxnuNOVUUGv9K8WsNcR/PT8q75c22fqFzxF6gNYYXuoa
         s9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765441839; x=1766046639;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2X9fr0ZGqhI9r7USka/MTvJqmePaDtXMWQ0HxFh6CQk=;
        b=AO5ECnatcjmJCYIuGt5DoEoDDdXaZq4CdYW9P1F8jIpGqtLFLchxchrzmfCZWhe7c/
         qqMfYHr4sFD9H6BZKYRXY8xetoJ5Rs2vRDNue9WK1hujVBeB/lyY566iJw/AI9b27/AI
         XiiBA34nxWr5H6rDc4hByGdxATCDJAN/7kStWP7W8VqEqQXMKeluRtdYcyKv4WhIi+aj
         gMJGBzeFX9EH5vBstA9u7FcoQGJ7pqWKp79Zm5IGEFgOCXrDlzGoSS59wh2t7hQXTUQj
         J1szT69/EkKkIDnNqIbFRCwqwy8XN5GSe9LT6OhTG6SflrmlnUk3V24mlPHlOCQlGm1r
         8q0g==
X-Forwarded-Encrypted: i=1; AJvYcCWjdl7tOBt6GVjsO9y58NLXSVB+4vPi7y3w8bjNlIpPuGvxWjNCxQJE9gFojBnWI6eJ2IFZLr5YNCOUuhmHw1j7@lists.infradead.org
X-Gm-Message-State: AOJu0YzjPeP2dCqiDj6B00TA5W0A8lkqlkdw/ZQBjIXmWPPW1eGeN0Xx
	M7ttdMGgboMBmrNC1gzGHK6TI6RYkt131XmFItjcCPumtI1L6gW5crKr/4myxcdspV0=
X-Gm-Gg: AY/fxX6p1csHJnrBdETd45jhLV9aHonnaSX0ybi/m9jIkHwzbW+Rdim0GMjllbG0UN2
	ndBsiU71MM9ta9n0ElnTgrf2Zdpp/PB3tjaWu8r3U/zL7I/A1fGMV6FJr6xOA/wB3F6A13+tRHL
	KjDBIG86ZVl4/0sWiGquNAnbN5gQvJC8dE8wFDgmPZpWlcuEximkhgYQ2htwWEJcWWH+lIjIETj
	F1V2a1J4yA2dMuQ8bRazi2tPZr1gtTZDLEa1QQGa8AdZbHXqjgSUd1hdYPnvTvIH7jQ17L8OXV9
	hJGzTBwh6/r06KjJYdo71iRmGgdsplBNkjHKR9RkjdAL473AKLyoQm6Ay38lFXfRi9AOEWJT5vR
	79u4c5KPEpkFseNrljrkhUa0uQcrjJIqhdhOAR4VDBDkzDiGzYyA2FkosKPlPWu+fP3X2JR/JPt
	wyHyU2bJt8jg==
X-Google-Smtp-Source: AGHT+IFLEkEWc2D5InTXf1neme6xk0o1jO4IlcHFBsS7rTvGMj+Mx1Yom9idZgRNrYbNQPqpeuss+A==
X-Received: by 2002:a05:6000:2401:b0:42b:3aee:429e with SMTP id ffacd0b85a97d-42fa3b0dba4mr5792532f8f.56.1765441839135;
        Thu, 11 Dec 2025 00:30:39 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:3d4c:c4e0:9658:8033])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42fa8a66b97sm4371966f8f.7.2025.12.11.00.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 00:30:38 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jian Hu <jian.hu@amlogic.com>,  Xianwei Zhao <xianwei.zhao@amlogic.com>,
  Chuan Liu <chuan.liu@amlogic.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,
  Stephen Boyd <sboyd@kernel.org>,  Michael Turquette
 <mturquette@baylibre.com>,  robh+dt <robh+dt@kernel.org>,  Rob Herring
 <robh@kernel.org>,  devicetree <devicetree@vger.kernel.org>,  linux-clk
 <linux-clk@vger.kernel.org>,  linux-amlogic
 <linux-amlogic@lists.infradead.org>,  linux-kernel
 <linux-kernel@vger.kernel.org>,  linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v6 2/5] dt-bindings: clock: add Amlogic T7 SCMI clock
 controller
In-Reply-To: <38ef7ee0-1879-42d5-a7fd-d32b96d01367@kernel.org> (Krzysztof
	Kozlowski's message of "Thu, 11 Dec 2025 07:16:25 +0100")
References: <20251204053635.1234150-1-jian.hu@amlogic.com>
	<20251204053635.1234150-3-jian.hu@amlogic.com>
	<20251208-independent-warping-macaw-74a169@quoll>
	<dd90b445-bafb-46d4-8cec-e0877cf425b3@amlogic.com>
	<4f5ec838-f8d6-4c3b-94f2-b2a60cfe64ec@kernel.org>
	<1jy0ncvu23.fsf@starbuckisacylon.baylibre.com>
	<38ef7ee0-1879-42d5-a7fd-d32b96d01367@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 11 Dec 2025 09:30:37 +0100
Message-ID: <1j8qf92zf6.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_003041_771765_65980960 
X-CRM114-Status: GOOD (  13.47  )
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

On Thu 11 Dec 2025 at 07:16, Krzysztof Kozlowski <krzk@kernel.org> wrote:


>> 
>> Is there a new requirement to submit the DTS file changes along with the
>> driver changes now ?
>> 
>> This has never been case before, especially since the changes are merged
>> through different trees.
>
> There is no such requirement, but "has never been case before" is
> clearly not accurate, because I raised this question multiple times last
> two-three years.
>
> There is no reasonable way to hold publishing of DTS, therefore if
> someone uses arguments like above with waiting for driver, I usually got
> suspicious.
>
> Also note, that many contributions from various people (not saying that
> this one here is) were bad quality and badly designed but without seeing
> DTS it takes me significantly more time to understand that design. So
> yes, publish your DTS solving all of the questions and making reviewing
> easier. Or don't and receive questions...
>

That's fair. Thanks for clarifying.

>
> Best regards,
> Krzysztof

-- 
Jerome

