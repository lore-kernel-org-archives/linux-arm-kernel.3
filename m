Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CCDDE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 12:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S8GOOkYsjMZ3l9Rj+qZs5MJuk6fGvY0FCo+nX6TUF/4=; b=xlX2zpnchPqpBjSXjbRrN+Qp1v
	QC5XYKL3zDiF1bToWE7DeCq3Ic9BtXShZwQUuptGJ1vuYZQZzP86XvH/O/pXNyNLUlO7znYp1Duza
	6IfeA/gMEfDkrn7iUJjNkKcp1KAdMl1fkLlCb9oBL5KIUkikVmun63mPNH5F+wdr8STGK2IYJbJkm
	uJiZA3LFISQYqxZJHzmTvvgYJ67Fe2lkJthsB76qUUiFaYIQKBCljr31aN7gSm1PHV4gBnp3uI1Iz
	bKRiXj7ZWUvvW8p0diW3oLSOOvS/RqypJeE9rFV3BnxSnqwHDHZO9pkP0ffblfIRfjvxAjf6mihvG
	SARRwi+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8Fx-00000004fdk-3riu;
	Tue, 07 Jan 2025 12:00:21 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV82Q-00000004cbP-1U1c;
	Tue, 07 Jan 2025 11:46:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736250380;
	bh=df0LOEnngCjfFj2PvwptpBWdY3nEK+O/wLcKL6OCdMQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HtgkNi01/LC2j6dqsG6SUSw9HHQbXsj7H/SdfXh0AocYFpR8qrA/CxTlluiY9Kec0
	 zEgIPvTMfcZOdAWf9o2x1VYypg/Dx9sUDiifzz524qqVYzsgHW2GMuJ3wCHwksN2zo
	 QBn6/BM/TKk2f7PRM8r3E8UkHtt1zkLajqNOiZrYHnFRcaSgIzObHNlBloafdeROly
	 SwwrqtW5nIVH2zyZJMhDMhO5xViOJhqGfkMHj5/bkSwCCM2huPfst5n+EIUbxWmugs
	 mk46A4oVQaQwJHVN/KKBmJmHqbIa6LCFY6I8DD+C2dpT92bwLgka5Cz9xHjAnSsmiW
	 k1Fa6eCcSp9IA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BDB2A17E1562;
	Tue,  7 Jan 2025 12:46:19 +0100 (CET)
Message-ID: <b23d4240-f520-4840-844f-adf712ca2aff@collabora.com>
Date: Tue, 7 Jan 2025 12:46:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] usb: mtk-xhci: add support remote wakeup of mt8196
To: Chen-Yu Tsai <wenst@chromium.org>,
 =?UTF-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
Cc: "robh@kernel.org" <robh@kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>
References: <20241126025507.29605-1-chunfeng.yun@mediatek.com>
 <20241126025507.29605-2-chunfeng.yun@mediatek.com>
 <207f9e96-3165-440d-8576-545bf2bc9dee@collabora.com>
 <0820cf224ae9022fc34fb31d97d4c6f8f6e2eec1.camel@mediatek.com>
 <CAGXv+5FUuqDbVRQdkkdM9SRV6N3H8Gx_rMpx6rw-hNu45SKVNA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5FUuqDbVRQdkkdM9SRV6N3H8Gx_rMpx6rw-hNu45SKVNA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_034622_535835_855BE7B4 
X-CRM114-Status: GOOD (  18.49  )
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

