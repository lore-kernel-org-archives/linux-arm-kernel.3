Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC2FC3ABB0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 12:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hpeTr6Unq+CiFUgnvKuAHal9BTXc1yrzMKrqPlgz8m8=; b=JfgP13h8b1qg7PBUZEOp/TTC/X
	yCBmsdcvDH94Q2oiAzaIcK0OSPZQMem1hlj1ngDPyHYKWCOthi/o2je6XxSIkeEuZmY1HHJhihusL
	2KOihS+5Zw2cBux0+It4DkzyR6RjLL3hOA141yP2EGAgPjLq3BQ0zop8+zYLB8PgEOtIzqviLuCUu
	SfjZNm1os47dRCNQ6peBybv8kGe+jq/6FHWV7L7zN+/LplTVivXPGDRF4ay+KoS6XA8TAYOxXJ59C
	mAGqWLqmBUFiB3JTXOz6rS0LytGLehOTc4l3Sy4mEb4vZv76KJNZDodDjKbToPZMHlEw27HIeZjXk
	GfYjtwJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBvBN-00000007NZ2-2O9i;
	Mon, 05 May 2025 12:44:29 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBv3l-00000007L21-2zj7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 12:36:42 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso26491665e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 05:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746448596; x=1747053396; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hpeTr6Unq+CiFUgnvKuAHal9BTXc1yrzMKrqPlgz8m8=;
        b=JmHa18lmDVVYa3WJC1I49xT74sVuhyv2K55RdgQ3EhC4FiEMWlfg2bIsQrrPOM3Ho4
         4e7CZxbWN6KK1Qm8qd4ILgZp3aRDkP6NqGPfHeDj9FIOc2XtJDet0i9WFzxfsONXxcZd
         d2H5XGIuh7okC6dFVIh8E8si1jAlbRt1qMeEL2RBU/i4aWndriLNFGwGbNmYnuPxevAD
         ax1qG9bpU98VdOEltZl/53Bn/+IqhBl/ZXHOpxtzUL/TOl0ig0nwO/v49pht+Qe0Ql5q
         +YFDTHoiJSO1qvrjMzrP56TuoPgwWeAwS6c20F8Si3iAWy115SIXWLW5IX+GwwF2q7xE
         ZpMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746448596; x=1747053396;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hpeTr6Unq+CiFUgnvKuAHal9BTXc1yrzMKrqPlgz8m8=;
        b=afuVppYtHjAOFK1TD58sWDrImCPi4OhrHHXICtJrlhpEvr6m3RXmGA0ifxSFBqwFPS
         iR+uyUyaw5fnCEv5ptAv0zEgVaSqUmuhrFdUC7nTm49D0e41gxPZLbUS5WHowYk4Nnz6
         QGUirCfA8JU4oP1ff10xvMKRasNt8FTn9yDWjAcVrZGyCxKVOmpCfg8AHoWCE+KfgwqR
         toY4kvLgvfG4yGWE7trtnquVGZWLqyFgrZRtR0JEKulpA79KryeceUPk8k+M2rz4AI7w
         wlfwGm1vip+3IDzb/w/iQB5EwvWsqK1AFqBOKAs+BrjcQ5B4ooLZYEcKgy4EWbaQ2dkN
         t4uQ==
X-Forwarded-Encrypted: i=1; AJvYcCXk9OcRdC+Go6E0Xp6zPGzG/63yFMOAf0i0c2f7ZCMOQXXHKjNGt66KFJrP14X5tfDrcc1lQlE24Ow2yBFGPPsV@lists.infradead.org
X-Gm-Message-State: AOJu0Yyz//dc0Bhs6dLbtzyMpXPX/BdjvN60KrJURRVgRN5faOJ4293p
	L/+v1+x+mQ4ZpFj0ddvAWjqpp5cWt/PS03NiORdwUhdMppwujLwKhtSuTuWXHWM=
X-Gm-Gg: ASbGnctK4aJt+T2bIDK3pq2tx0FpJXGLH9Ev68r/nL9rfAYgys+gSx9rhoWWrjnw3If
	cwZJCZlct05ShppM873GErz4aqPPFA3AwAHMf15EiQniSJDuhcqScG/FSEwz8dEbJUJ8SJPCg0R
	r09QVL2vPskEaJGunj5ToELpV1l3TB0KGAKVMQiOp48CZgF/chXHQYx7AgG9OuLkjoRCesTSicE
	nysv+xD/Nl+rZFA5tZg87HIKVSYyCmPskC+W/yxSwomIsXp7F3FsDdBBp9eQSkRgiONVJrNeTDx
	CXSM7MHbEU79jQgEY/d8vMVLnyb9WtQCBUeascgp1XNDevRFVDvSLaD4g8hCpVJgqhXVku3S
X-Google-Smtp-Source: AGHT+IGd4vciO1iWM2MZ33WYuc9Z6cveleoL1KHOCLqmcEBnu/hEnCR2SmyiZj6jI/P6HFxT77OnRw==
X-Received: by 2002:a05:600c:1ca4:b0:43d:db5:7b1a with SMTP id 5b1f17b1804b1-441c48be0c5mr57583835e9.12.1746448596076;
        Mon, 05 May 2025 05:36:36 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b8a286c4sm131072725e9.25.2025.05.05.05.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 05:36:35 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Da Xue <da@libre.computer>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250425203118.1444481-1-da@libre.computer>
References: <20250425203118.1444481-1-da@libre.computer>
Subject: Re: [PATCH] arm64: dts: amlogic: gxl: set i2c bias to pull-up
Message-Id: <174644859542.1377721.4181662111472881192.b4-ty@linaro.org>
Date: Mon, 05 May 2025 14:36:35 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_053637_758900_24459757 
X-CRM114-Status: GOOD (  12.90  )
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

On Fri, 25 Apr 2025 16:31:18 -0400, Da Xue wrote:
> GXL I2C pins need internal pull-up enabled to operate if there
> is no external resistor. The pull-up is 60kohms per the datasheet.
> 
> We should set the bias when i2c pinmux is enabled.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.16/arm64-dt)

[1/1] arm64: dts: amlogic: gxl: set i2c bias to pull-up
      https://git.kernel.org/amlogic/c/16d4daa00ee69a43a4c79000d40f9271c85f7879

These changes has been applied on the intermediate git tree [1].

The v6.16/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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


