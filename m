Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F325C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 15:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+vDwb9HDwdUl0Ebx/4UWYmvDHxD9AeyHufpsAE/MqOc=; b=ljHAWdoLVjyxZ8Gcz4OK1GDzWW
	tCxzGZNH7IhWmQdTBbHG3whHHR72yJgqYNBRVl6ybfpQXA6/jClCPAb3b/VihzzAOou3bO9/7Gv5+
	5MUgVo4k/vhmjd8HjPgbxV/C8oFKIaAtBr9Vs2A0re19DPYrwafDoC8VnWFodgMVzQHOJomVl1YNa
	y2EoV11B+4+0D1u02wqHjtmIt4wmSKyeFnk1JF0AFzg40Jzbi9UTHb/c/JTh6J0k1Gjeoqef6um7p
	oNhGVIHyvgg1bjn7dR6yQmSp7jbPFkux9B2ODDZMswUxbmqnn89YP2rgsJLagaupS2ZzDWsv38mLj
	R9YK5SXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tze0f-00000003nU5-2vmD;
	Tue, 01 Apr 2025 15:58:41 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzdoL-00000003kxO-0tgn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 15:45:58 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so32691845e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 08:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743522356; x=1744127156; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+vDwb9HDwdUl0Ebx/4UWYmvDHxD9AeyHufpsAE/MqOc=;
        b=YoC86Srlb7ENDgJ+SvN0IT3iUFwcVuaAbjDALn6aOHaXt029qy8pgD62fCnSHIaXPm
         njG0GsYtl3/mW+cG5v1P8e0U5lb06M/61ohpOR5fcxDFCkubA6dT2A8b5n/DCizZGk0v
         G7zNzcyt9MsFhRd7Sx88tnLMuf79sM7tcSAOGks5GTfJWIMTqKFuhi+gBq5xPuW5/ngh
         v1G4u6yuIaWNSTtBI7avcOqejTq2s27bf7XrV/TujlEo1AEXTPPsyHo3Plg1ApEKz9ew
         HXsj4x4M5Toj+k2P6/TbuBGzOfIEYHSlqNlFu3CpgfV5VbnLkrqLhlDTieSM2FTI3IKf
         aipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743522356; x=1744127156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+vDwb9HDwdUl0Ebx/4UWYmvDHxD9AeyHufpsAE/MqOc=;
        b=BbmqyiuyKXFck94HKMgy3vxzLUbEjc6HVvEorIHhgqjX/3YglR3mFwa9C6gQ7VK9ae
         erMmQpr3BPC5cewdQKBPo8aAOCRwaOYYqKkfHzUWKcJhjX4jm7FHB1UQj5uPepo+m03B
         qG3qhvq9MiGxQ6bE/pV2std9VMK3wU42OsFbZvzooboglXwWi1fDUUUxE269/RNogjK6
         AAoVKM/HRt3HdFL0/Ogta23TZnNHhHIQF2gR8Z3MYMB4AyqJVE8oh2RCU99CxE3/ElJ5
         Y2b1EvdvBNfNlHKPaIlszGjAwPmwQqE4ccgvWfzVx8l52UdNOu1xnT5KDJirrtqAmsWI
         WyJw==
X-Forwarded-Encrypted: i=1; AJvYcCUnFjqJYWuIcz+A8+l4A/T36jMyYu6WZT6OAoV9LXrrzggW1Og5uOy2eb7dFJfPgbJV8UCTL/PQODKNcBCpmfZU@lists.infradead.org
X-Gm-Message-State: AOJu0YwhNPrnEzhJljHUY6DHqcavTVri8yHYrxFpHtEFcq+5nn7HeD2I
	4IhCq+bHzx4mD1vEWkDBqMtj3+6jSe/+7rr4Dci+G0MiiewgtmUN
X-Gm-Gg: ASbGncsyJOhjfmJuBZRDGpJOl/Od5YDGBATrcKEB602qt1PkOq9ZeA/CB+JJ6lBt60w
	RjUCG2L3Wd48dj/IdmiOwfxgk6RrKK1FPlLBiGBCxCb7n39zFoT8tAbI0WzOR6eCRGoy0qC2mP/
	RQzyXw/eHDVnK2witrP5f64tfDx2CjbxYUugBVpFM8DpZLedbREo62BpEpmyp5hzLQVeeuB6I/V
	Zy73Hf5ABg/+aBWgz3f4NBitr8pSDiwh8efkZX1V4BxwCGLfxY/bXiSnx178LUCQDcN695Ubbml
	GXUnIpbBLWPDV6rk1UO8cHgNCT6ro+mVLa8bLAqZzXqQNtD0HDGcb90m4MojzV8zqsV4y8Kq16I
	sumdwBwk=
X-Google-Smtp-Source: AGHT+IGdYh9AkcbLHhxheKqNkh4lODmhkDXHSRQLhJxdjuV8FbGHRILAROQeiewvtT5pJYBzkuZvJw==
X-Received: by 2002:a05:600c:3d8e:b0:43d:5ec:b2f4 with SMTP id 5b1f17b1804b1-43db6228293mr144790085e9.10.1743522355870;
        Tue, 01 Apr 2025 08:45:55 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8ff042bcsm158795735e9.28.2025.04.01.08.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 08:45:55 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/6] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Date: Tue,  1 Apr 2025 11:44:02 -0400
Message-Id: <20250401154404.45932-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250401154404.45932-1-laurentiumihalcea111@gmail.com>
References: <20250401154404.45932-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_084557_254427_99E3FA96 
X-CRM114-Status: GOOD (  15.68  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

AIPS5 is actually AIPSTZ5 as it offers some security-related
configurations. Since these configurations need to be applied before
accessing any of the peripherals on the bus, it's better to make AIPSTZ5
be their parent instead of keeping AIPS5 and adding a child node for
AIPSTZ5. Also, because of the security configurations, the address space
of the bus has to be changed to that of the configuration registers.

Finally, since AIPSTZ5 belongs to the AUDIOMIX power domain, add the
missing 'power-domains' property. The domain needs to be powered on before
attempting to configure the security-related registers.

The DT node name is not changed to avoid potential issues with DTs in
which this node is referenced.

Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index ce6793b2d57e..aa7940c65f2d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1399,12 +1399,14 @@ eqos: ethernet@30bf0000 {
 			};
 		};
 
-		aips5: bus@30c00000 {
-			compatible = "fsl,aips-bus", "simple-bus";
-			reg = <0x30c00000 0x400000>;
+		aips5: bus@30df0000 {
+			compatible = "fsl,imx8mp-aipstz";
+			reg = <0x30df0000 0x10000>;
+			power-domains = <&pgc_audio>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges;
+			#access-controller-cells = <3>;
+			ranges = <0x30c00000 0x30c00000 0x400000>;
 
 			spba-bus@30c00000 {
 				compatible = "fsl,spba-bus", "simple-bus";
-- 
2.34.1


