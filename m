Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D55EC87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 08:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ligMKuzMymYT6q7hFg+L6jC/QWTmCs2aLfpugFK2uvY=; b=mFrhZ6hbA4wJbCVEQoQpV+lNLI
	nvscAdWDKUaqh1aNQquIWgR3CBdZetHLA2EjfqXGxYggsiePEuVbivtBAytiyH+Y1QV9G/b+I6v9a
	PepTzmtkWwXGA92fL38ig/iz4ShEzQM3Rrh+yhbHhDF21ssrkOi78HhjUUSo2DhF5yDglLFo55otN
	Q3ezmTtcEm8wCRskSlBJrNMTPeQ3GBcM5pqfgL3sWoE44s7M8khzC4JSrdmeBLXveK3+L81qeOxjV
	bgGiU2y1uRLNcXSpDeyv7kaOI+1FJU/vZ15Xrmi5ld8+Q1ijCxzfvARR+GbWaDQcFV/elPhZTQAVV
	tcALgdAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujZzz-0000000Eh5y-42Oo;
	Wed, 06 Aug 2025 08:59:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujZwa-0000000EgcF-01tI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 08:56:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754470579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ligMKuzMymYT6q7hFg+L6jC/QWTmCs2aLfpugFK2uvY=;
	b=ODlXj5FrSqVN9aD2uh2x2LgdUBfaAsPlG99bRJWGkhMFoqqGGuEQiKvGhPDaD41JMUlmTB
	iPhE9TMp1niZ4SG0eNN7vmBWV5D9U/dgHcDko4h7M/NSMiCT1jj/4k6BBA0oWi4Cyghk1J
	HPVOmKeuNqab3PIX1TrYTG4dSeT/TIM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-YUQ4HqqZPtSz-btJ4Wpz0A-1; Wed, 06 Aug 2025 04:56:17 -0400
X-MC-Unique: YUQ4HqqZPtSz-btJ4Wpz0A-1
X-Mimecast-MFC-AGG-ID: YUQ4HqqZPtSz-btJ4Wpz0A_1754470576
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3b8dac70703so341583f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 01:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754470576; x=1755075376;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ligMKuzMymYT6q7hFg+L6jC/QWTmCs2aLfpugFK2uvY=;
        b=O1FAfpD+ABDUTJpMW3LehRmH51ar4+H74S6bIvjHAAEiejs7moW2YqCeCEMqhzE2C/
         IKxE4chyS+mKhnqImnf57p0O5rnAx107haSZVWwgOqUuezz3yoHCbhGnqH2MKm3VadRA
         Jr1x3azhygrc3lEEunEvPJcaeDLFZX4tyyTT9dX6tS9JCE1wozm9uhmrUHI9sE/XSr66
         AMDr1apSbA3C0xw5ycacVV9/kGDcZosX87AEw5bZ514Nqrejd9K2/lTWmef/bmNqiezd
         4wJzcWL9l70APR/IuGioOv8Mb0lgG2tYg9AHU48CFOAuL/KMJe0DNon8KYFtNe8Dw2qf
         aesQ==
X-Forwarded-Encrypted: i=1; AJvYcCXe3BJgNq695MtU7iEqRiiieKWOL8tR/Cy2VenjD03om+UmjhECyxyd9/7e1HaIiWqRpbe7WKOWR58iIvBHOEKv@lists.infradead.org
X-Gm-Message-State: AOJu0YwQqWCHyF0xmuuWQPcO+QAb5mn/rlXUcMrZvSwVpmXIEg6A0vbS
	ElIoYGPbxeVW2kWj5C8L8s9yZiPQEZ3D9jvhbjzwe3S1/zJli8s9nsnXiNXyyEXT1ZlY0oQ3LUl
	azpThyQkrP7Sx55ZFEDTouOXp8JpTYdmvsDtYS9xBvuXKSNNbjoyakrjPby9u+Qu5wrB/xI3wCS
	LY
X-Gm-Gg: ASbGncsjsZWT6dLjWGT+ccksAIDCuNgZB6X23gdNLYwIV1hnfjX3NtPGefFM7ea6FSj
	sbeOfmIMWvnNYkr3hz9A0CIX49OogUtBlXRASGq1MuqLBENxBsEEPJCO5YyQK/QkmsuXqObJvUP
	/fvdjZBM/xL/egifWHeLdfRSsMkgj/ny7kDYF7tIhI7jWM1YRjVAo6SpgOZJy3i+Wl7fieya3Z3
	SBG2/61Rz4HwE3b67aCZWwZh5jS+QCHbUfWqm63vELfdj6de8+iio75AQdfjfNupMlT19i4kGbE
	bd6LXWt7LJz7NRLhqy1DO0nPuR/FPpI1d3uEyb66B+Bp2CWldVDHT94b93BDPqmSPWh32KFa+i3
	oJnql0Kn5rFfEBayKdHdxT0xvtaGjTQ7zfxI4nHFjAWLWYXFquoUIM/F59gg/gPOC4+E=
X-Received: by 2002:a05:6000:1a8f:b0:3b8:d25e:f480 with SMTP id ffacd0b85a97d-3b8f43723femr1567468f8f.29.1754470576129;
        Wed, 06 Aug 2025 01:56:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4JMRKLdw3mXUV5OuDO/tBpecNu9HjGvZkP0QMVtkPkAWZcsAuNEwVje9OMdBe9DlC7UE48w==
X-Received: by 2002:a05:6000:1a8f:b0:3b8:d25e:f480 with SMTP id ffacd0b85a97d-3b8f43723femr1567434f8f.29.1754470575683;
        Wed, 06 Aug 2025 01:56:15 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f35:8a00:42f7:2657:34cc:a51f? (p200300d82f358a0042f7265734cca51f.dip0.t-ipconnect.de. [2003:d8:2f35:8a00:42f7:2657:34cc:a51f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c466838sm23317600f8f.49.2025.08.06.01.56.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 01:56:14 -0700 (PDT)
Message-ID: <4e6e0492-f2f3-44d8-ad02-084a47c9fa4b@redhat.com>
Date: Wed, 6 Aug 2025 10:56:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] mm: Optimize mprotect() by PTE batching
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: ryan.roberts@arm.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, anshuman.khandual@arm.com, peterx@redhat.com,
 joey.gouly@arm.com, ioworker0@gmail.com, baohua@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250718090244.21092-1-dev.jain@arm.com>
 <20250718090244.21092-7-dev.jain@arm.com>
 <7567c594-7588-49e0-8b09-2a591181b24d@redhat.com>
 <a2fdcb87-9223-4091-8bda-9d9316c84cf4@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <a2fdcb87-9223-4091-8bda-9d9316c84cf4@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gM3DFXqdhq27lh4IxB50RPEIz6RS02ZZA1qbCDdjllU_1754470576
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_015620_110080_8010B2C6 
X-CRM114-Status: UNSURE (   8.57  )
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


>> While staring at this:
>>
>> Very broken indentation.
> 
> Indeed, but then in order to fix the indentation if we start positioning
> 
> every argument just below the opening bracket then it will take at least
> four lines :)

You are allowed to use more than 80 chars if there is good reason :)

-- 
Cheers,

David / dhildenb


