Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3882AC02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 13:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=40ApC6R1xp/vYItDa8VQ44GVCNZy/1Nh1lvi8wUg5RY=; b=Q3mUMyj0m3R3T6O399a9sP9BA8
	aOr4u6neL0NThtyVwLh6SAPKSIeOz5jpZipa11h7lkoKdO3ZEuY3xa5aDCPnsVDiRRjBva8CJXwU5
	q2in9OvR7yZimjYv6+c8XkGGNuUxMkVuXSTQP9WnDzrbYwYbMwEYe0eUfLZpMhA4jAxi4r/09RGwL
	KaxxvUFTq1PJPxKm1d8OTMLTANMOOxqZ8Jt+qcmTrWBznFfbX1/bvT4PbwTDzN8LlCfGYnk90V0db
	4oQw24DgmwTVYWu/tZ7b8kdEERQMBl2W3H7GNkPTzOFfP8CC9Qpp0VX5+/+E1BhKtMpEOGkCynwFG
	/0nTdAjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcOta-00000002LX7-1Dcv;
	Mon, 27 Jan 2025 13:11:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcOcD-00000002Jls-2s8r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 12:53:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737982400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=40ApC6R1xp/vYItDa8VQ44GVCNZy/1Nh1lvi8wUg5RY=;
	b=cHKFfZpRMM+/Ifw7YxfjA2gdcbVKTlSmOQ/GimevnHR6nDLpPpg1O+QlxByaaqym+SG3o4
	X89vdksJdYiS9NR0MK2fjWPnZ+Bf1+UWCmvGoOI3nwMBvwlEU9cCm8HyrivZr2+h2xAyV8
	z43vGchYNP0x9t/9O25eUOk47h0MRTE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-47-pgoC5GM6PmuFcz-iUjWseQ-1; Mon,
 27 Jan 2025 07:53:15 -0500
X-MC-Unique: pgoC5GM6PmuFcz-iUjWseQ-1
X-Mimecast-MFC-AGG-ID: pgoC5GM6PmuFcz-iUjWseQ
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E6835180036E;
	Mon, 27 Jan 2025 12:53:12 +0000 (UTC)
Received: from localhost (dhcp-192-212.str.redhat.com [10.33.192.212])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 92CE01800348;
	Mon, 27 Jan 2025 12:53:10 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 kvmarm@lists.linux.dev, maz@kernel.org, oliver.upton@linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 eric.auger@redhat.com, sebott@redhat.com, yuzenghui@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, anthony.jebson@huawei.com,
 linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com
Subject: Re: [PATCH v5 4/4] arm64: paravirt: Enable errata based on
 implementation CPUs
In-Reply-To: <20250124151732.6072-5-shameerali.kolothum.thodi@huawei.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20250124151732.6072-1-shameerali.kolothum.thodi@huawei.com>
 <20250124151732.6072-5-shameerali.kolothum.thodi@huawei.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Mon, 27 Jan 2025 13:53:08 +0100
Message-ID: <87wmeg770r.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: s79LTNoZ9aF9D64h5uO39G2s9avY_BhQuHLNg_QYnEo_1737982393
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_045321_798376_7FFC1686 
X-CRM114-Status: UNSURE (   8.66  )
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

On Fri, Jan 24 2025, Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> Retrieve any migration target implementation CPUs using the hypercall
> and enable associated errata.
>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  arch/arm64/include/asm/cputype.h  | 24 +++++++++++--
>  arch/arm64/include/asm/paravirt.h |  3 ++
>  arch/arm64/kernel/cpu_errata.c    | 20 +++++++++--
>  arch/arm64/kernel/cpufeature.c    |  2 ++
>  arch/arm64/kernel/image-vars.h    |  2 ++
>  arch/arm64/kernel/paravirt.c      | 58 +++++++++++++++++++++++++++++++
>  include/linux/arm-smccc.h         |  2 ++
>  7 files changed, 106 insertions(+), 5 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


