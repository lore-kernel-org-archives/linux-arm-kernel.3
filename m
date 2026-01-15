Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B897D3CC9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 08:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MCWoEpw3wp1QWWzaKGJbbw2SnqJBwo7ssboWE/GLIgI=; b=l+BUnzZx2++LOjDcV1UUiL99PT
	nMtA1tYmYSWy0ebr8zz4nucrxPvKT2eErp94bOnf5fL3wCczfMZ7Zvb5Aj0z7OvIZHwbiUMyAoXQ9
	Q0HK5JgVKJOj3u5lGGF06z4U4u4zT6gR3wtdsuR9Vf0YKH0wctJygV/JhU2GWne3LQjCZSex4PWRR
	Iq0XjVbc495oWwXnxHb6N3q1Z3yvtW1V3m/YQuSA54owYbGwvYmB2581Fy0GaLim848i3DhsPPgH1
	+yFKDc4qTAQlAJssdq77PCEWrFOQ0f3WqKPqIUnZUty3lxUZ1WER7CNGw3NqlVbYygoqRRa0WQXB5
	YZMp6NOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgINM-0000000ByAf-0gmy;
	Thu, 15 Jan 2026 08:06:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgINA-0000000By7p-2bZI
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 Jan 2026 08:06:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=MCWoEpw3wp1QWWzaKGJbbw2SnqJBwo7ssboWE/GLIgI=; b=CNhSbtrRU/D/DfB9oKWUHItlNB
	Rqet2tnj9JwPV2zdTf1exvPHo751UjkP0J5FCK9m1Ftulj3uLUq8X7yJtkjRMBNF1UisLMDvlsNqX
	KEOCqKtcbWVwnuJ5Dj+LQkDArZwUdJslInDdvWEjfcHOMJF48T5XHVnqDIZyIAif6m9W639EtiOeo
	2cS+9n90iUVk2mqmdFPBFAYNhYjtUfXVSnuBnXx/hFi4wJgfFBEPSov9x3ipZtuzTtxlwkP5tsyK0
	1IJI2k/Qifo03O/Ix4bo4bctYP97Ixl2Z7dQMNwGk5sCSROlu35GxP3AMFoJ34fM+fCDgL35z/Uh1
	L4PpYnWQ==;
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgIN3-00000006HAk-1Fsz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 08:06:25 +0000
Received: by mail-wm1-x344.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so7652985e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 00:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768464380; x=1769069180; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MCWoEpw3wp1QWWzaKGJbbw2SnqJBwo7ssboWE/GLIgI=;
        b=jQ7AjKEXWBTOZO2S+p+kisySmzIiQBDofLS93HyKPRFvohr5ExGcFnAluHklBgTUN9
         iwO7iZWEBLirJjaqXv/eEBMhA1VrOgRDOxRUx5JPpeDXjNPVYnoZzINc1zAwXG7XCHFu
         cWvfjN5vfiHPoYNNrm+65duMpdbEYdl+V7WrriZGv38fkloFGGTmrQOCw4JKaG90EPje
         ToBCDeemRexwJUHNrygKc1uZVedMoEwRfUaJ16HTgwn+tCMtfaWtAEcr46L5tXP0BEwV
         ZaQP8xCI3pS9ppatvvHcKP8Dj1kSSjpvsjlEU/S5wYYX88Bgykq1VjnWqvFx2Ddsz7Eq
         0nDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768464380; x=1769069180;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MCWoEpw3wp1QWWzaKGJbbw2SnqJBwo7ssboWE/GLIgI=;
        b=X0PURG5078WRZe0tJGwjOAADmCDtV0GAK0DTDiKkSlCK070BtUjgzlQ/xBCJS/XzN1
         fBc1Wnc9GW9etpJHWNRXNJJlNrfBC8uaFc6hScj4m9CwXZMlbLVXKOgAEPvhAtzuhHrD
         2EhsRonzjUe/0oIJWVfF4ik4EwJiQobt2UO+DNMAyhd0uXvEIbgFDJHBDUYNKBv29ooD
         HTUKpgwMvMANAU72vgmwJwnxPmKXfj09a3BGa1z13z1vMAD7DlDWIxIHbqL4yFjm1ojT
         2CrinPum3Dbe0KnQz5sUQTAGjprukaZ4wA1/EOKX8PvDz1+Fa9ot1mCRRtC3eCCh3Kbi
         Iv3g==
