Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DEB8C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 07:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jivBZbbpeUpC37vr59Lus7C69ZvI+/qcef+nWtlt/Z8=; b=n07alhH/afHIAFofRd9NXryxhb
	CqBEYgZCI/CViNZRuGlscKhxbNkmsHsVaAiWK+ldv5fn27AirbfmHaee1Myep15peGYoDWX6TigsJ
	tq6nBF9qWtvlj8bJPxlvkJorPPmLKy+ZoQ/pxMhd3avkLydkmaBUldqOkG2MwMgUNbHquf20yiLob
	wLwZbRCAv5OGZhK7v+OkIR0OQL0ZS/hEQjgjTrw2S+u1fd3O5xW3L65V3KCKHQ1OfvLu1MethP3I+
	hJrrbs9XdoAYWluW7bQcDuz0s7vtT+h+Nt+ijOWMDvC2qFIttz2F2fOTS4Vx6i4163YWI1y/iAWko
	a7N4pK5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqSZm-0000000DTxZ-3Ehe;
	Fri, 07 Mar 2025 07:56:58 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqSWz-0000000DTg0-1WwK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 07:54:06 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3912baafc58so958275f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 23:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741334043; x=1741938843; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jivBZbbpeUpC37vr59Lus7C69ZvI+/qcef+nWtlt/Z8=;
        b=vuLQfLVmHtPGkwHbwzSd4OFAABtxQSObxFJHhx0WDPXIV3GGfvMMgREjZwl7ltfJDj
         /ToY7JirLqp16r4gqjzMK3DaWaOTeSCgRlgUhDKb6CceSWm7Kk1U6a80Z3kXVYnZG+Qs
         Lyenu0G0/VVxExs40EcDJdA1W3OBXykCmKmytZoxXUzO4OzXmWjIDm1xaHAD9mZxa1E4
         LTf6tNTnXHRUqmvahBrlINGSmt4qp8+IoCnUkOnOGGFEQ3VqkL7ty49ZV+IqF0lm6vQf
         touTsNPHAG8bd54mDyvjAu3hFq76PvztTG34oIZz7hqx6MpTu0jfZXM4qTi4CTbIn0KF
         Frvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741334043; x=1741938843;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jivBZbbpeUpC37vr59Lus7C69ZvI+/qcef+nWtlt/Z8=;
        b=nAgVscKqFMNMjz9gjcZ0L+bukmz0b1gdOMPkFCt8iV1AvXJOXwbPP6dssIFFmBoozJ
         h2OsRqdXBuT4ur4deIg6cfiseI6uylQ3UAKPcxoY2prXsqUeQMfm289WwbNGXuUvdt7O
         dFbZmuFYPpVUD6dbEQT5rQ0fNrYxoxM4f7EtOOq1c0ECbNAwr7QE0hCF+k4dYxQkeCMM
         uLopWPzTJZ2nrAO/PJjqPfTeoWLqfVfyHYCkrQFw9v6gTODQJoN97oyaO2pyfFCaHtHU
         9UTW6Q/k0vUXGLtebTfWU02NkLpKpmgejgGdlSY9HYegQD5P5DJLKxv2BhK7axsuEVS0
         Tl/A==
X-Forwarded-Encrypted: i=1; AJvYcCUuQ412rrnASw8UF+lknoyaFomLK6IaT69ruK7tFXuDGM4qO47Vsvkmq88NUxpIFO51C8BaXKHMNbWBR7jL8dlw@lists.infradead.org
X-Gm-Message-State: AOJu0Yxma4HxWHUNp6GZhrH1/cDrQkkljha4r9Sv5zef//4FcnqC4X0Z
	2h3dT4rM+LODilxU9839zgFquLkVQANSrAOnnZEPDK4ZP/STP5t5aDmpedBt2Sk=
X-Gm-Gg: ASbGncsy22e9q4adnKGpLXeJjQgON7QusfGVvaWJxXlKE939gf/ZxUIFonu+29GtjLe
	yXPnj5cvQgaSmFR9U7frZkdwfICFM4pJfprJQ4QQ3h3mLht1twBoBGb66NhPDD+bgV4iVfVvnrm
	agrCdj21fNbTaggl+vTLxgG7kqKUHFyuyYybSk5NBl+gOZEtj0IGMQUwhLy281dj36ExbeQVpOV
	UqxeXDCyfvt6jHkNgICTse0q+PTY0dnqc2KGW016HILJ7GiqySWXI49QtJqU9NporRHkgZxk9CB
	0vrK/DXxlhsfLkxVkxYKpKbq0/G9D/K2gcwjcdkinlwfNmyaCRops0GPeHMjqGk8dB4ZbcG/BAY
	zTuJQjQUo
X-Google-Smtp-Source: AGHT+IF84dx46mQjSLVGU2fwl0MIMB+9teoe3MWhOKYeBMQn9a4+JteyS3aCEq/ZWOCktwprXzRy4w==
X-Received: by 2002:a05:6000:1884:b0:390:df83:1f5d with SMTP id ffacd0b85a97d-39132dbb4efmr1337542f8f.35.1741334043195;
        Thu, 06 Mar 2025 23:54:03 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3912bfdfddcsm4579617f8f.35.2025.03.06.23.54.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 23:54:02 -0800 (PST)
Message-ID: <b651acf3-ae10-4f70-a879-3b5d6ff39b02@linaro.org>
Date: Fri, 7 Mar 2025 08:54:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] clocksource: stm32-lptimer: use wakeup capable instead
 of init wakeup
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, tglx@linutronix.de
Cc: stable@vger.kernel.org, alexandre.torgue@foss.st.com,
 olivier.moysan@foss.st.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250306102501.2980153-1-fabrice.gasnier@foss.st.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250306102501.2980153-1-fabrice.gasnier@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_235405_406419_441FFBF0 
X-CRM114-Status: UNSURE (   7.78  )
X-CRM114-Notice: Please train this message.
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

On 06/03/2025 11:25, Fabrice Gasnier wrote:
> From: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 
> "wakeup-source" property describes a device which has wakeup capability
> but should not force this device as a wakeup source.
> 
> Fixes: 48b41c5e2de6 ("clocksource: Add Low Power STM32 timers driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

