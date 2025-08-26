Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9AC5CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 11:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=abKpzBQ7ZB8U0011TBKR9LxTr0YbrhhCi/05F49w6oE=; b=dCj5B5sIqIfVWkLFDyn9Xns0o0
	FsMJawTH3Pr443HfrEP52aKOvR8UPUEtJp/kAkxvTAzablYJNMGPMpAOaL6ddeemq/TJ/zkWSPDNm
	W6/pJPjCvEw5ftYcjuV0890FTDdSKO6YFlhlOF4yrLAid/JWDM7SzyzZtoAJJFhE2GN7489vsFoTU
	PuSBy8v2pIRxKts79iT9Lki3hRDYCL+n8zMeotCI5efx7JX9ckyDi1KNZ7f6o77B8zpfzjriUnQ0S
	26jkpCPTHS9Nwj08/8Y+qarn7cuntQre0z4vr1rSFr63hOIFELlNw77kgb9g+anCBHN13K+MmL3Ey
	UmxYM+KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqrvR-0000000Bn8J-0ZLl;
	Tue, 26 Aug 2025 11:33:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqr3i-0000000Bdwt-2E95
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 10:37:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E7E31A00;
	Tue, 26 Aug 2025 03:37:37 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4D8EC3F694;
	Tue, 26 Aug 2025 03:37:44 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] firmware: arm_scmi: Constify struct scmi_voltage_proto_ops
Date: Tue, 26 Aug 2025 11:37:40 +0100
Message-Id: <175620458844.1761583.10265205606346566256.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2091660c072dd2d5599897243a5d69e89d46ed4d.1753816459.git.christophe.jaillet@wanadoo.fr>
References: <2091660c072dd2d5599897243a5d69e89d46ed4d.1753816459.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_033746_616517_73FFFB35 
X-CRM114-Status: UNSURE (   8.51  )
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

On Tue, 29 Jul 2025 21:15:03 +0200, Christophe JAILLET wrote:
> 'struct scmi_voltage_proto_ops' is not modified in this driver.
> 
> Constifying this structure moves some data to a read-only section, so
> increases overall security, especially when the structure holds some
> function pointers.
> 
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>   13142	   1808	      0	  14950	   3a66	drivers/firmware/arm_scmi/voltage.o
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/2] firmware: arm_scmi: Constify struct scmi_voltage_proto_ops
      https://git.kernel.org/sudeep.holla/c/abd658d3e733
[2/2] firmware: arm_scmi: Constify struct scmi_transport_ops
      https://git.kernel.org/sudeep.holla/c/224dcf2968ca
--
Regards,
Sudeep


