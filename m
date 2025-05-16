Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE59C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 10:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AKFCODECv+RIDFEhuXs9YRPLfS90Hd9W0nq4d89zy1Q=; b=fglXjEamH1mJ41u6RgbY/ah3+x
	BJaJJ0AuySg6yN6piyNpZQXvcU0/4KHWa0Glr01/REOZy7bU+wfqmUrdGZ4SNifwHEE6CbMhInjs6
	QNE77dAvRPGBL2EQgl/dfKorNnWaqT+7H9xEiQ8vsjqBoh4G3OF452ZUOHEfSASIOx3WQwp84GrGS
	TST62saTgRTnGtgVP6szAZxzJQI8/gpR43vd64eVimxguM6AvyUpeuUDU5z0wjfmG2lprbVIhZuZQ
	VZ2QrcYwZX7dYlCU0Mrk0dELN8aGMb/Fj/Hx0f+u+cor9MBuK4X8GTb/ABA3F6F7UDc2+hM42Xih4
	hb1So9AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFsS2-000000039Um-0Kcu;
	Fri, 16 May 2025 10:38:02 +0000
Received: from xry111.site ([89.208.246.23])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFsIH-000000038Ga-2oBI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 10:27:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1747391277;
	bh=AKFCODECv+RIDFEhuXs9YRPLfS90Hd9W0nq4d89zy1Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=DgkbtHsxkx33k2kNb/yYAtAR01gicGDKJrGWDLwfQShE4DJbYd7jXFW9zIrDPi6no
	 f1iaRjHUno99jiuhO85kWVEE7ntmFIgkutN/YusXX4gAukPesxTq5bSRgOUwVqSVgl
	 rmp61pspICYvnvj5yELNHaNy2Ub6PJhOg1RkO0Rw=
Received: from [IPv6:240e:457:1000:4d1d:620b:9b2:5a59:f0a1] (unknown [IPv6:240e:457:1000:4d1d:620b:9b2:5a59:f0a1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 6F58665F62;
	Fri, 16 May 2025 06:27:52 -0400 (EDT)
Message-ID: <af6f08bac8cdd68d7b839cac382a7696c3cc599a.camel@xry111.site>
Subject: Re: [PATCH v2] arm64: Add overrride for MPAM
From: Xi Ruoyao <xry111@xry111.site>
To: Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>, Marc
 Zyngier <maz@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, Mingcong Bai
 <jeffbai@aosc.io>
Date: Fri, 16 May 2025 18:27:47 +0800
In-Reply-To: <ead19392-a8d3-4c1e-95db-d5cbf40c66fa@arm.com>
References: <20250402031603.35411-1-xry111@xry111.site>
	 <ead19392-a8d3-4c1e-95db-d5cbf40c66fa@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_032757_748010_9DA09AA2 
X-CRM114-Status: UNSURE (   8.45  )
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

On Tue, 2025-05-13 at 11:42 +0100, Ben Horgan wrote:

/* snip */

> > diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeat=
ure.c
> > index 9c4d6d552b25..44dcc0037ec2 100644
> > --- a/arch/arm64/kernel/cpufeature.c
> > +++ b/arch/arm64/kernel/cpufeature.c
> > @@ -88,6 +88,7 @@
> > =C2=A0=C2=A0 #include <asm/mte.h>
> > =C2=A0=C2=A0 #include <asm/hypervisor.h>
> > =C2=A0=C2=A0 #include <asm/processor.h>
> > +#include <asm/ptrace.h>
> Unused include?

Oops, it's a leftover from v1.

I've sent v3 to remove this and fix the typos in subject and comment:
https://lore.kernel.org/all/20250516102556.9688-1-xry111@xry111.site/.

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University

