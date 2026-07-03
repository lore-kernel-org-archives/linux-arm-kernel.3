Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4A2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 10:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9aa5VRYjwfcBa4J0ha82pG4RI9w9o+IbdPuBnZ7LdEE=; b=i9CdlFcW/gO8fhNEbxNor1zXZ+
	Cms7dDulre0nu7bPyEf5YV2uybQNScfKQh5PAnL1jD1rnoi4rS5NLZSXspUpthk8VyiRv38LIgWLZ
	+eMJoWFNDjlq03r6eveF2/dkIA7XyomHMWgcDOSbjbcJ6TJoEdRuqztdIt62QdiH/yCf1Q1arfw/B
	hpNjXCZMBdrswdzg4Fw9KfLQwfLSV4LaItC4K97Ld0uaEI2sbA7ffUguwFwMDQhnFIEiOX5ZQbAwM
	Fal9qjalbnF45RKu6nh3GRRbKcLm2NvJL/1AL8B4nWHs2FeLA01nUaHDxiUj5UryH/RKFvjoNyZwH
	bKK9l7nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbEx-00000006eVh-3z2w;
	Fri, 03 Jul 2026 10:35:23 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbEt-00000006eLV-1kbS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 10:35:22 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-472055b0efaso301599f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 03:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783074917; x=1783679717; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9aa5VRYjwfcBa4J0ha82pG4RI9w9o+IbdPuBnZ7LdEE=;
        b=Q83CnW4f4k7zDHFAAWOcwbuhceZXesChnZfPuZJu8h2gHqZQ2KXN89TEKAo9KMbh9J
         C49mUSoFG4rS3FT2VlT5Wn1M6i3xOixREcWBvg3CXjNndt7iuZ6ojHA9F+EwKrFWVoQG
         rqe/1WsnsoqO0hlEY9DDIkux39bz9sCS6GjAXkWMl9sTHHmY1g3mBGy8HDwcpX0/x/yp
         JHyY7DNYd5mtkMZVHgpK9oyHCspsh+F6ASHiLXD56kxQcr4O2wIx58uXDb+6Y0QY7xAd
         JvSVpfyIoSW0tLe1XT7ijD7gjUyGt4/rRucRaod7Ywm3BfhbPupvdNXNgRAfP6oIh312
         O3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783074917; x=1783679717;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9aa5VRYjwfcBa4J0ha82pG4RI9w9o+IbdPuBnZ7LdEE=;
        b=Umvx2w/NCVgjgSU0FDHz5ZWzyu8tmDKrzFzDie51YYYCEOSj2aPXmp9zv/fl+G4M03
         X3da72A2q5657PZ8D81cn/7MARwkwUoj59/tj+vZBYGBPKDFLsRvdJG5owwIYY1RPgvF
         D8xcsWXFmGwIir9LQKUVnajPTRFjzaFVKNzP0c0cqxSlTunFcgIKI2RjKO3s6MSwO+Je
         1YmTXBZxnaI9Eid58+NFNLZNT1EcrlDgo1O0l2iJ5ZIfKpgvjyqBW/w8dMZyA5b5JyMh
         yYga5jQpCRS/lYYi5MXX59jBNFoYT40TWbM0NCX6tKnuiy1Gvtwmdy1oz/md3oWieRi5
         iwIg==
X-Gm-Message-State: AOJu0YweVedHvggDY5gTnFe2lgZc5TGCLWBwthJmQfuyelpGIhZpfVfS
	T2Ex7ykCAjQHHrCqgg57zmzK5kWFsT5TMLeyYfhphuHg+7qSqSpD2FUi1glzQYwyVGo=
X-Gm-Gg: AfdE7cng+Er0w8TVtbABIYZyi5JWd3bwOaJmp8idfISPKOOvmYQqNTWT2GMcLPVxcb8
	ow3lqOSA/VP2UH++bxjuHMP2xH1QxIYqad/4TILX2i9a9HVgaM3YtHTFi5z5ndyK8stcWDnT4si
	/wAYXrHgT5SQrKXSx0mdELdufST9d9GehM3YuSJdgetzl3HZd0JGWN63SBlc1zyUzS8fUyi8FSx
	BEvP1TeWVqRurZcldTpZGoakGKzTTFEwB2I0P28bk29MdCTIzqU92rs23EMkwLyMjvkpDw1vzAn
	snIDQ+ofu9C1Uq+xtwaRrxHq+PYTODdyuW3BmeYjYz89di49J74nrEN2Vyn37NaUXl5cVzHMvLX
	75h2sr5xB05iU4xpbtISLgF9B5siz8bDRsPeMrrkhSLOPE9KFhGL+/837MNdQzUQIkqVEmy8o6T
	lNs5LifwzJqOdP1Q6y4n0i7t1fPql/zkguYaz8d0gGOZvx
X-Received: by 2002:a5d:5d82:0:b0:473:fe94:9bf1 with SMTP id ffacd0b85a97d-47757f4c487mr15276685f8f.26.1783074917112;
        Fri, 03 Jul 2026 03:35:17 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a450bsm18149405f8f.10.2026.07.03.03.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 03:35:16 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260629-a9-node-v2-1-dadd3401fccb@amlogic.com>
References: <20260629-a9-node-v2-1-dadd3401fccb@amlogic.com>
Subject: Re: [PATCH v2] arm64: dts: amlogic: add some device nodes for A9
Message-Id: <178307491598.3384545.582524500298213361.b4-ty@b4>
Date: Fri, 03 Jul 2026 12:35:15 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_033519_506157_7CC23C2F 
X-CRM114-Status: GOOD (  10.28  )
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

On Mon, 29 Jun 2026 07:52:53 +0000, Xianwei Zhao wrote:
> Add pinctrl and irqchip-gpio device nodes for A9 SoC.

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.3/arm64-dt)

[1/1] arm64: dts: amlogic: add some device nodes for A9
      https://git.kernel.org/amlogic/c/3ecd66ea250b81dcc847253efa6e4d691e6523c8

These changes has been applied on the intermediate git tree [1].

The v7.3/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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


