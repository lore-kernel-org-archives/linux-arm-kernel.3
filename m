Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7584EC88E44
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 03:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CPgZyTG1nb2O92WPWBJ59rytiCMrF1zajhRryF34s0c=; b=R1QV5p2TB71ozObFf32Ochea5K
	qzBW5aP/8F/22eK5yAbUXBo6bZMEDCfWL4ICSegrKVrcrRrL5ySoc5kWUKABF6Z1rX3pCfz+R59t4
	is+xSjTf7CgS+Ih4N5IbkL/P7jZVRyky98CCDieqfLo2aXnLvv0fxN+eo3rxMyR8eVCv1xk/8Cxqn
	nQK33YmA7l5w56tDpYV9Ojpl+0YHWXJIowjNITh4/uzYkBKe5rO0aNmEMvXoVCWauzmCSuz17c9RR
	ihAeOQDw3P9UgIYaR7N+MORfizku4ggdINHOGV23yhuxIhTTsQqcgqSseNMjQu/f+ojHHSMj0e7oZ
	NvUmBf/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkDCp-0000000Bpxb-3x45;
	Mon, 26 Jan 2026 03:23:59 +0000
Received: from mail-m49208.qiye.163.com ([45.254.49.208])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkDCn-0000000Bpx1-2NCu;
	Mon, 26 Jan 2026 03:23:58 +0000
Received: from [172.16.12.51] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 31ed77841;
	Mon, 26 Jan 2026 11:23:53 +0800 (GMT+08:00)
Message-ID: <9eb9948d-a70e-4a7e-a918-6aa4f2cb55af@rock-chips.com>
Date: Mon, 26 Jan 2026 11:23:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] Rockchip DRM use-after-free & null-ptr-deref fixes
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260122-drm-rk-fixes-v1-0-3942f185750e@collabora.com>
 <8e770288-f29b-4e72-b5a6-e3cfd77b87fb@rock-chips.com>
 <8bdb6ea8-9434-4fa6-87ad-4c2f2697a3e5@collabora.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <8bdb6ea8-9434-4fa6-87ad-4c2f2697a3e5@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9bf85450b603abkunme9a84376614288
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGk9OHlYfSB4eHUpNS0pJGh1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=UM+MTPz9yNAZYB7c/Bi4dQcZawrfWa+YLlHPZmONf3Q6uvuCjkMp12SXUuMKbA/1ERs6TJlMOraoE8+5Kc7E2cDbSaUrGrcg5Y31NbBxRDY40e2roQ70FtNJRKzpGqKpqUXB/bJJRDmDsk/wPizOz8prl4m/5KCNTh8lRg2Wadg=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=CPgZyTG1nb2O92WPWBJ59rytiCMrF1zajhRryF34s0c=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_192357_774728_9E0A39E8 
X-CRM114-Status: UNSURE (   7.16  )
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

Hi Cristian, 

On 1/24/2026 7:18 AM, Cristian Ciocaltea wrote:
> Do you have any specific usecase in mind?
> 
> The tests performed so far were mostly focused on reloading the rockchipdrm
> module, which is how I actually noticed those issues.

Ah, if that's the case, then there's no problem. Thank you!

-- 
Best, 
Chaoyi

