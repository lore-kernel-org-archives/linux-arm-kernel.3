Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D51EFC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 19:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LhCePzwoaQC11f7PZvC4LXoD1/F7d5+3LH+i3bZkptQ=; b=wKsFjdhCaHbgowjXm2rA+J1hEp
	BFRpuX0yZKHy7/6mRecBUHzv0ZTNg28vss2sWYDeIau7DCAN87Qhqrp/SXEdomDXZ5wFAgPskJK5g
	c8Lz+Jbhkwbmz/RU9D6KF9yttJ2j8nyFodbqL5WdJopY5NON24PSsHYdvF6RbuxEXL733aPK/UZ0C
	8lL17Hp4h3ziSWrR05THiF4zn80V/obvd0Zka2qD1Yxbw+mnZElqJZ5zDYUifA6nXHir9DxEDsYsY
	5DldYOWVraLt3CS2my1qUrxILZj0xf2DxkXjttBN0nQIk+i9hA57AlK2f0tj29PMcoJkygh2k6ad4
	zkbpCYGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wltFd-00000007hxW-2EU3;
	Mon, 20 Jul 2026 19:02:05 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wltFa-00000007hx6-0Sky
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 19:02:04 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4954aff6088so21339375e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 12:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784574120; x=1785178920; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LhCePzwoaQC11f7PZvC4LXoD1/F7d5+3LH+i3bZkptQ=;
        b=KlCpdE6f06AQbnr/Euk4bNH2RogCTb0FzWTKe4ZKbTTPXT5SPt5yqLXcz2DaooxB4V
         6MMvGljHvnqUYhorJCLUTOhMDBu4XlcSCsTYQ9Upo9ftuwR7adcdzdP88mP+sbVangoj
         NJV5kCzIccKD8V0T2nXX0PDkHenJEr4LXAogrC3NrSaV2R9EmeG3VymbYRIQqmQBDiwq
         yQMmGLFCGhD2Bp/PaNSY5Ors/aom5k5Iin9gVCduaEBuD60ibGZYFEnp5NQJp46v+07E
         cvEMmwax20yQcGitFagmFOCzZGUtQuM+bDiTqCXFxJBfErQgp2TuD3snr5K4sAgdp1ki
         PYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784574120; x=1785178920;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LhCePzwoaQC11f7PZvC4LXoD1/F7d5+3LH+i3bZkptQ=;
        b=iIM3vb2CXvcChE8WBlV/Lv72bhKiBHbVRmDI4QDBykD58UPbkcsTi8dqWWJg91tSZq
         tQxAWX4mhcbC67MZPsACXyjPwZuYyAZV/l9MboiZTipg+VCOPmbEZ2gTCHpb+LnPpSOh
         dtAN2rWlBw0t7d/UUrFevy/WJHVCfc47ZjC959te6bxjtCGUSZkAXphU2fL+EvAcClAh
         iqg2RS0e9Oo+THG1PEq4QSrFoNwvZq4T7BqfK9D7afT94l1h6Q8/XwwYtIt/4EAb3yuW
         oI6+naRTYlZpBe+jiOyW13yce/oRuhwbkBZJqL0BGfOAWDTFdrCifAkNiaDsZ6bVDgqh
         m5/A==
X-Forwarded-Encrypted: i=1; AHgh+RrR45nEU9sL8DUX3wlFnjMKvLqBkhlYV3/hFimkBFn1zCsRiQTXUXYSB6AJTiadsszfhO9bACUrNn4YGCM4F7Ct@lists.infradead.org
X-Gm-Message-State: AOJu0YyggcchyFkRFeOSXM71jFjzU4Jfqt0sywJeZ6Oa7B87SglkLUWg
	dpIPoz/dJwcPgS1MSlIuhmN623IjzkyRsxnqS6LYNXK0KAa/sAP2FaY2lzICfmFkbA==
X-Gm-Gg: AfdE7cmLkfq04zh3LjXYDlKLYUPkxYkpbDRX27nDN1vrRwvvcpwNthLjll/DCnm4Dz4
	9ohLt7fxcaVKzwAUGAZ4RfJHsFsDTHw6E0U0fG8UH6kvpDM1sAVAr9hC9e2H1xu/qsPi5Q+TLad
	O1xLlitsF+/qdzmaS82LnVgWHefBJ50Rjrx7j+yn0hdvr89Yrw/iewOMkGJ3CRn41GCBgrELxe0
	skKs9SO+Qa7ysUDizlhYy5K/3VtJR0XUIgI4ccZsvdQuO4mgXmjZ2102uZbOdbPkjj4uhnoHbhk
	nwiCyv4NfUZGbSf5aplRTM1nYnf0fQ2DTIWPj+AVjIPDBU5NSb+ZTAVnVaFnRR4zjJMksWGrZ05
	QhmChrFKRJc90n309byTcP+Om0P89WTVNh3hqvIc0P37a3OuW7McNZmyEKOGIJvYyjMmpkA3rAH
	wUoWGh+1YqNsT4DbQSidF60+HSx+iyq3Pml9ZxG7WdERiaX9HlC7g=
X-Received: by 2002:a05:600c:3b10:b0:495:4aff:5fce with SMTP id 5b1f17b1804b1-4954aff609amr169923055e9.32.1784574119583;
        Mon, 20 Jul 2026 12:01:59 -0700 (PDT)
Received: from google.com (137.69.77.34.bc.googleusercontent.com. [34.77.69.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63eeb360sm33723752f8f.34.2026.07.20.12.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 12:01:59 -0700 (PDT)
Date: Mon, 20 Jul 2026 20:01:55 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oupton@kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, will@kernel.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	linux-kernel@vger.kernel.org, tabba@google.com
Subject: Re: [PATCH] KVM: arm64: Stop the hyp trace clock worker on disable
Message-ID: <al5wo9x7oUGzlbTo@google.com>
References: <20260720184850.1826630-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720184850.1826630-1-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_120202_192996_770237E2 
X-CRM114-Status: GOOD (  16.88  )
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

On Mon, Jul 20, 2026 at 07:48:50PM +0100, Fuad Tabba wrote:
> When disabling, hyp_trace_clock_enable() cancels the clock work but then
> falls through into the enable path, which re-schedules it and marks the
> clock running again, so the worker never stops. Return once the work is
> cancelled.
> 
> Fixes: b22888917fa41 ("KVM: arm64: Sync boot clock with the nVHE/pKVM hyp")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/20260720172923.E4F161F000E9@smtp.kernel.org/
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Done here already https://lore.kernel.org/all/alczBmnItMwq8xj4@google.com/

> ---
>  arch/arm64/kvm/hyp_trace.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
> index 2411b4c32932c..27367843fd211 100644
> --- a/arch/arm64/kvm/hyp_trace.c
> +++ b/arch/arm64/kvm/hyp_trace.c
> @@ -116,6 +116,7 @@ static void hyp_trace_clock_enable(struct hyp_trace_clock *hyp_clock, bool enabl
>  	if (!enable) {
>  		cancel_delayed_work_sync(&hyp_clock->work);
>  		hyp_clock->running = false;
> +		return;
>  	}
>  
>  	ktime_get_snapshot_id(CLOCK_BOOTTIME, &snap);
> 
> base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
> -- 
> 2.39.5
> 

