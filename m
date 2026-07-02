Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0949C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 19:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7qgcEW/wpSAcIIpifYaO2mjjD/biPw57/pk0Dft8EAU=; b=Anr0221A+7LiDfXfR4K/o0LeYg
	yif83pWI/tZdMp3/biHQCYmF17Z1OMF2nJtZ/oUUBRsdnTK3bwLda4EocZgTjKczRtDyWrsmxr/Wc
	Kayrht3r5tFDTuMtM47faa3+fOlhGU0y0tZ5yYeb+c0CzA6v0f3qGd0DP81OYVc3mhpm9zQIfT8XF
	nzdJM36r5Wqc73WnOVQR5fEsEHTyoGHThwubnp34s+Yjv/L1u8c81PCBB28nLxF9XUq71HnoPSUb9
	gW8hv4fCSK2bYOsWapd3fyvk/dGBjeOM539T/FPKQprttoHIkPBEdjL/PZ+tK4N78SdNMc/jui6Lc
	RZ4DX+IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfN95-00000005MqD-3zUx;
	Thu, 02 Jul 2026 19:32:24 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfN93-00000005Mpr-0bYo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 19:32:22 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-4745492ed3aso1439617f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 12:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783020739; x=1783625539; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7qgcEW/wpSAcIIpifYaO2mjjD/biPw57/pk0Dft8EAU=;
        b=Moq297Fl46WnzDrYsyF8RLJzWMagK0nS5a75NMqaxObRM9vaMR6V/TZxTFVWIbHlPQ
         sf3+S/h5VbMLEvQaWZDYQZcmzbdA8ebsZ9ResigGo+FJVVNU+9OeHnOV4ueCDc5NgdXS
         Y2O84hu8M0ocioFEkhncOmnEyRzmdrJoeiY7s3mKrh5SH6Cv8rMuoLENXu0RJlL0wGzN
         56jD8LztABaqNwLS7Y2tedBB9lwXyQZRtJcorOMRL0Num4wJ9aQn+bSlDlt9xDhQ/l4l
         5jfz3zXu8wiJ5h1YB78i728qCBGRLUo/6Bl7RjtvHC6BKO+eomWWmhlRkaqgewQR+peB
         XmrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783020739; x=1783625539;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7qgcEW/wpSAcIIpifYaO2mjjD/biPw57/pk0Dft8EAU=;
        b=M0/CedQmGBJUzZDL83Yu6PxyY/f2YwimRh86JoHjzuOmvKlTFLVz89CkMt+MbHLWcS
         Ybl+UyqibywVuUp8c3cnvX1qbMSlRUYEDaoQmjGyVLOH5HdbRWi9HgGDoiCflsKmt9Ur
         pRGutMSZUXCkXd4BgohhmeWcWtUQ29R3MsjIK6Kq4jSI/LJHvD7TnghjFklF3F/zReSP
         GX5ir4AEYnrICrz9OqjuaLTk++zgdj2AEaXmTttqKT90UeAIRlOSPrkuJt7U9FJOaSF5
         HqU+f4G6dlTss5jjk1iTcAQGSJy0hqQZPyMUz8myDWcNGeS7nYEiAp3nG99TdjHocSKk
         VlPA==
X-Forwarded-Encrypted: i=1; AHgh+Rp26iVf6IV7vxeXcrc7inG0NiP6tLwqZ59vvjpq1D8/CuxcFDBEldfr0q2xREgi/AQW3mfotY+YRyXFv/WR1W11@lists.infradead.org
X-Gm-Message-State: AOJu0YwcTut9qJsNSf5oSVkDgYGrADheDK6tk+3wswYWZxjEyJLN+aFC
	qWWmxWfFwXucI7xAgU8KhREUNqbjBwEsjv545Gy8Vbcdcjctmg/heHcY
X-Gm-Gg: AfdE7ckz6upsAsilg9yTD+aHjL4uG8/pduFN1xidS7+mt4NTQFZkWyqaSX/ybEAa5J4
	z/Ys/IlWioRco3+LgWHeAmITF3DmP4UUCkcL7KRoPbbYy4mta3QfLvtnPOWKdDmdCmPNR436gJk
	vtkDizBZnTsZd4KqaDU/+5G0zRGAIVchuYS4MuAU7kb5JiXsIdCMnzJetc73fYoXxHy/seDFScC
	q19JrMzpM+NcGiHb5CmYKsF93DnU3U96K4a6afQK9xl5Eqm9JiTELES3yhMTRYszEhx2v51VG7K
	Bd8vw/Ppxwlq6ywcRQtYKfVjf6nxEmFMDvxyA84e67nAgVvQN5bCKEd5i4bLcC1QbhdTDkJWpjI
	ReEFyVCfmxlmvuhTtucGJ5X5qbjp1HO2+vRU36XhhQWYryjJYAHi3GlybahQ2fDMPzJ9jhZIkW4
	8Ht7XLmDevFtk3Sbz9kNuKnzF5WjOnTnqoH/rvK89LOhn3EoQG3cZnMl39pboCvyGJkfrForMeD
	0PWCLYY
X-Received: by 2002:adf:e00b:0:20b0:475:3a97:8e47 with SMTP id ffacd0b85a97d-4775918fa48mr8502412f8f.29.1783020738996;
        Thu, 02 Jul 2026 12:32:18 -0700 (PDT)
Received: from [10.128.11.240] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477dd94ce4csm12070471f8f.17.2026.07.02.12.32.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 12:32:17 -0700 (PDT)
Message-ID: <a0cee001-7bca-438a-943b-da28528e7df7@gmail.com>
Date: Thu, 2 Jul 2026 20:32:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] HID: apple: Add DockChannel HID transport driver
To: michael.reeves077@gmail.com, Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 iommu@lists.linux.dev, linux-input@vger.kernel.org
References: <20260630-apple-mtp-keyboard-final-v1-0-506d936a1707@gmail.com>
 <20260630-apple-mtp-keyboard-final-v1-8-506d936a1707@gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260630-apple-mtp-keyboard-final-v1-8-506d936a1707@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_123221_229923_7A3CB122 
X-CRM114-Status: UNSURE (   9.92  )
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

Hi Michael,

On 6/30/26 13:54, Michael Reeves via B4 Relay wrote:
> +source "drivers/hid/dockchannel/Kconfig"
> +
>  endif # HID
>  

> +++ b/drivers/hid/dockchannel/Kconfig
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR MIT
> +
> +config APPLE_DOCKCHANNEL_HID
> +	tristate "HID over Apple DockChannel"
> +	depends on APPLE_DOCKCHANNEL
> +	depends on APPLE_RTKIT
> +	depends on HID

APPLE_DOCKCHANNEL_HID has a duplicate dependency on HID,
since you put the import for this file inside of 'if HID..endif',
and then also gave it a 'depends on HID'.

- Julian Braha

