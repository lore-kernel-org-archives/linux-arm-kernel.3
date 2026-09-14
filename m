Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D1D1C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 03:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MApwC22geSnVp0e4CwnqSMWQccKDcu2A0qes2ViRrYY=; b=ds0fJadjxesO+5t/QGaT2vJU8D
	6r5fQOPGvaVbOkGZsaNNKBg+P8UN+G1TG3hywK7Cr/CmECDoBmsVb7V2Llypejked7Tc23YF7NbU/
	etA0LMleZeILjwAIeUiqKVXlrmtkJ9/XCjNA1EZL4p/4tU5Qb5Hqz40L/k8rXTBQBt+XqG2onSYv5
	7CTecjq1jjVJmIFGTUFkqBGKSzBNLHyhYVqIyWmgEejZNj4/k07dp0Pm868Qhr9PPL6cb6cX2JQQJ
	GLW5ujjsb83LzhXrz6tgzpZOv5h/onUvKM48yYmJrRiJlEQpai+aIQ0p2yo6e5lUd6MgHXqhQnoeh
	dGKAnceA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5xHY-00000002GV6-1h6d;
	Mon, 14 Sep 2026 03:23:00 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5xHT-00000002GUT-3zZ6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 03:22:57 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-8558c0b26a8so1977675b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 20:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789356175; x=1789960975; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MApwC22geSnVp0e4CwnqSMWQccKDcu2A0qes2ViRrYY=;
        b=Av4EO4wBwDzAg6D/UdbAelb1JxmTRUgYxL+ok0pxBrqiR/YDREbVSXLpKKOo/a2gjg
         sFPJgI9vmgi+S+7wvCGRH/Bant0xkWly08JXM2AdKQQXnXfHrlxTtMqiRwtreUZLtZZv
         G8mf18K6gHKF1jVY0iupbApVLJ4pKP9xQXIx4e7EvYv1ccydyhQWDFB7aEGO0T6ruYI3
         BQDFuuZfc5+K+Mc5t2gjBd6KrYWYth2gEvqz937Z082SCTsgiB8aatP8uUcHpAesCt1M
         HHl+iIukIdeutEJ4Phs9CrP/1BTsbkXWgI3MGPfRfF+VWsXBLr0QuKz+Il69eBV75rPc
         +DIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789356175; x=1789960975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MApwC22geSnVp0e4CwnqSMWQccKDcu2A0qes2ViRrYY=;
        b=qUBRZGJmXl1SkqPjSiVG7QWtbEwv2trxwR9ql48X3wJ7YxkkET34bQz/H/yCrxkOtA
         uKvicpGEG4FSJl58S6MuTNFsJHTZgXPPjtMpOn0cqGhDN0KB0Mg9FYaAGiuxMTYvXICc
         +s2qQSeTMWA3Z7hme12LKbzMB2tFXaGx+KksEM0ipRjhKlEumKfIfN1swkuhiQ2QhWR4
         LYzTiTCzSVvJd9aIlF4V21NvlpO6VbdF7OhyU3VtpWRnUar4feNcQdG86+8Onc8oZahv
         3zT1TMpEdNlzSMiHO2KvQr/wvigxzzr+p3SVxknjDrXIgL3xQKmQ+ITYstTJlXN3C9jo
         53ew==
X-Forwarded-Encrypted: i=1; AKwUvBwWkZkHtbnyqVw4bY/otcwdKea1ZPZT39Qs/zYse3jb3TZZQwkAF7hdPMbR0iOIDR6jXXGeMNgru7tAoANZ9YnU@lists.infradead.org
X-Gm-Message-State: AFuF++k367fPIqP71mX1hYo9gVL7rYFJTAns8+FbxM4bU18umgsOXThp
	yjxCs/RB6lf+dwothXrFZUNlPRdQTfBpZsLKDTDDiJu7HGrhFBPlszEW
X-Gm-Gg: AYBFou1ZPAv9Cbq/JWaHxrPCnUjNBl9e4UG4kUg2E0W1WNOWQVF7FkD1R6q+ZnM+4Zr
	xoglH6HDWlQ716lUMMR2vcLqB5nJZbOSt7uPaqoGdKzZy57FnQe7Q68VNjZXAa6WpRJp812ZoXY
	XkJIKEpLnfE7tVU09xM1eb55dGFnjBoM+neofekRUzHDeuXpi4/NYJjjd+mnubmUEFIp8Mog4Xp
	6aSjoeKyjVsjksvCgqWYgnzu8pc9SQeY+xUYC75UUP3BK+XM1MwpsUjWFub3Lh9bdQLFuroGnKp
	Jqc/OLDBWUtgCQ0LxGzJ0Rjauw4HlfpJxljEZ6+/WkUEiw3bJb8ibqGu3F1DHk4+I/Why1O1Pi3
	vZAyawmckek2HL54YcyK+tH33GM/iCgzZKnmLjhX2FPK8pwBj82rsEiAvhECgyM7eEhpRm1jz3H
	xbCagKtqscjkyehM7OtZLyzliiYcS9cu8FRjga6s4JOjqH0Snqbi6eIKn9jGDmAU3i9OUABldbN
	AagNQHiYwMGYwbYfnwRLsJs8ZA7eoIbiRt7B96BgiF87brAEVyKhQo6/Im99WfD3mfHqXhJ5w==
X-Received: by 2002:a05:6a00:950b:b0:869:8620:26d2 with SMTP id d2e1a72fcca58-86f82f51c34mr1825446b3a.1.1789356174723;
        Sun, 13 Sep 2026 20:22:54 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b286c3f3csm4014523b3a.16.2026.09.13.20.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:22:54 -0700 (PDT)
From: a0987203069@gmail.com
To: linux-clk@vger.kernel.org
Cc: rosenp@gmail.com,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] clk: nuvoton: ma35d1-divider: simplify allocation
Date: Mon, 14 Sep 2026 11:22:48 +0800
Message-ID: <20260914032248.387264-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260912002326.237419-1-rosenp@gmail.com>
References: <20260912002326.237419-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_202255_995623_3C00148A 
X-CRM114-Status: GOOD (  11.97  )
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

Hi Rosen,

On Fri, Sep 11, 2026 at 05:23:26PM -0700, Rosen Penev wrote:
> Use a flexible array member instead of kcalloc + pointer that is not
> actually const.
>
> Simplifies allocation slightly.

Thanks for the patch, and sorry for the slow reply.

We're already working on a different fix for this driver internally:
the ADC divider register actually implements a simple closed-form
relationship (rate = parent_rate / (2 * (N + 1))), so building and
scanning a clk_div_table with up to 2^width entries via the generic
divider_recalc_rate()/divider_determine_rate()/divider_get_val()
helpers is unnecessary overhead in the first place -- we're replacing
the table entirely with direct arithmetic in recalc_rate()/
determine_rate()/set_rate() instead of just changing how it's
allocated.

Since our patch removes the table (and the unrelated mask_bit
mechanism, which has an out-of-range shift bug at its only call site)
rather than reshaping it, we won't be adopting this patch, but we do
appreciate you catching the allocation issue. We'll post our fix
shortly for review.

Thanks again,
Joey

