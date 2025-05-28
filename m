Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD1F3C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 19:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IsxIxIK6IO+/d1azvrpZkxNeZUasvn91vkyCez/ohhE=; b=HQD46lDCbjnRSOuk10J2VDDMfT
	1h8bHdVtZXNbSDrvt1Mlad2BdJONmieKBp/32yW9ZsKDkSe6cAwKnQ8R3Jh3caz3IxqoqWfNcQ4Wb
	I7BfF9IZi0RniDq9Rr5XiKNt7lt6pxDSeNZ7q9y074c8KnoLNV1ThKsx+SXV7aqj11iUe1CYEeyAG
	OfnV/Qv1D2be+T0Ql4e6sGD2UkIJVUzIeDOSMqLjP5EpFy3WqVugqd8wlhdyOAIjzm8rDEofxXVH/
	HNZqLM5h0NQdC92iWQivKiZwzreawXnUV0sHoXJ0O9B/4CxeLkoGE3qGYWwblEdrmRdI8oE6ZdXJD
	vPKzmf4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKMvp-0000000E24D-21E5;
	Wed, 28 May 2025 19:59:21 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKMtg-0000000E1tZ-18K1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 19:57:09 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so1383995e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 12:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748462226; x=1749067026; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IsxIxIK6IO+/d1azvrpZkxNeZUasvn91vkyCez/ohhE=;
        b=pxlTkThkPsDIVXFESIONEEggrVZFPu3U9vVqYYau7pnx3rR8mzm5Bmg0CL2rDvHbGj
         gNpa/bEJ92zBX20KrWPOszdSgztoSlaIAu3i3elfWxuQ5U0k+51bR6yt+yjFna+2jb1+
         aMXHuXb+HZ6fDeuJvH7gL8T2pZFkFbMwt31LvnpadZlzcIqig/yMQ66IvpPhRj2AKejY
         doE9aynQUWk/qtGRgdvOo1cY0HB6v73nlHdSmZGjv0grlzr0MkEsedOnnfu2u9MA8/fG
         oHv5IzWiLgDCE7ZTaqr9sW/dDM4h92mKzsELVd5w0DKkQW6Ntw4pL9RyYZMGhSuSWmv9
         lZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748462226; x=1749067026;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IsxIxIK6IO+/d1azvrpZkxNeZUasvn91vkyCez/ohhE=;
        b=LQoktkhXOZzEuBWWq9WxZP85XlIjPpqZ4TDs7bT+/UZmctpTk7L6eqMaXR5Zaai6Dd
         mv7g1enf1QKQse/QhT0/pcFJznWmmbImGfhNnoWjymFdPxMqRDIHXGH5A8yVjhOv7iKd
         cEQa8LV0cCee9lL6oU7phZYpLoHkOaHcVD5KT4ZSrQeAzMvZhvSgqnNbRZFzt3eUVMx6
         tpPlbKg71dUcQHQe2PXB8ybk1M4N69fgNtsu5uO1ZoJuzV7IgI1m6ZcMwa+YciYlS3G/
         HQesHZuptjOq1AXuBbABI2ts0kVpnsO6vvYeHW7L+efGizjuYbI9s8dfApDQhRYgzedd
         TytQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVpzSA4A/KpFhwM3IqmpKSeTjy/Pane48NDuz42L2zfk/Cao1T4bLbXNrFo/eu9gtN/53lLOf2zypofGJOlqq0@lists.infradead.org
X-Gm-Message-State: AOJu0YyOgZoGI3Hb4n4keO8ICKbOWyn8zU0kpN2GBWTP3zYCwKXXdkgT
	WX9tNla2nx2zdDUi7WmP2oDysyQgSVMu98467bcbhFgt5lnUMhT7qdCU2DxauMQGxZo=
X-Gm-Gg: ASbGnct3YEhAVO1wUj7UaRxSxsYQKX22QRQBeHkubsH1Sfuqm0CfLgwF/cKST/gJsRp
	0ZwlIRLaKcoQ/nQ4G/J8zjrvw6eNZ2D0OcMzU73tS3jluBA9L34JD/RaiJ1CBSwnjGpbq3i+6fc
	hFxa4nzbfSSserDVNFyBCJR9OHQsUoYvuYCXV9GbXvA3XgSSBj3bmSa3bsxVwW7iOcJ4CJiDNEX
	9qM1Ljn4MxcDv+IKg+BsIiOMTLQQo/cFibv1SjJXyw11PuNSylq/LhRaf/e2Ii0RKhxPUHyMH3p
	v6sQZxzjgOY/f8pEK+Ev8Vfqk4JCvIM9ZECMZ3pZBk5J/vHOoW8UIIo=
X-Google-Smtp-Source: AGHT+IHO8Svq/QgVTHmZClL5gffMevyHOz1Cco0x7cPWvVyVd9ZXnG4onhYM/UN/PlwWdqGJFqmo+g==
X-Received: by 2002:a05:600c:35d3:b0:442:f4a3:b5ec with SMTP id 5b1f17b1804b1-44c9301650cmr187985425e9.4.1748462226120;
        Wed, 28 May 2025 12:57:06 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-450cfc04120sm638565e9.16.2025.05.28.12.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 12:57:05 -0700 (PDT)
Date: Wed, 28 May 2025 22:57:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peter Chen <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Xu Yang <xu.yang_2@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, s32@nxp.com,
	linaro-s32@linaro.org
Subject: [PATCH 0/4] usb: chipidea: Add support for s32g2 and s32g3
Message-ID: <cover.1748453565.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_125708_325881_289A0AB7 
X-CRM114-Status: GOOD (  10.12  )
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

This patchset adds support for the s32g2 and s32g3 chips.

Dan Carpenter (4):
  dt-bindings: usb: Add compatible strings for s32g2/s32g3
  usb: chipidea: usbmisc: s32g: Re-apply init settings during resume
  usb: chipidea: s32g: Add usb support for s32g2
  usb: chipidea: s32g: Add usb support for s32g3

 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml |  2 +
 .../devicetree/bindings/usb/fsl,usbmisc.yaml  |  2 +
 drivers/usb/chipidea/ci_hdrc_imx.c            |  6 ++
 drivers/usb/chipidea/usbmisc_imx.c            | 91 +++++++++++++++++++
 4 files changed, 101 insertions(+)

-- 
2.47.2


