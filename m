Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 897D2CF58D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 02:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pTFNVmbRzXGZbT/LGhFHixBDUze2+iDNyRytGw9mv0o=; b=G9jDyyIMZd6uHCEuHiIcUPD9lK
	LgjYQjf914md3RmUqd+Vz6M1SKVhnILKswtzwtBORyOs6Qs5/lIkdeu/q8g1UL0q2gjW/b1sHeKcb
	PcPjVMoqgkEgnfXVfJmr1Sp0oLI8IvLBJAQr+/yIqyNTvfF2eimw0UstafmL+LRNFK9lFMW1mDHTz
	FbkOrmww+oCfdz3uaFkkLBSj0lZpH9LLyE5i846blEDYUqZGPHW98z8x4e/LXeAO+lbLV9x2ItNFg
	8ugiFq/B4NduiEukMxFEFv+DINT6XPfnyw5BOA1cERqrXTAljAnIethV6KNmTfRNFuetczNQjq9VA
	c2WX0/LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLu8k-00000005xjk-22eL;
	Thu, 20 Nov 2025 02:11:18 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLu8h-00000005xiz-2gEs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 02:11:16 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-29516a36affso5629115ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 18:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763604674; x=1764209474; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pTFNVmbRzXGZbT/LGhFHixBDUze2+iDNyRytGw9mv0o=;
        b=l6vI40TeFKSIPUIgMceZ+C989GNyETc05fHuNnTKAWM9+g+awsOPDcmRpdIf+DhX1/
         k+v1UNMzAkAYI9Y1bqRQx6nbPs6CoeMZqKEOO5s9zCxsFJ6SN1SswiOgrmzXu4qAyxqF
         scIn1nlzqUdTBP3RqtiHwV5dOpwhNN4DBfJFMVr8NVXbg9cxpoMFIX+j0wr6B5BGatmd
         l+rcFKtzbxioRmEmvh6cZOeBZVJbpmYq458i307Hwc4sotY26lx4moc7YorZMfNYUoQc
         Cd2iCJHV/ON3LyTOMHunI5+PmIE/yalrlVM3N73oIq8WPjk2gRxZOo2kX5S97dCzmsdk
         CUqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763604674; x=1764209474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pTFNVmbRzXGZbT/LGhFHixBDUze2+iDNyRytGw9mv0o=;
        b=AY2WwKA6wQ/QOalEQ2Ku0aYQV/tiTY/uMoaNkBIVVzk8YINqP13VyIfbj/bDFAUGhL
         /96j+vUeHekcAZznH7JkkngqJQOW7I2L/Cqo1/B1lTpmYX5epdUkcN4tNwr4Hui2sP7r
         liNMD4tz9YQjHRETsDrMV2ewonOqgM3TA+Uxp9VcclTGwBMSBDS4urfAzQYy+hMU0CGv
         ruWT6LS0vMNqnI9tPRMCE1mRN1JAgXkQxYyd6oBGEOYGZCP08v8wDe1UUy+DEQ1B3857
         9S7G8J0cWuLqO9cw0RjNqR4JQbqXVz60oKWrJMp5mHLLHwGo06k82MMGX3w/p6L8wbwM
         LG5A==
X-Forwarded-Encrypted: i=1; AJvYcCUWj2YGezHSFYi0zBiaoGxPD/inzSDvNpCyn1XvrMUBjGK4830yLt35ABN8TPDfGr6Cu7sm3b1Iw3GKeNNPQoz4@lists.infradead.org
X-Gm-Message-State: AOJu0YxEvraO2VL8gqsUHMSSk7fFSn7n5x581S/h1nQHaXDTL2HAiAGA
	22DC6Q9CFOYfdiurRwzPjKk0grq56EHfab77df5dtW59K7bRyfcFek0m
X-Gm-Gg: ASbGncuxziYx6jx4PmUfaH+h3jM3cUu9M1+vbVtKyR41raCeK9pALsyn0KfRDteI5RC
	ftgQj5POOWbLWXGYsWV6cZgCsqgERGu1StiP7kkxc9i0RPa8VxdmABgrpnIhh20QNFU6hd2Ygkz
	L9CZSwzJQQ/ViWRPlTOw8r+hy+cJC2NdrFmDO5y+u4XZqGWt529LLiw7lbqvmrZQ6PkRh6hafrk
	Y05KwAyrc3iObOm4ajaN+g5mRnT7CjB9MAOxocZDV5tkkST4RGqhH5oJsSJpbPdVwAOMRn1lP43
	p5d+TKM0x9XK2YAw/ja/rBI5PmZBPQHH5AfMtJN3QhdbUR4196BqgttQj4zb8yoa9LPNLbSZcLb
	wYM2d2cjl9PhqLKsMRfU3G5ZVs/FWeIV9D/orhPMEHAv3sGdsSP9FJ+Xl7SYSYwSPokrLysiKyq
	8CrKGUN7Lcut5FiqY4WNxNsQ==
