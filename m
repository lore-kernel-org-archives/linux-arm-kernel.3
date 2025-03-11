Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 557E3C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 20:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jcN6AhGFmZwyWIgsYRQkrJVVdkpynFpZX2fNETRTvzo=; b=D7bSgUFzAVftJxKf/X61a8lsuc
	XnM3y6jagAB6693Zu+E24/+tF2CPVvGlDFMBCVs6TE8XOJ3Gd5tx75NflfQ+Fbqn/BmMTsQx82h+d
	WZP1zHHxSjCqXLxEWh2GHxAObeWsnp+/nM6ePFloxZLuBhfdfYyb+hby//rW+RHjrKhIJ5d7j0901
	9dfoDjocNHOJv+B0VtTVG62FCW6AM6qcwUt7YCUPLYVZPdkSdSSIO90UR/0G0D6ZcTHPYRK6I9vNh
	kVoKPiOUALeSQVF0egU5eGhZv5oV7fzs/Dx+urLNNxVH5JtP3LLNTkqTSLeYCn/FPH4lMPsHz4pS+
	tWGFZ+Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts6Iq-00000006vkz-1QDs;
	Tue, 11 Mar 2025 20:34:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5oc-00000006s1y-3q6V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 20:03:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741723381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=jcN6AhGFmZwyWIgsYRQkrJVVdkpynFpZX2fNETRTvzo=;
	b=LtoimSmFcGh8gODLRjxqNZXN7Vr/JHd4XpcrAc2MSQd4v70y5TByJGkeVwO2EQ/w6FaMYN
	Kypgoiqomah+ihodtUm1qGnUsmBZViVIBgKBuKE8qBoYaLxNTNYOZHaa/Bdsky2qxWNjib
	uPKt/MqR6R83dr9SJ/9Gl2RpdW9NQao=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-uDBV1L-AOUKrO4XumtomlA-1; Tue, 11 Mar 2025 16:02:53 -0400
X-MC-Unique: uDBV1L-AOUKrO4XumtomlA-1
X-Mimecast-MFC-AGG-ID: uDBV1L-AOUKrO4XumtomlA_1741723372
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3912d9848a7so101061f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 13:02:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741723372; x=1742328172;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jcN6AhGFmZwyWIgsYRQkrJVVdkpynFpZX2fNETRTvzo=;
        b=PZWL7I7N+ficB/uHTLg82FgS2SiAoKKWS+qKLOWyK9wOF7+sHJaWyZF/9LNDT9N4Qo
         vnYos6NT24eXE0eVRcHr06DPa2qZZrb7BcuqjfjHFGyBisKTGo3FQQc3hpE2fbr4ohgL
         kZOjqFrTApQR6gk9OMDWu2bXVyCwDyXquo/+MQLtRUxTTkXF73nz6OhbU9oAd3QGbS8f
         VXeDX3/62vd+FqrDvZJ2Z1lcxJXlY07fN7m/zcVhcQht/47OC3Vv2sHL4s5N8zliBaW/
         sjqpCRl3Q6aUXPjfOTFqz8QAmY00tv5Nd83607mBiFne7Tft/4s5w/cS9m4AmWmyope0
         nm1g==
X-Forwarded-Encrypted: i=1; AJvYcCVHijiSxYKwL9QiGR4qMfxgngk3WR5dr5c1dezfN15fww/HIczR2IgbiMNyaRP+11CS03ZAKOF8W1f2+1xXX5n2@lists.infradead.org
X-Gm-Message-State: AOJu0YzmTivtadhVbRspwlPKLM6zyAsf6iYgQVYfjXBTTsqAIuvFRXYr
	rnX1ah9gwNoycCGpo2mfky3p5A7f0iiRiyf+n7x3l+sQIgxtmf0R51BURUhN4KQGXsqW6VTDJUp
	qxpg00tr/+tRAy/EF22MaBS4DzXL/A+0rMqVvhlObt2KYpwjEuPxmfFSgevwsvWY8e8vPvdW4
