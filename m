Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBEECD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 13:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6AgZYnyS4i6ey0fjJps0/Fygo8+mCWzQwi4kSxOwSD0=; b=d9jVpdgIBan4sq4rfaX3jdOhdf
	/hbeamCtm+ykCQRTQdKca3fp7uJ2XCT5Iek41s9wfir9bLIJc9EUOff+U7cWRGfGT3bxR+yl/wX/I
	v7v4MvEbXRvzTyLTfX3Joe6oyLHcT5gPu1viZe2pAKueqOppVkFKcqNsuNqZ6IjHxN9q7HLb7z9lx
	iCqNWKkeJQlSq44U47D8sI1nVwWPHWNubdg5wp996qTMzOnTf7H7Dvq4ceYk1dHg2I6c4U30lgiv0
	8+DEus+J1YuFBVsmyYcj+bSk4YLpg4kmY6HkwH/cPBIypc7Glqzg4/GOfrkTATA5s3aTJZg6a9cqS
	Z8HLvujA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV8VX-0000000Gq4O-0bHE;
	Thu, 04 Jun 2026 13:53:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV8VR-0000000GprD-2c0t
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 04 Jun 2026 13:53:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6AgZYnyS4i6ey0fjJps0/Fygo8+mCWzQwi4kSxOwSD0=; b=iWUiBKHmMrqTMUPZoq78P5fDCK
	tyFnZfw5ykprSesoZxL1/dKqhfA8iu3g+91+owukIfeHSq2I6pTcogw1VsW7/HsGIbespbMHi9jsf
	iaGnQNQ7QPQ0ZZsasTCkp/yWPW/Odk4/sYFgaLQksIcY/KgsWCLSC/gOUvaSZCKvTNtyPQl2Ic9Yj
	uDLWaStweYvX8wq7OMXIFCu8Ha0oOgabeqwuGaqThyMNCUxWmLBA+126p7d2YIfvNbHn22aD7Z36h
	qWSPVOud1s5i2Ei9Fg9/WbLk69++edH8TdlzcEL00niVNJuszmaetRf/PhbkV1IU0uYKRTmaHzXs6
	ZfDcAk8w==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wV8VN-0000000EOuO-3Syg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 13:53:07 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso9105625e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 06:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780581184; x=1781185984; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6AgZYnyS4i6ey0fjJps0/Fygo8+mCWzQwi4kSxOwSD0=;
        b=bxV3Zt9m8vrWfTooheU+Ub1nswmPBhveHYjmmtnOKydU1jw2tCbCWzsV6VteADYc4s
         dXtx5Wx8spHiSqZ4CT4Iz7o8vFy5JPJkml2Z9fi1liCs5/0fFkqscS3kgivsvu3e2JWT
         tm9YSbSuAxBy11/7oc/VLjA3jCYqZnu97a0cPsrrdVcBVBga12QrQoaKXgXx7DizSWy4
         rv9EKyGooec72Suf97yk6xCPHNIkVISONH72PGZkXK13Vn05BhDt/Rp+/wN3tc9Ym0E1
         lCKE2c3LNd0DqfSslJ2eMCYQ714q146ZL0D6NsPnsK5nIx04aGSMCuZDcRCtba811CVQ
         MN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780581184; x=1781185984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6AgZYnyS4i6ey0fjJps0/Fygo8+mCWzQwi4kSxOwSD0=;
        b=MkK1dcQeK5u5Yhl30E9aWHLKE0z6bolX++Nz4V/k0dVkVbHzeKv2Uu6A1SdLI6OD/M
         P+ZsFTMf0zZiemhLH7hLwXkI0GjvngLA68C7yQIaBHFnkvWcNhEKwqX8TWChD+lDJf6r
         w7lyTiYF3TgIbCgupGmO96+4ceYAdTiCTAYC0uE3e0TEkxz9Ngp98H8WkANciX8CK0c0
         f0es0tIe+XJzZV/Do3+5sfxaHLFDG9iqVOz/zBCmuT/O+GFnPWRdFrIR06tHaYI0jG80
         iVFJlOy0UxwEEUcpN3AMuPe77rjV4foQFkaIrUogl1R5PJx93KDYD1UxHySXH64gJDNE
         3ePg==
