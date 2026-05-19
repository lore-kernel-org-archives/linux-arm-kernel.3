Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52EBBCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 04:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LB2eeG1SpolST48Ht8N5ZVmPK5SGJL8UVYCuIxMFohc=; b=Xno+zV2VvTqfDKe7E3PeYOlWCA
	sJrM/NPyIFgrqV41IMS6bVCV3XN9Nr+8D9XCdE28j9yc3KWcFON/ztNtH+M2FdkQmUF4ibh4woMP7
	cClJ0Ks1QvtpO29Ze5yhBNyGBt2xlTPCYNn1+Uc1yaZXmJMw6FSNfJQZ8WeIwC1DDfEoYG9qWMc0i
	i9JOhhIylF4KffkO+8511K1H7J6N2mCtWlpKXavniT6DbeQ3zuAWRm/wOOaNTfNL5jX8gtXba/Jwc
	DvZdhGvqi8hryMEro+m7EM/X1oj4Fk8I6fOrx9PB2AAidWtnHpdCFrlSxrXxH6K9cvPaQKv7v5twn
	rcZeb9AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPC7b-000000006vU-2C1T;
	Tue, 19 May 2026 04:31:59 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPC7Y-000000006u3-2JFz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 04:31:58 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so24665905e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 21:31:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779165114; cv=none;
        d=google.com; s=arc-20240605;
        b=OTGGDEMFCgsDJZWTDbLqTuWEzaHj66Fihi0IIIAMJI7MVCdefeaECTVMFyM2yg0cx7
         CDaGD6mtEvROiYo44U42YVhzgw/yba3s9NY57ri7QQlOH5hUuNNOrsnq5c/DnsiKKAIX
         juOQ1D+IenK2g17dUQX8W5I9p+jclv/vP07dOByCBbieWYbSo5Xbwjl9vJ5KgP6LyZ9V
         ck/NW6yekS+S5Mioz6botJW2AET0BxIcf2kWsktHkO5LZqBZAzsKwjU8qCMyH769npF8
         z/ZNBMaEdKb9/KcmVL3g6tEmP8XAiROAcumIvq4bdG8bZfGSp3t9F8Ak7XJQLpM+GBiX
         LW8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=LB2eeG1SpolST48Ht8N5ZVmPK5SGJL8UVYCuIxMFohc=;
        fh=T+uCLGRVYZTKZoWgUbZusqMPkW9rUhNcgJbBzDSWksE=;
        b=OBTNq7NnX1xAUW00F7vtUcc1hJbSlIteF0AGIJJK4k5du2dkDtmKdPPyhm1XFuQt7a
         uuA86jzM5Cj8Ch+5Ah+lGXdPQ9xVyKUuupalFRceAxcK1hiW0lJfM4dT0s8P+e3uNLHi
         AO21qKpB+qns2Y1qpFBsb7Dpdi0BH1K/1x9/29LIMyw/lx/i1/xs++FQqwHj9hIO+Swx
         jiymqhl/gtAS3aLfQ6PwnlZ2Jl7DakXpP6zTgco2ju5wfKeQkZRZ0cByLjV1nmpHgkb7
         9bGP5kHQutDGWpKxjpi55OOOnCRM61IODPcI8N52uWbZOxMeCwMF0uyinlgNao/IKWFO
         kIWg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779165114; x=1779769914; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LB2eeG1SpolST48Ht8N5ZVmPK5SGJL8UVYCuIxMFohc=;
        b=KKR+y0qyEnCAcMmpNts3x2YbAz/eA6sTg/qTApnxltVnDa1Ct846H1Y2xARHRMpwP5
         xkb46I9E8ZsJY1X+1IYIV2T5Giaki9I/NcgEk5e6jB2JPB4XYEKXfeYk7Mff6E9/Gy1J
         uQX8xfMv0Gb7xoSR4zNrZ/ggMiva4gslDQCQoDk2eE/jJBxdRfwArAiGOsxoLOCX/mP/
         UnbdYvFUtxJHhjBuSUuISyhR0keIigLxWTvhBElbTSPBNkqdO/fO24LZI2oS0Iw/3ujq
         Vi8ulwFm65+BcEsNGGPOQwfJkyw/cx/PjDhfcvzqb1UENzlXQbniGKwuwcRqtFaRhk61
         qwrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779165114; x=1779769914;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LB2eeG1SpolST48Ht8N5ZVmPK5SGJL8UVYCuIxMFohc=;
        b=jmAxwyyGWeHcwByJQVMZQ0JRNQUjvRmCGqN3eQH1EwtWfy2LO+oCZPvu1Nys3HbG+q
         ODu5YLROiu+FASoDjbkzXf2lbAyLiyKsEAvLl0DPhzJW6m62XFq7/IqriwULdCFBFJBz
         vEoEtYnsjn8HUosVWRFa6upeq0haG4y4u4h12qG3fx4LfoYj3bTmA9XtCGskmGnN4DS8
         mqmOL2ULDjE0ZNDkYHKnJ4l75QYM6Wdz5W9OHobR8iquYLX1hoT9FQ2U9+D6ryehbeKG
         rVIJ+JQQiegeB45B9Pi3eRr2AvLUL7ir2svEWgKErbBzNVcY4cbWGDj+OnYZ7rRnpRBg
         o4Yw==
