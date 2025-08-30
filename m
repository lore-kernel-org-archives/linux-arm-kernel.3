Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12800CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 07:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yaTeFtLRO5tvXwPuK3rKpMfJKgvbP8eLKfJv8XhYE/E=; b=XRaoOsk2WxjfX4ZkaYzx65UcfI
	+pVrJnVxEomWGLm4jHxnw+4yHxt6ECY1O3gtD1uv5JpUJ5JvO5viLXZV+i2OjF1f/jZ+UgxWUIeKL
	CvABwku4LROVVw3L/P8/3LfDPIKqkHC5K21Z/xRa61y8J6yagLGCvbLbTvajbzW1UY5um7bmRkOgA
	OYuE7xzpvbtQEmPorLad9hhaGElyXQLHhTA3l/Yd0o4dZ5KQD2O1cHGgTO0bDeAtqTL2A5//R3gHN
	dh0T9u5TtuZ6e6d8WX47rLTeca1z83/FBpVNi3yE3P4hR9dyVm1u4lEsCJgfS7enCMIvwTZvsXnqV
	eD4MWI2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usGT2-00000007Zac-2T7W;
	Sat, 30 Aug 2025 07:57:44 +0000
Received: from out203-205-221-202.mail.qq.com ([203.205.221.202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usGLv-00000007ZDN-4907
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 07:50:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1756540205;
	bh=yaTeFtLRO5tvXwPuK3rKpMfJKgvbP8eLKfJv8XhYE/E=;
	h=From:To:Cc:Subject:Date;
	b=dct/rQSwlt79RFPAMIP52jgvAGu7jjpYGGxPv8iR5+/sT9io8wdEWpN2TaXrYWv3Q
	 1E3E4WHmXw2f9IUn77RMsoVofn9RtDAPLLMx2z4kyxgDv+KlnR5uvGrx6lDpePS7tN
	 feWrlfdCuY55wQBJsp23ad+jawqEFXh2nudJ9GuA=
Received: from localhost.localdomain ([112.94.77.11])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id C8218037; Sat, 30 Aug 2025 15:50:02 +0800
X-QQ-mid: xmsmtpt1756540202trj8vozal
Message-ID: <tencent_C4014DA405A96C2E1E7FEFCC050BA56D5B08@qq.com>
X-QQ-XMAILINFO: OTdDBJCpIhk9YryqmrHQtsEp+/lwYhUS9DFHYK/IsJuP7YXgWWHRrpoAOKMZIm
	 yxUQWHU3sc+dLmQ1g+hxGaYVmbwe6UPze307lhPbC7iQQm3JbrcVjmGxsSObXmCcvdnURNVxFEgp
	 5G7JRNEDaGjXYJw8dlfLip3AFBBNvDS+17czoeX5u/eK3In2ae/eYV8G50N35SOknKUI4sEvHvYE
	 y3HXAQ8fxqj4gnhRoeDgzAq/tlHdWWD4CN5B2X66KdOEsLCEWUB2PyXawpOiA21Ex4f4m8Yd01Eu
	 MrD6hpq4xvEbqh4vdMSCn5V4X9t6ClFo3NCgW++GjdkCJn49IUe7XGhhGFhD2rfE9sSjlb5i8rQi
	 EH0IIbeXpAluFzaFOdvO4spbXdS4KWxXYADOuTYQnDURp4qzqBVNywgLv6Kq3WlRXsA0qXGPnuoB
	 6eP8FQhvjNq8v+v5sMv7vlGGXgKF0S3WmlUPkXUcKyVLS2bc/vQS3KASTooeeOtNwbsPf2yKcSHI
	 H71GXsIPkEjP0KaRfYqhpLHnCKPYu4sTO7K/O3Bc1oXdCuxVDQhADNvqOf1HcguvjN4ZL0JB5HoV
	 c+sLW+SToDy5zBA3VBRbziQpb09FQdplg7ReC6lrr0apO0yBZ/n/2vUPXlnu1rHRC9tI66GuFHFs
	 3azBMM5LENOgA8R9OzFbkN9OO8s5SfKoZrwKb4G4EJUQJRmoiWB8/0OROnPzMpLPNfHfpjtQJRdo
	 0MJlARI6QP2d/HoUJznZ6H2kg6twkyKHRXbuSAEyApPZ72I8vr3OHJqOGDmC1fvMH0xO/+vj9HW0
	 9kdadXktzkpT+GtlCb5fWmQCcsBjJdyUkWKVAG6TRkWx3PRarIQmUrCvrFQkTIX1tHpVZLAUwscg
	 LBBzULMczLxBOrsTQU8Z9BWvG0KSRd/izEPPfrx5iUCzrd55FWJQyTKVz85k/fNJYPFHRFnEp/Qn
	 Abvrw4L2twZZgpT2oHF6n0c9W+Ms5W7RgQrPS9mommQJEUCGPhdBN/7FVO7K0uamndjs8g/Y+kjr
	 yG320g2HdvsamQiwOvz09Ij6Gtk7jy76sd8rMc0ESpSg4p0u0L0QUQ51wnGmc=
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
From: Conley Lee <conleylee@foxmail.com>
To: kuba@kernel.org,
	davem@davemloft.net,
	wens@csie.org,
	mripard@kernel.org
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conley Lee <conleylee@foxmail.com>
Subject: [PATCH 2/2] net: ethernet: sun4i-emac: enable dma rx in sun4i
Date: Sat, 30 Aug 2025 15:50:00 +0800
X-OQ-MSGID: <20250830075000.2665991-1-conleylee@foxmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_005024_324236_9FE00133 
X-CRM114-Status: UNSURE (   9.16  )
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

The current sun4i-emac driver supports receiving data packets using DMA,
but this feature is not enabled in the device tree (dts) configuration.
This patch enables the DMA receive option in the dts file.

Signed-off-by: Conley Lee <conleylee@foxmail.com>
---
 arch/arm/boot/dts/allwinner/sun4i-a10.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun4i-a10.dtsi b/arch/arm/boot/dts/allwinner/sun4i-a10.dtsi
index 51a6464aa..b20ef5841 100644
--- a/arch/arm/boot/dts/allwinner/sun4i-a10.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun4i-a10.dtsi
@@ -317,6 +317,8 @@ emac: ethernet@1c0b000 {
 			allwinner,sram = <&emac_sram 1>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&emac_pins>;
+			dmas = <&dma SUN4I_DMA_DEDICATED 7>;
+			dma-names = "rx";
 			status = "disabled";
 		};
 
-- 
2.25.1