X-Gm-Message-State: AOJu0YxlTf6PMh4yTRG9GK1/6AwS7Whe505hLqw4QBN5UcHtzQ4bblMn
	0wGFx6+Fmv90PBRMOw2QiWuTjcbrv52s5X8DGQUTrd2Lrrs9MEmkjVQzBEPaGQrlSdU=
X-Gm-Gg: AY/fxX5ZQkRUW1PHqJpLCi32qqD3r0HXP2jxsgN5cWkoe6ic1LQbaek7Ux98xxaUJ/M
	GFCudh1TgIEf/38SsqREiZMQ01u9xCcHeMuL/YSoglyKOhgxVvEuUqpkXiq8VK2I2A/AdizhqB/
	pbEtciZO7aiuQRsCIublB8HsEgIQU38o0eaYuIBbd+hFOUemQLsu7bmw/tJsFApfzqMJSD5rmb7
	gZXgYnZXo1MNrE36iESmU2oA0/Y5sAdu2Zy+RX3VE1kHu0rZMv9A1XrHuDIXjhrTud1zSPWEO4g
	HRGjsYuw7l43rxRmFwLSIuGhDhNl8YksQjQbJyNQSROb0m1Wgwc8jQxliPkXdMxE9udMLlfLszT
	K6Zrx4+jONE7m6VNJeiY+qNSWjrf8ICvHebRajdr/6052gxDMlMsFiR9tSUx3/rEHOaXIRKP4Ji
	VqdcejXxYUqPeb73e0/AIs7IXWWXHOQJM=
X-Received: by 2002:a05:600c:3556:b0:477:7f4a:44b0 with SMTP id 5b1f17b1804b1-47ee338ed50mr52682695e9.33.1768464379529;
        Thu, 15 Jan 2026 00:06:19 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4289b789sm32875245e9.1.2026.01.15.00.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 00:06:19 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Yixun Lan <yixun.lan@amlogic.com>, Nan Li <nan.li@amlogic.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260114-amlogic-mmc-clocks-followup-v1-0-a999fafbe0aa@baylibre.com>
References: <20260114-amlogic-mmc-clocks-followup-v1-0-a999fafbe0aa@baylibre.com>
Subject: Re: [PATCH 0/6] arm64: dts: amlogic: assign the MMC signal clocks
Message-Id: <176846437874.1204537.16755777734370082596.b4-ty@linaro.org>
Date: Thu, 15 Jan 2026 09:06:18 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_080623_333969_0ABD5D93 
X-CRM114-Status: GOOD (  14.20  )
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

On Wed, 14 Jan 2026 18:08:47 +0100, Jerome Brunet wrote:
> The amlogic MMC driver operate with the assumption that MMC clock
> is configured to provide 24MHz. It uses this path for low
> rates such as 400kHz.
> 
> Assign the clocks to make sure they are properly configured
> 
> This fix has been split into multiple changes to get the Fixes tag
> right and help stable pick up the change.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.20/arm64-dt)

[1/6] arm64: dts: amlogic: c3: assign the MMC signal clocks
      https://git.kernel.org/amlogic/c/69330fd2368371c4eb47d60ace6bca09763d24a0
[2/6] arm64: dts: amlogic: a1: align the mmc clock setup
      https://git.kernel.org/amlogic/c/c6ccd0d9a253b59125e5c625139799b41f0de3e0
[3/6] arm64: dts: amlogic: axg: assign the MMC signal clocks
      https://git.kernel.org/amlogic/c/13d3fe2318ef6e46d6fcfe13bc373827fdf2aeac
[4/6] arm64: dts: amlogic: gx: assign the MMC signal clocks
      https://git.kernel.org/amlogic/c/406706559046eebc09a31e8ae5e78620bfd746fe
[5/6] arm64: dts: amlogic: g12: assign the MMC B and C signal clocks
      https://git.kernel.org/amlogic/c/be2ff5fdb0e83e32d4ec4e68a69875cec0d14621
[6/6] arm64: dts: amlogic: g12: assign the MMC A signal clock
      https://git.kernel.org/amlogic/c/3c941feaa363f1573a501452391ddf513394c84b

These changes has been applied on the intermediate git tree [1].

The v6.20/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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


