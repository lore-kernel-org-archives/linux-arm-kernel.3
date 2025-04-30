Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A515FC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 07:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TggPC15bN3ktclhLnQ8pO/+i0L43TK8jp3ssl5CcV6o=; b=0/bZilB497cQahPJvx9rhuplrz
	hVnyVG/5cKpRc6VLB5gmdCoy/zQT9fWFSnsqVSSaM1AkLloHVPuvn2JBkW+luYFIrLe0HPno0gHw5
	feVljf2anQHU9xYmF8+uHm3tAb4unS4WZuXzUgwutK3hlLWapSFCoKym/Gf/XWd34Xoy60WMmJlZG
	VHR2nDjrWedu6bu3VznKr0m82+6OhwG88ligJkrz4t2jmrQ2B46YmkOaCAAcTp3IW5g1OvlpJwA6A
	ptsFVhdDBXs9yR2mQssk1FTeoz+7YqrDhRsE5xd3Bd8MDTwCi8NxQpkxiTpm/DFdxiXMT5IgpnCVP
	XypVndrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA2EC-0000000C36e-0Kiw;
	Wed, 30 Apr 2025 07:51:36 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA1vj-0000000C03Q-3uih
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 07:32:33 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745998350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TggPC15bN3ktclhLnQ8pO/+i0L43TK8jp3ssl5CcV6o=;
	b=S3WpawAcEc1HB8KXCZhfArSMktptMJLgzKBpPZNA7JSoKsywXqBUWZPAy3bETsvUN9OOYS
	jqEQjvQEj5Bl8ODqKkscWfl1MDIcL25b+Mx4NA+Ay9WAg1hJF8KGjf/DdnYHzq7HCfIZd0
	u9dY/jTQZtsvImVsmWuprAWrNjHjXd6j+IN0hyj5jDpEuNsDqULD2Lt1NqNcXbVf13vkUq
	AKza19zdcX78mPwygh4UMya2exU0VkONNhVhXRq8S8nrXez4730dI1KqV4c9iZL2LmVzgk
	IOBBKQygKiw31xcuMeLG82AotD8d9DdoaPGuOWe8mBU2+L4fhBoS574ZQFGZFg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745998350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TggPC15bN3ktclhLnQ8pO/+i0L43TK8jp3ssl5CcV6o=;
	b=ZpUrv2ofFiWhaHYOZx4wNXm9/5tBwTE6G0gh5LicQPlqQ3LJ/aYBKOtM0w63HFlMtnsjR/
	Lz+AJY6YA4Y5XFAA==
To: Jan Stancek <jstancek@redhat.com>, Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <thomas.weissschuh@linutronix.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Nam Cao <namcao@linutronix.de>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>, Andy Lutomirski <luto@kernel.org>, Vincenzo
 Frascino <vincenzo.frascino@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] vdso: Reject absolute relocations during build
In-Reply-To: <CAASaF6yGT0pDythQ9nTcn5=MHmLYD=gCNVc6dFXhWUO_iXJXqA@mail.gmail.com>
References: <20250429-vdso-absolute-reloc-v1-0-987a0afd10b5@linutronix.de>
 <20250429-vdso-absolute-reloc-v1-2-987a0afd10b5@linutronix.de>
 <CAASaF6yGT0pDythQ9nTcn5=MHmLYD=gCNVc6dFXhWUO_iXJXqA@mail.gmail.com>
Date: Wed, 30 Apr 2025 09:32:27 +0200
Message-ID: <87selqp0j8.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_003232_107087_004050D0 
X-CRM114-Status: UNSURE (   9.34  )
X-CRM114-Notice: Please train this message.
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

On Tue, Apr 29 2025 at 17:17, Jan Stancek wrote:
> On Tue, Apr 29, 2025 at 2:56=E2=80=AFPM Thomas Wei=C3=9Fschuh
> <thomas.weissschuh@linutronix.de> wrote:
>>
>> +# Also validate that no absolute relocations are present in the object =
files themselves.
>>  quiet_cmd_vdso_check =3D VDSOCHK $@
>>        cmd_vdso_check =3D if $(READELF) -rW $@ | grep -v _NONE | grep -q=
 " R_\w*_"; \
>>                        then (echo >&2 "$@: dynamic relocations are not s=
upported"; \
>> +                            rm -f $@; /bin/false); fi && \
>> +                      if $(READELF) -rW $(filter %.o, $(real-prereqs)) =
| grep -q " R_\w*_ABS"; \
>> +                      then (echo >&2 "$@: absolute relocations are not =
supported"; \
>>                              rm -f $@; /bin/false); fi
>
> Should this check only some sections? I'm getting lot of matches on
> debuginfo related sections:

Hmm. All architecture VDSO Makefiles have -fPIC in CFLAGS except for
arm64, which only adds it in arm64/kernel/vdso32/Makefile but not in
arm64/kernel/vdso/Makefile. Confused.

Thanks,

        tglx


