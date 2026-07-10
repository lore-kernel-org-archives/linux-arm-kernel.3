Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A204C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 08:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QFJFUa9U+Wd4dV3ECgKJBk7rTN00h+APx5LP51q3LSk=; b=hqq9B1fe4SKi2I+0mmyK6KhePW
	wg92JFf5bIQhAviVDidfbtGvnxnMFHwgexN0+VGICMdL6vfrvmGn7gGz3USC4jc+2hcAHkqiGOUWZ
	JEBRdaCdDmjnZqv5ubsuMZVciG5VDs1q+zOOe2bfLELGFdrDEd8Yqbx7CugNaL+h3LrCwoYvOHCwL
	dmN9NfYTpDtkFO7b4IZNYNZq1J7meTBlCzIPuelP5aI3NMVOMrGbB1cVdGcyKgQG0t3m71GN6bh1h
	Wiuzavmm7An7hpX9DHS3sy3Ae29464WWN3UkImMCaXo3FGItaMfiD36esNSvrSyLx4rOWSximmFP9
	rNtxMO2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi74r-00000004Vvl-2Y8A;
	Fri, 10 Jul 2026 08:59:21 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi74o-00000004Vub-2asO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 08:59:19 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4759b4f0897so415865f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 01:59:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783673957; cv=none;
        d=google.com; s=arc-20260327;
        b=V0kT3oclpHNT1WNZTV+L8aeTuQr3pbsFhonxXCoUnI5JWkdhO2qzH3EIt5/OVXFRL3
         JndeT1vxqec+VxBPxsIzzZG7+wxQpCjkfYACpJ3835PGKP+8cOFpJnQNkQfFezcgaIMM
         IuulQ38RdPnvzPm3MLBEur7qZIqehWOoCesFNWGYrAw5B0PftCn/99c54+dv8luqhUgE
         YgVtsUhE7xAMg5Yv5d71zkwn0n6SmCrnMbe7tKiNN2sBzl9lfv9xbxa/sKCrncFYQ11q
         5cZjzdeStSm9lMqb3sfPL/rGhLn67GR676QZ4/BNC9xlDrL/2lYmV/8ykYgnOqnU4ESX
         +LVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QFJFUa9U+Wd4dV3ECgKJBk7rTN00h+APx5LP51q3LSk=;
        fh=YFgHT4n9PJCFDuUL8OczPeNrCFP5llxHYHKNK9Ye0eA=;
        b=aGoExGv7Ib6aIW/YJj7oHgL94MfEKkux6dwyzxN3iYh73fvzGioJxd5FDTX0t4OCZH
         pOcjeoBrlmQZcpSkXv7ftdrAi7nFOqTjUDkhNrZzaVn0wKj4HCtTsu5LH3BNEovIEjhI
         h4NDIVf1/kFwDfXR2PxlbGBT5YFsX2oZIUR0qdMIFzNGUJc1KfI/i2lYlzXNXXHD5mdq
         BSLIj6qQsrTLiCwryHsTwXUTkgj1qYYqPoJHGlH5RZ6wcgpE5239+vxA/rOBv4RWnBxA
         y2EV7wkZQ73kz5UD2H9iJnCJ7p3kcwddlWzhbvgulAKJ5BaP1MlI+vdQcxfbKQmCZhPG
         O1Aw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783673957; x=1784278757; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QFJFUa9U+Wd4dV3ECgKJBk7rTN00h+APx5LP51q3LSk=;
        b=HIPKFL6SQK7xgCHZJHNX1ZEbs9Av3bWAFUbRcPJzcAqRWpxtD1QYJx6m9pvb22IKMw
         Ya4dRQVLc2B4uj1bVrhqHDmY52kbTbPd3RhedH2ro5JaaHoGy1ieh3Gab8vLNrGXCb4S
         W1Wkic1J3weZhIqB1YWsMNJL+4kVjng/o+3SgdnDudDoE7bYKB86nv6uCZ0Ef3ZgFH2G
         zfm7NfF0ezRIUROI+gi+r2BQMXDfJpG8LmtayysofKkM6ABFYFv9czoudBHxRcXzbAqn
         wqd36OqInTuo5Q7+YF+6hUnBh+6mJHOFCdloPO5/SEVsFnS6ShezLUyXIhYEtzVdJhmz
         pl4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783673957; x=1784278757;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QFJFUa9U+Wd4dV3ECgKJBk7rTN00h+APx5LP51q3LSk=;
        b=IACjtVW3a26PwAFfv+TNwE1ZtAnrNT16v7UBFdF9lW3pzE2QCmds8CSdSJjy81vAku
         wSHM/VjfermKibL5kXvUlHCN7f8YF8kE6B18jNwMnb5BtyVcYZIhT1OJh32TjtT4Bqkq
         ySly+i3w68BCB6/X5nuOjmNQFxdK9pXeLNZQvbz48MhEIQzWyBfh8mXp/HUa0HR/t1er
         zN7nwEjyXyUVKRYNaCR4d15FWaPwgOKgzHCPtzhj08KY9RVIE0GDN4NKuJQfiiHvHSl+
         ixui6BPdCJkr7ASd65bYHTlKxheYEUJ6HWxyujtAxesBRrPBocYgyp/5LjlS5zG/rDQK
         1rRQ==
