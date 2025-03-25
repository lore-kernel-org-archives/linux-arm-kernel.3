Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EAC1C36008
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 20:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U9r8VTyF0pq8OtaSKqOmz9cveKZRgNXDILarZ2uNThw=; b=DARQjrsNy70RcL7ob8qjTOyZQ5
	xonewlKppgt4Fgn/1UF2KyrSLzpv3Tv/DOVASfUV4xW53M0o2SkbgKkeI6KtSpM1j4+nFGUhawWwH
	j8wSVz57l8TMnDXb6D1eA8yU1AzNXzNgDh2w9y0dFdcKWmeS35uxC5v7QHX9Au15sF/MGpewc7Ieu
	UZruP9tmIf98zmAdcFly8aOvWs0YHFzfFUzavS8UVxnWMBgcgNfFlZ2uBcaN++yO1dffgAgOsnI1k
	sDd+zB5wobepxkn9eJ9B+tT5owjRMrQzU0H1IxQBzW/7EIa27pqHT5OA4PlUHguC0epZRYC54RMuQ
	2n3m4Jww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txARr-00000006vMD-0lKw;
	Tue, 25 Mar 2025 20:00:31 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txAPi-00000006v45-1kzj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 19:58:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742932697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U9r8VTyF0pq8OtaSKqOmz9cveKZRgNXDILarZ2uNThw=;
	b=QDoItFW7QMjgOupbHGJ67OmRJmszsJhCphB+KtN2Zfa8yDdBKvKCnwyQdLX62aDsNhsv9n
	4JHbOUB7PPuNnsLhAp4AgGqZf6sFDeZjhkgZaPPnxV3BQ1/7nuOV+9fkh6jHK8dj2AtdWB
	9ZRpSXrvSObKHVGMwT1qBwXouZAaHKY=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-685-Ogs_x_JTMc6fkChFwzNR-w-1; Tue,
 25 Mar 2025 15:52:03 -0400
X-MC-Unique: Ogs_x_JTMc6fkChFwzNR-w-1
X-Mimecast-MFC-AGG-ID: Ogs_x_JTMc6fkChFwzNR-w_1742932322
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5A08F1956067;
	Tue, 25 Mar 2025 19:52:01 +0000 (UTC)
Received: from puchatek.local (unknown [10.44.33.225])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A2CCD19560AB;
	Tue, 25 Mar 2025 19:51:56 +0000 (UTC)
From: Marcin Juszkiewicz <mjuszkiewicz@redhat.com>
Date: Tue, 25 Mar 2025 20:51:46 +0100
Subject: [PATCH 1/2] arm64: dts: rockchip: enable HDMI1 on FriendlyElec
 NanoPC-T6
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250325-nanopc-t6-hdmi-v1-1-299a2ed45878@redhat.com>
References: <20250325-nanopc-t6-hdmi-v1-0-299a2ed45878@redhat.com>
In-Reply-To: <20250325-nanopc-t6-hdmi-v1-0-299a2ed45878@redhat.com>
To: linux-rockchip@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Johan Jonker <jbx6244@gmail.com>, 
 Rick Wertenbroek <rick.wertenbroek@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Marcin Juszkiewicz <mjuszkiewicz@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_125818_580636_AA555999 
X-CRM114-Status: GOOD (  10.81  )
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

Time to get second video output working.

Signed-off-by: Marcin Juszkiewicz <mjuszkiewicz@redhat.com>
Message-ID: <d5a822856513bcb42cc02045d41e40e9dd79b7b8.1742931830.git.mjuszkiewicz@redhat.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
index bbe500cc924b4c4c1ddd833c32c39cf6c20b60e3..8542d9ebb6c0ddcf90cbe6ac8c231e7fdc5b4bcd 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
@@ -52,6 +52,17 @@ hdmi0_con_in: endpoint {
 		};
 	};
 
+	hdmi1-con {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi1_con_in: endpoint {
+				remote-endpoint = <&hdmi1_out_con>;
+			};
+		};
+	};
+
 	ir-receiver {
 		compatible = "gpio-ir-receiver";
 		gpios = <&gpio0 RK_PD4 GPIO_ACTIVE_LOW>;
@@ -360,10 +371,31 @@ hdmi0_out_con: endpoint {
 	};
 };
 
+
+&hdmi1 {
+	status = "okay";
+};
+
+&hdmi1_in {
+	hdmi1_in_vp1: endpoint {
+		remote-endpoint = <&vp1_out_hdmi1>;
+	};
+};
+
+&hdmi1_out {
+	hdmi1_out_con: endpoint {
+		remote-endpoint = <&hdmi1_con_in>;
+	};
+};
+
 &hdptxphy0 {
 	status = "okay";
 };
 
+&hdptxphy1 {
+	status = "okay";
+};
+
 &i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c0m2_xfer>;
@@ -1126,3 +1158,10 @@ vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
 		remote-endpoint = <&hdmi0_in_vp0>;
 	};
 };
+
+&vp1 {
+	vp1_out_hdmi1: endpoint@ROCKCHIP_VOP2_EP_HDMI1 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI1>;
+		remote-endpoint = <&hdmi1_in_vp1>;
+	};
+};

-- 
2.49.0


