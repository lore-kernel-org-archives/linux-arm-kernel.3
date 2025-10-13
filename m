Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C28C7CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 01:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cvq/ACMwX3OnpD71UH1+PwfyZlhDdznUFw1/2vndRWE=; b=RiybChygStVavQz7t5G/A40suc
	CpJBrHuTWXXRcy1Snb168maunh+RInGWJu288Wo3dZ2Z5Qxc6PVX5x9ChGEzwEBgesaGEneyOOMfS
	Op7XMfxCPlFQ/hLMA8t1m6dZ/wIGXOmSqeRABoHEdA9J9+O61QAtkHELakn1kQsOPTF1OqyiL7KFy
	rvUDyOVYUX2+xSJC9Tct8DRwTJEOVfpigSf4v+/NjTTYNfYSECG/5V1YoqKOw9mY6flkOyrZcyk+F
	07Q+nvkk1nzm9pwQBgr1RX408/vT44IZ5LbA6X5+WB22pa0JnLFg+hI3xlG1lfKnyq0Kvu+8s4DX8
	pR0QCGwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v879x-0000000C2cl-1Lba;
	Mon, 13 Oct 2025 01:15:33 +0000
Received: from mail-m49205.qiye.163.com ([45.254.49.205])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v879t-0000000C2bb-3jhj;
	Mon, 13 Oct 2025 01:15:31 +0000
Received: from [127.0.0.1] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 25a39ad8a;
	Mon, 13 Oct 2025 09:15:19 +0800 (GMT+08:00)
Message-ID: <83281501-8957-4ca1-8e0e-0b72ddd74b43@rock-chips.com>
Date: Mon, 13 Oct 2025 09:15:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/8] phy: rockchip: phy-rockchip-typec: Add
 typec_mux/typec_switch support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Chaoyi Chen <kernel@airkyi.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20251011033233.97-1-kernel@airkyi.com>
 <20251011033233.97-4-kernel@airkyi.com>
 <xbblw4jfte7re2pyroanvzqv4ddwhxbgcui5ubpnw7rwuo4s4d@gkph7jqzf33o>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <xbblw4jfte7re2pyroanvzqv4ddwhxbgcui5ubpnw7rwuo4s4d@gkph7jqzf33o>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a99db22dcf303abkunm0713f548f8facb
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU0dQ1YaGklOTEIaHR4YH0xWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Bxg8VLDz1S1QU32Fy2HDcfvislNrJJ0uqNay+meHZQFma6Tad3Sto7NFGOCh3TqmeUBj54gnStcWhE8/KozzYBg4GvmPcV4rMFPnEgs/h30WSTTKCT8WXZx4iN3GJGmO7W3qhPHRjXv3jiF2QOrzKOBxLX8bcko/TH9ZA5Yh5p8=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=cvq/ACMwX3OnpD71UH1+PwfyZlhDdznUFw1/2vndRWE=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_181530_476638_94380E3D 
X-CRM114-Status: GOOD (  21.13  )
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

On 10/12/2025 12:57 AM, Dmitry Baryshkov wrote:

> On Sat, Oct 11, 2025 at 11:32:28AM +0800, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> This patch add support for Type-C Port Controller Manager. Each PHY
>> will register typec_mux and typec_switch when external Type-C
>> controller is present. Type-C events are handled by TCPM without
>> extcon.
>>
>> The extcon device should still be supported.
>>
>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>> ---
>>
>> (no changes since v5)
>>
>> Changes in v4:
>> - Remove notify DP HPD state by USB/DP PHY.
>>
>> (no changes since v3)
>>
>> Changes in v2:
>> - Fix compile error when CONFIG_TYPEC is not enabled.
>> - Notify DP HPD state by USB/DP PHY.
>>
>>   drivers/phy/rockchip/phy-rockchip-typec.c | 365 +++++++++++++++++++++-
>>   1 file changed, 349 insertions(+), 16 deletions(-)
>>
>> @@ -850,6 +998,72 @@ static int tcphy_get_mode(struct rockchip_typec_phy *tcphy)
>>   	return mode;
>>   }
>>   
>> +#if IS_ENABLED(CONFIG_TYPEC)
>> +static int tcphy_orien_sw_set(struct typec_switch_dev *sw,
>> +			      enum typec_orientation orien)
>> +{
>> +	struct rockchip_typec_phy *tcphy = typec_switch_get_drvdata(sw);
>> +
>> +	mutex_lock(&tcphy->lock);
>> +
>> +	if (orien == TYPEC_ORIENTATION_NONE) {
>> +		tcphy->new_mode = MODE_DISCONNECT;
>> +		goto unlock_ret;
>> +	}
>> +
>> +	tcphy->flip = (orien == TYPEC_ORIENTATION_REVERSE) ? true : false;
>> +	tcphy->new_mode = MODE_DFP_USB;
> Carrying over unanswered(!) comment from the previous series:
>
> I don't think it is correct. Orientation defines only the cable (plug)
> orientation. You should be getting the mux events for the mode
> selection.

Sorry for that, I forgot to modify this part. Will fix in v6.


>
>> +
>> +unlock_ret:
>> +	mutex_unlock(&tcphy->lock);
>> +	return 0;
>> +}
>> +
>> +static void udphy_orien_switch_unregister(void *data)
>> +{
>> +	struct rockchip_typec_phy *tcphy = data;
>> +
>> +	typec_switch_unregister(tcphy->sw);
>> +}
>> +
>> @@ -1037,6 +1251,89 @@ static const struct phy_ops rockchip_dp_phy_ops = {
>>   	.owner		= THIS_MODULE,
>>   };
>>   
>> +#if IS_ENABLED(CONFIG_TYPEC)
>> +static int tcphy_typec_mux_set(struct typec_mux_dev *mux, struct typec_mux_state *state)
>> +{
>> +	struct rockchip_typec_phy *tcphy = typec_mux_get_drvdata(mux);
>> +	struct typec_displayport_data *data;
>> +	int hpd = 0;
>> +
>> +	mutex_lock(&tcphy->lock);
>> +
>> +	switch (state->mode) {
>> +	case TYPEC_STATE_SAFE:
>> +		fallthrough;
>> +	case TYPEC_STATE_USB:
>> +		tcphy->new_mode = MODE_DFP_USB;
>> +		phy_set_bus_width(tcphy->phys[TYPEC_PHY_DP], 0);
>> +		break;
>> +	case TYPEC_DP_STATE_C:
>> +	case TYPEC_DP_STATE_E:
> You need to check that altmode->svid is DP before checking for these
> modes.

Okay, will fix in v6.


>
>> +		tcphy->new_mode = MODE_DFP_DP;
>> +		data = state->data;
>> +		hpd = !!(data->status & DP_STATUS_HPD_STATE);
>> +		phy_set_bus_width(tcphy->phys[TYPEC_PHY_DP], hpd ? 4 : 0);
>> +		break;
>> +	case TYPEC_DP_STATE_D:
>> +		tcphy->new_mode = MODE_DFP_DP | MODE_DFP_USB;
>> +		data = state->data;
>> +		hpd = !!(data->status & DP_STATUS_HPD_STATE);
>> +		phy_set_bus_width(tcphy->phys[TYPEC_PHY_DP], hpd ? 2 : 0);
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +
>> +	mutex_unlock(&tcphy->lock);
>> +
>> +	return 0;
>> +}
>> +

-- 
Best,
Chaoyi


