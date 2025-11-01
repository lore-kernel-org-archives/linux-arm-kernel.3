Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08AC6CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Nov 2025 23:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v2kY5ZNCCQbsUksqRncXUOQKnSfwxn1jvbedFSwvdQE=; b=LClKuGVEyoM4Cf6waOq9oUfVql
	MgwJakhTyUyLUBvdH+0jh3mHB8VW5ScylatA25/ALflm2InnA8H+6oUQN762/fgsNn1hJf45QBCXx
	08b4/jyTW4hhB6zbOT7Rgln9Y253EKmQ7Ydb44On0TGSr51vVRtohm3a9OoyqQKaVS0M16FXg6XSa
	2q/vfJ65QCAqwnghZVGcOozIdSDFbWgEndQJ6xz5RiBuuaB6fWm19PiFbcV9GtifTwd4z6FBNl24L
	pVgVbvvSnsN5kKsKt72YQXE62Ieq7ThmUO9xXyisrJNaUwNkgWjajHN8185+snf8Ro3PBNX8lvrKW
	PhnaoGTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFKrT-000000089Rd-2e3h;
	Sat, 01 Nov 2025 23:18:20 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFKrR-000000089Qs-1Cvf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Nov 2025 23:18:18 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b6d8b70197cso55964666b.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Nov 2025 16:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762039095; x=1762643895; darn=lists.infradead.org;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v2kY5ZNCCQbsUksqRncXUOQKnSfwxn1jvbedFSwvdQE=;
        b=EZOKESzGdQ1ko6V8ETLZOj66PCJW2sAXzTHL0+/2QMTNVdK2USF0J1/4KTVtzt7zW8
         kvYkVMrSP4VmujIDfrZqaP/OzHxwd7fx9nqr9D4LUaQggq/K8eW2U3CkU/g3UHPyiDPX
         +7opKTTChuOmfvIGqrZwywBIoL4IrGcSZVAOsHP6NmUz5Gh/ZQW9TmaqwrvTcxmmnEjv
         892IUExh7ciJZ6n+I1bu/IJiIwfKoXayXhRZKn3ZRn/vOARCbt3CTBLLdOWJLongXqlQ
         WZUi9TXwDAukIWC3LrXa8pVm1hzPlEbYSXhtQ+JlgZ/RXzJRN1cg7rG9sNH+CNe1W+vR
         kbdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762039095; x=1762643895;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v2kY5ZNCCQbsUksqRncXUOQKnSfwxn1jvbedFSwvdQE=;
        b=hvqo4sDaPoHQhi+sMopjo685JW2ZTQxj2oa4OeRqfjg5C0VviZBgStUUgtMctw7uVs
         ssnvb/YaDzqURiOItcMjoa9bi38meR6ckdCmhUwMYidXY407f/glZXUmfsyuIuYBCaNS
         B6CrqAxJxkgrfTZ0fC5FtJy0O2tBVQYada3ngeJNRw5ar1bxiXPQHyHh45rclNfNO1a+
         B5WqJhUNOvHDU4M+/QAy9TaQUR66K8oHNAvKcWpQhxDs1JmDMzKRVpscclIQW9K8Og4m
         eiGcym4uGO9+W/6y8U/4GLS4GrTduNJm+Qt3G7mEGVvmKXLY7sw/HNqp+1awbEnEh9Ss
         EfWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPveBNDE+3vAN+j7x4hk3t+YwooU/mAXq0KuiczNgutsGNpvLlLmxnhmVFK+xy3d2oCwL0Sqvsxyb5zI8sw1wl@lists.infradead.org
X-Gm-Message-State: AOJu0Yxjib2MO+qugViLBPgi3zk4EBqCNPr7X+LftUiX2qpY+hzRxx0Z
	zOk7WpyNxDXiZcCA1Mqv19B5eDhg5aikchGSIhhgg49+dwc/qIh29Ku1
