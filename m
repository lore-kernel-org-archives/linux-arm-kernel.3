Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B855DCA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 13:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UfD/fwdmMc+K9+orU4dkDu1zrfBl3Mp+6M5GCLVQ2LA=; b=FUjWks7V44T7U2i855QdOkHosD
	Rgso+mTR5HdJut1RixsgRwfkPoDOcppYXeGRSYJh60bRndtExmNS5zuLI+jStSkQ6eReMARrYLCi/
	VlyaCkrivAGYk9PWb2y/23K3m15uxBUnX+0nkuG/4yDJTUmUIW1r6veCKfH/6jUsrofyx+/3+OidP
	Q/MOo7U5dZoMsW5BVS+gIAbw95M4XMJnN/Oup+jNTFNrZuG3t4uau8Qr54do32zUWuGcJ3aQ5SEev
	QpfL2RTeLSR0Qbu/v0fuSf1LIET46z31AU6RIi7Ae8I2VQNtUDJdxJA5+Fmyz7epR6WMr8oft5mHO
	3IVKBD8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo08x-00000007dcS-3n2o;
	Mon, 18 Aug 2025 13:43:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unzD3-00000007Maq-1vpT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 12:43:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755521012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UfD/fwdmMc+K9+orU4dkDu1zrfBl3Mp+6M5GCLVQ2LA=;
	b=Zu3zOB+0PG/j8aHBPX1wfxDMUqTY8qOZEFSGzlLGY6/cVfmcoQgA1XCriIJDYAbi6EmXDG
	14StqPIIx+p453eDSB9wwctDRa+Rb6FyvjbGsoxoxtCrVVq+Qtydb9L8n8H2q3apLNmFEm
	XML0YkobFPRHC2MWf/GMdhFlWKejEf4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-518-cdjlqPVoNyyRyv0gJT07Fg-1; Mon,
 18 Aug 2025 08:43:27 -0400
X-MC-Unique: cdjlqPVoNyyRyv0gJT07Fg-1
X-Mimecast-MFC-AGG-ID: cdjlqPVoNyyRyv0gJT07Fg_1755521006
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C1940180044F;
	Mon, 18 Aug 2025 12:43:25 +0000 (UTC)
Received: from localhost (dhcp-192-216.str.redhat.com [10.33.192.216])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 99ABC1800280;
	Mon, 18 Aug 2025 12:43:24 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, Zenghui
 Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>
Subject: Re: [PATCH v3 5/6] KVM: arm64: Make ID_AA64PFR1_EL1.RAS_frac writable
In-Reply-To: <20250817202158.395078-6-maz@kernel.org>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Avril Crosse O'Flaherty"
References: <20250817202158.395078-1-maz@kernel.org>
 <20250817202158.395078-6-maz@kernel.org>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Mon, 18 Aug 2025 14:43:22 +0200
Message-ID: <87qzx8er6d.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_054333_566115_F87789D7 
X-CRM114-Status: UNSURE (   9.24  )
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

On Sun, Aug 17 2025, Marc Zyngier <maz@kernel.org> wrote:

> Allow userspace to write to RAS_frac, under the condition that
> the host supports RASv1p1 with RAS_frac==1. Other configurations
> will result in RAS_frac being exposed as 0, and therefore implicitly
> not writable.
>
> To avoid the clutter, the ID_AA64PFR1_EL1 sanitisation is moved to
> its own function.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/nested.c   |  3 ++-
>  arch/arm64/kvm/sys_regs.c | 41 ++++++++++++++++++++++++++-------------
>  2 files changed, 29 insertions(+), 15 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


