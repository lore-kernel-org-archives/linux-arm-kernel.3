Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F51AE7719F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 13:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PttcTbV6q4JSNPDitRHrXVO5rJhcJB2dabUIlHPBpi0=; b=SnW3PxSzBsdQo04KVYXYmbURTm
	xuZoQyHfPiCByTZv6lCkkVBPUEdhuqLk5cdpf7YX6smltUDaNO2OTpvK/MFG8r2fr1Fdy17CJjiUv
	sitlwGF9Tf3iRylIAfmPzPB+l2MoFZIA7zt/jLIZXIcAe+mp/GHbelm30zEcGfGUmDLlZ82MgpE4z
	0Q13PuQse1SQbEhiGA9nDH1aon78fO34wFd98DgWbNkwUdXVwSVFxHSa9odj8ZJ7VX0mYlyOciLFS
	TJ/E+zFJQ4e4eGs+wI92XLDpBWICwzvRJH9Nav4HqjZO/JNiTjI3hCyGWz+dupretYhoewxyzczy3
	RvJFMUBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXKNA-00000005EEV-3mxd;
	Mon, 13 Jan 2025 13:20:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXKLv-00000005Duz-2ud0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 13:19:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736774374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PttcTbV6q4JSNPDitRHrXVO5rJhcJB2dabUIlHPBpi0=;
	b=D9qcbtLGUED1pv9rpQEpghSXFbxWKyUhSpXC5xouAXT7SAhivWwsHDc64ivBXj6ZhBAOrb
	U/x8hcAN6oV2znzxtpKHotYfOHnuwzbKf5ad1+JOIdGziaG80LvEJBdB2oYUiRMKZ30232
	TiWtvUA2gD5xz8ZvmO9uy7LEpITOgTY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-257-XtUm5J_lMU6eiqZdeT3WcQ-1; Mon, 13 Jan 2025 08:19:31 -0500
X-MC-Unique: XtUm5J_lMU6eiqZdeT3WcQ-1
X-Mimecast-MFC-AGG-ID: XtUm5J_lMU6eiqZdeT3WcQ
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3862b364578so2442611f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 05:19:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736774369; x=1737379169;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PttcTbV6q4JSNPDitRHrXVO5rJhcJB2dabUIlHPBpi0=;
        b=F9CDhECb+gf9lIr779qfAr6OaEYEaqSnHbldokoz1nIaBjNozqiAA0l88MPeRxumtW
         XUXM/2v2SeyvjeQyp6NhfMjlZaVevqx7gWFVksssdlp4RR9FwuVDHHhNbmHVaUjCdrQr
         mkbG2GX5Zw62vzVLqW1z2yvOuW8p+qdE1UfgAc+OaYBgV0LXs4XUsSG3p2CPLJw4T5q/
         M1Z7znK1NkgWEfUADcjB2Bgt3yFlMPjCpZEloIOmA/XN7eNmzJbOQfrlLcdSu2dgLMgD
         p0PtR7arXwyywdRBLZh/sjBlhznY1AoRQEeqvbXkYikN9VL3nE5PbZaiV8OK97hOPZh+
         qL4g==
X-Forwarded-Encrypted: i=1; AJvYcCWr9xoYEHyMCE1ADoKwhwiyJJVZ0bVgb/ztS1Io18T1wT+GtK7JDaka4/7xCsh8kKCT8ZDTQNMbFxzNTM3onWic@lists.infradead.org
X-Gm-Message-State: AOJu0YyIwnfIyU2j4LZBBU4QgJaIb2rakhgC/9ITjkbpBHtXT32aqUdU
	ESnik79aKsdik3Lco7SxP2YibPhH26MRKHX4qcKisipcUdickp/Yum7KwKfXYIcEsthfEIEiTyn
	Vvf52qx2O2NoZpbtowHMCX2ZsHGTROGjZu3prdyotGtwjONjNtv+PsXy7BEMg/lmzcRk9xjHm
X-Gm-Gg: ASbGncuoxq8s4vTA2x5HzWutithKXnRF43q5/IaoI6nQL+/c0txI2XN7FIdIlLqYLMX
	lMEqFMBXOiSNfFCskd2MxugbBWDmrvknag90bmxhwyuGpcThXxTbf2T0bDunWoaXOGcXiDFub7O
	H492uhx6LRuAA8+C4qDfZGAe0MvSJnsS+pi1XcpyntEluRX4fMJQIrG0Aoo1m8zkm1K7gsdpmy/
	cb4JJsosf5utLAm26f4w45Js8HSiO/dg8EbhoRMPDFflZHfnbUdhDQTqEsI9DLJEmQcoBsGltFK
	Le/BwTgv7O0ql/g=
X-Received: by 2002:a05:6000:1aca:b0:386:3bde:9849 with SMTP id ffacd0b85a97d-38a8b0caa82mr14308081f8f.12.1736774368926;
        Mon, 13 Jan 2025 05:19:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmrfLkoC0dheFen0KOd3QX1GBKHjDo/69IXQ3IByuhquzkA2mL2+9hUXz910tsz5nN/hQhSg==
X-Received: by 2002:a05:6000:1aca:b0:386:3bde:9849 with SMTP id ffacd0b85a97d-38a8b0caa82mr14308054f8f.12.1736774368577;
        Mon, 13 Jan 2025 05:19:28 -0800 (PST)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436f9bc6b9bsm53356035e9.22.2025.01.13.05.19.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 05:19:27 -0800 (PST)
Message-ID: <296b04db-9524-48f1-9fa1-0b028bc939a6@redhat.com>
Date: Mon, 13 Jan 2025 14:19:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] mm: Set folio swapbacked iff folios are dirty in
 try_to_unmap_one
To: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org
Cc: baolin.wang@linux.alibaba.com, chrisl@kernel.org, ioworker0@gmail.com,
 kasong@tencent.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, ryan.roberts@arm.com, v-songbaohua@oppo.com,
 x86@kernel.org, linux-riscv@lists.infradead.org, ying.huang@intel.com,
 zhengtangquan@oppo.com, lorenzo.stoakes@oracle.com
References: <20250113033901.68951-1-21cnbao@gmail.com>
 <20250113033901.68951-2-21cnbao@gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250113033901.68951-2-21cnbao@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nWfSYln6hl1Sob18ppL6UNnYsMSIL72RzW9iurvpXnA_1736774369
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_051935_801279_1395E957 
X-CRM114-Status: GOOD (  10.19  )
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

On 13.01.25 04:38, Barry Song wrote:
> From: Barry Song <v-songbaohua@oppo.com>
> 
> The refcount may be temporarily or long-term increased, but this does
> not change the fundamental nature of the folio already being lazy-
> freed. Therefore, we only reset 'swapbacked' when we are certain the
> folio is dirty and not droppable.
> 
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


