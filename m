Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A9BCA0EC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 07:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XEkUsPN+k+MJU7kRrD9l63TqRFA4OQCOteatAqsTD0Q=; b=orVD5Feyr885QJvKTpAkb9qPh8
	fXdWU7CXFdYwSHsWgZkAfbEXGDe8flfE6SK+v8wRUJnvZr7nhHAS2jWo0BR027ee0aU4e4k/BREJ+
	RgJKa1Jsi/fyhBfmIwsAdsNDvpbJ3GCVeau3KS1xPQNimHAIFGrDJPpd7FljybYN/Uc3beBFVhvz7
	SMVlHh4PezGV89ex/XqOCMkR1soqNTPI4kmAuUj+yiwYwqBTDtRZii9cXlOPrDB89v229agDU/R0j
	7yoP9u23LWMbLBTpDd6B+Y4UZ9N2ThBKh0OJu0F4ndMPiqN0wLqivNnnvSAv50VrS6gYqEIgepFBM
	8RghhSfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujutL-0000000HRSe-2dOU;
	Thu, 07 Aug 2025 07:18:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujuqp-0000000HRMc-1rbn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 07:15:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754550945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XEkUsPN+k+MJU7kRrD9l63TqRFA4OQCOteatAqsTD0Q=;
	b=C/jvAugV7pMGoLx3o/OGwcDZtg2CKc1g0sfA0MXDR7iNJvodfsqNDYq1QRMC5iG03lm5LJ
	Di3H+38esryN2BUqiCuln0OtR5E2mVctXjXZ/9ZqgGhNB1L2BE8nLsQ8ZHf9cVaSfxV0uS
	bBiUxYWDEPp6Ez83OAT8qTcmHMJev7M=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-41-C_T7IpZuN9q99MUH5xuMXQ-1; Thu, 07 Aug 2025 03:15:43 -0400
X-MC-Unique: C_T7IpZuN9q99MUH5xuMXQ-1
X-Mimecast-MFC-AGG-ID: C_T7IpZuN9q99MUH5xuMXQ_1754550943
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c790dc38b4so168912685a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Aug 2025 00:15:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754550943; x=1755155743;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XEkUsPN+k+MJU7kRrD9l63TqRFA4OQCOteatAqsTD0Q=;
        b=ABm/TcQpvw3jLVKYIdkKQ4IjuujG4k7ccv7K51nGetAxIwqxw0WcB8f5cZqaRFjSlu
         he/jvfVNwmFgAnaecaae56z7nI6XxbNSTfI0ed46YAygTd4c9oP/MiLlvZvZ5hkLoOZE
         Qtm2hj/6rNH5zNUkvAIVJHSkFlfr03YG6JDdSW5BMXGdmfeZpvQ1DQNrSVLUQLHXb0oC
         D1Ck4hXSDRNuCXO+A8JPcF4qnDrfS84eQVF2yQuJ4JG3qwAM+Pvhwyci3YWqslMMH7lc
         ETgDdhXVs5zi5S2spPvV6Sb+P/NNHD7UwXoevFa38QGspsW+qXjF3XOnFfmw8uh9fQIt
         L01A==
X-Forwarded-Encrypted: i=1; AJvYcCXrSBMLm4PW0X6yPKNhwssDEB2KPT0FIRi9u1ab3BTjeUGexADzCNtMxaF/TFjr0UCa4ytjbxngJY6HRGSzM2hM@lists.infradead.org
X-Gm-Message-State: AOJu0YxG/41M4S1wB3nJV12zgInX+J4LCK5czg+Jsvf9FgxBbOcLMFaH
	ujtwPS4TaUcv3MlnN8/vmRvqWzRFJ7hI+7TS3aEbNvJXRhzAN7TgKODtXyWfzCwQI5OObZKCm6J
	7euWHch118dLxPbygy3JK3HiTl8Flr0QVJvPHgtA7OAL4TJHnKDeZic+J5M28Geolh2Je3bwlkn
	B0
X-Gm-Gg: ASbGncuQpYsaDRkM5ETNgWPQAZttYyoYlTXUaB1j9EHuwXHlroNg+tn29RriWsbKA8t
	DQ9641bsItAR8SYaytpr+8D5uh7mO6dnapfN8+7LK7vHUsoMv3Cwg08lxQuZV7zVBXrLXD/E6LN
	/rcOdJyu3SCvpyPMRtYcf5+eXStVx1FC/7BHuWjv60Sn+LlMQYpmLxU+UD/+4kV8zhFNIZ5XMeN
	mQoayOsAfQzlkYC3+KEDir1I1bkoQwnceSAfrJz64Qd4ifwpsKVk8veEZG5PPnvU9PFiFRm3Pjk
	vEcMHBKO+GBvV1/zrwEfhAn9HvR0hl3QXYlB+wzWPbniGH0Zw5neSPyfOBhktkXYy8NWDfWKzfY
	1P2lf0MbM/j3/0EdvHW7XoZ8=
X-Received: by 2002:a05:620a:1a9e:b0:7e6:3e26:63b6 with SMTP id af79cd13be357-7e81ff9ae91mr302608385a.21.1754550943137;
        Thu, 07 Aug 2025 00:15:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9+WiBRRCq+H4RnB0Tr6tHhfPNZd1WZfXKOFerdMaIC9DXsn94l4MoDcA4SpZi97fGQJP2Hw==
X-Received: by 2002:a05:620a:1a9e:b0:7e6:3e26:63b6 with SMTP id af79cd13be357-7e81ff9ae91mr302606485a.21.1754550942754;
        Thu, 07 Aug 2025 00:15:42 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb (host-2-102-14-151.as13285.net. [2.102.14.151])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e817311ad9sm186328985a.41.2025.08.07.00.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 00:15:42 -0700 (PDT)
Date: Thu, 7 Aug 2025 08:15:37 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Kuyo Chang <kuyo.chang@mediatek.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] sched/deadline: Add DL server activated message
Message-ID: <aJRSmWCJI-GlApsR@jlelli-thinkpadt14gen4.remote.csb>
References: <20250805155347.1693676-1-kuyo.chang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20250805155347.1693676-1-kuyo.chang@mediatek.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IWpxBe2_rXIYfwUj9zj-FPc0mQI693CBLNQpe545PQ0_1754550943
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_001547_558556_DF577351 
X-CRM114-Status: GOOD (  21.02  )
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

Hi,

On 05/08/25 23:53, Kuyo Chang wrote:
> From: kuyo chang <kuyo.chang@mediatek.com>
> 
> The DL server is introduced as a replacement for realtime throttling.
> When RT throttling is activated, a message
> "sched: RT throttling activated" is shown. However, it is currently
> difficult for users to know when the DL server is activated.
> 
> This patch adds a similar message to indicate when the DL server
> is activated, which helps users debug RT/CFS contention issues.
> 
> Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
> ---
>  kernel/sched/deadline.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index e2d51f4306b3..8e0de6cdb980 100644
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -2042,6 +2042,9 @@ enqueue_dl_entity(struct sched_dl_entity *dl_se, int flags)
>  	}
>  
>  	__enqueue_dl_entity(dl_se);
> +
> +	if (dl_server(dl_se))
> +		printk_deferred_once("sched: dl_server activated\n");
>  }

Not sure if we want/need this, but, if we do, I believe
fair_server_pick_task() might be a better place to put it, as it's
really when the dl-server is called to do its job.

Thanks,
Juri


