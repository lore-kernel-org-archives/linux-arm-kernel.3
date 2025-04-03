Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1E0C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 10:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CARrPYNC+39nu2aCcF5f+6rCXN+MipGAP0Rp28eM2S8=; b=ux/EAmbBVAWhPjgFchDq+du+kP
	r9ODt0PDWyO814vXpt56MGCGCYX63lHSq4swz1idD5t/GjQTHuIURTiCdMAH9SIURXtVjtAKmIDa9
	aNXlX7iAn9Uhzptu1w+9gTMmnG0Hzd2LmqCwMFeg5cdclBaVpcmAARRS9VmKd9SS/zESiWA11W4TJ
	kWn/OmzyfvwHkErzQ16zkUMDafmzpB9qFL1MAulwrwqUf3GOJTcUfKQd78LcWs8X0L+0NgVAWn0x/
	PSlt5kgb3WRkSaN345VcL/RKnw6+P8qy5nuV455vsm9sDCYcX8r9DmdNO7XsrUPuD6kAq+DEkV4LB
	29tXOA9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Hsh-00000008a91-2EqP;
	Thu, 03 Apr 2025 10:33:07 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Ha0-00000008WWw-1UKl;
	Thu, 03 Apr 2025 10:13:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743675213; x=1744280013; i=markus.elfring@web.de;
	bh=CARrPYNC+39nu2aCcF5f+6rCXN+MipGAP0Rp28eM2S8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=RvXf/cnK4bKjLf+iiCwbERJtPdoEvch2sZiwMwLxp1yaey4Lnbm2xmShYZIXpgRj
	 SXeDrauR7IyfW4jwpUAGiLERFE1IOYHEn9VhiZJ0Duxt2bV7vUtk1FGV4m0OM/RuU
	 mWNMtRqMcf3MZAqM5YROzC8hBOOvrEUTqoOWKGEGmwNc1Q2ktRacY/s9cszx42dQz
	 LOWQVcX6BVRZFw+MFajHK9fnSxZ9+ZlXLbSVtYH3UDQIJwDCw/oLuvOmhyI1WDH1A
	 yUaOzNI1MvxH8gorkBVlKowACVhzWKuuSVx8gvv0Gbd9BHeGW8cPlAS/6T1reIe0i
	 Uc/LCL8s0C9ZuRbcFg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.50]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MFaui-1ts2Ff2PrK-009QNs; Thu, 03
 Apr 2025 12:13:33 +0200
Message-ID: <db778d8c-0a56-4b01-b5b5-5610a68a4875@web.de>
Date: Thu, 3 Apr 2025 12:13:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Henry Martin <bsdhenrymartin@gmail.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Peter Chiu <chui-hao.chiu@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rex Lu <rex.lu@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Shengyu Qu <wiagn233@outlook.com>
References: <20250403064344.64253-1-bsdhenrymartin@gmail.com>
Subject: Re: [PATCH] wifi: mt76: mt7996: Fix null-ptr-deref in
 mt7996_mmio_wed_init()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250403064344.64253-1-bsdhenrymartin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FOtUCR65RPzrUtKtMJyZcNJ7HmqKEyao5W6mjn8SRcQgnfwYEcy
 Vo9lS/Mm9+uxpZGS1jxjpgrm/Lwx8EDmB6Epp1Y7Da9+NUjuBH+Z+SJ6VV2MadoSvhaZeif
 040QMrQ9MFViVVPr/MuinG5f9ckItH7tO/YX3R5jQXIYkaESsA/mNxMIrtZ0dTWhGmyPFiK
 /p7IWI3WNtszVi0Su5vIg==
