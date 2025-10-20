Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E696CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 12:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gT4c4sJrY+uRE80dfQnZ0+JjbvKqCsCY5BuNFNs0hp4=; b=ZXlFuBNcGxOhKeF9AYbeAzrpae
	XBiSwfCzJ47rYhhkYA1atxsh7p8YxBxntdMTXr3YgcT3nvXVV1RqLaNPYawhtiL+CHo4KzV2zmnAN
	B5vUOg9jHzwT+Nz6Z9LToXnFUo2ejh7gxs9uear7TiWYBkpl4C2Vnct3mUhuPxTyUlkgZaN6rT6r8
	o0Bod+cLESdKQzBFQQK+1l14C9uOteO3Jc+IYAC/E39tkIAd3H9EtCKXArvcLUiB+uhs6nnaQQ9f6
	AKFq7suXBayXxxfuO9BSEX49pWcHBqabmxp3a3TfXTHG05Z6J68HPQ0WAl5hNvzx8XuRW2rhi6D7X
	ySFNRdzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAol6-0000000DKBL-47yt;
	Mon, 20 Oct 2025 12:13:04 +0000
Received: from fra-out-006.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([18.197.217.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAol3-0000000DK7a-2tDD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 12:13:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1760962381; x=1792498381;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gT4c4sJrY+uRE80dfQnZ0+JjbvKqCsCY5BuNFNs0hp4=;
  b=qW/etFQg1MvHsHGIkQGE/JB82vRRKzo7475/hplalor6eovXmMNNKEQ6
   8EtseTmz1gtyIEHQDAamXKJU98bfAnBTdoAO+pwKL3bRu3jcWcOU3yXeW
   o3Rqovsbd2lcJ7r9tbOl0iBEjOr4J42pJVqVWd+A0rNSUUBNqzMLLoAyl
   tUd/AUe3/Wgn2vRKCAFh6lCrUWcsTNPOD48avKjDM92KhWQVwhGdBQSVi
   /WYZwtiXZr3Gs6cbytSVfCrbdv0lBBo5+YUiw6XK5uoCo9Rn1zoggtCxp
   GvGef7tyonFHU6hq4OLaasZCm4KCoBovRSXDA38YxswjQVF+NJBX1yw1m
   A==;
X-CSE-ConnectionGUID: paAvEk0fQZycm0Z2Ouoe9w==
X-CSE-MsgGUID: urA571EoRWOh9u8FI1m1cw==
X-IronPort-AV: E=Sophos;i="6.19,242,1754956800"; 
   d="scan'208";a="3869976"
Received: from ip-10-6-11-83.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.11.83])
  by internal-fra-out-006.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 12:12:48 +0000
Received: from EX19MTAEUC001.ant.amazon.com [54.240.197.225:17685]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.33.169:2525] with esmtp (Farcaster)
 id d81a3bf9-5a3a-4933-b9f8-3d78ac7eca0f; Mon, 20 Oct 2025 12:12:48 +0000 (UTC)
X-Farcaster-Flow-ID: d81a3bf9-5a3a-4933-b9f8-3d78ac7eca0f
Received: from EX19D016EUA001.ant.amazon.com (10.252.50.245) by
 EX19MTAEUC001.ant.amazon.com (10.252.51.155) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Mon, 20 Oct 2025 12:12:34 +0000
Received: from amazon.com (10.1.213.26) by EX19D016EUA001.ant.amazon.com
 (10.252.50.245) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20; Mon, 20 Oct 2025
 12:12:30 +0000
From: Maximilian Dittgen <mdittgen@amazon.de>
To: <maz@kernel.org>
CC: <epetron@amazon.de>, <kvm@vger.kernel.org>, <kvmarm@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<mdittgen@amazon.com>, <mdittgen@amazon.de>, <nh-open-source@amazon.com>,
	<oliver.upton@linux.dev>, <pbonzini@redhat.com>, <shuah@kernel.org>
Subject: Re: [PATCH] KVM: selftests: fix ITS collection target addresses in vgic_lpi_stress
Date: Mon, 20 Oct 2025 14:12:20 +0200
Message-ID: <20251020121220.83972-1-mdittgen@amazon.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <86v7kdwj8u.wl-maz@kernel.org>
References: <20251017161918.40711-1-mdittgen@amazon.de> <86v7kdwj8u.wl-maz@kernel.org>
MIME-Version: 1.0
X-Originating-IP: [10.1.213.26]
X-ClientProxiedBy: EX19D037UWB004.ant.amazon.com (10.13.138.84) To
 EX19D016EUA001.ant.amazon.com (10.252.50.245)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_051302_096794_72B51F15 
X-CRM114-Status: UNSURE (   9.18  )
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

On Fri, 17 Oct 2025 19:06:25 +0200,
Marc Zyngier <maz@kernel.org> wrote:
>
>	  * We use linear CPU numbers for redistributor addressing,
>	  * so GITS_TYPER.PTA is 0.
>
> It is not an address.

The issue is that its_encode_target in selftests is designed for
physical redistriubtor addresses (GITS_TYPER.PTA = 1) and thus
performs a right shift by 16 bits:

		its_mask_encode(&cmd->raw_cmd[2], target_addr >> 16, 51, 16);

When the vgic_lpi_stress selftest passes in a linear vCPU id as
the redistributor address (GITS_TYPER.PTA = 0 behavior),
The its_encode_target function shifts the CPU numbers 16 bits right,
functionally zeroing them.

We need to either:
- Align this specific selftest with GITS_TYPER.PTA = 0 and not use
    its_encode_target to encode the target vCPU id. Instead have a
    dedicated encode function for the use case without a bit shift.
- Align all selftests with GITS_TYPER.PTA = 0 and refactor
    its_encode_target to skip the bit shift altogether.
- Align selftests with GITS_TYPER.PTA = 1 and pass a redistributor
    address, not a vCPU id, into its_send_mapc_cmd().

Otherwise, the selftest's current behavior incorrectly maps all
collections to target vCPU 0.

Thanks,
Maximilian



Amazon Web Services Development Center Germany GmbH
Tamara-Danz-Str. 13
10243 Berlin
Geschaeftsfuehrung: Christian Schlaeger
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597


