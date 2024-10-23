Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D012CDDE60
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 10:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b8dvUb2Qs4H0RHRM2g5LBfHDjMVt9PQG25bxVaQG3nI=; b=mB/3gKI0hvKBiUrszv8SWRbvuL
	uzZJ50zEF5cRwnhslEfKMih+MY70lUAhqg02jXfvIc/r5jtWIXQ0paZc24I3muyK/1dOBY7Fg42fX
	5yCIXleyYAZq9YzDBZbq/BgIVBqY9qV1gR+mds1D/TRppyxYt2gRCssrkflDeFfE/Jp+D6i93bGQj
	VGsj3ZQCNssFMmE6n2EkQ1bNZ0L29ryTfinf5cxOewmb+nLJqGvTkq9PyqZZ1FwDjMCLgWDuEC/h7
	H/Gk7WWWZJIdnAmA1QcMpARdFrJ8nnNcjwn2OPU8FpEPmuZxQQgUB051MfpMTk890IJJMiH4jSP6s
	fVtob3Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Yqf-0000000E1dZ-0Ar8;
	Wed, 23 Oct 2024 10:44:17 +0000
Received: from relay4.mymailcheap.com ([137.74.80.154])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3YJn-0000000Dvzr-2il1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 10:10:21 +0000
Received: from nf2.mymailcheap.com (nf2.mymailcheap.com [54.39.180.165])
	by relay4.mymailcheap.com (Postfix) with ESMTPS id 4D9932031B;
	Wed, 23 Oct 2024 10:10:17 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf2.mymailcheap.com (Postfix) with ESMTPSA id 50CB940071;
	Wed, 23 Oct 2024 10:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1729678215; bh=k3SnHG7oA3l5HZSfi1tB7TiZdo9WbfAs0mivdJqWgUA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Umr0psrmam/LzPClkicD6UONSbNtPFt2zd+HnRZ33WMqljjb/ERG1gQxqLuL/UALX
	 zG1oHfQPfJpGIvCVJirzaft9phPUwh2VWYIbowP8RGXfcifTkvUpdgW1qijU76cBPO
	 SNrwEqnmTJd/9tabIqPFGhObkbafmG+vYJZEA7po=
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id AAADC411E7;
	Wed, 23 Oct 2024 10:10:14 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 23 Oct 2024 18:10:14 +0800
From: Mingcong Bai <jeffbai@aosc.io>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: WangYuli <wangyuli@uniontech.com>, gregkh@linuxfoundation.org,
 patches@lists.linux.dev, nikita@trvn.ru, ink@jurassic.park.msu.ru,
 shc_work@mail.ru, richard.henderson@linaro.org, mattst88@gmail.com,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 fancer.lancer@gmail.com, linux-hwmon@vger.kernel.org,
 dmaengine@vger.kernel.org, xeb@mail.ru, netdev@vger.kernel.org,
 s.shtylyov@omp.ru, linux-ide@vger.kernel.org, serjk@netup.ru,
 aospan@netup.ru, linux-media@vger.kernel.org, ddrokosov@sberdevices.ru,
 linux-iio@vger.kernel.org, v.georgiev@metrotek.ru,
 linux-mips@vger.kernel.org, ntb@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-spi@vger.kernel.org, dushistov@mail.ru,
 manivannan.sadhasivam@linaro.org, conor.dooley@microchip.com,
 linux-fpga@vger.kernel.org, tsbogend@alpha.franken.de,
 hoan@os.amperecomputing.com, geert@linux-m68k.org,
 wsa+renesas@sang-engineering.com
Subject: Re: [PATCH] MAINTAINERS: Remove some entries due to various
 compliance requirements.
In-Reply-To: <418359de-e084-47f9-9090-7980e41661e0@flygoat.com>
References: <2024101835-tiptop-blip-09ed@gregkh>
 <A74519B4332040FA+20241023063058.223139-1-wangyuli@uniontech.com>
 <a08dc31ab773604d8f206ba005dc4c7a@aosc.io>
 <444fa53bdfdee75522a1af41655a99b0@aosc.io>
 <418359de-e084-47f9-9090-7980e41661e0@flygoat.com>
