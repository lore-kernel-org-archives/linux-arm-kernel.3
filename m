Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4534DC61DE2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 18:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AOdg97xUtxa8AhSsk3nKT5LmiSCoT1EL2eRC7gkp05s=; b=1jZrvb9ayhbLHWLophP6Y7MrlG
	GJqSKy6uhT5JTF2zABnh0T151GogRIoC7My3QP8B9wr8z0DYOwM5me/fEGzaSbkJtMy/Wi6g6ZGoz
	rJcRgR8DumnAmKJc6zBHgaslZYlaYRn4FoLfk40Q4MeQWkALgUyeMqbMChwjx4aabG8pUhOPZYk0q
	5zvgguCaZmbwkmq7A53uO0rdE3pCBdIT8VpjSIBO9tQGHyYgQ26nTygGwINGd0Qi6fuHCpLTPQs1H
	W5JZs4Vb8wKmXA/8xUh6v/EwAsL/SPfZZveTJ2S59pCRPuFVkYWO4j74bQXPPqABo3BM3P5n3Axwi
	jWqc63XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0k9J-00000007zDL-3J1z;
	Sun, 30 Aug 2026 18:20:57 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0k9I-00000007zCd-0ACE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 18:20:57 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-cbee846deecso3639788a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 11:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788114055; x=1788718855; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AOdg97xUtxa8AhSsk3nKT5LmiSCoT1EL2eRC7gkp05s=;
        b=kkliWZqTWukoe1Q/w3o7RCulo2kpqIsT++O8Wy/TMT3QzaZaZtcbMzxntU+WCT2IYe
         77fn5Fu/NfFsJkMH8+bHMV7DeGfpZ8epGSsjkFZA04rN6r38waJIIwqtEdRPTSMjhwcR
         B3OSmwUR9V8KXATxQ5bF2Swb6dZOnUTlB37Rw3XP6bD2hCl6OJ3cBr4t5bvEeuQ6xKVX
         n3uFmjvW4/qkWio4XQzc3FT/znogP9KYLhoik8QyyEeq60kYQb+HehRtpkIWnMGTMRpy
         P4dhdChiH3KvKnPMSvq6CLvBjn61F28+BFmzTBiLAMd2XuXmjQffuzNSVezvJHQv7rBc
         juHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788114055; x=1788718855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AOdg97xUtxa8AhSsk3nKT5LmiSCoT1EL2eRC7gkp05s=;
        b=JDidm95MY+lmFyJ6K3i99SDp0oFJ4HieWSwBywguEVHa9KKNNXiVgpzPmW7MSPcsgH
         Ifn3Ea+31xZTyR8+EMYK1yBbaSO6M8GUWKNHXmd4vHrx1Vb67iY3+NhM/UbLfkTcncpu
         B/ap9uQOR6ZIgXyn7Ekke9n2S9/xNei+rvm3FhDLP3dOOqTC7umnSe+PNeiLl+3yjA32
         7y2uK877i51cP3EuzvlFi7QuUTnDb55V541poWHpvxpuhIhkNCEO3YKUvnsMn0lTE69l
         u8CAivFDPZL5hDArnPAE6dWvjQc4MgUXPW5F9IM/s3eWw6gKMpaBghvB+eh0dU+wpX2a
         4UrQ==
X-Forwarded-Encrypted: i=1; AHgh+RoYIopYo+5JlbAhgQWidOh4c/Z73GXF2P7/FgocsT0s+Zzx5PWFIZsgunaE57EmsFC0UtE703sXSAO+m+3XNlL/@lists.infradead.org
X-Gm-Message-State: AFuF++n+aG2hMSLOKTi5m1UEFN5eWK2xGt7/waWh5wWq6G8YsO1ylSng
	rZ3CPxGTo4QI5uCMqQqAue5W+g/CGV75FZtkPyLujr4RQtUUOSzb3sdx
X-Gm-Gg: AR+sD13r4Y449TfrqazjJpRKFqALIO42Yv0356ySD3DUlcIbCqvUhHQ71gaQxyPUbT/
	n1nkRDUig/xFzkHBMPVDo2nWydv2tuQ1AumvRZ1BN8efViFFGlWh7iyK6ToGwrWyEg8+F1lKJ12
	vCpujelZBiSHFlzdJCZQsJB/K1fTa2WI+8SdD0lxuCZf2EZgb0oyQqfEo3wPTxyyZMZhMJG5j6q
	ycq/sFSAwC6zNLaSu0r51FHTxK/1Sg+x4nwfPi6z5EEVA6g1O7SgoePbTOAGmey3O2XrS4PeZ6F
	NHsST391ZccCM8kBPipAkWK4rA8C237cZjbQIQnhPl7ZyXl+k7gk/f5CsySWJ/22Zfjjd1Jgb/+
	RxGOwNatK6XoaoI9AOUVpu4gcYubyDP/VXS2iAASmR+251u2t9MkkxkfqScNQeks6Ml0fVIBRGf
	QDvsCVPjFS1KFL0T6hukLqdjowUiDxJNIPPyIVzwqkmQaDNYeeBouhaKO58BWTgrkjVYnTBrXdT
	M7sOA==
X-Received: by 2002:a05:6372:a80b:b0:3d3:ae50:97ce with SMTP id adf61e73a8af0-3d3ae5099d0mr18192338637.27.1788114055247;
        Sun, 30 Aug 2026 11:20:55 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f95a847sm21619480eec.17.2026.08.30.11.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 11:20:54 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
Date: Sun, 30 Aug 2026 23:50:35 +0530
Message-ID: <20260830182036.284736-2-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260830182036.284736-1-prasanth.padarthi10@gmail.com>
References: <20260830182036.284736-1-prasanth.padarthi10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_112056_088025_6E75D55C 
X-CRM114-Status: UNSURE (   8.75  )
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

Add the compatible string for the ASRock Rack B650D4U BMC,
which is an AST2600-based server motherboard.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 9ba195b8f22d..4c9e96801c1a 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -81,6 +81,7 @@ properties:
               - ampere,mtmitchell-bmc
               - aspeed,ast2600-evb
               - aspeed,ast2600-evb-a1
+              - asrock,b650d4u-bmc
               - asus,ast2600-kommando-ipmi-card
               - asus,x4tf-bmc
               - facebook,anacapa-bmc
-- 
2.47.3


