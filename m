Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FF8CD4F3E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 11:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uRv0x/mbD31ezymVtnCbBZQgh6UPxXX7neGyCw/P4/k=; b=fiNzxTyHb9idkX7ItP3/vxqhVF
	E/0+zhs4kZYfEs7lFKopkO1l0ob0yaI+c98PG9hVv6wj5SLG6yxyOYGlnZKRH0P0UMQVAq0hzRTeQ
	bCGXAIqwT0+g+Oagy48O8qmJzWVTwRkVU6MpPHZro/4tNmMp63BymviSFeAS44z6xdQ7ADrlRGrtF
	qymqDwhS+/zaFuee6+/KciVZwtLkAB+60HG5MTt9QuMGcDL1l18mP/+IixPjDoVuLNeFHJopOA+H2
	i54sYrfIqti3zkrLUT6fsxGY6KsgAj7Um+6YwxX7KrXhRtgrYi269IviPSiFozGlT8F2vTxF9J3LR
	Cje2iNlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKaVP-0000000EYx9-2pB9;
	Sun, 16 Nov 2025 11:01:15 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKaVL-0000000EYwp-3Zj9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 11:01:13 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2958db8ae4fso31612235ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Nov 2025 03:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763290871; x=1763895671; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uRv0x/mbD31ezymVtnCbBZQgh6UPxXX7neGyCw/P4/k=;
        b=YuUqi/VnwYViJZB/8wqW1eiSF2s8nkEXTvptp6q9bPjl4DszjjrWWpO/UulxXPGQiC
         VdP5DkrmutF4xEecTF0pYJZTbRcJSTq3NVihsCqdhwy9cnYVLt5cFGkhat4783MNldwx
         DsjPUe9Rn1oObv3u3uOAvlrI2fi/arkfoVupnipivVmQfUw8npEJQgcevpZH9VHTJIlt
         TAZ1YtpQjhwCUwzGxCKL7zfjYokbgl4NZ8uVBv5ViQy027/qaDEjIHkc/TXA4ANcGtFo
         PSZzxFMgPIAZFeJNxZwO6IJgcrK/3+IZfp4FUUWnfFEcAF++u0JeM8ipLUt14GqzxV7c
         DWQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763290871; x=1763895671;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uRv0x/mbD31ezymVtnCbBZQgh6UPxXX7neGyCw/P4/k=;
        b=U1jdP9xg/lP8OHJKKBa6FXJtF29wvs457JMs1h8YlLVtkJSFIrPO2EVWXj6ZGsASdz
         9Sym0lYGXpyRPuJIff2fpjP3B+9aHkYFoIu80wKTeltUTiadxVCt3fIF7421Jdf8uvG8
         JjX6WLz6Et3NDiVK7AyGo71F5Ncg2DYdsiOayQIBDA/8rj8qMR34GRckYrONDaV3A4pX
         oFOEeQspK7SjHz4wf717V7h2CNjVnwubVdq7Zg/CBXiDqYXB1SCi+gi75gyLL4LRT8WT
         /TVfqepXHWaeVtD8L5gs6oxhMJ+2c2LjOHzs3ogTSHVOBAcaGXBZl4F0vpjqOwB3TPig
         FJWA==
X-Forwarded-Encrypted: i=1; AJvYcCWwR0Y/UyVggHB+KF9EjHoHXkSR098daR4KQ1hy5mvDa9yOTOKBAKib9Z4TkLTDWHgLR3XZzenEEIT19a4WwN8r@lists.infradead.org
X-Gm-Message-State: AOJu0Ywkb3/BMAo7RwREILxGmQ/sFi+9xSRmNgQ7bq0+CgLiscsms7Q7
	oHVW0Ap6LHFPjam4tgEKwAXNTFUOz92EmKVmTxvA87pX8ej9L0r62HxHJcdMeAtw
X-Gm-Gg: ASbGncu2hF3gAifeE/8lvA2G9MfeMYDexvM1yRIqA3VFSIVDWcHTAZIf7Cr3IwPyOy9
	qfKudAdt2liF52PBbRmDq+ihrBaOJI2jImSZw7+OW0nasX4WniHqZzThjEgG+3Y2B2zSVJ3mubD
	D18xYqyx7TZGAqdAvkd98nnQ6KXR6N0Y8wtptSqHqVHGX/2HUBsLpuVEw7LK9LAAsFgexpIbSUG
	EzbXxccdw4Cf0g9K8WWuV11xXlwEjDj8lNXi5Vus/pflV77AftIyTNS7vVaVfpISQOySLbr6TkC
	ZMSV/+BAVy4b0nbNXUIO884HtdETCZo5BwXbqo4rNqN7+4Lgh2930nxMKwD7dJkv4deEsOh1X08
	OjOQ/LEWDpmMNgnPe8drQm7TE+WGRCFObsXAN/Ct8F+fZ7mESOigSG0PmiqkAwduX5agu2uhlP+
	+xpBwN+XOUhkTE3D5nfCzEvPSZSJXltJk=
X-Google-Smtp-Source: AGHT+IGwXKVh3JoXqwDVnEA8t27M4iTiBciJSt6uHCX3HWuQiqFLuOCSzc0jDkXVTsETAHbo8/8pyQ==
X-Received: by 2002:a17:902:c945:b0:295:5da6:6014 with SMTP id d9443c01a7336-2986a6d07f2mr112271255ad.22.1763290870736;
        Sun, 16 Nov 2025 03:01:10 -0800 (PST)
Received: from [192.168.1.2] ([122.171.252.231])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc375081023sm9414287a12.21.2025.11.16.03.01.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Nov 2025 03:01:10 -0800 (PST)
Message-ID: <456bba04-07b7-4c27-96fc-9bf226b12fd9@gmail.com>
Date: Sun, 16 Nov 2025 16:31:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: errata: Work around AmpereOne's erratum
 AC04_CPU_23
Content-Language: en-US
To: D Scott Phillips <scott@os.amperecomputing.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 James Clark <james.clark@linaro.org>, James Morse <james.morse@arm.com>,
 Joey Gouly <joey.gouly@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
 Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 "Rob Herring (Arm)" <robh@kernel.org>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Shiqi Liu <shiqiliu@hust.edu.cn>, Will Deacon <will@kernel.org>,
 Yicong Yang <yangyicong@hisilicon.com>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250513184514.2678288-1-scott@os.amperecomputing.com>
From: Jaikiran Pai <jai.forums2013@gmail.com>
In-Reply-To: <20250513184514.2678288-1-scott@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_030111_915058_F402A8ED 
X-CRM114-Status: UNSURE (   9.91  )
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

Hello Scott,

On 14/05/25 12:15 am, D Scott Phillips wrote:
> On AmpereOne AC04, updates to HCR_EL2 can rarely corrupt simultaneous
> translations for data addresses initiated by load/store instructions.
> Only instruction initiated translations are vulnerable, not translations
> from prefetches for example. A DSB before the store to HCR_EL2 is
> sufficient to prevent older instructions from hitting the window for
> corruption, and an ISB after is sufficient to prevent younger
> instructions from hitting the window for corruption.

I see that this patch enables the workaround only for AmpereOne AC04 
systems. Do you happen to know if the underlying issue for which this 
patch was introduced, impacts (or can impact) AmpereOne AC03 systems too:

CPU implementer    : 0xc0
CPU architecture: 8
CPU variant    : 0x0
CPU part    : 0xac3
CPU revision    : 1

-Jaikiran


