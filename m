Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FCFE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 03:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u9GzOqSFTFut+M0trF5n5rtYW7iZuRD8VsII4Yb9qIs=; b=WWXC4ebtpQMwl9
	oRyvbCIfS6Bml5btnwshbCHgQEkF7vTvlVm+X18etdA5qx5dF0B58Iqk1iGir4tzGZOrQ/l0tpp/w
	0+hg4BZ9nP9UxGdN3UfBtdMmXaw2Mbmsvh1UZWH4yPo5I+mz6hTVoHd34zfkjCfeUOkzZSuIu16ys
	U/oofT/vDas2b0W+1i8Wfe02OGa9f+CMUjf5A7JMSJEpVdmzf+Pp6yUtibunD3G9GiSQfd0YI1EbS
	YwfYLebmEaNPNdQPLIn8vttoApz+YzNdYloPmyEXPCPE0gykrFSby5YUSsAQg0W7cHDI6rKmUBJa7
	gWvAoxSDRl8+Af2KP8vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tR0lN-0000000Gvrr-1S2S;
	Fri, 27 Dec 2024 03:11:45 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR0kA-0000000GvcL-1YwW;
	Fri, 27 Dec 2024 03:10:31 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-3011c7b39c7so81021811fa.1;
        Thu, 26 Dec 2024 19:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735269028; x=1735873828; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u9GzOqSFTFut+M0trF5n5rtYW7iZuRD8VsII4Yb9qIs=;
        b=S/6RRsFJ9FTRGqnNKIaUICSfxQ0+FPiVx2zNN9gRVJC2Tl0eB07WWo/Ov9L7wcaQvw
         1a4wBSGQZRpMn2/314g66mus7J40znVyEUEIyP9uZRK8gGYY5i3P/q0UW4AZQfGHKd8z
         M74TShSS2IGhzE9kYUl1YZIhywluBy+OLFpfOkQ8cA+h23waEN3Dgfnbdt+8kIllVjRA
         2U4MY1uZPdc+w7pMdg7zY1SCifHiQTuvJkcLszQ+3W7EPe0oHxuwx26ZMmMVRgKAoKSM
         yOKeORJhzO0fHtZ8HHGHlF77tOEzYL2SJ8RcqWju7CxbuqpKDElEHKPcmQ5x3W15mzGs
         GLdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735269028; x=1735873828;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u9GzOqSFTFut+M0trF5n5rtYW7iZuRD8VsII4Yb9qIs=;
        b=ZmGkwW4qXJ7a7gnqm1YxBBC43cuqTY2UUOWWG93afoiT3q3pDaRMpnAMKRLj2bn1Zd
         LthSQtBZhyiQ2N7u3Xz5xhkWhYH/gFfbLbkw5CdGDX6r9JJZYN60UvBzpvTV2v81b9AX
         Koz22JcClxgw+1Vt2dAQ/oaqEDAI8WdEkn0SFBevhF4ycxRUMRWyJGF3ACxuFsk1WCbP
         MLzb/fxTXv74UVOD8JAuugn3ONFWWjMfiMcr5HGqca+CxtZ/O+/leGgAU88XzMJhXado
         n2ezqDIopEns8vxPItDZTNu1P83DXus1VROLGjBHg+fWh6UIQq75rj/q0vDaoX9pJTY7
         ukqA==
X-Forwarded-Encrypted: i=1; AJvYcCVcVPDu7iccksU+INduqbc/YhLx1P5v/MZozJUEzPkSH0SOYNGG67i1HTibw8OU/GTRiQdiCEXFy/V61JQW3H3U@lists.infradead.org, AJvYcCVvgUuR6OIiGGBf4MoukWpSuMnmVNQQ6hWBkx+59GxwMIkKIdEwTyBuQr4nv/+ytvb56YxixntPTCUfk6/M3I0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzLFq5H2NwOUrwShADCNMw+xLCov4JZ7rm/fZWCvNM/SpSRAaDl
	YRCqgmmA84Fjn+ZrPX4hoyolxJ5lozuyDk4pGI+SUi7zx8jYXGE=
X-Gm-Gg: ASbGncveMAWnL207JYLcK91L7zbRMytDAp4Ad4zoGapsvFhGX/5y9O7rWLxrDeeJtf0
	HmvAIZA1OcZGaG2NaxVuwrg5P8M8OJP/kaI9Tl4xjg2ZZwu7NYyQA0H5pttQQQVwWMi7N3dWpp1
	DdoImnobVy1/IZVHQ/W5ZZ0P2qIN88cA6doyLAUyQhBEBGbs0xs7l8QOXisqXzixRF+iqzD6htU
	W7xG6VPYhvhqIWiPA4Zr7+B5E4C5KnbBzJSVt4LTO17v+pnzSUPbM6lOPc=
X-Google-Smtp-Source: AGHT+IExyyy4jgRB3UWLgHTsEeFRs0/I8P7gVGIIOS5qg76b9sHxaxSVCTtLynrzkX+OeGPg7e1UAg==
X-Received: by 2002:a2e:a701:0:b0:302:3021:9b03 with SMTP id 38308e7fff4ca-30468567821mr64398891fa.17.1735269027581;
        Thu, 26 Dec 2024 19:10:27 -0800 (PST)
