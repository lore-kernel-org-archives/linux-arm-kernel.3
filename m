Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CDE1C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 06:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qwcG0nkjUDlN5Bh/rhj3k2ZPiTcT+O714WWyKryB05o=; b=PTFjHAueNBBi/1tut20G93vq6b
	5JKcDHE4I60NrC1iFxk8hugQjtsR76/NVIpVNqG3TetYVCfNoHkn8E19dRi7MZsXY/gPEv0G3igFA
	X5pUqvmwdc0STi7CuPtz875PruVNWZjSh0UPNn+X38+xXAJylOh+NdelzbdHcuCXHR1jlL7aiBhOS
	vPbJVUTF6xI1Q0toVy144Jm2PuUiEpjXwuqj6+8cNRTBs2XrZn2/3heIfCEFypga6YeKBdwpzmozl
	9w9IPoCcatXDE/SmBuw+CvYe5e984EKZDD0I5AP+8F3hYoS7QscRGttr+ACvpxhYghHC6/HJsmzTl
	0zB8zLzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuQtp-00000004rvY-3GyL;
	Tue, 18 Mar 2025 06:58:05 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuQs8-00000004rmk-3rtz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 06:56:22 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-ac29af3382dso862963666b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 23:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742280979; x=1742885779; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qwcG0nkjUDlN5Bh/rhj3k2ZPiTcT+O714WWyKryB05o=;
        b=hmdtaheqaU2yZJb6RIiodqkU7LHr6s4frQSQUiNIQxNzNp8Gv2NQBy9G6/TQ9ItuiP
         ibnGwxcq6we14D6Yyu+6lnkiaDE1eQ+99S1rRDkt+kySRqnvceJKP+4F1441u8u7gueC
         pUIH6oyc27SO2g0zehOvHmXvT/v8txaRXfPt0p70FGEZEgKLQ9tYgM+YEmwh3wMk6PBi
         6SXRp/MwMshBmB0vpUDLvXP2lOKNM3nOw7pLQ02eu/x728C+lY+2rQ60YPA24JBfKdSe
         KVfTOdGRkCSCZTNs4MLQFrKE+6ZmJ1jauYgEkcZ0WizKoG3kf2zeIy42c2kLvkwz1zaq
         CJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742280979; x=1742885779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwcG0nkjUDlN5Bh/rhj3k2ZPiTcT+O714WWyKryB05o=;
        b=rEZ285xHzvxsddXu57pVPCqkf8t6n3NGgEMPURsHxBLZROn+vpf0go+kliDehH1bXW
         4JvszQoAX8Q3v0gDD5GPFhefT2UITdiJQeB2G71Be+e3thLveq4lUeKKDHR90dFQfS/G
         n9pml88jRxEmNhyv9zw+mp3Km5rhgxUOD5hfTI+kkPoFPRTIIzhm2e85QJ1ykQ/SFsN0
         U04n5q/LIgVuCKFlC0+vu9QyrI2ZpYpocljxGg6G++XtGu5RaZDIshKpZ//FdFrfFnjn
         bV0VqUVCoH5ovTt5WRiuO8RQUyNZkEwILewjtn4MP9AnqsnMIaBGpDoILUjb6Rw5kXWo
         ldog==
X-Forwarded-Encrypted: i=1; AJvYcCVc4pKiCeBAcVzmIbE2CTPAmFijK6C4LzpoT84pXRIg81EKAAVNfIcihbVuCW22z5Gs5LTmvdSZPl3krJnWLAQ5@lists.infradead.org
X-Gm-Message-State: AOJu0Ywo+nq7yaquECohNeyKGEmFgcI/oNgoSGWctkS+4Tr0fVaKD8NN
	C4TRGtIUiDR1+WD/9fY40hVNmnuSuFgnMNUxskRl4AT9fcxdksEGjxsExQ==
