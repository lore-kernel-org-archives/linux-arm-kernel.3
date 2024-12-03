Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22015E6C5F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 02:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cLmg0HNuVhVbc0Ci2tnRLaoOQXcxlr9qcL/zPSb0TYw=; b=fFyMmeZU5n2JZsg4HVCXfMTrLY
	Da0/5keJ2z2nq+cs/7B7+pQvW0xZ+TfMuliAP8NoBKQ72XFR9GfP2QXcj8iZ9aFGwpcStMprVFdnz
	7sUUpBtyO0CmiMiFZEG7i+OZjy1Vdo4UfwJN+EitsqkKpZCKVSlpp1Cd+HBOORNkoWQPy0r+r3Uyv
	b9sEQ40COkUCkOeZXNkMoR43UEeVUyeP105dflnRz6WTtw+JrNwPgORqkc6jWQDvPp5jOaD/Z8eGj
	v5lVdKoSB3KcOfjC4zftGh4JdQZURdx7X4QoGh/asS9ATiVKSlLZim0Jqh7czqZBMd1S6t8rzG2hy
	vrViH1Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIIwh-000000083YR-0o22;
	Tue, 03 Dec 2024 02:47:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIIvg-000000083MQ-2rjM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 02:46:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733193983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cLmg0HNuVhVbc0Ci2tnRLaoOQXcxlr9qcL/zPSb0TYw=;
	b=VpTYgsSxiVe+uFZxW60PKnbv20VTfMIv9kiXhwemMZ/hsZgo1QMwTXvxhhLEsfB7ftbd+k
	ae6uKkULtdwX40u8xC3c4KN9kTCcBO7pJe4332XWXthY6RV2hVsvq/jj/cFtj4jvpjpqKT
	oKf/EudP1/oFfVZrGLCypFU3sVwBjjw=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-0Pv6VJnsNx-MV0yiH0g7Jg-1; Mon, 02 Dec 2024 21:46:21 -0500
X-MC-Unique: 0Pv6VJnsNx-MV0yiH0g7Jg-1
X-Mimecast-MFC-AGG-ID: 0Pv6VJnsNx-MV0yiH0g7Jg
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2157b83f656so27255655ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 18:46:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733193979; x=1733798779;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cLmg0HNuVhVbc0Ci2tnRLaoOQXcxlr9qcL/zPSb0TYw=;
        b=RtKQJOOPPDhrI54S/LGTsvbH1bwOHUt6SRMkUORPiBMOat3olWhoZmtK46/hPHcJC1
         AHFYX/hOYXC00+LQhwdlRGJlmU5ZCYdNy5eAsCC5ed0Pov/7+jCkoOC23tUULDbH6YXW
         0aqpIqYnOLHCjQTvPsjNFn9+QmTxeQ7Y9kg2x9Pac2Ky4RG5SKwm2KC8mDQE3lmBWauZ
         tb9sbBSt7z4RZKpRI4H3g4X2JiXorfDO5MvSVBY0CPMp3WggWBV2oFq6p1LLdtL85Pk7
         Khcgcmyv6InDb37qcceeBA8aN1B84NMt2L2ELpG0TjNOyo6tANJEArVl5jJYOpA1VoWo
         +XgA==
X-Forwarded-Encrypted: i=1; AJvYcCU9OevRvD0G8ks3VV09emWbya5Ah9jMZdzRCmF8gjR+fKIwq/3qA/eomwIXwDt1q1v6nWrWqMunZ7s61OeXZEXK@lists.infradead.org
X-Gm-Message-State: AOJu0YwWTSyCVeOihyX7EsHT7f9Fx7OSszvBex8/iQEYL8YGT/R9kvdj
	WJcXerk1jeNc+cTKhmA5kMkjodfojfLitzxnTDm8wJi8J0agXnQDNT/ap611LXtQsIiA4WZyJ1u
	ltK6B+4ds3VRAOIdLGSzp25/pG8L7MGJJED8LbX+TadEo1CDeyy+C90ZAk0BL1SH3kru6cgBr
X-Gm-Gg: ASbGncthEKC0AgW908o7mZ0Xk9YZH5U1o1ciyCfI/RbKiosAH4rTF1wuuWeOlyAgxR8
	oGq21h4FzgnVu4PKRl5ooeGRBeWkiH2A5kkJzqV/Eqs5FMnHaoGzd/oxdiwZun+VHr1AzlxfmE2
	J+XFdPVvwgSJVZZqoLbgCihZZKaTfLyUbHcIYVuoMBG1WNLi/ZnMNjPfDmN7tU6cSPo9S/gFJwW
	EeokORUySLj2aSymQegE05e2dL/LqHKFhm5JoOulbxbQYLBtI8=
X-Received: by 2002:a17:902:e841:b0:215:9a6a:63cb with SMTP id d9443c01a7336-215bd200df9mr12107375ad.28.1733193979587;
        Mon, 02 Dec 2024 18:46:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfseCusa820FVRmwFbT0mZlAFscpctykYf9htwJewCjZEfnFSGZPbVXSuGQjueevB6XoMygQ==
X-Received: by 2002:a17:902:e841:b0:215:9a6a:63cb with SMTP id d9443c01a7336-215bd200df9mr12107185ad.28.1733193979272;
        Mon, 02 Dec 2024 18:46:19 -0800 (PST)
Received: from [10.72.112.107] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2159ebee334sm21262215ad.67.2024.12.02.18.46.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 18:46:18 -0800 (PST)
Message-ID: <65823dec-8af2-494c-88a6-0d4683cbf5df@redhat.com>
Date: Tue, 3 Dec 2024 12:46:13 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mm: Drop INIT_MM_CONTEXT()
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
References: <20241202043553.29592-1-anshuman.khandual@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241202043553.29592-1-anshuman.khandual@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: umCuP_A_vOzj-slNKhkzjWOhvrIbPkiVmoqp6AgKP4c_1733193979
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_184624_803841_C04FF4CE 
X-CRM114-Status: GOOD (  13.71  )
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

On 12/2/24 2:35 PM, Anshuman Khandual wrote:
> Platform override for INIT_MM_CONTEXT() is redundant because swapper_pg_dir
> always gets assigned as the pgd during init_mm initialization. So just drop
> this override on arm64.
> 
> Originally this override was added via the 'commit 2b5548b68199 ("arm64/mm:
> Separate boot-time page tables from swapper_pg_dir")' because non standard
> init_pg_dir was assigned as the pgd. Subsequently it was changed as default
> swapper_pg_dir by the 'commit ba5b0333a847 ("arm64: mm: omit redundant
> remap of kernel image")', which might have also just dropped this override.
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
>   arch/arm64/include/asm/mmu.h | 3 ---
>   1 file changed, 3 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


