Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C55E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 22:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3ijyw4ymsAkFeWgQVUc3VJve4hsyHlzdR/n9h/faXYk=; b=eYHV4EJc3LEtWZ
	l780VyFI7l8F6AXCjJh2HwdoJo6HPaRT2b/RIkdrRMIQZfji9fg5Bk0qWnJaaN5yTln+xfQeRutI6
	RPZDJ2crd8NMhJxsDwWhIkS7+NEei9CFAiPnMdxPvydt+hIFau5oT0pIkc0RicvSSRcYFQnYPEVOF
	c++OQ0iVNbYkUzoapYTKksOt9ORR16HJEZi/beHQzuUhMN556y3WSp4whRacbjk7EPm4f5S6hLIii
	yqlRD8URw39JNbXs9MNuGYiDgiu5epaGqL1wptNyvP4z0lYbFTt859SOlppdDJJFlTekWm/LC8cvy
	V54yN9BBqoa8VCB2HfvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJgcK-00000002sdB-09Ee;
	Fri, 06 Dec 2024 22:16:08 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJgZK-00000002rwT-3cew
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 22:13:05 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-215936688aeso24209155ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 14:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733523182; x=1734127982; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3ijyw4ymsAkFeWgQVUc3VJve4hsyHlzdR/n9h/faXYk=;
        b=NZrIq8HQ2dGswUiGREOvcu/51eQKf3oAijb8/bQ1GRtrCF0t3p8VlS1JE4I7jdnfcm
         ASEYuYnx/IztvJ+fztfqUv0e6vsNwIlCIrN+1JzfcQMT9D9mfC+T4xrogLE84M1CmO5M
         IPj63C80ewgwQPRWmM4b9NOLLxa0kuhg0H89AlMP3GADE8s6tcu3VKVdXjFhn0MgrnSr
         ggguleRmMN20FxNnsAsrGYHdpmQdT85u+hwBHK05ghFmn5e43QunAV5tuH506YypVcPQ
         AJHoG4GxBBtbG4CXmV7lGYRIuPeYiJg0j6tD16jnF0pX+SF4HYA7RI2cKS9ZHfevFrsn
         0UiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733523182; x=1734127982;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ijyw4ymsAkFeWgQVUc3VJve4hsyHlzdR/n9h/faXYk=;
        b=lmSTR8/pY/bGH8PNIjv5eKs03NbT46Jb9vlVn4V37P85sxdN7hQs1gL5U/ObFDjyHM
         IYzGw3p4+PNy+POXhphGZSHFHDW7Ph/KJ1kAikRSd0yHYOJ6eD+nhoztrwvIB46To2el
         q1o5yUZrqPgj8zjI22s3wzxN3hMCvdRxSGOLL68W47pWuRoMNUphwGvj9bkxcVZa5BvD
         lxWFyx8LjJVijcBlVMOzRXLiw7GOZ+Y5auI9YvVH67Y30todl4HZoze/a6YF76lH281l
         62XQHuY6YryAILJNB6ASaIjKPRd1TZn5eaqR87y7NRusmWpQrZVcTE/v7knFqeJJ55eK
         KXEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYm3D7CKXvcpVJU3M+MAeMYmmANS4Q0zXuird2F8TScSj0yZ9c/gBr3DYucAcRrvPa7lrI0szf2TJW5aKXcCDA@lists.infradead.org
X-Gm-Message-State: AOJu0YyVkDRilFFZNLkNvZNJ3nhu6Id40nAjFuOv65g5oNOAjBmqO4xZ
	GHQPRg7NjUR7VXXhqwSgiIKsJFSzMOZOGaEQ6pzSiB2aMGdtB3AzjKpNc2n+chY=
X-Gm-Gg: ASbGncvqewkGG5peG+1GJ1YHD2UWclOlPUkLXX6yZE8UyMduFmihmTm9ydCdO4JOUBR
	yCQscH7IPH4qDRq0mHzed5ciWnA6K/jisltxakBHEKVdo8TfIYPfO1Qr0iwCAJIdGYVYTIkl+9p
	r9hEg9pZyl3lbhVoJyzZQrMP11OkJpLNRJAlyORS1B7xv7LBkPNSAigRuG4QNuIH+xxVf1pC+eQ
	LA+4MVWEglQoD5X65KZ8sVZ8Mo7L6RY4T1t/Ln6trEnAZq8
