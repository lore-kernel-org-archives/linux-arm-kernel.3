Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 734C3C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 14:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bs0KT0uEopTREFIV09FXprEMp4r+yb1cp38ev0pRS7o=; b=uRJAtduEv92Y7TXpDMbu9Qy+Az
	xz4pmFbACRuBPnjXaLGOgeNt4JDLIFYwBZL6pS4v3JPXhIX9evAS0To94sKP8CVcK1IknUraR5rI/
	5s8+2Hy1bZK0cNi1GIYT4C2pRvGtPQZtIBTo+JKCOPmLiXnPZkSejw5q67HrTGhLr+4rH0iDv5qg6
	08oXt0Y42HY9EMLa0SXlGnnatXaT90D0Av0I6dRyGsNAuh8n7gtbe4p/0yhMPst8wd2FlY9VOm6ph
	t4GJJ66Czu2Rb5a/+SiMhCus5m5qUWlhvFx0UCzLyUUJkXgFl10dWUtq16FW1tnWNqYDfm5/C7OHS
	GRq51gvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEU8F-00000009jFb-0PM0;
	Mon, 12 May 2025 14:27:51 +0000
Received: from smtp-fw-6001.amazon.com ([52.95.48.154])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uETqP-00000009fnm-1naN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 14:09:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1747058965; x=1778594965;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bs0KT0uEopTREFIV09FXprEMp4r+yb1cp38ev0pRS7o=;
  b=gMhoXRZT0w47mGR7MWU8SfXV94xT5m/5BXnqjeYtpYxzzKKL0+gHyduy
   cHLJrybG9b04H0T2RaBzuKZMyK8DTro8Mptzk0DpqFPTghrmH4A0Ds6bU
   f9gP904Sn81qO5VXEqvU+RmK9kOG4VojAjRseKA1JlpwA/v+afjcvJbtc
   1Uxwc43OC9DaWngLVxDXDR00oXHNfPZQYuC9jXS5SgK1MMz97c639TgDM
   ETIS1xjJ+KAP8l8Q782ZxJWgs72fYdYmPk/uc1RQB9x2ml0OfcDb+Bb4c
   l0uGaBAvPcL0kEl/ZermZsTLDaWi7ywMcd6NJKekAwaQMBAHajVydjmPc
   w==;
X-IronPort-AV: E=Sophos;i="6.15,282,1739836800"; 
   d="scan'208";a="489002478"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.43.8.2])
  by smtp-border-fw-6001.iad6.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 14:09:19 +0000
Received: from EX19MTAEUA002.ant.amazon.com [10.0.10.100:46847]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.21.215:2525] with esmtp (Farcaster)
 id d1c2ccfc-6936-4d2e-9e97-d566a0803f65; Mon, 12 May 2025 14:09:19 +0000 (UTC)
X-Farcaster-Flow-ID: d1c2ccfc-6936-4d2e-9e97-d566a0803f65
Received: from EX19D023EUB003.ant.amazon.com (10.252.51.5) by
 EX19MTAEUA002.ant.amazon.com (10.252.50.124) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Mon, 12 May 2025 14:09:18 +0000
Received: from dev-dsk-dssauerw-1b-2c5f429c.eu-west-1.amazon.com
 (10.13.238.31) by EX19D023EUB003.ant.amazon.com (10.252.51.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1544.14; Mon, 12 May 2025 14:09:13 +0000
From: David Sauerwein <dssauerw@amazon.de>
To: <jingzhangos@google.com>
CC: <andre.przywara@arm.com>, <coltonlewis@google.com>, <eauger@redhat.com>,
	<jiangkunkun@huawei.com>, <joey.gouly@arm.com>, <kvm@vger.kernel.org>,
	<kvmarm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<lishusen2@huawei.com>, <maz@kernel.org>, <oupton@google.com>,
	<pbonzini@redhat.com>, <rananta@google.com>, <suzuki.poulose@arm.com>,
	<yuzenghui@huawei.com>, <graf@amazon.com>, <nh-open-source@amazon.com>
Subject: Re: [PATCH v4 5/5] KVM: arm64: vgic-its: Clear ITE when DISCARD frees an ITE
Date: Mon, 12 May 2025 14:09:09 +0000
Message-ID: <20250512140909.3464-1-dssauerw@amazon.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241107214137.428439-6-jingzhangos@google.com>
References: <20241107214137.428439-6-jingzhangos@google.com>
MIME-Version: 1.0
X-Originating-IP: [10.13.238.31]
X-ClientProxiedBy: EX19D036UWC003.ant.amazon.com (10.13.139.214) To
 EX19D023EUB003.ant.amazon.com (10.252.51.5)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_070925_628562_1835F862 
X-CRM114-Status: GOOD (  11.96  )
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

Hi Jing,

After pulling this patch in via the v6.6.64 and v5.10.226 LTS releases, I see
NULL pointer dereferences in some guests. The dereference happens in different
parts of the kernel outside of the GIC driver (file systems, NVMe driver,
etc.). The issue only appears once every few hundred DISCARDs / guest boots.
Reverting the commit does fix the problem. I have seen multiple different guest
kernel versions (4.14, 5.15) and distributions exhibit this issue.

The issue looks like some kind of race. I think the guest re-uses the memory
allocated for the ITT before the hypervisor is actually done with the DISCARD
command, i.e. before it zeros the ITE. From what I can tell, the guest should
wait for the command to finish via its_wait_for_range_completion(). I tried
locking reads to its->cwriter in vgic_mmio_read_its_cwriter() and its->creadr
in vgic_mmio_read_its_creadr() with its->cmd_lock in the hypervisor kernel, but
that did not help. I also instrumented the guest kernel both via printk() and
trace events. In both cases the issue disappears once the instrumentation is in
place, so I'm not able to fully observe what is happening on the guest side.

Do you have an idea of what might cause the issue?

David



Amazon Web Services Development Center Germany GmbH
Tamara-Danz-Str. 13
10243 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597


