Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D26DE7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 14:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qhGl/6JVH/dXKoRU3pMclVBBK/lYldgB8q4d0vdsZ9I=; b=Dbr2gJCRvDfyteV+XfE2wezY4o
	QjlZUnrlw+yBsjmMDvQOePkikMrbrstIdjx2afgaE73npUpuj9fPq66zf7Fm7NvPpuF22hcyuGotN
	US+mYzREakf/ZaPEL84Enjv9fuI97OBqQ6QdmjyLe/aAZASIEdc8shnLpGUULA5L3rVBN/HvsKkRa
	z6zVyBnAbwbF7aX13phOJhjrOnXG4t6jcVtvgimjk0bCpHcKWMjbWg0ip0AtFWi5lb7M3rWh7QEqy
	DZNNNgN933dDpOdTj/BNWfxdi85FdqqhrcZorFO5fZf4rb2hbyH9N14zSTofd4tf+cgJr5LFKVcxf
	tNcdaU1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIqaP-0000000CrhE-0PTT;
	Wed, 04 Dec 2024 14:42:41 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIqZP-0000000Crd3-0Mz7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 14:41:40 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-434a95095efso6104505e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 06:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733323297; x=1733928097; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhGl/6JVH/dXKoRU3pMclVBBK/lYldgB8q4d0vdsZ9I=;
        b=pq1blE/nF7Ekw9oFr30JQ5xzhRRb6pVIhD4pfXq5iqShfVdR20tJSw6ZJYPiJC/zqi
         LwpV/ysmA+2/Jq/dx4O/4zKBAodwVlMDnquGM7wn3hOV2AU0s1rS6vFHAhoaWy27pYzE
         RaUXxZbXhUHgbYkCI/u2df96vAP27iQzOpiSTj6MJijI5/Xc5649/OiniSzeQWWYJpGn
         9r0nsPovNA2vd4EQLbs+VJGceRE+Diowk9c9BIv6Tt749IbqPJTl+DMRKxm7pAm4ZuOR
         vlIaxpj+fDCiag8m8N5Z3E9rVWP9rG29B+4iHzpq5EX7HhhjEmwUp2R0tRodNMRfuhqX
         eKIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733323297; x=1733928097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qhGl/6JVH/dXKoRU3pMclVBBK/lYldgB8q4d0vdsZ9I=;
        b=mZ91cQ2712QGNKu41hi15ZZH/INlyDECrlJ7WylP5kv2fZN/M3Pq3qtrlisM1A3Skj
         qSP/H5SX8kJLKKFAh9k8wpo8Z6wBnrr/WKGOe4MRxIUB0pUsI0nlYVaLlrEd5eci2vif
         CicEhJ6lbL10QYGRMk5g5UFT2F46bp9m7NNYc00Xugi0kJpQ1sR5QheYFFu2f33Bqa6f
         Cogl/wAP1vVKHfKSG47yfNxO9HydDN1tYnFhjz5/zWznhrjquBtKt2sink5qL2rk5olw
         obdNh7sSc50O1lqaGC7Ju0/0iQh7L+wv8DAMxDjnneOAw2+Py1G6Hu6S1eP2FY+a4rGW
         YubA==
X-Forwarded-Encrypted: i=1; AJvYcCU8Kdl6efsEQKUReXWFOY6CA3YEYPDWmfO2+Kj/lA3QJ9b4xkqLDDtK1AfFcdQ5UZvUGD2Ke4BSo+EoC5PQFKGN@lists.infradead.org
X-Gm-Message-State: AOJu0YzX7Hv4Rlgbbmz3N8VRKkVhnKuBuo3Ch56JHcxWFgkaAqe38Mkd
	FgSP4R7lNnURUpGM+uFFM2MmKRLMGg94i0qmSLHurvdw/wNG2CenEOLi/af7ztM=
X-Gm-Gg: ASbGnctrJg99aW7q1vVInI3MUgEdFuv4pdknBSjb2TbIwRdONeuQ3M9WktQ82KJpdpL
	hg5gVHfPo3RlzCBgNxkq+fJXU23G68bIvllJKBKVezxVkRexnBCHRbTVct3m3tBG1UdGHwo8baj
	3R4pG34ci0B73cGnrpJiJMMERNrNjptC3r66jvZoBhFEQK5DBFcwuvk/4dbKG/cHpytckNTZvgr
	MmEc1ZIQ3gDkVbvU7Pl6hOcrY9UPsI51WVzi+G6Nu0K497X4+AuCrAnL/Z0fOnn7SUK40Vjh1Su
	APQFOjE=
X-Google-Smtp-Source: AGHT+IHiCrxtrxOZGFdMYFRWw8hMLJcbS4lTT/2HQaZH8PkQM044OzLLldtmNR8ZhHOFG2ZVMZbm1g==
X-Received: by 2002:a05:600c:350b:b0:434:9ce6:3ec with SMTP id 5b1f17b1804b1-434afb9ecd2mr234338215e9.7.1733323297075;
        Wed, 04 Dec 2024 06:41:37 -0800 (PST)
Received: from brgl-uxlite.. (5-226-109-134.static.ip.netia.com.pl. [5.226.109.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d527e12dsm26368145e9.10.2024.12.04.06.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 06:41:36 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: GPIO_MVEBU should not default to y when compile-testing
Date: Wed,  4 Dec 2024 15:41:03 +0100
Message-ID: <173332326029.11398.6855202202316597607.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <6b9e55dbf544297d5acf743f6fa473791ab10644.1733242798.git.geert+renesas@glider.be>
References: <6b9e55dbf544297d5acf743f6fa473791ab10644.1733242798.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_064139_397210_7F0D2FEE 
X-CRM114-Status: UNSURE (   7.78  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 03 Dec 2024 17:23:16 +0100, Geert Uytterhoeven wrote:
> Merely enabling compile-testing should not enable additional
> functionality.
> 
> 

Applied, thanks!

[1/1] gpio: GPIO_MVEBU should not default to y when compile-testing
      commit: 70327137eb3eb64f346191dcd0ee5140d5ab34d8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

