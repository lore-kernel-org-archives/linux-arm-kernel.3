Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66505CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 08:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k9PZlmFs4+G6V09YuUs38/TEsI+fOADgB825HrzHznU=; b=aNsKzR0GyNNh6+fzTN4pceNf7i
	fa5En43tTkyFwpfmRHtFoMexPSqzO5LgJsjZoIPMZ9fg19uCLjj2rZC/HUf8Tt7tCUb/sjptZAauZ
	9GPf7m9Kgs1MUPPAoIS4A4vdVTIFtqWna7qn5y+QaV88ta7rAf/HZRI8h0h2zmlJqGFMKm/LEdjiF
	+IfHaXxrjrwhxeUC9tZEQBjB/E0aMWDti+4d/0B0S2od9wN4BFlvdWsSLMBm0X6kfpfSfgq54hHoE
	3ao4qBuNQKakD3gF3bQWgFdVOMXWVXLMIFoZ5sUrPvhENe8U13T6HU0zjeivJlxHkD9KLyq5kS0Bs
	76eNZCJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCCuy-00000008du3-1S1X;
	Fri, 24 Oct 2025 08:13:00 +0000
Received: from mail-m21466.qiye.163.com ([117.135.214.66])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCCuv-00000008dsr-0lPN;
	Fri, 24 Oct 2025 08:12:58 +0000
Received: from [172.16.12.149] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 270f1f398;
	Fri, 24 Oct 2025 16:12:48 +0800 (GMT+08:00)
Message-ID: <9ec2189e-ec36-4cd8-9713-beb490b8297c@rock-chips.com>
Date: Fri, 24 Oct 2025 16:12:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/9] drm/bridge: Implement generic USB Type-C DP HPD
 bridge
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>, Dragan Simic <dsimic@manjaro.org>,
 Johan Jonker <jbx6244@gmail.com>, Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20251023033009.90-1-kernel@airkyi.com>
 <20251023033009.90-3-kernel@airkyi.com> <aPnrKFWTvpuRTyhI@kuha.fi.intel.com>
 <14b8ac71-489b-4192-92d6-5f228ff3881d@rock-chips.com>
 <aPoZhBdc1M6Qgfae@kuha.fi.intel.com>
 <6f769567-b383-4c79-b441-3dd84f21cdae@rock-chips.com>
 <aPsse5qVL84XOj8w@kuha.fi.intel.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <aPsse5qVL84XOj8w@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a1547081303abkunmae71b56b2f4984
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQh9PTFYYHU8YGkNDQx0ZTx9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEtNQk
	tVSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=cbh7z5oMnHR/DLqyOIDZk4K7gXmeu0Z/ewCxVZLD2lfh51kbnP5gwdZNZ7a3inVN4NoC/E/hL4XmvOdj5FQ0/XmmJ78CkfSevEhzvOTjQ9VpmomjoQ1rpjyzol1iXhudUcEI++95744VHFl5SRJlcN0jA2NbRp7MwZ9xcoa3t1g=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=k9PZlmFs4+G6V09YuUs38/TEsI+fOADgB825HrzHznU=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_011257_475472_0071DDE6 
X-CRM114-Status: UNSURE (   7.94  )
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

On 10/24/2025 3:36 PM, Heikki Krogerus wrote:

>> Another thing is that CONFIG_DRM_AUX_HPD_BRIDGE originally needed to be
>> selected by other modules. With this change, we also need to expose it in
>> Kconfig.
> Sorry, I don't understand the problem here? What do you need to expose
> in Kconfig?

config DRM_AUX_HPD_BRIDGE
     tristate
     depends on DRM_BRIDGE && OF
     select AUXILIARY_BUS
     help
       Simple bridge that terminates the bridge chain and provides HPD
       support.

The tristate here is empty, so now it can only be selected by some TypeC controller drivers. I think it's not a big deal, just expose this item.


>
> thanks,
>
-- 
Best,
Chaoyi


