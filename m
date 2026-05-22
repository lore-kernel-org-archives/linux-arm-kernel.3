Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A21CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 13:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4a2i19bMlznTfQSV7hH7AQSoCRRWAsRP+nmZLWmDdE4=; b=Em0SeMSDAITydRw8Iq6w0+io+2
	m/RJsSVU0heFdMU3KE0lUEH0vfmZH/8djs/d4Omt7xHpfHxiZ4pqe23JTlxuvizODaVJPF9vVLzro
	2z7e3nafXjMBxFvglwsmk2GgWFEbk0lXHly+O36t/9P05erYTNhS0j+/1UISvOGxINmNmBIb0hP5k
	oEypnUsZP/MXzeQbZpLc0Euoe0CspKJ1pMHZbkoKaIxovIvSytb8RDtlWXjfgRS9Mo9vImFCmcstC
	x5+4lGcBUPCRF2WLE/Obhg0s1NJlL4B1mcNtxE+yxsUu2kVsXum51MM84hA5HoxU14Fwck9vAPvnm
	bUnHYxzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPaP-0000000Au82-1TbI;
	Fri, 22 May 2026 13:06:45 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPaM-0000000Au71-3m0h;
	Fri, 22 May 2026 13:06:44 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1779455196; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eN4ATdUMpvDsfgn+TXOvfmw+QMiRR7TDY4hdHrR6FU/eI+PszKRAxswHsUPrncTHdlWruDHA/lze3yzGeFkzaV2MOWs7pI9L9O1Tgw1gcwGe6eGrRMC6LO3NBdTfqi8S4fGCIb5xEYMxfpQvMJ6QtymtT4HlbYnUEc1DumdSfDk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779455196; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4a2i19bMlznTfQSV7hH7AQSoCRRWAsRP+nmZLWmDdE4=; 
	b=N04NFLs7DKfVjbAMtp6CpE/llnaDJqqD75gVLBt/AsnQOthdSGvbr2jmvYb44iOknnBNQb5oY4ldsr86cIxWIiOwbdCFVncpmBuZKUWgh3vrnVmc3GF/e0Iox00xqLvSyLuUhCd/Si6k6ExK9bWAdml2idjenExM+BiAy6dpX2U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779455195;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=4a2i19bMlznTfQSV7hH7AQSoCRRWAsRP+nmZLWmDdE4=;
	b=I6BoQBCtAles2jV2tx0BMUcMWHxLvYsSupLILMME8xHG36WLY1o8qFn9KzDodm0k
	DDXqToP4cSRhpM+lN4/g7c+Ndf/NV0uT9hZifuBfqdM+VIKxYO+UQN+byCbirJx+lOp
	ggow4WcOWZunGWeNly59du/Nw12KIzt4tYdafPVs=
Received: by mx.zohomail.com with SMTPS id 177945519388619.946341277208376;
	Fri, 22 May 2026 06:06:33 -0700 (PDT)
Message-ID: <98c2ba7b-5901-4462-8ea3-0de243ed285f@collabora.com>
Date: Fri, 22 May 2026 09:06:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: rkvdec: hevc: cap EXT SPS RPS control counts
 before descriptor assembly
To: Michael Bommarito <michael.bommarito@gmail.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260513181922.2075438-1-michael.bommarito@gmail.com>
 <67bd72ba-6dab-4bdb-a391-27545e287e94@collabora.com>
 <CAJJ9bXxR5U=33RSzB5uFEZv3ZL2JE=UjK7ZToxm0ewSqyu5GBw@mail.gmail.com>
Content-Language: en-US
From: Detlev Casanova <detlev.casanova@collabora.com>
In-Reply-To: <CAJJ9bXxR5U=33RSzB5uFEZv3ZL2JE=UjK7ZToxm0ewSqyu5GBw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_060642_985427_D6D3D6C6 
X-CRM114-Status: GOOD (  14.45  )
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

Hi Mike,

On 5/20/26 20:57, Michael Bommarito wrote:
> On Tue, May 19, 2026 at 9:04 AM Detlev Casanova
> <detlev.casanova@collabora.com> wrote:
>> Still, did you try just changing the cap to 64 (.cfg.dims = { 64 },) ?
>> You'd need a test that sets the control from userspace though.
>>
>> It should refuse setting the control if there are more than 64 elements,
>> therefore the hevc decoder will not run any function using the count
>> values from the SPS (See  rkvdec-vdpu381-hevc.c:601)
> Sure, I can test that and send a v2 for ST.  My understanding is that
> we have four spots we need to check across the flow though:
>
> 1. ST count > 64
> 2. LT count > 32
ST and LT can be handled through cfg.dims and when num_negative_pics / 
num_positive_pics are non-zero, the code check that ST and LT have 
actually been set. If not, they can be skipped.
> 3. num_negative_pics / num_positive_pics > 16
This could be checked in the validation step of the control in v4l2-core.
> 4. delta_idx_minus1 + 1 > i
This one would need to be checked in the construction code indeed.
>
> So would you also want the same .cfg approach for the LT cap?
So yes for LT dimensions.

Detlev.

