Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6369606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 11:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Hz+/tNLr;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=PcvDx0Dq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0fP5WnkQ/jEXyj1gQYTYNTXqYm8pVqxjqPzKb7O0M40=; b=Hz+/tNLrL/S0vw7AjhzjkztGfk
	KrByMXOAbWI9Buedvz94wwaz2imcb/XjuiGR2p9pjLC/aM0OBA4IC0pVsLkhVmYrYaEu2icRc/jCo
	gNDz/m0yd9ZG8H9Vvnu56/STaK+1XbHUpqP0oAbzHiAz7az1fkkYWroDRZxSYd4vVLZ2uQq4dq8vK
	j5ftsciGs82Kv9SQPk/QiDmjnePeaeVL3yP1b453bEVRcfV96sUqKC3KRLMmdgWk67BiFg/VF1+Wy
	2j0i4qrN9UIlDgYNn29f08SGi5YMGAiEBd16/ZiqShwLO92lp3cDLc5ZN8Crl7YOUF4a2OKvtSKVW
	zIBaLSLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ8FH-00000009ZnK-2I0D;
	Tue, 20 Oct 2026 11:43:07 +0000
Received: from mail-m127209.xmail.ntesmail.com ([115.236.127.209])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ8FD-00000009ZlB-2gMD;
	Tue, 20 Oct 2026 11:43:06 +0000
Received: from [172.16.12.74] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 51b70239a;
	Tue, 20 Oct 2026 19:42:46 +0800 (GMT+08:00)
Message-ID: <0a3dc505-43d2-471b-bd7c-222860544081@rock-chips.com>
Date: Tue, 20 Oct 2026 19:42:45 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/14] drm/bridge: analogix_dp: Use bridge->next_bridge
 instead of plat_data field
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20261019085836.3065008-12-damon.ding@rock-chips.com>
 <202610201309.w3JSXlP5-lkp@intel.com> <3789853.R56niFO833@diego>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <3789853.R56niFO833@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1591f009e03a8kunmb99823d738c545
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUhXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZShkaVktIQh9IGUsaSRgZTVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0JMVUhJTE
	1CVU9VSEtLSlkG
DKIM-Signature: a=rsa-sha256;
	b=PcvDx0DqHkOKPqjTQ+WfmUYCXD9mwvhFrc7mSaBffIry2c4fUYbdXMX59bNKWZBcDiTaCQ/YNMiQcmhD7Zsd1KQbLmtLq7Ltd9XK3HumvYifhWq4A4Ftt4y/jY42N+ztDwlpKKLycWUI8mg322eGJ0P3DLzIVv1imnkclT3bR5E=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=0fP5WnkQ/jEXyj1gQYTYNTXqYm8pVqxjqPzKb7O0M40=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_044304_227901_2BE7D652 
X-CRM114-Status: GOOD (  12.33  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Heiko,

On 10/20/2026 6:38 PM, Heiko Stübner wrote:
> Am Dienstag, 20. Oktober 2026, 07:36:21 Mitteleuropäische Sommerzeit schrieb kernel test robot:
>> Hi Damon,
>>
>> kernel test robot noticed the following build errors:
>>
>> [auto build test ERROR on drm-misc/drm-misc-next]
>> [also build test ERROR on drm/drm-next next-20261019]
>> [cannot apply to daeinki-drm-exynos/exynos-drm-next linus/master v7.3]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>
>> url:    https://github.com/intel-lab-lkp/linux/commits/Damon-Ding/drm-bridge-analogix_dp-Return-bitmask-from-analogix_dp_get_irq_type/20261019-165823
>> base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
>> patch link:    https://lore.kernel.org/r/20261019085836.3065008-12-damon.ding%40rock-chips.com
>> patch subject: [PATCH v4 11/14] drm/bridge: analogix_dp: Use bridge->next_bridge instead of plat_data field
>> config: nios2-randconfig-1000-20261020 (https://download.01.org/0day-ci/archive/20261020/202610201309.w3JSXlP5-lkp@intel.com/config)
>> compiler: nios2-linux-gcc (GCC) 11.5.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261020/202610201309.w3JSXlP5-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202610201309.w3JSXlP5-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>     nios2-linux-ld: drivers/gpu/drm/bridge/analogix/analogix_dp_core.o: in function `analogix_dp_aux_done_probing':
>>>> drivers/gpu/drm/bridge/analogix/analogix_dp_core.c:1669:(.text+0xb80): undefined reference to `devm_drm_of_display_mode_bridge'
>>>> drivers/gpu/drm/bridge/analogix/analogix_dp_core.c:1669:(.text+0xb80): relocation truncated to fit: R_NIOS2_CALL26 against `devm_drm_of_display_mode_bridge'
> 
> I guess the Rockchip kconfig for the Analogix-DP also needs a
> 
> 	select DRM_OF_DISPLAY_MODE_BRIDGE
> 
> similar to exynos and imx.
> 

Will fix in v5. Also refine patches 9-13 as suggested by sashiko.

Best regards,
Damon


