Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3481C369AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 14:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3EN09kEXG7OMqR0uy2B4D2/5Ob0p4yVnh/cBhdXyJbw=; b=4CmDMSQrZ3/btpFuDIMQ/Rns9W
	QWubpEZFxOfnW8i4MsBn8J/vl56GALT+jESi1asq6RHcFc0TdsgtJAR+kt0Z8DpG8kmuQbOYCkvE2
	gheYsBtxBDYNCuNj6LVphh+nAFca0yzdOxKjdjBMFtJZH9NfvhHvlWVrHGa78i/aUzDi/kmD7ae0f
	W+dfz61C19oaabbkStiZ5PaBhHqSYpsLwMOaQiq/1mSPhq4GI/mDpp/avq1XSazcgy3wb3x2Jmd8L
	qyZRdbjT2P1FawyRqstXtHE3M4yhrWZ2+wyGQpQgGn25fBcTvsXhCjDZV10vbtusr8xANMyUvSc5k
	WAsBBHtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3FTa-0000000E6zY-16Yu;
	Fri, 11 Apr 2025 14:35:26 +0000
Received: from wp725.webpack.hosteurope.de ([80.237.130.247])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3FF7-0000000E4Gs-3i7H;
	Fri, 11 Apr 2025 14:20:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fivetechno.de; s=he121032; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:From:Sender:Reply-To:Subject:Date:
	Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=3EN09kEXG7OMqR0uy2B4D2/5Ob0p4yVnh/cBhdXyJbw=; t=1744381229; x=1744813229; 
	b=Mst8MDbHXGiFtTHAjJDo47Cf+/lxrD4o/MnhNxgMUCSaZ25hoPDFO0t8XHVDPA/Fxlohn9nM9bi
	/40W9OKV7axi766N/QnCVlqmRCeKRjdKO6j++0/qT0mkX/koq5/ybnes72dSBZ/6Lt4l8npOhNJnR
	ko8KAQukLIhuZW6bGegNgpa/XMASRuAT9ST9VSR2uQCqJTsCAQqYCsR7MQnGklDfKLNm78THRSAMk
	aq07QCxgRYOLZjhO6YO3mEY5CQBlzA2lqtCeujPhSlHNajnJC/LCKxPcftoOHCtSPIEBPkVwEKA8h
	WcEoUSwwoejzijilNyK2UsN0krKmAALYktuw==;
Received: from p5098d998.dip0.t-ipconnect.de ([80.152.217.152] helo=hermes.fivetechno.de); authenticated
	by wp725.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	id 1u3Exs-001YA2-25;
	Fri, 11 Apr 2025 16:02:40 +0200
X-Virus-Scanned: by amavisd-new 2.12.1 using newest ClamAV at
	linuxbbg.five-lan.de
Received: from roc-pc (p5b125997.dip0.t-ipconnect.de [91.18.89.151])
	(authenticated bits=0)
	by hermes.fivetechno.de (8.15.2/8.15.2/SUSE Linux 0.8) with ESMTPSA id 53BE2dPh013976
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 11 Apr 2025 16:02:39 +0200
From: Markus Reichl <m.reichl@fivetechno.de>
To: linux-rockchip@lists.infradead.org, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Markus Reichl <m.reichl@fivetechno.de>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: Add vcc supply to spi flash on rk3399-roc-pc.
Date: Fri, 11 Apr 2025 16:02:21 +0200
Message-Id: <20250411140223.1069-1-m.reichl@fivetechno.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;m.reichl@fivetechno.de;1744381229;8b4e775c;
X-HE-SMSGID: 1u3Exs-001YA2-25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_072030_068797_07AB4A7B 
X-CRM114-Status: UNSURE (   9.81  )
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

Add vcc supply to the spi-nor flash chip on rk3399-roc-pc boards
according to the board schematics ROC-3399-PC-V10-A-20180804 to avoid
warnings in dmesg output.

Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
---
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi
index 0393da25cdfb..fc9279627ef6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi
@@ -736,6 +736,7 @@ flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <30000000>;
+		vcc-supply = <&vcc3v3_sys>;
 	};
 };
 
-- 
2.39.5


