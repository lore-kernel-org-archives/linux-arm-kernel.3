Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8ACCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 01:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cYWyKNlYaxtpet7IUj4DYu+DKPKVpLXZerwfq1sZgQw=; b=Q9mEuurXYbLoQwGGjNPToQOkxT
	Ntht8RbI2U59luaKdFNNZkC0JDqPHPvUKcCziTPtEXSMX9m2iMI0jj6DAEaZDyngM3cgxvRSQbtfJ
	KjImbfBPUwZ3MH6nMNDGPprF8Pbru7w+nWsn3lGOQHpBLn564IIssB07xxW+aw7dwVAmye+BelrFT
	GoHOrJdenhvrCHKQlCe5GnSRkaFQw4F1hVFcPBcceijo5B4Zuf4Eld8MK5mpEmBf8fRKyUQmBPmBM
	Cg358x133eK1y+XricsL7JfJZiPXZds6cm3ymCEoAoM7LkwZzpZR5P8aijbTred3REa8tTFtkek4S
	CX87LZGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIGMO-00000004ZV4-3yzI;
	Mon, 10 Nov 2025 01:06:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIGMM-00000004ZUb-2Ls5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 01:06:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762736776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cYWyKNlYaxtpet7IUj4DYu+DKPKVpLXZerwfq1sZgQw=;
	b=CXtqgEi+1sz2lcANw/+uzMWqfKRf8IlzxpFq5si7wtm/TCrZ5x3M0ZCFs68F3BZ6+lQgOA
	6WbdbxGav0Q3T95z3fo9DijXloUvo1w/PG8bMt+PeCB8s2qk0WPuoPvFda9h11oSe7jxCI
	qouFt+rvlz98pqy9W4uvEdFDYY/SyUs=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-248-e2-1KU-AOXa0W8Cxij-DBQ-1; Sun, 09 Nov 2025 20:06:13 -0500
X-MC-Unique: e2-1KU-AOXa0W8Cxij-DBQ-1
X-Mimecast-MFC-AGG-ID: e2-1KU-AOXa0W8Cxij-DBQ_1762736772
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297df52c960so44450375ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 17:06:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762736772; x=1763341572;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cYWyKNlYaxtpet7IUj4DYu+DKPKVpLXZerwfq1sZgQw=;
        b=qGbZUofT2nBpIqJSWDReZ4zDA8DosPKyGlpU4PN8KblEGg6qdiZ20R6JdJdRWKyJIA
         SE3pqQxsXPGvUxJcnbWrNk5RW6334wlxOefNvJgsBFeadtxOj3wmXnBtnNLX2eJy3CGh
         JbwNSLlDKKsDm1eNHIl247e77asDn6PU+I3tIXlwXsBmB+kCpkltDgz3LLRb0N2WMXiB
         hxs2MCG1MTq6/Iu9Opo2lcvGU2UZCfW28WYBZqhWURpGv6o0liVs45CN9ifv4mVtRAwR
         /+U4186+GLcSiPN/pF6BT7jebUrMpafPwBKBIbHye2vsrWBdXk78fAGp04lLXKZx8yF1
         gSkA==
X-Forwarded-Encrypted: i=1; AJvYcCXxqMrd9IIFqP7gESAsmBbXfwX8Wg1V5lSIYd2uwHqcFgRwPYFjt+oRMxqYGmSTrM+m8X95qRAMT2SVEkVN+an4@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5plP+/knM0BUi5frZgKn8FvbdgZkWHIV02El8FxiHXnA4OqYi
	lIiitTAafn41fbPp+Al8pDNXJYI/d5Z0mbI22WBpkoNKZ1jX96nWdy/KyP8HN4scqCIojvB2wdo
	VEJsFHjnE18a5XHcqUYpQ9kOx7lrJ8CKGWh5KvB0pbPoC/ch/nNFEnAQv65XYkXLkqn9qYkcEth
	6f
X-Gm-Gg: ASbGncuiz/sbgtvNXcMHla+zqH9QSXomz7GMm4+VI7QAEP9rjyTfqyiGk+F8JSRXKnC
	Es4ohhGsqb8s+DpJLA16CevSSuzkbAQsju5nT7KwXvkGnhxHAsi4d3cHTyzE8bXn9TaXj9Bl750
	rh0ybSCe9CVNeqV0PG8wwM9PuBo8DJYCBgeNL2cttf1GlmKw3T3WQVl/KuZYpOZygBt8/R1b0Nk
	umoKtGpNH+nSUbHCBv1dDpQk4KAno/o8l7sByT+d0dskMAnkeoD+rerqgqCyrMOhdx2hEOjOd1a
	hXqlvD+2QhS3QeOnYFgj/hGMUyJ+TwWQ4P2WjrC9hYMVM1JEdWSFZKkVlRCCFCn5r6PTq6fWOEO
	vYANyYN/bvk6WprVkMc3uo0LFX05hRbJTVtr9ZEM=
X-Received: by 2002:a17:903:1b10:b0:298:2e7a:3c47 with SMTP id d9443c01a7336-2982e7a3d03mr3138695ad.42.1762736771842;
        Sun, 09 Nov 2025 17:06:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFF0CFiEoJ6ONU17kU1QFkRvQ5VxAZyJkrEh15FlCVoOKf8DubdfC/6/KNrhSF5I5E8PZmNrQ==
X-Received: by 2002:a17:903:1b10:b0:298:2e7a:3c47 with SMTP id d9443c01a7336-2982e7a3d03mr3138115ad.42.1762736771483;
        Sun, 09 Nov 2025 17:06:11 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-297d6859a92sm75549945ad.88.2025.11.09.17.05.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 17:06:10 -0800 (PST)
Message-ID: <37725bd8-768e-4b7a-b202-9068f5e14257@redhat.com>
Date: Mon, 10 Nov 2025 11:05:57 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/33] arm_mpam: Add basic mpam driver
To: Ben Horgan <ben.horgan@arm.com>, james.morse@arm.com
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 fenghuay@nvidia.com, gregkh@linuxfoundation.org, guohanjun@huawei.com,
 jeremy.linton@arm.com, jonathan.cameron@huawei.com, kobak@nvidia.com,
 lcherian@marvell.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
 rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com, sudeep.holla@arm.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com
References: <20251107123450.664001-1-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251107123450.664001-1-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vdndaiMjGlXDSiMGMPW72D4CCw6XD7SeBLUjqQY6-Po_1762736772
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_170618_673489_8079F1C3 
X-CRM114-Status: UNSURE (   7.32  )
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

On 11/7/25 10:34 PM, Ben Horgan wrote:
[...]

> 
> This series is based on v6.18-rc4, and can be retrieved from:
> https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/driver/v4
> 

Run booting and kunit test on NVidia's grace-hopper machine. The result looks good.

Tested-by: Gavin Shan <gshan@redhat.com>

Thanks,
Gavin


