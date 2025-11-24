Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA12CFD317
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 09:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=StnX4Pm5rfx0J+FKrbJIz7Gg4AQJHV9UVznv4XZEdWU=; b=WAKIkZhiePaH9EBsZp0BLqDJsK
	UnYtf0unaoS/VG3S66HbVeujFzZE26tLn9hpNqCqvrejRkoZ3Mv0sKZgE78eTumiLugujV9KF2Gip
	gIAhkE/dNeajHcM7MbMhNDWPMkeD/zxt88jClHkyVRHo+eVC9PoluP55SUuZ8V1FsI3p70eQ3xEon
	v9rIBBe0YAKm+iD9k5csa6fWPZ4HMJNlg4aJ9iSwJdwU1WDqz7kE6ncnKniNz7MHWuohnwv3j7YNa
	s5lSbGEBF3vROeqSiGxjNe9v3dOxt/NLE+W6Vd118rBqS833iir7mUln41krSvsf8Fvz16xsVjDfM
	YDxZCs/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNTLT-0000000BOSz-1aVN;
	Mon, 24 Nov 2025 09:58:55 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNTLQ-0000000BOSE-48FU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 09:58:54 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-47778b23f64so21185485e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 01:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763978331; x=1764583131; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=StnX4Pm5rfx0J+FKrbJIz7Gg4AQJHV9UVznv4XZEdWU=;
        b=NrgyrGiLBIcp5TqQXgRdix/Iqk/0O9zIRiX1KC+M1bgDN23zovcY/pmgouT8JfDdmb
         PK6+aXtpSORsIp+cMyrf1N1SjQ7anjnCHTLQ6CpuNXSbdYY5ryCNCDKgcsVzyv8eKIV5
         dvdIKDgQ/4WJbe0LiVUW1Nqnq4evyUR6bCCHPjerMt1ZGVcXgJUMl2RYULdKr5TOgE6D
         8UYcYkWHnySvOFs4qMEp+AbXldtl1WyTqVMjsWpMPG9JNZGfJqVYvIJU32TfV27QJd4J
         oYUXfKiz4TH1eGRYrTa4fQEsOjyxKN+vYLR2vTtCbY0MrnHNgbWrgCw6N2FyfcFcbvmV
         O8fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763978331; x=1764583131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=StnX4Pm5rfx0J+FKrbJIz7Gg4AQJHV9UVznv4XZEdWU=;
        b=EQpfYuiEb6n6V6Um4K4bixXLtyqGWAa/TGDpNJ0eCr98g9FWNYAOCIW8cCaTEEO8C6
         9fDS/PPlXFG8vxBc7R0SqXne8WAJwtJn38es9rru9myqVWbT02xzYfydaBJ2vNfQMesl
         uMMr9lReekA2E2lO9jb5BrBptKGDgB04QZJEberIKCYKk8o/8Zrmr4kSqYZ25/TyiRlo
         otPoE8wZQmISMAGWMB/hr1/aSSZ5qkGfxHUaHWpzSGyxFxtkq1TIOiZQZFtEo4Cd5Orw
         msWRZtZ2w03LyX6cbzcEWLUulOw4Dam529SCtZYLaLFeh/UYIPgZQtdWQ0Yy8eKFjgRJ
         rC9w==
X-Forwarded-Encrypted: i=1; AJvYcCU0j/oKyWyRGjut4aJMRnTBRqsOHiUQbfP8WsHyJb5z9LwbjLNXoMYjwB9YELrjnh/xoVzWHJ7Yy4qebCVx3m5C@lists.infradead.org
X-Gm-Message-State: AOJu0YzV8a0Dc38Ajj5YSOtYulR1XBINvo3DKC4KAW2KJq+Vw9RX1riP
	smKOYKiyupau+f39+0dLlX5A6CUQaPGkJukHAUKnzC+AVJOLSMhfQ2TCbU0E//8eIWc=
X-Gm-Gg: ASbGncuK+TfycpJ9rr5EwCvarV4TCASGVgmlic2WRlaERQ0VVrn/XBeSRsHGBb3ACjU
	SEGTvDryV8MwXbp124IQP2kTBb9eBgBicYewuI9Ng8JTBf3vW5KzyBgbGtryyc8jdTgU0C7b7vJ
	Lu26HWZ5S/Tnloma+/M+LY3EOs25unnyRVlqbk8Hy/3RYeF/6+fXVNUoY3uIZl0g037Wq0o5ELt
	W4ebCZv0vWpbeKmbmCiJlsZQ/RE3NKtY2zFP/SbyLIuws5VCM+KpcF5FVyjIEIev13qQUM5JDcs
	lQrP0a0qtLYIFuWMB4y6JmULUeZBOX+DF75cwi+re8EfZbL/qgdhLeNHaO2JOwEjhYX6n1WoTSJ
	TYpl1ORUxcG+4h8h85JIKByHvkdF7rNcqJGD2JtwPQbor8Khg+BMM70z3XPU1xHrwY+VmpzGqR0
	0vmRCKTn4NDohS1n8+JSFUuFF2QeeukW64gw/5GfaW3Q==
X-Google-Smtp-Source: AGHT+IGob8YBtobs0cZ6JHHYnC1RWGcF327uC/39s+XgiBw48PKNrpkNepBppOcnXYAOHrXO/pc1lg==
X-Received: by 2002:a05:600c:3543:b0:46e:1a5e:211 with SMTP id 5b1f17b1804b1-477c1143046mr93368805e9.21.1763978331169;
        Mon, 24 Nov 2025 01:58:51 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a97412e3sm143621875e9.5.2025.11.24.01.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 01:58:50 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Anand Moon <linux.amoon@gmail.com>,
	Guillaume La Roque <glaroque@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: amlogic: meson-g12b: Fix L2 cache reference for S922X CPUs
Date: Mon, 24 Nov 2025 10:58:48 +0100
Message-Id: <176397825606.3590190.10935817124468233062.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251123-fixkhadas-v1-1-045348f0a4c2@baylibre.com>
References: <20251123-fixkhadas-v1-1-045348f0a4c2@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_015853_047981_9F4A9AEE 
X-CRM114-Status: GOOD (  13.87  )
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

On Sun, 23 Nov 2025 18:14:10 +0100, Guillaume La Roque wrote:
> The original addition of cache information for the Amlogic S922X SoC
> used the wrong next-level cache node for CPU cores 100 and 101,
> incorrectly referencing `l2_cache_l`. These cores actually belong to
> the big cluster and should reference `l2_cache_b`. Update the device
> tree accordingly.
> 
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.19/arm64-dt)

[1/1] arm64: dts: amlogic: meson-g12b: Fix L2 cache reference for S922X CPUs
      https://git.kernel.org/amlogic/c/79482f3791c4760b9b0d8d9bfde9f1053ea3dd5e

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

