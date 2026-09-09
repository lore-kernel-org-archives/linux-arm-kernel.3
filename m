Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59630C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 11:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQDlEMSwUgcYwlCgsF0P+14I1eEYdtEPCzt/FAPC0sA=; b=XkejsuU9lxxkiu87ePKy1CBKW4
	KDxKQGU9c3/psuuuErARfMlAdw3StCzPJnt/tOPsYGBos0e5c+F9TChgTesXhdy2WQQ/hnGrFUx8R
	UF1agP/gM7DMzHsYlzY4wI65+RzTuR7DmEZyUHJtx06aofSXN+9Tpt4jZ2c1eUUNYkOc4iz8BbRw9
	2g3oU8YmuLin3S+IhS7t7YQiKwoQsfEKLjssJusrktRlHmcSTJkJBvl/VMv17YHp85eAD+YgD8QL+
	Ut/zWNoYzAFmE0x5KnBoaaX9mBIDirh4+HZm/xEWMsSrpuRD1XqaEi+hqM9xjLEg0ujxsn+gaYpZH
	tm4EE9cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4GKa-0000000BXwH-1s3X;
	Wed, 09 Sep 2026 11:19:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4GKZ-0000000BXvy-2OT8
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Sep 2026 11:19:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yQDlEMSwUgcYwlCgsF0P+14I1eEYdtEPCzt/FAPC0sA=; b=dHlvtLQv2ER1WgQ80n7IS7dVar
	WtqhXNz1iy0/sm5LwMoBqd1nD6te6CsWz/3oJOAiEYaKAtAYC3PvrCVfTSdyCSyW8J4NJSFVzPVdg
	ubmvtBCnba1s7p8C4J5xAMCjnGss0SbnxjtuiNLR2V9fiY97M7yu5WMtOauZLJVHaapluOiMiai9e
	3pMZ93tZkDbbSPmN5pNzw8hNM8pVl0/0GzsF43UROMHpm7djzpTt1dCIZBkNxpXv5XtUm3n6Vk1nD
	fI6ATTObspbimX4sC70QUhCDbB8lG6POSYUS6Z4AyynPtF/y/lLGCTPVlZP+68K8o/kmtkhQvHx57
	XYdSUbsg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4GKW-0000000179F-30oo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 11:19:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A36281691;
	Wed,  9 Sep 2026 04:18:59 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 769063F528;
	Wed,  9 Sep 2026 04:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788952743; bh=0z27TuDICIeRyqmCPKC7AxvlmQMlFwepct6/WPwp6CU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EKOCfyVh2ng6zaZCvB4qpszGmSyd2qCK9vwnww9ed6oHUevCW8yi8SF7V+nMJV7tH
	 sXtyIoLUHEOdQ/kPSnw4B2zPF/b7eACT2Se/ohEBz5pIaADVWNmSTXqmT/0BNK2xXU
	 Wto7H7vhGNPVKzxJnG6x5iHxz4usgjQSlWGu41Go=
Date: Wed, 9 Sep 2026 12:19:00 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: rolanddreier@rivian.com
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] firmware: arm_scmi: Don't reuse raw xfers with
 async_done still armed
Message-ID: <aqFApFQceTOfuThb@pluto>
References: <20260909-scmi-async-done-race-v2-0-cc5dec25c6be@rivian.com>
 <20260909-scmi-async-done-race-v2-2-cc5dec25c6be@rivian.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-scmi-async-done-race-v2-2-cc5dec25c6be@rivian.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_121904_923713_8E588773 
X-CRM114-Status: UNSURE (   9.63  )
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

On Wed, Sep 09, 2026 at 04:32:28AM +0000, Roland Dreier via B4 Relay wrote:
> From: Roland Dreier <rolanddreier@rivian.com>
> 
> In SCMI raw mode, scmi_xfer_raw_worker() releases the xfer before
> releasing the waiter that disarms xfer->async_done, and scmi_xfer_get()
> does not clear async_done when it hands out a recycled xfer. A concurrent
> transaction can therefore pick up the xfer while it still points at the
> old waiter's completion, so:

Hi,

LGTM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Tested-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

