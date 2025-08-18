Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5D2CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 13:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TKSbrH5oIB8ZU6dcjcUhgYlEM8QpHDUCs4pxg5b6zjQ=; b=MuDXxUFJHGYBdVq1A3K95YyHIf
	UR/S/lXEXn9MaUDfY08N8/CxqAhQqV6aJpnPqOiiGzRN8Y9OGF3bj4tHaTymmvc9AfReSjhXLyDHH
	zWFZmHNxz+JEfoah09xParBLHjsig5td8KX1kuE49Y7WTpIcUF2cz7UDIkiQ8KcjOMtkp6RHJUaRq
	wjceSsvNg2wVlQWYSNiFibPcenVWQ0nuLRDj4/wdxQ1+onNGT7x/7FUsBFw6ECz303sFec8TW0XC9
	wHFx95uz3/fGzQusVV1vWSwQgo8dXAt6w7pcf3b8dIoAwWKQDjPC53S3IIcYQTUbZEE7W25tGaMIE
	5gjEcQmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo08o-00000007dM1-3YFE;
	Mon, 18 Aug 2025 13:43:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unz4c-00000007LOI-0iez
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 12:34:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755520489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TKSbrH5oIB8ZU6dcjcUhgYlEM8QpHDUCs4pxg5b6zjQ=;
	b=CezuwgpMUXpUrfK9z0Ve2HtP4Nk2RX/TPUyJmOujytJ5Q5qpzGxtFWbmtHRpwY/F+Pn9FO
	qQpXrtBZwZB+xrpnhcrr2oAKjh/NhLil2PXepti6Crj2IhajBZD3meV3LdpBR+GbA+9hwK
	vq/4xy3gTt4dTpPYXC7zFC9IAQl3o0Q=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-277-5nVzAZqgOrG93_CCd2sXUg-1; Mon,
 18 Aug 2025 08:34:42 -0400
X-MC-Unique: 5nVzAZqgOrG93_CCd2sXUg-1
X-Mimecast-MFC-AGG-ID: 5nVzAZqgOrG93_CCd2sXUg_1755520480
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BD1971956079;
	Mon, 18 Aug 2025 12:34:39 +0000 (UTC)
Received: from localhost (dhcp-192-216.str.redhat.com [10.33.192.216])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7CEBA30001A5;
	Mon, 18 Aug 2025 12:34:38 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, Zenghui
 Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>
Subject: Re: [PATCH v3 2/6] KVM: arm64: Handle RASv1p1 registers
In-Reply-To: <20250817202158.395078-3-maz@kernel.org>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Avril Crosse O'Flaherty"
References: <20250817202158.395078-1-maz@kernel.org>
 <20250817202158.395078-3-maz@kernel.org>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Mon, 18 Aug 2025 14:34:35 +0200
Message-ID: <87wm70erl0.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_053450_276902_F75150BA 
X-CRM114-Status: GOOD (  10.32  )
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

> FEAT_RASv1p1 system registeres are not handled at all so far.

s/registeres/registers/

> KVM will give an embarassed warning on the console and inject
> an UNDEF, despite RASv1p1 being exposed to the guest on suitable HW.
>
> Handle these registers similarly to FEAT_RAS, with the added fun
> that there are *two* way to indicate the presence of FEAT_RASv1p1.
>
> Reviewed-by: Joey Gouly <joey.gouly@arm.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/sys_regs.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


