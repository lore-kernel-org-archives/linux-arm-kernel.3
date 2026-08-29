Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A666C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 15:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kqxt2pJA79TUQhxHKJFLWKa2wf0Abmgu0fLyjHQBRCk=; b=G9XV2Mo6e9t8lf1vbfeqXM03EK
	JlTQivXQMqvJUrxYuuaX/auMVsfuyVQPaw8Z7fJcfhwG9HNNJGWMAwpcO0rhD3g3P4otD56kH+bUo
	iXGrIt9hqC39ILP4EUg5vhrMRB9YCS3Mr5nYApjqAEKxFykFKLGLQg5ClE0KL1WK/TVtdYXmKmd5D
	jFTpqr7Y7qIrmm3L+fP6iemOcqWRhQKOC2EGpRC/k+MBBc6Hlnaotd+GDBcuoljAPP+NOK3Ex3pwp
	4Qu+/2GvQWO94R81cVLApJk9DKYhMAMU6vHkp8bAFTFOamc5U5f2Pmex5GlqqA3dF3tzLuTs/XSP4
	fG393poQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0LMh-0000000757G-2izw;
	Sat, 29 Aug 2026 15:53:07 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0LMf-0000000756s-1auE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 15:53:06 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-480001972b8so972553f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 08:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788018783; x=1788623583; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kqxt2pJA79TUQhxHKJFLWKa2wf0Abmgu0fLyjHQBRCk=;
        b=cMp2xANAwVCbW37EPRxuSLbsH7F0UIdyA3sVDIclbDZqCcmgwDbPpEA1ccZiX8FgbT
         BjSSjiZY/sbxU122IIFvuZFfb+1yE9tn1pOP627bt8/hC0v2Z3WkoqYLmwiAOBIdKwVI
         vhiq+Q3nN+T6A4/w+59A4LjdoydSgGna78bzecmmYvpay89oR1ASQGRonHrYleZR+ny9
         IgmOEpvCpEUl20xOrjcjhyirjDH5AjxxFTk7wsur8WW9iElC8+A5/P8u9yJP1f1K85ba
         YRxDqdqek+UUGnZ4sVmG/DjxFbWea9ls+ru4ENA0raFGKCepbjzY18+mB0x50wtf7le/
         rlBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788018783; x=1788623583;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kqxt2pJA79TUQhxHKJFLWKa2wf0Abmgu0fLyjHQBRCk=;
        b=ZhRQsCROncX41XmF6uEuFm4db/4qZVwZftXZLOSG7IBv5qDoorQo5bKY/K/ysdTuOn
         eLmzNqJbzcziNb/PB4LC1o76YStANY1dL+Rrxv3TWkRvmjLXaXzsoAwwgX+hAr14cILM
         xKJEtB/vifkIWjBgB8Am0ZMqPNZzrkYAyNgpyV+Yvzpz8LDLXojTtoRWsfIWU9BeGmHf
         cK9oUugml/E3FcbM4aB94yOJz2J1k42nD96jMH8uvh5xYRJXvXIjUkpbei02ejh/QSHN
         cMKII0GIBTB5kpHqIN5b52SECiZfOqa2wIpKO8APgHiLvqMZWfCDWEW3duwQ0FBg/5zX
         PEeg==
X-Forwarded-Encrypted: i=1; AKwUvBxvuzEIcgIJqzhkqqR+O7EWm+DHvG7Jg8RSLtJGbunbBtffBtaNrFsngtEk4MGfugYHb/OdsElrsxqVrZB+T/wr@lists.infradead.org
X-Gm-Message-State: AFuF++m88di+Le9l8qd7bDkyup3gavc11Swehk+0GV70B3SMbvlq+ceC
	p9dHbaPQmO7a7WG2KOAzx3mH2GAvASXiMOGvkahk8mlnWAlBYUrY9+Oy
X-Gm-Gg: AYBFou3qqFCUWKBpZVdWNnukAAbP7EU20XGHvqKgTEPwYyJREcwehttXMPrRHp3FJfA
	akAhaeMtHK+eF8TWCf5QNGgSeqBwpj3hWcH4iZqfKsy9vLmhjEW3vXqvmHW9HGMzuz3KCRAefjV
	qBdcM2F6rn716MajyrUkp1UdHKzes0nc8VWJxCB3vgbM4lK8rhRsfA/rwMmBe0mVAPJjc0Rve3N
	cr4LVLiMJQcOED/VA4S+IFEVMAAprOcABu+HOjt3ybLKjcBZoiT/gARrjlT9BCoeJMLsonHI9ko
	VxPLILIn7m590ag1rJZGaBvibRIwVHEi4/lOyktST/L8gP91fGWdt4XObQEFXCAvd47q5FdTd2U
	xfeN2T8P0zOqb4e6z44gbQafiZED1WRMFksArilwYRRK+xsP3PsPeyHXjMLwAsw/i1HbAgiyIHl
	AfnAyytHtVQfXnYgVXRMERmM7amY0fjGn+nRpDSYiSEjOYgD7dhp23BfQzF8ptr1thyXc5xgnZx
	xbMXGCjB1BWmDF0UGLuMHKLW7ZPF6Y9noK3QI7BE4hpdUehI+megXxNhO5zKfLh6I6s+HkkWjSu
	+bggtRIBp9OL+oiZO1KhUqt8wNzWFHDb2NpmxF3Ywruf85WBw60xBWc6kVNKoYa+lYq6+A==
X-Received: by 2002:a05:6000:2287:b0:484:3310:f399 with SMTP id ffacd0b85a97d-4843310f41cmr3869418f8f.26.1788018782440;
        Sat, 29 Aug 2026 08:53:02 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-ae86-1b01-80e2-8851-4221-68d8.310.pool.telefonica.de. [2a02:3100:ae86:1b01:80e2:8851:4221:68d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20122sm10864679f8f.20.2026.08.29.08.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 08:53:02 -0700 (PDT)
Date: Sat, 29 Aug 2026 17:53:00 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	kvmarm@lists.linux.dev, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/2] KVM: arm64: Return -EINVAL for an empty SMCCC filter
 range at base 0
Message-ID: <apL9jzg-KM_n3Vv2@gmail.com>
References: <20260829054856.70549-1-kmehltretter@gmail.com>
 <20260829054856.70549-2-kmehltretter@gmail.com>
 <CA+EHjTzQM0bf1x2X-Y+eMmUHSYUmJXpt_jQ4Csu7JpkjtFT72Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTzQM0bf1x2X-Y+eMmUHSYUmJXpt_jQ4Csu7JpkjtFT72Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_085305_446359_D537E9B1 
X-CRM114-Status: GOOD (  11.00  )
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

On Sat, Aug 29, 2026 at 04:04:01PM +0100, Fuad Tabba wrote:
> > Fixes: 821d935c87bc ("KVM: arm64: Introduce support for userspace SMCCC filtering")
> > Assisted-by: LLM
> 
> nit: this should be `Assisted-by: AGENT_NAME:MODEL_VERSION [TOOL1]
> [TOOL2]` rather than LLM
> 

When I first saw 'LLM' in a patch I thought so too.

But it is now allowed, see recent discussion and merge: 

  https://lore.kernel.org/r/87qzkuahlr.fsf@trenco.lwn.net/

  816d9992d9ed ("coding-assistants: simplify attribution")
 
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Tested-by: Fuad Tabba < fuad.tabba@linux.dev>

Thanks for the review and also testing!

Karl

