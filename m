Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730BFC83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 12:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=he9iT9WyI7YlpqKEh8jhMVFH9zJFZphKaP2582ttrGw=; b=eRgVkVsr6xBAvkArfTYiAN8ZYV
	VTLh8QqkKt+OonBfh3dHOAY3P6w28QfSIahBhpM08DmGhJ8jMtIx6evUNQw9FaclH3uzCvXSOf2BR
	mSsOJV7n0MsCKzvySluH0xkUm54XKj7E5NMhglIt3GT6mNn/LQ+Z0gIKVKWIM1rAOjeSUYN40IkHx
	Z22BD8eDISH4VLr+RFjn78FoMSfReWzb/9hqIx4zFx3aKRVjHBy6fS7luGUU/UIDlHfZvkaFIhvKL
	JwEdK+VMPm6NVrXSpJfNQkT7dO0ZitjYrG1nCVS8PGv7YbIF7Q0j+leu82FIxiDEFIBNSupd+HoC6
	978Kc7Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXIgw-0000000BGFv-0Mmb;
	Thu, 03 Jul 2025 12:05:26 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXHgr-0000000B5Sj-080L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 11:01:18 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-451d7b50815so42294705e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 04:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751540475; x=1752145275; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=he9iT9WyI7YlpqKEh8jhMVFH9zJFZphKaP2582ttrGw=;
        b=j7CK2dZ3eALfcxdN2KYkROdfuzK/ue57S8JVRYuN+i1x/Dz7NMQvG3O9iaujqrp0NJ
         J0QTDFdws0NFAhD2F5H6R8IazkasI1JMctx7XONTq7hzY5Ldr3z3QfBIwVW1XOErzPUz
         v7GwJkBp5+1JTbxZcOahglFocduOoN1DmR9V6weUMnYPcmdWoF6kHzGXd4N+5FULZxP6
         qWRgWxx9FP5NC0FXLJODQ6ZY7sqXB6ZcdldlXlGoBWgpn+WywR/EUqGMQzT/UpJ3amME
         x6R4d3WwUgotpJSUChvWNsATpbbkSzHgtqcQO6onC1bcuIbXvpZpS/euHxUMBFraQH4+
         q5xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751540475; x=1752145275;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=he9iT9WyI7YlpqKEh8jhMVFH9zJFZphKaP2582ttrGw=;
        b=ZrOiniREKrjUlLjzsL4B4Z3UEonRwVb+h8A3fKFrFmQSfAxH5Nim4Zp7vV6+Qz1QDa
         JDAA8Eg6va8G16uwBLc82hFLvyx6xclVHD1WBa3RRwXtqAtGzH2zedMdAgziBFQOYqgp
         OqZhp5i/mn4XmO7PYNW8yepxd7oG0rXYVQjKNhMvH8F79PkRN+HPpHa6XhiNLNTusNiH
         wNux/xfSRQJa6TZ9YUudPl7cgz0KlKz6J3+PskZaeSpo7qQiQnOdmJxo5Grru5jUps/U
         CVxFnEd6q95C+ce69DYYnnc/j8PuYQMETc6Dt85CNWm0xbCE01FAG6I3WUfGgITtS/1W
         FSzg==
X-Forwarded-Encrypted: i=1; AJvYcCVMkZahVYBkLDwVM1zXqiLTNVx90nl8ggJzt90TuFUM74l2CtrWqWzwTGyUzqmqChPN+I3U+rCQ+h1JtdCWym2m@lists.infradead.org
X-Gm-Message-State: AOJu0YwnERtrkEeU+HL9RF3q+UhBh5BFeWiYoi+0PWIISCjujCzmNfW4
	SPZLgx6cj7TJP9NtPYmzuJsMniNuniFLNQ+965+0iNfIJhEGte1t7dxfxmYBX6KQ7G4=
X-Gm-Gg: ASbGncu57NQTHhzRPyhmPe0tkSqk0D29xWD/XMbl5JqSdnf/fcIyB+nKWIQCQ3QUvHq
	1igJpLrxEA/+XSG8kONp/XbjgyrF6mvWSm3A12Ago5XL4ReH++XMfWcZaLbE1PSwfkb+EJusJCi
	h78ely4/QQ0M6RJbvEFHe1P1Md7BcdAJRgagM0kubYxOmd+5IMxjyk84NX6c9xpj/HcfempbS+2
	q2o5RhOZQSUekR7POtDIVC6KFYVCBrNM1t9ns0tX1S5WaXog4bGQOVnV5T1ReLoIeOGszRIGZSc
	WvpG6iBYPiRPvwxHRLJ3NorfHNPWk18cXgafWk7QwOJUJugtuaSy3kVvXwzd35sdAg==
X-Google-Smtp-Source: AGHT+IFmsyLTW5PbUc7ffB5ixd3FjfkYoUZQCDDDXT+dNjoFbQ1TMzjLRO6Z08bG9VoRMBxKr/UkgA==
X-Received: by 2002:a05:600c:1554:b0:450:d4a6:79ad with SMTP id 5b1f17b1804b1-454a9ca8543mr30636995e9.23.1751540475173;
        Thu, 03 Jul 2025 04:01:15 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9967ee7sm24208965e9.8.2025.07.03.04.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 04:01:14 -0700 (PDT)
Message-ID: <53a214b4039872ce7584a2ae6e688fcef0c86d7e.camel@linaro.org>
Subject: Re: [PATCH v3] soc: samsung: exynos-pmu: Enable CPU Idle for gs101
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: William Mcvicker <willmcvicker@google.com>, Krzysztof Kozlowski
	 <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Date: Thu, 03 Jul 2025 12:01:13 +0100
In-Reply-To: <20250627-gs101-cpuidle-v3-1-0200452dfe60@linaro.org>
References: <20250627-gs101-cpuidle-v3-1-0200452dfe60@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+build1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_040117_065857_FB90B55C 
X-CRM114-Status: GOOD (  13.08  )
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

More small comments. Sorry for the drip feed, just trying to understand
things...

On Fri, 2025-06-27 at 14:08 +0100, Peter Griffin wrote:
> [...]
> =C2=A0
> +static int gs101_cpu_pm_notify_callback(struct notifier_block *self,
> +					unsigned long action, void *v)
> +{
> +	switch (action) {
> +	case CPU_PM_ENTER:
> +		/*
> +		 * Ignore CPU_PM_ENTER event in reboot or
> +		 * suspend sequence.
> +		 */
> +
> +		if (atomic_read(&pmu_context->sys_suspended) ||
> +		=C2=A0=C2=A0=C2=A0 atomic_read(&pmu_context->sys_rebooting))
> +			return NOTIFY_OK;
> +
> +		return gs101_cpu_pmu_offline();
> +
> +		break;

break is not needed after return, and generally there should be an empty
line before the next case statement.

> +	case CPU_PM_EXIT:

Should this also handle CPU_PM_ENTER_FAILED in the same way to bring
the CPU back up in case of failures?

> +
> +		if (atomic_read(&pmu_context->sys_rebooting))
> +			return NOTIFY_OK;
> +
> +		return gs101_cpu_pmu_online();
> +
> +		break;

No break needed.

Cheers,
Andre'

