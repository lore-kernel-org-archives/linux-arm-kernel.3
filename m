Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 199D8CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 20:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CijZ3Xqd6wqxDdeAlLP2vKxFbA+8L+sWoLSvg2ZGilI=; b=QRXgzFcLWuvoSYgKL1GyO+CANV
	OHRMGhctkiqKKQVDy0fvRsK5CZOwOl4N1blI0ne++fOT/ZXxkuyltF1dF/SU4FASEDHABtWVWimIn
	t6GUDVQbDw6sX/tAFhorPhAkpF4QANN6CiHfOZlB0DBvJd2X7+7BNzr1jdLAjnZBeGmV2NcrkYPsL
	Xf0IwvR7ANV7R4V2vw3nemDQraIsUFNaBPTOmFM/N9ZRX8MySzEvo/c1pl76B7BQnr3WdLmGD9ALO
	QfiJPA58m5emkclA7bpztuZG2zhi+0UoAjYKPFK8XDRGy8R898UHnsFXEJh3ls8w0x/8O+2h82xkk
	JC+7Akyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1smj-0000000CqIC-1G1T;
	Thu, 25 Sep 2025 20:41:49 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1smg-0000000CqFN-1a6s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 20:41:47 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cXlxd5FDcz9t6q;
	Thu, 25 Sep 2025 22:41:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758832901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CijZ3Xqd6wqxDdeAlLP2vKxFbA+8L+sWoLSvg2ZGilI=;
	b=r/jHz6jnoaua6QeLVAKaSSvhFNHUK1SEppt1e4VfZcHodDk0zlMAdXYuen99UuKB+ssZUu
	zIouJzVc2yEVwP8p/SAQlZGLe/Z1Zl0SsbllTruD79VTA2he6cWIWiTz1jN8W5MEnLzF25
	Gr/ezLzyiwEVn4u13TZxJsqJdHTnrFWTU8WEZ+G5yWBnEWQteTCi04Czn5/cuMV/b2mmQD
	UlseG98XIWiJDk5doIyOtt9KYJlIs69B8+hgPFzAVRhmPHzmKJCuWWU1E9TgBRKDEZI5TK
	9Wg7q/Llf2ayJDuNxwRBGnw7A4ZePEH3XGxWeCszEed6TRhUvQLt/n4popvhng==
Message-ID: <609113fa-6af3-4e7e-b47a-45b3152d8581@mailbox.org>
Date: Thu, 25 Sep 2025 22:41:37 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/9] drm/panthor: Implement optional reset
To: Rain Yang <jiyu.yang@oss.nxp.com>
Cc: airlied@gmail.com, boris.brezillon@collabora.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 festevam@gmail.com, imx@lists.linux.dev, kernel@pengutronix.de,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 p.zabel@pengutronix.de, peng.fan@nxp.com, robh@kernel.org,
 s.hauer@pengutronix.de, shawnguo@kernel.org, simona@ffwll.ch,
 sre@kernel.org, steven.price@arm.com, tzimmermann@suse.de,
 xianzhong.li@nxp.com
References: <20250904082224.113d0cd1@fedora>
 <7d4e773b-64ac-49ce-8d8b-7a39c353d18f@mailbox.org>
 <20250904160445.1671f140@fedora>
 <36298ed9-05e4-4871-8e99-dfe814342c29@mailbox.org>
 <20250904172019.58e5f589@fedora>
 <4147d10f-fb54-4f1b-ac1b-58cf657a3aeb@mailbox.org>
 <aMk1CISrn2_p0qzJ@oss.nxp.com>
 <c34dc4bc-de12-42fc-aaf5-50474dc53042@mailbox.org>
 <aMoTtr9KmdrgDUiE@oss.nxp.com>
 <c1a45cfa-a249-4782-b5c8-0ee2d173fc97@mailbox.org>
 <aMrDKkIoZvAlBD8d@oss.nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aMrDKkIoZvAlBD8d@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 1dyck573mitkj4nhekjarxur44xtxn3t
X-MBO-RS-ID: 09b1e6ab6b2edc227a4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_134146_565216_ECD7A5C8 
X-CRM114-Status: GOOD (  16.03  )
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

On 9/17/25 4:18 PM, Rain Yang wrote:

Hello Jiyu,

sorry for the late reply.

>>> sorry for the inconvienence. this uboot version don't include SM-184's change.
>>> I heard you're using i.MX95 A1 Chip, so you can extract the uboot in below link[1],
>>> or build from source, or raise one ticket in this website[2].
>>
>> I use mainline U-Boot 2025.07 with about 10 extra patches, but nothing
>> significant. I don't think this is U-Boot issue, is it ?
>>
>> I can rebuild SM, which commit in SM (from imx-sm repository) do I need to
>> use ?
>>
>> -- 
>> Best regards,
>> Marek Vasut
> Hi Marek,
> I think the problem may be about the multi power domain, the second power domain named perf
> is for frequency change only, you can try to power on gpumix power domain only.

I dropped that one.

> as the 0x4d810008 is a write-once register and whose operation has been moved into the SM side,
> so please drop the reset change.
> can you also change the label of the gpu node from gpu to mali like "mali: gpu@4d900000",
> as the internal driver use mali label to control the thermal up/low limitation.

I updated all of the AHAB container, imx-oei and imx-sm components, and 
the reset controller is no longer needed indeed.

> BTW, does the dynamic frequency work well on your side so far with perf domain?

How do I test that ?

-- 
Best regards,
Marek Vasut

