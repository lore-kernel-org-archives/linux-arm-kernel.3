Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F72CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 14:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CAGgXUa7jrEcPUZf+rZoYoMIoxF9gmUgGUWe7xlA3HM=; b=hS7t9+z0tVFttNdZsAUbziE/Xf
	4lbkPJ50RxarFONosjCgC6YWgGV8qm7tV+MkhoYKjtsdN1knKF3zMK0y0u7Z3S+EOYn8Pw0ivqbwJ
	nSWRypmdV3sP5uobEYDCNXMIoWa+ykSEGoO7yw9EO7H2CbYS259n6LqQbibHjKId4DUqDJw65izQ2
	1MjitI1n1+zNR0Rx3PKT6Gkc5WMgU015NGFLarAywBUBYLpAakvEtfmWMn6FMPkkiSA7J9Irx2dv8
	ZuwXBKLYaJJnyL4KvL6NUKeQ4nWgKiXvWkRKwFlbrd3wHEwuB4T/NVCxAKpXXPYBep03P+RtoS0zt
	8DiXNzWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6rSC-00000006JHt-2cbn;
	Thu, 09 Oct 2025 14:17:12 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6rS9-00000006JHF-2jPq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 14:17:10 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-781010ff051so746134b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 07:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760019428; x=1760624228; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CAGgXUa7jrEcPUZf+rZoYoMIoxF9gmUgGUWe7xlA3HM=;
        b=SZE9Q1W+hjYa7hNSAFO591oYcfmndZ0PnADxc0QA1ZlDiqSiYC3R9zvFbBt5zyYEUC
         QaFxE4OafBiVUQvT1bDtwrf2sAdI1Yh4J0pyJIbPsG6oNW8OjLfY6+ItS2NZbim0MjzU
         JFFOe9WjnotPNvCrmqjFPYMTrWpJpG2Y4aOIu2KIN2yisycLwKxGtfqFHsgay5alYzAn
         fgPYJHCUxhqzigvv59SYyfwrSalSBu96QyRRwy3uISjOZwjMM0n1ZdV1P6L2v8F1rQqq
         rLVM4uEGcHEk+d6+fTYYU23m3a/WC+wROMZe9hbqoOQYnFf+ZECo/2ckN5zVuYlY0ICC
         Ep4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760019428; x=1760624228;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CAGgXUa7jrEcPUZf+rZoYoMIoxF9gmUgGUWe7xlA3HM=;
        b=FsBCvZn3uoYqlRXlD4+F5y1ztpVojAEmj625Qu6tB4UxVme0Y0caI+OrMyFzsvfeZm
         lSwTh6qB9m3wMFNw7buXJRnchvZ9mhNUspi3XF1QOig8RhVVAVfePMu/SVhuOEXj1YIG
         svt3eDUScHvhUe7Q1RmvERiaMm++W56NXPRK2WWI4VNyy4W+A+DDM19FLKpbZ4dns9VW
         dULbBIghCHRuz+m5NUv4GXr/FPQMw+OIduT8aXPL/aWV5kSKe8Bj0dxfO2aqmUZbWVAS
         vX9WvtT19FV1O9vJK7wLfUawDolFjaMKS4uLw+fW4gglJetgqCeg/f3pDrkf9wQbRHtv
         qnTw==
X-Forwarded-Encrypted: i=1; AJvYcCVLvkPxk3eiRezaBcw+B+gXlZaNtSS8Cr2YFpIV5tQt/DcrF565Zn9bToVGKIdxqqO6KiNEEg+ZEgR5xLYPXDFs@lists.infradead.org
X-Gm-Message-State: AOJu0YxgDWFIFXOqCibXpjB8OGyKsubYHyVerNhZl5NUGe7wwxrPjeLB
	EV8h9rmoO9NBC1UfBlzQgXWXuEgoshw6eZULo6JTFbdPAv6zd/B9050aN9cJ6Ud7y09gaqSgspF
	GfQHJ9IYijxIMeY7TyxBhU98vNAgSL4AGn/owV1Q4eA==
X-Gm-Gg: ASbGncsVn8Ubo16ul73pqKlNn46vBgmZJL6/9H55qHNh2wMHlBujzu3nhRmo7ZCiVfP
	VMT3udS1xF6gZ3jcESn4cbUnPoqZyAbH2uvnG9vSOO3icMWo300XWVzNkXR/q8HuEVt6+6F43e/
	CzImqf5tQ74WUbcD1amFQWwLGs5ipLpTNmR+V4DdNmvlekUkTpORIhf7RuGK7LaKNX/FcgVGVnB
	WMyeSxX6uPHuNEmhcw6x7jyI9f96g9yILFw
X-Google-Smtp-Source: AGHT+IHNiqZkNg6XPeFelUbllPF8ssAC0Q7z3PQ/udjq0kDEms+Yi6CfYpXwtOZXZ025zfvzYmbK8YD8WJrjzye5Z0M=
X-Received: by 2002:a05:6a20:241:b0:32d:a904:8bfe with SMTP id
 adf61e73a8af0-32da9048c2bmr7568674637.52.1760019428498; Thu, 09 Oct 2025
 07:17:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250922095057.3136-1-liujing@cmss.chinamobile.com>
In-Reply-To: <20250922095057.3136-1-liujing@cmss.chinamobile.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 9 Oct 2025 15:16:56 +0100
X-Gm-Features: AS18NWBMLxvQq3EALWAjqVKr0csFKifCNSSsQBqJuIAM_-6p8ePV2UoH-Pz_cmo
Message-ID: <CAJ9a7VgxMt7Z22rB4+ndHYe-T-hV77BPwoHU4HFipySM6sXd8A@mail.gmail.com>
Subject: Re: [PATCH] perf sample: Fix the wrong format specifier
To: liujing <liujing@cmss.chinamobile.com>
Cc: john.g.garry@oracle.com, will@kernel.org, james.clark@linaro.org, 
	leo.yan@linux.dev, suzuki.poulose@arm.com, peterz@infradead.org, 
	mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com, 
	adrian.hunter@intel.com, kan.liang@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_071709_691775_373FC63C 
X-CRM114-Status: GOOD (  16.22  )
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

On Mon, 22 Sept 2025 at 10:51, liujing <liujing@cmss.chinamobile.com> wrote:
>
> In the file tools/perf/util/cs-etm.c, queue_nr is of type unsigned
> int and should be printed with %u.
>
> Signed-off-by: liujing <liujing@cmss.chinamobile.com>
> ---
>  tools/perf/util/cs-etm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> index 30f4bb3e7fa3..d13575285b19 100644
> --- a/tools/perf/util/cs-etm.c
> +++ b/tools/perf/util/cs-etm.c
> @@ -777,7 +777,7 @@ static void cs_etm__packet_dump(const char *pkt_string, void *data)
>         char queue_nr[64];
>
>         if (verbose)
> -               snprintf(queue_nr, sizeof(queue_nr), "Qnr:%d; ", etmq->queue_nr);
> +               snprintf(queue_nr, sizeof(queue_nr), "Qnr:%u; ", etmq->queue_nr);
>         else
>                 queue_nr[0] = '\0';
>
> --
> 2.27.0
>
>
>
>
Reviewed-by: Mike Leach <mike.leach@linaro.org>

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

