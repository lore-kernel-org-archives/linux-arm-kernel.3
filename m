Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A90DE668A0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 22:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bVoqGHtP3t/cZDAL2ohWgfi9ARjsSZC2AG6/07u9X6s=; b=U8h2AOvs1P5XV0DeDpdBJtY76h
	qxV5ha7sJX8fnBp0/UyJOKHPpER8riytliqHmtTSTJHoHMf1Y5b+n9M8gNoBIfqJf1Q00446Tj10H
	nW6GXBduJXllwcZFKEPC5LHNkQ/AmerWKpqwqcmVkkNzSj37k5BimRNn8pQhoAL7CNKEm3YerY4VA
	jdR35Rhn3fhu+jRjDhSpnSGzwhizR3yZTq/DzoX6GN2+w0pVRjxuS4eYKgoy0VEM6y27fw59LSRLX
	cG9PlHxQeb4Mwwps4lSF0Md7kGcRiyfM4TNBWJLupL4ZCZuly/PffPHIrlFLg7Vp0Dr0YjN417V16
	2k5DxNdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWjAp-0000000B3SV-1I87;
	Fri, 19 Dec 2025 22:42:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWjAn-0000000B3Rr-2wsI;
	Fri, 19 Dec 2025 22:42:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766184126;
	bh=dOBesZiZkvcbsrlIE1HpTeKXvjg0FO6Vfqc3uFf9vyw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jpkHXg32VP1Om8nTwThFfO8jZpKksYrc/8u4nki4rh0tRzgmaLNFyoc4P/KgmwyEs
	 Z83vsMSmf+VzwznJuB+/N3W0r1bqKev4P5MdzBU55+5NCMOgLUDStbhscExkPzjnSj
	 fmp7Z80dCFe9I7xlwWRoOaklUvaiZVMc/x8x0yB1nt9cVROglVympfizNzjyZLzXZc
	 mH946p3K2sd1g3R/GjQx5PZSOHlGlGLcjQYa5sz7ZN2a8zMR07SWOFmCINsB3OXU0A
	 FJbABuZ22kbOGnvfTxQh8u4beZyCIGoLn/wfaKSNhYzm7tUdFWcBlQmHx766czhKGe
	 yKscYz7payrKw==
Received: from [192.168.1.90] (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9D1E017E0181;
	Fri, 19 Dec 2025 23:42:05 +0100 (CET)
Message-ID: <012994e7-0e69-4885-8050-a404b7ae7608@collabora.com>
Date: Sat, 20 Dec 2025 00:42:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] drm/rockchip: vop2: Support setting custom
 background color
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>
Cc: Robert Mader <robert.mader@collabora.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20251118-rk3588-bgcolor-v3-0-a2cc909428ea@collabora.com>
 <20251118-rk3588-bgcolor-v3-4-a2cc909428ea@collabora.com>
 <0ed71b8d-5a2e-4213-bd2f-7ba317d1e4cb@rock-chips.com>
 <4a6443b8-d440-4921-8a43-7c20e4e265e7@collabora.com>
 <b8819463-cc61-432f-b451-db90e3b43884@rock-chips.com>
 <058027df-1b1b-4c46-b8e1-ec53fc809e82@collabora.com>
 <292ed476-2b5a-4b61-97e5-3b8d8a24c324@rock-chips.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <292ed476-2b5a-4b61-97e5-3b8d8a24c324@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_144209_902069_30981316 
X-CRM114-Status: GOOD (  14.96  )
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

On 11/30/25 5:01 AM, Chaoyi Chen wrote:
> On 11/29/2025 5:50 PM, Cristian Ciocaltea wrote:
>> Hi Chaoyi,
>>
>> On 11/29/25 5:49 AM, Chaoyi Chen wrote:
>>> Hello Cristian, 
>>>
>>> On 11/28/2025 5:44 PM, Cristian Ciocaltea wrote:
>>>> The precision was something I initially looked into for CRC verification, in the
>>>> context of the related IGT test.  But since I've added the VKMS support, I think
>>>> we should not worry about that anymore. 
>>>>
>>>> Moreover, as already pointed out in [1], only RK3576 supports CRC generation at
>>>> display controller level, and that is not particularly useful because it doesn't
>>>
>>> I believe you can get the CRTC CRC on the RK3576, even when only the 
>>> background is visible and all plane is disabled. Feel free to let me
>>> know if you run into any issues :)
>>
>> Yes, CRTC CRC works on RK3576 for the planes, but not for the background, i.e.
>> the CRC is not updated when setting a different background color.  Unless
>> there's a way to change this default behavior, which I'm not aware of. 
>>
>> My current understanding is that the background color is applied at a later
>> stage in the display pipeline, *after* blending the planes and computing CRC.
>>
> 
> Which CRTC are you using? If you're using VP0, you might run into this
> problem. Please try VP1 instead.

Yeah, that's VP0 as there's only one HDMI output port on my Radxa ROCK 4D board.
I'll check if it's possible to switch to VP1.

