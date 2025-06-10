Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A928C678DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 15:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yJibE8vzk8gYYAz656wGhXQdfbfshNUam9Sx/5ZqBBA=; b=fj46pNpZl/XKobfkDarEsUXEpv
	Pvc8V6hWAHHwO+h93+YvqJLZikCJKM0JM1hC/Pn+/UMmQsL4s5rzohIstAA4lTBDMBTKXB0+RkYP6
	XMCgcPMT9xAGuYwGJJ3L44+JTrnWDH/2ocKVWXRvjch74Yx/RQJcCt1kHM4V10uUh46AAj+0H76WV
	6diIK9NOqNs74wS2L0hC58FBSpU8079vikku8efZD8q5pCC3YI+eP5pvrgL3vd9yKxTTLbfvx1NlP
	jol6H70BSmwYbPj25msqu26qlbvDsMnUxeXOFndpdds6yxoG8+gkjiaARaE3JFYau3j054KFXWYiq
	gCyh1/fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0pU-00000007IJk-1cUP;
	Tue, 10 Jun 2025 15:24:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxuq-00000006kMq-0ruc
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 12:17:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=yJibE8vzk8gYYAz656wGhXQdfbfshNUam9Sx/5ZqBBA=; b=od2Wn9gT0YWUR12UdzJt+iEKgM
	WDUQ25PALmtz92CkHzwfvb1XyCV2bnXTxjDI5DE68Cc3/HaCQ6gbgdtq7EwoPGmTBHqakjPZTp4kk
	514QNoUSrVDs8nC8SWySw5zo1M8t73dSwdJijUSgZjTn8CTOS1xXG8yH4KuXf3ecMmuk6RhE69Gdh
	FqGQE345Y0FOnAD9QxeTD1CygNB2WI2VJnZGgrP65JXz4+tG8ls+rOE2M17KCYNDLPubIZ8sRe6WE
	Af3u6qcDVWzc0y/5YL8Pe48fbvW2K/dMCemEoHq0oUhZQyAA06W3gDBjusTQiHU8fFoCbEqmxb5sN
	xuw2rUag==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxun-00000001nr1-2Ugj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 12:17:19 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-45310223677so18435455e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 05:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749557834; x=1750162634; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJibE8vzk8gYYAz656wGhXQdfbfshNUam9Sx/5ZqBBA=;
        b=PhbfShR5Xcezp+7SCZAmWtlnNGb8t+rAMfXan6vWvXtMS+2E7CkctFT0NRVym1g3AX
         Q5rScapE+HtqzBXLhH3O9jrp6MyMubmtltru6YbOOzQheWSgUNK8zPGkMkkiVrp8Gb53
         380YcE/QUGgDCPutBMy0tGjhkb4UOSJHvVs4admvq7MjHM4eZhbv0VMluwMS2sOgsW3l
         eB4XaaSB9udSQfTcQTB/q12OaKzrj9xxzcDl78H4LAiKwrIfl2N2np+EkY34WSmwGRWg
         mR6AdWy4/ghjFrS5NUHf/rtl7V5AOPrZ6CjI5ZTrL/OeMijWJLTHWybarmL+4cpEDV0M
         Xlsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749557834; x=1750162634;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yJibE8vzk8gYYAz656wGhXQdfbfshNUam9Sx/5ZqBBA=;
        b=Zr/uVkRiDJ5T6I3mhm//EbhJwieKC3ba428ZV30nUGKGI0ahiDmozcoEzauolKxhGn
         KW4W6Z2YJ0DnyG7vYL7VUNIc9O3fTSO1kxzVvcqDVrXA3C1r/o9Q+/LIJixA1yZFsS9J
         vigWx96lbJbSfXZAYY6T9Xi1bRfLHV9dkoyp/iqgojsRkW6pQQfPWncuD3Ige62U4IPI
         LeclQ/alsrx/K7OIcJhvZc92MTgabB7i4bv7IXEgWV0JJ61C2a1tsK9AtcmSjqgVXejY
         wObt0gFzWRypcGlUuJK/xyiq90O7iLc0gNoo+RJmix52Fdl+hauGJFEIc/wVGLATX45M
         90PA==
X-Gm-Message-State: AOJu0Yyw2uQMgNygBvGxLqEFoY/fwQzijqjSHfYYH6OvbRKqy23yeZ87
	OwxT/+M+OXbPaphPtouJS/R7q48RdWxUKWTf1nIUctkhnOf19kgtwg7k3xPPgpR9sLc=
X-Gm-Gg: ASbGncsxolZiUSWhHo90ZaUzle9ODr6Q82YEV0+a0NdH2smnhl6aMR/MtOrFwksDuQp
	1x+LyrvzYABnrgLc02PI9Nbbm4Q05h1NBE7xT4PAN3EWc635sIEps7MuCax6nbt1jXS1b0Qf6bb
	NAwLJ+gIlUU3d+KMGcYwPMQzDO3i/PHfm4WqW+KnMXSPdY1yVIjFhZWohb11rCS4BwjdS6ys4Dq
	7ZpeYA5txwIIuwUyol6bzRTC86VLvkFFNyr1Atcl4ikvUBPA7FZ4DPaMjJyODoxn3Vj05oVFBvv
	l78zkbldsso6lDvV7Q9Xf94G3EK3zcCTFgxiw6fc2HcPtzS1x1YbOFzOQVCC+5J5Gf5Y8xNdmkO
	YA4XVzyxmW0zBfAnJew==
X-Google-Smtp-Source: AGHT+IHeRxL7AIpQs/dULM8FxMsmTh1TJE0pgJiXuKAcZExlRGsP8IQNBSgadCI7/pKMwjfUXDxtaQ==
X-Received: by 2002:a05:600c:1e09:b0:439:643a:c8d5 with SMTP id 5b1f17b1804b1-452012ace18mr187168685e9.0.1749557834455;
        Tue, 10 Jun 2025 05:17:14 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e1595d4sm136313625e9.16.2025.06.10.05.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:17:14 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20250609202751.962208-1-martin.blumenstingl@googlemail.com>
References: <20250609202751.962208-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v1] drm/meson: fix more rounding issues with 59.94Hz
 modes
Message-Id: <174955783398.1721274.13530320235871545331.b4-ty@linaro.org>
Date: Tue, 10 Jun 2025 14:17:13 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_131717_687896_83309C8D 
X-CRM114-Status: GOOD (  11.71  )
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

On Mon, 09 Jun 2025 22:27:51 +0200, Martin Blumenstingl wrote:
> Commit 1017560164b6 ("drm/meson: use unsigned long long / Hz for
> frequency types") attempts to resolve video playback using 59.94Hz.
>  using YUV420 by changing the clock calculation to use
> Hz instead of kHz (thus yielding more precision).
> 
> The basic calculation itself is correct, however the comparisions in
> meson_vclk_vic_supported_freq() and meson_vclk_setup() don't work
> anymore for 59.94Hz modes (using the freq * 1000 / 1001 logic). For
> example, drm/edid specifies a 593407kHz clock for 3840x2160@59.94Hz.
> With the mentioend commit we convert this to Hz. Then meson_vclk
> tries to find a matchig "params" entry (as the clock setup code
> currently only supports specific frequencies) by taking the venc_freq
> from the params and calculating the "alt frequency" (used for the
> 59.94Hz modes) from it, which is:
>   (594000000Hz * 1000) / 1001 = 593406593Hz
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm/meson: fix more rounding issues with 59.94Hz modes
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0cee6c4d3518b2e757aedae78771f17149f57653

-- 
Neil


