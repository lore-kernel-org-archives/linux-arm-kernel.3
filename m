Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC10CA0FF7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6iCBik3cJC1ZHjD5Ysxv05sd4NeodNwL7TaQOabYOc=; b=yZumcMqRyt9Ki8B2FjUQVxOxE3
	sssXcwvGqbBEeWP5EapxwVlAWxlhCDQ20E6lw35oZsjMfYY7ZxrsbioK+qxDNeZddobBwSjtmgxYb
	6GIe64xZdQTtxZ1HKBl8dNzcozGXm1p1WsOJ2h6cOBLzaESrnwK5dwjsIRsVZrDPt+/7NXbMMaW4K
	HvD+jg39CmWOFwpyoV+gd5wXsBhBosV9BGtzhcZqu8ixe6qLdi8xxSgdSgPv79mLuwMn9kzVazfzE
	aC1/NOZTcudGteeiqJ1VwiClog9o25NZpfCkbmtMMm+Gfki0dKZyPB8XJoNbtO+9nsEM99QYRNznH
	yjL2+qow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgNm-00000002SY5-1Xyw;
	Thu, 28 Aug 2025 17:25:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urc55-00000001cMn-03g4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 12:50:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756385418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=C6iCBik3cJC1ZHjD5Ysxv05sd4NeodNwL7TaQOabYOc=;
	b=Ytvefwy1tdNKQp6dOtNM+ayOIVGXzet7Q/zxmuIaLDr+1Y7Ew7CeZvLjM+pQPhuVW1cIE6
	/ALeMfmYldLTBq64EmM1NmXzcj8VbKdLIkIAHxd/0b8n+GkPsX8D2e47SDs6xVbVr694pa
	v5dGwsnyiLvda3hzN8kN/pBLKbcra4Q=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-222-_jiyX0K9OBm6F2ZaoUAWbw-1; Thu, 28 Aug 2025 08:50:15 -0400
X-MC-Unique: _jiyX0K9OBm6F2ZaoUAWbw-1
X-Mimecast-MFC-AGG-ID: _jiyX0K9OBm6F2ZaoUAWbw_1756385414
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3c7aa4cf187so636707f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 05:50:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756385414; x=1756990214;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C6iCBik3cJC1ZHjD5Ysxv05sd4NeodNwL7TaQOabYOc=;
        b=ByyflOmkdrbDnQAzgWVP8X7wV5vsbCcGl9IDYPFzYVU99BIOCUYKyBJRm44FAjvh5P
         qo/A7ar2ube0ouHCxDzJgnu2WCxUPc6ptYLt6540HqQ26tuzk+pQ2vKpQntdrcOi3oMX
         8/w2LQQI+LyYRLAub15RuMLHHQ/E9/gEtUe8hnbDy2iYoG6qC0RB3Fn0Mz2CL8oqcBCL
         EYtutbdxrtduwk9rDO+MCcNxvj/ajc69UBZZfZoQg0YJDPLWedBH6oCpWT6b7LQ3+ooK
         iKml1r4C5CCYfQi9vv4EroveFFEHmvRkvJ0sZfhtHmtyMBPWu/SFAzRFwDwmDt43cCmr
         UR8g==
X-Forwarded-Encrypted: i=1; AJvYcCVAwKm3OkT0PLyfHmsOTsZN2vGQzEqG1X+OJab8QREMXdWri7q4ertSC0LV4/gl7AbSyPgnrbgyfII0C8nwtRug@lists.infradead.org
X-Gm-Message-State: AOJu0YyDeQzkGwwH7SBsheSfbf9af0M6koci/kbcKtA2MF6MV/Bl3WIn
	9b0Fpuuvy2awJBn3HRkHnDVtOYYQXfmAy64qvLEjaX/6RQ7EK+pZEgBmXfdbN++7ftzDwm6YFJ/
	7aFZPdS1wSpU4FMpympVyeE3/T98erj1VU+n4oPq3T8/RSxn6pzsGatZ4JWLPTJzA2i48fu02tz
	sE
