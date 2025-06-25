Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3951DC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 07:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UvazZI9dix5Ccz8uQdaazIH2SdfSX8TXp65gCpdhwKo=; b=MTjIEG9uiX+ZT9SokM7TjjJUm4
	wlebkT5acVeFXTMBYUbI/jSgtC2wy2de7UJXJY3TzNlosLxCzIRkDCi47Bj5M7iDqV9Mu02rCTv6O
	fSnsmzj3/8jsPcvgVu0keJSu7M6fizf0Trywy6Ruw9DfFEjBpNaX4w76tF4LIcy98ghVijNMgxpyn
	w2SBaPtEPliEIwkKWsUkC3Hhw3NPrLOIRLWWMFZnjgminfYTDu4vF05KEM7cyAOGCwlV6MY15DL8E
	gGZyo6wfCbYtrpBNH1wAsVat0/a1frXLD+/mRZ4Dx9iD3CINfG8wapWCdZbAYu2CjbX+sMbXp+q8c
	oLyjPkSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUL0h-00000007swl-1Iyb;
	Wed, 25 Jun 2025 07:57:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKJo-00000007mBR-0kTE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 07:13:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750835593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UvazZI9dix5Ccz8uQdaazIH2SdfSX8TXp65gCpdhwKo=;
	b=fidglaxO8zgwVMEne/5d6CJuRbHesSAWTc3zRbvoVhVlYLNFsgtu71eH6YQI9tFGK7ViKU
	E6x2DP7n94ga2sjB7aqXaSBU+zZaPVg0T8825/revwhe6MPoiLN9mt37aKboCkxZ+T6DsN
	0M2QoVl7BJ9zV3gLnxM/md90UMUsBX4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-314-e2mXN1rtPJWad15lYleVQw-1; Wed, 25 Jun 2025 03:13:08 -0400
X-MC-Unique: e2mXN1rtPJWad15lYleVQw-1
X-Mimecast-MFC-AGG-ID: e2mXN1rtPJWad15lYleVQw_1750835587
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450d50eacafso8848645e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 00:13:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750835586; x=1751440386;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UvazZI9dix5Ccz8uQdaazIH2SdfSX8TXp65gCpdhwKo=;
        b=X/8QBxgxJMjN9mZLKGLEm+vv1K2H0PzP18ueeBbmmWWyxfSvfeVikDGLoSVq35uDXA
         EtaaZFhRJ5+yuxRzuM9joVtbjuNxzuyww9khV5TRZD1xgcS+uS4eBhH7llFjfKzKPjTO
         2hcpaCZDeQEZcxNnMvbg/pVrY02xNvRCvmzAcOQtTfFxSVpGo4iK4lx5iWi42FlIlkOI
         nn2qxjzE6Tv2As5Mg8EMaB77f5kpZDfvSLrt2lyVK2/O17zQCLOMDMUE5UHSihg9STtO
         9tIfM1VU/fRP0h0cZ81fUap0GxNIYg7/+3GSnBwMGbQ+M6LKcP8ykQzODxqzGVFXhmO4
         Zr8w==
X-Forwarded-Encrypted: i=1; AJvYcCWbZWxBu5HOLnl92QxcZQHAexKF2finQGc6xC/prS20RmDXWWlX6YEuGebSpzpGW02sn/PtTBww2m3bkIt52cKM@lists.infradead.org
X-Gm-Message-State: AOJu0YzFjWH8ga+exU/ZspOKyaTBvwMV+n8ABDZB630GNsB83X1LsMpm
	Sl5ZmEGqgOofBUnLHdLNxIdUnnaBTL/5V3/Rcm+sgNjStfY9USHFWqDRVEgBgDBmtepUpZLT4Hy
	hEqdcDekRYCDVgzGZ8taxxKmYtDOI+Pg4u3f2pi8kHP+9ewLc8WhI34XRp8dTpzDedX7DUepCm0
	QL
X-Gm-Gg: ASbGncsZTH6/2QiTnzU8dt21eNdYfnGKBVmrtHNxaS6Xk36W3nU7vAQYkBNamifyJ9y
	pG3LsM9NOE8lZWJuCd6hyjb25lmItgvEwschZ+6NKs7GApdJOzJUxesh015mUixZMn1W0+AEnnp
	olkK5TAwSvaJX0itoyajhLk25zbbl/U6M76qULzfvI/Uqhy47tROnA4kPXN4yecxf2JVsbQu+CE
	lHqXYLBFVdbxwuc0XN4s3yIa6vC5Lq8MeOWUxHsSVngvx2lMb8kX/Cjyaesao9fDq7g3vDTcHqT
	EKnSp2Fiq7WyOF5aUMRbWXOJramPtpsNK4LTElLKQshgJ4bbx4AQhJnA8Lhha0COfe/DaQ==
X-Received: by 2002:a05:600c:c166:b0:453:2433:1c5b with SMTP id 5b1f17b1804b1-45381aeaf59mr16247285e9.5.1750835586434;
        Wed, 25 Jun 2025 00:13:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3iA3F1mdUK03DtATl2924qBuUv87aDvuUQRfj1Hbnrj8+86URjh4kC1Jl7WzPkyXWYI1Cug==
