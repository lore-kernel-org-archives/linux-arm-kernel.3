Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 059A6CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wWh8PyGxlWxe5MHSxxwSqq6RuwtxVFP35Vd46MU/svw=; b=FADalwW6E4xAOcG+P5Hy2vjg4l
	Sd7b+HWTsQXik8SkfZpi3H0I0RtXwnlZPofBq6vIcdQYwWGSgI0YTAxumXy4xkiznG9zzThJRUVtH
	3uO3M5ZnQZyAfR86Z805yc4rZHpEIjr8iCSAF6ngEnR4HkHLIhUjwHQVjwTJooOdR1yI50BM+wt0a
	cW49skv/u2mC17KU5P2XpYHhXlAjW8RGluMzGOSliop66wGHuS72/66h6e8thyt+EUZFgu8YnHA4G
	aZRXk7J1/1BMMtycOqaGHB/esfgu+bx0Utb5UHxjpFYY0d7k16WyTJLnZXzOqXU6NScnGbAIs/C37
	bP6PW2UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphrT-000000046cD-0CDC;
	Sat, 23 Aug 2025 06:36:23 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTIv-00000002w5R-0hRT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 15:03:46 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-619487c8865so5752431a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 08:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755875023; x=1756479823; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wWh8PyGxlWxe5MHSxxwSqq6RuwtxVFP35Vd46MU/svw=;
        b=uvSCpib0cOvbojcrGw2nFyDjSfI7qBGhZpi4pRGfdiQBByHtY/zMcqoHb4cQH7fWJj
         qSfD4YhNLx1/tmV2baNJXzBeGWDbt/ORgL+m/m9DcmmG2js0b44etuNApxLlMijWBVEB
         y/T7sucpc5mqIaQJdk/uQz/P0RkrqPU1jR5NwxR1le9oTZEFbKG/728r/9gPcV5pxfr0
         51g51XVG6xBlws7eTotRzKb8MlyZJF0R3oy7S/TfHmtd/vEx8Lvp+q9+U1Ic2Nh40c6E
         1NuEjCf2UZOEV4NhuG7WPHx4nJrnjsSYWPhIDuPVscjREVlgLdWlyYzynzgD8enPBgAS
         usUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755875023; x=1756479823;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wWh8PyGxlWxe5MHSxxwSqq6RuwtxVFP35Vd46MU/svw=;
        b=Nn82w70UO4nSQU7YDAoEsoHQcH1cfICNkM/9jtpryU5zoV4VVUMzqFerR8xXc2GiKd
         oaQV1fphrjRAPEGFYwsn8Bo4ccRGQ8pXJwkEilp2G5VcXWbJqI57uSArREldXZKmam64
         nlG995534PMRjQFc88bKj33ymDSRjU2RawOiwn/qUMXjnWBsKaCf23ookKBFUt/F0+tR
         bXMltWznxMfMV7KBKKwbR/T3dlJqcpeJMiV4bfDIslD0weU2lFH9EdBQUDX9EGY1yZw1
         WZ1UbF40esoXfiRRVvNNdPmG6chNEJpynNhdoi4X7ghOM9+67tqNCZuwzts9mn2MpQNK
         2LbA==
X-Forwarded-Encrypted: i=1; AJvYcCUM6pgysYKwcgXXA1ON4tqhMwL3bBT5geaWtZoajdnrtHPrJsvTcP30zKmRtnQwUCUzcSOfRfEDldSIirtKbEBF@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0t7LUIfeji90yQpD2BTEHYvB3pIcbOAolYqHvrRUDnvshnx3W
	zrhRHWLc6JBmwBfwdsZ5CyRG7q0r9C/HgaWq7LYhg5W0K+zZiBJc9QfD7dENwI3Je94=
X-Gm-Gg: ASbGnctP/nP1lTQQreoqF6cMYnAqqO4TiDIkOXUXF4I516NA1y7q1E0I0LM01YU5vtN
	dKczPU9W/8LqnI4UHqnZOfgs20FPkdSXNKetirXN49drkStjYBzizFJ5Sh0SMeqFvWzShMNvD98
	zV1+vtezwVac9/nBTF+COlsW7U7c8MGfTGrDIIjxj/Z756EmTinWOxfGfHnB/2rZzm+o9q8AkPk
	hrgHi4YhHhgnUPyHljc8ttddrBLRGNnsOPxy8ETR7vZ+pdxdCjX00DQKM7vC2E7//6PQ86JGjDS
	B1qCKjNzDBsg3kXzvyqLGLDSieqpLPxaLQ+UAuT+D/D8hXUoMEyguU+JpGcxJjdcoKxg1e3j0JT
	cAZws03JUpnpSUImNAjjNX7gsHG+Fx1Oj
X-Google-Smtp-Source: AGHT+IHFLMYgpEsUwExR4khNq/wCqpieQpwMLNU5LCmqz1CCYVCENyfpLn38R54b4utgze14geVJgw==
X-Received: by 2002:a17:906:7305:b0:af9:8739:10ca with SMTP id a640c23a62f3a-afe0b497404mr587666966b.28.1755875023083;
        Fri, 22 Aug 2025 08:03:43 -0700 (PDT)
Received: from [172.20.10.10] ([213.233.104.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded539d2esm621862866b.113.2025.08.22.08.03.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 08:03:42 -0700 (PDT)
Message-ID: <ebea336e-c43f-4519-b2c6-4f8812e29448@linaro.org>
Date: Fri, 22 Aug 2025 16:03:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: firmware: google,gs101-acpm-ipc: add
 clocks node
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 willmcvicker@google.com, kernel-team@android.com
References: <20250819-acpm-clk-v1-0-6bbd97474671@linaro.org>
 <20250819-acpm-clk-v1-1-6bbd97474671@linaro.org>
 <20250822135521.GA3487754-robh@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250822135521.GA3487754-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_080345_210394_D20BAB18 
X-CRM114-Status: GOOD (  11.07  )
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

Hi, Rob,

On 8/22/25 2:55 PM, Rob Herring wrote:
> On Tue, Aug 19, 2025 at 11:45:36AM +0000, Tudor Ambarus wrote:
>> The firmware exposes clocks that can be controlled via the ACPM
>> interface. Describe the clocks exposed by the APM firmware.
> 
> ACPM? APM is Advanced Power Management aka the predecessor to ACPI?

ACPM (Alive Clock and Power Manager) is a firmware that operates on the                                 
APM (Active Power Management) module that handles overall power management                              
activities. APM is built around a GREBE processor.

In linux we have an ACPM protocol driver that communicates with the firmware
via mailbox channels. It's similar to arm,scmi if you want.

Cheers,
ta

