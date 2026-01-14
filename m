Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83B1D29FF9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 12:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=luE4giNMbRl3MrVhKtHW9mq/sJHuHc9hfzaLz1OXmEk=; b=RNdzkdueso96SGnQ+s+99RfKDh
	yxt66VSdgtqAPYFNLWOM1X4CAugbqSyQWAH9PC1ByT7K67Y50CHcitA5laptovAGF9HRfAckcQr54
	JjzLLL3/ROjAMd2IiVZEmb4N28ifc6tzc/xdh/OgAz6M8UhtlLB0TQlr2O9C1klK5mxG0Tuomw838
	rU072QNc2kIGQWWIsB64tMwlzVOtXx/5yjZUsYHc36eaEmSxz0W5b5vKqxyGXKdmYxw6m/NeR9NfN
	nptBr+qysjNj1fLGHoF2T5JuRkRphV2NcFG3WE0G/79kMEXhSDgLoztEqNdewPn8teHtSP1MhwK5d
	YQF5LFHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfzic-00000009765-1s4d;
	Wed, 14 Jan 2026 12:11:22 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfziU-0000000971V-0hKl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 12:11:18 +0000
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-47ee3da7447so4294385e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 04:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768392672; x=1768997472; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=luE4giNMbRl3MrVhKtHW9mq/sJHuHc9hfzaLz1OXmEk=;
        b=wMJqcK3pEz72IHb9eWcNqP/qkUcgi8/QUlXxurU6mbioNhYYr1lzwr4GVzWZwr6/Ru
         qHrImcioNxQJgZfgf3vz8AB8U4cp9f73Uy6RJjoOfVetVycbccfH/t8k6c/xYLRKJPEx
         nlxqe+l7KxDAEGpUugrn65cC42iJsG8denuXc6l5+auxkhe+lX3clstx7HczzepCVoEd
         RsudZ43CfQ3+rOCoLogTLAcllKfYfAHa2536bbHyPldkoRUYCnqn9rbyMMO0H557A4ow
         tjyQ5csq0SN1OXKN1Ab2dihZQjOs4nwgta8Xub6K2VtgoKZ/5KT8u6Jn6KpmB3XLzeBI
         lecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768392672; x=1768997472;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=luE4giNMbRl3MrVhKtHW9mq/sJHuHc9hfzaLz1OXmEk=;
        b=n2fP0oK1tv+qKSQGKW29djlJ9kGSwB1tS1AK1kHg+hUqwCWiyeFbrvbe98rWKTFjNe
         mGtXrQ7LsmwqacEDM/eu6vFPaTPIGBx+gBP3xQGHrLDOIcITquJ1td08n/bny++HAAQh
         Z3eZmaNFT5e2zKNzOq3QCz673j6H/J4PiC+i1JklcTteuuqsOVoexcZyk5lx3H9wu4Uo
         1bjzkGVG1FTAb47wlf7gXYrBLbZfVU4LewVXqx32o2ypxuApCgZCewcYNcb/Ox2RvArp
         VkpbRGvPBaQbvhSwKqKQpie/L9DenlwJnUbpX80lg88gXSwkGNXISWJEc/pQb8Pz05N/
         kdkA==
X-Forwarded-Encrypted: i=1; AJvYcCUtuXUCoK1+klZ7ORwmQEBDNyNfwsZJGpRj93NEGWbbxkhofMiW8DFBXrQbGkmwrS5WJrlwcMQZAg8XzKUJ7wdR@lists.infradead.org
X-Gm-Message-State: AOJu0Yz40QWgl3+jaN5fLJEUG72jjjofeEozyLo6FV+eaxVQOUG1TygR
	eZN8KJ+H0dDaBdpBiPecT98rvKqF+/nSY7IwtxtMozI7WrDX7uAW8Xs2aMzxIMSpIkY=
X-Gm-Gg: AY/fxX4qegL7CJ6B+HZDSG4r+796Ac5LiQNxSwDvqThKvxqPg6ucMAJvIc8iNhUExZh
	D1eAAX8IlhA7RdY6iXd1r1MXyxf1pISR8nX8za0MtIbhfgwdAdm7TpQQSFSlo/qoU7u0+GlBlAt
	p3L06tFzaq0JkUDibv9c/VaT4mG8oxsMVMPX2+3GP18rx75K5NNmvfsU315L186nEQ12vMnTu+m
	9cXj/s9+B2xA4x8l0Meh8xw67rwuTBWYGD5KRuN8kFGgI2S/OgZO3ow29UEtqDnbxaibNL8327U
	B06Wu2gu+/cTtbkTMr9yncYA7V9k61sAxb3Won6CzS32AdPSRo7aQLBJbvwpsDQZhd30dUqZJbL
	4p1Unjf8F7fQu4Dbb3/G0ncxlO/GeuYnTv56yiKdD1+7Xil2SXUeX7hPFBkeYqKVK6oSAfOiPyD
	cJzNc9osMqQsIyKS8piYQZYffXZy1eMeI=
X-Received: by 2002:a05:600c:3b9f:b0:471:13fa:1b84 with SMTP id 5b1f17b1804b1-47ee47c9411mr21009765e9.12.1768392672151;
        Wed, 14 Jan 2026 04:11:12 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5fe83bsm50158222f8f.38.2026.01.14.04.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 04:11:11 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Nick Xie <nick@khadas.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260113-amlogic-s4-mmc-fixup-v1-0-1ab1fca0fb2f@baylibre.com>
References: <20260113-amlogic-s4-mmc-fixup-v1-0-1ab1fca0fb2f@baylibre.com>
Subject: Re: [PATCH 0/2] arm64: dts: amlogic: s4: mmc clock fixups
Message-Id: <176839267143.2837299.3084525146366465270.b4-ty@linaro.org>
Date: Wed, 14 Jan 2026 13:11:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_041116_475094_FA1DF22B 
X-CRM114-Status: GOOD (  14.09  )
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

On Tue, 13 Jan 2026 11:39:51 +0100, Jerome Brunet wrote:
> The patchset aims to address the issue raised here [1] for MMC B.
> 
> While checking this, I've found that MMC A and C also appear to be
> improperly described in this platform's DT. The 2nd change fixes that.
> 
> I do not have an s4 platform available with me, so these changes have only
> been compile tested but assigning the clock was actually tested on sm1.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.20/arm64-dt)

[1/2] arm64: dts: amlogic: s4: assign mmc b clock to 24MHz
      https://git.kernel.org/amlogic/c/86124a8becb43eed3103f2459399daee8af2c99d
[2/2] arm64: dts: amlogic: s4: fix mmc clock assignment
      https://git.kernel.org/amlogic/c/3a115d42922cffc91b303992eadf220111d66c31

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


