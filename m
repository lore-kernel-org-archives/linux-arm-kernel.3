Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F60FD7075
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 10:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+cfs0t0LmSJY4mOioX92eiqEvpcsRdD7gJt43vu6FJI=; b=N/aww57Sq6UAYIT1CE7hmldT0P
	VWBb4jchw1vHHHrPf9xv39or5aRz0MUpxJ+kBudBZYU3ee8E6hdKvR1ccreNAgLT9pEcW7hvggTIY
	OXXhLMZacvyl4CcNjHet+RHofdZlEetSD+o78eBORuZNBEkvjnphYLo0iMecGsyAAwlADggYJmU3X
	hvBugoVJ9+NAuxgjStdYo3+D2A/bNXTaCpkpcK2Cit9fI8WmyY+kgKaDjOK9AgzseiZHQuLh1rvpy
	pnrmDsvqDb9R7xOkFmKKgb/BZVVt5sXigzlsHPQpld07RCSW9n3dqeGBMX9bSHqTz2uZh+dqzHzrH
	yrPFm9hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Rzj-0000000644b-241e;
	Tue, 17 Mar 2026 10:49:51 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Rzg-0000000643k-3xcs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 10:49:50 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-35b9ed7a329so1181274a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 03:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773744588; x=1774349388; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+cfs0t0LmSJY4mOioX92eiqEvpcsRdD7gJt43vu6FJI=;
        b=a1yJzpFYj+pucbZvRswT5h2CPrO7vjc1bMy1XAssJY5a3V9osjrEM7CeVzOqUg5xYk
         jvq8v3u1y/XcukV6SDr8zsNr2Mo9c3POMtVWEDtX3Xp9lQZbFpwXCmstm/cGuNEy2BCK
         vQGl4So7xjSBCQm+Y6qmldvaVmKTdseYqjpkZ1DQlyEpRgTkC4tAQW9Ybkqqqux/qRt2
         NTNqYRnpTP7ya8LqUTJHBdfi18LqF+SB1EBVSb32ZiVXhdcLSZmtrZwqYKBNApeHIzWz
         pep5+n+EFsya5OBLlteX+VCngflE/cRzi2JnvHfZyCLa1nFWFLjMTNI4Njb4tJxJFHEV
         LOuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773744588; x=1774349388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+cfs0t0LmSJY4mOioX92eiqEvpcsRdD7gJt43vu6FJI=;
        b=dxpy558xSOUbzr3ASu5jbvZWt1Ac9FgztjuBFxAG6sfXAnwCsm66N5KxQVeCMqJ49+
         UOoVh702rvs+t0X4IfNfJxOgr7SR4CplkO7LzxPjaECxDIFUsT2pS087irichOj86WMY
         kJ5P6DqXUsmSnyOruqbY8gEYeRJ641MbkIfxZedMcpNghALI90ZfApJDjLlp+4KMZAzn
         zcPBGU8Cp8MXqn/LW/suCZqQ1UpdHwiHOrtrnKqwntDySPD0UMb5UXkU8l5JS6Cxgt+p
         NXDMzz3seD8LO6x1+/bOUOr6s82m5n0vZ/YccToHvj6t1szg5iSvzo0h7BA15Ubo8zvR
         1t8g==
X-Forwarded-Encrypted: i=1; AJvYcCXXA9mxHB2RYgGCAK0aDoiOdmYd3GF+4NO5vMkBlMTQQf2V+/LIVeNdGdxbXL/sTDZatYavog9DCaxY/vGz6CPV@lists.infradead.org
X-Gm-Message-State: AOJu0YyNE6n/DSdFtGivNrsIDXZeKXpsZezqgXqYn6L7fmhQtNcHfquE
	vmpGhjoyGXfN8BzXcZuxb9xUu0XShYoruGwezvyvZCYq7iiJs1Z84q3n
X-Gm-Gg: ATEYQzz4FymCw/tswoZe4GbwtJ3Zmo1mpVtRlDGnmIfk+JZxYOc97N3uw1K2J5I5VOs
	GbbLKtZSVusQypsUUbghSREoizqAtpsmGmrsSX1T5sF5/DfaaGMeZcypSjP429E5WfBhg0PmO8w
	Sng06CgEkD9QWKlbB7pTDxLtJGBS3GmYb8D/2pPEepS671Q5IlmPxVdR8jzGhTyQrSeRtj0W8JQ
	j+K94KoOYMb/EQb7JNQ46Z3ap6El3SHFc+lIkJrOhnwqgzAtPaKvWpm4Ub+fQPH6egLTJGbaJ9x
	YB09rMhleLqwIHu+6ZEsvqTIWcwes6Y2OnBeC3yg47PlAXgLn4JOvlGKcw9nf8F4S3s4LCMj874
	AFQzApWF3s/KCspr2uASlb4uhshKv2XkjezfAsk4rihd5mxjF0X8BkEinU5zYa60A1kv/Z6Vc8p
	HNnO2TRcjTEZlKlymW5ZF9Cg==
X-Received: by 2002:a17:90a:d408:b0:35b:a9f3:62ee with SMTP id 98e67ed59e1d1-35ba9f36aa5mr3331138a91.27.1773744587612;
        Tue, 17 Mar 2026 03:49:47 -0700 (PDT)
Received: from bsp.. ([2401:4900:54f0:3ab6:58b:9924:8921:710a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35badb90b8esm2529439a91.11.2026.03.17.03.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 03:49:46 -0700 (PDT)
From: Rahul Navale <rahulnavale04@gmail.com>
To: Folker Schwesinger <dev@folker-schwesinger.de>
Cc: Rahul Navale <rahul.navale@ifm.com>,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	michal.simek@amd.com,
	suraj.gupta2@amd.com,
	thomas.gessler@brueckmann-gmbh.de,
	radhey.shyam.pandey@amd.com,
	tomi.valkeinen@ideasonboard.com,
	rahulnavale04@gmail.com,
	marex@nabladev.com,
	marex@denx.de
Subject: Re: [RFC PATCH] dmaengine: xilinx_dma: Fix per-channel direction reporting via device_caps
Date: Tue, 17 Mar 2026 16:19:32 +0530
Message-ID: <20260317104933.4846-1-rahulnavale04@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
References: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_034949_019310_1A6215EB 
X-CRM114-Status: UNSURE (   9.70  )
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

From: Rahul Navale <rahul.navale@ifm.com>

Hi Folker,

>Just to double check, and to make sure the regression you're seeing is
>not a combination of any additional, yet unknown side-effects, could you
>perform one more test?
>In dmaengine_pcm_pointer() (the function we just patched), could you
>replace the call to snd_dmaengine_pcm_pointer() with
>snd_dmaengine_pcm_pointer_no_residue() while keeping 7e01511443c3 active
>and test if this fixes your issue or not?

I have performed the test (replace the call in dmaengine_pcm_pointer()
function of provided patch) while keeping 7e01511443c3 active.
I see issue is fixed audio is working with this.

Hi Marek,

>I came to the same conclusion, that the residue handling is broken in
>the xilinx DMA driver for cyclic transfers, and the fix is below, with
>two extra fixes in top:

I have tested the provided patches the audio is not fixed with this.


