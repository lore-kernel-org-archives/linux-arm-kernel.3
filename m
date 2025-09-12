Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C580FCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 13:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oeww4Ivx5YThdAfSYdbOCn1Gj1LUFzN/W4lJGwFtW3A=; b=kzmU7RqC5V6v3UDmrltoXSdahw
	uZIKAtSIfW3O5PirSZSvNtVtp+gYGjZArhX5DlfxirPA2Ax0QY3aSNzB4fSJHRxH/C+IFFwKeMHiv
	P02eiA9gjGGd/bLXeIxzGRLHdXxeDlo8pyr3YbR7SKuWgFOSIzG1yH/+7kwls1333lUKSGujznqeU
	A0gUKn9u/EyOUcPtp2N/IPQ6BkEQ9ISwbwaAuwKc679hyQ2h0ajaBpU7ebeO5BgDlvjtFaYTzXpw9
	WzdV6EWIshgRZavfJ23brr7E06aJysHBdBs3IEqdKJ5QD4ShB2qONizh1X4MT5yoful6nRp2pCa8W
	J/WQ574w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux3fs-00000009Vdi-45z6;
	Fri, 12 Sep 2025 13:18:48 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux3fq-00000009VcU-2bZO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 13:18:47 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-321281431f1so631082fac.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 06:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757683125; x=1758287925; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oeww4Ivx5YThdAfSYdbOCn1Gj1LUFzN/W4lJGwFtW3A=;
        b=T47z2DqFajRe798Lm70xO+KAHMZUofwD/DU8kjM2+Vc7wBFPHIn+Wrvvu+IG9gvXgc
         ll7gdBhCfm1V+0Y0HAJEFunV1ZiktliUVNjQ+7NPF/hDUBeZqi0MeWjWKnCEETgjITGr
         EvrnFRvOrbiGZvcOyHzhB5qSGyGGLJUNMrDlZeFsGi5G6yUWRWHRV/JLunjwkccb5ULC
         Kl2n9H1qTc3c44oCKj+nwNckXMzUCPd+0ZCPx+Y+9vOQ7CU3qyICWOMdhUp/xaHjxlPX
         Fjbsv7iqngCX4YoEspcE6a4oIyn9jDxHGJR3rttWG3VnNhJC7PsBU7F1ZMhsTpGUtvSo
         eayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757683125; x=1758287925;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oeww4Ivx5YThdAfSYdbOCn1Gj1LUFzN/W4lJGwFtW3A=;
        b=T9jh64AFfEA/unBKP1PZEuQSpkvVqTAkbSnhZH1tmGG7rJkJQA0LGn882/thukOxJF
         lAEwYoZk3Dld1T303m+zk7W+QvVuizaw+V/sGGQjiBk5Xp9Z087ub1RgIraBCHvGkPgu
         n2vLQZddkbyscKIH+NRuRxIRYDhofSUQX6szMtHJwkVpoALnv1UFZECr8/YFMiN5nHIt
         F+QhFebrhW5XkRpFlnW+lRNlLBotB7AvMnOmbiyTudjN9LfiifV7nVMfpIfGNxW3UW19
         GK00yM/C3JRrQlUAorF/jND7icgYIWiCMvm5mOFgSjpBQDmuUxApPR155ALBKMjCTMfD
         s13Q==
X-Forwarded-Encrypted: i=1; AJvYcCX7bWygYK7i8yV3am59RH/dC0XPstTJ2VoYf+66HoWbVT6J0OK05Y7YWIiulmsuhQ2NsnzP5R7YT7Q46gGwEHsH@lists.infradead.org
X-Gm-Message-State: AOJu0YyPJAGQhbJhIDPiHv2DFdK5Sjz4Aml/X3w+F9oPlsGyfnmPi0Xl
	Zijf1nfJ3mZh7vbeXAkJps/ts+WxcMyVAlSlitt3RsXZtwaQkVYrLWynG7HbaAFGE8yzenNZdNz
	4B+7LsWpxd+jGrhwMWuVA22JRC2yLgOVeGFlcjypf2g==
X-Gm-Gg: ASbGncvHQEGzO/EnTrNBsfE30HGVFwR+S7rZj9qFcDgvjD1cMr6JRE62c+heZBv2Ldx
	BOkjL7uGnPHS7jcbqhnOeJScNcJ+0Jo1Cyz2ysV550Gcb4zLVXsCdwwTaUalymcXq8AHvlN4agt
	iJg1390gJNzND5ybHw/y0ZpjbdrEZgZo340F8/3UVNvxbFhX/8K2dKoVzn83MBw5SBJbVviUk7P
	MhMrJM=
X-Google-Smtp-Source: AGHT+IGfSaVuijaDjlm+oIKN2iiydfgKjK+5YsMgIZmmXxQ/CONJDi7ONHUL/Qm+aJ4qj0ySkZLSHpb1XTjKs2wTKXo=
X-Received: by 2002:a05:6871:154:b0:322:4639:f3a0 with SMTP id
 586e51a60fabf-32e53e60589mr1203923fac.9.1757683125291; Fri, 12 Sep 2025
 06:18:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250907202752.3613183-1-alok.a.tiwari@oracle.com>
In-Reply-To: <20250907202752.3613183-1-alok.a.tiwari@oracle.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 12 Sep 2025 14:18:34 +0100
X-Gm-Features: Ac12FXyFWdruiBB0gYT4kEG-HddeFzWWyfMX32BSCDTTl49jpBagppTHhtL-eME
Message-ID: <CADrjBPoByCUtKLR193QpfMv+1VTspq1s8Mzm4dzLCUai8P30Tg@mail.gmail.com>
Subject: Re: [PATCH] scsi: ufs: exynos: correct sync pattern mask timing comment
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: alim.akhtar@samsung.com, krzk@kernel.org, martin.petersen@oracle.com, 
	linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_061846_674539_71F294C2 
X-CRM114-Status: UNSURE (   9.72  )
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

On Sun, 7 Sept 2025 at 21:27, Alok Tiwari <alok.a.tiwari@oracle.com> wrote:
>
> Fix the comment for SYNC_LEN_G2 in exynos_ufs_config_sync_pattern_mask().
> The actual value is 40us, not 44us, matching the configured mask timing.
> This change improves code clarity and avoids potential confusion for
> readers and maintainers.
>
> No functional changes.
>
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

