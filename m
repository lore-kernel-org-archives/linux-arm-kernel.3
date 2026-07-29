Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B0F7C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 13:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gxRULUArcLi/mAA3UKCNpTlA+ujH40s8IdE4tkoamgM=; b=G5jp/tN5ndfwbvgV9ayooavYcw
	oiQreu55JoGhQDkX7rZIxZrHgX0JadFpaWza/9gyftYPdmbyQhm+ZMJWb6+pfO6qChbNGWK55sm1L
	gBgLqc/41/gOEWXZD7HJUIBdzsOmQruXcO/1XJrDzWRpqK1XCL7l5ooB0i6ie7HajrLrPbWrUxKTP
	vzwkv8vRCEw0qEsUn1sy54QTaj4xyUqIsXFDaY18rp9YMJ+5pxvagICYVHitrVjOCgTwCxuE8fVX2
	tKww8aSy4JB40VQuMTh9Rkr4vhDqX6x9kXli9JHOLunaKLevJwtJRxMx475FvIaEYMqUHQ1Sy/QJ6
	eDuDU0ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4K6-000000085xr-1oDz;
	Wed, 29 Jul 2026 13:27:50 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4K3-000000085x7-1zYq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 13:27:48 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-6ab05b2f9daso364728eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 06:27:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785331666; cv=none;
        d=google.com; s=arc-20260327;
        b=c7SuaIkmg8P4CAKTk9rlv+hHP+7vCoxHjTIcjnpXn1r3bpfewq0eF9pq1VpQ2gq9ye
         DCrp0u0Z26PAp8t1JtpQESu02gJwnqGPwE2Gkpd3LLQG9tZT5GN50d1K/QgpYgODZMNO
         CwZf4mMaI6mK/rY5cAwUEWWCVzf2GVSt7SqXoC09qQr5WQh8A4pJsB0eNYxg8F5A+qQ4
         +J6ZQV7EfgAsnpnB1MfYcoLPWNp4MNjuCNnoBQ+i+KaHWQ1DXldOyMI/Xz77bOi7MKfH
         AWHUWrLtntqxTY65smRLwBqcyAKKAVKUUyMwo0qB54UO5k3wG9LfgFdSLIINHfA0m92i
         v08w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gxRULUArcLi/mAA3UKCNpTlA+ujH40s8IdE4tkoamgM=;
        fh=ClVmzDbbFCrpDnDSogUIFgaGZIFjVGvCEt54zNzgows=;
        b=RV5NWKyrUJJ9aFBOeKad9LkuKfSd5rgmwCT1a3DEIiUqJmWjZ73ra8Spgs7rpBFHxq
         9u4wkTB7+HOXxmRXnRkDUNnOJ552vcyudydr5akbIYBjUkoMJL91xwyA0B8LL5nLE9b6
         MahDZYJ6HkfnzUlY2C10HTaHf6mdZXy74w7KPbE5Afa+DbXWExK5b3JL1VtW4mJ8oB75
         nkf7bhwJlxvB70714iniIWon8/m+MkuZtmSy3VSSra8n+tSS2I7Zlzhg69djJaAKcmir
         za2ZOgDqkdfLlDTAgkO0b59VNy0w+h/O9bH0X69LWbprNQNxHqeo+rQHyNfkGk05TIrX
         fD5g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785331666; x=1785936466; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gxRULUArcLi/mAA3UKCNpTlA+ujH40s8IdE4tkoamgM=;
        b=px1eKQSgpy2jVKxTsUcdCP4dQh2ZK2IMKwwblbAl1q1A05KikjLH0xwNUnlTMV479j
         4N3ZJBZUXMfbyni3B3Nu5eJ3URF2R5Gwcka0ShWZhfrC7/OVY6wAYpkLazfUh+9Kvh7b
         uqznMrAGUboYRyAME9NcYcAe3T7A4MmtWUa32O9YzS3nDkTEkvO1W/+0px51tg6+4043
         Tfduln/xa6dn8xgavdsrFVOgwucNpxhR9TOgHJd5B00L4tFCvAXtyyFJY0+QczSWgnVE
         DVogprsf8IMxe5HDrMrJCdcDJRTWh+YFMU9CnMuV98/L6UL4KK1tEO6Vm47RmixhiqMB
         9TgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785331666; x=1785936466;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gxRULUArcLi/mAA3UKCNpTlA+ujH40s8IdE4tkoamgM=;
        b=QzVSoFKxgJ8e73qGYkq83iDcDUCH+6OyDsdYERaK8Y76N9LHtW82KWUpYnwZQ8C5Z7
         SMWiHqb8F+uZHIY7aBdNb7miu728mXS6v7582fz9whM35CMxYrm6CCu67GN2UqeIx723
         qZbwslikGOQyvLsIeDOYs+xzA5+TLTlwqSkQQZ0MF212WftBR72QYtgR03T6TLU90Y7k
         AenB8hyoI0wfZTnFZSkPVFOFyMbuNXLlAZu3sZ/LULRWzw/nuME076xHW/nD2C0mpRt4
         r7Iivny6l9uB6LGHD9TrK+QB0KvI23gllBDJM0dKJJgJWbbF66AFTAHDpo7hsYz3eHbE
         J/YA==
