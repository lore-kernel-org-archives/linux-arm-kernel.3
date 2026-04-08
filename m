Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1148FFD5F99
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 09:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DNdO7fLBeeA2neJwwyEcwruMXjRyUrprq++EjKDhP04=; b=qqW105y7227Rj6MNzvYQ8IoqlU
	VeJbx1iprtOnwODPRSQw1w0WNnNxAZx/GDlU9Dd+5Nozz50f3uvVYUdlRtU+wj+7puukeb7QamK8V
	kZUXPyvAsRVh/1YZ5xpbD6TpL+497J13haNjPe2KaA/ixrB5kQGaO74Id3ZlMXF84R6IzQFl82Xw0
	IfiS5UK4+aL1Ah2+h7AA1rYGTtTNX8EnNZ9+kthIusOknYeuwkIi6Q30/i4pN8HEioJCHMRV+VkdR
	tur1v7ye9xbevuhBI5+a8g4TLygqeZz5V+TUF5Npfv4vvYw+F1hzdXseGWySBmFzRw/brrufK1bu8
	wqNb2T6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAOxC-00000008aBa-25ZB;
	Wed, 08 Apr 2026 09:12:06 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAOx9-00000008aA6-3XtN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 09:12:05 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-43d01d6b50cso5645987f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 02:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775639522; x=1776244322; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DNdO7fLBeeA2neJwwyEcwruMXjRyUrprq++EjKDhP04=;
        b=AW9dpm2+SuoIFSIrYXuIk4B5gayCeyXesChIHtXbrMp2Bo64bxkGeVlrkMkRheCW6O
         ZdM02lTDpC7Ji3THv2HYcE9fhnni0uvauwklHlfmAFci8CtL6vWS/9+Q/pgtXw/ubNw6
         6RirO5gE094xKIPFiuoONFc9yR3ZpSc9OrbRiBPB/Gjv70o4s50f57YnkuGqflUwxZ43
         BMlzrOvde90r2plGvMPuXR2ptvY0XMVuI5mdKOKfq1kcEhn+aI6Ezh0ZRhGyiEr7wtXT
         AQEwBBsBjweGlUFeROy2atqcmOMoUKh2T3J6OrCpJHBxS1vL4T4kyn1yd2ZCDOxTWQc1
         QDAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775639522; x=1776244322;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DNdO7fLBeeA2neJwwyEcwruMXjRyUrprq++EjKDhP04=;
        b=cfIn1MR4mg542s+CFdz5D3VU0lqe5gcyV1dgubT3r84+2ippre1U+Djgwk+0oD8ZYO
         d+G55ouWeGc2yJYRI8bqMenHh704Eop0W+FY6Qt4LJ0MDyaXE+7gsEQeNjpfIqQqT6Mg
         HG+rCIafsXPYtivP8wgupn8/PgDGPX20mM8KNMFgxr4W01dY+ZshjlcfnxpHuzl1qV+q
         2o1YehQyuYcOBsi86cQgbXbfuzoi77ugHcuBR6rWWJaBn6eoDwyJxEsJ4zENrqFjvDcZ
         DiWF3qiRCNjW4uXNaTBHLgRE1XQWvnuwGg1qxDDBukAlVybToQIamDRKpk67l15w1NZ4
         +xng==
X-Forwarded-Encrypted: i=1; AJvYcCViX3/3eZgXAynVKT/0/46vR9knTeXEsNFgfg+X1Vuqrdpi9+Rit/FbpuSTzdcpmBBXgR18IjlXIolVuLWU5jMH@lists.infradead.org
X-Gm-Message-State: AOJu0YwDgcLPVH2tKTfVrdXzJrEq2Dr54cayFkAmW5wIFnY0YuVPT4M2
	+UfNev9GqCVKdKh42ISVJCEhwtFyrb8Zxytd/wQ4E6M0xpnFI3eEFlmbQ29Fhq6QbeY=
X-Gm-Gg: AeBDieuwDpRgvjE1HwIk/XeUoaE8upuQM6vOtLe5Y00cQ4ztHLndK+XqDjq3EOkVDoP
	1bc7gGGZQi1GnJ5VeZvG8Zv24b3fGFbnsaF2g9iEZ3/VWZmS4HOKZjGf7clIRbCG9Wg+UQH27MD
	NAtnXOXVWsf8eP07JvpBQb8JsZwfSoN1yEjJCON3KoQV+1BMhvuQ0T6wDsCSfYVN4EBsPdic82u
	wCzuHHupltCjoiqw1eHCwhDKfcsv3mGPGZVB4sNHCmxHbQxgYEyelETO6eYHU+veST1W482tZff
	GQ7KIcwj4pcOn0J4HCkBP+D7NKYeeogUASW9dvXUG+KQwMv6C2UuE9Muv1Mzib0dGWUk54FHVnS
	HR7TEBzi63ezaVuezgGL4UraAVhwskpIgmcmbbk9zW7F0xrVBA7yvMI/08azOcxI7djvr4a6Hsy
	SgRDqZBYfvhjwJ1SwrvhPJMDYPdfY+BIzOSYb8wTsL1Axe
X-Received: by 2002:a05:6000:24c9:b0:43d:6e2:5529 with SMTP id ffacd0b85a97d-43d2927bb78mr29330089f8f.11.1775639521962;
        Wed, 08 Apr 2026 02:12:01 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f5294sm53516671f8f.35.2026.04.08.02.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 02:12:01 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Jun Yan <jerrysteve1101@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 khilman@baylibre.com, jbrunet@baylibre.com, 
 martin.blumenstingl@googlemail.com
In-Reply-To: <20260330145111.115318-1-jerrysteve1101@gmail.com>
References: <20260330145111.115318-1-jerrysteve1101@gmail.com>
Subject: Re: [PATCH] arm64: dts: meson-gxl-p230: fix ethernet PHY interrupt
 number
Message-Id: <177563952126.3423846.18101500975539971135.b4-ty@linaro.org>
Date: Wed, 08 Apr 2026 11:12:01 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_021203_904345_C02E32D7 
X-CRM114-Status: GOOD (  12.19  )
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

On Mon, 30 Mar 2026 22:51:11 +0800, Jun Yan wrote:
> Correct the interrupt number assigned to the Realtek PHY in the p230
> 
> following the same logic as commit 3106507e1004 ("ARM64: dts: meson-gxm:
> fix q200 interrupt number"),as reported in [PATCH 0/2] Ethernet PHY
> interrupt improvements [1].
> 
> [1] https://lore.kernel.org/all/20171202214037.17017-1-martin.blumenstingl@googlemail.com/
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.1/arm64-dt)

[1/1] arm64: dts: meson-gxl-p230: fix ethernet PHY interrupt number
      https://git.kernel.org/amlogic/c/b18d1b23558114b3c64fec7b515ca80c76e58171

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


