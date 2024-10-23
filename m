Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50995D2E021
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 08:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TeqTz/SulyR6SGXBZ4rSnN9Rv3XGDhAtsVmKnBQugKw=; b=4tU3nK5JR6JVnVb4tOl9p05U5R
	88cFSmKP64tXhemEpCT7Ld4IakLuif7RNFFTHZiLlZ+NKt+emwsU9Tbul2cog8d0xNhacG6LghJnV
	bCW4I73f2trQQJMJK9/Yz+NezVTE1N4anwG+o7OgOKflJvSV8c+fVJb3eOyzH583YB1K+xrHj+M2Z
	EVRt0J9UwsN35+icGRaHhFzBgGA1Y9oazhAQF1RR7NaFdKY0M8m84xsLloMvCVL9YXMlX1Ff26YAK
	HMDVMNvticBTW4XuxXuAGJg7pLfMo4p1g8sPKWRuo1AtT2B8YKLWuaQrkfAH8+3oqjxiFY3Pp2noZ
	Lgh1Jzpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3WoM-0000000DaK2-1Hcj;
	Wed, 23 Oct 2024 08:33:46 +0000
Received: from relay2.mymailcheap.com ([151.80.165.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Wh1-0000000DYcI-2GZ1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 08:26:13 +0000
Received: from nf2.mymailcheap.com (nf2.mymailcheap.com [54.39.180.165])
	by relay2.mymailcheap.com (Postfix) with ESMTPS id D42DA3E8E3;
	Wed, 23 Oct 2024 10:26:03 +0200 (CEST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf2.mymailcheap.com (Postfix) with ESMTPSA id ECDC240071;
	Wed, 23 Oct 2024 08:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1729671961; bh=3IJxynij3iV8P5vDgPCGIgHicDhSoCTbzTZ2CMUqVNo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ymUA7U2gTBz+Vd/OJ5ZZtxcNrrxh00VAGv/QpZuFHB6Z3cDCMc+882elOcoJ68pUR
	 CfsVTJ9GlTT5JVTNgGt2cHIhDHv/D4dYcHzQt2j1XOAnl/Yj6hVTmJ98bgdt9WjYci
	 e2CZXP/ddqBkRZ7uSUXEGX7KS91FknvE+WCJcjT0=
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 0D5F04127C;
	Wed, 23 Oct 2024 08:26:01 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 23 Oct 2024 16:26:00 +0800
From: Mingcong Bai <jeffbai@aosc.io>
To: WangYuli <wangyuli@uniontech.com>
Cc: gregkh@linuxfoundation.org, patches@lists.linux.dev, nikita@trvn.ru,
 ink@jurassic.park.msu.ru, shc_work@mail.ru, richard.henderson@linaro.org,
 mattst88@gmail.com, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, fancer.lancer@gmail.com,
 linux-hwmon@vger.kernel.org, dmaengine@vger.kernel.org, xeb@mail.ru,
 netdev@vger.kernel.org, s.shtylyov@omp.ru, linux-ide@vger.kernel.org,
 serjk@netup.ru, aospan@netup.ru, linux-media@vger.kernel.org,
 ddrokosov@sberdevices.ru, linux-iio@vger.kernel.org, v.georgiev@metrotek.ru,
 linux-mips@vger.kernel.org, ntb@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-spi@vger.kernel.org, dushistov@mail.ru,
 manivannan.sadhasivam@linaro.org, conor.dooley@microchip.com,
 linux-fpga@vger.kernel.org, tsbogend@alpha.franken.de,
 hoan@os.amperecomputing.com, geert@linux-m68k.org,
 wsa+renesas@sang-engineering.com
Subject: Re: [PATCH] MAINTAINERS: Remove some entries due to various
 compliance requirements.
In-Reply-To: <a08dc31ab773604d8f206ba005dc4c7a@aosc.io>
References: <2024101835-tiptop-blip-09ed@gregkh>
 <A74519B4332040FA+20241023063058.223139-1-wangyuli@uniontech.com>
 <a08dc31ab773604d8f206ba005dc4c7a@aosc.io>
Message-ID: <444fa53bdfdee75522a1af41655a99b0@aosc.io>
X-Sender: jeffbai@aosc.io
Organization: Anthon Open Source Community
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: nf2.mymailcheap.com
X-Rspamd-Queue-Id: ECDC240071
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
	RCPT_COUNT_TWELVE(0.00)[36];
	TAGGED_RCPT(0.00)[renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,mail.ru];
	FREEMAIL_CC(0.00)[linuxfoundation.org,lists.linux.dev,trvn.ru,jurassic.park.msu.ru,mail.ru,linaro.org,gmail.com,vger.kernel.org,lists.infradead.org,omp.ru,netup.ru,sberdevices.ru,metrotek.ru,microchip.com,alpha.franken.de,os.amperecomputing.com,linux-m68k.org,sang-engineering.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MISSING_XM_UA(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_012611_770374_E8FD445F 
X-CRM114-Status: GOOD (  10.58  )
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

No, no, no. Nuh, uh.

Greg has unfortunately decided to respond in private over a matter that 
by no means should be glossed over. Here below is our conversation:

---

Greetings,

在 2024-10-23 15:55，Greg KH 写道：

> On Wed, Oct 23, 2024 at 03:32:50PM +0800, Mingcong Bai wrote:
> 
>> Greetings all,
> 
> <offlist>

Request declined. Your response is now public knowledge (and hey, if 
this is not by your will, my apologies). Again, this matter requires 
public response.

> 在 2024-10-23 14:30，WangYuli 写道： Although this commit has been merged, 
> it's still important to know the
> specific reason (or even an example) that triggered this change for
> everyone here, right?
> 
> And those maintainers who have been removed should be notified.
> Seconded.

Sorry, but that's not how this is allowed to work.  Please contact your
company lawyers if you have any questions about this.  And this only
affects maintainers, as you aren't listed in the MAINTAINERS file, there
should not be any issue, but again, contact your company if you have any
questions as they know what is going on.

Just *wink* if you were compelled into this.

> thanks,
> 
> greg k-h

Best Regards,
Mingcong Bai

