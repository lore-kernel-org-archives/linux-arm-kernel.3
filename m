Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99128C83026
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 01:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qkaiG6BzF1PG0uFh9m4Zeh0OUW/5zOqA3hn+Jr8DLpM=; b=sn/PJ3m1VDOUR0E9M44JKQZV52
	WgOCP0gpJJBV1U7U1/pPAxlL1bJHzHLjm1ZJqiEp1t1z/4KcHOX5AUn111jR+kXv2mOeISAqXYAnD
	mjGc/4bCqY+CtvXGwUqZ/EuvxnHnTPs28I06jR8t7agq/EptsFnxjdGyyQVLVc5LeOBA72UypKhhJ
	xXZhhbR6kMG8w7iphvas0XYuYehtNxzGAVjZ3kHmvy+/cLcTC3mE/gemCxjaCa0b6gqUv7e9aZJfF
	IkhRa0ncdIUQbq9U3U24KH5vP/72o2I6oGPcCCZR6LndMr4AMOngn8Cu4IwM+e0OkSXOmv5Gcv5Qg
	Am2Db+fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW3Tx-00000000ylm-3u9P;
	Mon, 30 Jun 2025 01:38:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW3Pl-00000000yV4-1Kea
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 01:34:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751247272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qkaiG6BzF1PG0uFh9m4Zeh0OUW/5zOqA3hn+Jr8DLpM=;
	b=gOdZCGhkHBhF2K+Ax6o6xbNoXi92JUHyje8UvYw6OaW/9dJihAQsuVpDuqsRupJcOl0nnY
	sCJnvPQKc2+KN3JDq5B11wL4ekaY5Cw0uAlGwcRB8AtZFKBX5uChdCpIngzn5eL9v0Nq+k
	1Qtb1duA7qTfeLFHM9EvL0dsuxL5jxA=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-391-QVLfqMUtMHOP_2DJ25gXLg-1; Sun, 29 Jun 2025 21:34:30 -0400
X-MC-Unique: QVLfqMUtMHOP_2DJ25gXLg-1
X-Mimecast-MFC-AGG-ID: QVLfqMUtMHOP_2DJ25gXLg_1751247269
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23827190886so17628585ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Jun 2025 18:34:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751247269; x=1751852069;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qkaiG6BzF1PG0uFh9m4Zeh0OUW/5zOqA3hn+Jr8DLpM=;
        b=u1lliBkuWyjO/Hz53MbMO3nm0gVsmGK2a7b8iuKrpvuoF7vT/Wza0FZxfGk3ANTSQp
         OLixK0ba6wQtJ7af1LjmIs1j2Pxkh+GXJAe7Zk74KX2u+f9a/A8dNQyPi2dR/CI+5wQ4
         gf2hIlZo7Tvu0+MfSnkyS7dY7Me73DhtwD+ZsBJPqPA7PUNfahkJQSfvRen1WkGi8Y4/
         vnDUOZ/HqqzwGMLnT/aWN6qhhz0TAgesZe0Zlo0fwvCDIrkVxkRUAyMsBvHROyu0FKDQ
         fhkkm6pzafIuT2pIJ++hHZCWvgXbjd2vlP//QpTWzyFX7J5W26jg53rDrb08LjMT0R0a
         SGzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXed6WeB8T8rgrlt+XMgl9S6YDtmRep93t2IA6J8g8Ij98URvM1yhdvKmW8WK8iSBxe64AxzdXwYHKxKQkjVDCh@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5FMoh0VJtYYuxscUcrcCxyDDvd17c90jPGFjLNwVkxgaBnIkB
	nwkLXn6WFlgpI+K0G0bbJPee/GyK5M6nxNjbdnxtClEQPq0mXdCVY1bCxXrg1slHMLQa6GbvLxg
	GjxqApsYraPakcnWLr17bAEquL9LiLItAFFpy/kKnLUA/3wtJm4nKWfgiJfsAJ6NUG/2YA9ce4V
	dX
X-Gm-Gg: ASbGnctVFGnyxZVjhBjoUfv5H4kRW+xyH+7SQ/gi9wqfV/uDELbcChEzD+KZ9H4I9Ri
	9V9bkNf0dX8C/mPbGH79GQ0Vr1X5XRstyYhY/k+geFrY7CkgB7o5lNrD0WPCwRyeu641SnXRdvN
	QxaMQxKOFLxgDwPhgo/KRA014mW+DW33mvUMw6zxJqyC6OSS+XnGkEBFX9jrTOs00WYK/wgwFAw
	/uNFxEqJn4C9o08hZwA5YDvdO2/K9hGYRHF6q6wxtRmG1KXuuyyKTzBIaiJ5aQTHp24UoDcov7F
	kHN401QuRt70U+JjIAKFapAGQowpytBznn8ftQILXIkysCaa0mgYFJePHHR5iQ==
X-Received: by 2002:a17:903:2f4c:b0:234:eb6:a35d with SMTP id d9443c01a7336-23ac4606503mr160851445ad.27.1751247269569;
        Sun, 29 Jun 2025 18:34:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2PQPQfZ+cIi6+VZZqGwMAkLWfLrl0j1n2vFaqhsTvqtq3OtrGsXBSiIbHCuTtKFDWI/MDwA==
X-Received: by 2002:a17:903:2f4c:b0:234:eb6:a35d with SMTP id d9443c01a7336-23ac4606503mr160851265ad.27.1751247269236;
        Sun, 29 Jun 2025 18:34:29 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2f17f5sm70543605ad.62.2025.06.29.18.34.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jun 2025 18:34:28 -0700 (PDT)
Message-ID: <1af300e8-4db4-4073-8db5-bffd8c0190fb@redhat.com>
Date: Mon, 30 Jun 2025 11:34:23 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: Enable EFI secret area Securityfs support
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, catalin.marinas@arm.com, sami.mujawar@arm.com,
 aneesh.kumar@kernel.org, steven.price@arm.com, linux-kernel@vger.kernel.org,
 sudeep.holla@arm.com
References: <20250613111153.1548928-1-suzuki.poulose@arm.com>
 <20250613111153.1548928-3-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250613111153.1548928-3-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: o1y22IvRNdTMapiYayyAX-6nWIQb0nu6oGPGIgpF5k0_1751247269
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_183433_432576_32AC726C 
X-CRM114-Status: UNSURE (   9.43  )
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

On 6/13/25 9:11 PM, Suzuki K Poulose wrote:
> Enable EFI COCO secrets support. Provide the ioremap_encrypted() support required
> by the driver.
> 
> Cc: Sami Mujawar <sami.mujawar@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
> Cc: Steven Price <steven.price@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   arch/arm64/include/asm/io.h          | 4 ++++
>   drivers/virt/coco/efi_secret/Kconfig | 2 +-
>   2 files changed, 5 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


