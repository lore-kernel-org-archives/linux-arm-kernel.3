Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316B8E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 10:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ORCqMwl+SAp/HgeyDZWrdJX6WYlSwrJwZn4hxNWVVck=; b=SGVJBNSfioFXZF4EHxV4sbf+Yx
	YvbwGjjLfxPI/BLQJMNVjzAliuRmu5za8Z+sR4WjiqLfSvxLp7467+mp+Vw71ezHdUEL2S4K8R3+S
	VHmvzo1y7RXh1wd9I/QUpj2E5QwYgunqMtQ7G19n9qyKnt36rdtkC7as1lDWcbhmKGePx9amgHXv0
	pmdd18nzgassO8av6E/Kp6HblCVP9/5WV/5wjXnuMkrGR1sBXEi9pvnXSgYtuxq43UfW/5Kw9idFq
	/Ve2dK26rWYwJBKthAErLAvX2T/9k1N7yOVefolODQO0YIKOzEeWOULQgYkjdMX0y/3Qsuv2gh2C0
	SCyWAS4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSCac-00000004ziB-04rH;
	Mon, 30 Dec 2024 10:01:34 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSCYe-00000004zRB-0zSH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 09:59:33 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-38634c35129so6889980f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Dec 2024 01:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735552770; x=1736157570; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ORCqMwl+SAp/HgeyDZWrdJX6WYlSwrJwZn4hxNWVVck=;
        b=WeVf49BP9WG3Q/wiuY81KDK5doX1wGEEvdBJO4jaXOJmg3c816feV/8d+GCr8XdqEa
         SqK6jt43GntvjsUESuGzZghLclYtga5dLCPkGpy1+OyxqlkC7YaFZPSnzQn8UZ2HNbb0
         MkkUkS7vaRN9tXTniZATB01dIwNyeC58voHAZ4vCY+xDzdlbRH7G7C35RlPsIT2t6VnG
         sDUs3oNN+oqs0g+ACqAsoI/mAdiFyin1P7J1/Yn4OP/lz1HEuO0eNeweDds3Zxqk6MHw
         1FvmZGOX7/DgKy4EFQt4RzX9urK0wz7bBufM+tPxVDBE1gliIboN6fk/JGpAmalvz9mP
         4cVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735552770; x=1736157570;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ORCqMwl+SAp/HgeyDZWrdJX6WYlSwrJwZn4hxNWVVck=;
        b=nraxH9IR6G1U7kxmBaJ/t/aIuFX0XxMn7lo/bn+sD7M5e7Nz6ulWMSTsTWtD4JxfoI
         4I3d7RoIRSiVEn+FmHHtImlFDYWelV1uypBKbkOGuCH429UjEVde8XjkidnOCIqX+9Pu
         jBJEEIOaMcRdQHe798ujrMmj+oWPPBdpuFxoi9bNcnJVRyyFiLxqvTHJIvpy2n6kHU91
         RqLS4CZAXLGimXdSUvJG4xOiX0np1ZgqUhP20jO9km/01EkOedTbmST/ZYhTZoy8WWSU
         0AMaownY7t0f4MS7JMVlGtSwBPHJbCtogQYwsKOtmzt9tX+lO7e4MjyNO1p3eRkwnAui
         53hQ==
X-Gm-Message-State: AOJu0YyRjcpItSab4OHPIdCuq5wcBzW79JOf/A5l5i78TKkQHGNfaS2C
	vUcsN9l68DS50fKR/W09Ar8ejSpzCp5h66N1Q1If1D/FgU/xFHzwRne2c15/Ye4=
X-Gm-Gg: ASbGncsO1VixiFTVdBX+U31ua+Fb6WUpK1EkYwswnx7JL+RKemjlrk0FlSt/4YBygvX
	Ull3doSaBu9s/VtVI9HKGVCV3WkQGY5e5Tq/YgX9GFnittbnaJEW/3fiyjk91ek2llowoOD8p9U
	FtM+gQrrGf835MwGPbKKq1oVAEtrqSXZ59/f3cW+J/9oA6dlRhqy4Xh+wEs0ElMZJe5jPeoWgkP
	A/te47nXg65/nNGKBvrWZAoIzRcg1OptFz38vP7Bod/rT7tEkQ1zgM/hdLXO8anJ0ZuYQ8JzkP+
	uA==
X-Google-Smtp-Source: AGHT+IEtZftynNsczV2vu95ZXDwj5mXq7bMZgAVBOfkVYRXoJZgIO+SXbYok4rrRMwDseSXqu17tkQ==
X-Received: by 2002:adf:ab0c:0:b0:386:37f5:99f6 with SMTP id ffacd0b85a97d-38a223ff225mr24971091f8f.53.1735552770588;
        Mon, 30 Dec 2024 01:59:30 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c493sm347650735e9.28.2024.12.30.01.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 01:59:30 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, jbrunet@baylibre.com
In-Reply-To: <20241227212514.1376682-1-martin.blumenstingl@googlemail.com>
References: <20241227212514.1376682-1-martin.blumenstingl@googlemail.com>
Subject: Re: (subset) [PATCH 0/5] dts: amlogic: switch to the new PWM
 controller binding
Message-Id: <173555276981.2075882.719017533990914280.b4-ty@linaro.org>
Date: Mon, 30 Dec 2024 10:59:29 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_015932_276172_6634D8BA 
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

On Fri, 27 Dec 2024 22:25:09 +0100, Martin Blumenstingl wrote:
> This series switches all Amlogic SoCs to use the new PWM controller
> binding. The main benefits of the new binding are:
> - the pwm controller driver now picks the best possible clock to
>   achieve the most accurate pwm output
> - board.dts don't have to know about the pwm clock inputs anymore (as
>   the driver picks the best one automatically)
> - new SoCs only need a new compatible string but no pwm-meson driver
>   changes, assuming only the clock inputs differ from older IP
>   revisions
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.15/arm64-dt)

[3/5] arm64: dts: amlogic: gx: switch to the new PWM controller binding
      https://git.kernel.org/amlogic/c/12abaac5a70994490e565249dcffbb5c329b30bd
[4/5] arm64: dts: amlogic: axg: switch to the new PWM controller binding
      https://git.kernel.org/amlogic/c/77747dbb11466d5ac2ee11a260e8de0b65f3fd1c
[5/5] arm64: dts: amlogic: g12: switch to the new PWM controller binding
      https://git.kernel.org/amlogic/c/06c993691a2fdcabc43053a8fdd813cdeef516c4

These changes has been applied on the intermediate git tree [1].

The v6.15/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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


