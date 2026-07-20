Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F972C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 12:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2YiheYNkLPy6p50mBPBQabeVB3m+46mhIEjX9T04cmo=; b=jAb+OwXSk66joOA9Y567hSZ/OZ
	4Lv8ape8ro66NaG7gmfNtsJNOOePx69Q8D8k9AaTICzkWJ9r1m/clI4vc1RD6eP8dLPd6Rruq/HNq
	9tMHExan2c1Ixd8ipaAgRZIRc0vD0f/u7Ab7OXvPvO8wpj+IeP86qGSxFOtOiodZjgrNqn6vVo3Pl
	kngXApNw3dsxbc3+H3P89lX0yb12L64xkwvsKOt4M26WSvj932P14nwl2JuWNYU/+DssKgvom5qfh
	ACHXkBUB/zxFXdHA/X6gDnJKsEWwrqlqcfCb7Rf4inCFpvGAS5me1vmHfEC5kqWYdGz6CB2lHVMG5
	0FpdfDlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnAA-00000006hfz-0NZ8;
	Mon, 20 Jul 2026 12:32:02 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnA5-00000006hdf-3GHB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 12:32:00 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4954afac04bso25704655e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 05:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784550716; x=1785155516; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2YiheYNkLPy6p50mBPBQabeVB3m+46mhIEjX9T04cmo=;
        b=lmDmPbapK3govi4ZH+DPyyxD4me0lmIrizAaGtaqPO6KMTgORCEcM+42a778kVME80
         +QJ0E0wRG4APwovRMZe0/2LTyob0LgWCXGN4fpG5lTQrDp02szi6mSIqrpHUoMtrq8/S
         oIaIIk3ms5x/UviZV7TBDgRa5F5VrvbwN4ULzoRphUbWEr8pnpNsiLGIy3iJUpVtauJr
         LpRg2PLARzWRwi6zQOJbXdcc+MxXjqiEcH68noXZoKBvx7tsTnHNmhmv2ARuTG3E7J7R
         tKFVhaJK/QoZO7QSl43aAsrkCvo73ZN1LNkQ/vfXc6TlMXnt8HdhTLnJKujIkepZJQJa
         DYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784550716; x=1785155516;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2YiheYNkLPy6p50mBPBQabeVB3m+46mhIEjX9T04cmo=;
        b=R4nF7uaGlvmnZaOezDf4H8sdvVq+s1jc9Y+Hn+Rzj/e3B1rdmPchndoU4deDU9/mCE
         b/7+R4ANoDrkuCjmqk6e6GyFF9j5qP3hkRl77m+4ybZcnMfB4IMAVBGjl6AWFy5HnZ/X
         i6dtTNZTmQpi44SxZHG+e+2CojI5u4pUdekCKP77NSMxMhTY8ZAWLkB0FINcHMAcSBoc
         3W4WXNL+EGqjQq9Uv88kI2yirtMJcuvObx9hV1wrCpaDyQLuN0xmqRTZcJMd7LUEcLOI
         wweXFsJes5PPfdF2Z76TyO8SptKi7idjqWjAYP2mNIQC7qcZE0L2o2m8fhC2N+mqY0/J
         ew6A==
X-Forwarded-Encrypted: i=1; AHgh+Rr7if3FzN67770ONuT3+INdSTHWHVXQ7PfwyAgApnf81VSgXlPUEdLEBhXEOlfWYhjVAadwfyVykIrwtrCxyiuH@lists.infradead.org
X-Gm-Message-State: AOJu0YzQc82ClWoOyzdzDZ8r0afl9RYXmTse9FqLNJYaKjuAOLlxV+zn
	2Qk1bRlmL4FS4hSsSUGhF4Ne2RReZPjEvNKbaeJd8AdSdn5RMO4vD4SE/wol0w4NkJI=
X-Gm-Gg: AfdE7cmCneo2FfU4krYOSfwH49tiJCKsMN3ZNgjOCl63+0+/7e2R/dv4091MSAIMHgj
	kCxS6D6D6zynuxhGx++WSkBpGqahbjk52HzfTMmHkm/rwx82vg+ErmlN3Xub3taqGSzALkz7dss
	5SbuwXyVb68CUsYDeugmqLovvGncHn4XI5wRTMY/YKoMP93NFUd9mysWdPX/TGye4EokluGX97c
	zQw65ytLXC1U51YkwiHXIwx3cy70St8TNFIEVX0dNImOocyc2qXWdDPRUvQ34qDj/1EKhw2SK7x
	gTm9MqPpYRUb+Q/fmRsokIPVxkAoexg66j/omP5ZeLfyQBbh80zvhiGaQr6GEx2viEGx/w/KmpU
	WaP9yo5ZVKSmhjWSLOrz64FruucT78NdR0PPTtHuzkxmyfr41jGFQZgQifLsZRKuIqJWbzG2MEK
	8odkjWCEIIZVXleXEwcaOXhhdSMF+j/iKXZw==
X-Received: by 2002:a05:600c:4584:b0:493:f5bf:4da4 with SMTP id 5b1f17b1804b1-4954a50e970mr154551135e9.28.1784550715772;
        Mon, 20 Jul 2026 05:31:55 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2692a3sm243086825e9.0.2026.07.20.05.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 05:31:55 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260706093508.273968-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706093508.273968-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: amlogic: Correct indentation and
 whitespace
Message-Id: <178455071510.746335.6018359052164978426.b4-ty@b4>
Date: Mon, 20 Jul 2026 14:31:55 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_053157_830541_41C8242C 
X-CRM114-Status: GOOD (  10.15  )
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

On Mon, 06 Jul 2026 11:35:09 +0200, Krzysztof Kozlowski wrote:
> Correct spaces or mix of tabs+spaces into proper tab-indented lines and
> remove other whitespace violations.  No functional impact (same DTB).

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.3/arm64-dt)

[1/1] arm64: dts: amlogic: Correct indentation and whitespace
      https://git.kernel.org/amlogic/c/6c4345eb714f094ea579e3234cafed9f8c0634f8

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


