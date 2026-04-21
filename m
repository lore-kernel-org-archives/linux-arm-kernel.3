Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23010F8FA6F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 13:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AcwXPuEKEyim+hAxjt7i+w5K3SQ8k1OJjWOgR4sgPe8=; b=v9nLgykglNUXEU/FAGlbZCkRte
	1fbkB2twuBwBGWmDSt+vRwQk8OJ2nHFdO6QdwNexmfZowaqRyXMl+48jfUHDh/SpfRjk9WMFje8CL
	OMqugvwnnlCoDjQBiy/nQ5UfF0diW5fybFFdiQjRmQnTi2x7LzlSENnOjJAliYHSSS4OTTXvxGNVL
	iv2UWJm7JhReEkXoXbumLYBW/ZhVonUjGRn8naAnJ6LXh6hK4PwRpBO7okpJOFelB+KKTdCGrBX4X
	7WaOG8bvm4a84ghQexCQSOSbEkx0EBF8rHErEmv8B8hZuFLS6D+IINii5+J5jm8EsgpjJtQJUGsVk
	6qBsYKvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFAiv-00000008cds-1Dz3;
	Tue, 21 Apr 2026 13:01:05 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFAit-00000008cdZ-0n2R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 13:01:04 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-42c0b0ffac1so918360fac.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 06:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1776776462; x=1777381262; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AcwXPuEKEyim+hAxjt7i+w5K3SQ8k1OJjWOgR4sgPe8=;
        b=QCDHKI3BfAzHGjSn5SjLHVmeN3R6CcTkMnGfAJkmHNJvjgvLqjl9cLHyVQshe0uENu
         9KS4kjTSIvR1xxly8y4iuxcw1/RjtWUAEGjWIXEVTpMPfkDdYDhrQ+w41/xKVRG+p1I5
         qjxq6wwjAqMxROiQ/lU9y1yWdqtaD2vN7zxmycxYwguIfSsYXTEOnqzhNxRcAbg6SHZ0
         Tea4FvAz9N5Y/Q+L+Sj4NWUfilVydfHNErXLJ9AaXRDY2FA/wBstpiYwZUycyYhfQ+pZ
         B39nytDjNF3jm7rJjFmV8AwSOekNXEGZRJMhf8dnh5vktp3KGhOF5JMPBnTw3lz2QRcq
         9I3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776776462; x=1777381262;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AcwXPuEKEyim+hAxjt7i+w5K3SQ8k1OJjWOgR4sgPe8=;
        b=iWgQOHVLj3V12svxub4eAJh0zNEbPJzqd0mrcUOtxlkHtxgrJpmUeodcyRgh5tJ10K
         J1TBZ6Ve5EBPJO0+FkXxnAjvdG6oG/LfYeupJBkuPnYEPY3zPz0jTVyLaBRnlEXiFtJT
         wuHqWD75lpavWgfQWf4pNjahCx/JY8aBU/xXmGidib7rxv5oeCeZ0CZxTSkWPWtiWfNQ
         nVknHL+jS2Z17LD4XhT7+l22mN8n0PP+sTtWDX5+/pFkISnYMf5EscdlMFI1L89AraIA
         NrnNCAVTgaPKSUAHs9cHVw6lN/25jhQNN/2VCOgcg9FIkMt7K14E7KOnD2jl30ZkDrHP
         wRgQ==
X-Forwarded-Encrypted: i=1; AFNElJ8GwkukPSfQ/zIWzvaFuC9oFx6mRIHbgVy9ZghOdFTLUQLYzr3iB97u1jRLNnvfwRPiUjXYDXx93O8PRID3/FLJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yyvpe7ysMXopnBJoKU21BY8K3faFIWbMV4OpAXzgp3PJYXugbCD
	kRj6OXTTwMPSgXY6v1SGJKbcKHdTcg6pG4/1iwLfoVVmo/cgl/UM3aRAW6C3gRZBnQY=
X-Gm-Gg: AeBDies1mf3w3k7GgergDX5p0CL6U5M/1rWgFV37vHcgEPWDbp4dcYQbTrVzHvHNU6e
	ehPpAuwfJr8nxvstNCdnwA+l+9aZpm42dLwxAlNkRELHlkefEa6u1QYtO5x8GXiKQn7gXskRrP4
	JEqPtUNff9E41U2Cfqd+AlDl0xx9tPdoBpCUhybDCb5XVwXlOrGd/mkaXyc/bXYoUH14L/WKk+g
	Uo8bSHArwcW2ZdfyVsh4So1VIZyh+rklwy6euHIm9Je9qe0tHDsbsjcUcE2Z3bp1kWTlWfez+oi
	5sSBWD0AwZD/wZk5h9v+Ye/+PsVBkdGk3XD1+pmW1cGg/dMqqRrRFoYjrslIoeB+R/L0tXUaTdK
	KupQC6g/wl6mJGQz5fWImkdmkEoyU2aDaHKe2F7JsGrg4VwhEkH1cGhzQ/md5WVcJuYsplT1ADL
	kKhFaaeMUvKcjPKGfqsw22DwplZjP/HrwJgTUrmyS2B/BymD+XfxksP0Wu4yqI2WrkbnpQ/gX8r
	nfIspRv0+tq2E1ej0gZ
X-Received: by 2002:a05:6870:4409:b0:42f:59d9:1511 with SMTP id 586e51a60fabf-42f59d92fbemr771710fac.38.1776776460222;
        Tue, 21 Apr 2026 06:01:00 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-42f090b1de9sm1006513fac.6.2026.04.21.06.00.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 06:00:59 -0700 (PDT)
Message-ID: <6838e232-6c0f-4873-88d4-38398b867577@kernel.dk>
Date: Tue, 21 Apr 2026 07:00:58 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: kernel-hwcap.h change causing full kernel rebuilds
To: Joey Gouly <joey.gouly@arm.com>
Cc: Mark Brown <broonie@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <52fb2e8f-3e1c-4cf5-a02a-0d68beedd18b@kernel.dk>
 <20260421125628.GA3849283@e124191.cambridge.arm.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260421125628.GA3849283@e124191.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_060103_303985_0E50EB46 
X-CRM114-Status: UNSURE (   9.82  )
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

On 4/21/26 6:56 AM, Joey Gouly wrote:
> Hi!
> 
> On Tue, Apr 21, 2026 at 06:52:55AM -0600, Jens Axboe wrote:
>> Hi,
>>
>> Maybe this has already been reported, but a quick search on lore did
>> not find anything. So here goes... After commit:
> 
> Here you go!
> 
> https://lore.kernel.org/linux-arm-kernel/20260413-arm64-hwcap-gen-fix-v1-1-26c56aed6908@kernel.org/

Thanks, glad it's fixed, because that was pretty terrible yesterday
until I started pondering wtf any kind of testing was taking literally
forever. Guess I'll rebase my 7.1 based branches after -rc1, anything
post abed23c3c44f565dc812563ac015be70dd61e97b and pre that fix is
basically unusable on arm64 for any kind of development.

-- 
Jens Axboe

