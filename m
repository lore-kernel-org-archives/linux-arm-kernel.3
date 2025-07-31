Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF06C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 08:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UOsdViaGVxWnczW9b3BcwanE5/c/ybe0wyeENLeFccE=; b=3V/YWLJ20DI8ajoPlapH6411bB
	eC0Kamf6qKSzQp/RoYiSvuF+rAGko0wvZRhk7PeT5KyrWVY7UbhCIb8Kloi/rOtdbCUNt/AIfOvJh
	fQCxzonxEXtND7Zq1an327Q+rjpN2JgSOVFGY0ngCiLf29Nzz1KGvHSEdPjMoAoq2+S/jL8Z4f/1a
	3EWHRVIbC4ioV5Vo/TgTJGeeZITHXptTYply7De7pQuC+11UZkc3ZSHMnt+bnae33H1U55OGEx+P6
	XZFTPEeFysqDburEovSij54f1RuvhjoOrg7dSNQ9JYKdT74pJp8Sl4Zo2TVgfdob9ENsn4GgJwMfA
	XH9dRrJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhOnP-00000003B7G-0F73;
	Thu, 31 Jul 2025 08:37:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhOfV-00000003A7P-0rn6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 08:29:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753950580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UOsdViaGVxWnczW9b3BcwanE5/c/ybe0wyeENLeFccE=;
	b=aI+4ClAVLOJ4BPSeo7ek/PM4kHFgFIkXOIU//RFZbt8fqXkOPklYwo5XTdwtNq2W5SBfsI
	fdaRSzTqaOmvECYYJQ7NGICKYxxsIRU8kDhd17S8Ser0gU82vLoYc3rpxz1+EqLOj7hYjA
	lLQ9NPNzeUOOP9Lk5Jura18CK8Q/XZE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-4zNj7JUHPq20cMgUacyXEg-1; Thu, 31 Jul 2025 04:29:38 -0400
X-MC-Unique: 4zNj7JUHPq20cMgUacyXEg-1
X-Mimecast-MFC-AGG-ID: 4zNj7JUHPq20cMgUacyXEg_1753950577
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3b7807a33faso60367f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 01:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753950577; x=1754555377;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UOsdViaGVxWnczW9b3BcwanE5/c/ybe0wyeENLeFccE=;
        b=I3Klxb8nnIVum2HLnSNirL2mc4Y43um8V1r7+kLRrQl8KhoJr7p2+MzogixBQ7MSyP
         gvLDpua4KUJ7lXXJ2pL5VEzkjei+1p9AHzUWQFOfCUd0PKIJPruDi50+WRC88npvJ+jb
         D9B9pLpaY95CGRyZlHsIQhp5FthAAcFQKMp1yzLVOLneyxKvipt3KJzYkAeRRoUTGXmA
         vCe3/h8N0N+/K/6O217ttH7pBElnS98fVE1fgdxVRewlv1Nd+ljkeCh1F+EM+fO6go05
         OP8ZH8Jx5OmAbn2niUsB2LB0GbSxEA2hjlYSZZGoK+h8bff/BnphqR+xR4ceFLA9gZdA
         b4Rg==
X-Forwarded-Encrypted: i=1; AJvYcCX8QHY2/umjXhFH/N2H6yvqMd83sWuReFsTYPqnsMqTMM+uZbL53AuoUt8XBDJWx8TrW6KprBtCT0aC0RoGmKo4@lists.infradead.org
X-Gm-Message-State: AOJu0YytAUBiF//4DX36UM81Ft7LTi46eD1R+yy4cytjD+SkRmEvMSh7
	CQoj/llesXT07ncV0MoLHtxP2DpMp6InNDDVvBwTZsfZVE0N25aMx8NLKl6G+2gPqOgsgXySPbg
	o1Wfvngt+QxPstEXyriqkJm1mdda4YMdX3c6PH9RGmPf8P5n76zUH2lrYKqPo7XctTtn9W7WhGi
	lp
X-Gm-Gg: ASbGncu2UcIRSVbvpiK2/fD0ZVSpQv3DbuoPjzdZyA+zfEHvdxSrovK7ezhAy0VLS5x
	//jFhRPp+Y0VnV3GR4sKk46GUi1JsMyAKgPaysQBaRoKSsEjcGGlnzRX34FMrN34p3vzQuClNe9
	DhhWpWOCvWkXLkwK6sGtY49VOM08D3myZspRDWtWD+k3HwiMhBigIYtIRTZ4kqv/DjoI1cmVT1n
	DzR2jWIOlfH1L0hkW/Tpva50q6Qncr6j4OS4+9ilFZk0+74rS1suSyyIuw4JytYpsCCJYr4A7Qd
	9BCmPHf8UXFJuqdbZaU6Mmo4oNS8ETNKym+BRyhPO9d/018P+SaqtQ5al1QjMVIuUD6HfyOlYQf
	9vZgilf1lAjcb6hJXmHgE4vbtlLkKPmRt+ZVG0PgUrmyngLRLcf2oDpSsJqx1TfcOVF4=
