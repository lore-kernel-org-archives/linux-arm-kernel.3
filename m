Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9021FCD585D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 11:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+eDzB+NxPTMSfU1QkUTyVqhC+G+UiTkNvq2nlq1j3r4=; b=fBNjhMO3dxwM8GziPCwm9sGjb1
	1qAwBJXNgZQsxAUJeD9MSivBPYPQLVq072DFSKnzI4lTn6OuxWg2MU89zlzYNKnpW7CmZ/B07Hs0E
	RotmKMtZP47tSxgeIYc+0ZphBA1t+4dWjyXzRMXf61jnTRRfq17c+ByAqCJoM8oDHEn4zAHzk91Iw
	wifWsiytK3rlG2glZUtD3jEv6+KwTwrq/1sPSWbtTmyoI4HLvASsWh4R/br+ysb4MfYlGXsl41n//
	YDo6+hT7bi8GsBa5yGyKoOGLtIhYVwd2uUxLRJg1eIsfeba/tli4FmBAPjErGLjOUBNGqkqcuAlX5
	1l6iLf8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdRtm-0000000EqJH-0oLx;
	Wed, 07 Jan 2026 11:40:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdRti-0000000EqIb-0rgD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 11:40:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767786016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+eDzB+NxPTMSfU1QkUTyVqhC+G+UiTkNvq2nlq1j3r4=;
	b=S1qnzs8F6L7SzcQUxIi03q1mEZzNxyz1EMSVnO+iEpNTNKozyKaDuSLro/GhqwEyssa/nN
	ngQ/qZ9A8HLv/CxKPSuFlCVr+YKjDgesGaLSXu3w2RmGc95loHN18bso9a3xqkK3UimETY
	DKPljSRzXZ/ykJtPQ7e1HfjfSFEAnUk=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-g-EInV2GM7OZSoraYN2l_g-1; Wed, 07 Jan 2026 06:40:12 -0500
X-MC-Unique: g-EInV2GM7OZSoraYN2l_g-1
X-Mimecast-MFC-AGG-ID: g-EInV2GM7OZSoraYN2l_g_1767786012
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7d24bbb9278so3846268b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 03:40:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767786012; x=1768390812;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+eDzB+NxPTMSfU1QkUTyVqhC+G+UiTkNvq2nlq1j3r4=;
        b=qHTUKydRg+osMdU0ncZIVA3I3E8WZ3Z6TJvSaHq2B1xjVgFzG/evXyl58c8ZJT2/AU
         xueFWHqVXtQIi4peFR/v+k4E1nA5lqzOYdsjKc8r8jRGATYrVpcBP3Ee2PdcfHbFdR7f
         +YnOVDWbKFa62u0qBONZB/dnnSpuntipYI6FSMgjHrr4NFeEMYpjDeywkdkI08sBNGxC
         t6QsediDy18q/LLU/TOW2aj9nukiI7X7P+rwkuftLCHHzFDf1YMMWaRoMIn+/vBpYecG
         99Hljrzc560sLr1PltkqAIo5kFjoTOr4OL5sTP+JJVgzz0kGyLXCmTkroG2r3Z7suF0h
         ekzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGiFazH+eEaoZJRczJYJkUu0wVEaYL4Z2gKKyqtrjNtWK79eC34GUAS2JW27vRJqtZzVLzp3uvakQSXMYdrszS@lists.infradead.org
X-Gm-Message-State: AOJu0YyR1LJ5NNVkD2LYbE9xfjV6n8LA9+poH2e3GC7A33mD806puKUJ
	0E6rGX5/+yV0s+b166/Z/zEUk/ksISzT9GY5ZnFbwrR4k+7qSUkrfrvSRyfMs01K18rTYLq28to
	bfMdaeI79h63+riWI1mEQ2PeTDlBorMGJFhc5LCebEPoNq1HVm0eErka3R/LJbNms8cSwpaR2hg
	Lc
X-Gm-Gg: AY/fxX6mRAFV9hcp5JZgoxslgsQFrY4r+81KXSjDdLb4ddEciiSncp+Amd5XHLd29+2
	z72liNcK4FeBNRhFT5Xd7EV6+eXKST4yFHBblF7RpbZ7YOjxyfELr8tLo6cN4tZB6sKCTftohx0
	8KAFqjy8+aODdiAN/cxawOPfXTJuETgyR0e+h5VX6lPK3fXj7lQEwg4P37pCtSvaHwJTA2KxMZi
	/1LaXhN+Hwt3wutKzNhPDr+qRRvjm9GmU40W4v7dHgNsJ1u92UaowN+m3SzSXObnhpHAkr1FE/l
	oNP4ei83/cbU/w+5xbz/FeUj7syOHUEmZTmn4tPrLjAzobYbwxUATioIbULvxy99tyI7YvMerM6
	c
