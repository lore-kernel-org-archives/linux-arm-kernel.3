Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FC8C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 11:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gUdqR2Hxxm0m0RqPyLuS7KiUs0HH+0wvNQWmKBLU3XU=; b=1nPOGW65ZVFQ8CIuT3AigqkZ0/
	pcJi3A5J7kbqprJrD5IqwAiY3Q/NQ0U1UyNuOSUf6svKGQQsHvQ5HDje1wYV1nXaQf8IL0NG6DBy9
	qrTt1NQUIsnnvDPrrXXsgWu9aX0PLkEgLPDx7fM5g2M9Eg+2Uo6teTi6AKjqUbBq18m3v12WiEvTe
	saLu1sWQc/8M13ngAO+NenYs+wMEkZFOAwGzns/Pcm8ok1G29B2bbSePTdJgf4KtnvRfmFGplcBCL
	tyUhe2SuY00DKQY284t+1Pq/kNxoD6gn9INjIRA3ELQ5MpmxqgwaMLK70qAj0xrWB/tI10FEBf9I8
	8/IMgyAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp2hA-00000007lUB-0DnC;
	Wed, 29 Jul 2026 11:43:32 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp2gx-00000007lMs-0NYH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 11:43:21 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8487088510aso819503b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 04:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785325398; x=1785930198; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gUdqR2Hxxm0m0RqPyLuS7KiUs0HH+0wvNQWmKBLU3XU=;
        b=eJy6oq9EoppMbpVpJ5uWlI78Hni4JTEKkQSyNCRtUOTbm4xolerR97nbTgOeeI3LkF
         UsMJYm4/jHxafenYppg70qG6EfCaZQJEqVFE3lA3qCx2Qv8NWQIu2enPcOjwQOQZvxwZ
         aJMHZeVSok1kHKGqPJH8gORUiDtqHbkhx7SBNUWVXkIJaWKL7oroP9ByjK1OsP/68teW
         f9iRTZMnhm6HKIwnIoZtrnOu3T0+Tcoxu5/My1Mezfx4TbV1ywcn8C3EgWyqcJnlv8Lb
         BLKkW4ojeNSJllWnlG1AcmtScC1q9rCaehuXluIDw7sdx1XygEILKV3SKShYUz/MLyZF
         uPrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785325398; x=1785930198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gUdqR2Hxxm0m0RqPyLuS7KiUs0HH+0wvNQWmKBLU3XU=;
        b=P/3rpZU800RQequDlgK1YbpU2JyGrNXwCDcAMZ7Eh0r3HgTPNr8rMX2/q8ABiiZ1PG
         bs4lpRG1om86szuNodwPhWa0GE5jXs4MUG7eV6sQOqkrytlSGjRLXiAJlJ2LdLaYp4Ms
         NTxvzPeEMjQDBZTHHyx8hRPNS+xxNyKOGgkuM09u/50NB3mjB9Wx//+3NTVQsG3qZZVf
         sub/Hi66nn59FOW8oFvdylnIzYHCeh+a/6Jy7OIIPkTjk827qBhtZ8PnBZyTuemSfdpD
         IhA1TWOc3UPzWXLtoZFAOZK0SuWKGOjn2zNrU/FKMa7Fj9+LGaqj3BWR1uyPJFEaJpiy
         cYSA==
X-Forwarded-Encrypted: i=1; AHgh+RquQqgVBJY1QlQd0F6F2Zlycae6fF26OmgB0bIYufEl2AH+Izifg8lKuJo0l3HQGUnI4Mlc4ONiW0s1vIWADQ9q@lists.infradead.org
X-Gm-Message-State: AOJu0YzXzc32OuqZGboasWj4kiFy9Tn6PPDT9AlJbtD6rq/hazrSKncd
	GMVtAePcXQRRjUtTG31Eu4hRR6qNzDG4iEmPiTz5LNNDbOp6dZbyHACv
X-Gm-Gg: AR+sD10luswkNbDZ/bHbNssWVEvDsjrHrqkPbgw17LrDT1PnOerMfWOz1Bjltwv1hCz
	Vu3mqfYESS3BcGovW0+Xh2tNclCcTayCb6VT+8tZaiwR/oOyYsMqTwr/VSZfkERdvj9wC++ALYp
	pcGuWMM2F3k+SYM+sgdL6FP1SUm0g8+5xd9egaocCLRTc81w+M2OaV2b3HiKMGISJt9jhhDVhyM
	C0afgUGH5WsTbrBIsh+QmPer+BbT4NvhtIsxKWZf8+Ycw4FU6C64HAWMRp7Vgs6ZhecJLF4hjTG
	beRzQHaV4RPPWOifnAimIU+IjpVm5ByJU4RQkyPHn/hbGfcJSp36wB0c7PAly4lSA5dEdJqV/2s
	onuoK3hrAMyq63sjNMrS2r9ymD4FnSKwH2DGNkIBSm8xS4fdKIi7NiJ/HMlpzmj2TZs0qQYvfTx
	fKdLizQxA9/1B+vS0/s2nwLKwht6SyZ3K5e+Lotd1D3iW8EgBSmDM1HhEvIdD8PYcsLk9GrMyWK
	a3dCYKSxeEJu4sbImxNyleUnoaZio11Yvg=
X-Received: by 2002:a05:6a00:2e84:b0:84e:1a9d:d879 with SMTP id d2e1a72fcca58-84e93246ae3mr6928584b3a.28.1785325398098;
        Wed, 29 Jul 2026 04:43:18 -0700 (PDT)
Received: from cosmo-ubuntu-2404.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea03cbd1csm1263532b3a.53.2026.07.29.04.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 04:43:17 -0700 (PDT)
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
Subject: [PATCH v2 4/4] ARM: dts: aspeed: bletchley: Add second source ISL1208 RTC
Date: Wed, 29 Jul 2026 19:43:12 +0800
Message-ID: <20260729114312.3947300-5-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729114312.3947300-1-chou.cosmo@gmail.com>
References: <20260729114312.3947300-1-chou.cosmo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_044319_921238_4DD5A57F 
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

Add alternative ISL1208 RTC at address 0x6f to support boards populated
with the ISL1208 instead of the primary PCF85263 at 0x51.

Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
index 3da1cf9bbb99..01dbbda3e4b6 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
@@ -1269,6 +1269,11 @@ eeprom@56 {
 		compatible = "atmel,24c64";
 		reg = <0x56>;
 	};
+
+	rtc@6f {
+		compatible = "isil,isl1208";
+		reg = <0x6f>;
+	};
 };
 
 &i2c7 {
-- 
2.43.0