X-Forwarded-Encrypted: i=1; AHgh+RpEAs032Ou9B2z93VA+xjHqWGhCbKmKGpllYi+ce4h6jr1rUsAlUoAtKKjfj9CLBk+YagNMtNMiA9/EN6lgQKu1@lists.infradead.org
X-Gm-Message-State: AOJu0YxAEDe6se7OCAKcEJlA93hnQAKi2FHVlNlGcdd0BrXtQ4czNYCd
	ImSiEa/n9bZu9wqzeXjHyCZAz5bd7cZHNZ24e7oIi7qa1vJbpN0imHd64lDP5WBepz44V/YAg8c
	Grg0w4a8xjpnx+AW9uhDiUhvrBfjLhWY=
X-Gm-Gg: AfdE7cmeXjAfC48zkzzyiOZMdLiyENdJjcZkHW50qFmYQtoHkL/rEsqn3QkO9sN9u+L
	RPLLllcsBCcL0F6wfGYaLR5PumivEZuVncWM8Z5yjs5uEDXy5B0+HGtd8lF8p0Sv2/F3DTU0Fez
	L5SBItV9GljboDIf19483s6ceEqXhqf1kPmt3N8oTtbGATH3BhtL6YVmi26TL85+Gxhzn+1DRpK
	VHeChCmgjW0n+WvvEIOz2MmADyUAUkTY6JKP0tz/yDlHLNYhPATNteKHKq140jhLzHmBISnnA==
X-Received: by 2002:a05:6000:2f81:b0:475:f0f0:9ed0 with SMTP id
 ffacd0b85a97d-47df081bb63mr11414238f8f.59.1783673956505; Fri, 10 Jul 2026
 01:59:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260709073823.6643-1-jiangwen6@xiaomi.com> <20260709160805.26e63bae89dd03cf2951104e@linux-foundation.org>
 <CAHKocdH5kp5kTtZht+v5j-4-Thh40TGvif3=kRMgErRXr+Q+RQ@mail.gmail.com>
In-Reply-To: <CAHKocdH5kp5kTtZht+v5j-4-Thh40TGvif3=kRMgErRXr+Q+RQ@mail.gmail.com>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Fri, 10 Jul 2026 16:59:05 +0800
X-Gm-Features: AUfX_mzXEAbv_zvZQyMV8FF6rcSN6wSGVwLZkYaAWCZNboEUdl5KwDesvzC9cg8
Message-ID: <CAHKocdFs0XAqWbjz2phTZDwHkx3Tt4QgbkjXA95GK_o3-RQwog@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] mm/vmalloc: Speed up ioremap, vmalloc and vmap
 with contiguous memory
To: Andrew Morton <akpm@linux-foundation.org>
Cc: catalin.marinas@arm.com, linux-mm@kvack.org, urezki@gmail.com, 
	will@kernel.org, Xueyuan.chen21@gmail.com, ajd@linux.ibm.com, 
	anshuman.khandual@arm.com, david@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rppt@kernel.org, ryan.roberts@arm.com, dev.jain@arm.com, 
	Wen Jiang <jiangwen6@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_015918_674355_CBF6C849 
X-CRM114-Status: UNSURE (   9.33  )
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

On Fri, 10 Jul 2026 at 16:54, Wen Jiang <jiangwenxiaomi@gmail.com> wrote:
>
> - Patch 6 (32-bit count << PAGE_SHIFT overflow): Pre-existing. This was
>     already discussed in the V3 thread, and a separate fix was proposed
>     there.
>

Small correction: I meant that I plan to send a separate fix after this
  series is merged.

> Thanks,
> Wen

