Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E191DC5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 14:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B5AFD1HGl3AuOCDl4IPtIyeqi6YYiPcxPv9BIIKFCA4=; b=YZE9PBx2PS41KiSDZS948bLPNO
	Z6VECrrmWhlIb4pJ4Jq9Xl2evSSniEFpp5fT517hNddaQJ9iatI26jsmESHF/cFiiE5/mQVdqA423
	VouKncFZxpIadSQvq8SDmf96YVkFTNv4VvyJFZYr35WA9pMsl/QKmiaTXiUVEytiVhQmcGJO3/HPJ
	PbBWKsn8l4jKEOP8SrTLUDctZbnb6RAs+h+oGguwDxvHdLurD3NN1/XiGh02wbspyan+qc8tBU45c
	sN8LpTZh+2ePow9OvQn8rA7Kx/ZE4hzuVgdgpu7CDIbZxZL6O8zygRao8ddGKNO52JMQNEqUDvOWW
	8CPciARg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvyhL-00000006LWw-2bBK;
	Mon, 17 Aug 2026 14:52:23 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvyhH-00000006LWC-1oQc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 14:52:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=B5AFD1HGl3AuOCDl4IPtIyeqi6YYiPcxPv9BIIKFCA4=; b=j00WuvRcV8YpN1DGWnH3bmbYyY
	7y+w0YT5hbGgz0thMgXEY46qxio8bsv8MSLPVROnZesAZ9uD4W7uGsEEWvVTIE/JwBK8rT2k3P5RX
	QRWJqnHgHMxdxGD1JplT2dyXsSOcZgP6SyuPPqniuxHuyHehVasyj2gJlfJX2Rzj8HbwsN/MgZBFs
	r4uoYeWYUJn2hujqTd8zmcFZ1r3vS2Vr+8lQqVHDLMJ7ymSJ0vRAH1d1DburgpgVOJAv2G1H0aQIo
	K6b2Rs54ynDSh1B2MrhBOUiyt/b0QFcgYvQFIRT8b3EGRp+PpnN+1VNUdV8XYuZytrl5BgF38Shbc
	aaeeBWoQ==;
Received: from [179.135.28.2] (helo=[192.168.1.56])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wvygw-004c4S-44; Mon, 17 Aug 2026 16:51:58 +0200
Message-ID: <5c95bd13-993f-55be-4aa7-acb990738d91@igalia.com>
Date: Mon, 17 Aug 2026 11:51:46 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] arm64/kernel: Expose the running CPU of a native task in
 TPIDRRO_EL0
Content-Language: en-US
To: Bradley Morgan <include@grrlz.net>
Cc: broonie@kernel.org, catalin.marinas@arm.com, gshan@redhat.com,
 kernel-dev@igalia.com, kernel@gpiccoli.net,
 linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com,
 robin.murphy@arm.com, sonicadvance1@gmail.com, will@kernel.org
References: <404DF303-5478-4B5C-9DE1-3A7B3B3927A5@grrlz.net>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <404DF303-5478-4B5C-9DE1-3A7B3B3927A5@grrlz.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_075219_480556_2149CA5B 
X-CRM114-Status: GOOD (  11.24  )
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

On 15/08/2026 13:52, Bradley Morgan wrote:
> Hi, we meet again, :)
> 
> Well, I looked at this assembly code until I was blind,heh, and I
> couldnt particularly find anything bad about it, well, I know I'll
> probably get these arm pros saying I'm dumb or something for not 
> noticing a mistake, but I don't see any mistakes asm side.
> 
> 
> For process.c, I really really like your comment, it's, straight
> to the point, did your LLM write this, or did you write it?
> 
> For your patch;
> 
> Reviewed-by: Bradley Morgan <include@grrlz.net>
> 
> 
> Note: I hope I don't get plonked, I couldnt find anything wrong, but who knows
> Thanks!


Hey Bradley \o
Thanks for your review.

I wrote the comment myself, but LLM helped me with ping-pong reviews,
for example, checking corner cases, commenting on potential ideas. For
example, in a first version I just updated this write_sysreg() to the
CPU id, but then started to think "why am I doing this if the register
is updated at every exit?". "Talking" with the LLM gave me confidence to
suppress this write, due to the reason well explained in the comment heh

Cheers!

