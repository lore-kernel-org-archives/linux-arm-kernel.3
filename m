Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6CD8D3B7ED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 06:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qpimlZdEDtuP7WR2mZA0+z1H7nFjtx/bFty3v8hsXUU=; b=Qcps85oEqaW8HykWVQmN9CFnlH
	t1FiRIGZ9tj4lYx4SeelbYmeu8puCKe/0ihLC11iAWXshdjXjJuxVrHo0FczqMAozj1IruD+OJlrX
	Azgt3+3T2fBkwULgI1+AOALvuCDebqIkSxWueB0OWVC6LlyGNvxvzp9EW5GDm6tq59hrJkx9pclfZ
	Nc6mFlb4Zf27HfpJdyD0Omezo1CPFfWk7ObbBB43x+pasR5baxYiZPq06ftBSkwp4BRP+Tuaj9cMh
	q7dd5hlSStZ3VtMTK8sJjhdcgQ8SXoVQ6ouC1/bFraQh3reDJVC7/4jf66uHVP/C/fC9L+/s0bMF+
	a75/KImw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSrbW-0000000DueU-0u5E;
	Tue, 09 Dec 2025 06:53:46 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSrbT-0000000Dudf-1wYc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 06:53:44 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-47796a837c7so46104305e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Dec 2025 22:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765263221; x=1765868021; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qpimlZdEDtuP7WR2mZA0+z1H7nFjtx/bFty3v8hsXUU=;
        b=A3t8X2xwWFG2Ah40rYlB4M8GTk5Tt1DDi+RZVuPAPWEb44RRVVXbiNQqpBnNmH0Rz4
         osAYU31xSHI6NhHzv9aUT4osLkYnZ0Hhn1GeWx0wynQTOxl9QhKV4gzjHcZusr4FscM3
         tk+nclOz+prIOq6+qUWZXRzl/RNltexVJeuTb9lGFoHYr9xKTzJnelXQBoYYTmx7INO4
         Z0h/osUaQMlG8DAgCocngBmdODf46rflSxpMMo4SQQhpmnFZichV/lmZr414sjjGGoSX
         Uxy1lCOazWS5Qfv/NDv7XHGE6TRVp1LKRSrcG3F1L4kTf0/0AJTvy0gVv/gjqxMZSk4m
         tYuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765263221; x=1765868021;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qpimlZdEDtuP7WR2mZA0+z1H7nFjtx/bFty3v8hsXUU=;
        b=LJy0DT9Gj3H85GOB5M8jqTioEkI+n/WXjjzkjrK9+SD5i1iDLEwX7+aDvZRkhaIpAu
         cBjVnmYoSP/wZP9tFNaPr6744ZC4KCFCp14bSlzKok3eZXq+gw2sFDNStkDtsVvWHS9h
         61c3Sp4/+wcsN7zbDxQSVPSe4szwehCzoXbfBXMfuHVNO4E095V8baZleZ4lRZQUZBnP
         T2C7ChYoutz+sBV0LLZd/oATBiNfqU9fD4bIQKh632PKMFTv0gPHh+6cpwaJE6X6mqMt
         /+WKx1LILYiuo9L85EcMCEQxtRwHkw6qR/Vzb+S6b1VzNuiibMiTYpYP6JkpG1Vxr4Kq
         WMbw==
X-Forwarded-Encrypted: i=1; AJvYcCXEq8XHRFqgYYyjeIp3T3hj6qcB08HisW8RY0bvk7mEoaFOurSJu0ndCtpHhX+rSB9YEDJdHRtykxUWI70njFsG@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3VXhL72kjJHFm6Ixz1W0QmoUVRI+0DyaDuOcXGYv79LYY2bB3
	9zfyyLMAno+DT6wc985XyQIoOVRkHAuoqGztDXMYTzkCN12uRZUCJEqYv/BnR2RFSsA=
X-Gm-Gg: ASbGncuZHeb6sw0FyQK7e2DDKauDYALhBL0p1GanPe5xom9vZMaWL/eK1E35DLqJXOI
	JJsMpY0xGnDUeCSr4T0dUqAq+he4jaR3zWClUdGWKr/Qe5VORehkACd1QsGXJ3Y32NZlh2eGj9d
	3zRsER/kzD7MZx/bxfuETz/VNWtzQGtu89f4fFsUWXYMRU6XIc+kEmH00gBBYrilqrrNQUyI/8V
	EFZBeMUU7isfs28bf8cQMPNtzhPf5gdhAacx5ZZh7ta53AembXEdbBESjJHNrPc63cKmiDUBOUD
	cAWuFVPfriOvO1CGWkLyJAWWcjX8RUqlOrecRoOa86X3IiBTCOcWWs9dEfXXwogZeeLiWpIq5ZR
	rio9wIEAqE/H/8TzYO73hkBiIKnfHr1B6g7MhfAwckOE8Ja7nYM0Ds/HrD90amYbes1aGNn3qK7
	Dsmj3yD2ASQynX7f/N
X-Google-Smtp-Source: AGHT+IGaTnV6DUM6NZ8B996sUpARBrir70sGaGW5NyYdRK9/TvpgGM9K+ozidhKmYpB4+XkFZ3zK7g==
X-Received: by 2002:a05:600c:1990:b0:477:73e9:dbe7 with SMTP id 5b1f17b1804b1-47939e4d013mr112666895e9.35.1765263220857;
        Mon, 08 Dec 2025 22:53:40 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7d35713asm11916255e9.1.2025.12.08.22.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 22:53:40 -0800 (PST)
Date: Tue, 9 Dec 2025 09:53:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Amelie Delaunay <amelie.delaunay@st.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Fengguang Wu <fengguang.wu@intel.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] phy: stm32-usphyc: Fix off by one in probe()
Message-ID: <aTfHcMJK1wFVnvEe@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_225343_526859_640F7C40 
X-CRM114-Status: GOOD (  15.20  )
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

The "index" variable is used as an index into the usbphyc->phys[] array
which has usbphyc->nphys elements.  So if it is equal to usbphyc->nphys
then it is one element out of bounds.  The "index" comes from the
device tree so it's data that we trust and it's unlikely to be wrong,
however it's obviously still worth fixing the bug.  Change the > to >=.

Fixes: 94c358da3a05 ("phy: stm32: add support for STM32 USB PHY Controller (USBPHYC)")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/phy/st/phy-stm32-usbphyc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/st/phy-stm32-usbphyc.c b/drivers/phy/st/phy-stm32-usbphyc.c
index 27fe92f73f33..b44afbff8616 100644
--- a/drivers/phy/st/phy-stm32-usbphyc.c
+++ b/drivers/phy/st/phy-stm32-usbphyc.c
@@ -712,7 +712,7 @@ static int stm32_usbphyc_probe(struct platform_device *pdev)
 		}
 
 		ret = of_property_read_u32(child, "reg", &index);
-		if (ret || index > usbphyc->nphys) {
+		if (ret || index >= usbphyc->nphys) {
 			dev_err(&phy->dev, "invalid reg property: %d\n", ret);
 			if (!ret)
 				ret = -EINVAL;
-- 
2.51.0


