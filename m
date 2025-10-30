Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D7DFCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 17:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=njsjO4VFZqA7R0pPo1P10WkBD8Q9L5cVjM6fjzkdhIU=; b=cnZnAeKCwK7vr9bMvBCGh53al/
	kF6aoPpVkTYiK2TR5RrJDKHNc/SohKIie1DSY3Wf16usYf8Q0rG0TzYSl7M1ZTUMODIccsz3ADC80
	nRCld7DN8ZijxYXO+2qaYM5VKOfWydxjMTDmlEvCpzTqHw+KJD4uQGO4V0P4ywm96w5wuI+g8vaPc
	FI5FAflb53tq0Sb9aXFATT310XEiHaXqsoUnp6ITL30sTotjHKuyn5fujFzhsusCbSe0c4zTIzd0L
	oTD22CFrbRh/onhi40LZIzuQANYGZbmqKlaUb/U5vcC731YX84oKTI46LkQ/ljrw31dVTQ0Pt0UqA
	mXfQzmtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEWpE-00000004Ypa-47qY;
	Thu, 30 Oct 2025 17:52:41 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEWpC-00000004Yox-0zIg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 17:52:39 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b6dc4bba386so25170366b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 10:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761846756; x=1762451556; darn=lists.infradead.org;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=njsjO4VFZqA7R0pPo1P10WkBD8Q9L5cVjM6fjzkdhIU=;
        b=GDdEvmqjULohlyQMuzk10RInXCfMfkQsAA3YLdXqKuR4rB5mrsSEq9AKmB32isFBW4
         qeUrKLTAIipVLu70K1HgpUwEqVtxq1XzcU+fbKXQ5qJfPfts3q3twbF7UwVUzWoOB6uK
         zjP1cFQKwfTG01+FRg7hcyTMiz8JvcXe/h2Y/qPSaWE3nWRYmI37sC4UdYxik2byy4vl
         P43Zeh1tDCmmqiUr7ljt01T5nEPA6oH0W8gIm6Xr4yZIg9+BX9CrYjjCfaKp390RkAOO
         p//BsmFfmnaubpKeCfyr8TFy97YWqmncRzzzl4eHNP9qyDLEwSF0m9DEhtlm6XQD5ba7
         vhug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761846756; x=1762451556;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=njsjO4VFZqA7R0pPo1P10WkBD8Q9L5cVjM6fjzkdhIU=;
        b=TP2q1SvBgxTYgZO1XRPnuFV0I8XrJag1P/iuOrE2v5BunZr0jjOrN/7yRXVXb2eILN
         wjEoIpaNebRzJPF/+YBnaCXSdXylvsMhh7e/ZI5OUVgRMEWKCa4NLDCbZHeHJhzd33JI
         cKeZ0nf82QhKafm6NBxTL9YArPF1/qiAOpcDwHkxW2mBVFIRHifuVexh6M7Z8YAKcli6
         e3ClQkqxq8FOY8wG1iut6CTUJQ4gXMQXd859+Y1QtFDWSseReAjRvp9/3VFKti4x5lbm
         MokdsghunYKuwSirNaTuI+NsriSXOGWCndUodsykoIDGHaAds1j+TyyYVaRe5siSsw/u
         X6Jw==
X-Forwarded-Encrypted: i=1; AJvYcCXp98RIR39nTJAPvJIJ56YHHliEy7gtmDNJSw11b73KdItafKU3tU3MzecWydP5IidwoXD6HyFxKojC8w0TIxW6@lists.infradead.org
X-Gm-Message-State: AOJu0YyC18z0pIf3DTgzC8hRgc2bLv7OCMlp0/2xT5YgR6Yao3f4PYa3
	4xbGYVR6CIp+Y1OUBxEx9vQGv3b6iIV9ms+G8GXkl3B/eoePiuChzi8T
X-Gm-Gg: ASbGncuz2jF+XP3x1xZG1hF74shPVY05cJbqK+bG10lH+9GI1EqKB0B0o5abWMVqPqQ
	gwUoMsLfmU/ot0/tzQjERrZT19NYIxaIntMK8xub4JEGr3YrfJF7bACJsMk31vCoi55HwaAVoFE
	xcOoXuuryWIEJlwzV8LSwslA7+SKEITIjBNm08GLPrlCLIMgnAhQqPcvVQVKRqtzviprarec+bW
	+LGzWUWfgiZRUfuURwjguRqI2MIO9gv9x0z1kxtOv3h4ylnYbEx2XJQmXh8mhISCFYovQR0393J
	tXOxTNSi/d5uUUffm6PDVa7fFqDrs7D6z5d96cQfWsQVaSRMJcWtnO9eoEWOCLaV9mzhkgM774z
	N9yPxikxjPMtiMZmRpVrPKuiCL2b2wEc94VTDIDCuDXdid3kqd6BGhE2Bukb1cg2GnjqQf/YWcQ
	cdpl0jo/T0hp4iK1VNhxwajBwUNvj9/yN5PDFsTLrqgQfg0eSbpg==
X-Google-Smtp-Source: AGHT+IHEjrjKgjCwmL8TWuOerIFvVWufwSPMm4yYLEbgFtGVI/ku0NlxLVuGe2f+k6tpzEbHXAXZQA==
X-Received: by 2002:a17:907:3e0c:b0:b6d:6d44:d255 with SMTP id a640c23a62f3a-b70700af393mr23224166b.1.1761846756003;
        Thu, 30 Oct 2025 10:52:36 -0700 (PDT)
Received: from ?IPV6:2a02:a449:4071:0:32d0:42ff:fe10:6983? ([2a02:a449:4071:0:32d0:42ff:fe10:6983])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85398444sm1778908866b.35.2025.10.30.10.52.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 10:52:35 -0700 (PDT)
Message-ID: <8a423a6f-bfdc-4947-aef9-35ee7c4f6ca2@gmail.com>
Date: Thu, 30 Oct 2025 18:52:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1] arm: dts: rockchip: rk3288-veyron: add spi_flash label
To: heiko@sntech.de
Cc: robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_105238_289993_6FA50CAA 
X-CRM114-Status: GOOD (  11.42  )
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

The u-boot,spl-boot-order property requires a label at a boot
device node. In order to migrate to OF_UPSTREAM more easier
add a spi_flash label to the rk3288-veyron.dtsi file.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---

https://gitlab.com/u-boot/u-boot/-/blob/master/arch/arm/dts/rk3288-veyron-u-boot.dtsi#L10
https://gitlab.com/u-boot/u-boot/-/blob/master/arch/arm/dts/rk3288-veyron.dtsi#L267
---
 arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi b/arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi
index 260d6c92cfd1..2d6cf08d00f9 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi
@@ -388,7 +388,7 @@ &spi2 {

 	rx-sample-delay-ns = <12>;

-	flash@0 {
+	spi_flash: flash@0 {
 		compatible = "jedec,spi-nor";
 		spi-max-frequency = <50000000>;
 		reg = <0>;
--
2.39.5