X-Received: by 2002:a05:6000:24c9:b0:3b7:9c88:daac with SMTP id ffacd0b85a97d-3b79c88dbc7mr1204223f8f.53.1753950576896;
        Thu, 31 Jul 2025 01:29:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHD9vjWTXx6+eu57zSZvMsNC7w4A10Bd7geesiciB9rOpCXqiI0Bh3Cw4/xj0sZFbPQ7RH2cA==
X-Received: by 2002:a05:6000:24c9:b0:3b7:9c88:daac with SMTP id ffacd0b85a97d-3b79c88dbc7mr1204197f8f.53.1753950576339;
        Thu, 31 Jul 2025 01:29:36 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f44:3700:be07:9a67:67f7:24e6? (p200300d82f443700be079a6767f724e6.dip0.t-ipconnect.de. [2003:d8:2f44:3700:be07:9a67:67f7:24e6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9386sm1588913f8f.18.2025.07.31.01.29.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Jul 2025 01:29:35 -0700 (PDT)
Message-ID: <c320b7a3-bf75-4f9e-bd72-4290fd9fe9d9@redhat.com>
Date: Thu, 31 Jul 2025 10:29:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 12/24] KVM: x86/mmu: Rename
 .private_max_mapping_level() to .gmem_max_mapping_level()
To: Fuad Tabba <tabba@google.com>, Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Gavin Shan <gshan@redhat.com>, Shivank Garg <shivankg@amd.com>,
 Vlastimil Babka <vbabka@suse.cz>, Xiaoyao Li <xiaoyao.li@intel.com>,
 Ackerley Tng <ackerleytng@google.com>, Tao Chan <chentao@kylinos.cn>,
 James Houghton <jthoughton@google.com>
References: <20250729225455.670324-1-seanjc@google.com>
 <20250729225455.670324-13-seanjc@google.com>
 <CA+EHjTwuXT_wcDAOwwKP+yBetE9N46QMb+hUKAOsxBVkkOgCTw@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZgEEwEIAEICGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAhkBFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAmgsLPQFCRvGjuMACgkQTd4Q
 9wD/g1o0bxAAqYC7gTyGj5rZwvy1VesF6YoQncH0yI79lvXUYOX+Nngko4v4dTlOQvrd/vhb
 02e9FtpA1CxgwdgIPFKIuXvdSyXAp0xXuIuRPQYbgNriQFkaBlHe9mSf8O09J3SCVa/5ezKM
 OLW/OONSV/Fr2VI1wxAYj3/Rb+U6rpzqIQ3Uh/5Rjmla6pTl7Z9/o1zKlVOX1SxVGSrlXhqt
 kwdbjdj/csSzoAbUF/duDuhyEl11/xStm/lBMzVuf3ZhV5SSgLAflLBo4l6mR5RolpPv5wad
 GpYS/hm7HsmEA0PBAPNb5DvZQ7vNaX23FlgylSXyv72UVsObHsu6pT4sfoxvJ5nJxvzGi69U
 s1uryvlAfS6E+D5ULrV35taTwSpcBAh0/RqRbV0mTc57vvAoXofBDcs3Z30IReFS34QSpjvl
 Hxbe7itHGuuhEVM1qmq2U72ezOQ7MzADbwCtn+yGeISQqeFn9QMAZVAkXsc9Wp0SW/WQKb76
 FkSRalBZcc2vXM0VqhFVzTb6iNqYXqVKyuPKwhBunhTt6XnIfhpRgqveCPNIasSX05VQR6/a
 OBHZX3seTikp7A1z9iZIsdtJxB88dGkpeMj6qJ5RLzUsPUVPodEcz1B5aTEbYK6428H8MeLq
 NFPwmknOlDzQNC6RND8Ez7YEhzqvw7263MojcmmPcLelYbfOwU0EVcufkQEQAOfX3n0g0fZz
 Bgm/S2zF/kxQKCEKP8ID+Vz8sy2GpDvveBq4H2Y34XWsT1zLJdvqPI4af4ZSMxuerWjXbVWb
 T6d4odQIG0fKx4F8NccDqbgHeZRNajXeeJ3R7gAzvWvQNLz4piHrO/B4tf8svmRBL0ZB5P5A
 2uhdwLU3NZuK22zpNn4is87BPWF8HhY0L5fafgDMOqnf4guJVJPYNPhUFzXUbPqOKOkL8ojk
 CXxkOFHAbjstSK5Ca3fKquY3rdX3DNo+EL7FvAiw1mUtS+5GeYE+RMnDCsVFm/C7kY8c2d0G
 NWkB9pJM5+mnIoFNxy7YBcldYATVeOHoY4LyaUWNnAvFYWp08dHWfZo9WCiJMuTfgtH9tc75
 7QanMVdPt6fDK8UUXIBLQ2TWr/sQKE9xtFuEmoQGlE1l6bGaDnnMLcYu+Asp3kDT0w4zYGsx
 5r6XQVRH4+5N6eHZiaeYtFOujp5n+pjBaQK7wUUjDilPQ5QMzIuCL4YjVoylWiBNknvQWBXS
 lQCWmavOT9sttGQXdPCC5ynI+1ymZC1ORZKANLnRAb0NH/UCzcsstw2TAkFnMEbo9Zu9w7Kv
 AxBQXWeXhJI9XQssfrf4Gusdqx8nPEpfOqCtbbwJMATbHyqLt7/oz/5deGuwxgb65pWIzufa
 N7eop7uh+6bezi+rugUI+w6DABEBAAHCwXwEGAEIACYCGwwWIQQb2cqtc1xMOkYN/MpN3hD3
 AP+DWgUCaCwtJQUJG8aPFAAKCRBN3hD3AP+DWlDnD/4k2TW+HyOOOePVm23F5HOhNNd7nNv3
 Vq2cLcW1DteHUdxMO0X+zqrKDHI5hgnE/E2QH9jyV8mB8l/ndElobciaJcbl1cM43vVzPIWn
 01vW62oxUNtEvzLLxGLPTrnMxWdZgxr7ACCWKUnMGE2E8eca0cT2pnIJoQRz242xqe/nYxBB
 /BAK+dsxHIfcQzl88G83oaO7vb7s/cWMYRKOg+WIgp0MJ8DO2IU5JmUtyJB+V3YzzM4cMic3
 bNn8nHjTWw/9+QQ5vg3TXHZ5XMu9mtfw2La3bHJ6AybL0DvEkdGxk6YHqJVEukciLMWDWqQQ
 RtbBhqcprgUxipNvdn9KwNpGciM+hNtM9kf9gt0fjv79l/FiSw6KbCPX9b636GzgNy0Ev2UV
 m00EtcpRXXMlEpbP4V947ufWVK2Mz7RFUfU4+ETDd1scMQDHzrXItryHLZWhopPI4Z+ps0rB
 CQHfSpl+wG4XbJJu1D8/Ww3FsO42TMFrNr2/cmqwuUZ0a0uxrpkNYrsGjkEu7a+9MheyTzcm
 vyU2knz5/stkTN2LKz5REqOe24oRnypjpAfaoxRYXs+F8wml519InWlwCra49IUSxD1hXPxO
 WBe5lqcozu9LpNDH/brVSzHCSb7vjNGvvSVESDuoiHK8gNlf0v+epy5WYd7CGAgODPvDShGN
 g3eXuA==
Organization: Red Hat
In-Reply-To: <CA+EHjTwuXT_wcDAOwwKP+yBetE9N46QMb+hUKAOsxBVkkOgCTw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VBX4Ah67kSYarA-u9VJ_AZ2R4zvz8-mn46EJgc78HiQ_1753950577
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_012941_321983_C11ECA93 
X-CRM114-Status: UNSURE (   9.99  )
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

On 31.07.25 10:15, Fuad Tabba wrote:
> On Tue, 29 Jul 2025 at 23:55, Sean Christopherson <seanjc@google.com> wrote:
>>
>> From: Ackerley Tng <ackerleytng@google.com>
>>
>> Rename kvm_x86_ops.private_max_mapping_level() to .gmem_max_mapping_level()
>> in anticipation of extending guest_memfd support to non-private memory.
>>
>> No functional change intended.
>>
>> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
>> Acked-by: David Hildenbrand <david@redhat.com>
>> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>> Signed-off-by: Fuad Tabba <tabba@google.com>
>> Co-developed-by: Sean Christopherson <seanjc@google.com>
>> Signed-off-by: Sean Christopherson <seanjc@google.com>
>> ---
> 
> nit: remove my "Signed-off-by", since I'm not a co-developer, and instead:

The patch went "through your hands", right? In that case, a SOB is the 
right thing to do.

"The Signed-off-by: tag indicates that the signer was involved in the
development of the patch, or that he/she was in the patch's delivery path."

-- 
Cheers,

David / dhildenb


