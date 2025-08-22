Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2753CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3leSXfueIJ7OjI6bMt9yYc6dreSLbCTLjK5B3khIUcw=; b=EfJYmPMlr5QWNql2NEy/kmCBiU
	yYqZawCdiHwR8C/3RRsifhaEWvKHB3X8GMQSDVH2J+1oUMw9x+70fxM0DrhfgdprRQFMt7JQNuUNp
	yeN1ZJG1hxOPdcjdLvxD2MBGfA/MHYryxLCeU3TZmKOOobWB48VzdjBsfBwZJP6dMywSRDMXeSxVb
	fQ5o28VIOeSIMu1yWsXbZGe1sq2mAujsNlfO2E1VWwr0XN2N/PscD035NjXQw2XeXVf9S2/y0pB55
	6ZoYntbE1aEl8bxBzMTjfy9X8T40TUBzYH6PV5DW1CFLkpQ9zw90GFpfQNPGbSu5Esmhvkpeca+Z2
	55oWOsGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphpW-000000044F2-0tXv;
	Sat, 23 Aug 2025 06:34:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRhY-00000002bm0-14xP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:21:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755868863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3leSXfueIJ7OjI6bMt9yYc6dreSLbCTLjK5B3khIUcw=;
	b=H18RpsYJn1LA1gJXbAk/qgd48gh8djZeC2OdHyTsBRA4TNIX0zjIYmi3YTHBxXNlWveGwJ
	BZ4Vs97PKl0DSxiJr6tfZHNjP1WIYzARu9tHSCKIQ+5nIZwA0VqP62hH8iuSvI6nZ2coQV
	wlH7aXhR74HDHt1swqH+2t6wHFGTnyM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-HQ0pBYwLNjGukE5BsJzEOA-1; Fri, 22 Aug 2025 09:21:01 -0400
X-MC-Unique: HQ0pBYwLNjGukE5BsJzEOA-1
X-Mimecast-MFC-AGG-ID: HQ0pBYwLNjGukE5BsJzEOA_1755868858
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e870662c1dso544128485a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 06:20:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755868857; x=1756473657;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3leSXfueIJ7OjI6bMt9yYc6dreSLbCTLjK5B3khIUcw=;
        b=fpNpkXZ+65Zp/CpMmogkrTnYPKojwTfyXWkQh4iLFQ1cTxSMVYR8yxbq1yye3+AKae
         59Q6dKcVDIlxuBV1+rfvbeCBr05I+jT1mIPehu2YgQW0lM2wBWTztMYKlARfXD21Ak2A
         EVoLObXFA4dlXw+pxrsigR7O1YAO6NgW3lfMJ+QyUBpMTOl1h+ZO1n86kD1455wkxTlz
         6ZQxV6viXcbmoo86AkQMh8KUuNX52PAnx1i68VEW/+nYfvCiVyZhGh43/B5HiAuMeiep
         83qHJGVqwRP6PO/Dd8uO6Sdi/2CkT8sFFSUGwT1ClwN1tce2FuLO+yHJ8H90I0Lmmj/L
         L4zQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzfeAQuodsVhetXMWryQk39mfd3k5hznPhEXXwpd1sPy4/nBJ6JD7mDvZpXzO0t6OOikY2U0AwiqiQVKqtWY7u@lists.infradead.org
X-Gm-Message-State: AOJu0YxIMQ5+4YUztmKVjV0qgddqOWE+/BNVPi8rt1cDl38sctAZVQol
	LTySHtnj8im8m0KKfZTs5y0oEECp9lwnjRWxkBvzBjb2dzLs4GVvT6JEVFfMSBdnXof70Z+wgL+
	2X2Ydzmk+HzZFBt3BkIiENkaESZyhDXhlVi4qZ5I2daLeGMv+79fGgPJb8Fi+NmkEH2gKTKLJyA
	vsT742C+yo0n8=
