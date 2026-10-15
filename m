Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80661CC6B2F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 07:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AfFy6KfLE+4KLuU3ZwrUcLBflPtmLzVW3MEDG7MNIAc=; b=gLMQvJEM7w0Jqa/dJWX/Ke/I/p
	0CkmaNjcfji5GzFkQbrt+kHR9JkvTyfpJQARCRHxa0OiJU7ky3C7wKqNZ3WmMOiPaRijBftzS0+hh
	H7185NN8/BUQaajnxNE6UnEzNyA1yNKRvs5awqWUCK4Na6nqUjPrmckxTpL+MkX2tVwnuWA/D8Pn7
	Sfi6wBIENkGGb+83Y/7ReEaqhBWtcC6c5jO3h4uBzwp3VVKVEXROB9wCg3pJdyAA4OakOtx+MVoKM
	Hyo7n8JC6t/LhuniT2rcHGEOln1ijkFdYPQbLFnBFB9T8yrqBFa15Y7a3YIQOoDMzUKwT2dyiBAHx
	ixXukecw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHG0X-0000000H2uP-0WUQ;
	Thu, 15 Oct 2026 07:36:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHG0T-0000000H2tr-107J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 07:36:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792049764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AfFy6KfLE+4KLuU3ZwrUcLBflPtmLzVW3MEDG7MNIAc=;
	b=jLEy61tZ/tMyiWMIv3YT6nOCuMilmaLF+trr2Bi1zTHEvyRhfzJCg4ezYNMFIpHnsgJ3P9
	3s+g6Q/vQE/+1AAQ7ALIRUjsdFBz2VTd1HzAxAXkarxH7qwf+Je85dLGu/7JdbzMm/Tud/
	oxpCWg8p9Mtl2hgOgqxHdOrqd1w/bdk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-412-910HKQQqNaOKiksFi93faQ-1; Thu, 15 Oct 2026 07:36:02 +0000
X-MC-Unique: 910HKQQqNaOKiksFi93faQ-1
X-Mimecast-MFC-AGG-ID: 910HKQQqNaOKiksFi93faQ_1792049761
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-487038bc9b8so3960679f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 00:36:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792049761; x=1792654561;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AfFy6KfLE+4KLuU3ZwrUcLBflPtmLzVW3MEDG7MNIAc=;
        b=Svzq7nUhf/sPGMWgiW/BB0YHGbNqhv6E8Yzj2NNV99k13hrHt53rJ0ZwIRwLQxIgDu
         mupnCpiJPtyuazVCh2D159jsVR15RkNNAjOf44rDMk1ev0EfDc6lBttr+XjOEXybNKO9
         +cNLaTQ3F6RnHdOfLggj4p7p0luRsPm4pXR+qNl0/y1dnyCTKDJx5Y3tUoAbN6racnmr
         ZP2118s/KadvRWwpvH4xFJOYbYgPNvVml+Vd7zfqXCbc1o8GhKga+0et1lua+ok2Ssfn
         +axYEGDs/bYVIxKZNWlrxihWLizmlltKpDcYQOOusRDfF344ZJ3m+lZNBrCfJDXvz1Yz
         3uaA==
X-Forwarded-Encrypted: i=1; AKwUvBwE9OOZ3fPav3wByg60HOqAJg8pdWjoqi+BeG6yWlw426StFISsfr/qWoX8o0ID8tJKUivUPx80012fZgx80vSq@lists.infradead.org
X-Gm-Message-State: AFq9FYLX1pZxO3ftE5cKh/Edjp7BUrDbR3xosp+Jjlm/bphohErDNO13
	TbXjdvNKASDE5ksHVWWZN+T6urZlYv93/XLe1hRbmyeCbim1ZLFPEoPK08e/kHvJEOmEwsWpD5S
	hYWi1xlYbvCvG8hw61SOQQ4E+/8k9WDxndKtU2VPqVSZaZAZBn+PhuaS0RsgTjrOxR7MeHxECf0
	29
