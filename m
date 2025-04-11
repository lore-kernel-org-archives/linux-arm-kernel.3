Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72670C369A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 00:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vsdZTMwIykwxFZW7XdBDDBQTHYKFUKUO10UneP5f6Co=; b=r2W4yBLNN+tDxPm5cgs44BKXFh
	XO9UvrqYx0AKfzm1gEBQeXpZhijPiLYWBD3x5wPoPY0djmOUw/zW20gvWQdjhA4CwitY9GWXJZoF+
	vM1T9JAZCAWQOEoKyGlJZui4LDJiwGY+KAj03PwtAGMAlvN/k2Gm2+h91YjM/LaYUU6ZqLZjB6c/Y
	crY3JBWWVlYrM0EtjegYDh2J5oAC1gsATUuPixAiNtD5MQvqM+O2/lQW4co5Dy3SyySpV+d2gDk5c
	9HXFfT+wgOXCUabGJG9t0tniSwWAIuRx+Kl0R9GL7tXDNnvQxmtVVpLnvQpfKjikl+C8XZhy/qpcm
	9vYPRuKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u32gB-0000000CAzb-13JT;
	Fri, 11 Apr 2025 00:55:35 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u32VV-0000000C9wM-3pLB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 00:44:35 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-af5cdf4a2f8so1135571a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 17:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744332273; x=1744937073; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vsdZTMwIykwxFZW7XdBDDBQTHYKFUKUO10UneP5f6Co=;
        b=Dap8LwObg2Am3ip/bcz8Y2E5DKrxG9NN1gK0DxwP7fc+5OKq+2EWqGse1hoaEPCmN6
         4Vbizvdx3mg+6r0W6m1OrtTKk7DP0DyM8PiN6N2pQXbFoCEvMUjf+DA3I6jtaFIYtf0E
         BCfBGixBZrNZlH7n26mhmBHHN4IZaluGfoJSaDMzfZZgSgnEu5FFb59EFtqK+ah+q15Q
         WVaaK7kRHS6tr5JgV9EoQqYYclhccI3AOcf0W0IXxfjyj5qgmRPI3kXMhEhtz/kw1EVC
         JGXOE3GFGTYHI7T/5y0bul1FsnF6DBOcPLgxipc6QIKeJLFRJL0OXvEsbxrZHqw9HTYQ
         TN/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744332273; x=1744937073;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vsdZTMwIykwxFZW7XdBDDBQTHYKFUKUO10UneP5f6Co=;
        b=CM0cKV8xJomQ/+8e6JKQNw3/FX54pI732vjatXSve7zgkomGUyMgIewOgQiF7F1DKL
         GocN8VmISnxBm1CJNAUvB1pE5ZcUBJN89bt00czXBnOm6jukO9a4bUaZdhzmgZdBFzEl
         f0K0DW41An//+XQy2BXdIPByr70/xlN+aMCWpDbpajodcVI8JVnmmt5JkP6CAXvvKCWX
         6iFsks9ZNs8K8OQ6Qq7xtk7RA3gmV/u/PeyRywixDxNyJcMgU3ctv2wFAYBZu8pJuOCb
         g88Z/vxCe5x5NB3l41QAxAQfQt66i/Ef2CWaj7EJkv+1qHxo/KvoPmfN7dTv/deHnePZ
         BkkA==
X-Forwarded-Encrypted: i=1; AJvYcCXRh3LLsa1tG9zfeMgzuIzg+bbXuG87NfFqU8q4m7GzQru129oCiINMH50VcflnCuRS3GQ6IALtGSXxEThnCdU6@lists.infradead.org
X-Gm-Message-State: AOJu0Ywft9l+ULwbI7lr0fWCafV2n0wcSOvIfGWivupjD3wqQI4G7P7b
	UmLEB5UyXmjDMi3L4vhfshIhMJ8vSIRsXU54UzlP4miKK8CypVxQZ98dtQSgbgTI2DrSHO+epzs
	/IBs=
X-Gm-Gg: ASbGncswNPfFkvbBSqY9AAFCt93BEv4mu9qP5GvWtON/aqBM6D37/Q3l6KH3POiEr5r
	HkCek+NwAPMJHl0814fWBVAgZ6zF27JhCDGf8G3EveRUQww931Fpj8KbS5WCM7AMd/1LyoAluU1
	evuj8lPFoUu6jXoVgeuff6n4cQ2fv9eT7llSN9i7f2UYh5c5FfhOVgniEpYN61IPwdTblWZEl3l
	vU8eQ8x9/ttjJsw1AM/bEy0mgy8PmZC8SA0K4+lvX+AY145J1dOEXbrwVHRiytxZTCOSMGf/NqP
	kNFhNixbfPZjuamJ3jBnh6fImNoALB8WBHR7ZgU=
X-Google-Smtp-Source: AGHT+IGkKIOCVVDwPQC40Jos5ojyeCmRImM+y0qVGUmSsNBURG1P7WKROT7Lbtkb6eCO6oUjraoobA==
X-Received: by 2002:a17:90b:2752:b0:2ff:5e4e:861 with SMTP id 98e67ed59e1d1-308237b52c1mr1313845a91.24.1744332273039;
        Thu, 10 Apr 2025 17:44:33 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd11e996sm4406937a91.20.2025.04.10.17.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 17:44:32 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: khilman@kernel.org, aaro.koskinen@iki.fi, rogerq@kernel.org, 
 tony@atomide.com, linux@armlinux.org.uk, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sre@kernel.org, Andreas Kemnade <andreas@kemnade.info>
Cc: stable@vger.kernel.org
In-Reply-To: <20250331144439.769697-1-andreas@kemnade.info>
References: <20250331144439.769697-1-andreas@kemnade.info>
Subject: Re: [PATCH] ARM: omap: pmic-cpcap: do not mess around without
 CPCAP or OMAP4
Message-Id: <174433227218.2416322.15261895858877666275.b4-ty@baylibre.com>
Date: Thu, 10 Apr 2025 17:44:32 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-94c79
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_174433_953483_85298F2D 
X-CRM114-Status: GOOD (  10.75  )
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


On Mon, 31 Mar 2025 16:44:39 +0200, Andreas Kemnade wrote:
> The late init call just writes to omap4 registers as soon as
> CONFIG_MFD_CPCAP is enabled without checking whether the
> cpcap driver is actually there or the SoC is indeed an
> OMAP4.
> Rather do these things only with the right device combination.
> 
> Fixes booting the BT200 with said configuration enabled and non-factory
> X-Loader and probably also some surprising behavior on other devices.
> 
> [...]

Applied, thanks!

[1/1] ARM: omap: pmic-cpcap: do not mess around without CPCAP or OMAP4
      commit: 7397daf1029d5bfd3415ec8622f5179603d5702d

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


