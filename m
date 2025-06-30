Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553F9C8302D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 18:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rMkTHKD3jio2hpq8BtE0DToF1CwksemxWLN6Z8dMYEk=; b=krUBZ80xpl3+wRyvq3Y3Wv712j
	nJFDzAdBRwZNzEFzZA+YWnwKnlpQ4wjN1Q8NuUwxkgFTSRyrpZUQGkgBRHhDXr9OaR+F3WQ+ZqIUg
	QoHscgkNQzYa/kjF+g0mlsrlKIcGHIPQrPCz9DDsPBWU/VfCyT4PhlwiD6HgOkOIr0oiHdyKjc2HL
	P/DzFyOyIupoe0tQ9EFk2ceAcxF39PtG/Jnz9DNflpdTMaCEMNVQgmKHpNczqF0onXXB6rYz9ZJNL
	7VI1uyxcgi6+oLO5n6OBnhHCovsAoFGKJzrbvHrZrVSybHZSOPothywFlMjaST3IxTzH3zL9mTczZ
	NjOGxOSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWJT0-00000003DkS-0C3L;
	Mon, 30 Jun 2025 18:42:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWJ9B-00000003Bou-1e82;
	Mon, 30 Jun 2025 18:22:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rMkTHKD3jio2hpq8BtE0DToF1CwksemxWLN6Z8dMYEk=; b=mUz7NqgffV0rYPh3ZnLwvJkEpu
	0J0LuhLwsePTDDo35/na7mHRt9ZIwvrSorQoLAIw8OacoMDEuj3HUm8PBstW43g/LDeaDB+DwmIrU
	Jhx2Hr4BHJ2TtYRHPyqk8TOH86aK6tBMHiWP1z1bekinaaaB8iZh67Rp3UJg3WWd06qilocV9f5Nk
	cRnxWgodAByFMsIyf0oQb1w9GbGtiLss3+OU1usksRezvb4Mxxm890rnCJVG2g8VUELO++F6Se4D5
	ZlnmNbIAvUXpR9fQjZmf7Yg5CuS+UwPUqDbwxID/vt8yfxTkjKKa4OLH97c2Qj8SPwnWzBNix5ynG
	mmNa7j/A==;
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWJ98-00000006rIf-1pYh;
	Mon, 30 Jun 2025 18:22:28 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-700fee04941so16189756d6.1;
        Mon, 30 Jun 2025 11:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751307744; x=1751912544; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rMkTHKD3jio2hpq8BtE0DToF1CwksemxWLN6Z8dMYEk=;
        b=V7v7wMwphrsIT8Rj/6jaXligTaOt/zIBNKM+Xkmf8B5ZEX8XDPVnFhL+mpv8FS9ZlS
         I6kjK9M8VqzP+VJGi/VUP9uYpALdbnZeMG2TPy4URy+4bgneUJLoS6tZ0H7fcX/NmrNg
         A14gozA2kYOGgimxHO/bQMKI0ldqp+GZjybv50TjU2j8+nQQTF7qzsRg594ZZUUUWn0Q
         uujotyh+CtHJqURW7XDoWCNboBzh7YjmfvcenOjThPJ9PaKRBtyoVoDzIm9g2QM8kgIG
         Gb8pa7/HvJEH7cVM/Lr+Cco0OxsLnfjKiGoQGQcHVcILNB3tf5cFtRWs1htbJ1hqx99h
         XHVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751307744; x=1751912544;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rMkTHKD3jio2hpq8BtE0DToF1CwksemxWLN6Z8dMYEk=;
        b=tKM2O8O7Q6Slg7O0gAb75AUsMmM9hzy/AlXMFvQRR/AzeZNLp0VMUKGprqTNrmrLLi
         5U54gd0jFm+w2sx6cv6q4sMaamAsmnnzaP4/ChcArswU7mPt0FFD/EizWK/4X2vlMTCs
         at/EJ7hcpFlBM6+1GzmDHXvdO+EDGZZB77O9aEdSX0xwyrhVLjehm0dO386pwf8Bf9Z0
         l7rPkVXs6xNEoZomqbE27ow2N63AwQFv9It1xy0Ek3A0SGNytw/qx+d6t1AfE84iJhBi
         YmqGZ0JPQslGbVjDOhXutOqUrgXSWmhgEa7yxdcYS8aoDGygaPLys/3+/sEBdjZ37rY0
         bQyg==
