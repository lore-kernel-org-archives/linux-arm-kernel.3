Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D17AC83038
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 17:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MvrKqU9KXRVMqW4wYVRfFpUOXGEDg+T9aX7yo71XcrY=; b=BBYengjU8xDAaL688wQ+nUnlQz
	in6AlkVVtBnXTQy2W267/OITinTX7F6G2KjI92MQzFk0giVq/Gigyt+E2tdHwBm1tNUsCSDK90P9q
	MSLEqPhj8+cL9f7juV1atWybiox0h0FZVkDbpgpOVm5FJSE6m3aj65Y2RvwvfT/YKwX3OY4amMHiN
	/IAPPFvaB1iAYesXLmXplXBn51hKhh1FQ36QhFgNvwKVLc3BadYk/c0fMLa7ThhfZlox76geEq2/D
	RCxA6f0yd/t0ctKqWrTeGutHMzW16q411CZCVJVhympacg91bY3HORSSwFVNxZDXnnyv6XGol252u
	7TSboGQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX1ZM-00000009AS3-1NJR;
	Wed, 02 Jul 2025 17:48:28 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX13o-000000096a1-2kb4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 17:15:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F1EB7A4C759;
	Wed,  2 Jul 2025 17:15:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 130EFC4CEE7;
	Wed,  2 Jul 2025 17:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751476551;
	bh=MvrKqU9KXRVMqW4wYVRfFpUOXGEDg+T9aX7yo71XcrY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MZ9RcvdQOreMvSgDQRdVOEc/3VFScLsnmhwqM/sa66bIpvbg3w1OV8quHFH0LNOoB
	 8FB/kdxkY6aDGF+O/uTnDyUWZVrlDyfq/qNztceUP0tY6uIYbOwi0fSIuszRSCrdzG
	 QDzzB0LlXvYk1jazJvoITjrYUJfKwNCJSk97GM3O2TstHMJZio4EWnJO849WI7F9RO
	 ULDfzU7qYCzxNDwwsd/zKqS0TNDWvyGZ+hemOL7S+sw2LuEnJRW00f4KV/rwvU9sJd
	 aw51UzEocEFbb8N3yvhs28mzsG+HFmuKRJwCtE+QjYr62LYG138yA36eL+aA/KYhZW
	 Z5PLvkvXx/Yag==
Date: Wed, 2 Jul 2025 19:15:47 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: =?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clement.legoffic@foss.st.com>
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, M'boumba Cedric Madianga <cedric.madianga@gmail.com>, 
	Wolfram Sang <wsa@kernel.org>, Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, 
	linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v3 3/3] i2c: stm32f7: support i2c_*_dma_safe_msg_buf APIs
Message-ID: <4lqsyuabfwnclt2pbxmgqz5zpd6zm5y6q5djiwopuq5eelz7ui@fgep3x24ur3e>
References: <20250630-i2c-upstream-v3-0-7a23ab26683a@foss.st.com>
 <20250630-i2c-upstream-v3-3-7a23ab26683a@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250630-i2c-upstream-v3-3-7a23ab26683a@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_101552_757748_E45262CE 
X-CRM114-Status: UNSURE (   8.40  )
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

Hi Clement,

On Mon, Jun 30, 2025 at 02:55:15PM +0200, Clément Le Goffic wrote:
> Use the i2c-core-base APIs to allocate a DMA safe buffer when needed.

same here, I don't understand anything... you could have written
"do some coding" and it would have been the same :-)

Thanks,
Andi

