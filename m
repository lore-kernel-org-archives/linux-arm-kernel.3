Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37CAECD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 09:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WltqGyX6LSgbCxoNJFtaPsurvESE3OwLgIknpaUUGUA=; b=YRo//IKH+m7F01hF2dnpkJ1v1g
	X9/5NXacafUsc4btMn2T/u02+AgJI7m/ez8+p3eYgcFS7QLZbY13jrDwfk7eQZrtOpnKOyeLRsThl
	elnfWA2VX71WKZIzNiJL5W5ImJHbZMq0eo54HR6U7zg7kPoJhMxr6ihswI3Rp82B5jqBjj3y/rRnO
	HlHIRJB6e4PIBXxVQDe3Prs8J/u7+HK0Z9Y5oAl8AqK1ulon45zGbZbEuPDxkBnMio7d8FcfaqEiw
	B6UNnLw78OTdZu7BcX49ZMLmN3Mtj4XL+cMqCydkPkM3R/5I4TYdd4lznxEheORIYPC1U/cCZtIUY
	CZMcK3Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGlF-00000000van-0fx0;
	Tue, 19 May 2026 09:29:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGlC-00000000vZv-1ym7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 09:29:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779182948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WltqGyX6LSgbCxoNJFtaPsurvESE3OwLgIknpaUUGUA=;
	b=JU0IsAGEINz0CEAfbOfTkDf6hzX/JeipydLv+gWZ771bS8g6+j6uzWca7fu3i8XT7O81od
	UHAiWVFNKxaBQm7EUrgOo+BlNz82CA9STrqjBgrdSz7KfFrlqa8TmOJJTU8LVvJ1zPZKlz
	FU0/1f0ly3Um4Vbla/BqP0e1/LpBx+o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-08iLp3woPquopntoCMjQ1w-1; Tue, 19 May 2026 05:29:06 -0400
X-MC-Unique: 08iLp3woPquopntoCMjQ1w-1
X-Mimecast-MFC-AGG-ID: 08iLp3woPquopntoCMjQ1w_1779182945
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-48fe44ce385so28181445e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 02:29:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779182945; x=1779787745;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WltqGyX6LSgbCxoNJFtaPsurvESE3OwLgIknpaUUGUA=;
        b=CdWgIY1FyparxV8Dz4WoCyYcvFtBrIbLa515UVGEXsYDRm6PbBrWYcvC5g7+AuybI3
         92J3q8sL8fJTWOcT2PBub7Cm05zo3YfEfcCjY+6kPMNMlFwuiMo+l0yAdnXgJLE+aCcC
         yfIgnIMv0D+wHxUS2l+LvDYaI8YdFBAJpNgDqcKyPM6oY7PbeoxxtswM4d2lkm0WjayM
         d7uqSZ15ez73ZtlPQ1YuzdHW6cyNaleM07LD1g+QVvmrG8b478TBUMwxE8jBb+pwoNrX
         zpkwHnxXS80yfPkJgvxJHiNaIhGSvHcL1+cpzI9fqTm0y8RG6XSmdj71M1e8BJ0rf9hC
         PhHw==
X-Forwarded-Encrypted: i=1; AFNElJ81HSkCbQj8SCSmzze8AID5L2vdhpiwQznspOCu9ot107wjGpTUjjhfhv7dCwecaLb/iDjm6jKIGyNhxYzr6HFR@lists.infradead.org
X-Gm-Message-State: AOJu0YyLA6yT9spB0t0wgQ5Gama/tOEMPqRePV4/Wpqsa4RULtZVpTny
	Nsl1w13gKiTOk3j6lFLz8wA8kYVsBmIoC2V67IbUklqIzhfWSN4vANXikSDzqWo4J3ZQxjtPg45
	Tjtd0s7oPOQkt2sRTlsSqeJjQFfKzZ9ZACov0AXw8d+42oPFhbP6zOJms7nVHARoVIaQfR66uUR
	Mw
X-Gm-Gg: Acq92OEtNQVEn1Ju7s1slPjhxEx/y3wWJ50infTIFZvH+s3JBMbXHd2jt/mEOS++xYD
	/Gu4xQUCtEcPbPA7rKyU1cDXkbgBew2ZNjuK4U+TarnFuyabxzJzD7KH/wl/+IlPtkmvvumxI+H
	ev6tduels106WjRkdiA5RR0irU9xrIdvPs81Po/7lLQ4pEyIWt2Ihp5afmGAVQ3WzEIr8EtVsYI
	6xaAFgK5FGwLDhVG9S78GaiwA4YB7j7wB2Qf23HZJWSJR3Eefra4Px2Wlmh2Oxt9j4JJmRjgSgX
	U7Lx8+tpgQeuLkUiPPUg6YvAtDzgtpbk+L61igZgLVfseIzbiOD7zZvi9KeUJkmcLUMHPN5EmJm
	8QsPUlzHLVTJKkRvd+iKSLjbcMbgivHC2k/RCNGvK/hUGivSAeqfFy9w=
X-Received: by 2002:a05:600c:34cc:b0:48e:635a:18d7 with SMTP id 5b1f17b1804b1-48fe59b047bmr317369535e9.0.1779182945098;
        Tue, 19 May 2026 02:29:05 -0700 (PDT)
X-Received: by 2002:a05:600c:34cc:b0:48e:635a:18d7 with SMTP id 5b1f17b1804b1-48fe59b047bmr317368795e9.0.1779182944663;
        Tue, 19 May 2026 02:29:04 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.25.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febf81970sm144760595e9.8.2026.05.19.02.29.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 02:29:04 -0700 (PDT)
Message-ID: <b0e8121c-e2aa-476b-b8b0-3c799e712e90@redhat.com>
Date: Tue, 19 May 2026 11:29:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 2/2] net: ti: icssg: Add HSR and LRE PA
 statistics
To: MD Danish Anwar <danishanwar@ti.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Roger Quadros <rogerq@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Meghana Malladi <m-malladi@ti.com>, Jacob Keller <jacob.e.keller@intel.com>,
 David Carlier <devnexen@gmail.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, Kevin Hao <haokexin@gmail.com>
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Vladimir Oltean <vladimir.oltean@nxp.com>
References: <20260514075605.850674-1-danishanwar@ti.com>
 <20260514075605.850674-3-danishanwar@ti.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260514075605.850674-3-danishanwar@ti.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2L780kMO061Xxx69XE1-mE6ecFhKDf1ZpU8xC6UzIUM_1779182945
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_022910_585172_C1203E76 
X-CRM114-Status: UNSURE (   8.51  )
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

On 5/14/26 9:56 AM, MD Danish Anwar wrote:
> @@ -201,6 +201,16 @@ static const struct icssg_pa_stats icssg_all_pa_stats[] = {
>  	ICSSG_PA_STATS(FW_HOST_TX_PKT_CNT),
>  	ICSSG_PA_STATS(FW_HOST_EGRESS_Q_PRE_OVERFLOW),
>  	ICSSG_PA_STATS(FW_HOST_EGRESS_Q_EXP_OVERFLOW),
> +	ICSSG_PA_STATS(FW_HSR_FWD_CHECK_FAIL_DROP),
> +	ICSSG_PA_STATS(FW_HSR_HE_CHECK_FAIL_DROP),
> +	ICSSG_PA_STATS(FW_HSR_SKIP_HOST_DUP_DISCARD_FRAMES),

Sashiko noted that this statistic name exceed the ethtool string limit.

/P


