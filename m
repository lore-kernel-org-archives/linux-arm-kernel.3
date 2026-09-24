Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D11C98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 15:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tqHYEXBU3cmKOfoVpEiW64CqFZ+s+N/UHPMQIjNktdw=; b=FvTJsi7I5viAAoCKYortgIXGs3
	0rjJGt06ddHcA25Ib7n8BkDFmmk/Mv96RPsJsNUqDKAWpXYdd2ymw6eC23Xxf+g0/Ogw9dX5aJMsl
	KxJSS/Sfl/vQdjM8U4zZAFlh9onEE9zxXgYy7gwuXUQZPMqJFZbKTB3/lrl2z2sZYHlKMVpkWArt8
	PSj+LsQzUvrS+Z/tMEc4pNMNyvd/BfwtvC6nyPhPKMibGnS5m4+Zm+hxBwzcZto6HVZUTZsNEHn7O
	Yo4d4nNZpohLZuahi9FhxZzUjyIx94ZTnQyIrMAvi71fy2NGyQu+AroCEe5uKMvmWYd4Z6RpDipaL
	904Dr3yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9krT-0000000BJfC-1KZo;
	Thu, 24 Sep 2026 14:55:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9krT-0000000BJf6-0AQT
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Sep 2026 14:55:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tqHYEXBU3cmKOfoVpEiW64CqFZ+s+N/UHPMQIjNktdw=; b=eTnVVdI6RV57C5LIbdECOi/Mu5
	vBmFhOmsoyES019bEiuklUNQbJU6o9zeVlv4NNEw41K4ki2b21NDkbb6ZITiJhzsMcKz2Vc7DFj7T
	5In5CpnkWs+IN1F1Ccx+NSunaywYB/AO/nWevajIPQUDlUUowE1u2G90HxLMa0AZuoUgjLl+wwcEi
	Hi6+nIdL21vbsSf2XkP6jsyNFMWOtBPqy9fuIarss8wjazvm8kC3c3oH/hhjsl723OmYV57H2wvkd
	tNsVy0woxOnwpjF0LShrGhh47r2TuwEaKZatHfxAaMkuyrg883+8rA1ljyoNUD4TqlOe0CMb8Qn88
	InEwdi0Q==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9krP-0000000G6XH-3iZZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 14:55:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A645143D;
	Thu, 24 Sep 2026 07:55:36 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 901AE3F86C;
	Thu, 24 Sep 2026 07:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790261739; bh=dGigSJ9bfvrCJTJezA64ql8bioG3tCAfNENgeTrxU1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E8wY485nFSqGU6S68M3V7c2yBFx/I6meN/gefaMYakGsj8ECSU4oXwejSsWS8ZLOM
	 5/tTS/L8YHroe8ZcG3B/Gtd5eGBLKQQYt6H8oyPmZpXEp7RK5DcIaNo3mhhL9SBYqM
	 EDD/mT6Qjdv6uCpo4PxSSlWvXQYf89EJsF7zglcQ=
Date: Thu, 24 Sep 2026 15:55:32 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Beata Michalska <beata.michalska@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org,
	suzuki.poulose@arm.com, James.Morse@arm.com, xuewen.yan94@gmail.com,
	seanwang1@lenovo.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: errata: Add Cortex-A725 erratum 3821522 workaround
Message-ID: <arU55PEnc7Gjy830@arm.com>
References: <20260908104800.3744507-1-beata.michalska@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908104800.3744507-1-beata.michalska@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_155544_148963_4BBB4EF8 
X-CRM114-Status: GOOD (  11.18  )
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

Hi Beata,

On Tue, Sep 08, 2026 at 12:47:08PM +0200, Beata Michalska wrote:
> diff --git a/arch/arm64/include/asm/topology.h b/arch/arm64/include/asm/topology.h
> index b9eaf4ad70850..93f33ee078638 100644
> --- a/arch/arm64/include/asm/topology.h
> +++ b/arch/arm64/include/asm/topology.h
> @@ -17,6 +17,12 @@ int pcibus_to_node(struct pci_bus *bus);
>  
>  #include <linux/arch_topology.h>
>  
> +static inline bool this_cpu_has_broken_amu_constcnt(void)
> +{
> +	return this_cpu_has_cap(ARM64_WORKAROUND_2457168) ||
> +	       this_cpu_has_cap(ARM64_WORKAROUND_3821522);
> +}

Instead of this, please add ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT and set
it in the .capability field of a multi-cap entry. We do the same with
ARM64_WORKAROUND_REPEAT_TLBI_SYNC.

-- 
Catalin

