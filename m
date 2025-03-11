Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703D4C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 05:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UT3d5jX5SsEYL9z/6wl/7nx20S3nBswGyz98EOzckuA=; b=BXc+pugZbVsO2F/7b1L7IEseic
	s4naJTVJo8y2eAnA3mGLPZBgOQPO06x2vZKPlR/R56lEjO9Q7JrQt05KFSEC3a6JECIYZlopdqiil
	xFPr9M1Ed/yozhSthryD4NwQopJOZMFk3fEsl3wrJ+7Vi2zMrvY/pMnRsRWoyqsnSQ7MoR83XJhq6
	CdeZ3Tek37u+g5fKwhw4UPZ+t0v+pdM9ct4L0iRJk4QZZgtasxkeqPCKPi89+2Imy1sm27o6BqDIM
	kZw9pv3BLfiROhjBPjR3k3xaBoWiS50jlMlb+coKIjXaYG6OHeezpudT53rA48Tg1E6YbeD4TTU/l
	z+oxFFUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trsH5-00000004fD4-0kUM;
	Tue, 11 Mar 2025 05:35:31 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trsFR-00000004f7E-0eMl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 05:33:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741671229; x=1773207229;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=DLYuGmG8iFWf5LcT050MwmMyWf6njd/yrSqW870b0NQ=;
  b=OPNJQ9WO6owtRiG51u+pD9WpnMUnZXJcfsF0Hk+kBgMbWLk+TX6xHMbJ
   OHZwngz3pK/euluvYvI2LYYlDfBuFsDg20l9BTlkrQc7agvabwmp1jnJW
   K5evkPWdt6RQRkXCQ/y0FFDRTUHZ7qN7Wyc1bQn80brjeAUPwGX0dHzxm
   Iq0SvZgtvTpKvfIrGwoBD3Ji9owwXECjPC9lRJ7WopeZN4MY8ugcnbkBR
   I1W0E4gjLhdl9eE9RYJpqs4h3G06mTBbqrGivQF90Pjd+rSPGuOrc6U/4
   apk5PIuTFsK9wx8ru41YAx0Sh7+OroLMGufMotJwHLDOJFBgmhl5bu2Yx
   g==;
X-CSE-ConnectionGUID: yiypxgk6QMKeEYfsg0c9ng==
X-CSE-MsgGUID: fgfpdccwQlGUdPMC7iu38Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42602736"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="42602736"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 22:33:48 -0700
X-CSE-ConnectionGUID: CWULG/1UQUuYYhAiVQ7Zew==
X-CSE-MsgGUID: nO6dDApWTfWOLHIaR7SBuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="143395086"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.21.123]) ([10.247.21.123])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 22:33:44 -0700
Message-ID: <3bc2cc11-3a87-479e-a0e0-c593e3214540@linux.intel.com>
Date: Tue, 11 Mar 2025 13:33:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v1 1/1] stmmac: intel: Fix warning message for
 return value in intel_tsn_lane_is_available()
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Dan Carpenter <dan.carpenter@linaro.org>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250310050835.808870-1-yong.liang.choong@linux.intel.com>
 <20250310152014.1d593255@kmaincent-XPS-13-7390>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <20250310152014.1d593255@kmaincent-XPS-13-7390>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_223349_234817_11F1FEE0 
X-CRM114-Status: GOOD (  15.58  )
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



On 10/3/2025 10:20 pm, Kory Maincent wrote:
> On Mon, 10 Mar 2025 13:08:35 +0800
> Choong Yong Liang <yong.liang.choong@linux.intel.com> wrote:
> 
>> Fix the warning "warn: missing error code? 'ret'" in the
>> intel_tsn_lane_is_available() function.
>>
>> The function now returns 0 to indicate that a TSN lane was found and
>> returns -EINVAL when it is not found.
>>
>> Fixes: a42f6b3f1cc1 ("net: stmmac: configure SerDes according to the
>> interface mode")
>> Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
> 
> This patch is a fix it should go net instead net-next.
> Could you resend the patch with net prefix?
> 
> Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
> 
> Thank you!

Hi Kory,

Thank you for your feedback. I understand that the patch is a fix. However, 
since the code is not yet in the 'net' tree, we are unable to apply the fix 
there.

I'm not sure if there is another way to handle this fix other than sending 
it to the 'net-next' tree. I would appreciate any guidance you might have 
on this matter.