X-Gm-Gg: AYBFou1Ko9Cdvm0nyRxIrw68NJ3f77DCK/2se2bVqMdh8/SQsmdnLB22TJENW+3sUpk
	8Ctr8VGLKwWls/Xt+9XqOb4mp03cX2OYCWeXR42SArcrSPHxc/wVL0eP9neVH/EqCbzkpYl8eCc
	e1QMXeTyCu7lN+x+2iwpPr17Xj9L8pu6167/S1Cxpa53RYnL3j0Ilg28rX2v0EIt+nFOx6L3M5C
	JLT7QSJ02uJgV7JkkI0t5R5GSvk19s3424TnjAwY4S9wcMhFdwohnn6QVyj3MDDwRzXt2Cw78mQ
	WoSALniWCSBrFhGYXzu3G/zFiz6b4WYRmJs3OJ4kA1Hv6c+P3mxpPoUpYriBiZ5zvQIqUgCpq/R
	1Lbt09LLdq+AnRvNp3FXe97sAEHPJ30YmPZQLiSga48u/jmlq1l3UIx7x69shzI5YUjxHHhmGuQ
	==
X-Received: by 2002:adf:e013:0:20b0:487:930:8acc with SMTP id ffacd0b85a97d-48dbaaddbd5mr25917376f8f.16.1792049760947;
        Thu, 15 Oct 2026 00:36:00 -0700 (PDT)
X-Received: by 2002:adf:e013:0:20b0:487:930:8acc with SMTP id ffacd0b85a97d-48dbaaddbd5mr25917342f8f.16.1792049760546;
        Thu, 15 Oct 2026 00:36:00 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc6b82sm17520870f8f.51.2026.10.15.00.35.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 00:36:00 -0700 (PDT)
Message-ID: <d832de5c-a01a-471d-b935-5ea00d1c5794@redhat.com>
Date: Thu, 15 Oct 2026 09:35:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3] net: axienet: free outstanding TX buffers in
 axienet_dma_bd_release()
To: Daniel Machon <daniel.machon@microchip.com>,
 Jakub Kicinski <kuba@kernel.org>
Cc: Sagi Maimon <maimon.sagi@gmail.com>, Joe Damato <joe@dama.to>,
 netdev@vger.kernel.org, radhey.shyam.pandey@amd.com, michal.simek@amd.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 daniel@iogearbox.net, jacob.e.keller@intel.com, suraj.gupta2@amd.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261004083759.1016519-1-maimon.sagi@gmail.com>
 <asQ1pF9AAqOiEo3r@devvm20253.cco0.facebook.com>
 <CAMuE1bGXcNwKKX1firkq6eEzymkrDOp8PnnowMzz97SibtpoSQ@mail.gmail.com>
 <20261006180210.03a15e52@kernel.org>
 <20261011084652.c5y3zj7wzmj53ur4@DEN-DL-M70577>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261011084652.c5y3zj7wzmj53ur4@DEN-DL-M70577>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0IvYVcLreF14OekwmdW3VVDdtZs6vsmjrtqDQNK82Kg_1792049761
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_003606_118579_24A4C8D5 
X-CRM114-Status: GOOD (  14.77  )
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

On 10/11/26 10:46, Daniel Machon wrote:
>> On Tue, 6 Oct 2026 06:44:55 +0300 Sagi Maimon wrote:
>>> Agreed on the helper.  As on v2, I kept the fix minimal for net, and
>>> will send the helper to net-next once this has reached it, with both
>>> axienet_dma_bd_release() and axienet_dma_err_handler() using it.
>>
>> Let's do this now, trying to keep fixes small is a bit of
>> an anti-pattern
> 
> Out of curiosity, why is that an anti-pattern?
> 
> I'd think that small fixes are, in general, easier to backport to stable. Is this
> more of procedural question - if the whole fix gets into net, it will get merged
> into net-next by the end of the week anyway?
I'm answering here because I can only guess how scarefully long is
Jakub's email backlog, and possibly this could get lost.

I think the key here is the context. This revision is incorrect because
in order to be minimal intentionally adds a significant chunk of duplicate
code, but such duplication must be avoided, the 'keep is small' is not a
good argument to allow that.

I guess a one-line alternative implementing a different solution
(if existing) could have been ok.

/P


