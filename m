Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A14EECF8862
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 14:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4vwGWKGJvlZBNC9/cIqoY6FRuhMfwnJeZfMijAXI4Rg=; b=uhGFDb+DM/TAUIT988W+kfgw/R
	ZtvFZO5yFp+GYtrKUaurm5kEo0mf/8KgFeeCG3IwZ3z5SrGIUsnbaBfXFsWQblQIZv4uzLJsgEgEg
	S/44mpOtpKvPsqPkLZOt3UwKFEoX3WqI411ZMfHtHbv8VjwzJK9KIPIGdTbQlU5uCxbG0IABHZKw3
	jbhXmB4Rx3rGczuOauOuqMh2o0QNzh/jF/WWkprGf8VbPqlH8TgOSq8hsIAROMisWoFXy5sgVtDtJ
	dR0tTj++J2JlZGnDU/pSdX0aek5Ag+J7Gq3KTsEVYUwV2aGR7+ly3OVjRpiLZrZT8/+59QYdz+vm5
	woc6n3Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5XT-00000006pf6-0ycX;
	Thu, 20 Nov 2025 14:21:35 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5XR-00000006peB-06zJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 14:21:34 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-47796a837c7so6358785e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 06:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763648491; x=1764253291; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4vwGWKGJvlZBNC9/cIqoY6FRuhMfwnJeZfMijAXI4Rg=;
        b=rsswpZQFW5683y58Pmpg136kMDXevNFx4dF5Nt98BnLC7TsCDLQ+SwP19LY4so2661
         oZxTAaj6YVKpjfkagQ6DPqxvTJqMgpAFJpF2zCHZ3envekJMsiUhTItrV1TY4FX9GFE2
         zNfkyf9G+VKIQgcPm04o8NqsyBm4tJTFCKpyvAYHnAq5oEa+/6i5dtSxaJ3wzQHil6KR
         85UE0sloDkRIlFlEWnzeL2S2c582cYUS5Bq0HHcYLVScwNGAyE+qdqCfx2WugQFvRfwv
         iI2D0xtwbbd4O4xQ65YLljuNLTgmdswEqD9d2aooHA6yVSbM2eCIOvhWhD8ErPqshDwd
         jaFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763648491; x=1764253291;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4vwGWKGJvlZBNC9/cIqoY6FRuhMfwnJeZfMijAXI4Rg=;
        b=rjX5RgzojRRb++hQ8K/GsNQJqNraL9tj/qwj4EO5Cr3HqtY3y6fu/4M9AxvRA+C4xC
         R632dEoxO3T1CXZuE0r6njjOQaKbxs4YJEbTvdUKbJpzA1Kzbh0CkIrFQ2VvgPZ6BFTM
         9H8oCf6uH5gmi9cvKAg+W7ECeHkGKCfkxuJBVMPnJf938lEmslwAQZC8UXRcID5hu+k1
         9qV/Jj6HdAyPVBos+DMg4kmAGy18WU7/XcCHKpB5qEzuWaziF/5HWxmdldfRsYhdp9Hc
         mcLA7m1MQUHXAxxIf4tTW0ia8mnketl6pGRhkjG1GEMc8LENE0aqh3c0GFTbwcue2X2F
         EWUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBeL/JyewgHrrLfNmczzZzE/fDtzI8UDbyOA30/gNLE9ACUDyhwCHdX17m4+L6MDUtpHYkpWkhH8jcUsbwYG/Z@lists.infradead.org
X-Gm-Message-State: AOJu0YznDfENSuu+d2p9Oxu8GCdb3O6Xez5iEos8azAWNmkOSoI2IA4Q
	K5WgS1Gv+lkz+9PZYkdP+M9sxTFkGainRP8rCLvEWd7C86DSzzYS4rPjdE7EEgfBs+I=
X-Gm-Gg: ASbGncvzEJ63ePKqZAtGHbFWVOkSXnj9FYAjAOFUaKWLS2H9wZGVC+keyJAI/A2QmFL
	TaIvC9rvaIZiEmyGMv05jE7u+7B9pjIKlsYebtPFaXj5C8l9YFVn1WYb5/GJlAGPa48UWkMOtMY
	Y9msRDB7aOIBDvPQc5R8nrKpiUi2/FxGrEVyZ9Fb7++Vlj+8eyncSfeat/yjxtfy21Aub8tfv6y
	sV+3zIJ/F654qO8DUh2d+na6sxBs4fh9HGhLanURyDuLJsrUFxkisJnGEPFraJInQe6r80qCVig
	bdY0MwbO6yHXvc/zHR+vEnoj9yNw0VU3IXU7clyrUA7ODPCiW9ArpJymPZmPQZG0s9/cotXgBpV
	kUhIQermnltdE0qwEm/GNmyt4HK28hUROafEFdBMA6HmW1pBbAXNirEGiwMiMXK3jo2qPO0Ddhp
	9ji6bAjbVebjzesQfzLVwcgBMZDnvhIb4=
X-Google-Smtp-Source: AGHT+IFxAbvoQ/DxLOXZp0l1dwaXexo9KAQDd8gwZkfBWJtP1PrL6I+wcx7pCO0NKjnPPhgubkLJcw==
X-Received: by 2002:a05:600c:4746:b0:471:1774:3003 with SMTP id 5b1f17b1804b1-477bac1d90bmr23599555e9.29.1763648490969;
        Thu, 20 Nov 2025 06:21:30 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9df8db3sm63372585e9.11.2025.11.20.06.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 06:21:30 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20251119-soc-info-s6-s7-s7d-v3-0-1764c1995c04@amlogic.com>
References: <20251119-soc-info-s6-s7-s7d-v3-0-1764c1995c04@amlogic.com>
Subject: Re: (subset) [PATCH v3 0/5] soc: amlogic: Add new Amlogic SoCs
 info defines
Message-Id: <176364849018.2627407.16106708011654431567.b4-ty@linaro.org>
Date: Thu, 20 Nov 2025 15:21:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_062133_126230_C119A0E2 
X-CRM114-Status: GOOD (  10.42  )
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

Hi,

On Wed, 19 Nov 2025 10:52:21 +0800, Xianwei Zhao wrote:
> Add more Amlogic SoCs info defines, include S6, S7, S7D.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.19/arm64-dt)

[3/5] arm64: dts: amlogic: s6: add ao secure node
      https://git.kernel.org/amlogic/c/834f278c9f0676f3c97b62b5d7469ef212362cc4
[4/5] arm64: dts: amlogic: s7: add ao secure node
      https://git.kernel.org/amlogic/c/0145430828b5ec34b85a65584ea1e749df43a704
[5/5] arm64: dts: amlogic: s7d: add ao secure node
      https://git.kernel.org/amlogic/c/5224cde731e8f749d643dcc994526b827891eb8e

These changes has been applied on the intermediate git tree [1].

The v6.19/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


