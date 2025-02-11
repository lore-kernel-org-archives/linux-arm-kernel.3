Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598A4C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 09:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MBuVpfBGZc5QukwlLAhOoPlDs013WB9zKRqFDryvqwM=; b=EP2ZzUwhEQ/gCWGfIfFJjDuaW3
	xHueBIwNufXKyyoGO5d8cTIe7CigYE//b3F7ovrpc4ttcw/9cL/LszphMP1naoY9uZx+1RXDrolkX
	KiyZPlVSFeF9K0aEY+34vKzL0DmBGSawwMee9Q0lyOsBAxSY7VYDXIbfFnyiFJXVXBuQs57mK0NEO
	tkom+e77KZSVXZKT1AEa+Gz2EBZz1x3WNVdsbNviFA0pz7m+GKALDc493h0YOJ+hgVIXs1uSTYQKU
	akH9jJFoIwlRs0Ngk0xEI+HcVm3diGdMwp5UE9F4gCNEfbfboVCb1HENRUCdZpUU79EePJRey+xoE
	SxrBLX0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thmzk-00000003GB9-1UG8;
	Tue, 11 Feb 2025 09:55:56 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thlzA-000000034CV-2iAm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 08:51:18 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-439554db49dso2171955e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 00:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739263875; x=1739868675; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MBuVpfBGZc5QukwlLAhOoPlDs013WB9zKRqFDryvqwM=;
        b=PKr7EDCFJl71V1M8GSHZAOlvXatw8jMyN5CTUSaSLpr6y9quissLPQjfDsPKHBD6uK
         aSwL7zSJeJnxGb5moe4cC668TUj6xHDElPIVj2Vt5UdBuCoBWiCyfqCAINfqBxVsDn6I
         gXw/rZS0/a8nnC8ciKY6anu+dxNCNga01icghflBTdvgQeBqOKNgTxdqx1sBgpcPalg4
         RLGBRuGTMLq1vF2O8kGI75B8SGNUT7OP2Xhjvb19fb70k2y3Yjqqi6KNJ68gIEAGvg9L
         j1vveXKNT7XsHWo7NO7XtGQjic2/3SaTN/mDSnav+FpptUr1xMkzoi2fEg0W2RY2Five
         P6dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739263875; x=1739868675;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MBuVpfBGZc5QukwlLAhOoPlDs013WB9zKRqFDryvqwM=;
        b=HTIZwwtYLS/DiZ6mpprTQEJzCaZD0Hx/xe15J7QbF4fUL+IVye6VUrAP56ailT++9Q
         Q9Uw86E6xtFcMWXMjdgr5wghIWam9A1Aqu4nlIyJJDy0oNn+qlmyU6CmRAL30hTd3gg3
         0QzS9Q3QpI+wj/NZBIL6KYAJjpPnO1QBzuvw/peBM12a+yc4f8X8lOkW45uXN7QpzhxU
         Y8FvxZqJOvUb55lUd0QT+fs1xHYKP62SqsjXLVokiV7Ay1mOd2GO+TqNYPkl0uHhoWhX
         4DRxNSIzr2XbAZ2SH+NefgJJrOGLaRp5Yr/U5aK1RaiY0vvwVXgUopgcuo91ZhLPaFU6
         YYxw==
X-Forwarded-Encrypted: i=1; AJvYcCUHBrAj3q6ZaYwM9pIZhnP7zjcPfcq9Vi70ANfL6Jo9C9IVnoZVhPfX9EKgRI8N4Mhpp2vrzbkJx24u2Efg3ICf@lists.infradead.org
X-Gm-Message-State: AOJu0YwhkutWCRZgLkIssRbRQ2sfecanC7WM5S1zHrWGVkFaQ6o/U/Ey
	zzodv9AU1onDo1tB5GD2UR8NIFa6tBlrVZevQOdnvaL2gVKepRIqNB962VTjCaw=
X-Gm-Gg: ASbGncuc7xaR2mZnSc1lUYYARH4TAnKFCav/OLdqRjGkPNl1e1zr7Kv5DJsLxQMOCy8
	XkKeTJ3DYspYLnzdl3EmOfEtBS+7QG6WC9uc9iUT1hP2RcmEG8sV7MTXjYaUJF6nqiWMmEU45Fu
	4/bSLN4M6YNm6TUje/2KrLpI6hROR9jF3ThSShHplcrQMUrGoVDFugy96xkM239TBv4D0WrMqzN
	rrmFXCi9RGbJvWk3YcUC6Fd09t8EsNEPVqRVwymUgWBj8f9AvmDV949F/gR4VdsGBKwZ0ih0lhY
	ZHLffYsY5NTN+h/bnOJLKxxU0dtG/g9aOc5AYhIxCFBQGylLR8nENIk=
X-Google-Smtp-Source: AGHT+IFO+zzAA08bfzxBeaVgp6Y5tU1Gn5sLS7Hh+RKdG5t/UoXpSO2gVdVDv0cTsXvcW1Ndi56IrA==
X-Received: by 2002:a05:6000:154f:b0:38b:d7d2:12f6 with SMTP id ffacd0b85a97d-38dc8d98e9amr11900744f8f.2.1739263875007;
        Tue, 11 Feb 2025 00:51:15 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38dc0c5a894sm13914977f8f.95.2025.02.11.00.51.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 00:51:14 -0800 (PST)
Message-ID: <fe0b0066-5f06-412e-b66a-f3cf6ba74e9d@linaro.org>
Date: Tue, 11 Feb 2025 09:51:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 0/5] thermal/drivers/mediatek/lvts: Fixes for
 suspend and IRQ storm, and cleanups
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, Balsam CHIHI <bchihi@baylibre.com>
Cc: kernel@collabora.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Hsin-Te Yuan <yuanhsinte@chromium.org>,
 Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?=
 <bero@baylibre.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 stable@vger.kernel.org
References: <20250113-mt8192-lvts-filtered-suspend-fix-v2-0-07a25200c7c6@collabora.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250113-mt8192-lvts-filtered-suspend-fix-v2-0-07a25200c7c6@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_005116_696314_C6048368 
X-CRM114-Status: GOOD (  18.33  )
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

On 13/01/2025 14:27, Nícolas F. R. A. Prado wrote:
> Patches 1 and 2 of this series fix the issue reported by Hsin-Te Yuan
> [1] where MT8192-based Chromebooks are not able to suspend/resume 10
> times in a row. Either one of those patches on its own is enough to fix
> the issue, but I believe both are desirable, so I've included them both
> here.
> 
> Patches 3-5 fix unrelated issues that I've noticed while debugging.
> Patch 3 fixes IRQ storms when the temperature sensors drop to 20
> Celsius. Patches 4 and 5 are cleanups to prevent future issues.
> 
> To test this series, I've run 'rtcwake -m mem -d 60' 10 times in a row
> on a MT8192-Asurada-Spherion-rev3 Chromebook and checked that the wakeup
> happened 60 seconds later (+-5 seconds). I've repeated that test on 10
> separate runs. Not once did the chromebook wake up early with the series
> applied.
> 
> I've also checked that during those runs, the LVTS interrupt didn't
> trigger even once, while before the series it would trigger a few times
> per run, generally during boot or resume.
> 
> Finally, as a sanity check I've verified that the interrupts still work
> by lowering the thermal trip point to 45 Celsius and running 'stress -c
> 8'. Indeed they still do, and the temperature showed by the
> thermal_temperature ftrace event matched the expected value.
> 
> [1] https://lore.kernel.org/all/20241108-lvts-v1-1-eee339c6ca20@chromium.org/
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

