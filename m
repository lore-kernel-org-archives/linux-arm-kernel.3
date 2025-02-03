Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A98C02195
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 08:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Un+cEQl1penET6kXVhDwk0syJ582vZdE0QyY38dr2j4=; b=BmvGyf+lrkd5y6RHBvYwW4w1Eu
	aUT7Sw3ji09kmofsfpTTy9ch3QBjXBmQ3Wxmi0u4sMQ6h6kMb6MoWKfBAgdK7Sc8Eu6ab3J/DdkNa
	J9bcX01SuPDNZIDTS+kP12QEmzS3L0STXQWpM4WXJHfGGdTbq44aJUAeqieM56Ner852S0hvS02vp
	XReqgDqkhshl5IeuCmRG2r0LAAb65Z0DmLp36PWNzQ9ehMxj8//3Vp9IMb9tpNgDuxT0twEordGLL
	Z7B/86sfVs6sRzRZ97P9PbOCDs7REKhUM5eCJf72e/mR+qrGkB3U1uydSBnWiMl/pcW2mkNnhz2Xn
	V+yMYPDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1terbo-0000000EnEs-3qfw;
	Mon, 03 Feb 2025 08:15:08 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1terYb-0000000Emcu-0t0K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 08:11:50 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so27475815e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 00:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738570307; x=1739175107; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Un+cEQl1penET6kXVhDwk0syJ582vZdE0QyY38dr2j4=;
        b=XJ9HGt8MZZ0fL1YtATWoyH0RY7Hr5vSbDVR9ib2hw9UoeKTqexVJxwd2PpQTUkkSj1
         V+cBYbLJ+AP53vNrR0yhV0p4Gau6gqiKPcO4P1IesJLhipF8NGndXHkWQOw1Vb/IjEaO
         P1ePiN3rI+ta7K883T0ApGhIwe4LBNs4ZDNNaG7EqN8RDFeR3VZclcnBaKN42eGUFqHM
         bjOUPXkBddW5+lf8BN+T4N40PrgtMylSlGN/FSBqcy6fqgFUcbnfvJSxXqtTujqnP0TQ
         Mu8LIowzNiiw91qyhOizmJsClHCW5zWUvgYkvySYB+C1eTKo1YR3zZcWJ2Bwjf6+6B8X
         u9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738570307; x=1739175107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Un+cEQl1penET6kXVhDwk0syJ582vZdE0QyY38dr2j4=;
        b=Lj9EN6T7K1PfAeV67Qq+tXb6r/AOLMz7vT/uMw+2NWNd5fKN7lKHAfSmpnJcSfWD1w
         Is9D/Ipj0l1dQm0iWdkKgmQ/1P23DvHfKul3huZIQnFsbuQEzdsDc9fkHNIqJfD0F9/b
         Kt70Gv7LrPEqOPi0bQMDcpKq57qB/kws7vMeaRgxRBJYx9NUNpaRDsulozfu8vcRbUyX
         b+81e7mH/qPCWWGUBix3jWWcpMQxN2IbreSsr4KKNFZhSnVdSTjVtW9prqRkj7d7bUbs
         FxNiGQQd7Aeq/+0ZG20REMt9lhGpczQwXTliEJu7oSHdi22XhZUBzn+qV++YM08XjkKF
         d4+w==
X-Forwarded-Encrypted: i=1; AJvYcCVmvN2y5M2N8uOwBJC/rVI1nHf+FbyxOsZGCmrpXEnRrQSaoWTElRC1bursOCdngJCvBaZWUXCqTGnmMW7d7lkS@lists.infradead.org
X-Gm-Message-State: AOJu0YwLqngIuWn8UARuglfa9kV/Mdea+nFC5kdO9CQEcLui2xvMXWrt
	b9LY5TVePxKDLocUcPEuOmweIlrkw2oliWuGT6xkx36GeKlTGryHAHOyKs5hkL4=
X-Gm-Gg: ASbGncuEpIm5RCtep9CLy8DOekNiIymrFIydIyNhumv2V4sc7th6h5fPRneuOPN3hrV
	Rt1D+XFjJ+Zfi0C8AUxrNklF4yahDpRQMqt/yW4XRj1VHepHMk7f8erc6rIpGVM60WSFUULypuA
	TuswUDaGSvHUZ3msbqW/UyC7/BsO/uZqWBXp6xiS3tE837tVsep8n+rLat0bPVu8fbu1n5WB+6A
	fYsj3yyvFAlf3Z4WHlg7uBBde53g9NN1JyuQlOeYq93sRjqy2GVC2LwLG/mSkfbjvipddUg+P5C
	Y/LBXnHoRcaOew==
X-Google-Smtp-Source: AGHT+IFsYJyukqNwI/R5K0rzDdSZ+QGIaGzEDlXZz/nQ/Yp+9OtLlQtZNmGQAJmE2taDeIWJxu5lOw==
X-Received: by 2002:a05:600c:3d05:b0:434:a802:e99a with SMTP id 5b1f17b1804b1-438dc3ab389mr164710125e9.4.1738570306784;
        Mon, 03 Feb 2025 00:11:46 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:62d7:938e:c76:df44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e244eb0dsm147095175e9.27.2025.02.03.00.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 00:11:46 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: David Lechner <david@lechnology.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] ARM: dts: ti: davinci: Align GPIO hog name with bindings
Date: Mon,  3 Feb 2025 09:11:45 +0100
Message-ID: <173857030323.20448.16564760541059882154.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250116090030.87452-1-krzysztof.kozlowski@linaro.org>
References: <20250116090030.87452-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_001149_509838_B75BFCC2 
X-CRM114-Status: UNSURE (   8.77  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 16 Jan 2025 10:00:30 +0100, Krzysztof Kozlowski wrote:
> Bindings expect GPIO hog names to end with 'hog' suffix, so correct it
> to fix dtbs_check warnings like:
> 
>   da850-lego-ev3.dtb: batt_volt_en: $nodename:0: 'batt_volt_en' does not match '^.+-hog(-[0-9]+)?$'
> 
> 

Applied, thanks!

[1/1] ARM: dts: ti: davinci: Align GPIO hog name with bindings
      commit: 58abc69e479cf5b36c4fc4287a11c9d92d2ce4b8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

