Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A69D2ED0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 08:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RhTNZPLJB74AIOTcNd2K19lHKeDsZdTgJx7+RGaFijQ=; b=fiJqqtnu3mG2TvNrZJNtgY3TCY
	8eQfrsgz2LmuRcNcHdvdI5Z/3f8MAx5IyLU0epZXdfsgmRkHCqWC8sUtBgaB3g1fM8tSKQH+TlsmO
	lLQvJpFXNbSzOqwsQgyPQhEfhuBsrxU/Y+5BXw9ufPBNMbqxKAoxC8XlIiTnegRdix2duI6A5tvft
	3RmqKQcHSE5sZ8/5aR7mvzEhbGM0rVmitgVkP+s5jUkiEEBrxy9TvDyOkZ/4z1yurq+SmB34CdO7i
	I9LNgfF9z0ZO/x7k61wqMr+QLyHNimEGLf7d5CHWRhhX1n8I2brKZ7/7U+/50dEX2DNw6pMrFEtMJ
	B3EA4G6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi7UC-00000003UPE-1UpG;
	Tue, 20 Jan 2026 08:53:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi7U7-00000003UMA-0p4J
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 20 Jan 2026 08:53:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=RhTNZPLJB74AIOTcNd2K19lHKeDsZdTgJx7+RGaFijQ=; b=Pr7h3RumwWtZmNh+SlqHQ8bEH5
	mjYAKJQYmQIjy8ckX2+Z5l7S/mYX3bNz/4n8XjR23SQ5XCO4QiPYfAseDFaX65rsVBXZhbMlto4JH
	5oVNgsBjrxShkgCkz3vc2azKeFncczFf/LI59aKe7jUN+x7feBtHw9FehzBxDpm1xkCGhHtpJoTiU
	z8TJ1Svu5TZgt0gIEEl8XCKtwuTGnyPmzkECedi//8hFhG0tKfaF/GDrgceqQVCZXAcJMeacAPlSb
	a0cNS9JR8N2yLsVbJdVVvtraYjtuYskGKyz9J6rrTFNOLUzOUbPX5rR7gD7wLpNYPTVhOdbUdUdoc
	FaeKgWfg==;
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi7U1-0000000DdW9-34xi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 08:53:10 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4359228b7c6so149307f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 00:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768899184; x=1769503984; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RhTNZPLJB74AIOTcNd2K19lHKeDsZdTgJx7+RGaFijQ=;
        b=zgbmUUkUMM3dWc4x6/L6RNDfAVQqL1K2Oq5nA6CdWtNKnCLLdU9OBaF73QZVJi3/Vo
         tV2Ggadb/Tn60jOM7+3ltG0XLtgO2fqdOrlitIvki7cxs1qQYw1OtismQssVwPAZ22aX
         zZrTGkHdv6jhgfd3bCn6Un7YEZeSfrDvMuKF4qj0BTN26exD5bk835TjewhYRoB4BOqV
         tfNfYTgkKpBgvDZkSJegERHwmSkoqBiDIeRVvl9LNWzoueKdxDq4Mji/w2y33kdaQdL/
         FkNgrklCXdhD9FPKjtCaftrc35rqCWS2xVZFjxSf8E82OJ/a8OXXmhS4ypuPzcG8ynfh
         Rf/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768899184; x=1769503984;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RhTNZPLJB74AIOTcNd2K19lHKeDsZdTgJx7+RGaFijQ=;
        b=FEOJS5r/DlTKhwRaKYIlQ1pKTZogHRCNmeq2zQdVQkI0Ao5hdARdSitrSDWjh3R0w9
         7p/4jxMpIho8T8UO/S36k+P8IPNSMm/YWpRluJI2Kp0Gxj5Lk+HkWLB/NetHlL+exQgl
         amu3jXU9O9xmdVL1gQWjl5v+4E/pQr2a8isd32/7fPXMuG86LKk9AWx+Y15xuDJEH7Ih
         /iaxgLhDiTTNkiPcomBIUy25ya54kIi6r/S6wH3/VveENZ7AcKKYu2PzQpcAGJZZLYt2
         Zizkhyjk4vsrzZHfvmAM6CqdWAJ6qfQa1kC04S8fd+ZnygEBQvpKbgco+ZwganmVrzZc
         +Otg==
X-Forwarded-Encrypted: i=1; AJvYcCUWhlsT5450KrPFRloCc2s62tVE7bz5iLE42FUbY6fiW6fhwyrezSC+4RchGC1e5W/V1n4hp6iBLs/+YRuEC1zq@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0iAc3/V/qBK/K3ldB1Vt6paiJ8T9LjqU4tzIbFPNPhmvrIAJN
	PQl52x6B1McVcMkLqqu2brSaTfWD9FpJqpU4h3vmysHRBI7MHdVuZBPHCKGD46nKLdg=
X-Gm-Gg: AZuq6aISfbpE6OTwXSfFONX1UrnQKfrhNoYLreyvQHCl4LCmBDyLguvi9iCRuX82RGh
	EvvjYrw4ZLwuz3cJkjmPqPMJmYHDHJsVc4AtR1w4QS5YWUMjNOso5FPgHgyzzrXlOnlXlM71Lw4
	zHzOl6iZtca8Ha1P86XIOYZM9CLGXdztuUQGd2CD7x6IZmQH2gQXSr2B1lz4zJRalR/EGSdzAmF
	IqisxuIu7F66orokgwUNmDxtRIlzSNPAKW1DDzra+Etm5kRNcStAqTwo5ByCiWV8b+Pue2LttXK
	59BNJF7dpuw3Vn9CrKgjYs93sa7XYh+gwHrloRgCPvLjPBbB22vTR05PU/oQL8AnS3y9Q1hyv9f
	mrr6cUAIJ45Lx27Fos4ZgAHpGJvl7l73TDbsVesMM4z2qqBcBY6aAU3Vh3YDZmYvBRYCAM9jV0I
	0RDZCK+d4sOrI72gZf58RflLJNvVqWJUU=
X-Received: by 2002:a05:6000:4021:b0:431:488:b9a8 with SMTP id ffacd0b85a97d-4356a05373dmr17993354f8f.33.1768899183812;
        Tue, 20 Jan 2026 00:53:03 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569926ffcsm27597335f8f.18.2026.01.20.00.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 00:53:03 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Ricardo Pardini <ricardo@pardini.net>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260115-arm64-dts-amlogic-radxa-zero2-additions-v2-1-948bb0479a45@pardini.net>
References: <20260115-arm64-dts-amlogic-radxa-zero2-additions-v2-1-948bb0479a45@pardini.net>
Subject: Re: [PATCH v2] arm64: dts: amlogic: add the type-c controller on
 Radxa Zero 2
Message-Id: <176889918309.1477585.14101357068287603082.b4-ty@linaro.org>
Date: Tue, 20 Jan 2026 09:53:03 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_085305_866315_FFD438B2 
X-CRM114-Status: GOOD (  11.39  )
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

On Thu, 15 Jan 2026 18:52:46 +0100, Ricardo Pardini wrote:
> The Radxa Zero2 has an FUSB302 controller on i2c3 at address 0x22 and
> INT# wired to GPIOA-13; include a minimal connector.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.20/arm64-dt)

[1/1] arm64: dts: amlogic: add the type-c controller on Radxa Zero 2
      https://git.kernel.org/amlogic/c/2afef25cc448ada7c9a7771fbfe4087a9e1a6d03

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