X-Gm-Gg: ASbGncuXNiAiJlD7rjUS6JQAC+TMDM/iBLA13tlcFZ8+2KXiH0TIWdA87WfujLOb8Pf
	JaJF6Yz02DI/96qMbzEsVM79Pm8E2KqMwzrCLgKpJVAM8/jjIvA5NJWWCPJBF+E2HI8Y+9rensI
	daVlCylccwdrV49zKZKwc0OVBRWQI9pbMcguve/PxY+09HUPwBHXmPjQo4EAqDNm7aZQAIics60
	LyMYRjE2Z2lZlkIzNJzOqQQckjtWwB1TYVGLzlamYFX170YOtlbwI6VsPhg8Sddqs2Cyu9dFOLC
	XgOmMY2AUIoRM+9bZKOprJIXKBJ5I/Bgi6JbUYFzK6WufTij0fe1TVFRb4PrxgiaZ0fB+xcuyQu
	wJXNNCraRHsclVLO48/+lXBnE/tYlgkaz4wIMz1CYFCUjjg==
X-Google-Smtp-Source: AGHT+IEFPFabopy2MYvkvMtlIv02ESYxo7QfPaSYD2btK+WSLZa3CANNpz53pkWjwY2mwptKmEPudQ==
X-Received: by 2002:a17:907:96a1:b0:ac1:effd:f2ea with SMTP id a640c23a62f3a-ac3302d1dc1mr1648297366b.24.1742280978900;
        Mon, 17 Mar 2025 23:56:18 -0700 (PDT)
Received: from alb3rt0-ThinkPad-P15-Gen-1 (host-95-251-108-181.retail.telecomitalia.it. [95.251.108.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac38f091c7bsm106906766b.38.2025.03.17.23.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 23:56:17 -0700 (PDT)
Date: Tue, 18 Mar 2025 07:56:15 +0100
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: shawnguo@kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: OCOTP and DWMAC builtin modules are needed for imx93-11x11-evk
 kernel dev via TFTP and NFS
Message-ID: <Z9kZD0vEsrrIftk5@alb3rt0-ThinkPad-P15-Gen-1>
References: <Z9fhuVltKwqgHdLp@alb3rt0-ThinkPad-P15-Gen-1>
 <935028c6-ce56-46e0-96ff-46fa91c8f66a@linaro.org>
 <Z9hkDqcKG1xOmIB5@alb3rt0-ThinkPad-P15-Gen-1>
 <ef163f08-35f9-4d1d-8082-c826c6cd0aa0@linaro.org>
 <Z9hxKlrrqW4QyzdJ@alb3rt0-ThinkPad-P15-Gen-1>
 <88c66c98-7ea3-4172-9c99-405fe449cc5b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88c66c98-7ea3-4172-9c99-405fe449cc5b@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_235620_957958_D2161398 
X-CRM114-Status: GOOD (  17.36  )
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

On Mon, Mar 17, 2025 at 08:14:30PM +0100, Krzysztof Kozlowski wrote:
> On 17/03/2025 19:59, Alberto Merciai wrote:
> >>>
> >>> By default they are enabled as external modules, then until we don't
> >>
> >> So everything is as expected...
> >>
> >>> reach userland they are not loaded thus eth and all the mechanism behind
> >>> that are out.
> >>>
> >>> I'm not using initramfs just tftp and NFS as follows:
> >>
> >> All arm64 platforms are supposed to use initramfs on defconfig with
> >> necessary modules.
> > Thanks a lot, I was not aware of that.
> > Do you have any reference?
> Reference for what? initramfs?
> 
> I am using meta-qcom initramfs:
> https://github.com/krzk/yocto-qcom
> with copy_modules argument:
> 
> https://github.com/krzk/tools/blob/7c0d1cacad06aa0cae8c2983ae26889471a9aaa6/linux/build.sh#L543
> 
> And here is how I append stuff, but simple `cat` one cpio archive to
> another cpio archive would work as well, just be sure some paths are not
> symlinks (/bin /usr/bin) because then `cat` has issues:
> 
> https://github.com/krzk/tools/blob/7c0d1cacad06aa0cae8c2983ae26889471a9aaa6/linux/build.sh#L504
> 
> Best regards,
> Krzysztof
Really appreciate, Thanks a lot!

