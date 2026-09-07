Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA0FCC79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 11:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BEpf8hgMFfwfLppSbasYZBD2/Sccmp9mXf/uOxGdTEk=; b=1JIE09O7H9aluShd1YNRjq11B/
	9D0dgq4wKg/tGrawEmZkax8oe/WhAhOF89nuL75hrJ/klG5TL4d0uJpOzZ+GcreplvQBvJvwmMW42
	3iSbFKxWJEj7GU3u6poxdxE5YoPbKFZ4+542rQDMnM9htno/HNm3M+46JCghzgDm1hes4091DkVPD
	YDHmqSWuZ0AANhT0B+8IMfFKG60vJCd99cLneOtpE8YkLTP2WHGMG/SLwd+513hfX10hgdiYXoeW6
	+fybwjnT4hjaAzzoiVnYys33FCDhDcCaqHHdNWBFuY1OjHXL+RE26dNNtjMfIvH9drewHMIeqoogS
	TUjIROUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XHZ-00000006c5v-0aVJ;
	Mon, 07 Sep 2026 11:13:01 +0000
Received: from esa9.hc1455-7.c3s2.iphmx.com ([139.138.36.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XHT-00000006c4v-4Baj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 11:12:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1788779576; x=1820315576;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EpBWm7l/SMvIb6B8I2VN3Q1p/tlU23eIdQVaFpkHoJY=;
  b=pcxzlSbOBX07CmaSLEgbGFdr5Nh8jDqms9F4bvCcUaNDgKelAvtr4zP0
   M3lPPdjFCW++iWaW2PH5yUanuiZpXEXo7oaLI4g6zPdWClq0T+ESM4MAw
   htmXEbML7T+X+qF7LgDGsaSuidgnhG0NTrdQmYlrPCVa5kNLcBiUg5XDu
   pQhlStab/+nEywyrE5bnzmHLnxhUBcuHPv8eGn4Jj4u9EZx+1HZ0Kwo2p
   AD3+3nvN2EJgwsgoM2UXNpYXoY7qPbDcdhuHxy+hKru3+fvAAzt3/WET/
   ezuE+ln1rtMT8z54HvLrCEp7Jr58D08ypMmyZJF0UnVcxEdgW21xsA4yU
   g==;
X-CSE-ConnectionGUID: EezQ6CZRQuWYzG4v8POavQ==
X-CSE-MsgGUID: m/vvO7rDQZyPjq5VPwk0rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="241687711"
X-IronPort-AV: E=Sophos;i="6.25,267,1779116400"; 
   d="scan'208";a="241687711"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 20:12:53 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id A143B1C000CB
	for <linux-arm-kernel@lists.infradead.org>; Mon,  7 Sep 2026 11:12:53 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 532FA1C002E4
	for <linux-arm-kernel@lists.infradead.org>; Mon,  7 Sep 2026 11:12:53 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.8.144.219])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with SMTP id AC6E01800102;
	Mon,  7 Sep 2026 11:12:44 +0000 (UTC)
Date: Mon, 7 Sep 2026 20:12:36 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH v16 22/45] KVM: arm64: CCA: Handle RMI_EXIT_RIPAS_CHANGE
Message-ID: <ap6YrZiCdS6FI83p@FCCLS0092175.localdomain>
References: <20260803134403.80630-1-steven.price@arm.com>
 <20260803134403.80630-23-steven.price@arm.com>
 <ap49Orng5-oehc6J@FCCLS0092175.localdomain>
 <86fqzl4biu.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <86fqzl4biu.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_041256_327848_929E07A1 
X-CRM114-Status: GOOD (  14.28  )
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

Hi Marc,

On 09/07 11:10, Marc Zyngier wrote:
> On Mon, 07 Sep 2026 06:05:29 +0100,
> Kohei Enju <enju.kohei@fujitsu.com> wrote:
> 
> [...]
> 
> > Although the root cause is an RMM bug, should we also guard RIPAS_SET
> > against this no-progress case?
> 
> No. We really should *prevent* the kernel from using a known broken
> RMM. 

I understand.

> Which brings me to one of my long standing request: how to we
> enforce the minimum version of RMM that KVM is willing to work with?
> 
> We absolutely need to have a hard deprecation mechanism in place
> before day-1.

Agreed. Such a mechanism is clearly necessary.

Is there any ongoing work to address this that you are aware of? This
seems like a fairly broad topic that may require a separate discussion.

Thanks,
Kohei

> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

