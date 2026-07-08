Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C107EC43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 15:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=43Zhfg5+4+Z1uzvRXKb3yHpIvITffod/8Jre6ZQvzL4=; b=tPwMyh3I+sS737nAuwd66g58mq
	xrCC/HTSKej8Q+2Rb5yK4pw2itiVHtfCPxlTlsHDOSuQWp0QMCdoWpj5sP8Q4fpRNFjtBM7SOgEQ1
	ivHonpYRtkvJrI3v6bo+kwGz5LvTCzeD7C6WG+nUNwF3A0DAWVzmYWz9zZxLW96wift05BfMTNjXq
	YnhxpXSJJZmZ9sMCex1QvJUEbh1MB95I309L23bI9qbXQlAcbVWwv5LwK3delorxEFaHYR/ij22px
	xrCGMBkKAO5WkoINGj4xyVohmJtvju/atwv7zfELo2XzudZu3BV1mepGl80gZg2Fe+0jNMqySEhtv
	G/coXDlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whUMC-0000000HUu8-1t5E;
	Wed, 08 Jul 2026 15:38:40 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whUM9-0000000HUrZ-3e5f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 15:38:39 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-4798bea72f9so605077f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 08:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1783525116; x=1784129916; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=43Zhfg5+4+Z1uzvRXKb3yHpIvITffod/8Jre6ZQvzL4=;
        b=ItOEyZ6AWdyNv2Kn+K17LP85CNX37qqUPsygEvhJR59WM0iZuvcQ3H7ottdKegWTrq
         UvpYCPBs7sKqOOwNuVOSKkMNxn5FzYgXm5+f1y52YNIuNUtb3yF0EAxiuEIBQKofVkAf
         4uu9fjlCEC8TpaDFIm+m0mrxRnc+pysdevNk8PvNgfeL5jcXmTKA1anuUIzaVR2YA/vG
         aoKY/PW5SHahOA3pZ/zkmoNGQGqRbC5t4BvUjTI2u5j/PdLObuuTD89H6FAUdwyi+G0r
         s1EGkhO3bD8ZZJipzYwsxTPkn8C69GwvL0MDbi3VmU9DWioBjP2WqDH21AQwJX4GQGof
         CS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783525116; x=1784129916;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=43Zhfg5+4+Z1uzvRXKb3yHpIvITffod/8Jre6ZQvzL4=;
        b=J5uVoUO4XZ9s1BsDrC9sa2aHN41mfcdi/bQE3p27mfBhP1QmuWsaF9BlTF64aV1iwG
         y5/oO/BN1qslWw+A8HysFWvzxH21VNx/wF882ctAO8W2oFpakIDl9cvLknSfQnzAKYTU
         DExpSJviF4JbO7IkwLAvduw8JAOZ9OWANT9UmlERyOt6tnaMZTmGu14FdYHhayt26zvK
         IG+fjSefcvSzmSp7lQdmG9M+hk1NhzEUWL2HSCOuDmQJp6o64iAFeoqzTL1YS7U7gQSo
         Nsj09iaKTdHJYWQ557pQpQnBSHQrREvSH/7w/GwV/A0C+5ktVfnuM2KXm88zb8kCmhGm
         Y9Yw==
X-Forwarded-Encrypted: i=1; AHgh+Ro22+RUa23ukYhe1OwpAbBNbIZPbH9le9D1B2K19R4wQrPQwORSTUuRL6ldo6+nwo6nvJ0SY22swbIWQEQ1kRs9@lists.infradead.org
X-Gm-Message-State: AOJu0YzrVh7IjmzimGM5jv2bpVto48DVNzdf1ANVZKo3Ebmu+/C13FP1
	JOBvLuYPUtGTEkhb4voyAhCcKbzqTg/tlVKzL3MggepQgaquxzfzn01NjgAgdyTCSDw=
X-Gm-Gg: AfdE7cmTOc8o9TYx7O+am55iOKnx4+vmoJeOSiQ6raQVuxgBLXyVD8kgDDcdBv7+U2E
	R5SqswNDLFRLQHkci0R4h3LN2a5oJeXMkvwux/wkzRaPQ6z351LOdDl6ZE1KVtIRc9q9McMybLj
	KQG0qPPuxA3cyjGWGgcYejvHNgsLHaq7eT2goKSKhdtKAur+i0X2OBVlvujay2sNVpcpt69K2AY
	sHPizO4B5+rkNbqZCEDMBrx8MaMnnWU+Mx5TRhpyWOPPnlIvs+vIT+YTpVkrkp1y/ZtZXrAiVuT
	cp1US+wJosftZrZPOsx7KQl8cbcQETNAhuK245SCIASNX74/EHRPEMvipyX+PFdfPHc+W34s3s6
	AAj+hX9XkRa5+p2UgUxGwz4aWwNT/9O2fMfQlokANnoTzMH6teV+srrIFkHXMVi8rFUQw/H6FXg
	2rNAu2aVavs7IrBGGGgTSpJTh9CLxKw5NH2mO8XR3oNP2pUWXgVssSsw7fCsG3MH2eJvq1EpF9o
	LYrG0TzDRdCDhs52q8AbfObu9Ci
X-Received: by 2002:a05:6000:2510:b0:477:80fa:f462 with SMTP id ffacd0b85a97d-47df075e2c5mr3515239f8f.35.1783525115919;
        Wed, 08 Jul 2026 08:38:35 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d8410sm44254136f8f.15.2026.07.08.08.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:38:35 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andrew@lunn.ch,
	jacky_chou@aspeedtech.com,
	yh_chung@aspeedtech.com,
	ninad@linux.ibm.com,
	anirudhsriniv@gmail.com,
	linux-serial@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v4 3/7] serial: 8250_aspeed_vuart: add aspeed,ast2600-vuart compatible string
Date: Wed,  8 Jul 2026 15:35:55 +0000
Message-ID: <3598f3d668717082adbffa5179b4afbe39b2a946.1783524645.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783524645.git.gregoire.layet@9elements.com>
References: <cover.1783524645.git.gregoire.layet@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_083837_923168_89DA1ECF 
X-CRM114-Status: GOOD (  11.90  )
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

Make the driver compatible with the ast2600-vuart.
Enable specific configuration for the AST2600.

Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 drivers/tty/serial/8250/8250_aspeed_vuart.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
index 26fc0464f1cc..6afa2f4057e1 100644
--- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
+++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
@@ -560,6 +560,7 @@ static void aspeed_vuart_remove(struct platform_device *pdev)
 static const struct of_device_id aspeed_vuart_table[] = {
 	{ .compatible = "aspeed,ast2400-vuart" },
 	{ .compatible = "aspeed,ast2500-vuart" },
+	{ .compatible = "aspeed,ast2600-vuart" },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, aspeed_vuart_table);
-- 
2.54.0


