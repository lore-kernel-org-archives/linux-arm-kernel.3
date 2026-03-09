Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FB6FCA177
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 19:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5AT7sE7JqfmniCrKEncpeQk8Mufi8uWIdilz523/Oe8=; b=TKNQdHAQup6+oCEaTbDzq22lCh
	0tUNJA3pzkAk+Xs2/+Ic7m3/U2FRZZ/XpYysLgrUUH4ypOvsXASQ22GuGUx5En845kTUBi02ebHi/
	Bk9NNGpfLkccx3tRIGMGOKYg9Ck7WejiLMeFXGQyvcNoH3rHGjN8lzLMdPREdqVmFUKgCADfPDZll
	Hd4tZBwKGsA4vH4pfbt/6zpQtlMzMLSbmRYIgtkw2IYff6uGNTrRQjY1Zd7nPTd2qVwtiYFxpSY+z
	fOPX1udlu+zw+DR7mDxrIvaWWOzwoCey0x9gHR4w0uzLnJ+foA5JF4bqoPgKE+an2XR8+5mVtgKop
	nzMP1seA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzfvq-00000007xOe-3q0L;
	Mon, 09 Mar 2026 19:06:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzfvn-00000007xOI-0hJJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 19:06:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773083176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5AT7sE7JqfmniCrKEncpeQk8Mufi8uWIdilz523/Oe8=;
	b=QVAL2KepoXQ0XeFCQNVbeLNFp053U4SI5wmTG6h5ktFwWBWZwxkiYcMbZMmh4By4Losb9/
	T8HBoYswo29lIv/EOcweyiSrXi+pw0zgVhn9Q0as2ie/JlAmyB/bbSYLQMTPX9uPPdUrXU
	AfSVl/9dX560Bg3i7SHAPIeqP6jGBis=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-673-hQ46vRkEPR6KWI6-ePGIFA-1; Mon,
 09 Mar 2026 15:06:10 -0400
X-MC-Unique: hQ46vRkEPR6KWI6-ePGIFA-1
X-Mimecast-MFC-AGG-ID: hQ46vRkEPR6KWI6-ePGIFA_1773083169
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7ECB3180034E;
	Mon,  9 Mar 2026 19:06:08 +0000 (UTC)
Received: from [10.22.81.138] (unknown [10.22.81.138])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 94D771956095;
	Mon,  9 Mar 2026 19:06:05 +0000 (UTC)
Message-ID: <0a332e19-c99e-4dc5-a2d0-b36a2aef80a1@redhat.com>
Date: Mon, 9 Mar 2026 15:06:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH] irqchip/gic-v3-its: Don't acquire rt_spin_lock in
 allocate_vpe_l1_table()
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev
References: <20260107215353.75612-1-longman@redhat.com>
 <864iowmrx6.wl-maz@kernel.org> <87ms2nsqju.ffs@tglx>
 <86wm1qlq7l.wl-maz@kernel.org> <87ecnwij44.ffs@tglx>
 <86v7h8l9ht.wl-maz@kernel.org> <87pl7gglya.ffs@tglx>
 <86tswrkrh4.wl-maz@kernel.org> <861pjjcqdi.wl-maz@kernel.org>
 <4dc6ab03-b2ad-4411-a49b-4513c5d592ea@redhat.com>
 <70dbf293-dd5b-4d77-b653-8f8c09129723@redhat.com>
In-Reply-To: <70dbf293-dd5b-4d77-b653-8f8c09129723@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: 5IMOtmhEw5iTvT5xqCelWebAHks90ZWcwuykXMEYjmM_1773083169
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_120619_283696_46265085 
X-CRM114-Status: GOOD (  12.64  )
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

On 1/21/26 10:49 PM, Waiman Long wrote:
>
> On 1/21/26 3:41 PM, Waiman Long wrote:
>>
>>>> Waiman, can you please give the following hack a go on your box? The
>>>> machines I have are thankfully limited to a single ITS group, so I
>>>> can't directly reproduce your issue.
>>> Have you managed to try this hack? I may be able to spend some time
>>> addressing the issue in the next cycle if I have an indication that
>>> I'm on the right track.
>>
>> Yes, I have tried out your hack patch and the 2-socket Grace test 
>> system booted up without producing any bug report for a RT debug 
>> kernel. I will try out your official patch once it come out. So 
>> moving the memory allocation to a later part of the hotplug bringup 
>> pipeline where sleeping is allowed should work. 
>
> Attaching the dmesg log for your further investigation. 

Ping,

Are you planning to send out an official patch soon?

Thanks,
Longman


