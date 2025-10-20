Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E41DCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 15:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D6CPnFonO5sKCS7bceN3KCTd/W/tZnWxyXeYaG8/twM=; b=RNDeUm6qLJXq9nspcfQAjGP6/l
	NIMecgnfbqvJh1N21disbyUxrvPpKvHZzp5bP7sI84RFLYUYt8hn+Kc+Xdf9jIxp51srLp9tBfkQY
	FN4LcpSQee2uO9gcM4mcWBFiE8ZO7LawZNJz7tKn13RDS3+LOgFtiFMPAXbrcsnZ1poU4VzeamZ/+
	WxEN2XEMUY4oOrrodL5KdV33EnO+fxaxVz09Y4tDmR18q8agzGLFoErqB7BbdCPlMfTviRKm92kbM
	IFMfC4+byZQmbdG+ROeNpzQrucTysl2K1DiJOg6KwgF6OiVeuPtVrHSB9c4aEIVn51NcXbUX1fmR4
	Q2svlcNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAraV-0000000E52v-1j9m;
	Mon, 20 Oct 2025 15:14:19 +0000
Received: from fra-out-010.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([63.178.143.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAraS-0000000E52K-0IbD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 15:14:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1760973256; x=1792509256;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D6CPnFonO5sKCS7bceN3KCTd/W/tZnWxyXeYaG8/twM=;
  b=rWndtS4URmMoE17xFdfJQIycePXGxsu6wtY8YPZa7wWsj2rK8aw3nCv0
   ECTH5VBAt5Lx9Zu6ecIftFf/kx3rAPFkrdnesf4mBIMBAZWSNqVNljLRu
   vogdhOmDFcPswIa7pISnVfapXnWuoVAQxxmCef3ShLhgyRDGE81AFfRHh
   3SzebGgCY7+fVRc3iHVY/5zNFRxJ3daB2GSK10q802TVZW0Y5Y7uDPjAZ
   NkZMpsKJZubeWAqtbzGGfg+opOxQ3hWGqINv7qmfcUtLkNiqrEGBHgOTX
   kStNMZsPCs94uJHoYAI0x37iEGOzKwFbMd8FbSezebnnZFcEml6wHiEbQ
   A==;
X-CSE-ConnectionGUID: n3NccE7KSW2YT45fxLv/oA==
X-CSE-MsgGUID: rbGIbQvaRRWjTbKBN5HbyA==
X-IronPort-AV: E=Sophos;i="6.19,242,1754956800"; 
   d="scan'208";a="3778757"
Received: from ip-10-6-6-97.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.6.97])
  by internal-fra-out-010.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 15:14:05 +0000
Received: from EX19MTAEUA001.ant.amazon.com [54.240.197.233:4499]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.11.58:2525] with esmtp (Farcaster)
 id b59244ba-5e60-4163-a3ec-cd524499c9d1; Mon, 20 Oct 2025 15:14:05 +0000 (UTC)
X-Farcaster-Flow-ID: b59244ba-5e60-4163-a3ec-cd524499c9d1
Received: from EX19D016EUA001.ant.amazon.com (10.252.50.245) by
 EX19MTAEUA001.ant.amazon.com (10.252.50.192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Mon, 20 Oct 2025 15:14:04 +0000
Received: from amazon.com (10.1.213.24) by EX19D016EUA001.ant.amazon.com
 (10.252.50.245) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20; Mon, 20 Oct 2025
 15:14:00 +0000
From: Maximilian Dittgen <mdittgen@amazon.de>
To: <maz@kernel.org>
CC: <epetron@amazon.de>, <kvm@vger.kernel.org>, <kvmarm@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<mdittgen@amazon.com>, <mdittgen@amazon.de>, <nh-open-source@amazon.com>,
	<oliver.upton@linux.dev>, <pbonzini@redhat.com>, <shuah@kernel.org>
Subject: Re: [PATCH] KVM: selftests: fix ITS collection target addresses in vgic_lpi_stress
Date: Mon, 20 Oct 2025 17:13:50 +0200
Message-ID: <20251020151350.54383-1-mdittgen@amazon.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <86ms5lwwv8.wl-maz@kernel.org>
References: <86ms5lwwv8.wl-maz@kernel.org>
MIME-Version: 1.0
X-Originating-IP: [10.1.213.24]
X-ClientProxiedBy: EX19D038UWC001.ant.amazon.com (10.13.139.213) To
 EX19D016EUA001.ant.amazon.com (10.252.50.245)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_081416_408820_3E057AC2 
X-CRM114-Status: GOOD (  11.71  )
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

On Mon, 20 Oct 2025 15:01:15 +0200,
Marc Zyngier <maz@kernel.org> wrote:
>
> To be clear: I don't object to the patch. I object to the nonsensical
> commit message.
>
> And yes, what you have is the correct fix. Just wrap it as a helper
> I'd suggest procnum_to_rdbase(), if you need a name for it).

Thank you for the feedback, I've created a PATCH v2 with revised commit
message and a procnum_to_rdbase() helper.

>
> This test also violate the architecture by not performing a SYNC after
> any command, which would also require the use of a properly formatted
> target field. But hey, correctness is overrated.

I am currently working on a RFC patchset for per-vCPU vLPI enablement
that extends this selftest to test the feature. I will package in SYNCs
as a patch on the RFC.

Thanks,
Maximilian



Amazon Web Services Development Center Germany GmbH
Tamara-Danz-Str. 13
10243 Berlin
Geschaeftsfuehrung: Christian Schlaeger
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597