X-Forwarded-Encrypted: i=1; AFNElJ/RF8wpF+Gcz5Zd+RvG5q04AFj2i9RVeFqw+Pzs6Z+qiqQbU8SdJCPoEB+Le009lkZyR9JeEuK25hDHFjGQXl53@lists.infradead.org
X-Gm-Message-State: AOJu0Yykm4aTgfvNqcTeloKG8G+EgP7hOvm8xeNrKIEMACUSSVf81xTz
	QoqhTzS5MId8EMILZbyunlofnZTWZ0ZZ5Vi+1vI71fvjvNpssq+XOiXotLmz2zBAe3Vu3F7ilrz
	RKps1CylzhVt2/Uc6WDM7b4FsnU+MWEw=
X-Gm-Gg: Acq92OEnE/3iwdvC2pHUoQD51NgtJfWAgYuuFMFiWOp53jfvyxBTZBbGdneNgJ53KPR
	FNXsJ7liGzbCATwI0liNlIRZ2HuSGUOGGA8RjMZZEC2vJBe46yXFbEM37Wp11yLeEqLwfcrII1Z
	VNc0LgBaCnNiw4dN5Sylztl3rSUyy2zbCkkc0RFTaNnZHaKvNCUX7K36yk/jrP6JXiDn+fsCwRJ
	z/xSHApc1J0Xpjc3ayHdMzrLOxWRKZgo5BWkKUVbLvY7Z1AruQPzau8l3Y+w1vewB2jBRpGICK6
	vDd3IR6sVg1lk9xtcz+m
X-Received: by 2002:a05:600d:10:b0:48f:cfae:b654 with SMTP id
 5b1f17b1804b1-48fe60e5537mr217793815e9.1.1779165113908; Mon, 18 May 2026
 21:31:53 -0700 (PDT)
MIME-Version: 1.0
From: Baley Eccles <baleycod@gmail.com>
Date: Tue, 19 May 2026 14:31:42 +1000
X-Gm-Features: AVHnY4Li5nUZrvw8vcm2bYlGMK9IhnqMjGOljLZnXZ-_QnQCztFbvk2LXkdu2tc
Message-ID: <CADCSNFD0Ut-jJohTQFczjBgaVf=mBrc2rq4hJQncVZpF4bCoxw@mail.gmail.com>
Subject: [REGRESSION] Bluetooth: MT7922 fails to initialize after "Bluetooth:
 btmtk: validate WMT event SKB length before struct access"
To: linux-bluetooth@vger.kernel.org
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	regressions@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_213156_595877_35BAB154 
X-CRM114-Status: UNSURE (   8.50  )
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

Subject: [REGRESSION] Bluetooth: MT7922 fails to initialize after
"Bluetooth: btmtk: validate WMT event SKB length before struct access"

Hi all,

I have experienced and looked into a regression on a MediaTek MT7922
adapter. Bluetooth works on v6.18.29, fails on v6.18.30, and reverting
the bisected commit fixes it.

Hardware:
MEDIATEK Corp. MT7922 802.11ax PCI Express Wireless Network Adapter [14c3:7922]
Subsystem: AzureWave ASUS PCE-AXE59BT [1a3b:5300]

Good kernel:
6.18.29-p2-gentoo-dist
Upstream base: v6.18.29

Bad kernel:
6.18.30-p1-gentoo-dist
Upstream base: v6.18.30

Failure:
bluetoothctl list prints nothing / no default controller is available.

Bad dmesg:
Bluetooth: hci0: HW/SW Version: 0x008a008a, Build Time: 20260224103448
Bluetooth: hci0: Failed to send wmt func ctrl (-22)
Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection command is
advertised, but not supported.

Good dmesg:
Bluetooth: hci0: HW/SW Version: 0x008a008a, Build Time: 20260224103448
Bluetooth: hci0: Device setup in 129909 usecs
Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection command is
advertised, but not supported.
Bluetooth: hci0: AOSP extensions version v1.00
Bluetooth: hci0: AOSP quality report is supported
Bluetooth: MGMT ver 1.23

Firmware:
/lib/firmware/mediatek/BT_RAM_CODE_MT7922_1_1_hdr.bin
/lib/firmware/mediatek/WIFI_MT7922_patch_mcu_1_1_hdr.bin
/lib/firmware/mediatek/WIFI_RAM_CODE_MT7922_1.bin

Bisect result:
624fb79dadc1b65757986a9d0fdde5c0cf3fe179 is the first bad commit

Bluetooth: btmtk: validate WMT event SKB length before struct access

This is a stable backport of upstream commit:
634a4408c0615c523cf7531790f4f14a422b9206

Reverting 624fb79dadc1b65757986a9d0fdde5c0cf3fe179 on top of v6.18.30
fixes the issue and Bluetooth works again.

Please let me know if there is any additional logging or testing I can provide.

#regzbot introduced: 624fb79dadc1b65757986a9d0fdde5c0cf3fe179

Cheers,
Baley

