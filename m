Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD153C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 08:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6+RLlKz+LEp4zVkeHQztjvSyQ4kPuNOLYMNbmdtknD8=; b=gxmdy21m+vQziVYOo+A1DyCTsE
	+iLLiyV6IDYd2z8IlbZ58FdOeE/icJJU7VpedxcWc0n0LcZKDBfhdbVJQPGwMOpXXjaftixR3ViB9
	n3Qyh0W8HM0M2UiNeeVHwlxG5GtI50Iymgq4zFbcJL0X+dwAccMNq8vjoWaDbvkgp3WenYCzOEni7
	GpRdRDvWOf+aDabtEKELbtRgD37Em+Yol4bDMO1KpAnds4OJVd7HP5KbgF7jx9lZ5wXArF8tKvrMZ
	pZwowwzx+ht8UYt2ZglX73xgspvRz2sYuvmilGSzlMF3hNink76yS2bmKyhwpNdetVLFSoGWltoD+
	u4BR+3xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhOHO-000000037W7-2UsA;
	Thu, 31 Jul 2025 08:04:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhOCZ-000000036Xr-21ex
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 07:59:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753948786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6+RLlKz+LEp4zVkeHQztjvSyQ4kPuNOLYMNbmdtknD8=;
	b=XVZMvJwDg0z2/vEqtNuTrkZqn8N+Wjn7dOaCanH310jnJPKOoCQiOENxqPNOsw5WDYy0Yl
	fo4oPYm+efZYhd9BJV9C8pJfmqcBh6IbWWPBNdwhQK1lB4g++YAFgWSWxNIgC4eFPm8eNP
	yKpCDf8lVuL9nBDtdtwHxOcGs/IRmLI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-147-gx24Yn14MWmW64WH-gAAHg-1; Thu, 31 Jul 2025 03:59:44 -0400
X-MC-Unique: gx24Yn14MWmW64WH-gAAHg-1
X-Mimecast-MFC-AGG-ID: gx24Yn14MWmW64WH-gAAHg_1753948783
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3b783265641so88810f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 00:59:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753948783; x=1754553583;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6+RLlKz+LEp4zVkeHQztjvSyQ4kPuNOLYMNbmdtknD8=;
        b=ADShLEixz0YM3HBgDxdOKPOd25KwgS/6dZ7VOJPUsYHbV8cCOVlOKGK6jCySiks9ya
         Ve5JvRIe0gQxkSk5GA+NGmFs6xR+uvNQd+HcFndXwRGJ2LNjwR11Knz/kj/Wl5LPKMYp
         24LNp1M+KtvncNzUCtyxbXkVaTSw1HmEs4lvAtN/Bx/uFBgiryBtmGg+N0X4IBfKJA5e
         +2Fla/6W3qGDUBbuHbyccijI80tWWVwSAC637BbOgA4u/6gBvamNut2RDlSbw2O0pmol
         QfDhTXARe9pTN3trBZ5/ROe1TBW9KaN91x2CGa9PJfGb7Sb9wMvFcKVYAqiN6cOLc7Y9
         P70g==
X-Forwarded-Encrypted: i=1; AJvYcCUJ9veurgZA0EsasCVEzauPnVH5dMar7SlnSMztHp96q/+DMhWiqiMRZWaq8GDaNwIf5JbpzOfqYW9i7mBe+91N@lists.infradead.org
X-Gm-Message-State: AOJu0YxqN5V0GPIHNyPLJdQTpED19ZMUB7X24zxWjO5vhw7z+yU0ImLH
	Lv6gonX5Dy7zJYPOjBRyH6BoYeT17xqItAxiPGjMgtDOWLNH1TjuN59qot7VBrA1KAyRUPmpsfG
	N9zx2Klm9jaXg+3hh4Znp4lo1l+ps/CNqSpMrBxhl2MXfjM+vshPOVM9b+S6eWh13Q8pky4byD8
	qI
X-Gm-Gg: ASbGncu8hDmxEeKMALp+Er3fXqFd2yFWODjd1NFSyNTNukXD+Air2ZO6SybURTTVfxv
	t3pHJX9yeavnDKY9CrEhS4J685S2Y9z0SXKJEXVWoteMb+BKA7tv6FJe5mcoWGr/hQYgXeXvQzp
	Zv5ejHWS0wCZhOUNZFeiBxzUlJT+6CJdKfUtAUvC2XFhbnf/7m60pIMRWLcFIynQfQXVUpejJJ0
	JqLgT6IDF6EkEolKc7VajfGv2XXbdlV7xFDePFCk1RnyldBGZuuq5zKgyy9yEYgBxT6fkXAkvIp
	QWGYJ+iovNixq7ENJtIJXWkB0eJcOMgwpfd+8Lbde2Zb94g7Zv6fpDrPUqM/F0y1ib5xIP8JOUW
	RC1gkJq/mq9pMviXXjMXg1Aj750lSFJvU4df3Haxe9rY7gfMPN7viNX42I7x/xWI+MJ4=
X-Received: by 2002:a05:6000:188f:b0:3a5:2465:c0c8 with SMTP id ffacd0b85a97d-3b794fbe44emr4764608f8f.7.1753948783204;
        Thu, 31 Jul 2025 00:59:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0c6FGDFwWmf3aG+Pb56FiyL3qnF5sXlaAOIZlX1CgExfddmeal6RHVRaf8zAwrRjcXWN6sQ==
X-Received: by 2002:a05:6000:188f:b0:3a5:2465:c0c8 with SMTP id ffacd0b85a97d-3b794fbe44emr4764586f8f.7.1753948782792;
        Thu, 31 Jul 2025 00:59:42 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f44:3700:be07:9a67:67f7:24e6? (p200300d82f443700be079a6767f724e6.dip0.t-ipconnect.de. [2003:d8:2f44:3700:be07:9a67:67f7:24e6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c47908esm1474307f8f.59.2025.07.31.00.59.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Jul 2025 00:59:42 -0700 (PDT)
Message-ID: <829fe6be-56b2-4807-8fd6-cc24a2c0aa5f@redhat.com>
Date: Thu, 31 Jul 2025 09:59:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 13/24] KVM: x86/mmu: Hoist guest_memfd max level/order
 helpers "up" in mmu.c
To: Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Gavin Shan <gshan@redhat.com>,
 Shivank Garg <shivankg@amd.com>, Vlastimil Babka <vbabka@suse.cz>,
 Xiaoyao Li <xiaoyao.li@intel.com>, Fuad Tabba <tabba@google.com>,
 Ackerley Tng <ackerleytng@google.com>, Tao Chan <chentao@kylinos.cn>,
 James Houghton <jthoughton@google.com>
References: <20250729225455.670324-1-seanjc@google.com>
 <20250729225455.670324-14-seanjc@google.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <20250729225455.670324-14-seanjc@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WyUGJMcAsDTDDbH3F3rDvE_8QWZZG9SoJXDGh7OssUg_1753948783
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_005947_599950_2EF979B1 
X-CRM114-Status: UNSURE (   7.78  )
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

On 30.07.25 00:54, Sean Christopherson wrote:
> Move kvm_max_level_for_order() and kvm_max_private_mapping_level() up in
> mmu.c so that they can be used by __kvm_mmu_max_mapping_level().
> 
> Opportunistically drop the "inline" from kvm_max_level_for_order().
> 
> No functional change intended.
> 
> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
> Reviewed-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