X-Gm-Gg: ASbGncsCbd9AunuTqb7Qr1oKRMZCKIBw/NO0d933RuqkuSiGqXFqc9ZXA6t8v2AVSb/
	kTrJgppFguqpfwByn/hzxFtM1IjDIzXGD8+fVe4WlZLz4rytxEroFxGTcLKxtCujw4amlGy2cfe
	6nxQULcUuKEZoowqqrtrHReBcmrymZLSqWYkILsM6lXqCl+P+6ZApgJVVzXA2E/zFfq5zwjXn5Y
	VL4w+Dd7hZ5DmNzoQxk5hZKfwrWfKU2G79Vk5vkb+vdxvcTflIjQ77dq8OZm0APeSF7YR+LYl4f
	RVVCcKWo4FVQBNsQx9aWjJIGfrUOFuKq83oqi5aLW7kXPoGGe23Nm2SND9RuXWPVp0jFkx1fcbn
	9zvnQszaM375W3OxCFGrxfyGlC8fDUjoWHTrGagIiDbcW7Mp+F3cF4cSLDtsDCr7yLAs=
X-Received: by 2002:a5d:5d01:0:b0:3c7:36f3:c358 with SMTP id ffacd0b85a97d-3c736f3c59cmr13147600f8f.32.1756385414266;
        Thu, 28 Aug 2025 05:50:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2soHNJz3uNCh9kCpxwV5zoV5iezSYMFN+6bV3UPfCImuAc7IMpQupU9NYnIVeAMq/TCo6Vg==
X-Received: by 2002:a5d:5d01:0:b0:3c7:36f3:c358 with SMTP id ffacd0b85a97d-3c736f3c59cmr13147562f8f.32.1756385413775;
        Thu, 28 Aug 2025 05:50:13 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f28:c100:2225:10aa:f247:7b85? (p200300d82f28c100222510aaf2477b85.dip0.t-ipconnect.de. [2003:d8:2f28:c100:2225:10aa:f247:7b85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c70e4ba44fsm24519526f8f.5.2025.08.28.05.50.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 05:50:13 -0700 (PDT)
Message-ID: <a777f88b-ea12-4aad-88da-2e7011e151b8@redhat.com>
Date: Thu, 28 Aug 2025 14:50:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/12] Direct Map Removal Support for guest_memfd
To: "Roy, Patrick" <roypat@amazon.co.uk>,
 "seanjc@google.com" <seanjc@google.com>
Cc: "tabba@google.com" <tabba@google.com>,
 "ackerleytng@google.com" <ackerleytng@google.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "rppt@kernel.org"
 <rppt@kernel.org>, "will@kernel.org" <will@kernel.org>,
 "vbabka@suse.cz" <vbabka@suse.cz>, "Cali, Marco" <xmarcalx@amazon.co.uk>,
 "Kalyazin, Nikita" <kalyazin@amazon.co.uk>,
 "Thomson, Jack" <jackabt@amazon.co.uk>, "Manwaring, Derek"
 <derekmn@amazon.com>
References: <20250828093902.2719-1-roypat@amazon.co.uk>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20250828093902.2719-1-roypat@amazon.co.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ixv5Pg18qDKWyNgVzs7R4vQmihz8jrCfSyYYVvEz6ic_1756385414
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_055019_147039_5668529C 
X-CRM114-Status: GOOD (  11.88  )
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

On 28.08.25 11:39, Roy, Patrick wrote:
> [ based on kvm/next ]
> 
> Unmapping virtual machine guest memory from the host kernel's direct map is a
> successful mitigation against Spectre-style transient execution issues: If the
> kernel page tables do not contain entries pointing to guest memory, then any
> attempted speculative read through the direct map will necessarily be blocked
> by the MMU before any observable microarchitectural side-effects happen. This
> means that Spectre-gadgets and similar cannot be used to target virtual machine
> memory. Roughly 60% of speculative execution issues fall into this category [1,
> Table 1].
> 

As discussed, I'll be maintaining a guestmemfd-preview branch where I 
just pile patch sets to see how it will all look together.

It's currently based on kvm/next where "stage 1" resides, and has "Add 
NUMA mempolicy support for KVM guest-memfdAdd NUMA mempolicy support for 
KVM guest-memfd" [1] applied.

There are some minor conflicts with [1] in the "KVM: guest_memfd: Add 
flag to remove from direct map" patch, I tried to resolve them, let's 
see if I messed up.

https://git.kernel.org/pub/scm/linux/kernel/git/david/linux.git/log/?h=guestmemfd-preview

[1] https://lkml.kernel.org/r/20250827175247.83322-2-shivankg@amd.com

-- 
Cheers

David / dhildenb


