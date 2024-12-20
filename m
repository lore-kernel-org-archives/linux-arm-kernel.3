Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 502AEE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 15:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nZvwncwJOuHramMroFGr8eBsUbQp9V+RXkC2LSaW6Lg=; b=bz8gpVbcuWqgoel5MCozjP8o6h
	0xNgf4ZSqWqym5g/x7lmIyd4r/VEHp99XSMiitUAjGQMsD/VUd19Xh+LA7e/86JLDNlNbGcqxFU+v
	Z6dmPQwq9o16pfXUjnIYCdCKKSrFdGNjcKSp5sg2o4ZS9wkTBklm0ldWAQpGcvV0yF3y5EHpKS/4i
	RrsNTlXvbhjoMCH7cyFNe5NBxBp2rMmzdQcm4aEE8NVyQlbF1euokB1y4DGq379+2l2akRO3ceUxT
	HmjLJ06RJCUL5mMPVQNKutuS6adDk76hMhYwbWy0mhaW8oFRYYUPsshabOfrYiF6Z8HjzXUvypdxA
	Q0KkqxEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOeXj-00000005Gm7-3bpm;
	Fri, 20 Dec 2024 15:03:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOeV9-00000005GKn-21Ft
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 15:01:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734706872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nZvwncwJOuHramMroFGr8eBsUbQp9V+RXkC2LSaW6Lg=;
	b=c2tJluByWOYKiyNqXOPLuuFFtY9uzrvhrEdiFygXubBnkfX98cyZiRLVS/zPuUcDwZ/GOL
	LrPkCdRCN5+cCNvlIL5Ri9wbM4CYq0zB5Ea0do07MZDEtfqD2CliK8ViJQh23eqn+czr52
	hAom7erGA64SLdwav3Mxdi5If5WI1Lo=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-619-JQCwutYbOvi5j9rBr_W_nQ-1; Fri,
 20 Dec 2024 10:01:11 -0500
X-MC-Unique: JQCwutYbOvi5j9rBr_W_nQ-1
X-Mimecast-MFC-AGG-ID: JQCwutYbOvi5j9rBr_W_nQ
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 292DD195605B;
	Fri, 20 Dec 2024 15:01:03 +0000 (UTC)
Received: from localhost (dhcp-192-244.str.redhat.com [10.33.192.244])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3008F1956053;
	Fri, 20 Dec 2024 15:00:59 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>
Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 kvmarm@lists.linux.dev, catalin.marinas@arm.com, will@kernel.org,
 mark.rutland@arm.com, eric.auger@redhat.com, sebott@redhat.com,
 yuzenghui@huawei.com, wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, anthony.jebson@huawei.com,
 linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com
Subject: Re: [PATCH v4 3/3] arm64: paravirt: Enable errata based on
 implementation CPUs
In-Reply-To: <86v7veppsj.wl-maz@kernel.org>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20241218105345.73472-1-shameerali.kolothum.thodi@huawei.com>
 <20241218105345.73472-4-shameerali.kolothum.thodi@huawei.com>
 <86bjx8q995.wl-maz@kernel.org> <Z2RapzikZQGgeE_6@linux.dev>
 <86v7veppsj.wl-maz@kernel.org>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Fri, 20 Dec 2024 16:00:57 +0100
Message-ID: <87ikrebdqu.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UBNi6K4XqJo2snhjVKw3QlNNzfRYehFCBVW6YR-KMLM_1734706865
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_070115_603871_066A76DB 
X-CRM114-Status: GOOD (  17.49  )
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

On Fri, Dec 20 2024, Marc Zyngier <maz@kernel.org> wrote:

> On Thu, 19 Dec 2024 17:40:55 +0000,
> Oliver Upton <oliver.upton@linux.dev> wrote:
>> 
>> > Independent of this, I wonder what we should output in sysfs
>> > (/sys/devices/system/cpu/cpu*/regs/identification/*).
>> 
>> It's a bit crap, but maybe implementation index 0 gets reported through
>> the 'main' midr/revidr files, otherwise have a directory per
>> implementation index of midr/revidr.
>
> Having slept on that one, I'm starting to think that we should keep
> the status-quo of reporting what the kernel snapshot at boot time.
> There is no good reason to force the VMM to report the potential
> implementations in any specific order.
>
> The "alternative-implementations" is interesting, but we don't keep it
> per-CPU, so I don't  think it fits the current scheme. But maybe
> something in /sys/devices/system/cpu, outside of the cpu* hierarchy?

I agree that this should be reported outside of the cpu* hierarchy,
maybe smth like

/sys/devices/system/cpu/alternatives/
   identification/
     regs0/
       aidr_el1
       midr_el1
       revidr_el1
     regs1/
       aidr_el1
       midr_el1
       revidr_el1

(with no guarantee as to _which_ triplet will show up under regs<n>)

Also depends on the intended consumers, I guess.

>
> Either way, this isn't something we should worry too much right now.

I agree as well.


