Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A26E69E85
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 18:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZgB/0b4DRUYfPuTkx30gmOcph3LtRPAAxoRoTJ+aweo=; b=X2qNcuujCPyLGEp5zfsnMjn3Hn
	GFCPZiGmgygVeFiyapFu4dbaXH7ciRc7B9RHzmSwznFsvBWRR3GtM+l7/SPS+NOiN8knWax0LmWVd
	C1w5wCceizqXwRY+YC1/fG2dxqAMiZQle3lbR0iUJIhyY//8qOzUtKx/mKv9S6QHRVhLWdqW6HK73
	gQQUxjtesz9KAk6OD4H8uIkt7d2QC40TMgBzRoHWWNSDFN7Wgn09gmmrabMUA6oM2roDjvuUjndC/
	PHuHiQuyt2v1lTFDae4Db5y1TUIRg0Z7VsQXO1roxDGvQsAmIRKFJjQ2SPAhj87yT8/ovSUhIqGwg
	CIlnuJ8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIBXN-00000007DE0-2wU4;
	Mon, 02 Dec 2024 18:52:49 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIBWO-00000007DAd-12qt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 18:51:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1733165494; x=1733770294; i=wahrenst@gmx.net;
	bh=ZgB/0b4DRUYfPuTkx30gmOcph3LtRPAAxoRoTJ+aweo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=d1+850v/UjxK7V8+HZxecukwNyaInPHNRcoDefqRUjy9+ZdpDd+sAKJ92HDeKkaH
	 Ydlrz0Pa+y4aS2BwCL8BqHlrXJYHIbmDPDYzo9Jp2e5nDHCMro8kSopd/zvBw/xoP
	 GAhEdQvcO9aAhpaG3HXuJzo68/jfkNzxsZxFOnzMD/2EuBF1xBQUYxmxvB8uYyrvO
	 8pzhVWqLwm1TV8HzWSxUNiqoBRb0Mzg+rghtO1XrT0kMOCEmdgN4Tx7H4vo45EOPo
	 FP2RDPJP1UpwOUAsga8//6/14iZT5hLLeyP30ifrRuvDWwl6koEdW5QEAqyh/TpFf
	 +cIGeF5yaBkQPbZXew==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([37.4.251.153]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYeMt-1tDdDR35xj-00WWt9; Mon, 02
 Dec 2024 19:51:34 +0100
Message-ID: <d418a30d-f0b0-49c5-8f2a-ddda9a7eeb07@gmx.net>
Date: Mon, 2 Dec 2024 19:51:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 2/9] dmaengine: bcm2835-dma: add suspend/resume pm
 support
To: Vinod Koul <vkoul@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Minas Harutyunyan
 <hminas@synopsys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lukas Wunner <lukas@wunner.de>, Peter Robinson <pbrobinson@gmail.com>,
 "Ivan T . Ivanov" <iivanov@suse.de>, linux-arm-kernel@lists.infradead.org,
 kernel-list@raspberrypi.com, bcm-kernel-feedback-list@broadcom.com,
 dmaengine@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20241025103621.4780-1-wahrenst@gmx.net>
 <20241025103621.4780-3-wahrenst@gmx.net> <Z03l308ur7xuE1SB@vaman>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <Z03l308ur7xuE1SB@vaman>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JFDPQWC/iWpVzlUOkBhNid0hdinoSmvzk39ECSz5KjcFNJzYYLQ
 bBJMN8vYMo8K65/OG7nxKZi2ufJFsPLlUks4fTHwBgeG5A6u58gKNWajQ3rbJDbo69Q86rS
 RtZNPwoSGajeAVR+DOZiOCxm/H1bdwtbTF6N9RzFTSM5ECdql2Jx3a1XcD0+mDFkL8hSQvM
 A7RwEWwiFuPMe2lQdAq/g==
