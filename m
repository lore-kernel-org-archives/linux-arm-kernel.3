Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7F2D3ABD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 17:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TGkctB5w2DgVNd65llyIf6DBsV2rcrcXeYWXerAzjMs=; b=wkD8v26BVcjTn6426n9mB8Gcvw
	HIdxJvlJZcu6cgoC8RnCZNQ1oKFos3XTSpuKoUwROGB6a7u1w1bizpdZe3Z+KikhS+Q9Yrwyp6DGb
	omSxfgMt7iBPN8xq5Sojjyxq/L/39+GiYWm8F5i6Qr/sRlOmZY2C4JdLYHZEPDJmKKwc+XHnpUkSg
	nrIOfKKCqd0p/Cg9uqUnrX//ngD/jF+7vhjD1ZhTYQLG5FulzsCaX30ABy2oBlfTUWHmE/GVHKpdV
	Ii3myxfIIRFAovyJa4MJAlX9pQlvIzXoL3YqxP919JF3ZcDygnT5mk4F5o/rXoIlem5/W01W8gNEl
	N2IQwKEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAYCA-00000000ib2-1oPC;
	Mon, 11 Nov 2024 17:27:22 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAYAN-00000000iK3-1EII
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 17:25:32 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-7181a8af549so2980702a34.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 09:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731345930; x=1731950730; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TGkctB5w2DgVNd65llyIf6DBsV2rcrcXeYWXerAzjMs=;
        b=IBzRXcmUjg0uOc2OaSQ3O1Tcm3RUMj9ffunS6yYptbF2vRY0YY75XpzV3ANs3u/1PU
         rzIqApctqOh4c4GEGR0aGq8/79QzULrQChhxSucdhihiRINB6ldA5KdFsD4rmA9PHNhb
         4A2s3o2TKi9UW7SjkLncssReFY+0A5Ozt0jL8fyzcG95F62JBugE2lCc/pRTiQEh9Ygx
         RDtIMBRBJyw2jmW69AKFSJaJiKufFgbAWLyDQNgWrselb+02bpd7wAR/luWmjbg53VU9
         LvfLRmp/8UNZr6CLw2Urib9Z1QDWwy6Jq54ekCyHina/eCqdURvfvt2KE63e8HLGsDW9
         Sy9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731345930; x=1731950730;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TGkctB5w2DgVNd65llyIf6DBsV2rcrcXeYWXerAzjMs=;
        b=iDJNp9ezhSEzVuCevqDYSwikvRwxbKYIzFw288Kj3rZpASuNyVYYQ9zIqJ1dkSGj/l
         t2i1O69YdQEPHNgaIPEeiulIIyonJkXFIMvYlhO9sQtxeIjijES/v+5/DK2kfTNdh9FI
         hiWXYrBxnY7CQ9Y1BGAa5ZAcMfAii5PpkRfT/s49Zhk5yT/PMDivYdV46WUh2LTL9RRj
         2YJVrg4gRij3fX9fOToDOkmN33RcLaP972AIvq2OMJk7d6URQLYh4s2bE5e8wwPvpQBO
         8oOW5TemPIDDCVWObvwP0oTW9hziU7L8z1yD0DEhyJC0jgKhtNuwfpji+rokBZnRC/bs
         jt1w==
X-Forwarded-Encrypted: i=1; AJvYcCUtPxKvbpiVRhS2IsEO98H1iQ5UXeWFP7RXDWrNOqc90s7CGXK2PVtwRCViHBOND7OPg7f+FrzoxtF2WfvP0qrn@lists.infradead.org
X-Gm-Message-State: AOJu0YzS3plD8I8K6/xwhCzdn1g8vOdIE0GLXfd1E3kfnHiwji3/4lCM
	j+m7Bp/dw8Ric3elZ/NiOWnASW0aE5Nlf2qWkOXIMxSFqc19ibsVXOIqnCfx
X-Google-Smtp-Source: AGHT+IGSE8Tlbmi62yQY1NUtFU32C22MR6/icQoBaoeQ7KQoKvlXZzIHByJ3L7g7dUjxzUY+Qrxb5A==
X-Received: by 2002:a05:6830:2116:b0:718:e44:6da9 with SMTP id 46e09a7af769-71a1c1d2fa3mr12073671a34.11.1731345929640;
        Mon, 11 Nov 2024 09:25:29 -0800 (PST)
Received: from ?IPV6:2605:a601:aa57:7500:c5da:8ec9:bee9:a72c? ([2605:a601:aa57:7500:c5da:8ec9:bee9:a72c])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5ee49527467sm2018955eaf.20.2024.11.11.09.25.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 09:25:29 -0800 (PST)
Message-ID: <c96c7e05-31ca-4145-a8ed-d74a32770011@gmail.com>
Date: Mon, 11 Nov 2024 11:25:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Pruning obsolete BMC devicetrees
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
 openbmc <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <b386a9e98412b06b6186ee5dea81ac6a69bc4f8b.camel@codeconstruct.com.au>
Content-Language: en-US
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <b386a9e98412b06b6186ee5dea81ac6a69bc4f8b.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_092531_365873_06E01DB7 
X-CRM114-Status: GOOD (  10.54  )
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


On 11/10/2024 10:49 PM, Andrew Jeffery wrote:
> Hi all, We now have quite a collection of BMC-related devicetrees 
> upstream. There's interest in whether we can prune some of them out.
Thanks for doing this AndrewJ, it's always good to keep things cleaned up.

> 2018-06-22 876c5d891c9d7442d2734871317bc6480cd9f80e: 
> aspeed-bmc-opp-palmetto.dts 
I think we're ready to call it good on Palmetto and remove it. I'd like 
to also remove it from our CI job.

> 2019-12-03 53820e00aaa173db268e0288d0407806539b4c3e: 
> aspeed-bmc-opp-swift.dts
Swift can also be removed.
> 2020-03-06 fa09a28ca3e966582d6d92ef1536de360c8b194b: 
> aspeed-bmc-opp-zaius.dts
Unless someone from google disagrees, I would like to also remove Zaius 
from CI.

> 2024-08-02 1c8b6faf882de15fd62094e08b2ca5bf7870b767: 
> aspeed-bmc-opp-tacoma.dts
Tacoma can also be removed.


Andrew (G)


