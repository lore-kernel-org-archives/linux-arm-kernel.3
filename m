Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA3DC3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 17:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TBLBH35fihBkmIGbw4EWVRYhi7XRZ3Q7hPPc7aK4Fu4=; b=nIX1+0g+arcax7m967e1wvBKl6
	OzR6a7T06TcWdeM6w/KjS6nzS9l/+34oKkic7XTVYmKEihrmndiwQ9PnFxLQzlpKYl5+YWjZicm4Y
	HU79DV7f0FjgXoScFY4bbJAo4Mo5YRf60O2obMPkb7xwrt2kaQbg0CoyG5KssY/rNtSKY/UNjwuvr
	LEMg0ZpBnKlpQs6yNeVvRIMV3tN1exxL6Yl8aEAdYQkinMItJ0nSiCSzEtPJcNrwFS3MkmRil9t9f
	OpRNaVrDiM7cI+OZa3bsFJ+ttKJA5tlv81STp4O/fSyzIq2lcFSY2ssMAGdtwESwsFYuwalEqmgbC
	gltxsnGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDRlP-00000004TBB-2xPX;
	Fri, 09 May 2025 17:43:59 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDPnq-000000047Fq-3Y8i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 15:38:24 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so14412135e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 08:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746805101; x=1747409901; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TBLBH35fihBkmIGbw4EWVRYhi7XRZ3Q7hPPc7aK4Fu4=;
        b=lFS2yEV4YpwCiRUqIFSIfWS5ShBMvcneLJ63Ihuqq8/PPO0AaBsO0k9ruzvvxw0ks8
         hnlGU9AXjzC2RkL1jU+03QtqGl9hboVsCUod7W2fT6QKHefp6tYHBLwBSyuTK/K1/Tdn
         9hlifXkLIQgclB1+3uWRTYvbu5t/H7IfB8QL4duEwkdJGrAA8bkm8mB1qXXQfjIlRNag
         PrLfhg/Fj6qkgcsLFWPdjajSSL6dWambkFgnDdLM+9uiEDvPP6PKVmhoGc6wJZzSC+dE
         D80u3UNMg6ABNQpSHnnA8IvqfW4POcagh37rkRvc3kJXaPIUVFXPExPh/e4mwZsN8xW1
         0BcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746805101; x=1747409901;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBLBH35fihBkmIGbw4EWVRYhi7XRZ3Q7hPPc7aK4Fu4=;
        b=LILY+znw58Q2wXY7DsHAaSU0ZHJrJbpSrNMzlyqPlOPuVMUI+1stbg5rRWHm20Bu6Z
         w1zLfg96WgaV3REcSuxrIlZGZhd5NRACQMZvIOQbNc5I+wrwc8jN3vx+ZMYmt93MvPSc
         +bXoxmRjzzvVYTPD9vpy9SWISPIaSm8UCjOidtwN+6xLNpYgAa/wLvxIInyz5tWW5fY9
         vtTihzM0916T+qbVRNMAIHNT3SfXQMiPBRiGW6h1UD6G/ezVQGJXEKdETO+4r7yC/guJ
         PA+tdh5kvQCWhhB0INgkj8Kgg0Fd0w+MQODgupngR6OrZCrW6OfwMmggSFdvLIFRu4tT
         L8HQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNnWwn9MXgvkJQ6ZFf/Anrr0YySmIfNBluI6KHZ7PP0hv6YnEd9R+v7KucZ6ASCAKzRs6txTnIC3Jc20e5FZf+@lists.infradead.org
X-Gm-Message-State: AOJu0YxfBgNHhOt1/0SN6WQRWDWxwGRE0J9SXjRZYmxOeac6R+lgeNza
	z0k959CyzG/i7k7mbOAc/jZ/F6avYtJi26CjOToQqJXHatYX9n20XnYb5gcIotk=
X-Gm-Gg: ASbGncsGTcJ933ybFrlY+1BDQ7fAr/i/QGI79xzFTveMw2EQ3wnUVqYYzFse1NSnIMC
	GEhqLjcR67I8wVTSp8utpbhkwCKI5Tpvn+z+cGXyrpr8jv7QLZD2ISy96W2ozw5sZBN+dKhOTCJ
	cUF8EI/jEEVx5NGxF/8dpqtI6kk5FJUcaEBdILyx4b//0ce/qiVQ7frTH3DsnHlbdR5egEvq1Ji
	iVVTjC8jkWLNefP5tITCXkR7KslpDf0yvLbdCSbA1C8lZQCLOzDbcngYW83Pz5c+3JstabYigOt
	a+Nyk/MxQLDpgGX/RO9g+cxIT3/H2dk/q80sVvDRtRRA4fLtxo2Bti78WBzzkH4uISvwbAkp
X-Google-Smtp-Source: AGHT+IH4IMLRaSDitW8aRp2/HH30bVFdM1w5jTbdL4Xe/FdZrAqsFjuKiUSdh0mozDMKtmaE8Kz62A==
X-Received: by 2002:a05:600c:8205:b0:43b:c857:e9d7 with SMTP id 5b1f17b1804b1-442d6d98a88mr32790695e9.5.1746805101395;
        Fri, 09 May 2025 08:38:21 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ebe4fsm3663912f8f.39.2025.05.09.08.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:38:21 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20250323-fernsehfee-v1-0-2621341cd37a@posteo.net>
References: <20250323-fernsehfee-v1-0-2621341cd37a@posteo.net>
Subject: Re: [PATCH 0/3] Board support for Fernsehfee 3.0
Message-Id: <174680510066.3108291.15538800849859736861.b4-ty@linaro.org>
Date: Fri, 09 May 2025 17:38:20 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_083822_888301_110EB7C9 
X-CRM114-Status: GOOD (  13.53  )
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

On Sun, 23 Mar 2025 13:37:49 +0100, J. Neuschäfer wrote:
> Fernsehfee[1] ("TV fairy") is a family of set-top boxes marketed as
> ad-blocking appliances. This patchset adds board support in the form of
> a device tree for the third generation, Fernsehfee 3.0.
> 
> [1]: https://fernsehfee.de/ (German), https://www.telefairy.com/ (English)
> 
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.16/arm-dt)

[1/3] dt-bindings: vendor-prefixes: Add TC Unterhaltungselektronik AG
      https://git.kernel.org/amlogic/c/40f983aa2d809b4934a260c76b82e9ff19c09a88
[2/3] dt-bindings: arm: amlogic: Add TCU Fernsehfee 3.0 board
      https://git.kernel.org/amlogic/c/eb7af1268e0042e83607918229cd62c3669cdcb8
[3/3] ARM: dts: amlogic: Add TCU Fernsehfee 3.0
      https://git.kernel.org/amlogic/c/dac928757928a8ea06eaf5694d5deae53a21616f

These changes has been applied on the intermediate git tree [1].

The v6.16/arm-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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


