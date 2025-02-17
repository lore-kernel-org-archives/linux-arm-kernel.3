Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CC0C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 02:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AER0Zup4p13T8PV8KU9Nywbmtgf/uR0O/WZpg95sLMw=; b=bWbCVJF8jxv95SOffWlilpvk5D
	gBghDFEtO27cIEu6JAregRggcg1yCXhTMn1zEM9bG9xYRw1EpV3wptZxHjbxrtnBfiu9pctW7DPNK
	//g3lbp1gJgxAz3NJXlGTHwo6Urhq3xcgcCjXnr1d2ovihPKrLC4sOnUg7bGqizmapg+Fq/L/b/gk
	xguHcSf2dWEo8cc0E2cl5c+hsEjZImnMx9w/Mfh2SeKkXrO4PWDa8+KxcPH/KfoHNCd+9mzg2/Tri
	ivVPQrmwJkGenZTwhk9Qi0SvnJuHnxIj6P0+ROljHephZZP4+UevXWuMx5n3wvsSK5/TN7ecd99xH
	fOtptWdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjr9F-000000034Td-3DrM;
	Mon, 17 Feb 2025 02:46:17 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjr7n-000000034Mc-0S5o;
	Mon, 17 Feb 2025 02:44:48 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2fc8482c62dso54316a91.3;
        Sun, 16 Feb 2025 18:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739760286; x=1740365086; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AER0Zup4p13T8PV8KU9Nywbmtgf/uR0O/WZpg95sLMw=;
        b=UjpnLZk0tJdbWW9PzCLeGt79qjOwf20476GQhHXsF1iJTxz/IL1MCV+aioXJkOFpWz
         HkLX0A1Eorufc0NPoMnvqIx0uRxrNtqOuKNGuwPnssl/UTMHWDSYgaVI7+dHWdG/1QbZ
         pWz0XkoVwd2Yb2lMqqFp3nphYnQ6/YuCf0UeOYYknl8ORSbi5f+CO0P3JfHLy1cXZkM/
         wLS2r4XqmXUVzJNrX0oxIwl93EnktcN4s04EByrlJ5s+1SyxiXgf1oKVVe8c2AOy5Gva
         BVv4gnAjunxOvYjQ8Ewa6UjdPyFKTqiwnXRBzXSLuI7nY7JBFfkNbGub5RfpqNr8ypGD
         AkZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739760286; x=1740365086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AER0Zup4p13T8PV8KU9Nywbmtgf/uR0O/WZpg95sLMw=;
        b=SuCQkh03hBYpcEOcqH2MeYOg+t73JmEZX4RKt8g5R6yfZnEYIVkKmtSLBby9y1Svp1
         fuAKnF8ric/DWaF5qOTwuAccdlDZN9zc1E8pNT2HOsixepeZuxcotorA1uHpr8tNMUOB
         Sk2gmb+SfgavWguoytXiJqdVfW0madKlY+3NPhGQ1qndOLMsvXnsNISVyaxuTQfcnClR
         cR6fzdBzyAC2jRIqjnYVKgbY2khQo0spZZ6oOi7h38u/JsOVxB6l6/vZS4R2eR0SDwUz
         OWXDkFtAfqVRdmbFqGX/roLHah1F4cT7rDj0nJ9vC0RO9xRzpY5Y+pCvxIGDTfUxh/u1
         igwg==
X-Forwarded-Encrypted: i=1; AJvYcCUxwj4K3ne6DHXQ4A7i+IUGbhQ1j7cxGkfYQDhXqpwqh6De/fIHnoAMt7N7+JgBojvSIR95SScrqC1AvhlUdwk=@lists.infradead.org, AJvYcCWR2vpSxWC4rSKrAkeKnPQb1we1DG/+FXIcsj2mnRNwQofyVg4AA29B+S6YzbuHBz+FuwVO8hY46uUdFsXsZnF7@lists.infradead.org
X-Gm-Message-State: AOJu0Yw08eJr/b6gGcv1wa9LfijgLmkb/5XvjVGK4OMjECs4ntYMfhEI
	NpjKhn01u07vO6/yrUAxPjE5UpG0YyZf+YiN5kA9L+pmi1S1+PA/
