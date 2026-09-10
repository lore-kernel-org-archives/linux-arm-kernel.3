Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFC7C88E41
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 21:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0occsfLmodcsn9s1z8E/JBq4kBSFx1YK4S42OPyg7Rc=; b=Ud4JQLNNYvW0ZsbSxtsdBc/YeQ
	D1rc+PQjrifVizZX2Yym+SYWG1fCdVy63F0noxW9rdtk0beGOgAu63hiixbJhnt2AW9cy0gY7SFcC
	OPf0QEkHqgIZFPlFn8jocjMR3bLUEfa/pihFLokcLs5KJn2w/MnMdWnNV0bK/K9SY3hdkaNPg32hY
	F03y/vgjy8rJVq9DhWxtVc81TNZ259mVwoOsU+3jKQ1wt8ExkXlKrzaJsRc9vPeOnocD6HfLqXKOs
	4CceuBR/FhOZdPwM77UZzuWMHmntinM9PXyHdwagk01d/DnnfWjRF1zQnQJuO/z+okZMd6UhN7ADf
	0MoDTNkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4mU0-0000000FR2g-49cC;
	Thu, 10 Sep 2026 21:39:00 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4mTy-0000000FR1z-1JqJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 21:38:59 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-49954b88fffso2713085e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 14:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789076336; x=1789681136; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0occsfLmodcsn9s1z8E/JBq4kBSFx1YK4S42OPyg7Rc=;
        b=iG4KgVck1hRRE05ThIYhtqYj8uGHEPWJyHKOTeGOt3ftwI/KlTjM4r1Aw8N9lrMmqx
         6HchAjfRjqeTWTw+guhuVMgwd7evb8BcHZ2zR5mdEn9RLuD+ETMONidujux9kLWM2vAr
         BkI2NF9LujkEez/b+4qR31TXoiq5C6BnoBGWcGoVLlDZpgIjsZ/woFl7+5y55Z4Azihl
         fCF7rtpjdksI+LGqm+FKbs7IJeuAuXZkJs7oasYcLe/p5PY0NFPDl+9Ua0UeKKar9lCj
         Ul0zf0C8SsFZYVxcEheJOwgkTeNTULxtB9hM5OPKYp1QO6hpkjLlP2XRso0e4dm41bnb
         hrcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789076336; x=1789681136;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0occsfLmodcsn9s1z8E/JBq4kBSFx1YK4S42OPyg7Rc=;
        b=OiCheRNrHIP1EAzRvf1DgLgNPc5h/kudT46BVfxZCu0AJ3UdTLQ7CmEcZt60b7Gi0p
         zOBs7sIJQrytguTcaYl5kTrRYag1GBcenLkJPoRJLG8lEMbJHeoOZGiusglJgO1hu0Py
         MRF+Vmb2kc/6/27kkhLDQNYXni/dwwOrupazSPprpmL9qX7pgXerJCLa1keFiLsRGKkB
         ZanUomHubml0InRv/hwDjq+43FHWJlx9cQFNYzcHcsgpv6+RB6inAO1GAyghg20Sr9JP
         +030V9AtCWgTHqpxYx7WlkX+JQd3GVYXxFrMzgN/dFb23FwkZA5j3R+YhmoiXAhdJ6g0
         zwFw==
X-Forwarded-Encrypted: i=1; AKwUvBzET/SSsn3ahvORrJBSH1+NgJMirDxBWDzIfRWcn1kNkYxgNxeSOJxgrXZssgZJoToAIbQFVLJPnEf7G/AdHxmE@lists.infradead.org
X-Gm-Message-State: AFuF++lsWEU9rIO8tXiLypOJbKQRSjByr3WPhaJwvrMdrQBL1APd/vvL
	LklMXJGUioQblfEFiJePvMYO1vXw6pdqWqItZZF/TroCDlPF6GOs30FELcU0Xe9owsg=
X-Gm-Gg: AYBFou0Solbxt8X61+S2zYbzDJat29AlfRacIR/CKoXmDvuSyAbhPSdeC/pzj2+Tqy3
	yl/cnmVFL2t0Ztkvg3QpVj+3B/JKuErchW1XEp8ieD8bLpYWiS8V+/Zs4FFN5zzu3RQCFVYoYH8
	Zhu9iUdkk/bYCTul22bYb4RGyjt6aQLBb5pQtn+uCmeT1486gRcG1ShB9KyBXAbN09qX0Ttlzjl
	ac+fo23u6TxIKwUN2z2F/PmbCSQxzes4MH29Bdq+bXIlutYyYl1d30d+j+pwmPkKq6oRf+qdgsw
	CSJ+VPqGRqWkyY3CKVAtFo/ILuo4taGE5Cw3Zf7Oitc7f/H6OcyI5c/RlwuiydRBDbdkGvQZhXD
	eI5b5ilBIrNsdaxkVMDB0X3kRL1Aa7rjqjUkaazpU7p99t87aPCMD5MWpzVFpWVA8h71ClbYc9W
	ejGYS8uhhSeRSMQrMFSdWJ+SHBT3Mjk3xa8hHEUgpNeALcIStQXBnDU9/KOB1ZtteXC3btdEKnV
	lM1CDHLGbj98YeSTD9dNMg3tJOw1zWABKJmC5JmuThuSawxqKpYuk+8/n8+
X-Received: by 2002:a05:600c:1385:b0:49e:2a61:a17b with SMTP id 5b1f17b1804b1-49e619a0905mr8799185e9.5.1789076335948;
        Thu, 10 Sep 2026 14:38:55 -0700 (PDT)
Received: from localhost ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e62227071sm4434585e9.3.2026.09.10.14.38.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 14:38:55 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Sep 2026 22:38:53 +0100
Message-Id: <DLBYMPDTOM7N.3I07C9Q0IJJ19@linaro.org>
Subject: Re: [PATCH v3 0/2] Exynos850 ACPM SRAM devicetree node
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Sam Protsenko" <semen.protsenko@linaro.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>
Cc: "Peter Griffin" <peter.griffin@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Alim Akhtar" <alim.akhtar@samsung.com>, "Tudor
 Ambarus" <tudor.ambarus@linaro.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: aerc 0.21.0
References: <20260727-exynos850_sram-v3-0-8627a49188ec@linaro.org>
In-Reply-To: <20260727-exynos850_sram-v3-0-8627a49188ec@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_143858_369453_2E7C6E5E 
X-CRM114-Status: GOOD (  12.36  )
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

Hi all,

On Mon Jul 27, 2026 at 2:23 PM BST, Alexey Klimov wrote:
> Hi all,
>
> this is a small series that adds sram node required for ACPM communicatio=
n.
> Bindings update adds new compatible "samsung,exynos850-acpm-sram" there a=
nd
> excludes it from having child nodes and not required properties.

Gentle ping.

What is missing here? Should it be split into two separate coomits?
There are no comments for at least a month.

[..]

> Alexey Klimov (2):
>       dt-bindings: sram: Document samsung,exynos850-acpm-sram
>       arm64: dts: exynos850: Add acpm SRAM node
>
>  Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
>  arch/arm64/boot/dts/exynos/exynos850.dtsi        | 5 +++++
>  2 files changed, 7 insertions(+)
> ---

Thanks,
Alexey

