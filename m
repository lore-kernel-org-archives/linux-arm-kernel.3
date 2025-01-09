Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4995E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 12:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KxvKKIzlzclPZzGZDamCIT9TdR6k/Feb4jp3cOGYzmU=; b=bHLgdMSAUbkQpcrw80yQ+2i6il
	FtwEXqUv6b7V93P7hqUjC3apcCnXMhOlo/NnxgBn5HwC/PCvnMtBAL0heYOcrho7TN0SNwugomwAO
	mpuVrNmbbybhwNk1CLqzrnTznBFA+4FYf5SKNb2W++a8vs+VBdqe1Glx5jB6w833SMEZ/gmk1VTXl
	+CcSNX89yl6adZ2tEcF9YgccKidMaaDV/jihNg+LIYHxQNtsZG7orSko69E1WPk72JYW9QUlIAGLd
	Y6q+R8JmUpWJoINz/8diZ9mxjO+AEVHrrpih9kKErY8dxIL5kyJlyc/YvCUa8YHrFVUSDfTCjYQ1y
	E3j4xBZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVrJP-0000000BnrL-47UP;
	Thu, 09 Jan 2025 12:06:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVrIC-0000000BnjU-2pnJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 12:05:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736424337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KxvKKIzlzclPZzGZDamCIT9TdR6k/Feb4jp3cOGYzmU=;
	b=QMXXdI/laF7vrObRoYOmRSsZCERNGZBBk0dBMkACJS0Vj2b3jYwB4giSlsW7jPQglukclT
	hW3XlenH9Xz7am8LZd3VKBBOeC5wNy7MYmekAzq8eKkXyr5vyim8dw7G1lkcp+Mp0K9jYr
	7/hvNSQyvGpyLcM5zKLbOmIp9Nhe31U=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-588-SzhSxQMxPJGF5wclok4rgw-1; Thu,
 09 Jan 2025 07:05:35 -0500
X-MC-Unique: SzhSxQMxPJGF5wclok4rgw-1
X-Mimecast-MFC-AGG-ID: SzhSxQMxPJGF5wclok4rgw
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7D06D1955DD1;
	Thu,  9 Jan 2025 12:05:29 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.225.245])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id ACCCA19560AA;
	Thu,  9 Jan 2025 12:05:19 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Thu,  9 Jan 2025 13:05:04 +0100 (CET)
Date: Thu, 9 Jan 2025 13:04:53 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: "Dmitry V. Levin" <ldv@strace.io>
Cc: Eugene Syromyatnikov <evgsyr@gmail.com>,
	Mike Frysinger <vapier@gentoo.org>,
	Renzo Davoli <renzo@cs.unibo.it>,
	Davide Berardi <berardi.dav@gmail.com>,
	strace-devel@lists.strace.io, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>, linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org
Subject: Re: [PATCH 2/6] syscall.h: add syscall_set_arguments() on remaining
 HAVE_ARCH_TRACEHOOK arches
Message-ID: <20250109120453.GC26424@redhat.com>
References: <20250107230153.GA30560@strace.io>
 <20250107230418.GB30633@strace.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107230418.GB30633@strace.io>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_040540_820601_079B2430 
X-CRM114-Status: UNSURE (   7.90  )
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

On 01/08, Dmitry V. Levin wrote:
>
>  arch/arc/include/asm/syscall.h       | 14 +++++++++
>  arch/arm/include/asm/syscall.h       | 13 ++++++++
>  arch/arm64/include/asm/syscall.h     | 13 ++++++++
>  arch/csky/include/asm/syscall.h      | 13 ++++++++
>  arch/hexagon/include/asm/syscall.h   |  7 +++++
>  arch/loongarch/include/asm/syscall.h |  8 +++++
>  arch/mips/include/asm/syscall.h      | 46 ++++++++++++++++++++++++++++
>  arch/parisc/include/asm/syscall.h    | 12 ++++++++

Confused... arch/x86 needs syscall_set_arguments() too ?

Oleg.