X-Forwarded-Encrypted: i=1; AHgh+RpQxGS76tL1ne0GuQ+AYSv1bjppWCV4sIPvkNAWGWQeovTiLTO93p8Gf+/eBuQDTpNvt+WoUQWIOSDIPMfFE8w8@lists.infradead.org
X-Gm-Message-State: AOJu0YxAqSym3d8FIlLFmCHD8NgjNWRe+UiXME3kau4crMBm3UhJPaQx
	WTDsfYfVrB6s3+8PndmFaYBJUiln3XcJiccV6ewGXkLj2lzkNpfWwuw2bLYjKGGOHqTErLLDGYY
	CJfk0fpBLaoSFGjDxgPaF6vEm2isxeAU=
X-Gm-Gg: AR+sD113k7ciTurpW5hUBxtvmEyuXXq2imQ+T8zy3X3mdru+BgAgQAAN9clV0mIsU9e
	dmUrQAEy+eLSZ8f0K2s8TQrr+znVVw5qb9vKG5mC9kR9LViBbs07ao7ZJHPcVdOzCHEUOOmiyyG
	jLGo6lQzblqTAXv6BZ4VJGocJUleufvzR9VBHw1r/zHYYj3izgGYX5/A1XaNLixqk2ShTjaK1l8
	z4UbfnkWyqz+NVt541JZx17pdVRR8FV7wYApT2a0C/qbndWrgC2AvuHUrqDgwLmQWdZ7NV0/0zy
	vwq9UD64E4naj2M7eoAehQBUqqvK1LGk8aX2kmQ3uRpi/Zru9iQvDZ1gig==
X-Received: by 2002:a05:6820:2215:b0:6aa:ea7e:1dac with SMTP id
 006d021491bc7-6ac96bdc308mr3238719eaf.33.1785331665974; Wed, 29 Jul 2026
 06:27:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260714222338.2965707-1-dianders@chromium.org>
 <20260714152138.6.Ia186a29119b4b5c409815b755e0c2c3965b0495f@changeid>
 <8e3025c5-16a0-40d7-affa-098ca37699c7@kernel.org> <CAD=FV=Vrd9AxO-NY_CP2h+f21qt4uGY2pOoFgacV+G5bnfd32Q@mail.gmail.com>
 <208b12fb-8f6f-4cc4-9517-bc59180aa094@kernel.org> <CAD=FV=XOGjLUF-1qOY=zCYJYq85MzkJ_56WbhraTcyAjU_z+RA@mail.gmail.com>
 <CAD=FV=VtNuF8E3OpV4pAS78-prMpaWgPy=+GtiFaeMVhki8jAA@mail.gmail.com>
In-Reply-To: <CAD=FV=VtNuF8E3OpV4pAS78-prMpaWgPy=+GtiFaeMVhki8jAA@mail.gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Wed, 29 Jul 2026 08:27:34 -0500
X-Gm-Features: AUfX_myssxkk2aJ3MvoN2H0D6ZI76cn0SYIfqLF68G-ApdrPJCyOOHfepLXThTc
Message-ID: <CABb+yY05L30Gt9cmF8Hoz2sGwUc1XocZG3vPoKMwEDfRH4tpKg@mail.gmail.com>
Subject: Re: [PATCH 6/7] dt-bindings: mailbox: goog-mba: Add goog-mba mailbox bindings
To: Doug Anderson <dianders@chromium.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Joonwon Kang <joonwonkang@google.com>, Subhash Jadavani <sjadavani@google.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Lucas Wei <lucaswei@google.com>, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_062747_515249_C9E224E5 
X-CRM114-Status: UNSURE (   9.12  )
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

Hi,
  Replying in one place to the two main points of contention ...

1) Compatible string :-
   I too think leaving it too generic is a bit bold ... we often think
it is final but more often it turns out to not be so. But I also don't
particularly like the idea of naming it after the SoC because
controller IPs are usually not tied to a SoC. So giving it a
controller version specific name should be good. I hope we treat all
controllers as potentially 3rd reusable blocks rather than a part of
SoC's identity.

2) Single-channel Controllers vs Multi-channel Controller :-
  Looking at the description of h/w, especially the separate and
optional register sets and the fact that we are not talking runtime
ad-hoc links between two endpoints, I lean towards single-channel
controllers implementation. That seems like tidier dts+code.

Regards,
Jassi

