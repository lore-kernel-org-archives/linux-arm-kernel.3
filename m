Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3003CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 22:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IPfTT/0L5kL1Bj/6bdsdzAICO5F5R4CJvks4G8LxlPY=; b=PIR2GKfG2+ZbqUXTHeYa9brOlv
	GOmHOFKU12N0v5sEO5CC89ZBARDsObG1tj0mJFrP3FLo+Et1/55P/IKqv2Lx0dL472kWsjOLqt25n
	AmeBZ5jBb3VCDl/pybRlyDZpNbg7bZyl9sZ0Kfxbj9Xxss5pEf2sb9BX1OIPspBV2ynMpflWTfjVH
	9zDurupsfcsrHxccASByfd+kRB2FgTblAG0ZFKDtGL/AGcQ73XYugm4YmCF4lb0L1q+4Vaytm+hCp
	Z7qMPlw6xU/gg8adDbVi0F9IjBZ+9LASeryIh99TRyKKlDjZ8jvM9br1kbcXCqG8ui4wgIwhOYzR8
	15O2wDFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utZwi-00000002UWZ-33VT;
	Tue, 02 Sep 2025 22:57:48 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utTh3-00000000uTI-2VkM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 16:17:14 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-77238a3101fso2245052b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 09:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756829832; x=1757434632; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=IPfTT/0L5kL1Bj/6bdsdzAICO5F5R4CJvks4G8LxlPY=;
        b=d5pLsgMQwnLlUoNsTWJHLRnyPtxtewZQUjtXRVAGEYmYrE3gBPztiX9hdE0HF8p9vM
         L+P0egiHrGdn4ovg8xAfKUKkVqQu9gos4DgiS4wOoUOYidimTdjrab/nOoD1tUgC83mj
         D00fr3ZVr/XSI6TV0X3ZXQesIVOkm3AonBNKwM3xm6kmGCMQ2oljuUt6JZDeC157SEr+
         Knql3FKj9geqOeTwlmQ7r76Q+HrnXQXuPHV+uJ42drO9mHClCf5xIJZxo8fmbFX3nQ4w
         IYybhWWFvLo/rhQ7l/7CVOF9yH38tb6Zg7QvnW/OfHGjHrZxdsxHsURk1kn7u4NSI5mz
         FhtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756829832; x=1757434632;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPfTT/0L5kL1Bj/6bdsdzAICO5F5R4CJvks4G8LxlPY=;
        b=EtNlJXtoT3HLjzb9IDaaODFadaClsz2ZI7hvv6xJ7hmEHpJEGZOKW4D93so0Db56IF
         8Zi6AzpadZT5Hre9nsJd+ihe9Xl+CZNF5FMuF/9rvDHsgpKAe0g+DuQuQfxS8SBqwKjD
         ZHMaEZGRMSHCpo2QrttJxEGIDtLYDFadEuprKOszld0I7C4T6e3MiUMShjhvT1Ev5cZE
         4CIpYDcr9JzseptKC33Llr/43XnBaUwk63BNEoY8uPmUEfeA1obDI0D0Vdd8ApPLtNQ1
         SyPGZNXCGJc3gaNIwynzaFC41AT/jK8KrZDrUZkn3xdbPJii8BFUEm1r4IaWaRwIy9tJ
         Esrw==
X-Forwarded-Encrypted: i=1; AJvYcCUJVHqaE8RdlKA2p38+vrLSUgpSMlu6fktOb1bTPCk0997fC4lh1yCwgVZg3iKrYNEUhMg0lJjl/FciVLhia64d@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9cajiUxFtMvSpjz63PuUsRO9kng6go3rmHief8ZDpB4WfQbGv
	p/zvVy4HujDBpm8EL4FpyvElCmbseYB3jOS91DVYtEmsRzMkRgtutPL4fHwn0A==
X-Gm-Gg: ASbGnctpQkyEETEWjWaOv2qEO2g354LscSR3OPZ8bF0G9FMlygSX2eW6g+8kKxDG7I3
	7WuycWwer2f7tG3sj1tSq1Lt5PxGx48iK0FQbJoZ6luuQVXWMUjrginFGr+rITUtW9ma+9vf8+b
	gWBrZZErFrO70DTPlBPjuMNPe2NvPZSm7XCaZTcvPNOKM5+i028VknfanrK90Zad7Ia44/f3dWg
	hfJpA+3MMD8UUlFr7yxs9RIQwX6Adi/0fBCOaE5odVlbUyVT0M62EXMBASs8B/iNCqJHXjKzkYx
	1EgIZuQ4qCSOw8HekQw17H02h2ofWEcbgZPp3ccEOm/ebRCRYIlkYH0BOhcMWW8v9b/6UedOidn
	c38xIB4O2xOV4C6d8TFKeKDQ6P27v+Hb0bKTF7lohLNb7osBtYQ02ec8DrDv3jNgIGWplKMw=
X-Google-Smtp-Source: AGHT+IE20K+tA/6/z1BySaXCYennEWsXPCv07XakypHENnnb7aFGqIZ3vmG/e1SUUKAD6wtf/+hPhA==
X-Received: by 2002:a05:6a20:42a3:b0:243:755:58b0 with SMTP id adf61e73a8af0-243d6f3b622mr16422834637.49.1756829832415;
        Tue, 02 Sep 2025 09:17:12 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-772590e054csm6562208b3a.87.2025.09.02.09.17.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 09:17:11 -0700 (PDT)
Message-ID: <0c7829cc-e7e4-4d15-8d67-6e188e2d42f5@roeck-us.net>
Date: Tue, 2 Sep 2025 09:17:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] watchdog: visconti: don't print superfluous errors
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-watchdog@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 linux-arm-kernel@lists.infradead.org
References: <20250813190507.3408-5-wsa+renesas@sang-engineering.com>
 <20250813190507.3408-8-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250813190507.3408-8-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_091713_641289_C26E2048 
X-CRM114-Status: UNSURE (   7.26  )
X-CRM114-Notice: Please train this message.
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

On 8/13/25 12:05, Wolfram Sang wrote:
> The watchdog core will handle error messages already.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


Reviewed-by: Guenter Roeck <linux@roeck-us.net>