X-Gm-Gg: ASbGncs0/qFV2jqBgMitE1MLxeQ9om5blqz8J1XCEAwn1qijKHbY1+T1EgchDBFtDH8
	TQk8MITUCrizxZacxvjDBlS2/z1mlzO0ku1dqfLP7WQJ9z0wdWxyl7rdTTSInq4yl7qgCDPAGDM
	Ur1i8QLGl5l036z57zrOyGMIoBRIQ5AJMo75aQVEo1aG57ek3Guyc7PJhYbHNEZ/F7p3aGjbnQ5
	AW9J+4aOqdqSJwLfl0tp409iBS/7MTc5Vma7qMlXABRlQh1GT0r8zrpPfFjTARvlXkdmqRJ71N2
	l1HqIFgYZeKdBCG5wejyvFIaBW1I5VQ2LZTHiPu7CdGMF6dZ7evnRvI42VOgOTY1BaqTuDiXBnl
	72wNjx6q9C4Gx+uz1aOY=
X-Received: by 2002:a05:620a:4723:b0:7d4:3bcc:85bf with SMTP id af79cd13be357-7ea10f96d7bmr350319485a.12.1755868856638;
        Fri, 22 Aug 2025 06:20:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJT6pAPKYEy5K11CQ9yMu+8+XejnwBM/iicip7wZSgoCGQVpWGHpC8P6vRS4lRcd6AamSOvw==
X-Received: by 2002:a05:620a:4723:b0:7d4:3bcc:85bf with SMTP id af79cd13be357-7ea10f96d7bmr350315285a.12.1755868856078;
        Fri, 22 Aug 2025 06:20:56 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e87e19211asm1338828085a.51.2025.08.22.06.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:20:55 -0700 (PDT)
Date: Fri, 22 Aug 2025 09:20:53 -0400
From: Brian Masney <bmasney@redhat.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] clk: Use hashtable for global clk lookups
Message-ID: <aKhutc0IVWun83qF@x1>
References: <20250814035317.4112336-1-wenst@chromium.org>
 <20250814035317.4112336-2-wenst@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20250814035317.4112336-2-wenst@chromium.org>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5n0MwzofLhnbajzhrrOEn_S5zYWjPuWbJXk3P4CztPk_1755868858
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_062104_364799_CCE4AD26 
X-CRM114-Status: GOOD (  20.39  )
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

On Thu, Aug 14, 2025 at 11:53:16AM +0800, Chen-Yu Tsai wrote:
> A clk lookup using clk_core_lookup() is currently somewhat expensive
> since it has to walk the whole clk tree to find a match. This is
> extremely bad in the clk_core_init() function where it is used to look
> for clk name conflicts, which is always the worst case of walking the
> whole tree. Moreover, the number of clks checked increases as more
> clks are registered, causing each subsequent clk registration becoming
> slower.
> 
> Add a hashtable for doing clk lookups to replace the tree walk method.
> On arm64 this increases kernel memory usage by 4 KB for the hashtable,
> and 16 bytes (2 pointers) for |struct hlist_node| in each clk. On a
> platform with around 800 clks, this reduces the time spent in
> clk_core_lookup() significantly:
> 
>           |      PID 0      |     kworker     |
>           | before |  after | before |  after |
>     -------------------------------------------
>     avg   | 203 us | 2.7 us | 123 us | 1.5 us |
>     -------------------------------------------
>     min   | 4.7 us | 2.3 us | 102 us | 0.9 us |
>     -------------------------------------------
>     max   | 867 us | 4.8 us | 237 us | 3.5 us |
>     -------------------------------------------
>     culm  | 109 ms | 1.5 ms |  21 ms | 0.3 ms |
> 
> This in turn reduces the time spent in clk_hw_register(), and
> ultimately, boot time. On a different system with close to 700 clks,
> This reduces boot time by around 110 ms. While this doesn't seem like
> a lot, this helps in cases where minimizing boot time is important.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Brian Masney <bmasney@redhat.com>
Tested-by: Brian Masney <bmasney@redhat.com>

I tested this on my Thinkpad x13s laptop, and clk_core_lookup() is
called 684 times on normal boot up of my system. Only 4 of those are
duplicate lookups.

Brian


