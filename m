Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0914ECAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 10:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b6BBuzYX2ggeSMziBzTCfJEdNNCXHrTj/jX8IugZvuU=; b=T27tvh/YvXplB236DDMIxIkLLm
	SBERILJEv2I/vO3nUhrQ3UfChG46n6zGQEsFktZd9daR3TQZfHDvcx4GTYy2z9Z+WDZnWVObDwEcI
	jeBLNBLP9KF0I1mgrf+V5f/4+u65LiNJc9E4/+/9XO2O+9Rew+C78N+vxFWyUltFqSHHuUGyo5U5b
	BJqN6ZnH5kanTvAdfOj7BKFf36+FHD6l4L+cRHv7t3wxrOM4HbWSAunGPfqlsLzG5or4eGWR4YINU
	1ZS89mJgvNB8c8NfHuxHn4lThJtmAL8h4hDLSyqfpNw5wyjAumcq3Sr1t20sAFPpJIZsnwqcIeF0Q
	jjV6/Lgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzXvW-00000002TpV-2XFb;
	Fri, 19 Sep 2025 10:01:14 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzXvU-00000002Tnu-3fdq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 10:01:14 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-45de56a042dso12636855e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 03:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758276070; x=1758880870; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b6BBuzYX2ggeSMziBzTCfJEdNNCXHrTj/jX8IugZvuU=;
        b=ne5Ga1mKAJ7L6AFWZXg5SyrC/lR314lxfJ2kNyjPAisTW9RxxDyBXQAAupzJ6VgFld
         TgdXtMj3+Ya3qQsvi0txoQk++3fP6hHYzOg7RDcrYcfa+R3+P8k8q/VCn/0NIDGrq525
         4KZyWZnwFIwHm79/rrt8beunhs9sxsLAX6F1dLjesDZvFUNQ9Yp2M0albPauWVMdRFtq
         AWSq5li0X8G/MO6Am44DRaehCxWTPmMTtLoblvkhqhsaF475YNh4wIxuh29G9eWlo0TN
         9AHJW+upDepdPqXrM94m3EoTw+7iDE1hB2Ke3qjH9IHcS/kduJOfbnBbaDWzAeXEiHzx
         fpFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758276070; x=1758880870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b6BBuzYX2ggeSMziBzTCfJEdNNCXHrTj/jX8IugZvuU=;
        b=RzxrrivADGAUv7tr4oM3hjl4ghnStRxuDkuoCtmqOrYAz6alk3Orvqqgax6EnoXLGj
         nAfWblZfLH2D1WhavvslJV0u2ZMwuGSDNZBqA/vD0XvL0qO8KqgnVneo7G1iyYsKLI1Z
         4xPV954Q5erUlZEdadkaiNzlCmVg8ELe2QCtemxg5CC9LYlU9MecjDccaBQLj/YUlXMt
         GrZa4owe5i46FhJxQPXoFaI983ABfxTCf6CkPJF9yx8Pq3Ao1BDuKLQ2Z2niiIYWrpd0
         y/KamIYvOiXyBESNBiIZzrHx40fCl+YPVIQ9BA3eMNeCGOKgsU9dsREXsDH3XmeNEqz9
         9ILQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvusODOcposOx3W4+uHLpmnibzfKYjpZsXH+BDmKhG7SyYEaJgAD45vyX7heeXUST9NVcxxggdTwFRguZOQhrn@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3XYW5TIJ8qH+vnWRowhy2qMkTNjgYJXdb1gq6oroZPdc0zPa9
	Sn8zTmsPXuRRLZpxRA/n1iP1nELMRP9fJjRv3h/ox63zauhLUeFif5vs4sp0rfxaAw==
X-Gm-Gg: ASbGncthTqNgn2S//ujvyJ6ccrACfiEcpo70kw73zaotGZ2UWPdtQ4MUHYhyIQ4Nvj+
	yxnzpsKH0kv8nnEAjddJbpe85L80IjvAXiG2ZAYf3dvzpGc5CkEB77bMMV1+GIm07CGO1GnSFLg
	Ea59nS7q2MwUYvN4I7xbO+UQYShYKVLQaEr7K8DfmWRG5USL9AKqprvWxS7e3wXw28YWaiI8O64
	4dSn2RmnJH1s3B9/dHfQImQNAaYmlazuH9y4m98CsJXMvVfGKJHpyUYQ9DU5imhGslihnF272pk
	yriHZOddPmH+kBAwnzeoE70+lt5FwElKv+fpDrudOgPG+El2XarXBKVjTKlBE63xi/2GjOzOALr
	cVbHD7zWxzJzHEb9tWqB3V3mnsw0pOjoO787N/lqro6jYxc9lc68MZwJQbS/1r3g3Cmy1k3qQF+
	6L
X-Google-Smtp-Source: AGHT+IFWHUGX+juK2JjqWprgLEQZc6/GNyQ1PYUKoMGX9rAYPkExud465f+KLZFJxbpo3+wQG/eGhw==
X-Received: by 2002:a05:600c:4688:b0:45b:8504:3002 with SMTP id 5b1f17b1804b1-467eb8e1ddbmr27074115e9.10.1758276069808;
        Fri, 19 Sep 2025 03:01:09 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f325a32f6sm77324365e9.2.2025.09.19.03.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 03:01:09 -0700 (PDT)
Date: Fri, 19 Sep 2025 11:01:05 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	qperret@google.com, sebastianene@google.com, keirf@google.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH] KVM: arm64: Validate input range for pKVM mem transitions
Message-ID: <aM0p4UB3TNnsKcfC@google.com>
References: <20250918180050.2000445-1-vdonnefort@google.com>
 <aMx351jkCPIv_j61@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMx351jkCPIv_j61@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_030112_932134_45147FF3 
X-CRM114-Status: GOOD (  20.30  )
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

On Thu, Sep 18, 2025 at 02:21:43PM -0700, Oliver Upton wrote:
> On Thu, Sep 18, 2025 at 07:00:49PM +0100, Vincent Donnefort wrote:
> > There's currently no verification for host issued ranges in most of the
> > pKVM memory transitions. The subsequent end boundary might therefore be
> > subject to overflow and could evade the later checks.
> > 
> > Close this loophole with an additional range_is_valid() check on a per
> > public function basis.
> > 
> > host_unshare_guest transition is already protected via
> > __check_host_shared_guest(), while assert_host_shared_guest() callers
> > are already ignoring host checks.
> > 
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > index 8957734d6183..b156fb0bad0f 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > @@ -443,6 +443,11 @@ static bool range_is_memory(u64 start, u64 end)
> >  	return is_in_mem_range(end - 1, &r);
> >  }
> >  
> > +static bool range_is_valid(u64 start, u64 end)
> > +{
> > +	return start < end;
> > +}
> > +
> 
> I'm being unnecessarily pedantic but isn't something like [-2MiB, 0) a
> legal range if we had 64 bits of PA? Looks correct though so:

Apologies, I am not sure I see what you mean with this -2MiB range.

> 
> Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
> 
> Thanks,
> Oliver