UI-OutboundReport: notjunk:1;M01:P0:uDjs4CvjV+I=;wmRCD8VloVebfGs1/wtaZa1Jy7L
 0VFTlya2kWdcaD8Dj8w/1Izj7gU2p5NAt+6lSZwpAXX9c6GiFlqs8Y5oT3C7h/CiVsDql9dgC
 lC5MmkYneB9E+orqTvaD29PoVqW493rJuft8/RHN49vxnDqKWw/61M081skmmgUbw7mieFh+i
 St4zsIRVxZBJLLOAkAHeNcSGhNMmPthKuRi7eUsbL/+ekADDqzRcn0gbyVJPBZkHcQ2t3hO6K
 r/OKZohys6m64AQFRDa4bARf1cR2Mb1G0j6wYJ7Gp6itDKB/eZaxwcRcBlnHZHEZeSChrTg7U
 QVgcQX/E1IaQS5P94/cJ4AH6iUhy3U58hvQLdPd4Bvh0tAK9deJDHzxAbnAxasC5dnP66FUMS
 rBYiZh+zlTOm3hkafqSPVk3S+rLM1EsRKW2mthCxB+ufYsOeawCLt6avyXpfPxjrcPmjyWlMO
 2wWO8lZ8RTre1+nFr7hXlywiD1ysAIHzL7yXft7cqaby4GhFnLG4JY4JAt8bbeEJMrAo0R8xn
 3xQuEaN+ITaoYcMALPFtAL752WQWr+gEKFXAXbHpK6ExpevEvltn2pXtGHt+JrI5lFhX/oBo7
 g7+Vs6Q4GxbIwsS7+E6/q4CYIM/zJCFsIXoyt223uW0h5XZJVBl0Ad/dLtgT6MKCpkR7bUqmN
 reAz0sqQXuFeWHCdfz+EUk4synUvwhbppfRPFmeQu+i09fUE9ZX7UYnWZTRqbRIHqDlG4h6Gn
 23YKEec49x80SoMQIW7K+WSMgx3qaJhAPph9vW+i1kVkPJbZAurBE3Etk42YUrylWm2lgqFaS
 9ceLCntgFQWN4tDZ5xQ/lTHftXNV64H2ZYmzk6IMw/PZHYQ1AOEkyFDdQxiglOjulBXzketsx
 vdms2/H0fz1QwG8gEKoxmrDSi9jVUrIK0c19K8V7YPUWo0F6Wl49/WSvBb1YxrrFuXdxM18HC
 f5Xx4Wk6O+HVt/JlbvbEHYck5Vz6cVxBdfOvJAMQvHljfKXu/ONrmXruxMLIRwYrAJESZPXl1
 aF+zmfty7/riduIL+Ao8QJV8tXatzPeiCsJ+/fYdvhF3UOg9hmDjbTNUUHb2UXPHbsrW12ocj
 7Kp0C5huZMPnznzPUUQreQMW7eOanw1F9UlhbjDwGRtOVZJKB6q3K+nbjm2vn2sivkO81O9o8
 E/Enofk/+b3xjvhq0nSUBP5iW/JX9sjMFMCFZ8EIcF7cFoe64vGCB6aIgPQjCDRNbfa3Q9I43
 +iaeDaRDorYMbp4z+39bSwVRLpiBElEEAtXnKsZ0HSXtqDNRF38JpuTU7Ei3wd+hBXdyhpxpn
 zHs0AyGN8jX+m/J06rNbPNcW/4r1wluIMFHGoNl2uhuzvpjh6R0cvyMUbZ4PsIlSLXdMLv1xT
 6NgfEKEf6mAFT8DZO8VuqzPkkqLapDW1pClSq9F4UT2wlnaLq19wV+nVbwIkhS401io4qDtqw
 gdDOIGj9nmTsphSflT1GKud+KzdbTGSgUhqFW/+Dtz4tMdGzSF//xhGuyxnyz1psq8Yh3fA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_031348_707121_BF6445AD 
X-CRM114-Status: UNSURE (   5.75  )
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

=E2=80=A6
> Add NULL check after devm_ioremap() to prevent this issue.

Can a summary phrase like =E2=80=9CPrevent null pointer dereference in mt7=
996_mmio_wed_init()=E2=80=9D
be a bit nicer?


=E2=80=A6
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
> @@ -323,6 +323,8 @@ int mt7996_mmio_wed_init(struct mt7996_dev *dev, voi=
d *pdev_ptr,
>  	wed->wlan.base =3D devm_ioremap(dev->mt76.dev,
>  				      pci_resource_start(pci_dev, 0),
>  				      pci_resource_len(pci_dev, 0));
> +	if (!wed->wlan.base)
> +		return -ENOMEM;

Can a blank line be desirable after such a statement?

Regards,
Markus

