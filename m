Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD185CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 07:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dVrVz1y1JTYA35iR89KO57gWYWUGvkIopfwpVXaBh+A=; b=lroa2UffzQPd1lXStq4UQUdgf+
	75cOs+0CkW5Vdrz/+6CRSBYJqGYRLjphiPORUkjU/UjE13awVqwn22Rpw/R/Nn8Nm9NL2oGiWfxmw
	u6+iUbjyZAwKxpFxi/Q3rn6MntT/UY7ls7q/Bjp3jrgzG7ZBCxLFGvhXbSNQ5Wk0ZWVp84wJwZG9+
	r+b/eY9gj4FQV3LEls+EtGudrUaXgj1/JnOIjIrNt2xJhdtTFOmYHFDI+T3CDcvorTaoFrL4xGJED
	YWAUNiKy/QTSyfIWdXgSckznysffjjUejXH6q+VzBvoozigBCj/dNee0Nzk29BzHvUzZtqZhEBe08
	/FxbXDwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uymP9-0000000ARIP-1oc9;
	Wed, 17 Sep 2025 07:16:39 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uymP6-0000000ARHb-1IDd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 07:16:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758093393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=dVrVz1y1JTYA35iR89KO57gWYWUGvkIopfwpVXaBh+A=;
	b=b4DK/5ht6QPIe7llFKbPvGqx1bSfeBX8vbQi+ZhqJ+Duv9Cx1zXD437hocrr2Biscj1ZJh
	DUKdp94W9GFjRk6mvaKkpEjz+l78MgLmGRmAecBj6Yj8g++wliWol1wvL7VQeuL1Tda3sE
	afk/uRKtw3nGG0ut0XUgM7pm/klUano=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-T8nrGQLiOzuTeXPUYfU2PA-1; Wed, 17 Sep 2025 03:16:32 -0400
X-MC-Unique: T8nrGQLiOzuTeXPUYfU2PA-1
X-Mimecast-MFC-AGG-ID: T8nrGQLiOzuTeXPUYfU2PA_1758093391
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3eaed4aea75so2251579f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 00:16:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758093391; x=1758698191;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dVrVz1y1JTYA35iR89KO57gWYWUGvkIopfwpVXaBh+A=;
        b=HlJnSMFY6uyZ91KOBXQYqAT/KuXexmKIrrsmnK833j9ZHeTkkeAuit/zJDSp1fWh2Q
         29qPL45SA+KLh02SQEhT5oIEIJikfq0GzKu3KZ69MFdYtBfogOuM7N7BgW6wte4S4EZS
         Yv/Z4yecPfOC0cmrGzh3qpHrLs024xlmThdsOidmYMD7PossNtBRRC7AO/lWFSPKKH52
         7b/jr4sg5cS3r7km9mVuUs1FStC/jqN4yQSCWjBHUOPn1M8I+Yv+08vfgjmPwakVaQXT
         KB4XM/gIZWv0CITATFLjkP1fFC0TyE1/Zvn4NsNI1Qn2L5DEO+rwp5W2MdmtBAS0cQty
         WQPA==
X-Forwarded-Encrypted: i=1; AJvYcCWDiMvVLUEgSxHvaA3Mg17bqgWJqz2uqsR7E+6yuQ/5QXqZ5wXoR+tnZj4M2Vu15+DLfsbgu7JMM9nTJig6sTq3@lists.infradead.org
X-Gm-Message-State: AOJu0YwPNqQpHbLGRyiuNpjyyuL1hZHDmVw7q/oQ6FOZvQgCVLJwDZoo
	QpNVxQBA0djV1BtjNjy8khEJGL3paISMt1LMXex/jnT6bhBHdKHrplPGXoXmUMES93YdzZ+ysoM
	lybLQ+dii2xZZ/OJ4Kvo+0OkwDKb6y2wEZPaT+yuEsafMqd+abZa0EawnNUJmNm6NON86reUwLJ
	3A
