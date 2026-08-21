Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC67C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 13:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yT6AXtl3rcDOrA8CHC13zOchRPUX94+zGeSqbRBwczI=; b=fn1WXj28OfKVWlINTW6na7xkRp
	QRwd3Nffrfu/9XUcrEoOgkfrSeGoJOvjwHzIRRDNhVHtqnJWFXghpRcAQ8d4LI915/w0iVi9G8zf6
	zNJEpCOTkEX6ybOJqMsiI9JZAxASaMNsnJCkbMNI0jchWy8QEUMhCcQtxtY0GuueOxEI4crWWU8q5
	L7+jbyvREGS7zNFb5O33brezAUaJOQNcHw1QMXEvErPtiH5jMfrrjRTNIvhoZJPnQZAqov+ck7mw/
	y6OPbgVKgx3EEQpNku/ty6rN5QAA4TNuNS7/R8DkzOqyAkonlVhIEGzXXRNaYQMyhrEcuxvUKDgDB
	8nU+Mmkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPD3-0000000DOJ7-3wcW;
	Fri, 21 Aug 2026 13:23:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPD1-0000000DOHv-0Zz9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 13:23:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787318577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yT6AXtl3rcDOrA8CHC13zOchRPUX94+zGeSqbRBwczI=;
	b=GUEbwMyAjlxEOblGHXvQNqsFxqwWrH0QntlFqoPpq203iJK5SQ67KnW0r1XqU6+2d/1xlA
	w8JjEFlLvP4D0uUsaVjERL0TaG5kp1ba9ArYW4rZm803++y6SQpr+B3Es6rpyIwgS+DYbx
	hfujO8KAk/otK4iRMDLURJIJx3X2Bmc=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-240-93QPkAYgOUaNC85Ph38I4Q-1; Fri, 21 Aug 2026 09:22:55 -0400
X-MC-Unique: 93QPkAYgOUaNC85Ph38I4Q-1
X-Mimecast-MFC-AGG-ID: 93QPkAYgOUaNC85Ph38I4Q_1787318574
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-848860def2cso1065035b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 06:22:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787318574; x=1787923374;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yT6AXtl3rcDOrA8CHC13zOchRPUX94+zGeSqbRBwczI=;
        b=jJoh5ysjwVZpLyz1ol3hlnycyPna39EQtsjJeus7MNV6ipKF/OzLtJfsAt7AfC28Vg
         9VsXsCXVF75bShjJ/6lDSkZOJ3+VuhcfWwVLcXpe0LjmwJdpBMbs7moL1rt4DbGh0t4o
         4psNOmzxIkX81ruCfeevIjuw14QSR+lSze52ji/Tu7sjkqHhqxsPrs8w019CG6ZUJk+0
         TQnuaKJjB5bAtu4+lkVTa9H0es8ENS3m3NJ74UahNyaQ9sjS7D0jmgTlSKPcGMcUOTks
         z65EQNw59cojOu0RvJkfeThNMK3q2M6QeBGT1vI3+G5+b6yBZYOAmLIRoPUQloVzd1ie
         Lejg==
X-Forwarded-Encrypted: i=1; AHgh+Ror9kJ6FLAG6R9o7SfR9h7En0MU0nzIIRHlByvuOlalWPxp/WVp88wetgkDKdvhjCDIe1EpzhrkfL629hMqPhwn@lists.infradead.org
X-Gm-Message-State: AFuF++lXJMxF5FHDaHNaR8iVUJVG9Qh+4NlA395i6dVfKmCBFM3SEttU
	w0ZBKIvVS4b/doyou/0vOxqlNmTTvBXobza372b0PvypHtkOcx5fgSdK1nakjHI0gY0qXCdw7+l
	iJWT+VVQoNcpBwFsnX3EZJFihLNG+mT+okMvk56V1klf/+9AjdD4kBNpbP6OVjVzRAIsDoH65rv
	S6
