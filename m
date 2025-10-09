Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBEFCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 21:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J8yL7yrEAZqRgLh743AzR/f5Z0OSynWI9v8HtFYQ07Y=; b=IaaF8BmayejFXz67Monn2xYo39
	U+ke2Ppr+P4hKMZ7bPgYVQqZ78Lhn+i1DuJ+Tr+Oqvoigo9d675Jstk6bq+SDWqiDfDUZPVa5hUEF
	Fxe4uL7s/wgjkT2jkSHYPnMOSzFyVXG8zvTDvlFal2gd8v9Nyi+hmCsgdgzlUM7F+JkbY076fUvVZ
	cv0fxUFKwBN/2zda8YxqjP0l3eN/l4IkiKXSduAvU/Qn2kdwv0iZV6RuYlpFDz9WiicG9/zYmla8P
	OYEZF+RgGPAzDBv54P0BSNTC6bYowVia7bwg4mVCteYVYXYMQHzjwDGrewOpVdr+vDI+NNs5HF8Zs
	58sKB7rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6xrq-000000077cZ-0Wfw;
	Thu, 09 Oct 2025 21:08:06 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6xrn-000000077cB-22Au
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 21:08:04 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-32eae48beaaso2856622a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 14:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760044082; x=1760648882; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=J8yL7yrEAZqRgLh743AzR/f5Z0OSynWI9v8HtFYQ07Y=;
        b=14I2svVcQFyCNVQ7mnsWGMLqXTAxwJVM3Tst25exM2W1PwhU+0S1Vjc/htJNVLBUqL
         v+jkTaDo5AwTPJd9r0Q2rW87VOpsfnr/mlVheD+ngC1oXPlwo5sjJ+LyVu596s0DfSOk
         wmvLbT8bJWuYhX3bUs5g/WgVA+U05Xwnex1l/JP2V3Z0yNOVfz3mze4HCnWDdpyTK743
         maAhyWJMtZpSDVKNJC29QFPuaO3ehdS/o+l50m2KUA4xyDY/sVa78lV4avI9yfJnDddb
         p9eCW4f4vZo0coliEQpWXVWh6/VilcmSryAQ3cNlL/YnI2UQjhCUrJIjts+3IpX3zpH3
         13pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760044082; x=1760648882;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J8yL7yrEAZqRgLh743AzR/f5Z0OSynWI9v8HtFYQ07Y=;
        b=Uivf9DNrL97KATE8p9KqNNsiVOiFYJchh76O4T9Z93fYTT798gGTaGykWC0WEO5jKM
         HphhPPv2U1vetXjNJQwIGzyxQ7VgvXUe+V6HVAxF28+q851Eg3J4KnL6t2IGaowv2Xca
         MykcrUxeqlczQcItduxlNnJtqb6A5wLJFIXWVNlWGD/LEBMf72e7F82wAX+JpXelmD9u
         t5K5gYT8MgOokfdLao6YDx9OOAkTilX77MLGpjDOP7euJeDwloojPx/phrGzIjhIuSxs
         kyXeleNRMNl1aTsj+NU/i4Zhef9K7MF3WCXuC3B6umKEDsxu1JVPxaz9MECBNYkzgo3e
         Q8Xg==
X-Gm-Message-State: AOJu0YxNGWgLa90R3OS7TkGUlvXlhdi/CuHi9ZUDet0CcpGjB4BYH5fC
	A734waKNAfXvKFdE4WX/WO/KaOgoICIRKXSs7b6Pp/JdIRb4oyAFRU81UA+uSI0tIfMMadXTLBh
	KGBrvj67zpDOBgxwvPmOzzmglWg==
X-Google-Smtp-Source: AGHT+IFa7bhAUExVtejbjYxKsPiltNShSzZ9oTvDxsSQAjUcMKhU7xutFVMSZXzLhoi6fKx2krGDUJN50iFC9VUElg==
X-Received: from pjyu10.prod.google.com ([2002:a17:90a:e00a:b0:32b:50cb:b92f])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4b89:b0:32e:d599:1f66 with SMTP id 98e67ed59e1d1-33b513cedd3mr12577415a91.30.1760044082181;
 Thu, 09 Oct 2025 14:08:02 -0700 (PDT)
Date: Thu, 09 Oct 2025 14:08:00 -0700
In-Reply-To: <dd948073-0839-4f75-8cec-1f3041231ed7@amd.com>
Mime-Version: 1.0
References: <20251007221420.344669-1-seanjc@google.com> <20251007221420.344669-2-seanjc@google.com>
 <dd948073-0839-4f75-8cec-1f3041231ed7@amd.com>
Message-ID: <diqz347riy1b.fsf@google.com>
Subject: Re: [PATCH v12 01/12] KVM: guest_memfd: Rename "struct kvm_gmem" to
 "struct gmem_file"
From: Ackerley Tng <ackerleytng@google.com>
To: "Garg, Shivank" <shivankg@amd.com>, Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_140803_524848_3DFFAA22 
X-CRM114-Status: GOOD (  15.73  )
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

"Garg, Shivank" <shivankg@amd.com> writes:

> On 10/8/2025 3:44 AM, Sean Christopherson wrote:
>> 
>> [...snip...]
>> 
>> @@ -659,18 +667,18 @@ static struct folio *__kvm_gmem_get_pfn(struct file *file,
>>  					pgoff_t index, kvm_pfn_t *pfn,
>>  					bool *is_prepared, int *max_order)
>>  {
>> -	struct file *gmem_file = READ_ONCE(slot->gmem.file);
>> -	struct kvm_gmem *gmem = file->private_data;
>> +	struct file *slot_file = READ_ONCE(slot->gmem.file);
>> +	struct gmem_file *f = file->private_data;
> 			^^^
>>  	struct folio *folio;
>>  
>> -	if (file != gmem_file) {
>> -		WARN_ON_ONCE(gmem_file);
>> +	if (file != slot_file) {
>> +		WARN_ON_ONCE(slot_file);
>>  		return ERR_PTR(-EFAULT);
>>  	}
>>  
>> -	gmem = file->private_data;
>> -	if (xa_load(&gmem->bindings, index) != slot) {
>> -		WARN_ON_ONCE(xa_load(&gmem->bindings, index));
>> +	f = file->private_data;
>
> This redundant initialization can be dropped.
>
> I sent a cleanup patch including this change a few weeks ago:

Agree, and probably good to opportunistically drop this line in this
patch than to combine cleanups in Shivank's other patch.

>
> https://lore.kernel.org/kvm/20250902080307.153171-2-shivankg@amd.com
>
> Could you please review it?
>
> Everything else looks good to me!
>
> Reviewed-by: Shivank Garg <shivankg@amd.com>
>

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
Tested-by: Ackerley Tng <ackerleytng@google.com>

>> +	if (xa_load(&f->bindings, index) != slot) {
>> +		WARN_ON_ONCE(xa_load(&f->bindings, index));
>>  		return ERR_PTR(-EIO);
>>  	}
>>  
>
> Thanks,
> Shivank

