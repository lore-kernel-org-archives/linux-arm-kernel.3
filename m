Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6015E6C5EE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 02:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o8uM5ZCf1NAiH2GbTE4Ns0QI3puCq6vIOnKhBpmBZKI=; b=QuXazc3esAUNRG9MMpJ/2ykyhi
	1BkCX5OeVYyKkbWhN67V86xcAFGlrnxH38hXv+H2HMZUHmFm3FyLZO6phLh5jntw/Sb104ckdsn5T
	STKaarRaKe0EaJav3RHQ8hAeD+5zQ5MQu+BkXdxc1O9PugSFMLGxs3qg4riXpmzMLxjnS267+2dUq
	R2wYu+0WCwGqEqdU21BA9YmLadpWEk2e4uQrOPCjp2oLyyIqzYmpU8Tck1dIgFWMPo2CfEaZf+RvU
	oC9xdEDf65aHWg/6HPq8IvlRD0gjD6FQBZoGzYdIjMntbakAhefWqJ/sGqAGvwFW3GFo+WeOHxMU+
	1uIGzEXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIIyf-0000000845g-0hCd;
	Tue, 03 Dec 2024 02:49:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIIx7-000000083eB-1QdK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 02:47:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733194072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o8uM5ZCf1NAiH2GbTE4Ns0QI3puCq6vIOnKhBpmBZKI=;
	b=Y1mHAhR/BZcohd/UpwmQ7+WDioxE81mJt76BYfBlqSImAJYHWmlGBky+f65COwF5bcnSgE
	GB4DCTxWeIXBZEJdTHI9xSRr+irphb9xhgN7HQW9nWbcUyLa7uMFXJizd7l9+IJT65s+Nl
	VjL6cDzrX9c5iez8Jj0md6ihpRqV7B8=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-390-MvgcpjSZPjWlhaX87GhYrw-1; Mon, 02 Dec 2024 21:47:51 -0500
X-MC-Unique: MvgcpjSZPjWlhaX87GhYrw-1
X-Mimecast-MFC-AGG-ID: MvgcpjSZPjWlhaX87GhYrw
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2152c1dbcabso38000645ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 18:47:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733194070; x=1733798870;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o8uM5ZCf1NAiH2GbTE4Ns0QI3puCq6vIOnKhBpmBZKI=;
        b=k7QatXoWwpmNt/A29NibBSrxQ9jPqMGWBeO4msgvy1UWZjnoozDLYP+er8unFpfcHj
         HHHel+467CwuMZt5KKsi1co2aHSsUK+ANqC2NfgTqCYn0WqTWzihxYxAFS/nomDd4m+S
         goXE2txDXbPpaZslceRW1/2MBmVmShiD5J9IPMJVQ6XYRfU/VewN2RBiHfjqwfDg6Ei3
         iNW54N54Sjh/4G7lbh7dMuSfBtNZa0Ul22dEGK3R/NOQky6Ss+i+a2Kyc3Z5lmWLEGOu
         GLk+AG2gp2W8GQG0RPkWpOxd+oXv1KdmbNNjfSeSBdOgGyDZVwLgz5DeqOYnwAJnIV4O
         FNhg==
X-Forwarded-Encrypted: i=1; AJvYcCVZnaHOZRznYZI7PQZaJNZw97QvZFwzMDJftqEixK1dhkRqpf53PnFnJQb6wbrgsigvo9wfIJj3FhwbJkfXBX7u@lists.infradead.org
X-Gm-Message-State: AOJu0YwCcNzEu1dHrjfatUxy8lkkzw6Diqjq9Es+nVb7VbfS88zAWrKp
	W/Zvju2KBn4RFs//D9mXL62p4UhfkmEV8hjKMEYaZ0NUG4yQUz2q6RZ6AHsjQtyqPnd0ZR7e/ua
	FjbWpqmM3PDjJH5J5+pg6AADlH6ZLid/p5miv07GBsgNpIizYCgFUAQey4+yocGop6LpMJJQw
X-Gm-Gg: ASbGncsSHRWXVsTHBIQVrY7lX71U2up0e5+bOtizaeeXVRWtQRJHMKirO5KhBHuUZqM
	72OYD5c0QOiq3J1At0Eav1YvnaLSlDok/GgWHaQJvX09A9gWoZUaKSwqkKcSPU9pS2bv2akdrtL
	LWhv4T8pR09xCTvk0sKLmgRoc35/s/KdHtzzAPi8x0Yw5Sijd+LClujN3PM/k2weFG7/zjZGLWE
	toqoYyyOOMDqXM8xvw3u3U9YRqDwIJNWoCkEbRk/XRxSiNDfew=
X-Received: by 2002:a17:902:db0f:b0:215:5d8c:7e3f with SMTP id d9443c01a7336-2155d8c8072mr148391255ad.23.1733194070092;
        Mon, 02 Dec 2024 18:47:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzeFJ+2ROTZvJnL0D3su2mbemsSdeUnJmTDHLP0c4GM9H7s7uGaM2AzZpaQluWaupBDBrvSw==
X-Received: by 2002:a17:902:db0f:b0:215:5d8c:7e3f with SMTP id d9443c01a7336-2155d8c8072mr148390975ad.23.1733194069802;
        Mon, 02 Dec 2024 18:47:49 -0800 (PST)
Received: from [10.72.112.107] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2154dae56e8sm59832805ad.19.2024.12.02.18.47.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 18:47:49 -0800 (PST)
Message-ID: <e0e5d74c-5e5e-4448-aa83-9187daff5b2a@redhat.com>
Date: Tue, 3 Dec 2024 12:47:44 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mm: Ensure adequate HUGE_MAX_HSTATE
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
References: <20241202064407.53807-1-anshuman.khandual@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241202064407.53807-1-anshuman.khandual@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dTXrGkqLI7Eq8Ral9NOGcW9jh0i-CN0NxFLMe3BW1z8_1733194070
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_184753_460162_4E95505A 
X-CRM114-Status: GOOD (  11.75  )
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

On 12/2/24 4:44 PM, Anshuman Khandual wrote:
> This asserts that HUGE_MAX_HSTATE is sufficient enough preventing potential
> hugetlb_max_hstate runtime overflow in hugetlb_add_hstate() thus triggering
> a BUG_ON() there after.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> This patch applies on v6.13-rc1
> 
>   arch/arm64/mm/hugetlbpage.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