Received: from JetTurbine.homenetwork ([2a0e:e6c0:20d3:2100::1d])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad6cccasm24326141fa.1.2024.12.26.19.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 19:10:27 -0800 (PST)
From: Ivan Sergeev <ivan8215145640@gmail.com>
Subject: [PATCH v3 0/2] arm64: dts: rockchip: Add BigTreeTech CB2 and Pi2
Date: Fri, 27 Dec 2024 06:10:12 +0300
Message-Id: <20241227-bigtreetech-cb2-v3-0-91c556adcffe@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJQabmcC/x3MQQqAIBBA0avIrBNyHCK7SrRIm2o2FSoRhHdPW
 r7F/y8kjsIJBvVC5FuSnEeFbRSEfT421rJUA7ZIBpG0ly1H5sxh18GjNr0j8pacMx3U6oq8yvM
 fx6mUD4afMxphAAAA
X-Change-ID: 20241224-bigtreetech-cb2-18944b349916
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ivan Sergeev <ivan8215145640@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1789;
 i=ivan8215145640@gmail.com; h=from:subject:message-id;
 bh=eEZPMqnFAFZL6U2Nau2tHWImP2Mq85i2tQEbvcKc10U=;
 b=owEBbQKS/ZANAwAIAbzfXRlQM5b9AcsmYgBnbhqid1wH5MSiCj96ZCeJnpipynuRqmr3gltID
 HJ6JOMyTM6JAjMEAAEIAB0WIQROCZtApKFz1fvvsOS8310ZUDOW/QUCZ24aogAKCRC8310ZUDOW
 /RA6EACokGH4AkfQnCDMNuE1ab9eqYd5OpqsM1kRnmTCckb+s/fhcf+zmlOvMz/6tY7keWDMOkI
 h01pY2Oo7uf4yAa9DkqM9gw5NgZsFcPnXRMtlbwjWOIk2ZW0xiXp6MgiMhFf/Y0FwoGHX2zb7B+
 pmoL0G6br4N1oL+wPkHHoiImXft9pJQeWp6p01Qq4tMwFMOBtrSLOXg6Ra98w1rmTdeLNrm6RYA
 lpkA9WCDaZqIEoCjaUFmVN9ddDcIocLcWq4bDh8a2EOGpHjwX6Ean/WYf2hVslhG1IEnE++juJU
 9zjkH5F+ZINJ9wXDB9DxjgYu63JcnQCD31blP0+yQObyPsPM5X5QCN3LCiNHekjxYZWV6r2hqdA
 Rx2MfOr/a93JqlhsNzyzx7SVzYe3CGQsiC3NqZYx4Ht72BffT04hMBVvGCorLFxcHQO4oZ6JpfR
 wKs9rIMPzau5AK0AcgSo65OGpvtrsORexLBB/+2ntOPj2A15G7ebSmscaBs2gTMNH5JnpaVUcO3
 koA82atd+/DBb5zrzxKntdLGS/WEJlXqfgKM3fNqpCNaRsh/X+EHyox4I4sWmBqucqekb/SZz6S
 0qsfZjyhWevc8lfDTWjqch9BHHURsohzC+4IDMlDjSoM9/zNgYOKdMw/IuQgHV8aZks39/LqcH7
 DRfMuHpKCFcBp1w==
X-Developer-Key: i=ivan8215145640@gmail.com; a=openpgp;
 fpr=4E099B40A4A173D5FBEFB0E4BCDF5D19503396FD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_191030_437421_6CFDEAAC 
X-CRM114-Status: GOOD (  10.25  )
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

BigTreeTech CB2 and Pi2 are Rockchip RK3566 SoM and SBC boards made by
BigTreeTech for the intent of using as a 3d printer control board.
It is a successor to the Allwinner H616-based BigTreeTech CB1 and Pi, so
the device trees for CB2 and Pi2 are also done in the same manner: the
common nodes and properties are put into a dtsi file that the
board-specific device trees include.

Changes in v3:
- Proper formatting and patch series sending (using b4)
- Converted spaces to tab indentation in the dtsi file
- Fixed empty line where the license identifier should be

Changes in v2:
- Added bigtreetech cb2 and pi2 boards to the list of platforms
- Split BigTreeTech CB2 and Pi2 into two device trees using common dtsi

Link to v2 1/2: https://lore.kernel.org/linux-rockchip/20241224135751.350379-2-ivan8215145640@gmail.com/
Link to v2 2/2: https://lore.kernel.org/linux-rockchip/20241224140057.350667-2-ivan8215145640@gmail.com/

Link to v1: https://lore.kernel.org/linux-rockchip/20241222203952.84217-2-ivan8215145640@gmail.com/

Signed-off-by: Ivan Sergeev <ivan8215145640@gmail.com>
---
Ivan Sergeev (2):
      dt-bindings: arm: rockchip: Add BigTreeTech CB2 and Pi2
      arm64: dts: rockchip: Add BigTreeTech CB2 and Pi2

 .../devicetree/bindings/arm/rockchip.yaml          |  11 +
 arch/arm64/boot/dts/rockchip/Makefile              |   2 +
 .../dts/rockchip/rk3566-bigtreetech-cb2-manta.dts  |  10 +
 .../boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi  | 941 +++++++++++++++++++++
 .../boot/dts/rockchip/rk3566-bigtreetech-pi2.dts   |  10 +
 5 files changed, 974 insertions(+)
---
base-commit: 4bbf9020becbfd8fc2c3da790855b7042fad455b
change-id: 20241224-bigtreetech-cb2-18944b349916

Best regards,
-- 
Ivan Sergeev <ivan8215145640@gmail.com>


