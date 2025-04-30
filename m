Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E08DC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 08:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=toytAj/veEzmRd9jRr6xKEUHjrwAvubS2ClIjN5hiKs=; b=smom+j44qFiP6dBK+rfPJopOSK
	P59f6nvvwuEikg7vBxF4Zhwbt3Crkug92q+wzpHUXFJbotvjxdpcVQu6+yFkUgc8vixlJQW5LksrB
	Sk9JTs7XHdXsjrdKrEf42IyA/knRJm2Y8fRVwSy0hQURXAl2ESir09XLMlOFvf2PIrQ06IOeNRVvt
	UBNFyP0D97gn2vbRNHFJ9/Q/L4AdTO5NflyB03tY5mMdGIqKpBE8YaI+2FYTKEI6SQWnCDOArviaw
	KkIotzq5pcB46keGuo/CaFGoEItKm3AogxfnpjWW7qm+lU6KAvg6ZhLC5YC3/CsOz0oHbx4bwiLPc
	fQnUeT6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA2gj-0000000C84p-17It;
	Wed, 30 Apr 2025 08:21:05 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA2JX-0000000C439-42dj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 07:57:09 +0000
Date: Wed, 30 Apr 2025 09:57:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745999826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=toytAj/veEzmRd9jRr6xKEUHjrwAvubS2ClIjN5hiKs=;
	b=aEW4C+QL3uo/km3pzlB8vPJmANLKGQ+YtVoDtMBqsb3Q0r0Zzx7+cLwOW3kRFZYIUotj29
	6rrVv5QCL174zj7glivk4VcVQGXsUHYJ4u51dBCYt2tiP5HnZr+QYX4TUi+uXlsPo/VYiT
	Pgfuv6qWbM2loAKJ6/7zvGOy0krafwTjkHSGkeC2mp6aRzgqG8oPVeMDWEV6vp1MXLrUjs
	WjrJPR3X7fHKRB7h0E0wwjhmjG06nAUBKk2q0y6rdNuxi+FrBtuejPYJIOITfPTGt+Qi2v
	M8ev5kgBS1XStwAQoIP/stX4qIDBguscGb0Bw3XqVHMVIsX7CHgJKcosXwKZpg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745999826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=toytAj/veEzmRd9jRr6xKEUHjrwAvubS2ClIjN5hiKs=;
	b=fVSOgbcYSHklMfNonKJENAOqA39ELXq+KIAkzOI6Xnm4pUVizxgUk0R+UT/KFQ3pq0kuY0
	oqkJLRsZVuJ5kBBw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Jan Stancek <jstancek@redhat.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Nam Cao <namcao@linutronix.de>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Andy Lutomirski <luto@kernel.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] vdso: Reject absolute relocations during build
Message-ID: <20250430095411-349b13bf-a3c7-4968-9f97-551a1ded1696@linutronix.de>
References: <20250429-vdso-absolute-reloc-v1-0-987a0afd10b5@linutronix.de>
 <20250429-vdso-absolute-reloc-v1-2-987a0afd10b5@linutronix.de>
 <CAASaF6yGT0pDythQ9nTcn5=MHmLYD=gCNVc6dFXhWUO_iXJXqA@mail.gmail.com>
 <87selqp0j8.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87selqp0j8.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_005708_140194_B1553F58 
X-CRM114-Status: GOOD (  13.05  )
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

On Wed, Apr 30, 2025 at 09:32:27AM +0200, Thomas Gleixner wrote:
> On Tue, Apr 29 2025 at 17:17, Jan Stancek wrote:
> > On Tue, Apr 29, 2025 at 2:56 PM Thomas Weißschuh
> > <thomas.weissschuh@linutronix.de> wrote:
> >>
> >> +# Also validate that no absolute relocations are present in the object files themselves.
> >>  quiet_cmd_vdso_check = VDSOCHK $@
> >>        cmd_vdso_check = if $(READELF) -rW $@ | grep -v _NONE | grep -q " R_\w*_"; \
> >>                        then (echo >&2 "$@: dynamic relocations are not supported"; \
> >> +                            rm -f $@; /bin/false); fi && \
> >> +                      if $(READELF) -rW $(filter %.o, $(real-prereqs)) | grep -q " R_\w*_ABS"; \
> >> +                      then (echo >&2 "$@: absolute relocations are not supported"; \
> >>                              rm -f $@; /bin/false); fi
> >
> > Should this check only some sections? I'm getting lot of matches on
> > debuginfo related sections:
> 
> Hmm. All architecture VDSO Makefiles have -fPIC in CFLAGS except for
> arm64, which only adds it in arm64/kernel/vdso32/Makefile but not in
> arm64/kernel/vdso/Makefile. Confused.

Unfortunately -fPIC does not help. It generates code that is sufficiently
position independent for regular DSOs, but not the vDSO.

See also https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120002#c5

