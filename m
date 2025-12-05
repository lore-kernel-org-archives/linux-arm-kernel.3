Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A8BD2E038
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 08:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V+dVo2JNAn7MsrQQRK8VE52kJO6dog4ObFIZQRBPJw8=; b=xyaUQLnJtaiJOucPdOieUrbYK+
	nOudnMU+0odYvKbuB7GlFU/1QL8P5qVVFlmBJ+eaXoHBBpqGM8BsARPLK5KyrGVabvF7hExIimc1T
	mLX+hjXdsSKYfQdn82nKzRTTa+JEzm20SsFpy+2lrJ0MamKI3TBRJyMjLuxG1LL8Wmri66Xwp3YuN
	euy5QZIr7WKm068IsNPAm/niVQjtP/IOf3fFF0Qdcfmln0/+N/MHI7DeW2AuQYeYOTdNeMyAIoGIl
	wVDVgqCoMOcgykT5b/yQkYH4vDpCN0mH7fta9FpeEhO4yZed2q8CkKmmnUbniBk6ui07IXboFFbe9
	cvUGJBwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRRDG-00000009EEr-1cRj;
	Fri, 05 Dec 2025 08:30:50 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRRDD-00000009EER-1cko
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 08:30:48 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-64080ccf749so3024335a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 00:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764923445; x=1765528245; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V+dVo2JNAn7MsrQQRK8VE52kJO6dog4ObFIZQRBPJw8=;
        b=LRyUrE07MwAmuR3MDjcTzclVu2Dr1HMQPu3YpG3FPgDg1FgBUjmU0G05qLJIB0V38q
         fdp+JRSP2c6rKl2I0UoKBFce2QUZih5kT7DI2f/c0ckRLUgq9fhoiyVvKU+rYBLOHHm4
         qRbpgYOIB2fdWjJvapjINpDlXQQEVsSR1ejEneBvTnJnPE4731CtkYExBcrHeW96e2Jo
         lN5YNvQc1nOY/ByrXybg3qGsMo/WuD/TVZE8mG0imJS+i54ixlPVGQNChE2zf+8dyUNi
         Lid6e9Zc7CK3xON6wDevo32I33wgTfKQuKfSkDCHcL238722bn7q5VhT5l52uSZhc+XH
         v55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764923445; x=1765528245;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+dVo2JNAn7MsrQQRK8VE52kJO6dog4ObFIZQRBPJw8=;
        b=EU1z9MhOvPU7Xsyvrquyh5rDN/ub5fHS6ky9B7D711EnHsGx4CrkQs5rAZpBhf3dQ7
         /pPayqTycZc7t9AYrJ4PDoDaOCMnBitTNgTLLGvKhKD4jw4f7MkXwhSe9m/1ZbaK9llo
         8MqcAT69o364Z3P8dETqgTtZoyhOj7TNaI7E54aKVdWiYhxyC6xhKE+XjTngpyFGbzWA
         kzRKEhQoipVHAAImTdaZzpQfqN/1VTLibLkl1X03yIjXJ6728NDnDr560Sd6LjWaGkXj
         R5ex4KfwBJ2yRngk5AETUw4QGWX84tQssuJ9j1KhXE4sxN/Teoc3IL07wEhAcJDevhu4
         I3cg==
X-Forwarded-Encrypted: i=1; AJvYcCXR3CLki3gd8/7zSH5HyVHuOX3uutM0JxejkLO5lIQm1oMkiVYsKWSpEbj5KcFTMNvtdfVmiUFgW3Y/qyXUmuQq@lists.infradead.org
X-Gm-Message-State: AOJu0YzJSLTPV7S8FcuYrFduMWf99z92FYOZw+AndfjxpQKCMARwZA7S
	njeekBSo6NVzFFsayFuoxSGI44Q3mtKeRqpejBRBf28lxKDep7MRG3ARldYL94FkVrt+Ynhx09N
	ktD1Meyu6I1+Ei4Y19jZiekCMt4oDgTM=
X-Gm-Gg: ASbGnctJm+Ord9kL6k8KawBQmliPSL0Kj125Gc93R7lgAb8aamUerolrMx1pi2GCt6w
	MdhpGzlDUs+cF/t/+gLw3DWlCmGGWAE7ziX3xE4ce7AUNL/BzyVoL9D4iaDXnwA1aLUhFftvM3u
	VOgVmJn92Mao1XyXhpezAPhAEdIQhTrBQ/60kxYH/wTC1qE77qygEtQsluYNKW3JEiPQpW89zUq
	T7zuZh8/HEH8zeHr7tPiRl6ZPic5xabOVGkyUDdleGFJCcpvDvlHiPdo1s4ywripqo5Iw==
X-Google-Smtp-Source: AGHT+IHyhPhO5ji1Udtkp6jlBiDNdS1nJUTysDiG/BFsQGzVGkOYuq8S0+wdBeVac/yGVlo5iFM2k5xQ7B6Gl1w0/Sw=
X-Received: by 2002:a17:907:3fa1:b0:b76:5b73:75fb with SMTP id
 a640c23a62f3a-b79dbe72a9emr795463366b.9.1764923445456; Fri, 05 Dec 2025
 00:30:45 -0800 (PST)
MIME-Version: 1.0
References: <20250813131007.343402-1-linux.amoon@gmail.com>
In-Reply-To: <20250813131007.343402-1-linux.amoon@gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 5 Dec 2025 14:00:29 +0530
X-Gm-Features: AQt7F2qxbYSQuCXsYlo3s2RghAVsnJFzDr1A7ezZUPavGedOu8ugG3TEr0d0Qp4
Message-ID: <CANAwSgRqFsRvCzrK7NXfqa91xhQLLVU_u2irLBBrRcpiK9gGkA@mail.gmail.com>
Subject: Re: [PATCH v7 0/7] Exynos Thermal code improvement
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-pm@vger.kernel.org>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>, 
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Cc: Mateusz Majewski <m.majewski2@samsung.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_003047_551553_C1BBA0AA 
X-CRM114-Status: GOOD (  19.12  )
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

Hi All,

On Wed, 13 Aug 2025 at 18:40, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Hi All,
>
> This patch series is a rework of my previous patch series [1],
> where the code changes were not adequately justified.
>
> In this new series, I have improved the commit subject
> and commit message to better explain the changes.
>
> v7: Integrated my RFC patch which improves the IRQ framework
>     for all the SoC link below.
>     [6] https://lore.kernel.org/all/20250616163831.8138-1-linux.amoon@gmail.com/
>
> v6: Add new patch to use devm_clk_get_enabled
>     and Fix few typo in subject as suggested by Daniel.
> v5: Drop the guard mutex patch
> v4: Tried to address Lukasz review comments.
>
> I dont have any Arm64 device the test and verify
> Tested on 32 bit Arch Odroid U3 amd XU4 SoC boards.
> Build with clang with W=1 enable.
>
> Please sare the feedback on this.

Can you review the first 5 patches of this series?
Do you want me to resend

Thanks
-Anand

