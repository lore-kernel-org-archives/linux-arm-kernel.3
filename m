Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E15AAC369A6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 12:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RrLOjVCqCMsLo6/22WxxuDKmqoQV5liMyxCxtsLfqB0=; b=FeIh7tZLbsWiyN9QxYjT353OLU
	RO+SfrQmD9RG3iElhakZFAOJkdC1E+NYBHza2VoJ0sHsF8muKkU/IfMTbCT01HOh17z6eK8JoGfsM
	JPFsntraojiAvrBaXyLRdeFmlbOf0AGDMCjlVnIZncET2sKiTc3HQi2LSQfvV0qRgfyXrvcUq4rmI
	Slct80TljHLJU+WHjUcKDfo/xF8HNjE0JHN0dEmtNo3AGBD3FYIMsWW45Qfwcp+38E3w90djaOJBx
	jvbvQcQNyTqnrcSQAwEeONX1xI0GR46k5xAQOF/0GellaFc1hgCgBqq4RB49VcNmcB4udd47giJb/
	RDTLfNxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1lhd-00000000GvI-0o3J;
	Mon, 07 Apr 2025 12:35:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1lB2-000000008lx-0sEo
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Apr 2025 12:02:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RrLOjVCqCMsLo6/22WxxuDKmqoQV5liMyxCxtsLfqB0=; b=H+nBgCT/F0CasggDWK7ybE/86h
	agkO96Y/TKNuTQsrg2qF7f4MV8QmHPkNm5Sh9PdBpmjk2Qznh7W6mzZ99tMYgzCT6V9ebhD1D8VCg
	VR951sLV3Dx9LZE2hbjUe5CyMG0hridsXWEn3jOa70e56+9l/kqGRMNHCkj+/qxmy6z4r0H+K+Ih4
	JZAXdzhFKkz9Kn4mGDkHklE0FPTMsI9IQXDyPpGeaunnvWNQDS3/YRtNJP1eXE6DOqpz3kfUDlPbj
	5Sfvt1tMt3PUKf2dXYaaUCPsQv4NYzWARezck9BIpXcuCBpmFdS5Ng4CvAMg/9oLJZWCmcmb5KI+E
	RhupSD+Q==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1lAz-00000007wTK-0Ar9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 12:02:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744027321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RrLOjVCqCMsLo6/22WxxuDKmqoQV5liMyxCxtsLfqB0=;
	b=S6gNAAjvxMj7Y5W8FlWBSV80LIxZZi739kF1AZCMnqqWrdYC5DNy2E6horRXsbi9xEiOBO
	jfgp/wkgEa7zB42bYADhCsJ5QJ2oggu01Fu3eNnLPQ2cYCZfMq2gxKXnvW5Fx6EbQ1Ljwy
	DWXPAQndnB4txBR3N1GhUI3fAEnSY50=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744027321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RrLOjVCqCMsLo6/22WxxuDKmqoQV5liMyxCxtsLfqB0=;
	b=S6gNAAjvxMj7Y5W8FlWBSV80LIxZZi739kF1AZCMnqqWrdYC5DNy2E6horRXsbi9xEiOBO
	jfgp/wkgEa7zB42bYADhCsJ5QJ2oggu01Fu3eNnLPQ2cYCZfMq2gxKXnvW5Fx6EbQ1Ljwy
	DWXPAQndnB4txBR3N1GhUI3fAEnSY50=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-641-C8XnyaP1Nj2sTs5S9CcQvg-1; Mon,
 07 Apr 2025 08:00:26 -0400
X-MC-Unique: C8XnyaP1Nj2sTs5S9CcQvg-1
X-Mimecast-MFC-AGG-ID: C8XnyaP1Nj2sTs5S9CcQvg_1744027224
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 261901828AB6;
	Mon,  7 Apr 2025 12:00:21 +0000 (UTC)
Received: from localhost (dhcp-192-216.str.redhat.com [10.33.192.216])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EF0F619541A6;
	Mon,  7 Apr 2025 12:00:19 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Oliver Upton <oliver.upton@linux.dev>, linux-arm-kernel@lists.infradead.org
Cc: kvmarm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton
 <oliver.upton@linux.dev>
Subject: Re: [PATCH] arm64: Expose AIDR_EL1 via sysfs
In-Reply-To: <20250403231626.3181116-1-oliver.upton@linux.dev>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20250403231626.3181116-1-oliver.upton@linux.dev>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Mon, 07 Apr 2025 14:00:17 +0200
Message-ID: <87jz7w9o6m.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xbcBsVT45eMUlpcN_wfzjZ3WWpoHRYorv6V8CUmV528_1744027224
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_130205_268139_6341221E 
X-CRM114-Status: GOOD (  13.94  )
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

On Thu, Apr 03 2025, Oliver Upton <oliver.upton@linux.dev> wrote:

> The KVM PV ABI recently added a feature that allows the VM to discover
> the set of physical CPU implementations, identified by a tuple of
> {MIDR_EL1, REVIDR_EL1, AIDR_EL1}. Unlike other KVM PV features, the
> expectation is that the VMM implements the hypercall instead of KVM as
> it has the authoritative view of where the VM gets scheduled.
>
> To do this the VMM needs to know the values of these registers on any
> CPU in the system. While MIDR_EL1 and REVIDR_EL1 are already exposed,
> AIDR_EL1 is not. Provide it in sysfs along with the other identification
> registers.
>
> Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
> ---
>  Documentation/ABI/testing/sysfs-devices-system-cpu |  1 +
>  Documentation/arch/arm64/cpu-feature-registers.rst | 13 +++++++------
>  arch/arm64/include/asm/cpu.h                       |  1 +
>  arch/arm64/kernel/cpuinfo.c                        |  3 +++
>  4 files changed, 12 insertions(+), 6 deletions(-)

Indeed, AIDR_EL1 should be available alongside the others.

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


