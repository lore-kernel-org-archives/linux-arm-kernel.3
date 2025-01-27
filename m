Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35533C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 13:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxX+mEqKJD0CHD6qtOyAAeaxEGqT+AqliDTEYbLd0Ro=; b=NGs92vp55PZ8Uyba3V5aD2B7+y
	2O0bnc9r+S54Z49gbb25nICjJCdrlMUYyONd+XuzfiuLQnzi/Iy49zkE/I/hevRkqF+JCPcwc8eMU
	L40/fyZeOmRl+/rEpIjLrfsMoFB+dR4pbhY52+fgZ4+y15upesujaf7yVSjn5Nv9AJP/p5UOnTpkE
	WbZQtMisICnz2abQlTJbWdySKi0ZsURWvP0qRxokIIyusTpk4y/3PQgmunfUhZh3Rlm5a23dT9LL1
	9oPJ+8M7gAHoFs6Qvrzxf5ro96vRK8DrNsgaeBt/ajQOcKGmRKhPe9cGSXYDGTsSH7CiFPnOqlXl1
	LmPc2Lww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcOsG-00000002LP5-2dOq;
	Mon, 27 Jan 2025 13:09:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcOZd-00000002JH9-23X1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 12:50:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737982240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fxX+mEqKJD0CHD6qtOyAAeaxEGqT+AqliDTEYbLd0Ro=;
	b=eQCeAFCyRcWsTqDKjeNdqk/xvL+nioW+nIbImOTG/oJKm34yHZUE+JSAlKtsrU+TopRyx4
	kP8Ccl1UAd7wdulc1JsopCcc3FJ0pwdnW2kyRyBE0qUxz4oe6d4O/ZunrvDnk9hLrut4nu
	DNetqWhGrPWCDWCPEOOJPcPtEqSl8J0=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-197-7x30Q1uBOwWnTcmbkIgsxw-1; Mon,
 27 Jan 2025 07:50:36 -0500
X-MC-Unique: 7x30Q1uBOwWnTcmbkIgsxw-1
X-Mimecast-MFC-AGG-ID: 7x30Q1uBOwWnTcmbkIgsxw
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B3B0919560B0;
	Mon, 27 Jan 2025 12:50:33 +0000 (UTC)
Received: from localhost (dhcp-192-212.str.redhat.com [10.33.192.212])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 26AAE195608E;
	Mon, 27 Jan 2025 12:50:31 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 kvmarm@lists.linux.dev, maz@kernel.org, oliver.upton@linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 eric.auger@redhat.com, sebott@redhat.com, yuzenghui@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, anthony.jebson@huawei.com,
 linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com
Subject: Re: [PATCH v5 2/4] KVM: arm64: Introduce hypercall support for
 retrieving target implementations
In-Reply-To: <20250124151732.6072-3-shameerali.kolothum.thodi@huawei.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20250124151732.6072-1-shameerali.kolothum.thodi@huawei.com>
 <20250124151732.6072-3-shameerali.kolothum.thodi@huawei.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Mon, 27 Jan 2025 13:50:29 +0100
Message-ID: <87zfjc7756.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rLu5wL-ni_IWUpfR0v6VALnp6N9M3cFqTWY1rTX0QhA_1737982234
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_045041_602984_1B6EF8AD 
X-CRM114-Status: GOOD (  10.23  )
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

On Fri, Jan 24 2025, Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> If the Guest requires migration to multiple targets, these hypercalls
> will provide a way to retrieve the target CPU implementations from
> the user space VMM.
>
> Subsequent patch will use this to enable the associated errata.
>
> Suggested-by: Oliver Upton <oliver.upton@linux.dev>
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  Documentation/virt/kvm/arm/hypercalls.rst | 59 +++++++++++++++++++++++
>  include/linux/arm-smccc.h                 | 15 ++++++
>  2 files changed, 74 insertions(+)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


