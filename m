Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB2DC982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 07:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NpAQJEpAggqV1p2gBrvheK1e8z0DrJ7uAPNXG/lVgjc=; b=hfojGagz+mRl+MI+N4RvFa+tK7
	SiX5RSQN3eIKxD0riyxWtONPGFlbZQg/2tJak3ZQbUWnwtKEiQfhuoyIQfwW5yhyoFO8zB6hZcw/S
	UQVDibzPrbHice3GpS9EMAMHtBeFLSH4MB/CrUs9CqSV11NHjbG0LscgJE6eggFNhMBgTlhqIxfar
	d/3dneIz3orI2kccwP1tGViLpfrvsx/7HrmeJA0ZmDFS7Nuk+f1FaMLGGBxCyNqPaaTz2Eh4satDc
	5cC2e7xCg6jUS7U9hR9JvAN5hmi7wiyLc49IYMDslfklyQ0+Dpa8ufBk5BW3964g+AdjNtpkqDoPh
	X9QB2zYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9HVb-00000007Q5I-2VmT;
	Wed, 23 Sep 2026 07:35:15 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9HVY-00000007Q4D-3Efm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 07:35:13 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49cd38e0f79so2890625e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 00:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790148910; x=1790753710; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NpAQJEpAggqV1p2gBrvheK1e8z0DrJ7uAPNXG/lVgjc=;
        b=czyjIxY4iEidfH6PKqP1SM1vrspM1XCcPaMyGfZqHmEpJWPM0DHInNTFS4xD8/fA9w
         ZWA/zV7DySJanf77l2t3zV/tfA+p+rNyuJ/viUW3+MGi56PCfOD5FJjeuUvn0y2WLApa
         Pxc2+GiDnEct1uXvWWL2coyvrIH5MfE5P1bPZrM8fuP6oinei2RXO62099QDxRq7+PBr
         OuWFGqy13hNTZoOKVg2JSFX8FckGGKuQ9K3R3zParxKVsdK6lK1d1EdBrSPcBIpZSIGJ
         1/OdTqLSR4fvKvTaGdEuMgHGcW1thNZauCskAqQsRAZs9VlD/VhNsDTKSsnoL3Ml7czS
         AnqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790148910; x=1790753710;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NpAQJEpAggqV1p2gBrvheK1e8z0DrJ7uAPNXG/lVgjc=;
        b=wzIvvZCOIVeDP9bfSQKS4XdE+22B81tYR6pRK0aYuEamRM2aPqXeXxHOoBXyFfTqu0
         URpwxfr49c+xTx8fHLDsqWBNicAczVXQvu58R9+kGRTptkA07Rzkif6k4hXFmKUEcsc4
         nx2ctwGjNSouB4TWijgDqPeiC+AnUUT+SODwLPeo/ToEgieCRhQtLWyL4Q+WzPysL31/
         Uh+Rmp8zvoIteoW+eU+cCyKb6s1uCyMxrIt2uJ+Wp12FybIszGn86C9Mq0o71hX2R05T
         mvcV35w/5k52+I9VBu6i21xnSENh7jVWtkLjF6KXj07bhICYHaYGeYqjOSX1J5m1QFns
         fiIA==
X-Forwarded-Encrypted: i=1; AKwUvByan12k+9d+0Yr5AspCmP34iRCXSNK76ypBXsatXHVX6geukboRc//I0WtcRSBl4a1aUtVaUR50/c+hi7sF7Bzi@lists.infradead.org
X-Gm-Message-State: AFuF++mxUgUtQ+LJlgZ5Yt1vgdd3Bv/ms9hrkie/eh1EQBBggYhACLZu
	KvxjxrtHW35fHmy85KOpXy/RcNuZ1Ncxxl2Hb/XuvR/Mss3dTNs7eoYH
X-Gm-Gg: AYBFou0m9V/1zUnVs4Dk5TxmIkUp3pYd2hioDfO60w5hZlxyat9BCTv7giKee7FpmqN
	2lHgO5rzHgBogMqdGN6ru5bzjdF1fYjjsdkb5GS1PeptR51wNZdxMDvgKavmYguEbModE+LIKko
	AmG5uW3vvS20MGVUQBpCc6roPT4OaiuNswvov16OGv5WwX66sUUoKTZkNJMzHWx656Xcyg4RpTd
	aWEJr9FxCw9ePbDoJN0mnAY+3+4C8iNqieAdeRo+yrPjjzkPDqL1M7XzQfTDxfVTpsDwYxbtoci
	GC50JaXonsZkca6nq3YxVEDFOQPPGEo85gYpWAJoeDOUbWzzdRbltKem+2r7coSAgy8JVxvo7UX
	P5P2L+B8nrGq2WGEZ0klI5J2FB+4XORnn4Iodlp6bz0svZcytx2rWV7K/Nm+8kwjIDebkaohOHi
	6OuKiFuo0dWs0PdS7UxxAvKpDRTLhS2uZVQssKBn7fs7ECU9vI043nOUBbjLXYSjcyd8D2KCWae
	8GIQlBg0rhQK48lFA==
X-Received: by 2002:a05:600c:34ca:b0:49f:ce78:3568 with SMTP id 5b1f17b1804b1-49fdeffd818mr18600225e9.25.1790148909725;
        Wed, 23 Sep 2026 00:35:09 -0700 (PDT)
Received: from localhost.localdomain ([94.252.74.168])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fde180a39sm70649425e9.1.2026.09.23.00.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 00:35:08 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Beata Michalska <beata.michalska@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ananthu C V <ananthu.cv@oss.qualcomm.com>,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v5] arm64: topology: fix arch_freq_get_on_cpu() overflow above 4.19 GHz
Date: Wed, 23 Sep 2026 09:35:00 +0200
Message-ID: <179014889997.344140.3757658991789489835@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <arKpSGPXOCFF09hM@willie-the-truck>
References: <arKpSGPXOCFF09hM@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_003512_865985_DD447411 
X-CRM114-Status: GOOD (  10.04  )
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

Hi Will,

On Tue, Sep 22, 2026, Will Deacon wrote:
> ... does this introduce unnecessary 64-bit arithmetic for 32-bit
> architectures that currently pass 'unsigned long' to the existing macro?

Good catch. The truncation happens in the unsigned int temporary in
arch_freq_get_on_cpu(), so v6 will drop that temporary and leave
kernel/sched alone.

Thanks,
Oleg

