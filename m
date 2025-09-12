Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C857CCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 15:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LwtSBiRgh7l8m3eHqvj0Z/4D72nKcmOwOzm2avrIc6A=; b=i5dWGUw9dO6/yYlnbZSj5zcNkr
	yzNAGJNiuU36nLsvcRK34kK7Atmk0IVe0Qc/BluQLLnIsaetN2OrtLrEn0KMOu7NvT/O4TW1n0DwJ
	B+skoA6lVVQh5gTE8WLYY+vZY69YMP0FC6k4T3VlUOtX4KmfNzLEvrMfwcHNMQS8JpjDv8Dt/gvjj
	jEceJjLKk1iBszFfWpHX845ify5gHgOrHM4kDIUL866zEnwbMAZU0/C2DLAfN/ZlsXZQGMehXMsEj
	cODGoWYggz5VLI49HzzIIhq37rauQ4cTDY+HT23Tftq0RCPmwQUEOA/GY8Xe+kD60DTSglh+ohYQ5
	wJmz2zmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux68Z-0000000APQR-3Kdn;
	Fri, 12 Sep 2025 15:56:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux68X-0000000APP4-1J1U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 15:56:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757692592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=LwtSBiRgh7l8m3eHqvj0Z/4D72nKcmOwOzm2avrIc6A=;
	b=ctmMaf/dTAnZqm/1FWhLrIVm2+Hd5HkV2vlC51JLfVzcVtWlS7EzfvqELj+yhJG+WCpyuw
	5aOXAHj++HLx38QY6eu4KXkAZTILwA3zQMgYPBrprgS7D3vWM0DaJnhqxnQ0eBV74ZXVaX
	o33ZjdcuU6mpI/t1IMAhWcApokxsuLA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-168-EajnvaeXN5qvKzcrr8D-HQ-1; Fri, 12 Sep 2025 11:56:26 -0400
X-MC-Unique: EajnvaeXN5qvKzcrr8D-HQ-1
X-Mimecast-MFC-AGG-ID: EajnvaeXN5qvKzcrr8D-HQ_1757692585
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45e037fd142so16279765e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 08:56:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757692585; x=1758297385;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LwtSBiRgh7l8m3eHqvj0Z/4D72nKcmOwOzm2avrIc6A=;
        b=AYex1bYw32L2XLrDEwLC2fItVgbUHy1Nv3GiwffdZi4P5VIkEoPBTLOX3LZiK332g3
         iuD1bB6oRGTOAz++O+a/n2SgxvvWi5NWcr2oA4N/vjL2bg4O/Qt6sSd1DCGe202hoHYc
         Tpt8tf7axfJ39Hiwi1j75nkLm5HWePeOGGo5crh2ypmhigPV+yAY6EgriNTDwdf4bVDF
         A7XLqMFd+Lt1RHFgU91yd8DlNmVKLTd/evojbg7HEYiRcIIVpu2lnBcmbCDfp6WdioGq
         mgugb9CTiILzwYBv16qGZLMPZuGa6MA3eYRvOkWpz8rhtYjYWdbJun6KdEs01I5+m1+3
         OVSw==
X-Forwarded-Encrypted: i=1; AJvYcCWmDseAIhOVwHzD4RVgsNt+2/653DEVIGwiBUMKzucFxBR3yBPgveweOi4FaSYWZOs4i0ZhHy+GgBvN+qoFb6ND@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7YeDdEdXuLvBi9sXJV7+1v0RnpVgCksyWKcwLAq1kb/7/Mt7a
	Z41iHOmMsF7Tsro0ly2ZpuSEttXJ2lgjr3s3yCqqKya104BLtEBr00gOV4j161Id4BkOKpk1urO
	mBsPAyR16aiwXfgpDapsSTQsYtfBksurKE2a64ZpkzkS4Ums2GgI15V9QIQ9Q8JxKs+XZHyEMYV
	IJ
X-Gm-Gg: ASbGnctNJhfVxrdCG8Mix62NQNUMrg+9TnCzzBt+KJMcAdDoR3gk3m3auFoN28ksPTn
	E7UMvNmr6IV0FeKSakBSy2XILFEp+iPPI+8VGoFhQBIW2GouzcmiXKy4pt6BMMw6uw6Yg5qS3Bt
	hnaytxZYjPBNkIqrA7VIegyI48tTU8rkzEQMkk1rtzB1cV6m3jqlbrsIBEMGefdLBTweUFw/QTN
	EfEPkH5TAwpL269dzr5SOG7tDJx3frrgNMogHVD/pGVb3Yzk9j3naXZkmp9GwV2E11xI3UZuiTs
	Nz3lbC3E9P0xYxBiXq9bE8+2eGxYkf+1MAkSuDyVOacFq372HQejhw6c2sx/75MjwNlQfb3+3VW
	r/qrNrZd92Mo5xDXFXLVUJtIlcXuNiQvSymgG1fUAAHvyR8SnBVgjX6Gl4XTQsmouPqw=
X-Received: by 2002:a05:600c:22d2:b0:45d:ec9d:5fc3 with SMTP id 5b1f17b1804b1-45f211f6790mr33105715e9.18.1757692585265;
        Fri, 12 Sep 2025 08:56:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFac7W1MrERsCK511VnCTt0k5ir4FTQySao9wgWh9TgtQ8MeIZa8a3y4/zUuscFnBsbmei1sA==
X-Received: by 2002:a05:600c:22d2:b0:45d:ec9d:5fc3 with SMTP id 5b1f17b1804b1-45f211f6790mr33105325e9.18.1757692584728;
        Fri, 12 Sep 2025 08:56:24 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f20:da00:b70a:d502:3b51:1f2d? (p200300d82f20da00b70ad5023b511f2d.dip0.t-ipconnect.de. [2003:d8:2f20:da00:b70a:d502:3b51:1f2d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e037d62besm65340495e9.21.2025.09.12.08.56.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 08:56:24 -0700 (PDT)
Message-ID: <9c2e289c-0258-4e25-aaeb-a97be89ebd84@redhat.com>
Date: Fri, 12 Sep 2025 17:56:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v3 00/16] Introduce kmemdump
To: Eugen Hristev <eugen.hristev@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, tglx@linutronix.de,
 andersson@kernel.org, pmladek@suse.com, rdunlap@infradead.org,
 corbet@lwn.net, mhocko@suse.com
Cc: tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 jonechou@google.com, rostedt@goodmis.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20250912150855.2901211-1-eugen.hristev@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cbxV2t1IRhHVax-Nz89Zj7tLcvHifUDMI8iwlXoLPW4_1757692585
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_085633_417383_492DDAC4 
X-CRM114-Status: GOOD (  10.45  )
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

> 
> Changelog since the v2 of the RFC:
> - V2 available here : https://lore.kernel.org/all/20250724135512.518487-1-eugen.hristev@linaro.org/
> - Removed the .section as requested by David Hildenbrand.
> - Moved all kmemdump registration(when possible) to vmcoreinfo.
> - Because of this, some of the variables that I was registering had to be non-static
> so I had to modify this as per David Hildenbrand suggestion.
> - Fixed minor things in the Kinfo driver: one field was broken, fixed some
> compiler warnings, fixed the copyright and remove some useless includes.
> - Moved the whole kmemdump from drivers/debug into mm/ and Kconfigs into mm/Kconfig.debug
> and it's now available in kernel hacking, as per Randy Dunlap review
> - Reworked some of the Documentation as per review from Jon Corbet

IIUC, it's now only printk.c where we do kmemdump-related magic, right?

-- 
Cheers

David / dhildenb


