Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC57C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 09:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=inucMIKhxEvXP9jZT/ROlUmFAW5Fk+3g/o1C1Us0aGM=; b=h2uAxFdcBMq0eazK4r08kRZGXO
	9G3D4QSGZ/90I9rG94zHsW+7SuwtHXdyV33pfBIBpxKiJNnpAOuw2PleLSgbMnCtaO6iuXLy+zLRu
	UpAAnJyBvEDnC+PwWoNggqr84lRKhrycuv9pLRC5hUiccyj/Su9d/IRoq8umdvStDBw1kFRSUbqJY
	00v5We/dcNrkE3MRuaTUI1CQ/7fdetnnMirbpmmRkulQRjjM32XFNNQl/KPOjBLZKCPekHbraOmLs
	UDJlRTq6oTd1ECVGvN1DgN+LCwrSo4OVZ9J0o/MZYhwVajjF9w4mGorjyofEZpulZBhFoDf8Ao7w8
	ooae5gAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesK5-000000073Ms-0AEI;
	Thu, 24 Jul 2025 09:33:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uerEl-00000006qjP-2IT7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 08:23:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753345414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=inucMIKhxEvXP9jZT/ROlUmFAW5Fk+3g/o1C1Us0aGM=;
	b=R5lrJLKVX6jYmcSrjAJ08pa11Lx3/nWijRthxFBZhcclrdqDtIbXSswu7gthCsDVEWRcsp
	M4bcqw4tN/RyWNQbr20e5+ROD/U6yixOvoecOsT66z91LyOWnr2xWhMzo2Udh7LSkz4eGu
	FRlE9hSFE2v6QyRL51tn1yrePksx52M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-538-eIsVVRgFP_yAFcmy6ZMWcg-1; Thu, 24 Jul 2025 04:23:30 -0400
X-MC-Unique: eIsVVRgFP_yAFcmy6ZMWcg-1
X-Mimecast-MFC-AGG-ID: eIsVVRgFP_yAFcmy6ZMWcg_1753345409
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45867ac308dso3719395e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 01:23:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753345409; x=1753950209;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=inucMIKhxEvXP9jZT/ROlUmFAW5Fk+3g/o1C1Us0aGM=;
        b=kzyepjS1g0Km9G9RwImUXNDHE4Wp62sBFKdKbwsNkXY5WmvsTQ2JrDhovPQRUYEn0O
         wO1o1XfjY42SBrFbQw4pX765RxXq6N2Ub/UyKbvzeBpzlixjI1HSncU84MWleubAPbmA
         ic6P9jpDt3l+3ociYbmK1nCY+Gr8WRGNfIEjVPO33HP8dvGdjp7nqu4h6NyDMGCOwo69
         oC84/QQWY7JrE/4S/Krp9JD7yTi1r/10rXB650fZGy86/hvMnE/1765jvEGfHAd9+M07
         WtAWlf6LSltvs8cOor6vGkwkjAoDrUO+6/kv7SI/825hdSJleCaEg311Nh0fjU+NREGS
         ORqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXted132qvGTGG7Sxu3xknr+yTcZYavyhDncVTXs9kkdcXmPQ/5H27h4YoaMOtLxCR5M7dTRz0+7+e7/PPuIzha@lists.infradead.org
X-Gm-Message-State: AOJu0Yw99GUFLT3oCGfUN2hbBYLLYuB4IYjs7rZV2hM6yT3aWViVFUfQ
	xuX5z0W+Styk8qWckHWJP7XTiGgiTocVqvAl4o8t1xyUeghQC+/wvZSjzizq8PfU1vNqHvzGJNn
	BRprcufQYg7g0V59gy0qbSU+U7oDUOd8a/5ty6dBs/TxEhl9GLOCS+QEai0IKJZtX8M4Zw320Jh
	6g
X-Gm-Gg: ASbGncto3PVmk8w/pP1XcWh9N0pg7Zw6BIWbpOFRDuSU3w/VpBcRxIgJT0yP+h3/Jqh
	9ve9J73qHul2CNG1DRTvrsJeCXWLRwlOisSsJo4UESmWZ38v3Es/6gQ9Fn7vYeTYg6QWNTmPF8B
	y7q8QPL9yLO7bqR6nufgpvrLe5fdR9FiUgP7FtwsWjWQztK6FHlnP/B++5swY2oiyU/Dfut+B/R
	qN9bV2MlkdIbmARt8YhW/funOOAK/2SP8LsCPzcbsrdib0e8Bo5NPWt5Ya4/3lBWByJln+pC/gg
	ABWyHiUeVGVuK0dwROySDG4KuHRohqGgIYcZ0p2T+OYbNJVVAPbW6ZO3wnBBrsO37iTr+g==
