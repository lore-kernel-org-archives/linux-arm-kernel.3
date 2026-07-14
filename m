Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7996EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7746hlY1VAGyI9teBFqCgeCZQpUtScgAKDRj8HL1cDA=; b=2x3dMqJIsZdcNLiiu+3udOt4Vy
	NP8jTY588xScUetKChlSMn9NJFazlvvmJiSMaWJG/xcF7T77av1tPKGa/g/Cu7j2TkHCJVrhfPefk
	Ux1PaU4ct14Ubl+l5kn8bN+BIhJgnhf8w7FQVjlreqdUY2ETsIHkLNRvSRKd0RYYMylJFhdIcknlt
	3y9fVTMDsnImXiM7zQz5JB132H8SLSI8eTSfY16vUBK6/PLVmQCAx0Ox+vK87qkUf0fsm2u+UohpZ
	WfB/qjfVTRvuxgpZLHguXD7X/tgqkx5SHaS0ztwa3VRLaFOMeFNegiZI/nPC0KVZLV9/lbBMX+Kov
	N1VqJ56Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbw7-0000000BrZk-0QAH;
	Tue, 14 Jul 2026 12:08:31 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbw1-0000000BrWy-42go
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:08:27 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so4378582a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 05:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784030905; x=1784635705; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7746hlY1VAGyI9teBFqCgeCZQpUtScgAKDRj8HL1cDA=;
        b=VnlZa+WvS6ZdHXCnYrJXr7ItbR1/kkGrb0Gb6rl+1MtedapEQsEwUF5d+vGoZdFnGH
         47P4Y7JFgVofzFHhonE9Jp4qq9KsuMS40a39P4+9lOTAa9xPhSZN6fP54S8GKm6TtEIw
         Hf5Aqxoo+KnwvpkvsJCeK8DlSiUL9Kq/d0HrDzk5qr5V4PHe+1IzaUOrdDvLZ32kdR7D
         uN3dl04QS2zThohYzmA6AFQP8HQ6Cq/FhBQ0amyJ/Jcb4HB4qJzs4U6F3gIwuesxDOuc
         zlv9PsjycUVb7XHU7F4CSlydlH+k0CSTnDNK9XTLMlH64M/MKJSCO+PkPmbhukDB4p5Z
         pH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784030905; x=1784635705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7746hlY1VAGyI9teBFqCgeCZQpUtScgAKDRj8HL1cDA=;
        b=pejmUUaf0B0JlumooAhs6C+nDpubMI/AGCP/XeLCM4WeMYbZL/l7P7REhmlH6GACwL
         Z8slqzfVNpYGtlrJpoh5HOWCmEoJfc0KQdl290Zcwnsko/TjRWDgWbCBJV5SDNn8+J9q
         8KYKTfXYWqQVcZq3XRAj+8IXafKC9lLB/ycRou/eKbHmcvGSXUXPstpqGUn330l24WyI
         mxQ7N3Ul4hjQr8zWB0knxIzPNQrQgMZGwsAYPcUFoMeug47Npal0WN/TnxIMXxw+UbF2
         IS4+vTqlIr+Onm7qBygajExDpZNqqPU030HZnEtwSIy23Kq64v47jLH/+bxImWqU/KIJ
         PX8g==
X-Forwarded-Encrypted: i=1; AHgh+Rrz8njxgu0W419LWEUOI6hhzK4nkJKvfLsxal+SKG9fWOA1UfOxLqO2mdZHHoHVmPv6XZ595M4i1fsoeYI8IdAx@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+Qeo4eZZWDWKSrFB2ePpkuffUV757SXA1l3+hfke9dCPI1dS2
	iCK7675M2M67Zi0uJlX4W40Of848UFMvSjlmG50s85RlhBl8QUTCA1sD
X-Gm-Gg: AfdE7ckPEBLxB0IFWBmx4aC423DLYj3D4VLuBsg+/IwWCxqj6XZa7ibYkgaLnUKka83
	gL79OS8TW0x63bheTlTobxBmzX7ngXIBHqGFTZWAcg05M7klauLZ00KR1Jq2MR/eo8HZkgGJ/c+
	/dlsJ93NSYrVflTEQaR9tO9b+GPbcu+55eCt65rHhBR5CirY16xRlODM47Am4794cknQJtV8f/R
	qk6wCfUxFvhvak3W5mNfG6Dp9n9suukgOpx7/xY1HYbKgreq0FbsZVg6lKaR5vzRRw0hftxzeZI
	3zcPf2ltRK3NEZ4MozRzdJia8aAgdfj2ceZyNLRkybfrqzg/WYFXoZoW+XtitEWRv5DLOGhNmuo
	LDOciAu/nLk8QiYjco0Sxhq4Evumb+IoBXLGzMBo9iFOsgyWnO0oMnL61SKDq3IpZhEe294ogib
	RroXHAjcA9l/F2fa4l6Mtzg2ltr3sEodGyr6KPuas9FCd0MHEqKJeGVcTHw88=
X-Received: by 2002:a17:90b:1f8e:b0:38d:eb10:6f01 with SMTP id 98e67ed59e1d1-38deb106f50mr8733002a91.4.1784030904950;
        Tue, 14 Jul 2026 05:08:24 -0700 (PDT)
Received: from cosmo-ubuntu-2404.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e172dc530sm1384425a91.8.2026.07.14.05.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:08:24 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	cosmo.chou@quantatw.com,
	Cosmo Chou <chou.cosmo@gmail.com>
Subject: [PATCH 1/2] ARM: dts: aspeed: bletchley: Add second source ISL1208 RTC
Date: Tue, 14 Jul 2026 20:08:15 +0800
Message-ID: <20260714120816.1504058-2-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714120816.1504058-1-chou.cosmo@gmail.com>
References: <20260714120816.1504058-1-chou.cosmo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_050826_017691_2562471F 
X-CRM114-Status: GOOD (  10.41  )
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

Add alternative ISL1208 RTC at address 0x6f to support boards populated
with the ISL1208 instead of the primary PCF85263 at 0x51.

Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
index d1a04b63d..a966be69f 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
@@ -865,6 +865,11 @@ eeprom@56 {
 		reg = <0x56>;
 	};
 
+	rtc@6f {
+		compatible = "isil,isl1208";
+		reg = <0x6f>;
+	};
+
 	rtc@51 {
 		/* in-chip rtc disabled, use external rtc (battery-backed) */
 		compatible = "nxp,pcf85263";
-- 
2.53.0