X-Google-Smtp-Source: AGHT+IGJI/oKAsUQ7D64r7YwPy+QegsmPvmtzc+SJksMMBWokoHdWjKxouE6QVbTqg1qQ+RNiAulBQ==
X-Received: by 2002:a17:902:f650:b0:295:54cb:16ac with SMTP id d9443c01a7336-29b5b088815mr20802785ad.18.1763604674349;
        Wed, 19 Nov 2025 18:11:14 -0800 (PST)
Received: from Incog ([2404:7c00:42:f150:fd7c:4ceb:3809:3323])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b25defasm7635325ad.49.2025.11.19.18.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 18:11:13 -0800 (PST)
From: Incog <incogcyberpunk@gmail.com>
To: dianders@chromium.org
Cc: angelogioacchino.delregno@collabora.com,
	incogcyberpunk@proton.me,
	johan.hedberg@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	luiz.dentz@gmail.com,
	marcel@holtmann.org,
	matthias.bgg@gmail.com,
	regressions@leemhuis.info,
	regressions@lists.linux.dev,
	sean.wang@mediatek.com
Subject: Re: [PATCH] Bluetooth: btusb: mediatek: Avoid btusb_mtk_claim_iso_intf() NULL deref
Date: Thu, 20 Nov 2025 07:57:17 +0545
Message-ID: <20251120021217.87602-1-incogcyberpunk@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251119085354.1.I1ae7aebc967e52c7c4be7aa65fbd81736649568a@changeid>
References: <20251119085354.1.I1ae7aebc967e52c7c4be7aa65fbd81736649568a@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_181115_678829_73F92361 
X-CRM114-Status: GOOD (  22.53  )
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

From: IncogCyberpunk <incogcyberpunk@proton.me>

On  Wed, 19 Nov 2025 08:53:55 -0800 , Douglas Anderson <dianders@chromium.org> wrote:

> In btusb_mtk_setup(), we set `btmtk_data->isopkt_intf` to:
>   usb_ifnum_to_if(data->udev, MTK_ISO_IFNUM)
> 
> That function can return NULL in some cases. Even when it returns
> NULL, though, we still go on to call btusb_mtk_claim_iso_intf().
> 
> As of commit e9087e828827 ("Bluetooth: btusb: mediatek: Add locks for
> usb_driver_claim_interface()"), calling btusb_mtk_claim_iso_intf()
> when `btmtk_data->isopkt_intf` is NULL will cause a crash because
> we'll end up passing a bad pointer to device_lock(). Prior to that
> commit we'd pass the NULL pointer directly to
> usb_driver_claim_interface() which would detect it and return an
> error, which was handled.
> 
> Resolve the crash in btusb_mtk_claim_iso_intf() by adding a NULL check
> at the start of the function. This makes the code handle a NULL
> `btmtk_data->isopkt_intf` the same way it did before the problematic
> commit (just with a slight change to the error message printed).


Proposed patch:

> index a722446ec73d..1466e0f1865d 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -2714,6 +2714,11 @@ static void btusb_mtk_claim_iso_intf(struct btusb_data *data)
>  	struct btmtk_data *btmtk_data = hci_get_priv(data->hdev);
>  	int err;
>  
> +	if (!btmtk_data->isopkt_intf) {
> +		bt_dev_err(data->hdev, "Can't claim NULL iso interface");
> +		return;
> +	}
> +
>  	/*
>  	 * The function usb_driver_claim_interface() is documented to need
>  	 * locks held if it's not called from a probe routine. The code here


I tested this patch by manually updating the drivers/bluetooth/btusb.c file with the proposed patches as above ; which solves a REGRESSION issue `bluetooth adapter provided by btusb not being recognized and hence bluetooth not working` since kernel version 6.13.2 .
This REGRESSION issue has been present in both the stable and the mainline kernels since 6.13.2 release due to the below mentioned commit in v6.13.2 :

Troublesome Commit Details:
- Title: Bluetooth: btusb: mediatek: Add locks for usb_driver_claim_interface()
- commit id: 4194766ec8756f4f654d595ae49962acbac49490
- [ Upstream commit e9087e828827e5a5c85e124ce77503f2b81c3491 ]
- Author: Douglas Anderson <dianders@chromium.org>
- Date:   Wed Jan 15 19:36:36 2025 -0800

Tested-by: IncogCyberpunk <incogcyberpunk@proton.me>

Regards,
IncogCyberpunk