X-Received: by 2002:a05:600c:c166:b0:453:2433:1c5b with SMTP id 5b1f17b1804b1-45381aeaf59mr16246855e9.5.1750835585911;
        Wed, 25 Jun 2025 00:13:05 -0700 (PDT)
Received: from ?IPV6:2a0d:3341:cc86:3510:2b4a:1654:ed63:3802? ([2a0d:3341:cc86:3510:2b4a:1654:ed63:3802])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e8069534sm3692041f8f.44.2025.06.25.00.13.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 00:13:05 -0700 (PDT)
Message-ID: <20159d14-7d6b-4c16-9f00-ae993cc16f90@redhat.com>
Date: Wed, 25 Jun 2025 09:13:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v13 04/11] net: mtip: The L2 switch driver for imx287
To: Lukasz Majewski <lukma@denx.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Stefan Wahren <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>
References: <20250622093756.2895000-1-lukma@denx.de>
 <20250622093756.2895000-5-lukma@denx.de>
 <b31793de-e34f-438c-aa37-d68f3cb42b80@redhat.com>
 <20250624230437.1ede2bcb@wsk>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250624230437.1ede2bcb@wsk>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: G1eZTBn4v5yFWHn5ArGz8MpPMZFxCiaQ1qWGuYonPgk_1750835587
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_001316_297416_6DFCC155 
X-CRM114-Status: GOOD (  27.82  )
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

On 6/24/25 11:04 PM, Lukasz Majewski wrote:
>> On 6/22/25 11:37 AM, Lukasz Majewski wrote:
>>> +static void mtip_aging_timer(struct timer_list *t)
>>> +{
>>> +	struct switch_enet_private *fep = timer_container_of(fep,
>>> t,
>>> +
>>> timer_aging); +
>>> +	fep->curr_time = mtip_timeincrement(fep->curr_time);
>>> +
>>> +	mod_timer(&fep->timer_aging,
>>> +		  jiffies +
>>> msecs_to_jiffies(LEARNING_AGING_INTERVAL)); +}  
>>
>> It's unclear to me why you decided to maintain this function and timer
>> while you could/should have used a macro around jiffies instead.
> 
> This is a bit more tricky than just getting value from jiffies.
> 
> The current code provides a monotonic, starting from 0 time "base" for
> learning and managing entries in internal routing tables for MTIP.
> 
> To be more specific - the fep->curr_time is a value incremented after
> each ~10ms.
> 
> Simple masking of jiffies would not provide such features.

I guess you can get the same effect storing computing the difference
from an initial jiffies value and using jiffies_to_msecs(<delta>)/10.

>> [...]
>>> +static int mtip_sw_learning(void *arg)
>>> +{
>>> +	struct switch_enet_private *fep = arg;
>>> +
>>> +	while (!kthread_should_stop()) {
>>> +		set_current_state(TASK_INTERRUPTIBLE);
>>> +		/* check learning record valid */
>>> +		mtip_atable_dynamicms_learn_migration(fep,
>>> fep->curr_time,
>>> +						      NULL, NULL);
>>> +		schedule_timeout(HZ / 100);
>>> +	}
>>> +
>>> +	return 0;
>>> +}  
>>
>> Why are you using a full blown kernel thread here? 
> 
> The MTIP IP block requires the thread for learning. It is a HW based
> switching accelerator, but the learning feature must be performed by
> SW (by writing values to its registers).
> 
>> Here a timer could
>> possibly make more sense.
> 
> Unfortunately, not - the code (in
> mtip_atable_dynamicms_learn_migration() must be called). This function
> has another role - it updates internal routing table with timestamps
> (provided by timer mentioned above).

Why a periodic timer can't call such function?

> 
>> Why are checking the table every 10ms, while
>> the learning intervall is 100ms? 
> 
> Yes, this is correct. In 10ms interval the internal routing table is
> updated. 100 ms is for learning.
> 
>> I guess you could/should align the
>> frequency here with such interval.
> 
> IMHO learning with 10ms interval would bring a lot of overhead.
> 
> Just to mention - the MTIP IP block can generate interrupt for
> learning event. However, it has been advised (bu NXP support), that a
> thread with 100ms interval shall be used to avoid too many interrupts.

FTR, my suggestion is to increase the
mtip_atable_dynamicms_learn_migration's call period to 100ms

>> Side note: I think you should move the buffer management to a later
>> patch: this one is still IMHO too big.
> 
> And this is problematic - the most time I've spent for v13 to separate
> the code - i.e. I exclude one function, then there are warnings that
> other function is unused (and of course WARNINGS in a separate patches
> are a legitimate reason to call for another patch set revision).

A trick to break that kind of dependencies chain is to leave a function
implementation empty.

On the same topic, you could have left mtip_rx_napi() implementation
empty up to patch 6 or you could have introduced napi initialization and
cleanup only after such patch.

In a similar way, you could introduce buffer managements in a later
patch and add the relevant calls afterwards.

/P


