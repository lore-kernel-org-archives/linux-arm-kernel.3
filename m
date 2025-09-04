Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A9BCA1002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 16:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FPemxXw+0FJhICaHUSL6epgUI+v6RGxIc62gtZdQfSo=; b=Eq7jl9yWQ2zAetH80BVZosX05K
	Eg2960PEgIIu6VPxoYUTtr7MJ9UqTBc594lKXx9Cn5f0okY8XVmHjH98sOlKw1CimVkZXvTSZj6Hm
	zbO0vyxX2QV0b+4O4/YJ0nt1mGvv5I3R6ryUAF5yr3I0KMq1sJdsWyuvV3df8/jUgbl8+glA8621p
	pswCrzgJBI6+2/ab9uennot6pKT4MEY2Yc5SM0a6q7svAccrW6M1DiQtgjOU3FG8pvxIYstORmCGd
	p6eokYvXxs+qZZCmaQjzVT8UCnX/q45al76sks580OVk/7mGNfa3pUvYZOG+APTAo1HoTUcxDnMNY
	4s7TDfgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuCo6-0000000CutY-2sjP;
	Thu, 04 Sep 2025 16:27:32 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuA0z-0000000BtKX-0h0h
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 13:28:38 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45b7da4101fso3788515e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 06:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756992516; x=1757597316; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FPemxXw+0FJhICaHUSL6epgUI+v6RGxIc62gtZdQfSo=;
        b=yEtOiLl7mgKIvgCxps/u1kH9eSYImWCVAlh7mAod54qzCi7YEsJae821B2VetG8gi3
         HcBAZ3/vomxSrTiy3j8OMqK8JAx7tKLrMNrpoMCppa/xmk9VGUr5fxq3K/6DywIEI4d+
         b5Hi69RAiIYx97BAdeahf3UAewDB8C6oyJ0LfADFLpQdD03ALJujUI+DSmMFXbjh1e4A
         kBGk4a76diXMeiLouggqbl7DtHsy1UdYosNhodutSG8IQc3m6Pn+sfa2SPr2b9IJvVEd
         7CsLa8Kk4kQZVJs7kWYeoP/ZML2lvrKsLFDEPhCbucii12K4Nk3VH4slCLbCMuQKOM+F
         2xUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756992516; x=1757597316;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FPemxXw+0FJhICaHUSL6epgUI+v6RGxIc62gtZdQfSo=;
        b=p3uU72o4rclegEUM/PegI6PigjN+tTUXefh8b1btsFL/VUhs7OobxcXF1pqLUt+L+G
         dIP0t+V5uvEc6hzIQER2fAyg4EHx1x74fqp67QInyw6VDJeb0nLQWlAmfRjLm80+6Rh4
         BA44GzIgGjOPvvSZ37KGoWiPZ1c5pmcfceaNyAvA3qL+2+rQ1CdveeUtSmhkzd/ltnUW
         3zS8HVG2qRlXOA6Pk1ub+CGPpuADU1TNoWXBORDqrcAAajelLWaznLZg5aqxjrVQNETu
         PPtGhCjHvT8lE8UF8TM+bSq8v6FJvnMAbWt4c+qgs9XPpJMu8BU+cu0Vu+if9FGnP+AX
         Vfzw==
X-Forwarded-Encrypted: i=1; AJvYcCX5hBXffxmNXsLmo0utidzgjIIUI0Q+ut2oGSEe+C+GnMychBEIOmFxf/trMw4Kwf6AFnL2Wt482Lyfs1ko/bNB@lists.infradead.org
X-Gm-Message-State: AOJu0YwYc0uosZfnt0vtTBdJfUhnAQcVMbYkTuXybfohCXkuZnUaU+L5
	M6Kx7koXQ+wLitEHPaEgAwmWVeFSuH1w8IGE0t2EafScnlr4muMDgHH5xL9eWuz8T/A=
X-Gm-Gg: ASbGncu4AaUEiQbdwY0gG02iLNH0JG2fkDNpuAvwzv/KRyp4YL8V0FkWNj4KBK8qazY
	yHxv2VTloIk2wygUYVPZfV6GGzqsyxIxKcU7kPUBNvveHnQSXlQq2CRuiWWd4vFIXsZ5qWT/gaG
	LgNQgOq5fy0iAa96cFD8Uavv1b7+qMhE6O+dM5HcXIEpLRq2bRFYcQiTGyMFFVG+pGzPSm8J422
	SxkJGdK+ZLRhEYNjGly9ZfSIRQ/Il5pzYsLFv6WtnBEvaiLsmusijD735p8K7ShOWCi+9t7mmQK
	aISJawfyTDaEntJ4UrgDSepafWug+UjlFEBzyO1W06T18Fto5izUt8/gsm6wMAo5wVyjcF3ShdC
	fau1TsrYNthDMVyywQK9eOKqsodBwL0bv8Vk+d2ch0n0=
X-Google-Smtp-Source: AGHT+IFChDxfidjmo6oLli8hpEv8BHitZXQWhFKQ0sFyaxZOzOcsJqvu3t6i4m2n6GGf1/m4WMbRVQ==
X-Received: by 2002:a05:600c:35d5:b0:456:fdd:6030 with SMTP id 5b1f17b1804b1-45d030f7fc7mr32582245e9.19.1756992511081;
        Thu, 04 Sep 2025 06:28:31 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e8879cesm286165305e9.12.2025.09.04.06.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 06:28:30 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20250505143700.4029484-1-christianshewitt@gmail.com>
References: <20250505143700.4029484-1-christianshewitt@gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: sm1-bananapi: lower SD card speed
 for stability
Message-Id: <175699251033.3374853.7119442456595565513.b4-ty@linaro.org>
Date: Thu, 04 Sep 2025 15:28:30 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_062837_197053_CBDE19CE 
X-CRM114-Status: GOOD (  14.65  )
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

On Mon, 05 May 2025 14:37:00 +0000, Christian Hewitt wrote:
> Users report being able to boot (u-boot) from SD card but kernel
> init then fails to mount partitions on the card containing boot
> media resulting in first-boot failure. System logs show only the
> probe of the mmc devices: the SD card is seen, but no partitions
> are found so init fails to mount them and boot stalls.
> 
> Reducing the speed of the SD card from 50MHz to 35MHz results in
> complete probing of the card and successful boot.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.18/arm64-dt)

[1/1] arm64: dts: amlogic: sm1-bananapi: lower SD card speed for stability
      https://git.kernel.org/amlogic/c/916fa558cb27182933fdfe82d6d84b437e69349c

These changes has been applied on the intermediate git tree [1].

The v6.18/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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


