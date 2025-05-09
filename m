Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F967C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 17:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yhGArMwmGNgqoLRw4DWsBA14SdvN354OIbHqJyYkB5Y=; b=zYzw7DgDFRpvBvGSFcqyXj4Itd
	5VMC8dNRNvFnoVhU2s8kl954caVkW9Xe6dQtS1ftiZMM8bN2Vmn+zUK4dn0OCi6VYN0tSoM5gayKL
	IfsA+OXZVEBIviCVmC1psCH5WWoYVD4hYVWMR84+8kLizNlUHGv69WMTzx/yROKgrkfHKEwuAW+wE
	9sdRqMcuk2m+rTU4vdjEVejDsmAUJGnDVxKpr3ZoVXG9xcfDpC8zoivTlbv8P85MpQflvMAOtn3UG
	+dZqLPpjWi/vrYNYbTNW3Ku8Ykjz3nioPgUJzslL0+GqG51FYyA942XcgNbUvnAS+pdPKMBzL/Emc
	DORZ0wRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDRnN-00000004ThM-0SCt;
	Fri, 09 May 2025 17:46:01 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDPnr-000000047Ft-3LUm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 15:38:25 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a0be321968so1243696f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 08:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746805102; x=1747409902; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yhGArMwmGNgqoLRw4DWsBA14SdvN354OIbHqJyYkB5Y=;
        b=nT+7XXnfw/IZZFlzwahD821HdTuxph4M73dNKmEZOaartxs+qNOpUFTM1JZCQUDaI3
         tFn9jFYjAx2QOP+phOS7D2suxfafDX+NAtgMolkxjXAH+Si8j90Wl6uBm2MMDUEiRLLZ
         JjAy2T2zSZSlgEZ/rJ7XDXhPx+RPIrq1falBZkihw5Hi8Qsnnls15Wtbn8Lt4HVJIMaM
         OaZ6DuJoLMvC7eK3D9sbfdV7vk8IM7e5mb3hDwcs5Pk3N4GL0Y5o95K8ESlRQ1ERYhdq
         akdGVibJTteL+uTTBNKrAPBbwrTTvMbEUGXfppu5G2Yt3YlR+PP4jwxBn/vbzho5/jZE
         UG3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746805102; x=1747409902;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yhGArMwmGNgqoLRw4DWsBA14SdvN354OIbHqJyYkB5Y=;
        b=q5pjPh4+iOnj0hlFrRah6A/W/qmFSWPwB0A5I8pxehyNRtFce/EJdXK2aCLoJIf/Y4
         3vOLOGPvB6mSxqiRGGs+NeJrNADgwBhRmrzpfPy+aCjrrEOurbEYyMku7Ll3TJRwu4iD
         x36/kepGDpUIFOthdFmaTBpYtuA6oK2TbQlvukgVcZivrP/TSgC3o5RnbT3aaDckBll2
         GRZq3elBh1YSD9bhta1Ut6Ve1UQpGtLSyOD19MwVeTMYUiCld49WxWB2pAs5zkXEAMtJ
         Kp9I7n+/GjNwtQSGDfmi2nKaPakPreGBBB4TBs1b/DYfdgR++AQRJS0fhotnJSNuVmms
         QshA==
X-Forwarded-Encrypted: i=1; AJvYcCWway2i8D04Ay30Yua/H1CGua85LQQXIB5Urz56aD+1m6GWu9a52JpBkCYdhtvSaM3Dg3MYl5w87oNLsYVXa+tS@lists.infradead.org
X-Gm-Message-State: AOJu0YzJNsYpEgRMoVc381gsiympLkrOqI3EDFIcdwp7AQE3/c9FMevm
	RHeK2M/vKkhHEeBJCWPArsJNjXpeQ/z82YltJcq+QNcN/VNvXGVZYopuW8pyQ3A=
X-Gm-Gg: ASbGncv/fhprL/PS7hU0IqUdrA23uRuVzg1g2cK7N+LWOxZwZz+PfWHxzMZ6by+XGlu
	f1ZXocm34aWYaPwJKfO6qVHuJOu8+lk86UKOwjZdZ5pj7thET8SHiOIv5Jo2OFWWBHRhj+wLR7M
	sFe1eQN/mKtGsFzXxsogfFtDbep9xhbCf7EpZ0H8Y4jUqGOXg6PKwfGPQRilwWH9TghaPVmfZkq
	Wyt1RYMMZYR2qir4abxt5bekccEqVi/uEoEVhawPC298F3vzMiwSZ4Lr8+FIVHOCdlRToJ8ndoj
	87XEKm12zwdUTxeeFQSjJ1DHoF09a/084+fSjA5sc7W+Cu1hhGulH1ZFaleZ9A==
X-Google-Smtp-Source: AGHT+IELPNVARSPPy9VWxcC1mPIuPocRVxRHDPQtOXcwVJLTnqF0Y7JWN34ll3uKvovEm327XMwanQ==
X-Received: by 2002:a05:6000:2502:b0:3a0:b941:dc24 with SMTP id ffacd0b85a97d-3a1f6429658mr3094134f8f.11.1746805102066;
        Fri, 09 May 2025 08:38:22 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ebe4fsm3663912f8f.39.2025.05.09.08.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:38:21 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20250428-fernsehfee-v2-0-293b98a43a91@posteo.net>
References: <20250428-fernsehfee-v2-0-293b98a43a91@posteo.net>
Subject: Re: [PATCH v2 0/4] Board support for Fernsehfee 3.0
Message-Id: <174680510148.3108291.15356174367489186455.b4-ty@linaro.org>
Date: Fri, 09 May 2025 17:38:21 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_083823_835774_5F1D3225 
X-CRM114-Status: GOOD (  12.99  )
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

On Mon, 28 Apr 2025 12:44:27 +0200, J. Neuschäfer wrote:
> Fernsehfee[1] ("TV fairy") is a family of set-top boxes marketed as
> ad-blocking appliances. This patchset adds board support in the form of
> a device tree for the third generation, Fernsehfee 3.0.
> 
> [1]: https://fernsehfee.de/ (German), https://www.telefairy.com/ (English)
> 
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.16/arm-dt)

[1/4] dt-bindings: vendor-prefixes: Add TC Unterhaltungselektronik AG
      https://git.kernel.org/amlogic/c/40f983aa2d809b4934a260c76b82e9ff19c09a88
[2/4] dt-bindings: arm: amlogic: Add TCU Fernsehfee 3.0 board
      https://git.kernel.org/amlogic/c/eb7af1268e0042e83607918229cd62c3669cdcb8
[3/4] ARM: dts: amlogic: Add TCU Fernsehfee 3.0
      https://git.kernel.org/amlogic/c/dac928757928a8ea06eaf5694d5deae53a21616f
[4/4] ARM: dts: amlogic: meson8-fernsehfee3: Describe regulators
      https://git.kernel.org/amlogic/c/2c1879a440315e0b292bbff0fa63a73bd8a52e34

These changes has been applied on the intermediate git tree [1].

The v6.16/arm-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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