X-Google-Smtp-Source: AGHT+IE0aIHhhTmAidePOav40ceBPnjxnWQH78Ga0X4GWG2q6QRXiZRk6w9WNT1JZkEgO2Szry7sFA==
X-Received: by 2002:a17:902:d2c4:b0:211:18bf:e91d with SMTP id d9443c01a7336-21614d5dc31mr58848105ad.27.1733523181838;
        Fri, 06 Dec 2024 14:13:01 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725cf9f681esm53275b3a.98.2024.12.06.14.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 14:13:01 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v6 0/3] pmdomain: ti_sci: collect and send low-power mode
 constraints
Date: Fri, 06 Dec 2024 14:12:49 -0800
Message-Id: <20241206-lpm-v6-10-constraints-pmdomain-v6-0-833980158c68@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOF2U2cC/43PS27DIBAG4KtYrEs0w6t2Vr1HlQUYaJDiR8BBj
 SLfvcSp2qiy5LJiRqNv/rmR5GJwieyrG4kuhxSGvhTqpSLtUfcfjgZbasKACaiB0dPY0awoAm2
 HPk1Rh35KdOzs0JUv9ZxbL7XzQjSkIGN0PnwuC94Pjzq686XsmR5NYnRyxeq6MO2rrHbIaWyR3
 IePIU1DvC7hMi7T3znkVo6MFKjFWhlVW2dF+2b09RRMdLuya9EzexKx2RRZEYVCzqRWALVfEfm
 v2PwjIy+i47JpjeGNkmJFFM+i2hTFPSPI8l699mbtavkjIgJuirKIHBC1BqEY+3v1PM9fiEs8c
 UQCAAA=
X-Change-ID: 20240802-lpm-v6-10-constraints-pmdomain-f33df5aef449
To: Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org
Cc: Nishanth Menon <nm@ti.com>, Dhruva Gole <d-gole@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Kevin Hilman <khilman@baylibre.com>
X-Mailer: b4 0.15-dev-355e8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3769; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=Y97KH6M0ijxkZVfpkGPDKdwkUdjVhhwQOY3Z0kcTNBk=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBnU3bsF4JQ7/8UbfGMucR/j7XBVV4vqdySArbbd
 iwouJliJfqJAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCZ1N27AAKCRBZNxia0/vG
 ZVOMD/4kyxmRYQGPNwla3vR81G0xRC3SAdlkKmw4KvOlaQMP7jnvqxnKawgQUpX0gu57mPeIbJM
 Wcbkjj4CpWI2a4MoGunrrGOy0uJIh0ZVVhScv5nXIDxg91LxNGUrkN4FpKvl5A9JYwhsYEkrmzL
 nYEjGVhUflEOBHycFix8UFQlw2O/3We00L/hnDijh5FP9Y2JfJkBwfOa3EnxVxNNP6ONmBAHswb
 BmPOl/Qio/vDFBmI4HnL+upZuUdWnNgKrFRt1pHEH2IOtOF0v1Yq6Of0vNwvu2hEIFpGoBdwvAv
 RadRHYNWtwD2JIddC6CS5tWxs9FE49XaBlKNFyfyuKDShMVpRvi9kUGQp9s3ke2SaFBBH6VSosE
 Ofq7GFTZYORm2NywmKCOsp0oeMX22GvqQNa0mXM/Jxh6Oo6bVydphSLMoqRqpFn6pBV2IhoKM2H
 zDtQpU8kqC2JKQ/622LzvbxrJYw0nVfLTt0ajlodWz6LRnN/CemalE/BSjImUy4umhEfR37WOe/
 jI4atzk4Gohs0SnfBIsMS2QJGwJoDpdnI3FXV336iOxLRsLML7KHZK5KPnV8b1JxOBtkjCo7DTm
 m+QOqmRRJEyDFDmJeNZpPQGPAsm7hZuJ/LruhjeWtHyND7xeVpNNNR2J5I3EVisf5aTBzfmi6Ka
 1rLgeoltRzF0vZw==
