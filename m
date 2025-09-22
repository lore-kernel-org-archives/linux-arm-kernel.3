Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0673CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 10:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y811XUkUAcjUYq9kF2IbC9o9QTenp6PpvmUvV5JyxCo=; b=SCbuEnxrGvyOg46CZrQHMIXbNP
	drvzf0gFijjTHQYNF9leOUo/lKCVNi9JRtaEoFQxc60MDLX8JK5l7b/9t80dZS3b/R1yTE8F4aLD4
	wpbl8QWwjG6/Qmyc81Gyn/w0AExtd4nTohgh49gviteDH3+70YJDY3UgJoRFoW/y4Lp6Y7nA0S5Zi
	K3JrTbf7seb+0jD/T4Bx15Xglr8knANWHzCE/IRE6j+nTpjnVaI3raAwmdumgQGHr6LfcZKWQjdKj
	QTt7kEa38sEqmDwDzvNDnd+SyX227EdOShchRo9ZR6UawHXwCOEzGjacb5CUvlOePuen5ENYIYSV/
	IjKJ2xKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0dMt-00000009yI9-2EvC;
	Mon, 22 Sep 2025 10:01:59 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0dMr-00000009yGS-0Jwn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 10:01:58 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-467f6fd4e82so9564195e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 03:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758535315; x=1759140115; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y811XUkUAcjUYq9kF2IbC9o9QTenp6PpvmUvV5JyxCo=;
        b=OaKAGuCglMVbmJxQoUKzPYFV5NvjpQd3K1ZdQsOknuIm/r3m//MwmKSZ0aissv4j0+
         Hs1rFgDnZt4TIv0oE8Jnh9S+9fK0OYZTzpC44sjOGWN+xfkIA+dSCDTsPgNGaUwhiNU5
         TFqp7sHUajCH1P756d54pHwFBgGw6DrLr2h3XXPHmeJTe5L+ytJi2lAciqzJb1vxVQqQ
         TbjOAef2SBFanoF/zynKyRW6z0kYl9MCluxqB0P7P0sB6A8gODq1riRhxRX+0QqiGzKd
         IH8e3OFzsnltdtMwKJGfhh+wEu7iragIzfEEnJPi1ReMpdJWDeD6ebt9okO7BsZHJNoU
         MG3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758535315; x=1759140115;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y811XUkUAcjUYq9kF2IbC9o9QTenp6PpvmUvV5JyxCo=;
        b=FI8crrfP5gvVqPaG6mmR/F5M0Vggotu1LL8QCS1/A6yBjK//xUeIX1Yflao8mbzp0L
         Z3GnK1nOeP9fqkfmUMyWP9oOo98o3a0YedCRNiQdtGEnPff+QS7WlFJ8a0d2HNtfHerr
         3lahTmjLS4mKwbo2G37FHqguiKNO2GTATk6ec4o325PDXfZPHlzyk1PzPSP9XayGTDHC
         E0Pbxb0ZBvwBHT5hws3Jq8ShTIpRJgIm8NsAccy37361HdFYo2s59YfEPyegr4x+eMv4
         g+frSel0vMv6gP1hqGSlnYy6f9ImD0MZnXhOO2Vy7ewShhxQ0YPDVFEaFtT+rSU0DarJ
         T4TQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGBfzl/y5lejCgIFPMJR26Dip+xKcCHg2z8dnNQ+vdg5g++6ICEQ08jj4YxxrQSPioYzX7nE1awqTpGog1nNEY@lists.infradead.org
X-Gm-Message-State: AOJu0YzkoFENTqSiPnR72Z/y5dsbqD4W4dzWkNKSn+RLBnMJH5gqLFmk
	MAWLeit21iPOc7uGVxZl+nR19euNA2XT6QpXNcfHG35iKd0oCEiPUGAdwExdGUdb/sg=
X-Gm-Gg: ASbGncvTBCLGtwnmK564hWKz7/3KZlkSkSEfxaHXpcegb1hhp2/6bk7PDsOSOHwNs+5
	A4vkdiudDkFYkjN0OPycUoAJQQhT50pgIdkZ0z9FnPNyxx5+SVoV+Ye4HfpxqmiCdcqhCttY/Ll
	twJ3c+r7fgiJfnIbGLbuOFM08ThH504ZWHuUtd+AcdihDcZwlgfidU/UASI/jPkqtz3vstL5oyQ
	RJYNyqeaCfMLOmHNrjZ32XSlXWlV5HyJed/Juj8F30ZJNPWzLz2XvZiMz+Eutnsvqj+ca3LgAQS
	AFMKgYaKM0evVxXjFLMN9KQfmOCac/3fBSk0W1R1uy9Gc+l2EhnvIc2mtLCuQRB9F34KAIqQoMs
	3xNM6SkW8YYckf2M55hKvcBhTXxanpO+e
X-Google-Smtp-Source: AGHT+IHyiSZQlLreoJ3W3Ph8Q291wVJ5XeiMCjmBz4nM2qvfV1a5GmC8lVHC1BmJs2M+jyBWopho2A==
X-Received: by 2002:a05:6000:144f:b0:3ea:e0fd:290a with SMTP id ffacd0b85a97d-3ee7ca198bcmr9624896f8f.12.1758535315118;
        Mon, 22 Sep 2025 03:01:55 -0700 (PDT)
Received: from [10.11.12.107] ([79.118.185.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee1095489asm18419549f8f.24.2025.09.22.03.01.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 03:01:54 -0700 (PDT)
Message-ID: <c0a0daf4-e9e3-4152-8e5e-c7b52a30dae9@linaro.org>
Date: Mon, 22 Sep 2025 11:01:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v3 15/16] kmemdump: Add Kinfo backend driver
To: Eugen Hristev <eugen.hristev@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, tglx@linutronix.de,
 andersson@kernel.org, pmladek@suse.com, rdunlap@infradead.org,
 corbet@lwn.net, david@redhat.com, mhocko@suse.com
Cc: mukesh.ojha@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org,
 linux-hardening@vger.kernel.org, jonechou@google.com, rostedt@goodmis.org,
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
 <20250912150855.2901211-16-eugen.hristev@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250912150855.2901211-16-eugen.hristev@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_030157_145976_83B6BADE 
X-CRM114-Status: GOOD (  13.17  )
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

On 9/12/25 4:08 PM, Eugen Hristev wrote:
> Add Kinfo backend driver.
> This backend driver will select only regions of interest for the firmware,
> and it copy those into a shared memory area that is supplied via OF.
> The firmware is only interested in addresses for some symbols.
> The list format is kinfo-compatible, with devices like Google Pixel phone.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
> ---
>  MAINTAINERS               |   5 +
>  mm/kmemdump/Kconfig.debug |  13 ++
>  mm/kmemdump/Makefile      |   1 +
>  mm/kmemdump/kinfo.c       | 293 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 312 insertions(+)
>  create mode 100644 mm/kmemdump/kinfo.c

I tested the series on pixel 6 and I could see the backtraces correctly
decoded by the bootloader:

Tested-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Thanks!