X-Gm-Gg: ASbGnctRSz2MxgTuwWL04VP/NBGY183o5ELXMqyl+RQHiYSMJKlel8Hyct3v5tcD+CK
	lnLtmmgl/Jr+kJyUs7N1cF5ZFlaZAjC63dPcmszmPi+oHr1eAmGb4Osxnrkf5tqXrK6U8T6LF69
	FDEm4cGsLFEqObHjsEVvwPZm2a1oZHLBi9whII7nzvVANLU+V1Y2hBp8rgtf/tQnpmYRr//2Cyj
	7FNsqSDDuwavQ8DiApGxLa0TNsGwT2rmCSUQj95LeinS0i+3+3yGXHcAk0CaUX44BdY9Hgfa5nk
	XCWTEnZBCIa01UeqRYKwVz5o6jd14HjzrBg8mI2qiBNvhuHHycOhxzAeB1PsklI33XVz1MBwEBY
	IPHL0/aFExqc87RTCdAFt0n16sfCupMMhDhgAtqhWeA308ri70WKLQ82Np5+3EkV0oatGY3Jrb0
	e2hhOeWaXRVO/1TkQqFIbbG57viSRI4ee8iqpNeRLroPlYFvKa9Q==
X-Google-Smtp-Source: AGHT+IHcmBZR/CYZGz+1H8YjiW4T4LxbNxir8Pj0nOjlwjuLiZBdJmsLBYzTwNDhteMqoR37SkWibw==
X-Received: by 2002:a17:907:7e96:b0:b3f:5eaa:ef19 with SMTP id a640c23a62f3a-b707012ac5emr437203766b.3.1762039095064;
        Sat, 01 Nov 2025 16:18:15 -0700 (PDT)
Received: from ?IPV6:2a02:a449:4071:0:32d0:42ff:fe10:6983? ([2a02:a449:4071:0:32d0:42ff:fe10:6983])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70779762e9sm571946666b.7.2025.11.01.16.18.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Nov 2025 16:18:14 -0700 (PDT)
Message-ID: <7d6fa223-ab90-4c44-9180-54df78467ea5@gmail.com>
Date: Sun, 2 Nov 2025 00:18:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1] ARM: dts: rockchip: rk3288: move edp assigned-clocks to
 edp node
To: heiko@sntech.de
Cc: robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_161817_351438_69031850 
X-CRM114-Status: GOOD (  11.40  )
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

The rk3288 power-controller node contains an assigned-clocks property
that conflicts with the bindings. From the git history it shows that they
wanted to assign the rk3288 EDP_24M clock input centrally before an edp
node was available. Move the edp assigned-clocks property to the edp node
to reduce dtbs_check output.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---

Not tested with hardware.

ARM: dts: rockchip: Assign RK3288 EDP_24M input centrally
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/arm/boot/dts/rk3288.dtsi?id=df5ea015984633526874619ca1288fc5f2cf47c0

ARM: dts: rockchip: add rk3288 displayport controller node
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/arm/boot/dts/rk3288.dtsi?id=6df7ec6186644a4ffb4f0c859327ef41a1145a5f

ARM: dts: rockchip: add rk3288 edp-phy node
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/arm/boot/dts/rk3288.dtsi?id=f5663969d8125a5c5b7835812e1e636ecedf030b

ARM: dts: rockchip: move rk3288 edp phy under the GRF
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/arm/boot/dts/rk3288.dtsi?id=4b91545072ad7ca1963d2a89c8b42fc2eb561484
---
 arch/arm/boot/dts/rockchip/rk3288.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/rockchip/rk3288.dtsi b/arch/arm/boot/dts/rockchip/rk3288.dtsi
index 7e284b4fecdc..7477fc5da3ec 100644
--- a/arch/arm/boot/dts/rockchip/rk3288.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3288.dtsi
@@ -741,9 +741,6 @@ power: power-controller {
 			#address-cells = <1>;
 			#size-cells = <0>;

-			assigned-clocks = <&cru SCLK_EDP_24M>;
-			assigned-clock-parents = <&xin24m>;
-
 			/*
 			 * Note: Although SCLK_* are the working clocks
 			 * of device without including on the NOC, needed for
@@ -1193,6 +1190,8 @@ edp: dp@ff970000 {
 		compatible = "rockchip,rk3288-dp";
 		reg = <0x0 0xff970000 0x0 0x4000>;
 		interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+		assigned-clocks = <&cru SCLK_EDP_24M>;
+		assigned-clock-parents = <&xin24m>;
 		clocks = <&cru SCLK_EDP>, <&cru PCLK_EDP_CTRL>;
 		clock-names = "dp", "pclk";
 		phys = <&edp_phy>;
--
2.39.5


