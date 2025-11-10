Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 204E0CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 01:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fp/vQ8A4fCVWTHL4CZ8vIUZDQ6q0Bi6AYYIP+rrLgSM=; b=wKcIDCA/kgD9ckQisWDIk7pCJ1
	NJAAeG+Z1cgUtcBZh0HS7/X9FgwWjKGGLR+ekA9mv+x8XKHFhUWQx4N65yJY8GVmeYYeggqVjwANL
	Fxmicad/OAtJCeDyBS1pyW94Nw+Qs4NSyH+ERngdYpaVxjQsWqVpFqRa1aJmFAU89MUi4JvdUSXmq
	gL2xjstvtDWP9jPKdbsqWJX6Z2Vhx8xRDlZ/lZdhEbO06ZR+UP5XYEEqHp+5QE5qOns2z030L7Tcu
	N0AyH6Ivzwgp+khEG0FtOc8hFD5p5g/4TnqAYKrjCFPf3MZG2by6UdkWBQdowDYAghhSLCAbXXpoV
	z3aOJKXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIGK5-00000004Z9V-1KzM;
	Mon, 10 Nov 2025 01:03:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIGK1-00000004Z94-18fg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 01:03:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762736631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fp/vQ8A4fCVWTHL4CZ8vIUZDQ6q0Bi6AYYIP+rrLgSM=;
	b=HgIb0oiC9+Rcur4wjEWScHpdthKMfpx+twVAQ8bwai7L1Pg5HpU2GJXKGyqTxZh2EtEiEc
	pGBnO77RyhopdVQTHXArH5FcGv9hVS+5YvdX4SHetdVz2cMMPxJvzYpLfpMbqJhaULaSz6
	0xPaw2RhkuvoG9vzqFLhU0EcPuJKL38=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-487-lDRzgLIdPN2SnH9_4-GnnQ-1; Sun, 09 Nov 2025 20:03:47 -0500
X-MC-Unique: lDRzgLIdPN2SnH9_4-GnnQ-1
X-Mimecast-MFC-AGG-ID: lDRzgLIdPN2SnH9_4-GnnQ_1762736626
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2954d676f9dso21280635ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 17:03:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762736626; x=1763341426;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fp/vQ8A4fCVWTHL4CZ8vIUZDQ6q0Bi6AYYIP+rrLgSM=;
        b=iKohFIq6/rEWIZT4XROfYj5PO4wyqDijlf6ihwT8WojEJXRO+rgEVf7hXFbNOMSfIS
         BhfdPUE1LAXaFBR8mJ5j+9Nh8YbBCdLKAbr6skOOoc/iOpocuYvRSBOYQh2N8+uJtyfm
         k8aE0s4I5duuQCNeLaBq2r29kaYjQDhCG4Om7m8tH/Z5pbx0xMzZ9MbU8wu+q8BoZ89E
         qkh5NhGodS2Z9nkLtFZsNs6ZnA/PZAQ1C+i/C/wqrk9s6Hd9lETzqEA2afMe0Dyco1GV
         9gNc40ECsDJ2VmSm5bA+ZPHX7QuYsEoG/ZHmCKu1aMRBqP8R/JivVezcsQD2xk7BAMoy
         LljA==
X-Forwarded-Encrypted: i=1; AJvYcCVnIA7fcvlNHw4IiqGI/4n2LbUSgLLSFk8wzrEHZfY5WqOEuSiNRLMnI8WHM0E+uvNxZlJPyRQ/Y+OgQ4OYw9lP@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2kdyKtvnUnqG3lVIMxUCKzdskTc9Hsc2aYvZ4ney/iCgwExvm
	lbiGE3CnNUGkhCEcBPQbOhSWPOSzZ3srT3vDJRXQIfmzQAiOXxFKuCLWpNjIXhTpvrdKAPeqOEK
	Lv2MOI5NFsnw0dxsqDsgiFNSCQER7T/lEOucHl7ASAMy72SERpCy/Fu4qxNyglJbdAglXsJoQP/
	XN
X-Gm-Gg: ASbGncsK2Q5FexYWGW6Rri6yYiA6sNxfDF8GZIzzRYetCHMB0+9WNs3037jBDlxP2LH
	H+TZq3LNQC/ujjxhxVxtFH7ZE6SLT24OHuUfWZEf8tutlmWN6+EgFbW24O0BOu7dm6e6r8MSUWr
	kxN7Qh+vxhPo4WvBCZqd5SkbEADjYMBbgaSMSBs0FiUQAy7R/D7m0xVnNXbPmB+pXOqRYE6UXHj
	GJL43krKS9uCo04VA0HIUKnGoFOabya/B7BiMY9oeWTbpBXsgrUik+UqTzXA3ztOeQdeoK8JygX
	ZTBdBebwpdYNtHyP/9L6KqtHjFtZ8kpZgv3gWeD/yDJXaNy/J687daBTGEvW0DVdztcXCFAKYYw
	xPba/Wy+XtHMF/es26Ycgc3gmXWPSDnYj47UqDCg=
X-Received: by 2002:a17:902:da4b:b0:295:24d7:3792 with SMTP id d9443c01a7336-297e54030a4mr89617125ad.1.1762736626561;
        Sun, 09 Nov 2025 17:03:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEflOEbjXKgiwLnCEBh3CST680cF3GuQpNEfibt8t7UBtS7/A/XhpJnakWl13KtFWAXgEGWHg==
X-Received: by 2002:a17:902:da4b:b0:295:24d7:3792 with SMTP id d9443c01a7336-297e54030a4mr89616825ad.1.1762736626020;
        Sun, 09 Nov 2025 17:03:46 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650c5e3c5sm126117355ad.43.2025.11.09.17.03.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 17:03:45 -0800 (PST)
Message-ID: <8a382455-1915-494e-8cde-04407696cfa9@redhat.com>
Date: Mon, 10 Nov 2025 11:03:32 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/33] platform: Define platform_device_put cleanup
 handler
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
 <20251107123450.664001-8-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251107123450.664001-8-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WoHq5431fVgey8V7ooSuK7NqnjqO2DusxxjVv9EUCE4_1762736626
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_170353_858939_6CC4FCAE 
X-CRM114-Status: GOOD (  11.26  )
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
> Define a cleanup helper for use with __free to destroy platform devices
> automatically when the pointer goes out of scope. This is only intended to
> be used in error cases and so should be used with return_ptr() or
> no_free_ptr() directly to avoid the automatic destruction on success.
> 
> A first use of this is introduced in a subsequent commit.
> 
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   include/linux/platform_device.h | 1 +
>   1 file changed, 1 insertion(+)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


