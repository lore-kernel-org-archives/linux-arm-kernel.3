Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF060CF8863
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 14:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8iKUFgtUc+Q3Q8jdFXk9ueJ0tdriRkJ4/ryuMsdLla4=; b=ySJdHiISxN8Uwxtj7FCRcWtMAB
	LoD8Q7/eDTztHazyr2237tYiu2lbOm1nNHlKcqSzFTpeVrWk/CfTHdrVp+LOm3MpH5gMA1dKakxEr
	gmYtuwOFlZmrp3pUwlhCd5C9uNqqEV2FO781thb7Qg07p2kqZ/3nSiX8LFikNlHmNyOM8R7Uuacbo
	5lF0hkuHcMGR46bgNlZDoTPuQLIFsinNUcgQrVZxseI7c65w1v8+9m0XtzPn8KYSQTqy3Iv0nr/uF
	leY7m6edh4STs7vN7vlt/QhpdZB2PMO8Krl/tFs1wK+N33Z3EOJ0Dri+hzYCpOmbeQ4PMdJ68LDOO
	CZuc3vgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5bE-00000006qDo-0io3;
	Thu, 20 Nov 2025 14:25:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5b9-00000006qDI-48BI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 14:25:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3ABB8339;
	Thu, 20 Nov 2025 06:25:15 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FF323F740;
	Thu, 20 Nov 2025 06:25:22 -0800 (PST)
Date: Thu, 20 Nov 2025 14:25:20 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 03/13] coresight: Refactor
 etm4_config_timestamp_event()
Message-ID: <20251120142520.GB724103@e132581.arm.com>
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
 <20251118-james-cs-syncfreq-v5-3-82efd7b1a751@linaro.org>
 <CAJ9a7VhYaU=kAtvZtSnkj-9OicCWwqYQBX4Q3zDtCay-8=Y7Cg@mail.gmail.com>
 <4090a47c-2208-486b-bd96-47518d7aa90c@linaro.org>
 <20251120141821.GA724103@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120141821.GA724103@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_062524_059259_F948FB1F 
X-CRM114-Status: UNSURE (   7.34  )
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

On Thu, Nov 20, 2025 at 02:18:21PM +0000, Coresight ML wrote:

[...]

> Maybe define a general macro but with extra checking:
> 
>   #define TRCCNTCTLRn_RLDEVENT_MASK  GENMASK(15, 8)
> 
>   #define ETM4_RS_SEL_EVENT(paired, sel) ({  \
>       if (paired)                            \
>           assert(!(sel & ~GENMASK(3, 0)));   \
>       else                                   \
>           assert(!(sel & ~GENMASK(4, 0)));   \
>       FIELD_PREP(TRCCNTCTLRn_RLDEVENT_MASK,  \
>                  ((paird << 7) | sel));      \
>   })

It'd be better to use BUILD_BUG_ON() instead of assert().