X-Forwarded-Encrypted: i=1; AJvYcCWcjqDFyyDntQiOCDsiYEPsb+FH9TaZ4pcVNAMq8mlhS8+JmTRRAohOqE2nZ1RXhs/mTDDpOHMhhnfk@lists.infradead.org, AJvYcCXDH51P2YMsbdipCVvaz8WOCGDjPDFDduZU4vnUR4Da6W1CdOCkfjfbdIQR3qQPdXBSMDoSq/oevDa4uIIaXCcS@lists.infradead.org
X-Gm-Message-State: AOJu0YzvlAai94ygY01GYOP26+BPNM4sZhtZ2nGQtFpw7zZEPHcXGDUN
	sUcUsgZq3sBFlgvRzwVvDxT39a6GGswtkAEOfojzEKMLKijbfXTx78cGz9eVQaQK
X-Gm-Gg: ASbGnctUTRB6lfXRNThDNH/iXFRzyNuAOYGQ4qwaHEFDZA7B5f373SLx5VJf3pizIGt
	5Dj2hkJBHwaVD7sAiKA8EXoXPelA80paNMzNVOfi/x1Fh5lqfrgjR6bgmxjmd91fAoYPqo20cWm
	3NwpFcgqZ2FK/eFb6HAsxsWfHiOpYRjcLbaoSgRLnpP6OqsBXuxRfDRoDD2t1ZFGv1bPojwgpAb
	Cm+RjKsKCCnK2ZirLj9p19aIqMZE6GIC8jHG3v52xIRkOBJ6gKbjuz4wY6G0i0U2Z++YlZyeMdp
	bSK/Nf5BB/Q9JNbuwbXyQhMZBWBX9uV3v1zTHM3RT7zo27k0eaZTvY2Jvq0p
X-Google-Smtp-Source: AGHT+IGiwj5LxtClCIDG815VfHCCgo1NQzaiahcgS1gasNLfX8v0zIb2JwxXV6ze0QIzIZrdOwwtAQ==
X-Received: by 2002:a05:6214:468b:b0:6fc:ff41:8eb7 with SMTP id 6a1803df08f44-700035b783bmr287653906d6.31.1751307744228;
        Mon, 30 Jun 2025 11:22:24 -0700 (PDT)
Received: from geday ([2804:7f2:800b:4851::dead:c001])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd771bc01bsm70953466d6.40.2025.06.30.11.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 11:22:23 -0700 (PDT)
Date: Mon, 30 Jun 2025 15:22:17 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rick wertenbroek <rick.wertenbroek@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Valmantas Paliksa <walmis@gmail.com>, linux-phy@lists.infradead.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 4/4] phy: rockchip-pcie: Properly disable TEST_WRITE
 strobe signal
Message-ID: <ec6557ed50171594de5297d46dd5e2c96c2459a4.1751307390.git.geraldogabriel@gmail.com>
References: <cover.1751307390.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1751307390.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_192226_605407_498B7F95 
X-CRM114-Status: GOOD (  11.30  )
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

pcie_conf is used to touch TEST_WRITE strobe signal. This signal should
be enabled, a little time waited, and then disabled. Current code clearly
was copy-pasted and never disables the strobe signal. Adjust the define.
While at it, remove PHY_CFG_RD_MASK which has been unused since
64cdc0360811 ("phy: rockchip-pcie: remove unused phy_rd_cfg function").

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 drivers/phy/rockchip/phy-rockchip-pcie.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-pcie.c b/drivers/phy/rockchip/phy-rockchip-pcie.c
index f22ffb41cdc2..4e2dfd01adf2 100644
--- a/drivers/phy/rockchip/phy-rockchip-pcie.c
+++ b/drivers/phy/rockchip/phy-rockchip-pcie.c
@@ -30,9 +30,8 @@
 #define PHY_CFG_ADDR_SHIFT    1
 #define PHY_CFG_DATA_MASK     0xf
 #define PHY_CFG_ADDR_MASK     0x3f
-#define PHY_CFG_RD_MASK       0x3ff
 #define PHY_CFG_WR_ENABLE     1
-#define PHY_CFG_WR_DISABLE    1
+#define PHY_CFG_WR_DISABLE    0
 #define PHY_CFG_WR_SHIFT      0
 #define PHY_CFG_WR_MASK       1
 #define PHY_CFG_PLL_LOCK      0x10
-- 
2.49.0


