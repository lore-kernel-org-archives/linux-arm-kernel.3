Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E947E7AD62
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 17:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zz1xVTvh572lJX2qZqJOG7cy24vvTwbo6dUFp/NuXtg=; b=fLmTY4tNy21EJJDGy2POqKubyG
	vKVsz1I4AlCrFOf3pJ7XqOynwIoMS/c/ujhnQPZoIbJaN//QA+ECoBZXAhJMNwqSy2IiDl2U+NaqL
	FgEWJp6vPaR0LPM6WEkLORAZOpn86pf0Ut+Cam4Qdb/875QhHfznqWpXa3w3ycSME9tRg9ibeOwmq
	VcJcFPSOgFnMLRy1wLd+W/okU87Z0EvC0ClFhyViXptoSfmH5MLedeJP0ZxYxOe6egvdB/wQOG0IX
	HUN0sD4WMipPhEt376IHpzbgnaCCVnT4MWZdLVlssVJFdgq2WEOOyBaNttWsjWDr2MLYz+Nas0LTr
	4RoHq+Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYpOx-00000000aDQ-2BLB;
	Thu, 25 Dec 2025 17:45:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYpOu-00000000aCr-3C1O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Dec 2025 17:45:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766684723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zz1xVTvh572lJX2qZqJOG7cy24vvTwbo6dUFp/NuXtg=;
	b=VY6NAAf0q/V/vUYJIC5kol8YLY88GC++XwTZ3bgkF7yMkquo3gTlQAq3kkMOoyVYu0J5tV
	0tLS1H+u2wQoow3Hx2xDIVXyxdULfT36WFfhQYYb8ZMhAqgu37n2azkUgtWwJamhkuSr++
	iT17OY3ss8JFWoCc2mqoTg3uZQHL04Q=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-41Sfd9i6P2e7P46W81vCWQ-1; Thu, 25 Dec 2025 12:45:19 -0500
X-MC-Unique: 41Sfd9i6P2e7P46W81vCWQ-1
X-Mimecast-MFC-AGG-ID: 41Sfd9i6P2e7P46W81vCWQ_1766684719
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b24383b680so2248935685a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Dec 2025 09:45:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766684719; x=1767289519;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zz1xVTvh572lJX2qZqJOG7cy24vvTwbo6dUFp/NuXtg=;
        b=joZWgCHBXwKeSHblxSH+Lv2+8JUFjCpmqUixD7xybzuFUTggXzLMFt77M9ZNga6vrL
         1fWwCpXlZgD9SI5oIAAkgYKmJzIGrcfCJ6e1tyOTFbeNkGXmUfqMU101BGnfJysR18+J
         kPXElhsZr8u0GtZEW5x8lZsmHBVYSloImBTYfWYtJj0aZ0o417lSDf+emq15/w2CzDhK
         jOrXIgT7MT6rpkkdeZ5rlGYeWVhZD6Af+d9EzqvrHq5gIIZLjMgF2ySFsSIl9jADtMg5
         mNnpNzB9muZHcCYHaRCapjIDlVeOJgHOV4Aj00aMlau5nMZar9fP5Wp9GB9+ZFIKqlaM
         I7ag==
X-Forwarded-Encrypted: i=1; AJvYcCXwKQSOKNYu5jQra/LpdzxQwcywVgngsHG8qXrPSOWnarhSujdLs8IE+mb+7DSoEaYP65K6y382GtXLAN01ohKq@lists.infradead.org
X-Gm-Message-State: AOJu0YxuwOc69X13j5x3DpeohI8C2skoM9aFi941yHSw8gQcwuwHsCoV
	Ow5QuJlBQS+UwLFcYnw4NyIg3Yv6uP6QR4U8lCr1XU2Ma44f8HM8/uAB3SkjT6dKq60PyvJHSco
	RnDhj+4zXyLMQy9zRdmjcxXUjgzR4KQJ1Rn1WkkAj/5H3dXf0+GIMrwqGmMnVwp3q6VMMCO8086
	Sw
X-Gm-Gg: AY/fxX6JW3PaEd5UYaoPi0zHQhTw7cshp5ynQ2CmrhILIdHNl5feqpKyzCoIBN3edNX
	Be68o4eV7yhSTzeN9JLH89uOYjQQs/wEVT90fnJmr0JId+Ga4McUdLdX4oDKiKGJw9wPZ4FIktJ
	sIH1Owjco0Bq9HeqltnCi1hSE7Kd/6ZpvYfrfhpmyNmTDc67u8bjezq9F3JNh/Ab1AgUmB+0+ZT
	1OSidWTsUFo8JOH4/Qs1aFiOVZ9s4/zhWbF4uhQChiyu38UZtPosnl5G1fZKB8LNaedxSdVmJex
	H5L4TsViDjnnNRLhvvdLM7JQlIV1ZMj1zNmIHfbJRh4IVPjWnIiuv/21BnfmzwTM73UVoOGbj7y
	FBuwOW4A1/w5FA69fu67TekILDTq8T1qa8PUl6LRTP1d2
X-Received: by 2002:a05:620a:f13:b0:8b2:ef2d:f74b with SMTP id af79cd13be357-8c08f66bf3emr3080550885a.29.1766684719220;
        Thu, 25 Dec 2025 09:45:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/E6LsKwvfEMHC7uT4rrxVGLTNsXyb1jefziEMNS9y7ioMFDWn6jnZ3Lk+Vmjy/3v1Ei+vnA==
X-Received: by 2002:a05:620a:f13:b0:8b2:ef2d:f74b with SMTP id af79cd13be357-8c08f66bf3emr3080548585a.29.1766684718918;
        Thu, 25 Dec 2025 09:45:18 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7dbdcsm151955716d6.43.2025.12.25.09.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 09:45:18 -0800 (PST)
Date: Thu, 25 Dec 2025 12:45:16 -0500
From: Brian Masney <bmasney@redhat.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v16 2/3] MAINTAINERS: Add entry for ASPEED clock drivers.
Message-ID: <aU14LCCn_Cnd8tV6@redhat.com>
References: <20251224-upstream_clk-v16-0-8c1318f56c3c@aspeedtech.com>
 <20251224-upstream_clk-v16-2-8c1318f56c3c@aspeedtech.com>
MIME-Version: 1.0
In-Reply-To: <20251224-upstream_clk-v16-2-8c1318f56c3c@aspeedtech.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TJS9LXQV1zxgYC5Mg8L2kO2VHOsh3mq7wp4rhnL2rwg_1766684719
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_094524_875650_ECF99026 
X-CRM114-Status: UNSURE (   9.14  )
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

On Wed, Dec 24, 2025 at 01:37:23PM +0800, Ryan Chen wrote:
> Add support entry for ASPEED clock drivers.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


