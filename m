Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C2ECD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 21:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v9naQ89cY4pQ/7RwTVxw5SYdLZz0THDHbZBMU5d/fMY=; b=UELIvr9CB9J0GLy14px0DB0jfY
	pcuJ4VvLHlVfj4fzl2Mazb6vIg4JHiQsqteq2+MtIxqK7FoLrHaFMLL0xhTu6GEO93fhj3JBzFEB9
	kqhothahpqfM6b2duoGDzXO4gpKllN1WMl20eXiMB58E6WCpq5+HcAnaCtM+ZoGXKGxhvJPB+VM8B
	utTuJ1zLagJYnLP+Ws4J/Ijaqfu5fsF0UG+FRrd3miZTjErtVcMfWFFXNAPcqv6oo1KJ95hVtc35q
	NlTg7p00mhuNX3fKwhsT3HHWI9cKYH3sSEney7PDF8YbUGKVtDGaXoxZTvL0D3LRtNbiTIJT2XeUA
	SP9VeOIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPo2Z-00000005mtz-3SSC;
	Wed, 20 May 2026 21:01:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPo2X-00000005mtQ-1uXR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 21:01:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779310876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v9naQ89cY4pQ/7RwTVxw5SYdLZz0THDHbZBMU5d/fMY=;
	b=MEw98JKali7uNntCuMiC0ScRL188l3Qim49fbsY+IBON217EQhW/uDTcD9W3RZWNut6/Cl
	TZiLf23smR9MS/hFhm7d9kVCFNzRxJeyCWhaigpZBRHO6Ckwq2gQWexoSCWEHSR55UTryc
	Pk07FjlrUeeoWSIprqVZWglx4TeS3Qc=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-591-JLNdvWNKPyeo2y3n-bNvQw-1; Wed,
 20 May 2026 17:01:06 -0400
X-MC-Unique: JLNdvWNKPyeo2y3n-bNvQw-1
X-Mimecast-MFC-AGG-ID: JLNdvWNKPyeo2y3n-bNvQw_1779310864
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B0D2A180061D;
	Wed, 20 May 2026 21:01:03 +0000 (UTC)
Received: from [10.22.64.248] (unknown [10.22.64.248])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 684DF1956053;
	Wed, 20 May 2026 21:01:01 +0000 (UTC)
Message-ID: <a5251664-2c15-4a8e-906b-d204e10c38be@redhat.com>
Date: Wed, 20 May 2026 17:01:00 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/entry: Don't disable preemption in
 debug_exception_enter() with RT kernel
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Clark Williams <clrkwllms@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
References: <20260519222524.886454-1-longman@redhat.com>
 <20260520061920.XCqBHe0x@linutronix.de>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20260520061920.XCqBHe0x@linutronix.de>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: u8eNgF0qGhC1okXiVWbfn9T9ecSWzfpNov-JDNGDU9U_1779310864
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_140117_570927_A447A281 
X-CRM114-Status: GOOD (  10.89  )
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


On 5/20/26 2:19 AM, Sebastian Andrzej Siewior wrote:
> On 2026-05-19 18:25:24 [-0400], Waiman Long wrote:
>> Commit d8bb6718c4db ("arm64: Make debug exception handlers visible from
>> RCU") introduces debug_exception_enter() and debug_exception_exit()
>> where preemption is explicitly disabled. With a PREEMPT_RT debug kernel,
>> the following bug report can happen.
> …
>
> What kernel is this? I have backport (which is being tested) for v6.6
> and v6.12, the patches are from v6.17-rc1.

The kernel backtrace is produced using the latest v7.1-rc4 kernel. There 
are a number of changes to the debug_exception_enter() and 
debug_exception_exit() functions over the years, but the preemption 
disable code remains since its introduction in v5.3.

BTW, what v6.17-rc1 patches are you talking about?

-Longman