Message-ID: <5d8614084599ff1b7f70aa1b427bdfb3@aosc.io>
X-Sender: jeffbai@aosc.io
Organization: Anthon Open Source Community
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: nf2.mymailcheap.com
X-Rspamd-Queue-Id: 50CB940071
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.40 / 10.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ONE(0.00)[1];
	RCPT_COUNT_TWELVE(0.00)[37];
	TAGGED_RCPT(0.00)[renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,mail.ru];
	FREEMAIL_CC(0.00)[uniontech.com,linuxfoundation.org,lists.linux.dev,trvn.ru,jurassic.park.msu.ru,mail.ru,linaro.org,gmail.com,vger.kernel.org,lists.infradead.org,omp.ru,netup.ru,sberdevices.ru,metrotek.ru,microchip.com,alpha.franken.de,os.amperecomputing.com,linux-m68k.org,sang-engineering.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MISSING_XM_UA(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_031020_007125_E66FC92C 
X-CRM114-Status: GOOD (  22.99  )
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

Greetings again (oops),

I messed up the reference levels when I sent my disclosure. Jiaxun got 
most of the references right but the last sentence.

在 2024-10-23 17:53，Jiaxun Yang 写道：
> On 2024/10/23 09:26, Mingcong Bai wrote:
>> No, no, no. Nuh, uh.
>> 
>> Greg has unfortunately decided to respond in private over a matter 
>> that by no means should be glossed over. Here below is our 
>> conversation:
> 
> I can't believe a senior maintainer is breaking our agreed netiquette 
> [1], but that's happening.
> 
>> 在 2024-10-23 15:55，Greg KH 写道：
> [...]
>> 
>> Request declined. Your response is now public knowledge (and hey, if 
>> this is not by your will, my apologies). Again, this matter requires 
>> public response.
>> 
>>> 在 2024-10-23 14:30，WangYuli 写道： Although this commit has been merged, 
>>> it's still important to know the
>>> specific reason (or even an example) that triggered this change for
>>> everyone here, right?
>>> 
>>> And those maintainers who have been removed should be notified.
>>> Seconded.
>> 
>> Sorry, but that's not how this is allowed to work.  Please contact 
>> your
>> company lawyers if you have any questions about this.  And this only
>> affects maintainers, as you aren't listed in the MAINTAINERS file, 
>> there
>> should not be any issue, but again, contact your company if you have 
>> any
>> questions as they know what is going on.
> 
> I think there are no regulations on earth preventing itself from being 
> referenced.
> Even if the regulation prevents further communication with affected 
> bodies,
> the wider community still deserves an explanation.
> 
> As a person with M entries I found this behavior appalling. It shakes 
> mutual
> trust between maintainers, as we all assumed that patches being applied 
> are
> well scrutinized.
> 
> Besides, many of us are working on kernel as hobbyist  in a personal 
> capacity.
> That means we don't have access to lawyers, especially US one. While I 
> understand
> corporate participants may be the majority of the community, please 
> don't leave
> hobbyists behind!
> 
> I've had some interactions with some of people being removed here, and 
> I would
> say they are all brilliant individuals. It's  really sad to see them 
> being turned away :-(
> 
>> 
>> Just *wink* if you were compelled into this.
> ^ It sounds unprofessional to me.

For the record, I wrote that unprofessional sentence ("Just *wink*"), 
since it was private.

Best Regards,
Mingcong Bai

> 
> Thanks
> - Jiaxun
> 
> [1]: https://people.kernel.org/tglx/notes-about-netiquette-qw89
>> 
>>> thanks,
>>> 
>>> greg k-h
>> 
>> Best Regards,
>> Mingcong Bai
>> 

