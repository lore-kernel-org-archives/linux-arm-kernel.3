Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 802F5C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 12:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7gn15plHVRiqXpFBn0Z9q9dTxOPDKBEPCsHLFphLWXc=; b=t5+Ip+f0RWyJA5m1CFVbkeC8Qc
	ikzZJtfTpjHdPHMc8BdDrUsqPXoGqXJ+hEBvnW4nMHsR2VTV1lWZ40RPRRXMvlYqYkf62KCeR8/8x
	pBo89X7fCGeZ/rh6fnDU4KHh2/qr9bfHbwVrtCemiOuRas2bEhbVVNK9FSWKHRNgzn3OoTsNge4uf
	MuraGQCJ5wPFw228PgZc2mCg/V7wpqHVvjIX+gELipm8ilHaY5ERrNL5I+i15gjOHH2YlNbMNbu+O
	J7duH95aimX96CmPrcyk7QhuVeod/SXaaCj127KlVUJoKQLAzLPNJ9tGXTHXp7QSuHlsxKQWPPPuO
	G439rDrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tusAk-00000008uyW-433E;
	Wed, 19 Mar 2025 12:05:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tus8S-00000008uYv-1pLX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 12:03:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742385779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=7gn15plHVRiqXpFBn0Z9q9dTxOPDKBEPCsHLFphLWXc=;
	b=Y20+15DAQhAkFq3bvd7HKEgB0wHKYqiQcPn9ZtAlUqqQAYzSPTKiRUQvaRqE8r7Gof9Hgm
	87+jiRYSjXGrPHczw+xZqy4KwY+8i2YPtcEpD08bf5eG2q9z+lqvBjT5u947CUNTL72+1M
	QkaUrC4/Zy6/CLAy6+nQfCah4lCf6IE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-JQx9QZRfMSOcCwMbzdbQUw-1; Wed, 19 Mar 2025 08:02:58 -0400
X-MC-Unique: JQx9QZRfMSOcCwMbzdbQUw-1
X-Mimecast-MFC-AGG-ID: JQx9QZRfMSOcCwMbzdbQUw_1742385777
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43ce245c5acso50788515e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 05:02:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742385777; x=1742990577;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7gn15plHVRiqXpFBn0Z9q9dTxOPDKBEPCsHLFphLWXc=;
        b=kM21njjCXO7Qr0chALpvpgpOX1ryOLRxsFnDUMYxzDEMETN51w/+Id4DSEfe2fS5zl
         jqU7UJi/DqXbN9ak7n0bDcrOywAPm/nAcSIQ6X9f9CjZrJVZY/U8as5hrNpBjKpxfcsz
         5Ndvr7WMjsfyqW/FOi4HR/0im+Xgnu+Ra9InSF8JPxBn9OHgV8Yrm+Rq6wykkqx3Y08v
         16FrfUA906Ub6wfCwdF9zbsEfxAPl8Ppk2OwZYq+tvj0+UUQmtR7jarFa94xhLGQkf20
         QkdYq7s6ZLhoXcQVWn4rB85wWHK1zcHOnHoEfTnI2sVswWoN2idE+a35Uv3fVb61zTPo
         su9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXFhy40mAlZsgNRroesr7SedEFTRTgTlPLkL0KT4eJigdd2S+TYJiklW+dKlDNXeCf3hNhzmiIHFOfDS3Ot9f9J@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+GssUMFXhl01ImPfUD5piNYeGVjVe3+tcq58Fn428sKrpbgr+
	tFARlvb3TJr6FW6yZ79v0KMpHuIk51vpn/fPKyTS3GTb2O8us8JS6YaHjXQL2CeAUT9XzXzu9w9
	NF/F3G8rMDQkIQqmKhFmlJXybvku8PW9NxNLXH3cx5fo7+g53xvoAfEY4fX85rzjdgxSL6lUi
X-Gm-Gg: ASbGncvrEurVgyD1mhaINJq306LLKLTMIzY4vOGMefhTg3My8wjB0HcyXXd+6/Sh3oz
	Il6acbuFALHtyeXcG1MNhK1wpjicNGMxJh6/bj1wumviMDyGHJ2p8mgohML3vCuY/k2GBrCWMUN
	2tNKxx5YkmmzwJ6PNP7RQnAShWStp903tEUwbqSYU8EvGPYRN6RABdyXK1aa0pO/pG1X94ou7Vi
	RsWZKaCMDWteL43QiNVGxO3IG1qMhJLr/94uHCZuKXGZ6p5k8BzE1iwL/KBgj87QsqAyRAYLXcK
	Fwlg4FrOsU2S0DCyvaxfInjtQy5+H3k0XqBFUcg3z7Caw+t2MjPOa3eRPCHPOU27UyTSYJQu+Bv
	XcHSF6HlBKvVD5kMUNqnuUWodAgRhKkBWPqBmfvczKXI=
X-Received: by 2002:a05:600c:46c6:b0:43c:f5fe:5c26 with SMTP id 5b1f17b1804b1-43d43786292mr21442985e9.4.1742385775956;
        Wed, 19 Mar 2025 05:02:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEO9wFO2nTkTUlJSs58/meqK0dfmIPHPe7ubDLeTE+LBbIu5UE13qcBy19o/yn3H77bmuGCZw==
X-Received: by 2002:a05:600c:46c6:b0:43c:f5fe:5c26 with SMTP id 5b1f17b1804b1-43d43786292mr21439295e9.4.1742385773180;
        Wed, 19 Mar 2025 05:02:53 -0700 (PDT)
Received: from ?IPV6:2003:cb:c705:df00:67e8:5c3d:de72:4929? (p200300cbc705df0067e85c3dde724929.dip0.t-ipconnect.de. [2003:cb:c705:df00:67e8:5c3d:de72:4929])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d440ed4cbsm16960215e9.34.2025.03.19.05.02.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 05:02:52 -0700 (PDT)
Message-ID: <d0f0cbb3-6284-4060-afdb-ea828b9e909d@redhat.com>
Date: Wed, 19 Mar 2025 13:02:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] kernel/events/uprobes: uprobe_write_opcode()
 rewrite
To: Oleg Nesterov <oleg@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Andrii Nakryiko <andrii.nakryiko@gmail.com>,
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
References: <20250318221457.3055598-1-david@redhat.com>
 <20250318221457.3055598-4-david@redhat.com>
 <20250319120028.GA26879@redhat.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250319120028.GA26879@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8VkcbdlgBtBYKgb3ZCB0ezQPoYu_6Y36Le86xHCh1n8_1742385777
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_050300_556432_31AC00B3 
X-CRM114-Status: GOOD (  13.86  )
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

On 19.03.25 13:00, Oleg Nesterov wrote:
> On 03/18, David Hildenbrand wrote:
>>
>> +	if (unlikely(!folio_test_anon(folio))) {
>> +		VM_WARN_ON_ONCE(is_register);
>> +		goto out;
>> +	}
> 
> Don't we need folio_put() before "goto out" ?
> 

Yes, thanks! ... as always, the result of some last-minute reshuffling :)

> Other than that, for this series:
> 
> Acked-by: Oleg Nesterov <oleg@redhat.com>
> 


-- 
Cheers,

David / dhildenb


