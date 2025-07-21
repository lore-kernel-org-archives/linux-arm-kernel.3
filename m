Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13963C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 14:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/xaAjesXdXLCll4p8FaZte1EmjouFeib6o8XWb0yKk0=; b=zuD8mFBcVgfOc/Bml4rvqXLE/3
	A84gYajk1BDRjb97WF0UxtCYyeUnXdDj1K2/mbMpWPEFGkUSuo1symGS56Odx+I1lrzFcYlmWe5Kn
	KMYdsioMDKXHVlqwJ3NuxnJ4y0bAjrnxPdL6FBo5YMB9k+2f3tgE7ye8H5AD1PrTjYYrhSUBDRaja
	dyA9qKvHDxd9iN0QPqo6PSDJg3bxI8GXKIHDYHDPhYA96gARDLm/Aj2BR7s/I6qVhUYNQRf00i3mv
	pnb0AzBCTdtDNj39Fs+185bTG5kAX77rDo9N9fhpHz38SYEiBs8AiBhcKzkoJpirza3KCzuBU1HnH
	wqYkgXMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udrZf-0000000HXkh-2xT0;
	Mon, 21 Jul 2025 14:33:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udqJj-0000000HMIZ-0DrL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 13:12:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753103550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/xaAjesXdXLCll4p8FaZte1EmjouFeib6o8XWb0yKk0=;
	b=c7x2ncQSgSWRGos9Khy1FDjG6jbKNm+ypK9rVoXkSTwkLtRKI12DoKtbfaHdV81rjfEzOm
	tEUScVTjG3OxcpUbTlxlxlY6AfD4Cei3tn9rAQpd0G/x/W5qVWJ2Uir0wfx3b5yDeSrz5m
	acl+CZ5qVXVUSwS+qcHD4M85lZ6hUjM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-490-e4NUjj3YNnqAnP1qIXKlpw-1; Mon,
 21 Jul 2025 09:12:26 -0400
X-MC-Unique: e4NUjj3YNnqAnP1qIXKlpw-1
X-Mimecast-MFC-AGG-ID: e4NUjj3YNnqAnP1qIXKlpw_1753103544
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C8E4A18009F8;
	Mon, 21 Jul 2025 13:12:23 +0000 (UTC)
Received: from localhost (pixel-6a.str.redhat.com [10.33.192.205])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5F35019560B3;
	Mon, 21 Jul 2025 13:12:22 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, Zenghui
 Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>
Subject: Re: [PATCH 6/7] KVM: arm64: Expose FEAT_RASv1p1 in a canonical manner
In-Reply-To: <86o6td8zzq.wl-maz@kernel.org>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Avril Crosse O'Flaherty"
References: <20250721101955.535159-1-maz@kernel.org>
 <20250721101955.535159-7-maz@kernel.org> <87seip67xz.fsf@redhat.com>
 <86o6td8zzq.wl-maz@kernel.org>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Mon, 21 Jul 2025 15:12:19 +0200
Message-ID: <87pldt6630.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_061231_162272_598D0E2A 
X-CRM114-Status: GOOD (  14.62  )
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

On Mon, Jul 21 2025, Marc Zyngier <maz@kernel.org> wrote:

> On Mon, 21 Jul 2025 13:32:08 +0100,
> Cornelia Huck <cohuck@redhat.com> wrote:
>> 
>> On Mon, Jul 21 2025, Marc Zyngier <maz@kernel.org> wrote:
>> 
>> > If we have RASv1p1 on the host, advertise it to the guest in the
>> > "canonical way", by setting ID_AA64PFR0_EL1 to V1P1, rather than
>> > the convoluted RAS+RAS_frac method.
>> 
>> Don't the two methods have slightly different semantics with RAS == V1P1
>> possibly implying FEAT_DoubleFault, and RAS+RAS_frac not?
>
> Ah, that's an interesting point -- I definitely had glanced over that.
>
> But I'm not sure a guest can actually distinguish between these two
> configurations, given that FEAT_DoubleFault is essentially an EL3
> feature (as indicated in the RAS == V1P1 section, and further
> confirmed in R_GRJVN), making it invisible to the guest.
>
> FEAT_DoubleFault2 is, on the contrary, totally visible from the guest,
> and independent of EL3.
>
> Does this make sense to you?

It does; but it might make sense to add a comment explaining that.

Userspace should hopefully be able to just map everything to RAS == V1P1
and be done with it.