X-Gm-Gg: ASbGncuJS/rTHGQRS5BH3M+uVFRY0qWqDSZf16Kn4AleLf8ZiDp+n5db1JcGXiHPUKu
	UCRAsHPauKzIWlVLH/nlN9kvBjIxQTlUsSayZKSKE7bFogM/xXb7MwfH9DnoLrqXgq8UqQEwPBu
	kBp21s/5Uap8uAr9RquIo9yWdNI0zsW2Q9mPwq2rcpODcDmn5OqRPISW1kRyVpigUOnEAtZq6D3
	t3fzgp0M/dm7Z+M3GjmrIPjG+kZdGyiDaUokS597EigAOn9vKkFa+R8RFj5KwDmMJGng5DyCIJE
	aLveE8AM3OjQ/X5i50IF
X-Google-Smtp-Source: AGHT+IFFkuRjjsUfRuK1JlJi9Y9I+z5IPJ8tmFVOzZ4eyJmlUKG0o/RiAA34cdX7ng6bdHkr98gAvw==
X-Received: by 2002:a05:6a00:2d8f:b0:730:9467:b4b8 with SMTP id d2e1a72fcca58-732618d705dmr4381994b3a.4.1739760286043;
        Sun, 16 Feb 2025 18:44:46 -0800 (PST)
Received: from rock-5b.. ([221.220.131.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7324278011dsm7014915b3a.180.2025.02.16.18.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 18:44:45 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: cristian.ciocaltea@collabora.com
Cc: airlied@gmail.com,
	andy.yan@rock-chips.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	heiko@sntech.de,
	hjc@rock-chips.com,
	kernel@collabora.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	robh@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re:[PATCH 3/4] arm64: dts: rockchip: Add HDMI1 PHY PLL clock source to VOP2 on RK3588
Date: Mon, 17 Feb 2025 10:44:37 +0800
Message-ID: <20250217024437.35155-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250215-vop2-hdmi1-disp-modes-v1-3-81962a7151d6@collabora.com>
References: <20250215-vop2-hdmi1-disp-modes-v1-3-81962a7151d6@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_184447_165261_EF816E54 
X-CRM114-Status: UNSURE (   9.41  )
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

Hi Cristian,

On Sat, 15 Feb 2025 02:55:39 +0200, Cristian Ciocaltea wrote:
>The HDMI1 PHY PLL clock source cannot be added directly to vop node in
>rk3588-base.dtsi, along with the HDMI0 related one, because HDMI1 is an
>optional feature and its PHY node belongs to a separate (extra) DT file.
>
>Therefore, add the HDMI1 PHY PLL clock source to VOP2 by overwriting its
>clocks & clock-names properties in the extra DT file.

There are boards that only use hdmi1 such as ROCK 5 ITX. So there are two
choices for this board:

1, Enable hdptxphy0 as dependency of vop although it is not really used.

2, Overwrite vop node at board dts to make it only use hdptxphy1 like:

&vop {
	clocks = <&cru ACLK_VOP>,
		 <&cru HCLK_VOP>,
		 <&cru DCLK_VOP0>,
		 <&cru DCLK_VOP1>,
		 <&cru DCLK_VOP2>,
		 <&cru DCLK_VOP3>,
		 <&cru PCLK_VOP_ROOT>,
		 <&hdptxphy1>;
	clock-names = "aclk",
		      "hclk",
		      "dclk_vp0",
		      "dclk_vp1",
		      "dclk_vp2",
		      "dclk_vp3",
		      "pclk_vop",
		      "pll_hdmiphy1";
};

What do you think of these two method?

Best regards,
Jianfeng

