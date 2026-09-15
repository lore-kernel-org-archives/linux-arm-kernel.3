Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D5CC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 01:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qFEVv4dcy08X3Ik3HgrSf1qU8ho0jjZ5Mt4Ngu5dZIw=; b=RRbuH1GXocohl0I/ESKuObqCHq
	W/W/nrncibSvQ53w483VrmB6em3shPGotU7KmcR3OTW1s3fsv0vYjFobwpkCidxFahIdFb+dKC1ra
	WaWt/B+i5u+AcOhqEHQn0ctuFNk0uc3SolefR/Oiqn+M+wWgYLSqsZGcZ6BPXBS3DneRyHNQNfg+o
	l+Q1P7GUDras4xoKL9DbqUlt4Iy3ZmFs5pa7RYFKcgLv6VIooRl/S+Ft0yynyrDqxY/IWJkbL1iK6
	lbYDCli2E+ly1kMTuRUPy9T7LhXCATUsLBefKZxyil+xGJV/BNIqKPlYXpBSCPQ33tvX6IjNCBPGO
	g6K8Jkbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Hqh-00000004wio-3hyW;
	Tue, 15 Sep 2026 01:20:39 +0000
Received: from mail-qk2-x10.google.com ([2607:f8b0:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6HqZ-00000004wg4-1BFM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 01:20:34 +0000
Received: by mail-qk2-x10.google.com with SMTP id d75a77b69052e-52fb76bcb1fso34106011cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 18:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789435230; x=1790040030; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qFEVv4dcy08X3Ik3HgrSf1qU8ho0jjZ5Mt4Ngu5dZIw=;
        b=scQlPgbD5EmiZeusZlVE4W+Sh/P2KqDaHH9ld0twfCuraklp8t/H3wSL6iv0dNh6dp
         9Ee4ZJwKja0cOOS8MDefKSx/uQ65o/NBZ5XroJ3o7izywkqbtqllcTsAGRS6l60f3yi5
         jMOYUWoMcMyCHDjRFm7MxaZE3nQH1NAlcbYfcaCvwDvgjnoRSYm/j6j87akbjN0HsZjz
         AogZ8TuBrS1GE4UE4Q3+Y7vAbxGFlSXeEdbmj6bcSxC4GfjlAYG+wgf5CcULMBnPPd44
         sYeNR25zeSdlicicInLoWvFDG5m3Y1Z/NHu9ND3+W/Pm/AMMnSfb6+iDFZ0jQdU5VVCe
         MfSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789435230; x=1790040030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qFEVv4dcy08X3Ik3HgrSf1qU8ho0jjZ5Mt4Ngu5dZIw=;
        b=wmmPzw6jFnXXKRH5HEqioFXtXsAuwUCXOUUJ5ezRLlnA/Bfw98g/bQes8DAT++Vtq6
         hHDg7CGYgn40PgBkKJCilZeOapG3Dv2HSyrmpawzWt139a4jnq7bivlqfZVc4/oX/FGL
         gsqjJ6VgdU6RZ50mCBYentvVFPqBUdmJhTWEK2b3dUoDwEfYmdvJh+effZleWK7pPAnL
         U5rvhWCrQ0vqci7vFvQouMVtugDkWNk5ivHKN2E3rYdpBpcg0z+1rYdOcgDDCxP6Yh9L
         csV0KIYW6Xn75ZQbcX+Vo5Gpdfp3wGc2sQFY7FKPzcFboPYwqTmFhmAn45mffTyUvvtT
         GYLA==
X-Forwarded-Encrypted: i=1; AKwUvBycsEUfFX901H+OecoXuFmz6+oVjgiBaIKu6M13ekCCJwVQsQtC5I/Dy99lrxCikmLVngTtsPjacCTRv9icrIMZ@lists.infradead.org
X-Gm-Message-State: AFuF++kMpTpYNEGgb36YAhT4yQQzlfchW6RJQoNFlgFSrFdBUPVZGoZc
	MrSU2ljyZzVsNiGOIgQ880+V1Bbssu500sZCEPymHruq8g8LZRuukds=
X-Gm-Gg: AYBFou1z9Z15UL8bpCpZEaXGn1NCHd0bwNd23/LW8kmZoiA1fysBo8qYtIJTHw8Rx6c
	QoRvT6kRZ5AR4YlWIUHlqMCJzXpwwBE97orTgy8e0lILccBKB+S3GPTNliW1oQIxV2lrYVoU5GC
	Og1JPs4sK5+9j+Q20sRPk8gqpq7sLrutStzY+LIvxLiQenrNOSEvDSgPjROf+/yXAl4LWswmr92
	0sUfYDrmCZ70U12HHGFuVN3ll3FnaEoTvcRQKnkhR1H5iVcQiD3Y9gOQoPmnxegzNHwcEB6sUeJ
	3i8+wVRBshb+oMCxhkRG/ZuhuYjdcESiEdB5fCj4NUGX/iX/LigbYBlhLHzQ8uOzVXpLDwnscdP
	ywrd3vkuEdrz++/4rZlqyuIX5EEsf5h6tQzbVI8pq7M9q4VxzW+3VFndy+JD6uaj+oxL8My11X1
	rEdhsDDYM4Lac56dK3lVaHXVjHxdlPI4Eufab7/SXfrUHYRUT2QNVt6YghppbgsdtfAhvjcrI/q
	xo9uKWN0AZHL9zASV+5SLoXC5FSGrk3YjFHHSVEdnZNlDiFl+VTuhuSr53oMvpSOFIr8PaG/e7V
	hNsDZIfm6GD9oA3sLdy7lNQoObdd42lMXY7HA/W4vQJxWre7mQjZtYbcVWFmA0GIRNSuCQ==
X-Received: by 2002:a05:622a:1bab:b0:531:164:fa73 with SMTP id d75a77b69052e-5310d0005camr81499831cf.32.1789435230101;
        Mon, 14 Sep 2026 18:20:30 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9121a62b783sm91141946d6.23.2026.09.14.18.20.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:20:24 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 3/4] usb: ohci-spear: disable controller wakeup on removal
Date: Mon, 14 Sep 2026 21:20:10 -0400
Message-ID: <20260915012011.61874-4-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260915012011.61874-1-mhun512@gmail.com>
References: <20260915012011.61874-1-mhun512@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_182033_706522_3925388A 
X-CRM114-Status: GOOD (  10.21  )
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

Probe enables controller wakeup after the OHCI core marks controllers with
RemoteWakeupConnected as wakeup-capable. Removal does not undo this, so the
wakeup source can remain attached after driver unbind.

Disable controller wakeup after removing the HCD.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: a6eeeb9f45b5 ("USB: Update USB default wakeup settings")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/usb/host/ohci-spear.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/ohci-spear.c b/drivers/usb/host/ohci-spear.c
--- a/drivers/usb/host/ohci-spear.c
+++ b/drivers/usb/host/ohci-spear.c
@@ -103,6 +103,7 @@
 	struct spear_ohci *sohci_p = to_spear_ohci(hcd);
 
 	usb_remove_hcd(hcd);
+	device_wakeup_disable(hcd->self.controller);
 	clk_disable_unprepare(sohci_p->clk);
 
 	usb_put_hcd(hcd);

