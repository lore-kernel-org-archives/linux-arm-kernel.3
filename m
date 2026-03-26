Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A83106F30A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 09:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1sq2P0HkEGVyLD86Q+rD29RmS9E+DZcdoWjOdX4Q/j0=; b=vFaiPTdaZvbbMuMNoRX6T8T9t6
	U9bnFUKiWsRwm29nAnG6QqU3cItzJyXQ/++ruXREKxf9ttMpi9NeO1DTwWFH3hurGXAiCasE6UrEu
	6avK8hPSdpwANSlpfq2bj8Fy7moeqzRfNowCgaL+O8vRDuYxGR/g8kmGTt8h0RhZ+am79CJpfQICp
	9z0aczhG8btunkrT4g6ou5hwPWxMWhba2uURdR3p9eC0JhYKXjS5tcpxQmVyTtdsSFRxTYkoGNqPb
	vP848hlpti9LUZvfqqeJKgvvf3lFAlAgSXoKkC2O2c6SNPlPIW4LF375YyrNReKyfo2bcvLJblg8B
	mLL6jo8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5ggP-000000056UF-0Vme;
	Thu, 26 Mar 2026 09:07:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gfp-000000056Ez-0T7X
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Mar 2026 09:06:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1sq2P0HkEGVyLD86Q+rD29RmS9E+DZcdoWjOdX4Q/j0=; b=jXfhAQqwrZQVjdmNpFycWvK64V
	X5E8XlD12BwppadSzH7HZFOD6BBMHnyUKj66rOdauFIp0r39MmTODJaABZTUTngrIefRJQpDzhuQS
	QzuM8ShKVPSaoq6m34LbNx+s9su+uOX26nb5rvhIHtN/jeKMazQ6qrv2VcLa0HDDaOqfRJZZRkcVc
	zrJvOjzo+C/y7GIDI3bbwOYBqPArqhLNr60Q76mnycxoXdkF+t/h492iMO4g8qYO0OGh2Ozqa6NJ3
	dq4IgGTIbYbyH3hgS2Egr8JCOApRI+b/uGo5yURpKbo6sUzaXZmxsilArQk2sGmk1nFTsEzxNwlox
	g4FPuxbw==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gfk-00000007puc-3KU9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 09:06:39 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-486b96760easo7497045e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 02:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774515995; x=1775120795; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1sq2P0HkEGVyLD86Q+rD29RmS9E+DZcdoWjOdX4Q/j0=;
        b=ARlcuPz9WHRbdMTKtf50UNqWeeVxMx95RhNMIU2Jyo7/cX+hTX3zdOZkW65H3K0sH2
         11agG0DdhABBTac+t2OwK3IFZzgWmTbfMiZiiv8eK3GP1Cf/OXrLpmvcc64N+qHyoK/j
         z1zL+EGxHj8ovwY206j1TtEatbGM2fnLm6oSZKVCQAFT1YS3NT/3s0iwUHYPDiDEmmsv
         2NWdLQP86LSgEvv7texcbqH3HwW3rt4J3HEDA9ZbU21zgpUfSjBrFMZMaNmgc3DRjvea
         glgbNqh0NZHMw4/L0hT4CjA9j44oZrxgJYLBF59cU/AFXCoGTSAb2CWHPCfLTDd5X0kP
         CkLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515995; x=1775120795;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1sq2P0HkEGVyLD86Q+rD29RmS9E+DZcdoWjOdX4Q/j0=;
        b=UcXDKZXtIMqGNy3KC08NYrqhqIRUdedVVre9zeNHCmVQ+aHruLJY0h1PKgMtT3QLJs
         nidYFpMQ1t9y/4X0Qbo5hfag4qSmDCAZ2hb67ye1K7b07p3jgwYMEO0/S+qT1ZgQai/K
         gwjvyLAhmG5CuZpFjhYkLgMmJm4+qaXFnplGOMRwSEJeSvvcpNwBZWPMK9aTvEa//qUK
         zraTjeYZncAiEO8JEwTlRXpIuwicCJo0++n2JpsVCLcsRSK8q7u3MJWRK9qKoxR6c2Jv
         TAvARqLPs5z/cM0sNyjWmTUsnBsdtnLubf7+LROFiDC4IpeFvDfGw/X3UFulI395nafO
         gEbA==
X-Gm-Message-State: AOJu0Yy/dSN5SNIubxyZj34Ot6ieFKL4968Z3vobNhNgdRyXxpqfDhcA
	VVuz+hURSKr2nYrXv7tDS5jFp7iST3mCiWj6wKPjj6ivxfmwPJKVjjxKog9b24G2xcQ=
X-Gm-Gg: ATEYQzzCL6BKYIkIs+6i+XL79XyWnnZjLCXaBoTQX7E0sza2Sq0Mvl0VIxzolASJ2VT
	bU0E2vVGigW4rSDPFiUWRZ7z27KF4kWWOZrTeLN3upBZ4xTcjeMWq09AJa8UvhDQ+4KrhPu4dFx
	NMwLccsnv7hUBUdLajU5O2r1KnQTRwCavNpLIjEOYiMVqWLbp+sw75spPrkM5qMic1j6P4nWHDN
	AR08vZBH8/6J3UdMO4hnm4s47xCHeUrO/kNnJ3c8HL3zT9hv9lJqGQOe2qWwKTPk/Y5IOB/zloK
	atRR4vaf8y5TqU5x7hXCrBIUhNmbB5J4d3ufnCK3mUXc6SVzOD4ezdkAdkm8kb8n6sYEw1Xk5ym
	wLTeutEWrWE4SUMngWGYCop7sx4bup2y3/AP+UDjnGMFnluhXWFZ5gJHHco5hsEm5839m7c97TF
	swVOMIu+ilzERByk9tY1leTwIb/o+T95knQA8qutiPjyyD
X-Received: by 2002:a05:600c:3b12:b0:485:3f1c:d887 with SMTP id 5b1f17b1804b1-4871606dc4fmr98188405e9.26.1774515994012;
        Thu, 26 Mar 2026 02:06:34 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872090368dsm14726905e9.5.2026.03.26.02.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:06:33 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260305-fix-amlt7-gic-dts-v1-1-5944415c74bf@aliel.fr>
References: <20260305-fix-amlt7-gic-dts-v1-1-5944415c74bf@aliel.fr>
Subject: Re: [PATCH] arm64: dts: amlogic: Fix GIC register ranges for
 Amlogic T7
Message-Id: <177451599311.122020.5478331004952016731.b4-ty@linaro.org>
Date: Thu, 26 Mar 2026 10:06:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_090636_959007_E0325313 
X-CRM114-Status: GOOD (  13.60  )
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

On Thu, 05 Mar 2026 23:11:25 +0100, Ronald Claveau wrote:
> This patch aims to fix the GIC register ranges for Amlogic T7 SoC family.
> 
> - Context
> Kernel log shows a warning about GIC
> [    0.000000] GIC: GICv2 detected, but range too small and irqchip.gicv2_force_probe not set
> 
> Using cat /proc/interrupts command shows GIC as GIC-0
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.1/arm64-dt)

[1/1] arm64: dts: amlogic: Fix GIC register ranges for Amlogic T7
      https://git.kernel.org/amlogic/c/dbb92c6f1ecd0dcd76a3d1002141f340737f55f2

These changes has been applied on the intermediate git tree [1].

The v7.1/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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