X-Developer-Key: i=khilman@baylibre.com; a=openpgp;
 fpr=7B87460E16927FA9F5BFF10C5937189AD3FBC665
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_141302_919061_056F2FA6 
X-CRM114-Status: GOOD (  19.17  )
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

The latest (10.x) version of the firmware for the PM co-processor (aka
device manager, or DM) adds support for a "managed" mode, where the DM
firmware will select the specific low power state which is entered
when Linux requests a system-wide suspend.

In this mode, the DM will always attempt the deepest low-power state
available for the SoC.

However, Linux (or OSes running on other cores) may want to constrain
the DM for certain use cases.  For example, the deepest state may have
a wakeup/resume latency that is too long for certain use cases.  Or,
some wakeup-capable devices may potentially be powered off in deep
low-power states, but if one of those devices is enabled as a wakeup
source, it should not be powered off.

These kinds of constraints are are already known in Linux by the use
of existing APIs such as per-device PM QoS and device wakeup APIs, but
now we need to communicate these constraints to the DM.

For TI SoCs with TI SCI support, all DM-managed devices will be
connected to a TI SCI PM domain.  So the goal of this series is to use
the PM domain driver for TI SCI devices to collect constraints, and
communicate them to the DM via the new TI SCI APIs.

This is all managed by TI SCI PM domain code.  No new APIs are needed
by Linux drivers.  Any device that is managed by TI SCI will be
checked for QoS constraints or wakeup capability and the constraints
will be collected and sent to the DM.

This series depends on the support for the new TI SCI APIs (v10) and
was also tested with this series to update 8250_omap serial support
for AM62x[2].

[1] https://lore.kernel.org/all/20240801195422.2296347-1-msp@baylibre.com
[2] https://lore.kernel.org/all/20240807141227.1093006-1-msp@baylibre.com/

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
Changes in v6:
- fix build warning on arm32 when building with W=1 and CONFIG_PM_SLEEP=n
- rebase onto v6.13-rc1
- fix latency units: convert usecs (PM QoS) to msecs (TI SCI)
- all dependencies are now merged in v6.13-rc1
- Link to v5: https://lore.kernel.org/r/20241101-lpm-v6-10-constraints-pmdomain-v5-0-3011aa04622f@baylibre.com

Changes in v5:
- fix build error when CONFIG_PM_SLEEP not defined
- Link to v4: https://lore.kernel.org/r/20240906-lpm-v6-10-constraints-pmdomain-v4-0-4055557fafbc@baylibre.com

Changes in v4:
- fixed missing return in wakeirq error path
- updated trailers with reviewed & tested tags
- Link to v3: https://lore.kernel.org/r/20240905-lpm-v6-10-constraints-pmdomain-v3-0-e359cbb39654@baylibre.com

Changes in v3:
- change latency set functions to static void
- Link to v2: https://lore.kernel.org/r/20240819-lpm-v6-10-constraints-pmdomain-v2-0-461325a6008f@baylibre.com

Changes in v2:
- To simplify this version a bit, drop the pmdomain ->power_off()
  changes.  Constraints only sent during ->suspend() path.  The pmdomain
  path was an optimization that may be added back later.
- With the above simplification, drop the extra state variables that
  had been added to keep track of constraint status.
- Link to v1: https://lore.kernel.org/r/20240805-lpm-v6-10-constraints-pmdomain-v1-0-d186b68ded4c@baylibre.com

---
Kevin Hilman (3):
      pmdomain: ti_sci: add per-device latency constraint management
      pmdomain: ti_sci: add wakeup constraint management
      pmdomain: ti_sci: handle wake IRQs for IO daisy chain wakeups

 drivers/pmdomain/ti/ti_sci_pm_domains.c | 81 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)
---
base-commit: cbc4912199deab59fdbd830b115d81941d0add46
change-id: 20240802-lpm-v6-10-constraints-pmdomain-f33df5aef449

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


