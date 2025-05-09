Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68CD7C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 14:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=9orThWdcg4TfeCb68m3fWgyEG197G9T1RDce0h0a5uA=; b=alHdzWiZkHCyoPbkycNjpoWvQt
	UR6xEOduS1Bbntp93ClY80CdN/stXbMC2zc5/fVXG6XTKtzS9+92ORmaYr0M+EonInJnG7fy1ErYN
	XBg/lMxugU4Q3jZlD5Nk+0sruyhVh11irVCsjNrA+U39w4SQbYwAueW+IUTz3DpHORJhIPCLFf2V9
	gJ8dd6uNO3GKuhBfFCS74R/X0rbFXCqOs+OcCzpEc3RiT5PWhJfCgqky5lYCnSgRatuGk4/WDYTYI
	Ms17+ubW8tGRtb5LOJeVQa7LtPuWNK/kDJbjdBMn8lRB6nuNoT4ydXXRBW668hnOtDxMftmyvT5/e
	ZeeZ1YBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDP8p-000000040SU-0hjU;
	Fri, 09 May 2025 14:56:00 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNkd-00000003lEF-2CiS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 13:26:57 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250509132647epoutp035a7953162ff4e78799ac70183d6ed96a~93s5FUqLl0190001900epoutp03D
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 May 2025 13:26:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250509132647epoutp035a7953162ff4e78799ac70183d6ed96a~93s5FUqLl0190001900epoutp03D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1746797208;
	bh=9orThWdcg4TfeCb68m3fWgyEG197G9T1RDce0h0a5uA=;
	h=From:To:Cc:Subject:Date:References:From;
	b=gSecdX1oOe9APpkGq6S7+HbTi1lhUu6jVTwVac0Zz1BCe1QZvZgxuLuOWCgbVqNID
	 QJjFYn4AbLXmitK0CNCEnCAVhB07YnY1CbUDqeaPQbVOb5hdPqhNNUMdJium85RgW2
	 IlYzt4k6DvCedxx2nPK7e1li7kWFBAuzjfizQY/I=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250509132647epcas5p2b7230107602ed17c24fcda9d48d850eb~93s4VQ3x60975309753epcas5p25;
	Fri,  9 May 2025 13:26:47 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.175]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4Zv8sx2KR0z6B9m6; Fri,  9 May
	2025 13:26:45 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250509124701epcas5p3eee2e2e0d19914366a6759e13d561840~93KKoVN2C0832308323epcas5p3L;
	Fri,  9 May 2025 12:47:01 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250509124701epsmtrp2ab77079f3558be76c75d7002ac34b6e8~93KKnhEnM2652026520epsmtrp2D;
	Fri,  9 May 2025 12:47:01 +0000 (GMT)
X-AuditID: b6c32a52-41dfa70000004c16-2a-681df9451973
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	22.3C.19478.549FD186; Fri,  9 May 2025 21:47:01 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250509124700epsmtip2a2aea9a0075dd374a05f53a9d1ffaae9~93KJT_XeV2899828998epsmtip2x;
	Fri,  9 May 2025 12:47:00 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	alim.akhtar@samsung.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Raghav
	Sharma <raghav.s@samsung.com>
Subject: [PATCH v1] arm64: dts: exynosautov920: add cmu_hsi2 clock DT nodes
Date: Fri,  9 May 2025 18:26:46 +0530
Message-Id: <20250509125646.2727393-1-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrALMWRmVeSWpSXmKPExsWy7bCSvK7rT9kMg4WHFS0ezNvGZrFm7zkm
	i/lHzrFavJx1j81i0+NrrBaXd81hs5hxfh+TxfeVdxgt/u/Zwe7A6bFpVSebx+Yl9R59W1Yx
	enzeJBfAEsVlk5Kak1mWWqRvl8CVsf3FTaaCB5wVW398Z29gfMvexcjJISFgIvF5513WLkYu
	DiGB7YwSFxZcY4VISEjs+/+bEcIWllj57zk7RNFbRokrV+6BdbMJaElc2f6ODcQWEYiWWHb3
	DBtIEbPAZkaJdTMPgU0SFvCW6Lj8BqyIRUBVYs2xy2BTeQWsJe5ensoCsUFeYv/Bs8wQcUGJ
	kzOfgMWZgeLNW2czT2Dkm4UkNQtJagEj0ypG0dSC4tz03OQCQ73ixNzi0rx0veT83E2M4EDV
	CtrBuGz9X71DjEwcjIcYJTiYlUR4n3fKZAjxpiRWVqUW5ccXleakFh9ilOZgURLnVc7pTBES
	SE8sSc1OTS1ILYLJMnFwSjUwCe20nn3CcIdytrfCjqAjjb+Ur2+PO9/eVfZ34+eeTULiVZd6
	rjDxH7Is5vNcKFozpVB5u7OOmP+WlU3FZU0FG/d/KG3ZO+P61b9rW2vWvdh6Vkemee62qL9O
	Lu3StzRXOn9/7/vzx9T2v5mPuqXvz7xj8ffx9rwgxdLiml+XZGur9da7yjdtW16S0uRryFl7
	JpTXPZRlv8zPF61zdKwYzlrd2sBvLRTy4ikfyyZDkXcLb0Wzd7P8c5zK/or1IbfHzWCBnhMu
	cyT+3u58xX9ga9qRY+9dvqh9uaaabvfsvvN3sWrvH6fTn+91L3Q8dvSuQ7WHUdOVyPY/R6P5
	Ga/Lhwb29etMf9MeU23V969RiaU4I9FQi7moOBEAu3XYC8MCAAA=
X-CMS-MailID: 20250509124701epcas5p3eee2e2e0d19914366a6759e13d561840
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250509124701epcas5p3eee2e2e0d19914366a6759e13d561840
References: <CGME20250509124701epcas5p3eee2e2e0d19914366a6759e13d561840@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_062656_185972_CE8BC2CE 
X-CRM114-Status: GOOD (  13.10  )
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

Add required dt node for cmu_hsi2 block, which
provides clocks to ufs and ethernet IPs

Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index 2cb8041c8a9f..7890373f5da0 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -1048,6 +1048,23 @@ pinctrl_hsi1: pinctrl@16450000 {
 			interrupts = <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_hsi2: clock-controller@16b00000 {
+			compatible = "samsung,exynosautov920-cmu-hsi2";
+			reg = <0x16b00000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_top DOUT_CLKCMU_HSI2_NOC>,
+				 <&cmu_top DOUT_CLKCMU_HSI2_NOC_UFS>,
+				 <&cmu_top DOUT_CLKCMU_HSI2_UFS_EMBD>,
+				 <&cmu_top DOUT_CLKCMU_HSI2_ETHERNET>;
+			clock-names = "oscclk",
+				      "noc",
+				      "ufs",
+				      "embd",
+				      "ethernet";
+		};
+
 		pinctrl_hsi2: pinctrl@16c10000 {
 			compatible = "samsung,exynosautov920-pinctrl";
 			reg = <0x16c10000 0x10000>;
-- 
2.34.1