UI-OutboundReport: notjunk:1;M01:P0:HAeP/ZkyvB4=;PI/pDBlpVI/bM72GS5GvEQE1UE8
 SKq+3RgesVtT2pv+9/2xfw+yP78CjWdpPe5yI9KVb7dkz4sIfpfmCOTWLNzTAS9F/qVhzn6xW
 HrqPuHyJVT/YEmcKwoANZMOOYoPmPpy9EtA4WpZU1Q0H5mCjWiM64ss1dM18TpohYmEA9shsX
 oPWAC9l0ksfyx5wQgXdG+815rPT11ve4dPBjIAJLH9xoKdVZ70OKTfMKxyc0zh09tP7MqdHCh
 8dAUwyzYVPKpcuyqoCTHlbVgs/2UPsNTS7pPOD+0DrL0dHC5o1xQbV7BYIhLLtoNTXkdIAPZl
 Joe0hw2nk1rUyWb5Uki0nJrNjVoNn2bUOVFd+wV1E2EbzRNOFBO6qMWIA5zxcywFv1zssKDBU
 8FJaldSzveeB8JY5hI3u3buV57t0sGzaHNzpiTY2fHqVStBzVrQ8eWgJtW9LmHM7IwyYyAfeo
 cr5FJ2bDtt9mIRn92X//m1rcSuoO9749wbPCi9+U389Z2/ZztyyfI0TsrfJfNuIjBzn/NtGj4
 XvOEAxzRSBFqJc1TR1PRrBjaCF3mYwMhy6groxUWSHKsrPaJ4a9ftYYWh5+VgVFRLlj7f8MAQ
 Sg92jkCl3N9fpW1yitEOfgNey/NGxTw7YFFU1iPAijVR9jgbVZJ3+nucM/U0Iu7GVmO0a1xzQ
 kpm/0eoFWNc1SX7hSSfiqCgbPDBrPxk7QS2DrsqKYhUNQlfVD//cWEj/PeWhP1NwEibciYC0+
 Jw19uT9aM412Gl/k5JtTl5GkBkqj7W7+4+nhL+vhfXp0MEMn/gzx0ckpQTQ561LJtnZnWidg/
 SA0LsUg1H2BFAR2V7lWDFe2kdTLQKisTyHn+70lAQ3rt8bRjL8W1nzL1Xe4Upw9Ad9KPSqB7U
 LHp7odcaeJqLLSATuOWSucCg4iJGFppwihygh8f0lcb37uGQ1OSrgNw/tBnD1ZIZc540i3IEF
 rrrxqKfio4YpH+u3rPfrMDnJblgubSmKTkaXGnJ2dofZOFlNklo5QHGBicf5N7oInPK/A1hVK
 xjD3Nz10ndbDDBdtiIB8jbdIP+34RC+c7C3NFE0F/5m61+PGIt8pfZb3KJAir9y7ekYerfQUa
 9wwDlmugDl457aIlAYHr3UmCetY4z8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_105148_577866_A1C8983B 
X-CRM114-Status: GOOD (  14.22  )
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

Hi Vinod,

Am 02.12.24 um 17:52 schrieb Vinod Koul:
> On 25-10-24, 12:36, Stefan Wahren wrote:
>> bcm2835-dma provides the service to others, so it should
>> suspend late and resume early.
>>
>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>> ---
>>   drivers/dma/bcm2835-dma.c | 30 ++++++++++++++++++++++++++++++
>>   1 file changed, 30 insertions(+)
>>
>> diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
>> index e1b92b4d7b05..647dda9f3376 100644
>> --- a/drivers/dma/bcm2835-dma.c
>> +++ b/drivers/dma/bcm2835-dma.c
>> @@ -875,6 +875,35 @@ static struct dma_chan *bcm2835_dma_xlate(struct o=
f_phandle_args *spec,
>>   	return chan;
>>   }
>>
>> +static int bcm2835_dma_suspend_late(struct device *dev)
>> +{
>> +	struct bcm2835_dmadev *od =3D dev_get_drvdata(dev);
>> +	struct bcm2835_chan *c, *next;
>> +
>> +	list_for_each_entry_safe(c, next, &od->ddev.channels,
>> +				 vc.chan.device_node) {
>> +		void __iomem *chan_base =3D c->chan_base;
>> +
>> +		if (readl(chan_base + BCM2835_DMA_ADDR)) {
>> +			dev_warn(dev, "Suspend is prevented by chan %d\n",
>> +				 c->ch);
>> +			return -EBUSY;
>> +		}
> Can you help understand how this helps by logging... we are not adding
> anything except checking this and resume is NOP as well!
My intention of this patch is just to make sure, that no DMA transfer is
in progress during late_suspend. So i followed the implementation of
fsldma.c

Additionally i added this warning mostly to know if this ever occurs.
But i wasn't able to trigger.

Should i drop the warning and make resume callback =3D NULL?

Best regards



