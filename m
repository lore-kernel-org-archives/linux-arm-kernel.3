Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24145C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 23:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nKnjB9QFtA5GWFQs3FvapprWdMQNbXukoRejQDs+ZtA=; b=ZXTUjHUCdTSzH/89oVA+GPpZIE
	fjCcufIk0TyllF2rgiSVzALKh4+Kj8nmym+9N7tkfKbb/ja+NwD9l+uKRR25i8Jgh8DqyVj20lYWw
	nx+2fA5bbQoeIwX7bmILLuNXtks1O0dIfUQ9fGjanz743LxNnNCs/zaRQDIc6vPcBIkxmwl4NMS1S
	CntiwCDwXqpp32QV0IIdLiu1ct2j8GpSSGS6hKdemDBpy7qCoxz1WBt48IuffNvhl5mPtV8EAfevT
	/RYWQv0zvqlXlz2bvhYJTkmQJQYccXRQF8c/Ed9SiP1nl1+aopw3YFP3Hb4uauZm6KLUBmE9D+k5Y
	r+fkHUUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb75F-0000000DXmR-3xrw;
	Thu, 23 Jan 2025 23:58:01 +0000
Received: from out-188.mta0.migadu.com ([2001:41d0:1004:224b::bc])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb73x-0000000DXg6-3tLB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 23:56:43 +0000
Message-ID: <11b81c8b-5ef1-470c-836a-a436ecadf0f4@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737676594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nKnjB9QFtA5GWFQs3FvapprWdMQNbXukoRejQDs+ZtA=;
	b=BMuauh09Hah9j32wLPh8Uc9gIYcPh7uft6ysJVcYGJQE1XqW7FREugCabFu3MVWHK8Jipy
	HROYK1a2b0T4NyZ/Cd1ECDmUPICsf1zpRCmHYfqyqUh7OZoSCTheJWqIonXfv0i5IVhh+R
	sDqWwoatdZG2QNpOmyPa1TZW10vCAM4=
Date: Thu, 23 Jan 2025 18:56:29 -0500
MIME-Version: 1.0
Subject: Re: [PATCH next] drm: zynqmp_dp: Unlock on error in
 zynqmp_dp_bridge_atomic_enable()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <b4042bd9-c943-4738-a2e1-8647259137c6@stanley.mountain>
 <20241112052754.GB21062@pendragon.ideasonboard.com>
 <37be000a-3ef8-4df4-aefa-b4d73487ad27@linux.dev>
 <20241112164305.GA24067@pendragon.ideasonboard.com>
 <5c2c6883-d81a-4869-9f32-48d23c0728ea@linux.dev>
Content-Language: en-US
In-Reply-To: <5c2c6883-d81a-4869-9f32-48d23c0728ea@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_155642_254948_2C5B7FE1 
X-CRM114-Status: GOOD (  13.79  )
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

On 11/12/24 12:22, Sean Anderson wrote:
> On 11/12/24 11:43, Laurent Pinchart wrote:
>> On Tue, Nov 12, 2024 at 09:41:58AM -0500, Sean Anderson wrote:
>>> On 11/12/24 00:27, Laurent Pinchart wrote:
>>> > Hi Dan,
>>> > 
>>> > Thank you for the patch.
>>> > 
>>> > On Mon, Nov 11, 2024 at 12:06:10PM +0300, Dan Carpenter wrote:
>>> >> We added some locking to this function, but accidentally forgot to unlock
>>> >> if zynqmp_dp_mode_configure() failed.  Use a guard lock to fix it.
>>> >> 
>>> >> Fixes: a7d5eeaa57d7 ("drm: zynqmp_dp: Add locking")
>>> >> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>>> > 
>>> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> > 
>>> > Sean, how about replacing all the mutex_lock()/mutex_unlock() calls
>>> > you've added in a7d5eeaa57d7 with guards ?
>>> 
>>> I have no objection to that.
>> 
>> Would you send a patch ? Otherwise I can do it.
>> 
> 
> I can send a patch, but it will not be for a week or two.
> 
> --Sean

Just following up on this; will the above patched be merged? I would
prefer to keep the bugfix and the conversion separate.

--Sean

