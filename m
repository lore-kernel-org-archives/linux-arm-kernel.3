Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF1DCC43602
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 09:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=np1GDiFHQ1CuNSD1vWdE5qciQiEtsdk58lh2fmJm4uQ=; b=X2PnuhyZygAM6P28iZnHrQTrPZ
	qDUngGI1fyjKBVxoeqLfFhYjMljWMovm4L72kBV3SaY+0RJb7SaWisnu3ukXwo0aoSUUFtN9ucm7a
	VWwmu4O6wLt7vWEhG905XynxINwZmHALUBatjaEwTfUQ8h3M4Ga55TldOjD2wm75Dg2jmSxx6h/Zv
	kgcRDOmHT+AQ8/NPzUTSp4HG9r58nLICpeqJLeXbzCdeuF7nzM27Wu3TuP7Wg0/y4MBuRQlb04yCe
	S+kG4VOPvlPu2NCdGF5fTQdTggSUicQka2S/9pBSkYEiN+Y1wraoRNVM9EYOArJkOXkMGn3LQNJgD
	yLS3g0iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfaYB-00000006W9T-1qyU;
	Fri, 03 Jul 2026 09:51:11 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfaY8-00000006W8i-1Ko0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 09:51:09 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-475881b9a4bso312178f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 02:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783072266; x=1783677066; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=np1GDiFHQ1CuNSD1vWdE5qciQiEtsdk58lh2fmJm4uQ=;
        b=BEDhUaoAXDj4c7pMZxMFqKq5yte8sEdnpxqlmxTtC0HLx9Ax86M9F/oqAJwau2R6J8
         GfUVlmednRJ9UGyZKEA3cL03MHwy86r47WlKnP8WqMbsh70/dF29vNlDBScKOVT/m0pz
         9Fm5mukNo7kcm6oSxBASJyRjyndm+xWg5HNk7fTcE5HjZ0nrOWL+fVOQ5MV/ESiWsroW
         SqZspYMyQK/t/rTETx6Q7drGue6vjfH19oWwz/VfHy2nnvbN3hi+9so+1CEuIqIfaVwD
         mylN2mSdKwOuNgafu11ijNmUqGHWHmg5rwXlHWCF65yroUt/wKX+ASbsCznn7AF+/6jR
         nevQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783072266; x=1783677066;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=np1GDiFHQ1CuNSD1vWdE5qciQiEtsdk58lh2fmJm4uQ=;
        b=Gp3QpnIbukwm2jqEciNbsxFMO2umj95s5wS9yBBVBQGNiJaZ1nuJL24kx9bWpx0zFH
         OJ2+kVIU+h94PJ4ge/IcwJoO15Ne/x3kCspd+/0ZLxj/OAIgS9MCLwEDo6xyiYYT9xbx
         e3Ip3QtG+ltH+kZ0aKInIe19OGRYzj+I3xlMwlkBq+ChzILedhomqqK7f7Ox4UZg9x4m
         ER1/60BjHzcedBDyJRo+2lBjVhXLO7w3Y4l65eJbRdYK94ALNZtSwo5HQPhCmD061DHm
         j9kCd2V0W5I8dTvyb02TmS1G/+14NEEYThUelo4+F2AOz5/OBUt/sPuxmW6w46+lh3VR
         IBeQ==
X-Forwarded-Encrypted: i=1; AFNElJ+B0fCwcYcKPO0GV+qSMBTgg2mtvFtmPtwLlr/Uo28KG2QEodJujyYuDFczJcMLFcLHABICdDO0SaKoCpKKus3N@lists.infradead.org
X-Gm-Message-State: AOJu0Ywv9EwN+veUyetx8vNSFLzqdhUhNnpmlpaP8ofWNkmiNxK/uuz6
	7U6AHkb7URbvoeCQkcQQdc5+d5vmgGichT0fj85nLnwTGYjNy2rrgkEGwzBMmhbMSqs=
X-Gm-Gg: AfdE7cmX2A38GFWuxLMvsKXCeuHtnS+7TSxz67CY9bNWJ5CXd3UjEq80S2QBAAO3vOn
	e8b/V9J185uBUJVOJ/Dh/eqUkcDbjPZ0aclwtVRVvet4OHDDGBWiAilbZa0NYWZeXJfU/BoMRgi
	XlFy6pfbMiZwshAmhhETher4L9UU11z6ucuCZ6+ObjK77jkLjOOJ/QyII81K2kELiGzH9y3uihn
	k+ZWCJLpVnzywtAiNpohTFR1EAdgRs8Hxt9t000nyjvwJvVhMyud5zxpdSVxCJR4yp5e+YJlBWk
	ZckNzVsIfwfhYURP4mB4l4Xze2xEeRLXmhEE3RWBagcWJ4wdygL32SRtYHeB5HXWMRYGMBZ1v5J
	pfMbD7aN+UM7VAynAwZeWQmksVW+ywDz14VEDlfy0uzssaHhONkE9aX+brafQF2eYiiHOsoySOz
	knIZsNbc1MTLZNrx6tKebA8FSHzfGuFG1DOg==
X-Received: by 2002:a05:600c:60a:b0:492:68bc:3237 with SMTP id 5b1f17b1804b1-493c3cf8cc5mr80908995e9.32.1783072265643;
        Fri, 03 Jul 2026 02:51:05 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bfe616f5sm126116215e9.1.2026.07.03.02.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 02:51:05 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20260421-clkmsr_a1_t7-v3-0-efc00b0f9e6b@amlogic.com>
References: <20260421-clkmsr_a1_t7-v3-0-efc00b0f9e6b@amlogic.com>
Subject: Re: (subset) [PATCH v3 0/4] soc: amlogic: clk-measure: add A1 and
 T7 support
Message-Id: <178307226476.3253856.1594545228633804096.b4-ty@b4>
Date: Fri, 03 Jul 2026 11:51:04 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_025108_394237_B18B60CD 
X-CRM114-Status: GOOD (  10.69  )
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

On Tue, 21 Apr 2026 16:17:40 +0800, Jian Hu wrote:
> This series adds Amlogic clock measurement support for A1 and T7 SoCs,
> including binding updates, driver additions, and device tree enablement.

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.3/arm64-dt)

[3/4] arm64: dts: meson: a1: Add clk measure support
      https://git.kernel.org/amlogic/c/dd3d4327240dbd5e4a256f7428f92f454e23edba
[4/4] arm64: dts: amlogic: t7: Add clk measure support
      https://git.kernel.org/amlogic/c/d0a92020bb87b45a235d9d1f9ce76494e9ed02ca

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