X-Gm-Gg: ASbGnctwEAHXSTb2TQCAsnCu8Hk5BND2XEb8K+puHF5Kx1YWx3Ok8dVCtWNZjhrlLyW
	dcoEoKQmwLkClLrA0A2g/AE/vEbbj+QlrnahTPnQFWGWc7qcx9st6xRp+BzPgxKBLoU0HkclrbB
	67Jm+x7e0cd1oe1kgXvTFuX9d4O8LJpJHGpZy7PY4/TdHW6CwL/YuqKZVtUxZUOSqK56VmoAe0+
	b1p28qBec32VnjZwrErqcxf9EUMIzMSPsXuMEjCoNnPe+TuWIYDRkZf1owt4XuBfFRYT+tr8TVH
	lYE1Nq6LrrQsz+5L/y/GYaWG8npuuIDCorwGoQt16Yb3IUSWX4x6Vg245J+Ls30L+0je5hi/trv
	0fDknN2P+fz6Lwk6G53qwCL32WfawFA0sjR8MYHKkSkE=
X-Received: by 2002:a05:6000:144e:b0:390:e9ee:f27a with SMTP id ffacd0b85a97d-3926d6e5b77mr5138832f8f.28.1741723372059;
        Tue, 11 Mar 2025 13:02:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGz1KnszMO1UGmdIqIa6glXoDVrgPQeVqHRiLLlBMuqiLukT4z+73e1IBXVmM416wU4yqyiUA==
X-Received: by 2002:a05:6000:144e:b0:390:e9ee:f27a with SMTP id ffacd0b85a97d-3926d6e5b77mr5138797f8f.28.1741723371718;
        Tue, 11 Mar 2025 13:02:51 -0700 (PDT)
Received: from ?IPV6:2003:cb:c720:ed00:a9b3:5954:823e:3427? (p200300cbc720ed00a9b35954823e3427.dip0.t-ipconnect.de. [2003:cb:c720:ed00:a9b3:5954:823e:3427])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c103f41sm18750782f8f.85.2025.03.11.13.02.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 13:02:50 -0700 (PDT)
Message-ID: <03a7797a-75a0-4b45-b5b0-bf8bfb7f0955@redhat.com>
Date: Tue, 11 Mar 2025 21:02:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v1 3/3] kernel/events/uprobes: uprobe_write_opcode()
 rewrite
To: Oleg Nesterov <oleg@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, Russell King <linux@armlinux.org.uk>,
 Masami Hiramatsu <mhiramat@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "Liang, Kan" <kan.liang@linux.intel.com>,
 Tong Tiangen <tongtiangen@huawei.com>
References: <20250304154846.1937958-1-david@redhat.com>
 <20250304154846.1937958-4-david@redhat.com>
 <20250310170320.GC26382@redhat.com>
 <79ec5aa9-1937-436e-8cf4-436746142f7b@redhat.com>
 <20250311123241.GB3493@redhat.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250311123241.GB3493@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OxwSyKZUDeHCQeoW3UHND57Tlr5BOLovNfnNOy2HvP8_1741723372
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_130303_024786_74FCCA15 
X-CRM114-Status: GOOD (  18.70  )
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

On 11.03.25 13:32, Oleg Nesterov wrote:
> On 03/11, David Hildenbrand wrote:
>>
>> Regarding both questions, the code is fairly racy. Nothing would stop user
>> space from (a) modifying that memory
> 
> Yes, but we don't really care. uprobes.c assumes that user-space won't play
> with the probed memory.

Right, I primarily care about that if user space would do it, that we 
don't trigger unintended behavior (e.g., overwriting pagecache pages 
etc, WARN etc).

Likely the re-validating the page content is indeed something we can drop.

> 
> Note that if is_register is false, then vma can be even writable. Hmm, why?
> Perhaps valid_vma() should ignore is_register and nack VM_MAYWRITE ? But
> this doesn't really matter, say, gdb can change this memory anyway. Again,
> we don't really care.
> 
>>> do something like
>>>
>>> 	/* Walk the page tables again, to perform the actual update. */
>>> 	ret = -EAGAIN;
>>> 	folio = folio_walk_start(&fw, vma, vaddr, 0);
>>> 	if (folio) {
>>> 		if (fw.page == page) {
>>> 			WARN_ON(is_register && !folio_test_anon(folio));
>>
>> Yes, that would work (we could leave the WARN_ON in __uprobe_write_opcode),
>> but I am not sure if the end result is better better. No strong opinion on
>> the details though.
> 
> Will, this way __uprobe_write_opcode() will look a little bit simpler...
> 
> But I won't insist, please do what you think is better.

I'll take another look at this series probably next week (I'm on PTO 
this week) to then resend once adjusted + retested.

Thanks!

-- 
Cheers,

David / dhildenb


