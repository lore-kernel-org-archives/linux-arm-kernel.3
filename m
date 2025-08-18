Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB50BCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 14:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B2qOgp7MVZuSP0Gl2TjLKxdK/FGouEDQU4SdWnp2yrQ=; b=Lj21xbfab9TTPKVT17kTaH3YM+
	0dDot7tXwsufpDsejsGyBKMfS6pgId/VPt1lwmLm9j4tcZCDTfLquUxtwQ0SQ15XLZbMyaqC+lG4i
	099zx5lkW2SZmPNg3tv/Rp1YI6x/5BtEgQgmO3iRmM3N0Ozg28JK5LQGpbU6/ogrrGrSLqFUrSSp/
	40tcCkxsr9TbeRIaumESQOM41mKDn+G9V0qcnx/HmhO+hi56x+Ya5ql8wh0DmVzpqXpAoYZ/GhvAc
	j8IFimOW0MLJwYHAX1BW9H9e1Q7BaHbaJTlbfJXlSScFviZUt5yDsFJZtw5hh/ZGf0YbjY+n7FAhI
	wr2EnPig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo1Ao-00000007pR5-1fSK;
	Mon, 18 Aug 2025 14:49:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unz7O-00000007LiT-3BIk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 12:37:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755520661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B2qOgp7MVZuSP0Gl2TjLKxdK/FGouEDQU4SdWnp2yrQ=;
	b=i0bad5VDK/HHBN+K75ljU9sAjhN8RbVFFEUFaQp4P5K+jf/kMVZHX0oNmWHcW4VZ6vgu3x
	7WojeqO6Zdb665bdgkNC4Gp1Pns823uRWWJhJW6fQx44HcP1WaiPrS10f7M+FR4ZkGZPM7
	IYRFH6wz/dsr59KwHkxEW+EFRI4GpIA=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-183-Mz0j3rQXOCSl0HAgxQ7KoQ-1; Mon,
 18 Aug 2025 08:37:37 -0400
X-MC-Unique: Mz0j3rQXOCSl0HAgxQ7KoQ-1
X-Mimecast-MFC-AGG-ID: Mz0j3rQXOCSl0HAgxQ7KoQ_1755520655
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CFBEA1955D6A;
	Mon, 18 Aug 2025 12:37:34 +0000 (UTC)
Received: from localhost (dhcp-192-216.str.redhat.com [10.33.192.216])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 73BC71955F24;
	Mon, 18 Aug 2025 12:37:33 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, Zenghui
 Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>
Subject: Re: [PATCH v3 4/6] KVM: arm64: Make ID_AA64PFR0_EL1.RAS writable
In-Reply-To: <20250817202158.395078-5-maz@kernel.org>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Avril Crosse O'Flaherty"
References: <20250817202158.395078-1-maz@kernel.org>
 <20250817202158.395078-5-maz@kernel.org>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Mon, 18 Aug 2025 14:37:30 +0200
Message-ID: <87tt24erg5.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_053742_866334_7F102708 
X-CRM114-Status: UNSURE (   9.48  )
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

> Make ID_AA64PFR0_EL1.RAS writable so that we can restore a VM from
> a system without RAS to a RAS-equipped machine (or disable RAS
> in the guest).
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/sys_regs.c | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


