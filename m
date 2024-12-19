Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE8DE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 07:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L8Wz87MF6s9ghUZeLLIp8a7pQi7LC/a2SSjxFUlu/Hw=; b=bKyLjK4faT/OxOkO89c9+oc+b4
	lenWbxshyyMGA43evtVhXYNSuAxyuCVAApbpXfV3AqDcLQbMDwz9PTtiAdTVyoRsxCu1ezEubAXCR
	ph2JX9d4j37E7j+zjb3R0MXk0CxFkqTggTUHxl2z5HMbE/1EujxKQnDAVQdZfMlIvJZWGNWFZ43X1
	GCuM8DWoGpzfac3C5gifreW02FwkcdTruAmZFbscqJH6X0Y6cJARyiuZzXAIPgFTNTe5swLvioUTD
	jiyophxjFoEp8wXWN2YKn5MMOQCmemhAZ/U0Yo++NdCjG92IVEmak/aHGWvMPu4J+wBDdoHu15KDd
	wPpa2JDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOAdF-0000000122l-47G9;
	Thu, 19 Dec 2024 07:07:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOAb7-000000011iy-2zDg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 07:05:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734591923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L8Wz87MF6s9ghUZeLLIp8a7pQi7LC/a2SSjxFUlu/Hw=;
	b=ijFVb6oD1lNF7KEfBvHr/Gz0RjVQGFj7nTLcWGQ4mFCrCAxgfrJ6EBLaR+nYrfz3GSuEgK
	3ly4n2ZIiNG8g1L81i9eQGQZHJrsSk7OLC/NbYDPdDj5ig2ilgJ7S3/Tgo9OX3vPs3B+r3
	slSsZLgNEBlCWJKcZZFXKabUJ9hRjX4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-231-nK07GLf0PwuTwdoUNWgLnw-1; Thu,
 19 Dec 2024 02:05:17 -0500
X-MC-Unique: nK07GLf0PwuTwdoUNWgLnw-1
X-Mimecast-MFC-AGG-ID: nK07GLf0PwuTwdoUNWgLnw
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 74929195608F;
	Thu, 19 Dec 2024 07:05:14 +0000 (UTC)
Received: from localhost (unknown [10.39.192.67])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7B40F195609D;
	Thu, 19 Dec 2024 07:05:10 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 kvmarm@lists.linux.dev, maz@kernel.org, oliver.upton@linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 eric.auger@redhat.com, sebott@redhat.com, yuzenghui@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, anthony.jebson@huawei.com,
 linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com
Subject: Re: [PATCH v4 1/3] arm64: Modify _midr_range() functions to read
 MIDR/REVIDR internally
In-Reply-To: <20241218105345.73472-2-shameerali.kolothum.thodi@huawei.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20241218105345.73472-1-shameerali.kolothum.thodi@huawei.com>
 <20241218105345.73472-2-shameerali.kolothum.thodi@huawei.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Thu, 19 Dec 2024 08:05:06 +0100
Message-ID: <87r064b1b1.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0U__cuzBHlmfxwKH6Fu9ULKebKQ2A7nPeEWXuZroMYU_1734591915
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_230525_828679_A3FCE0E4 
X-CRM114-Status: GOOD (  10.11  )
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

On Wed, Dec 18 2024, Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> These changes lay the groundwork for adding support for guest kernels,
> allowing them to leverage target CPU implementations provided by the
> VMM.
>
> No functional changes intended.
>
> Suggested-by: Oliver Upton <oliver.upton@linux.dev>
> Reviewed-by: Sebastian Ott <sebott@redhat.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  arch/arm64/include/asm/cputype.h     | 28 ++++++++++++++--------------
>  arch/arm64/include/asm/mmu.h         |  3 +--
>  arch/arm64/kernel/cpu_errata.c       | 23 +++++++++++++----------
>  arch/arm64/kernel/cpufeature.c       |  6 +++---
>  arch/arm64/kernel/proton-pack.c      | 17 ++++++++---------
>  arch/arm64/kvm/vgic/vgic-v3.c        |  2 +-
>  drivers/clocksource/arm_arch_timer.c |  2 +-
>  7 files changed, 41 insertions(+), 40 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


