Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3E5CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 04:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k7wfzbMX9zppyyEMbKM6+79VccQHudzEP6zJVdKYqxo=; b=x9RZ23jLd7g3Ji2S8nryLBDKqS
	vcdbktynhDe9XkhhlllYlQDhqdn45RIHfsX2y75LrBJxksO/HMXa35+OLndMf6p5uID4n3WL65p9s
	LzHE41TfM43lHu8RA33sBbNum+U3oFUfwVufjrhJBWCllXAuKPdXlJQKDVsRmlGG7KELTXXVkq4pr
	YqzG7ylBqaqOilIqzvUJiDbB24sAASyF3RH+RHytB0DWeXqjaS2qqtfcH2zhqn5mnakUPpsOa/QLc
	U/Wob++B6USmiAkl9y69Z54CpXl32fJRT+eJ7Bu5ZU8u8N0f7PfLMEbthUDVg0aRmwKRYMBiTFwaz
	HC7k1S+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ2hC-000000087zW-1sy3;
	Wed, 12 Nov 2025 04:43:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ2h8-000000087z0-3g1w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 04:43:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762922575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k7wfzbMX9zppyyEMbKM6+79VccQHudzEP6zJVdKYqxo=;
	b=EW1iaQngIYJooD0QDpp0cnMmTxJA90GdZAj874faE+XdvymNHt77WlQlTsU12EZvqwHRyg
	zRjugD9m8z1a4hLedKtYHEeCUxyKrDMBWBKA1C/sAJpOTmVlH9BHvIVAA9zBcMMgc9aOfi
	hD0G9umf5ZpZGCKzcFfH+KMk3SV37g4=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-453-szULz0khMiy_j8U_Wp5yjw-1; Tue,
 11 Nov 2025 23:42:50 -0500
X-MC-Unique: szULz0khMiy_j8U_Wp5yjw-1
X-Mimecast-MFC-AGG-ID: szULz0khMiy_j8U_Wp5yjw_1762922569
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 773831956089;
	Wed, 12 Nov 2025 04:42:47 +0000 (UTC)
Received: from cmirabil.redhat.com (unknown [10.22.65.154])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D57271955F1A;
	Wed, 12 Nov 2025 04:42:43 +0000 (UTC)
From: Charles Mirabile <cmirabil@redhat.com>
To: fj1078ii@fujitsu.com
Cc: catalin.marinas@arm.com,
	fj2767dz@fujitsu.com,
	guohanjun@huawei.com,
	ilkka@os.amperecomputing.com,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lpieralisi@kernel.org,
	rafael@kernel.org,
	sudeep.holla@arm.com,
	will@kernel.org
Subject: Re: [PATCH v4] ACPI: AGDI: Add interrupt signaling mode support
Date: Tue, 11 Nov 2025 23:42:37 -0500
Message-ID: <20251112044239.4049011-1-cmirabil@redhat.com>
In-Reply-To: <OSAPR01MB7669F9B9E145A50B38819E13D5CEA@OSAPR01MB7669.jpnprd01.prod.outlook.com>
References: <OSAPR01MB7669F9B9E145A50B38819E13D5CEA@OSAPR01MB7669.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_204258_995110_6D049194 
X-CRM114-Status: GOOD (  34.54  )
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

Hi All—

On Mon, Nov 10, 2025 at 07:38:17AM +0000, Kazuhiro Abe (Fujitsu) wrote:
> Hi Will,
> 
> > Hi Will,
> > 
> > > [You don't often get email from will@kernel.org. Learn why this is
> > > important at https://aka.ms/LearnAboutSenderIdentification ]
> > >
> > > On Mon, Oct 20, 2025 at 09:23:05PM +0800, Hanjun Guo wrote:
> > > > On 2025/10/17 15:39, Kazuhiro Abe wrote:
> > > > > AGDI has two types of signaling modes: SDEI and interrupt.
> > > > > Currently, the AGDI driver only supports SDEI.
> > > > > Therefore, add support for interrupt signaling mode The interrupt
> > > > > vector is retrieved from the AGDI table, and call panic function
> > > > > when an interrupt occurs.
> > > > >
> > > > > Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
> > > > > Signed-off-by: Kazuhiro Abe <fj1078ii@aa.jp.fujitsu.com>
> > > > > ---
> > > > > Hanjun, I have addressed all your comments.
> > > > > Please review them.
> > > > >
> > > > > v3->v4
> > > > >   - Add a comment to the flags member.
> > > > >   - Fix agdi_interrupt_probe.
> > > > >   - Fix agdi_interrupt_remove.
> > > > >   - Add space in struct initializsation.
> > > > >   - Delete curly braces.
> > > >
> > > > Looks good to me,
> > > >
> > > > Acked-by: Hanjun Guo <guohanjun@huawei.com>
> > >
> > > I wasn't cc'd on the original patch but I couldn't figure out why it
> > > uses IRQF_NO_AUTOEN when requesting the irq given that the first thing
> > > it does is enable it.
> > 
> > I misunderstood the usage of request_irq and enable_irq.
> > Since there's no need to separate them, I will remove IRQF_NO_AUTOEN and the
> > enable_irq call, and send v5.
> 
> I found out when calling request_nmi, removing IRQF_NO_AUTOEN results in an error (-EINVAL).
> Therefore, I would like to keep IRQF_NO_AUTOEN specified.
> If you have any comments on this version, please let me know.

Could it be that this is just a bug in `request_nmi`? I see the following:

if (!desc || (irq_settings_can_autoenable(desc) &&
    !(irqflags & IRQF_NO_AUTOEN)) ||
    !irq_settings_can_request(desc) ||
    WARN_ON(irq_settings_is_per_cpu_devid(desc)) ||
    !irq_supports_nmi(desc))
	return -EINVAL;

Perhaps there is just a missing `!` before `irq_settings_can_autoenable`.

As far as I can tell it has always been wrong - git blame points me to the
original commit where that code was introduced:

b525903c254da ("genirq: Provide basic NMI management for interrupt lines")

I looked and the only two callers are using `IRQF_NO_AUTOEN` so I guess it
just hasn't been noticed yet.

Happy to send a patch to fix it.

> 
> Best Regards,
> Kazuhiro Abe
> 
> > 
> > Best Regards,
> > Kazuhiro Abe
> > 
> > >
> > > Will

Best—Charlie