X-Forwarded-Encrypted: i=1; AFNElJ+gwe0uDbiE8A39iUcEcaXJJkgbTJWG96xm2/faV0HKgROQv46M7lUcAKpSaSeyMD+huTRZnO5b73hsbF0/WasY@lists.infradead.org
X-Gm-Message-State: AOJu0YxZvCaOGhotO56GfNUh2EhEBZmtOJM11LxqIGD7LvYdRG9hxtcu
	YQ1aXRFNsvFDhviQ+dBRCdmJ/Ffyi7Lp+dbqmlsPFFAepVhmflPWj1Zf
X-Gm-Gg: Acq92OHrLubu09InBvRvg48NLMoIow1hEFw3ro2UWEPqf2VTNB1JgIAm91S0Y5mf8R3
	HFVnmJaf2vaW9VaGYenh1zEqPDNUD1kwfV9ccLbJFzO12ct0xJmjscamLQloQqOedwUa/xNCdKi
	VIjHRceiZKuCvRP6v0CTdK7reZheZRDAo0hTZAEItyqgM8gW13GVLB6RZGjivNP7w2eRG/prmC0
	rzR0NJTXMk46oIJnridplwU+XKJjdEzgESFb6gCWcl0NXU4FjT5Ge/GpDBVLiExJ+HM2zQbRc9w
	kEDVmGjxX5jMX/Y9ha+2ihwo33Gyr9ecy/HEkoOTvCAYL4fGGexXiMVu++3Z9cdFDXqT4JX+l1x
	4fHeWQoYSLO1hYIFSjPeVeUYmRfV7SLHPxYIzk+7Zj4EhA6nEf63tdG7Ndrdvbl3UoA7/y1jthw
	yGralJgyaaPkUDcaKVu/1Zz0/xfiaPZA2QlAFkasEsD6G8W4pajVXdLPOIitoTdXg=
X-Received: by 2002:a05:600c:5288:b0:490:b473:8f78 with SMTP id 5b1f17b1804b1-490b5ec3ae6mr133508845e9.17.1780581184471;
        Thu, 04 Jun 2026 06:53:04 -0700 (PDT)
Received: from compiler-rock3b.tailb81abf.ts.net ([2a01:e0a:104a:4d80:be24:11ff:fe12:2776])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f0a43e9sm16661068f8f.0.2026.06.04.06.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 06:53:04 -0700 (PDT)
From: Midgy BALON <midgy971@gmail.com>
To: tomeu@tomeuvizoso.net,
	ogabbay@kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org
Cc: robin.murphy@arm.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 9/9] arm64: dts: rockchip: rk3568-rock-3b: Enable the NPU
Date: Thu,  4 Jun 2026 13:52:55 +0000
Message-Id: <20260604135255.62682-10-midgy971@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260604135255.62682-1-midgy971@gmail.com>
References: <20260604135255.62682-1-midgy971@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_145306_111573_530D2E28 
X-CRM114-Status: GOOD (  11.86  )
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

Enable the NPU and its IOMMU on ROCK 3B.

vdd_npu is marked always-on so the rail is up before genpd de-idles the
NPU NoC at power-on: the PMU de-idle handshake needs the rail powered.
The PVTPLL compute clock is brought up later by the driver.

Signed-off-by: Midgy BALON <midgy971@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
index 69001e453732e..7ac780ed313d5 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
@@ -330,8 +330,10 @@ regulator-state-mem {
 
 			vdd_npu: DCDC_REG4 {
 				regulator-name = "vdd_npu";
+				regulator-always-on;
+				regulator-boot-on;
 				regulator-initial-mode = <0x2>;
-				regulator-min-microvolt = <500000>;
+				regulator-min-microvolt = <825000>;
 				regulator-max-microvolt = <1350000>;
 				regulator-ramp-delay = <6001>;
 
@@ -787,3 +789,13 @@ vp0_out_hdmi: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
 		remote-endpoint = <&hdmi_in_vp0>;
 	};
 };
+
+&rknn_core_0 {
+	npu-supply = <&vdd_npu>;
+	status = "okay";
+};
+
+&rknn_mmu_0 {
+	status = "okay";
+};
+
-- 
2.39.5


