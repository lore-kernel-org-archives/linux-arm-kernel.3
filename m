Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 550B0CA0EF1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 14:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/xhetDspssApBKISBn5ZaW5PlAHoD+TybPOqB+IwKDk=; b=NIVxZbohtVxicXi0VqzDBX8wAj
	n9diOcuMMowZaiza7KHLGk9EEjzJ516qT+aVsMDiU5330xW/EL99qZnqk1809p6SivFeAprqK/rKX
	+s7a1sNaMjTxKuFiIl9E676+Q+moErqIaBTJ7DAv+9qiaFg3b5i7UTCXeqawlvgaWnuKK7BT+n1iU
	SOB7HIFSHoNygnw7zGqlxPIlD67q7ihrFOkP8b8Ro2WRsEHHwN2dgUfspbk+ZowV2SgyibJxHZpgj
	55neROLZ562gY+7MHpsg148RpEgs4BIss5/G9GqF2declR02vewhqx/9cnsU9D69CzHg+bSTbP/NR
	ybtiu4MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo1Am-00000007pOn-0psu;
	Mon, 18 Aug 2025 14:49:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unz2A-00000007L6i-1BlZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 12:32:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755520335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/xhetDspssApBKISBn5ZaW5PlAHoD+TybPOqB+IwKDk=;
	b=TqdH3Nfm/z19nW2plS+vc1GpKcZ4IFZyJ0ERMtDTgjErf4gOdF9H/ypSwCOTvOO9/RuHu9
	6MkRjEg4nmwAf93Uo4275MFEl+Aw5DpYlbeNaAmVwAjyf9Ch3tpRQS3fG8CNdpzDKlDj4b
	qdjGtXoNmvX36u0E1MI+/nBb56dfe98=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-673-QzENNlAGPtaUSEVz6EQjMw-1; Mon,
 18 Aug 2025 08:32:12 -0400
X-MC-Unique: QzENNlAGPtaUSEVz6EQjMw-1
X-Mimecast-MFC-AGG-ID: QzENNlAGPtaUSEVz6EQjMw_1755520330
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3F34E195608A;
	Mon, 18 Aug 2025 12:32:09 +0000 (UTC)
Received: from localhost (dhcp-192-216.str.redhat.com [10.33.192.216])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EC335180028C;
	Mon, 18 Aug 2025 12:32:07 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, Zenghui
 Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>
Subject: Re: [PATCH v3 1/6] arm64: Add capability denoting FEAT_RASv1p1
In-Reply-To: <20250817202158.395078-2-maz@kernel.org>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Avril Crosse O'Flaherty"
References: <20250817202158.395078-1-maz@kernel.org>
 <20250817202158.395078-2-maz@kernel.org>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Mon, 18 Aug 2025 14:32:05 +0200
Message-ID: <87zfbwerp6.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_053218_391769_891A13EE 
X-CRM114-Status: GOOD (  11.01  )
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

> Detecting FEAT_RASv1p1 is rather complicated, as there are two
> ways for the architecture to advertise the same thing (always a
> delight...).
>
> Add a capability that will advertise this in a synthetic way to
> the rest of the kernel.
>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kernel/cpufeature.c | 24 ++++++++++++++++++++++++
>  arch/arm64/tools/cpucaps       |  1 +
>  2 files changed, 25 insertions(+)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


