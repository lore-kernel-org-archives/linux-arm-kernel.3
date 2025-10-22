Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F81CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 07:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wqMreim9nAYer1KCbouUlT+cwbSr2tN/sZopAV8oBn4=; b=J0MPl9ImSVtz/hZOfVvTuFGSLC
	SqWE3QJg9vAIV4lnW9qPFUXwG6haZOE4FSkGLDg6bbVY0ZDqtvHH9/zoXEyFHi+tBboizjeXvVUb+
	7MNhvLhAGvX03+mwOFLloMyMRrmAwnls0O9wbtt/N9mOZUQzXQPqwHg7N1cz0QgHgU42K+dAdeMhw
	i9i8S6xOwGuHEysY9U7mKSQW7KjNsFluu5TA5/IrckshXdAT8O9khNPMLv1F+D4xNxbQS1hlus+gQ
	EMI54LqvoJwrpUEYUjXOnWD0vW/hfTLyRbxJ1Nkb7Pifmt++cqjQbyHfoGxR8GwwGQfsmWUQ4Yg3b
	bMd1muOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBT2V-00000001pQN-0Y36;
	Wed, 22 Oct 2025 07:13:43 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBT2R-00000001pPN-3AAB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 07:13:41 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-471bde1e8f8so15942685e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 00:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761117218; x=1761722018; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wqMreim9nAYer1KCbouUlT+cwbSr2tN/sZopAV8oBn4=;
        b=guOVZ8Yn4HjBEu+d0GDVVxdt+igGOHDH+XTbaLN0EptfLPZ+JZukMbrSOSbIbPTAd2
         zyGrHHKnyHtdUi0oPmlGVVPr/aPbKTkwa/GRKRs7tUVlmBrYpSNfDe/PIJd8n2kuWXb2
         XR86MyxvBejXb4FKIBR3oeuSuN5MGiZiko3DeT6DWeQitRtIq71mENfCOZk1rLZ6fSA/
         9rDNFE/jtyxKaH/oyAUDAo72WFY/nbdhlRKHYhzdzkjtD14j6YEveuBM4XCpm2V8wNar
         TepV7HQqQLOs/SBKRvgWBb8ATHoaLGRmQ+0rm1oSChtTe4XGXKCDsDYn6NmGa/AYkaf8
         s2sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761117218; x=1761722018;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wqMreim9nAYer1KCbouUlT+cwbSr2tN/sZopAV8oBn4=;
        b=CuA8NjpsNTEzbvp/hFUofGWk5mVIYJiu8+i8V1iec9wq2xmpo+MeLT5waKvhZYQU4a
         +Vu5pXr/jr+GqV860WgsUrbT3PDrPc22Z4cLFYlkbSFj1NE5+6N61/xQwCFMDXDCitO7
         3QZZn7vx5CujwOQhRcw/xwGsN9cAbAd8+cKR4aaa/U7yHlkK9hZP5qxS7yLvY9H4OGpM
         N37LFvnhPf/eG6M+NptD/Wq3oAe1S7AiySb+GI0v+urXWhT6SytxOobEkt0yeEeWO7v9
         aWNgMD7ZQuBepS7p2wRlQH8ypkMCET4uMyVAjlrVL2CdiUd5rX/usV4unyCrN+xQ9fxT
         RMyQ==
X-Gm-Message-State: AOJu0YyKBUc/KNNbiLitB0aTU9NJ7u86fiPSa9cAzzJjJzAmazXH5AAO
	YU4UYHCmWpGOS3RmYICNdg2FQXgkDN2+I2nIDDKvKKikdKsf/qYqsv6iMjhGjFNeqDw=
X-Gm-Gg: ASbGncu/naef/YmNXSgUqCZdexVJRZmsjyEx1ZeGAoEF1mw214kOy17xLL7UiIz92Oe
	zJEoz2y9+ocAhbe0Ow1VrZlhizld1y7uxi3bIIx10CEluYaloig5EyZ56nOdDSDgYlUsl9kN2BP
	9He5TubSEJAbyFYSeNAfWziqfD0j/aUONZx4DtfIC42joCYC0E0P1j+Fff9xdswtfvKe0eZEhs5
	VbLR2G4dZ611UVHZ+OOM9Fn+keL3yiTDdlnv+sF7W2JBW4t2IB88D71wNHD/TMxCmZcOAuAbU/n
	IBJR0p/0/zBRRSAf3qAN8Ri5jhTfrsJvbnxDCb4iIds7uof7pdeUEDVcKoMog9PUMnOV9wPC9aD
	FmubnBmXp2T1EmdPqqk9L/biVlPkmpxALy1y0lFoBxyzyebc5IDK7LRqrWK+CK4sruOB0+HBb3b
	c5UHzbJGF1mkFiB97fpoNZ
X-Google-Smtp-Source: AGHT+IFrToHcy6QNjmKjXvKbtPCmRCoAalFEfH2Sz994Kb8x9DVcmCsK+N+zANuRJUkEATjH9AeXLw==
X-Received: by 2002:a05:600c:670a:b0:45d:d97c:236c with SMTP id 5b1f17b1804b1-471179017f3mr128014945e9.21.1761117217823;
        Wed, 22 Oct 2025 00:13:37 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427c3casm29428155e9.4.2025.10.22.00.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 00:13:37 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251022-a5-pinctrl-node-v4-1-a71911852c4b@amlogic.com>
References: <20251022-a5-pinctrl-node-v4-1-a71911852c4b@amlogic.com>
Subject: Re: [PATCH v4] dts: arm64: amlogic: add a5 pinctrl node
Message-Id: <176111721718.2414958.3337470167774710768.b4-ty@linaro.org>
Date: Wed, 22 Oct 2025 09:13:37 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_001339_815391_DAACE104 
X-CRM114-Status: GOOD (  10.74  )
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

On Wed, 22 Oct 2025 13:04:48 +0800, Xianwei Zhao wrote:
> Add pinctrl device to support Amlogic A5.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.19/arm64-dt)

[1/1] dts: arm64: amlogic: add a5 pinctrl node
      https://git.kernel.org/amlogic/c/a8b41683186d1465c06aabfee6e66ae0bb29f5fe

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


