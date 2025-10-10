Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF36ECCD185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 15:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LZmqunuZRQwJHo8CjkO0APHqvfQELPC5kOsrm4zYYHY=; b=IqLzZeuukNFLOB4VhXvtzLu93C
	DqWb0te15Roag1ZGcEFKLeX39hnbwaFIgL9Tl43AXEs/de3FlL4uRXSWuYkqMl0lqaL/BtV87UrY0
	XbdORC/D7/5Fc5AmNQGo0IcF5SKfzNwzR2nVtnzKwww6NV88Tc2/ce72vBNs3K6IearY3/XKnWt1g
	DKVFgCnNw910rRB0CP5lZizOskpkYisANXjupHCPw45Ghce2WcKIFhJxewYKtNwa1onSQhlbimsyv
	MJgCNR8FfRI7cRbgDnrcQtI3X2uXFiSC1YeQlV2+eXoYW3VZcBNn5+PujCIUsL/8g73UCTUNZz2gw
	dDBs+ZkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Eiq-00000008mf5-2wh1;
	Fri, 10 Oct 2025 15:07:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Eio-00000008meL-1sdp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 15:07:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760108873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=LZmqunuZRQwJHo8CjkO0APHqvfQELPC5kOsrm4zYYHY=;
	b=YvNqNllZIT8EnAcItKCWQ5SfdnyynJF9DcTg0N7bjs528I13rs7XAWEUvNj4KMLNJPODXg
	y/J89RgxdOZ9lk9t1ji7jUBbdrFj2lfH4XGqHf41e6nvUT5cIzTEuvG4Cofh6T1xuLVVdk
	qb4x//LL1VHGtC+yfOEz5w8kuIg6GzM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-315-YAkwKrbSPH2qIA4k6x4Lsw-1; Fri, 10 Oct 2025 11:07:51 -0400
X-MC-Unique: YAkwKrbSPH2qIA4k6x4Lsw-1
X-Mimecast-MFC-AGG-ID: YAkwKrbSPH2qIA4k6x4Lsw_1760108871
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-46e4335fa87so13174755e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Oct 2025 08:07:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760108870; x=1760713670;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LZmqunuZRQwJHo8CjkO0APHqvfQELPC5kOsrm4zYYHY=;
        b=ZeDp3AsfV5O5nzTJPFyiTFl6VDb13L5LcwwDGrMhvurhmCcm4d4Yi41AZC0xXHIz3E
         /DgFXuCW0gciEEAVKAcl4FQsxotnRf7oK7imsUsolBMvjlY83ySAQO1Oed5JnzBHjdGz
         YAK5mRzq/SYu7oNHIjwKfz4wjsOnPgYToVZ8/SaT697jsh8472n3DfzjfhAgrKvpYLL2
         ypNSq8zsi4tqynrxCuur3dHrVxdp035BuxyBJ7OXZ+kgWaYnESKLOyn0FYAMu7xuH50W
         X4SXfjLNR6bl5WN1pzCteH9zWjbLPF4tnQcGBDTAME4LrmFfmeeMdhmIGMqQvaEWKfOJ
         KSew==
X-Gm-Message-State: AOJu0YwCOLePeE57RLo4EHQ3UcIT7DTbZ3JQ2E8mlqCIWOaaRt9XDSFe
	KRbKbgvH2MVw0Coj85avz5mHROxECd0f1My+DaHD0+YATbTipIwM9CTJ2dysvc90LkhRzV1g97n
	MU0vPLCPhdS/4OXnnPJ+eXoPISpL+01m3I2WAeATKT03u8I946cHOUNc4AD6+HCiB90Jmk7I1hV
	Xlj64ihOEL
X-Gm-Gg: ASbGncuRsd9ZLEDVRdGEK1YKwuhNwc3ZnSxt8gkoxxWldfFxnzPKj5Fxi5SnS33tIGL
	cFG8gzrOMGZCA4SJu/+iFQNgfo2Wbpo4Ti3K7/SroO5qP+SlE5MNUM8mHQtjFy6NDP68ypNYoAw
	lsJh2pJk+D/eiv6lE/8jb58aqSKm691IgUxY4IPO77akBJxPvQfV8+c2xUv7oQ2qcCdLXGsrXnw
	nmrXc8vJnZJmuBY+w+L+y0ClZL7cichtVwY48En4j3RwXKWjkGDNn2R4i3+tVx++trBRmxbprPk
	M3P6SS/6TENKwzFidLlBNtbDLWUkFZ4ytu0H+FLQTnjppmyN2OpoKlcnQWi/pqmhlqzQYiFdR3u
	ZTzc=
X-Received: by 2002:a05:600c:4750:b0:45f:28d2:bd38 with SMTP id 5b1f17b1804b1-46fa9af3095mr88636065e9.18.1760108870677;
        Fri, 10 Oct 2025 08:07:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5JHSDo+98ZcIlXqkfGtP4ZZEWBP769aS/wsbUmwWkDRX+gxG1VW9W555xuFif1HCTIaL95g==
X-Received: by 2002:a05:600c:4750:b0:45f:28d2:bd38 with SMTP id 5b1f17b1804b1-46fa9af3095mr88635835e9.18.1760108870194;
        Fri, 10 Oct 2025 08:07:50 -0700 (PDT)
Received: from [192.168.3.141] (tmo-083-189.customers.d1-online.com. [80.187.83.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb489ad27sm51946505e9.15.2025.10.10.08.07.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 08:07:49 -0700 (PDT)
Message-ID: <c8f74a07-9003-433a-9b1f-888df335e31b@redhat.com>
Date: Fri, 10 Oct 2025 17:07:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 01/12] KVM: guest_memfd: Rename "struct kvm_gmem" to
 "struct gmem_file"
To: "Garg, Shivank" <shivankg@amd.com>,
 Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fuad Tabba <tabba@google.com>, Ackerley Tng <ackerleytng@google.com>,
 Ashish Kalra <ashish.kalra@amd.com>, Vlastimil Babka <vbabka@suse.cz>
References: <20251007221420.344669-1-seanjc@google.com>
 <20251007221420.344669-2-seanjc@google.com>
 <dd948073-0839-4f75-8cec-1f3041231ed7@amd.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <dd948073-0839-4f75-8cec-1f3041231ed7@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Fp4idBohOfk6QlIJtmmaHRJulQvwQ2zJaOOq9ZXQZI8_1760108871
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_080754_562158_89F33001 
X-CRM114-Status: UNSURE (   9.74  )
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

>> -	struct file *gmem_file = READ_ONCE(slot->gmem.file);
>> -	struct kvm_gmem *gmem = file->private_data;
>> +	struct file *slot_file = READ_ONCE(slot->gmem.file);
>> +	struct gmem_file *f = file->private_data;
> 			^^^
>>   	struct folio *folio;
>>   
>> -	if (file != gmem_file) {
>> -		WARN_ON_ONCE(gmem_file);
>> +	if (file != slot_file) {
>> +		WARN_ON_ONCE(slot_file);
>>   		return ERR_PTR(-EFAULT);
>>   	}
>>   
>> -	gmem = file->private_data;
>> -	if (xa_load(&gmem->bindings, index) != slot) {
>> -		WARN_ON_ONCE(xa_load(&gmem->bindings, index));
>> +	f = file->private_data;
> 
> This redundant initialization can be dropped.
> 
> I sent a cleanup patch including this change a few weeks ago:
> 
> https://lore.kernel.org/kvm/20250902080307.153171-2-shivankg@amd.com

Yeah, Sean/Oaolo, can you take a look and pick that up as well?

-- 
Cheers

David / dhildenb