X-Received: by 2002:a05:600c:8b08:b0:456:1b93:76b with SMTP id 5b1f17b1804b1-45868c79052mr53695585e9.4.1753345408893;
        Thu, 24 Jul 2025 01:23:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdtLcyEdZUOsZv2sq0CbPs5hZqiaOagRDT3jXPlexGgIDzMlul8E40cqYAQwrjLryESM9Uzw==
X-Received: by 2002:a05:600c:8b08:b0:456:1b93:76b with SMTP id 5b1f17b1804b1-45868c79052mr53695235e9.4.1753345408515;
        Thu, 24 Jul 2025 01:23:28 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.46.230])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm10581635e9.14.2025.07.24.01.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 01:23:27 -0700 (PDT)
Date: Thu, 24 Jul 2025 10:23:25 +0200
From: "juri.lelli@redhat.com" <juri.lelli@redhat.com>
To: Pierce Wen =?utf-8?B?KOa6q+W9pee/lCk=?= <Pierce.Wen@mediatek.com>
Cc: Kuyo Chang =?utf-8?B?KOW8teW7uuaWhyk=?= <Kuyo.Chang@mediatek.com>,
	"bsegall@google.com" <bsegall@google.com>,
	"vschneid@redhat.com" <vschneid@redhat.com>,
	"dietmar.eggemann@arm.com" <dietmar.eggemann@arm.com>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"vincent.guittot@linaro.org" <vincent.guittot@linaro.org>,
	"mgorman@suse.de" <mgorman@suse.de>,
	"jstultz@google.com" <jstultz@google.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [RFC PATCH 1/1] sched/deadline: Fix RT task potential starvation
 when expiry time passed
Message-ID: <aIHtfRB6UuVVbp2z@jlelli-thinkpadt14gen4.remote.csb>
References: <20250615131129.954975-1-kuyo.chang@mediatek.com>
 <aFAyN4rfssKmbUE5@jlelli-thinkpadt14gen4.remote.csb>
 <089882f95b1b910f7feecddd0ad9b17f38394c64.camel@mediatek.com>
 <aFQM8TdZIIvvGv8T@jlelli-thinkpadt14gen4.remote.csb>
 <6ec534be0618de3e2b4d81555e5f24155326c0b9.camel@mediatek.com>
 <aFV8qeH__bw0chWM@jlelli-thinkpadt14gen4.remote.csb>
 <a1103727ffaaf5f4d1b077bc09a3cc5168c5708d.camel@mediatek.com>
 <cd10d32b514d2792659fe03ad1235771982a6e2f.camel@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <cd10d32b514d2792659fe03ad1235771982a6e2f.camel@mediatek.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NJhPYKIE4bu6vCH__sJBjV6nKYdpTRDlg1JCIKNDxHg_1753345409
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_012335_649946_9D88DFBA 
X-CRM114-Status: GOOD (  18.18  )
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

On 23/07/25 22:22, Pierce Wen (溫彥翔) wrote:

...

> Hi all,

Hello!

> I wanted to follow up on the discussion regarding the potential RT task
> starvation issue and check if there have been any further updates or
> feedback.
> 
> To recap and provide some additional context:
> 
> 1. As discussed in the thread (see
> https://lore.kernel.org/all/CANDhNCqYCpdhYS9afdKeY34Bmw8MXyqKWCSTxOZNLTjYrUaVXg@mail.gmail.com/
> ), it has been demonstrated that the use of a scaled timer can indeed
> induce RT starvation under certain conditions.

This first case has been handled by fc975cfb36393 ("sched/deadline: Fix
dl_server runtime calculation formula") on tip/master.

> 2. Furthermore, since the delta_exec time calculation relies on the
> clock_task member of struct rq, which is affected by IRQ time on the
> runqueue, there is a risk that if IRQ time becomes excessively long in
> some corner cases, it could also lead to RT starvation.
> 
> 3. Based on these observations, we strongly recommend adopting a
> recovery patch to address these critical scenarios and prevent RT task
> starvation, especially in cases where the current logic may not be
> sufficient.

As I was saying, I am not against the patch proposed to address the
starvation issue discussed in this thread. Maybe the patch can be
reposted with the addition of a comment on the code path related to
dl-server explaining why the special case is needed?

Thanks,
Juri


