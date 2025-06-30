Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1474C8302F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 22:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rMkTHKD3jio2hpq8BtE0DToF1CwksemxWLN6Z8dMYEk=; b=2hpl/AWGhDmGM3W3dvljMEnYsQ
	dcHOkgupYKwLXMN77oTiofVWgDzNHWw0nPLZW++h/iZiTV790wUhVQlUeeoaujWDXoJ2dpr0ohqON
	4jBqXGFZwhOIN9N6GDRmJer1cLjetb9ecugoI8dCWj1SvRMX9xZ7N03ZrvhOF2KUc8R3ti94Lzo+H
	162zkdkNrypRHfH+Va2hhAqgP8AefqSHu10MYQ2QFO1JDrsqG3gHu4rin2eTguv1Y17FD8yei0WjK
	MQsvcPEw0zVOS5B4x7xHaN4Gx/nJf0fNnN3Z7/d1ym1+j3FoObWHRcHbxA9KruU7AT5rhVaIZj/y5
	46JM5miw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWMhV-00000003Z48-0xNA;
	Mon, 30 Jun 2025 22:10:09 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWMU3-00000003Xev-3qIQ;
	Mon, 30 Jun 2025 21:56:16 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-6fad4a1dc33so25202076d6.1;
        Mon, 30 Jun 2025 14:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751320575; x=1751925375; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rMkTHKD3jio2hpq8BtE0DToF1CwksemxWLN6Z8dMYEk=;
        b=KyeX+uF7XU2IzmvOmBJl8/Z8kNmks7JZNBb0JwyojumdjirUvaiGwgZqgmaMsYDekP
         i1dNp5QgLQlalUevvz3gh8ZGfRg8F4CaQnGM1Juof1/qGRlWrlgfLiq8lGnvG9FMdPbf
         YmfJIJgXpYXqtR8quWBJa7qyjWnPhEL4Wrun+2lAcD1uxl63U5ZateooPK64YNuo0vp0
         E3fwzpR6MrqTRjuSNFzeQwgtrQO63NyGF13ZgKI7mq86EhD2tC46nTXVboUqKO4nFErq
         P3cBvcQyYtztyuXDTu8cDUyjonBb+VwFOYaXybNrfVg4Q/NNpz86qVQbj1XQXxjvijAa
         w/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751320575; x=1751925375;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rMkTHKD3jio2hpq8BtE0DToF1CwksemxWLN6Z8dMYEk=;
        b=RG57iQGw32ybp0WpVDuBKU2wtHIeYjaJeUoO5kIihisapdIFyeLOBFf9GAf3LIiGcs
         828a1gOPOaHSYQrEN6O4k2G+hWLvYTa7n+1zd0CKs6teTDVGuBRJ/kXA1uRp+/CAyDb2
         JwtVBF4JkwLuxGwcDFobJ3AU7zxSPp+BXs+6jmHyicfMzjq5PVzBF+1xS/Fz9J3a5Cpj
         44FmYvtWZGx714bJxdN18KELjNF9x8u8mHcZMQ1CGhNQ/rg+mSHvbLtf0Ppzbstn+ZiX
         usOTDVj86VytgbgKbI4Qlyk2srRjDuUMlbaJiS4Kt4pK8tnHuaRc57R1KreVQbblHc1/
         nX3g==
X-Forwarded-Encrypted: i=1; AJvYcCWfKGap/RmBVKROvr+JJ+1YEXHpxcUM+luFZlS8GZTBJxkJJhPEd0Eg8A3OGCusDhEuiZOzwaeWa/Rm+iGJNcN3@lists.infradead.org, AJvYcCWlTsL6oBKoMzItzhBsJ8GalGmZYXiJQp/cnAgGt/rmSALzb/X5XXH9b/P1tp4QwTIo2fLpDBIL+xV4@lists.infradead.org
X-Gm-Message-State: AOJu0Yz14dEyY+m3x5vdAQwbCp+Wcb0Rvzy8VQvD6Jd6uN451dEs6NO4
	hBl7+hKvXKkZx3rUQFoJ4EUS43rX0N3eEJzfjqQ/I3oor8VKZtx//EYSZ8txX9AQ
X-Gm-Gg: ASbGncuBEc01Is9+LTwKBHC0pCM1W0v1eUzZsA5lRQc+v9A0JqHfsqYuG4GumxEJmvu
	/65X1eVC+UoJwUsjU1XxH9mY94e9QeJ3sGF8j6dDXWFfssu8mLg3eoBD7Xl1CC6Mn0JlCxPhz3b
	tDx+b/a+O58n3DTb5HCDTRoSzI+og7tFKfmIBljwbHHl+b3FHTCXacQs46iC5dslrXyIi4JTQ1R
	0YSo27RN5NgLzqdxcBL0l8Yr69HyXWT6cg38xTv8k0YoaUQvU3tNFFzkatbhZxYDk/tyMFvQAHM
	uYH0YLf5+bkOyh4FcixJN4DTUKcV0mw0eKvxMdLSSHDB/r8Eqw==
X-Google-Smtp-Source: AGHT+IHlwnZKtQx0c2S3ULgdwUmNGv7rh1cxRLFpfUvaYKGpyKAJS0ZlrmwkemijKiLME2PiK3LvCQ==
X-Received: by 2002:a05:6214:1948:b0:6fe:8c28:f3af with SMTP id 6a1803df08f44-700131c4c3bmr220986626d6.40.1751320574701;
        Mon, 30 Jun 2025 14:56:14 -0700 (PDT)
Received: from geday ([2804:7f2:800b:4851::dead:c001])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd771dcb9csm74286306d6.50.2025.06.30.14.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 14:56:14 -0700 (PDT)
Date: Mon, 30 Jun 2025 18:56:07 -0300
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
Subject: [PATCH v9 4/4] phy: rockchip-pcie: Properly disable TEST_WRITE
 strobe signal
Message-ID: <d514d5d5627680caafa8b7548cbdfee4307f5440.1751320056.git.geraldogabriel@gmail.com>
References: <cover.1751320056.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1751320056.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_145615_946570_B2E93566 
X-CRM114-Status: GOOD (  11.46  )
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