X-Received: by 2002:a05:6a00:1d20:b0:7aa:3642:2173 with SMTP id d2e1a72fcca58-81b7de5a491mr2214376b3a.31.1767786011723;
        Wed, 07 Jan 2026 03:40:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEGXM4qkZ9fSQv6m8Rd/JdXyBCGgbb2bJvKNCFco+IWIxgyQ+1wvGxJ3YwuXhQ9Ytpo9HhqWA==
X-Received: by 2002:a05:6a00:1d20:b0:7aa:3642:2173 with SMTP id d2e1a72fcca58-81b7de5a491mr2214356b3a.31.1767786011263;
        Wed, 07 Jan 2026 03:40:11 -0800 (PST)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c59df961sm4792767b3a.47.2026.01.07.03.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 03:40:10 -0800 (PST)
Date: Wed, 7 Jan 2026 19:39:24 +0800
From: Coiby Xu <coxu@redhat.com>
To: Rob Herring <robh@kernel.org>
Cc: kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>, Baoquan he <bhe@redhat.com>, Dave Young <dyoung@redhat.com>, 
	Kairui Song <ryncsn@gmail.com>, Pingfan Liu <kernelfans@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" <devicetree@vger.kernel.org>
Subject: Re: [PATCH] arm64/kdump: pass dm-crypt keys to kdump kernel
Message-ID: <aV49pPV3OViTDe8c@Rk>
References: <20251226141116.1379601-1-coxu@redhat.com>
 <CAL_JsqLEsUV34tMZWSMc6w-xDV=M0JpOmS95TxrtbbBMRoD3Jw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLEsUV34tMZWSMc6w-xDV=M0JpOmS95TxrtbbBMRoD3Jw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7HxTV3v9c3RMX9JcvWfxD0i3Uig0OSDX6V0p4KH02oc_1767786012
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_034018_311170_16D2579B 
X-CRM114-Status: GOOD (  20.79  )
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

On Tue, Jan 06, 2026 at 09:44:37AM -0600, Rob Herring wrote:
>On Fri, Dec 26, 2025 at 8:11 AM Coiby Xu <coxu@redhat.com> wrote:
>>
>> Based on the CONFIG_CRASH_DM_CRYPT feature, this patch adds
>> LUKS-encrypted device dump target support to ARM64 by addressing two
>> challenges [1],
>>  - Kdump kernel may not be able to decrypt the LUKS partition. For some
>>    machines, a system administrator may not have a chance to enter the
>>    password to decrypt the device in kdump initramfs after the 1st kernel
>>    crashes
>>
>>  - LUKS2 by default use the memory-hard Argon2 key derivation function
>>    which is quite memory-consuming compared to the limited memory reserved
>>    for kdump.
>>
>> 1st kernel will add device tree property dmcryptkeys as similar to
>> elfcorehdr to pass the memory address of the stored info of dm-crypt
>> keys to the kdump kernel.
>
>Is there not any security issue with putting the key into the DT? The
>DT is provided to userspace. There's provisions already to not expose
>"security-*" properties to userspace (see __of_add_property_sysfs).
>Though I think that has a hole in that the FDT is also provided as-is.
>However, I don't even know who or what uses these properties.
>
>Rob

Hi Rob,

Thanks for raising the concern! If I understand DT correctly, this
property is only accessible to the kexec'ed kdump kernel. A new DT is
allocated and set up by of_kexec_alloc_and_setup_fdt. Btw, to be
precise, it's putting the memory address where the key is stored but
not the key itself into DT. The key is stored in the memory exclusively
reserved for kdump. For more info on by who and how this property will
used, I've created a dt-schema pull request as suggested by Krzysztof,
https://github.com/devicetree-org/dt-schema/pull/181

And yes, there is no need for even userspace of the kdump kernel to
access it. So this idea of "security-*" properties/__of_add_property_sysfs
seems desirable. Thanks for bringing it up! I'll give it a try.


-- 
Best regards,
Coiby


