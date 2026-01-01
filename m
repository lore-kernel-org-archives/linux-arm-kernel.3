Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B55EE57CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 08:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=grqBbaE6YnOptD2H7gCSdhIM6A7QBPysLgSlWzZLLhY=; b=vDN4fkAq+pCc3nu8yWS3V4M3S7
	mf6O7qJaCLDlJQZwQTjqPZxMSmSc19xjh4d5sVWW+6hBF1pE1P7nOQrLYBi7uidJB46vj3hG/A1Sj
	ouEP01XeiYtj80F3QCPsAceHUZ7nMoAkUgPiW9TF9ZdgKv5LromMjJWXk3KT2JGKe4vTh6luThQCu
	2OLQ2FzdbKhLgC6YFooUV2qppfWs8wfrLrEJEJVmdEifCsPnkHq/exD9C9zJr6FvWChvmD+2JVXGt
	z5Lc/FaIhX4Mcx8U1dy+Ord9R+fNMFeOvySOcRLHCaDMTkX9p7uxfWAQf5aDUqqx+UWOiIgqE2H3P
	L4vl7Maw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbE1j-00000006hSv-1UMA;
	Thu, 01 Jan 2026 08:27:23 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbE1g-00000006hSW-493R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 08:27:22 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7e1651ae0d5so8771374b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Jan 2026 00:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767256040; x=1767860840; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=grqBbaE6YnOptD2H7gCSdhIM6A7QBPysLgSlWzZLLhY=;
        b=j8S6xfD6d7HZQV4ioh85jxV92vhXK50WsGgLU0xG06rl25NhWT+4BzqhVdffuMzHcq
         CrjjqWNf5cqF9Tb6y0sZQ2k4BGP/o5vGPvpchYG1aL5pHAHqpUjEz/Ia136lR7KZEoKG
         evs3lDFEV6TGm2PQ+tAnoIOL+yOPTfZ+yWhNmiQFldepxZJxW6/zj61ri5h6qEa12ymW
         bmWTGCfuZ9y/uQ5phrbbqbc7NSUygvMxZ35jSUniW+wrvnFL3xUlfXBao+unJyHZ46tm
         PeN0pF9CtQPiO8w425QDK7tqBb36y76c/LiUHxpAjP/58r+1UI88UZHaCmAiebfa5srt
         qpFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767256040; x=1767860840;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=grqBbaE6YnOptD2H7gCSdhIM6A7QBPysLgSlWzZLLhY=;
        b=J5r29gXLRKfQm/qXxgq76EyzpFQgPFQLxbJvfwP7uhiev7L4EgOx0kLt6pTho3J2oG
         kxW0dbp6yzIKk2/sZ8KjEhUb3PfmmGw/sbuBpEt3R38raTMcKl2fncTiOOKFez0Jw9D2
         Shw1vXZNhxCE4gCfSiIsT3BtDYLwpBCSfO3ub2VWtl7qIZNMM9czYTmcbXbdAJ18IDnd
         zbwWHCUUXpXZiRwHn1G+MB6Pdu24WGWs+3mZC3m7g8CD/r2XIIAo7RVYZCxqKbz9qx0M
         90tE05kyW1ahZGz2XPoec+xP6QzJjEEGdnz5hCLz1HGueHD/68DX0O8hZGD92bDAHp6Y
         GRHA==
X-Forwarded-Encrypted: i=1; AJvYcCW/127wSDNvv1pOLS8q2MWfzei+Cut16XEOdl1AYySs/ku95rPpd1DObRomlIOry1+jglYzFZp8sgx8Xda6K76e@lists.infradead.org
X-Gm-Message-State: AOJu0YyzJLcoaBSd0rN/JKu6i8S7O9xbv0sfHiX4l52/s0DPhmv/E1cW
	XGCyBICEfKTA3qfumCSuHy0ChLCNERlksRBAee0E4cBaIJPPIVFLybLQ
