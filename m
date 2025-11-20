Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2600BCF8844
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 11:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TPlzmXt4DNVBdqLVvxiBIWu8Rl4FZ4bDuiyypGx7MuQ=; b=PpfrRsC+z6dUG1Ub5p6ZuFLdIG
	wYd41v5VHSG+jVy4tmz6V3hAJBmflYNl0MA8j73fF5wNejR60kgdYStwHMNfS3KlJhdk+efkAC4Q4
	M/da8aSmI9rlpnTHoeamvLC36eCRcSkNATT7cKY8rfJzXRNGhYe3dH1bFLu0G1tUMznvzXOzq8po3
	QdmuGg17it1UqbX0Pbfu30lD0qTXuTXz2nH80g99Tkk9inh9g1U3uivdC40mSEvGzGrbPV7tCMLk/
	X7ADQtZRtoBpR1pmioTJbcHIftziWZXga5/RmHrn1E3KyXpuwYzXLNWhrmpGrHVzjECefmX+ycyWx
	T8+B0Xjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM2xd-00000006b06-26NH;
	Thu, 20 Nov 2025 11:36:25 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM2xa-00000006azZ-1F3I
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 11:36:23 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso13302465e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 03:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763638580; x=1764243380; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TPlzmXt4DNVBdqLVvxiBIWu8Rl4FZ4bDuiyypGx7MuQ=;
        b=LawHfCdEHTSquhn4Wh/PifORbsbA/9OCEztusBOMVeBhzplEwzXBs43JOqxiP4Ac8a
         3/sBoI74xnIEeLX2fcv9euG85k1nWr2nhc/0aE2KOnnPR0p/7nEeLsFWL1I60CGuXV6H
         6mYQZL5i4pTgF2/Y52f47GeMJxXkOHn3O6kigy0LHIr2FHfgyp+x1WaUm3VishA02J/g
         MHlXrEsQtof1vivD9damK0U0oL3u1R1wlaUfxLH/ovOA6E8QWQzzij3Tfz3Dw2cGZHUo
         MS6V9o1/BAIE8/5+1L0pJSAW3zCJDmkB3cYmGezvkHwJQXfyu/Jbe7FCQhpHRud7oaOB
         5yzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763638580; x=1764243380;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TPlzmXt4DNVBdqLVvxiBIWu8Rl4FZ4bDuiyypGx7MuQ=;
        b=g9aki49nhz626ISatgLuN66SDudrcl/k0UppwEsyH00MyuR5fMr69Y4utSXnqx5q98
         J9J8eTyw83ys5YFMgcs5MM2AEYof1Px146CkbvnSjSqrYXfQ3svvDZXJZVkTNtcj3EYc
         EcuSU++FfF48nqWossHRaWAZrdo8tz/5jXvIktrCX/mTUTER6DofJk/122ChSPwB1uSO
         S4n3ExyGWpJagsFf+bX0D4J7Fu9QxXG9OVnv6PO8o4y1yAqnr/llVerSSNhp4ATJnNTa
         +jycjj7TT1hyTt+PA1RZtVMQeTsBzKIZuxbmOXdc3HKI+oRigKAwmYp/nTispAkjrr87
         ynRg==
X-Forwarded-Encrypted: i=1; AJvYcCVC8gv+ccZw3rd8LdZOM8VtYpVM4CQZyNyQteEA/wh+SgYeSHglqSRQWaj/tYn5j3cdBbNolancbvKqm4+F/uW/@lists.infradead.org
X-Gm-Message-State: AOJu0YwbrsTXZXNhkbyWDSa/pqjWY8pEsOVbs1y9uIA7PopbpH0DDRsm
	qP+M8m/JHdZYv0TBu3wBpd/1kshmuKlgGvwkYt/UaB4FMqXIhim26IT5O8Lov6GjTA==
X-Gm-Gg: ASbGncsNGL5A8Dl5dVRXJsRmKUlQ6pRKglXLvbtVdKDfwzJ5OjghFZ/JpTcmnufpryd
	vOTql4fi2WVy33miFUN+N5LZwd4k/lW+YpFCfjCaqRTbhVYVLawD6ZFDbtwvwoYG8fh7Hd1mq1e
	T01C0II1HnMwGP/d9x4XJlgThFEqW7NcZnEEintCs178v6r19Oxp9BpXieIdSVQOajrN3eRsSZ6
	epT5B6r+DC7KweQ7+a+TehwU+t2z46nt2FnugIfAqYcRql90uOwNGj+8Qh3rvV5rjP+qV0ssfHE
	fGFpEgCmGY6wyC9sEzL1w22x90QPhMrAB9tnxptXD/Mb7QE7ap5P9habo1Kbj1myp8xYtDPxepv
	skwfGPuzcGVECeBrRv3j1BVU30vklZSj2GIT8opuqjLcloYRrXwe9or6QdbUNNIe3o26LndaRyf
	t3aqhDQEYMuR7PBpCuCvgikVdSnR+RlFXrPpfrWU9rOudk+Z4PmA==
X-Google-Smtp-Source: AGHT+IGcOCRDUWPkVUZ7ncQTNFf+q64GbtuEHTlJs5oKc83ztKfhHnrQKRpzLVqerrPSrM7dBJtv3A==
X-Received: by 2002:a05:600c:2e4c:b0:477:9890:4528 with SMTP id 5b1f17b1804b1-477b9ea31e9mr14670485e9.2.1763638580134;
        Thu, 20 Nov 2025 03:36:20 -0800 (PST)
Received: from google.com (120.54.38.34.bc.googleusercontent.com. [34.38.54.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9e1b657sm60238005e9.17.2025.11.20.03.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 03:36:19 -0800 (PST)
Date: Thu, 20 Nov 2025 11:36:16 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Marc Zyngier <maz@kernel.org>, g@google.com
Cc: rostedt@goodmis.org, mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com, linux-trace-kernel@vger.kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, jstultz@google.com,
	qperret@google.com, will@kernel.org, aneesh.kumar@kernel.org,
	kernel-team@android.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 20/28] KVM: arm64: Add clock support for the pKVM hyp
Message-ID: <aR79MCNlAKP1H-PQ@google.com>
References: <20251107093840.3779150-1-vdonnefort@google.com>
 <20251107093840.3779150-21-vdonnefort@google.com>
 <86cy5erprc.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86cy5erprc.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_033622_353510_404FAA5C 
X-CRM114-Status: GOOD (  17.43  )
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

[...]

> > +/* Using host provided data. Do not use for anything else than debugging. */
> > +u64 trace_clock(void)
> > +{
> > +	struct clock_data *clock = &trace_clock_data;
> > +	u64 bank = smp_load_acquire(&clock->cur);
> > +	u64 cyc, ns;
> > +
> > +	cyc = __arch_counter_get_cntpct() - clock->data[bank].epoch_cyc;
> 
> I can only imagine that you don't care about the broken systems that
> do not have a monotonic counter, and that will happily have their
> counter swing back and forth?

I haven't used the _stable() variant for the affected devices... Hum this will
not be trivial from the hypervisor. I'll see what I can do.

> 
> Also, you may want to document why you are using the physical counter
> instead of the virtual one. I guess that you don't want CNTVOFF_EL2 to
> apply when HCR_EL2.E2H==0, but given that you never allow anything
> else for pKVM, this is slightly odd.

You mean I might as well use __arch_counter_get_cntvct() as CNTVOFF_EL2 will
always be ignored in the pKVM case?

> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