Il 07/01/25 06:07, Chen-Yu Tsai ha scritto:
> On Mon, Jan 6, 2025 at 10:58 PM Chunfeng Yun (云春峰)
> <Chunfeng.Yun@mediatek.com> wrote:
>>
>> On Tue, 2024-11-26 at 09:50 +0100, AngeloGioacchino Del Regno wrote:
>>> External email : Please do not click links or open attachments until
>>> you have verified the sender or the content.
>>>
>>>
>>> Il 26/11/24 03:55, Chunfeng Yun ha scritto:
>>>> There are 2 USB controllers on mt8196, each controller's wakeup
>>>> control is
>>>> different, add some specific versions for them.
>>>>
>>>
>>> Is there any MTU3 controller in MT8196, like all other MediaTek SoCs?
>> Yes.
>>>
>>> If so, then please just add the wakeup control to the MTU3 driver,
>>> otherwise
>>> we are going to duplicate this for yet another SoC, like we've done
>>> for MT8192,
>>> MT8195, MT8188 and MT8186 already...
>> Even I add it in MTU3 driver, I still need add it in xhci-mtk driver,
>> some projects only use host mode;
>>
>> I can also add it in MTU3 driver and send out new patches.
>>
>> But it's not a good idea to duplicate it into MTU3 driver directly for
>> some SoC which has limitation on dual-role switch when using upstream
>> driver.
> 
> I think the idea behind Angelo's point is that MTU3 should be used for
> all projects, regardless whether they are host mode only or not.
> The hardware is there. Don't hide it.
> 

Yes, I confirm that's exactly my point.

Thanks for clarifying, Chen-Yu.

Cheers!

> ChenYu
> 
>> Thanks
>>
>>>
>>> Cheers,
>>> Angelo
>>>
>>>> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
>>>> ---
>>>>    drivers/usb/host/xhci-mtk.c | 18 ++++++++++++++++++
>>>>    1 file changed, 18 insertions(+)
>>>>
>>>> diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-
>>>> mtk.c
>>>> index 3252e3d2d79c..31223912b0b4 100644
>>>> --- a/drivers/usb/host/xhci-mtk.c
>>>> +++ b/drivers/usb/host/xhci-mtk.c
>>>> @@ -113,6 +113,12 @@
>>>>    #define WC1_IS_P_95         BIT(12)
>>>>    #define WC1_IS_EN_P0_95             BIT(6)
>>>>
>>>> +/* mt8196 */
>>>> +#define PERI_WK_CTRL0_8196   0x08
>>>> +#define UWK_V1_7_CTRL2_MASK  0x5
>>>> +
>>>> +#define WCP1_IS_EN           BIT(7) /* port1 en bit */
>>>> +
>>>>    /* mt2712 etc */
>>>>    #define PERI_SSUSB_SPM_CTRL 0x0
>>>>    #define SSC_IP_SLEEP_EN     BIT(4)
>>>> @@ -129,6 +135,8 @@ enum ssusb_uwk_vers {
>>>>        SSUSB_UWK_V1_4,         /* mt8195 IP1 */
>>>>        SSUSB_UWK_V1_5,         /* mt8195 IP2 */
>>>>        SSUSB_UWK_V1_6,         /* mt8195 IP3 */
>>>> +     SSUSB_UWK_V1_7,         /* mt8196 IP0 */
>>>> +     SSUSB_UWK_V1_8,         /* mt8196 IP1 */
>>>>    };
>>>>
>>>>    /*
>>>> @@ -381,6 +389,16 @@ static void usb_wakeup_ip_sleep_set(struct
>>>> xhci_hcd_mtk *mtk, bool enable)
>>>>                msk = WC0_IS_EN_P3_95 | WC0_IS_C_95(0x7) |
>>>> WC0_IS_P_95;
>>>>                val = enable ? (WC0_IS_EN_P3_95 | WC0_IS_C_95(0x1)) :
>>>> 0;
>>>>                break;
>>>> +     case SSUSB_UWK_V1_7:
>>>> +             reg = mtk->uwk_reg_base + PERI_WK_CTRL0_8196;
>>>> +             msk = UWK_V1_7_CTRL2_MASK;
>>>> +             val = enable ? msk : 0;
>>>> +             break;
>>>> +     case SSUSB_UWK_V1_8:
>>>> +             reg = mtk->uwk_reg_base + PERI_WK_CTRL0_8196;
>>>> +             msk = WCP1_IS_EN;
>>>> +             val = enable ? msk : 0;
>>>> +             break;
>>>>        case SSUSB_UWK_V2:
>>>>                reg = mtk->uwk_reg_base + PERI_SSUSB_SPM_CTRL;
>>>>                msk = SSC_IP_SLEEP_EN | SSC_SPM_INT_EN;
>>>
>>>
>>>