X-Gm-Gg: AY/fxX4PlUjDeni2eelvLYiqynh0Km2pUwwrLQR97FB9MVLmxrKYYVAesoCEMPzl2Kk
	rHXEj0oTpM7s1MN2lNgVQSzHXLW+VzM8WjBw4ESuHDek/zW/ItB+LdTbYuNizZbbuuiANdPeeEO
	8+1xKuUUOfhsTwLtrIjIRYykOCH5IBz3ryqhA0juURdps9zwwPI1Xy7IgjAjsVtMj4z8SNbXgQs
	9tHcxDLH6LUj1xBdUd+IXWXpwwhmV4LvjRKgFqzxHIIQCESYhb8tn/9NHQw3VxmqpL034OhIBAc
	TBYlMIxddEH/qLbJWxpbt/j+7nsRQ8LVWBRNabm3I0bXHyOfw6uzOmg8HeJRYwiJ+JGPumOIfbY
	6McB9RZqvNfJQ6SCAsVOEOLc/hMvVt7DPKSLL4kOqXD6wnoNLQYkanUqNpbFhAYqn60cY/2ZUbL
	sQEeCpyP0do6Na0u+S1bmMPT8=
X-Google-Smtp-Source: AGHT+IHhkA3a5smj1iEMSa2b7GI5Q9tU3FN8KidSwq7FxEo8bwOhmjGkB12B1a/5qh/4kK54JlHQYQ==
X-Received: by 2002:a05:6a21:32a7:b0:35f:68d:4314 with SMTP id adf61e73a8af0-376a7afae04mr34883862637.24.1767256039592;
        Thu, 01 Jan 2026 00:27:19 -0800 (PST)
Received: from google.com ([2402:7500:499:de94:df89:9172:9a1d:16f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7ca0baf3sm33118003a12.34.2026.01.01.00.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 00:27:18 -0800 (PST)
Date: Thu, 1 Jan 2026 16:27:13 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Lucas Wei <lucaswei@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	sjadavani@google.com, kernel test robot <lkp@intel.com>,
	stable@vger.kernel.org, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, visitorckw@google.com,
	marscheng@google.com
Subject: Re: [PATCH v2] arm64: errata: Workaround for SI L1 downstream
 coherency issue
Message-ID: <aVYv4bf8BVW8b-Sf@google.com>
References: <20251229033621.996546-1-lucaswei@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229033621.996546-1-lucaswei@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_002721_072066_E01792A5 
X-CRM114-Status: GOOD (  25.11  )
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

Hi Lucas,

On Mon, Dec 29, 2025 at 03:36:19AM +0000, Lucas Wei wrote:
> When software issues a Cache Maintenance Operation (CMO) targeting a
> dirty cache line, the CPU and DSU cluster may optimize the operation by
> combining the CopyBack Write and CMO into a single combined CopyBack
> Write plus CMO transaction presented to the interconnect (MCN).
> For these combined transactions, the MCN splits the operation into two
> separate transactions, one Write and one CMO, and then propagates the
> write and optionally the CMO to the downstream memory system or external
> Point of Serialization (PoS).
> However, the MCN may return an early CompCMO response to the DSU cluster
> before the corresponding Write and CMO transactions have completed at
> the external PoS or downstream memory. As a result, stale data may be
> observed by external observers that are directly connected to the
> external PoS or downstream memory.
> 
> This erratum affects any system topology in which the following
> conditions apply:
>  - The Point of Serialization (PoS) is located downstream of the
>    interconnect.
>  - A downstream observer accesses memory directly, bypassing the
>    interconnect.
> 
> Conditions:
> This erratum occurs only when all of the following conditions are met:
>  1. Software executes a data cache maintenance operation, specifically,
>     a clean or invalidate by virtual address (DC CVAC, DC CIVAC, or DC
>     IVAC), that hits on unique dirty data in the CPU or DSU cache. This
>     results in a combined CopyBack and CMO being issued to the
>     interconnect.
>  2. The interconnect splits the combined transaction into separate Write
>     and CMO transactions and returns an early completion response to the
>     CPU or DSU before the write has completed at the downstream memory
>     or PoS.
>  3. A downstream observer accesses the affected memory address after the
>     early completion response is issued but before the actual memory
>     write has completed. This allows the observer to read stale data
>     that has not yet been updated at the PoS or downstream memory.
> 
> The implementation of workaround put a second loop of CMOs at the same
> virtual address whose operation meet erratum conditions to wait until
> cache data be cleaned to PoC.. This way of implementation mitigates
> performance panalty compared to purly duplicate orignial CMO.
> 
> Reported-by: kernel test robot <lkp@intel.com>

I assume the Reported-by tag was added due to the sparse warning in v1?
Since this patch fixes a hardware erratum rather than an issue reported
by the robot, I don't think we need this tag here.

Generally, we don't add Reported-by for fixing robot warnings across
patch versions.

Regards,
Kuan-Wei