X-Gm-Gg: AR+sD13xky45Ts6F5xEYvqxkDjY8SPK5VHv0+I6H3asqrCXeR0dbdTFH4VJdwxvtXex
	534dCVtSMygKogDdw+iUkMP9E91t5GKzZrltjnXhUaJ8kF04liNDOr0GQ0mkx9S+7R2D3JRthv9
	rMnVTwAi3k0GXAyNjPkZR/lyYjpKGcQM4ezy23Bp0RTEgYB90h/j6P+LzuUGO1BHzBP0sc+x2zA
	KPu858f2yOFceKEzsTY1Ypty9jCyQo9kM+JCtF+ClNfSF/tjUjQcxXwFmL9WXPi8rNB8FHmxOYq
	LHlPaF5gD1ZAgsQ+G9VgP7j7zqePI2cEQaDHpgXgKJFoBKi4vl6DVeQw6ZWMRwjU93Z6k3HibRq
	w6tzZ+q19VTIWY8EyKw==
X-Received: by 2002:a05:6a00:1c86:b0:846:de21:3da4 with SMTP id d2e1a72fcca58-851f9cc6dfemr11345704b3a.3.1787318573990;
        Fri, 21 Aug 2026 06:22:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:1c86:b0:846:de21:3da4 with SMTP id d2e1a72fcca58-851f9cc6dfemr11345592b3a.3.1787318573542;
        Fri, 21 Aug 2026 06:22:53 -0700 (PDT)
Received: from [192.168.1.3] ([122.171.22.116])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3389a37sm2905604b3a.15.2026.08.21.06.22.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 06:22:53 -0700 (PDT)
Message-ID: <62cb1c7d-aa17-4d6d-b780-97cc40b7ff91@redhat.com>
Date: Fri, 21 Aug 2026 18:52:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] kexec: fix error propagation in
 kexec_image_probe_default()
To: Mike Rapoport <rppt@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Philipp Rudo <prudo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton <akpm@linux-foundation.org>,
 Baoquan He <baoquan.he@linux.dev>, Pasha Tatashin
 <pasha.tatashin@soleen.com>, Tao Liu <ltao@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 kexec@lists.infradead.org
References: <20260819-mpilaniy-v2-0-95e929ede0e5@redhat.com>
 <20260819-mpilaniy-v2-2-95e929ede0e5@redhat.com>
 <20260820142114.0a36ac78@rotkaeppchen> <2vxzik54zmpp.fsf@kernel.org>
 <713ab0a0-235d-47cf-a0c2-73249fbc8f74@redhat.com>
 <aogHeKQ8UnudNAMu@kernel.org>
From: Mukesh Pilaniya <mpilaniy@redhat.com>
In-Reply-To: <aogHeKQ8UnudNAMu@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xijOPi_I0W3yGRFJzBFefFoF6tjcHKgV2rBvkSTmQpU_1787318574
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_062259_380695_051D2BE8 
X-CRM114-Status: GOOD (  18.12  )
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

Hi Mike, thanks for review.

On 21/08/26 1:38 pm, Mike Rapoport wrote:
> On Fri, Aug 21, 2026 at 12:48:15PM +0530, Mukesh Pilaniya wrote:
>> Hi Philipp,
>>
>> On 20/08/26 11:41 pm, Pratyush Yadav wrote:
>>> On Thu, Aug 20 2026, Philipp Rudo wrote:
>>>
>>>> Hi Mukesh,
>>>> Hi Pratyush,
>>>>
>>>> having this patch makes sense. Personally I'd go with having a
>>>> switch-case rather than individual if-blocks. E.g.
>>>>
>>>> 	switch (ret) {
>>>> 		case 0:
>>>> 			image->fops = *fops;
>>>> 			return 0;
>>>> 		case -ENOEXEC:
>>>> 			continue;
>>>> 		default:
>>>> 			return ret;
>>>> 	}
>>>>
>>>> IMHO that is better readable and easier to extend in case other error
>>>> codes need special handling as well. But that is only my personal
>>>> opinion.
>>>
>>> Well, IMO both look roughly the same so I unless Mukesh prefers your
>>> version more, we can keep it as-is.
>>>
>> Thanks for the review. I agree the switch-case reads nicely, but since
>> the current version is functionally equivalent and already
>> reviewed, I'll keep it as-is to avoid re-spinning for a style change.
>> Happy to switch if you or Pratyush feel strongly about it.
> 
> I'd like to request another style change :)
> 
> In newer code we often use 'err' rather than 'ret', so it's more obvious
> what this variable about.
> 
> I don't feel strong about if or switch, but if you go with if, please don't
> compare to 0, use !err.
>

Makes sense, will rename ret to err and use !err in v3.

-- 
Regards,
Mukesh Pilaniya