X-Gm-Gg: ASbGncu4sA3/qHZu2jGCXJLz8l76Xf0AsZbLJNicB4xkpv2Y4xh5l028wwGmu00PDhD
	uhMUMtDYpSFB+zEMeiqaFhQ3NmumMvLDTT9E7KameeOfUxPCQcpmJmRbaa2064udhiFR94dA3h+
	FdEnL/hHGxjCNVyOwc8mH1ww+9Fr4XAYwEhn0Nb4LMUUUQaXX0o6xo5cTIyR1IzTvBIpwRNxS4t
	fqc6cah0cRFNu73UV0gUG/QXMD3LizKZBO6k83R4FWfuyPydQ8mxeUMO+eKblBxr3EWIYF7d4u7
	PzJJzA2wh0q8eQqnJ6rR8KMxazaf4QnIOaO3+nh8gsdy4yg2scSqz4M9KalpuPDvSmeZNFrogYg
	sd/HwRMiJYU8nKe8UBB5skKiCspQBAGUes98NQzme6pHC1jEkrdOSI7zRsMdUrmO4
X-Received: by 2002:a05:6000:24c5:b0:3e8:b4cb:c3a0 with SMTP id ffacd0b85a97d-3ecdf9afe4amr737087f8f.8.1758093391101;
        Wed, 17 Sep 2025 00:16:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6KvkUbAw/hWHVpyZFeQHd7+eZojTjephumHug7ngWtVuZzWRraD7sIx3LIE+G0iYk+zOhBg==
X-Received: by 2002:a05:6000:24c5:b0:3e8:b4cb:c3a0 with SMTP id ffacd0b85a97d-3ecdf9afe4amr737058f8f.8.1758093390674;
        Wed, 17 Sep 2025 00:16:30 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f27:6d00:7b96:afc9:83d0:5bd? (p200300d82f276d007b96afc983d005bd.dip0.t-ipconnect.de. [2003:d8:2f27:6d00:7b96:afc9:83d0:5bd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46139122a8fsm23710285e9.7.2025.09.17.00.16.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 00:16:30 -0700 (PDT)
Message-ID: <2bd45749-e483-45ea-9c55-74c5ba15b012@redhat.com>
Date: Wed, 17 Sep 2025 09:16:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v3 09/16] genirq/irqdesc: Have nr_irqs as non-static
To: Eugen Hristev <eugen.hristev@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, andersson@kernel.org,
 pmladek@suse.com, rdunlap@infradead.org, corbet@lwn.net, mhocko@suse.com
Cc: tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 jonechou@google.com, rostedt@goodmis.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
 <20250912150855.2901211-10-eugen.hristev@linaro.org> <87cy7q9k8y.ffs@tglx>
 <87a52u9jyl.ffs@tglx> <8df2cf28-c15e-4692-a127-6a5c966a965e@linaro.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <8df2cf28-c15e-4692-a127-6a5c966a965e@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7X3uJBC2iVL7u0GnySAtS_EEFsUXlKxPc6-vcPEvE_E_1758093391
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_001636_413145_1CD637EB 
X-CRM114-Status: GOOD (  17.71  )
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

On 17.09.25 07:43, Eugen Hristev wrote:
> 
> 
> On 9/17/25 00:16, Thomas Gleixner wrote:
>> On Tue, Sep 16 2025 at 23:10, Thomas Gleixner wrote:
>>> On Fri, Sep 12 2025 at 18:08, Eugen Hristev wrote:
>>>> nr_irqs is required for debugging the kernel, and needs to be
>>>> accessible for kmemdump into vmcoreinfo.
>>>
>>> That's a patently bad idea.
>>>
>>> Care to grep how many instances of 'nr_irqs' variables are in the
>>> kernel?
>>>
>>> That name is way too generic to be made global.
>>
>> Aside of that there is _ZERO_ justification to expose variables globaly,
>> which have been made file local with a lot of effort in the past.
>>
>> I pointed you to a solution for that and just because David does not
>> like it means that it's acceptable to fiddle in subsystems and expose
>> their carefully localized variables.

It would have been great if we could have had that discussion in the 
previous thread.

I didn't like what I saw in v2. In particular, having subsystems fiddle 
with kmemdump specifics.

I prefer if we can find a way to not have subsystems to that.

>>
> 
> I agree. I explained the solution to David. He wanted to un-static
> everything. I disagreed.

Some other subsystem wants to have access to this information. I agree 
that exposing these variables as r/w globally is not ideal.

I raised the alternative of exposing areas or other information through 
simple helper functions that kmemdump can just use to compose whatever 
it needs to compose.

Do we really need that .section thingy?

-- 
Cheers

David / dhildenb


