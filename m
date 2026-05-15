Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92AD4CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 13:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zi4fn0Lw5rMUi+pxXQJR000XZv8XauTxVrAuisrypEs=; b=zIksNJDPC6sldxa25mkvMG7f4C
	TN+BwIgpZIukjE0hzX9cwHvLcYeedL5kL3oXm4yd6RPWi2KsqXs29M7Ux8LHtxp3Z87d5OdNfHGyf
	JSlM009tf6jamO8a18neOk8u03n537tPY2L2OZeJb5i+uM0URIi32607Tgt3d5scZh69G3MYJFW81
	WTTNuR3EUpxpTvfNOiMGb10wDpeUR/7atTXjS7e+Imo6FIGtiqgW5n70gkS5rVTfrJuq6JHZLHrg6
	2NuqMUPhsW+GyxEM5VD1/T3jnXiXp3XFWlclNzk1hWtX2gNKCx7JpC0BBBVNaf3ePrQpNRpDbV28g
	TnFZoP7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNsbl-00000008RfV-0684;
	Fri, 15 May 2026 13:29:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNsbh-00000008Re2-2Fpn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 13:29:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB82227D3;
	Fri, 15 May 2026 06:29:29 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 857693F85F;
	Fri, 15 May 2026 06:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778851774; bh=uHs5psf72jixr5PLW9alj2Xe4IKVDCpYV1wL9XK62l4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R8/YpQyvuzrwSRnYg2JoDkIxh3go9HAAw6km2uev2luyQ+2NSbTpOqh7Vlgg63cfn
	 D6WWvDlTaCyNi4ZXucZ0LpYRx8RLEW83v68tMhqiwUrKAEstyHADUFyqPK/cmqajom
	 res/YvDKV73Gb70hxrbywHF7pqobc2om/qlSZyzs=
Date: Fri, 15 May 2026 14:29:32 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v6 02/13] coresight: etm4x: fix underflow for nrseqstate
Message-ID: <20260515132932.GN34802@e132581.arm.com>
References: <20260422132203.977549-1-yeoreum.yun@arm.com>
 <20260422132203.977549-3-yeoreum.yun@arm.com>
 <20260505161905.GA3778514@e132581.arm.com>
 <agb/NdYS/2jXdog0@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agb/NdYS/2jXdog0@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_062937_886767_9940D00D 
X-CRM114-Status: UNSURE (   9.30  )
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

On Fri, May 15, 2026 at 12:10:45PM +0100, Yeoreum Yun wrote:

[...]

> TBH, the number of transition is determinied by the MAX number of
> SEQ_STATE that's why I think define the ETM_MAX_SEQ_TRANSITIONS with
> 
>      #define ETM_MAX_SEQ_TRANSITIONS (ETM_MAX_SEQ_STATE - 1)
> 
> and uses ETM_MAX_SEQ_TRANSITIONS for the TCRSEQEVR and seq_ctrl.
> 
> Thought?

Looks good to me.

