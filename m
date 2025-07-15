Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C177C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T/BWaekXetU83aXLszdrOHzTcPZ86/9kj05RU+QM+Og=; b=AEh6uee/Wjd1Ah6ndtrmtAH8qq
	AdbT0sw4AOI96MjCSx21mQbkimiOqbGKZI7suBum4kz8p1rwKZKyz5GGKTEmwcujydOIMLISOtGLn
	zGlBGlzV7XJyMAGYlpYYBf/5FPDmdN+1FiNikp8fq+1dJNV0kkXUD9RCR2ZvydiLRXi+e6XQzErz0
	fOJCTMgon+PKcOSgc24CeWKbW9ENBo28oGzVEHbRVMfN1gTyt6BUScrL7mJuuJRk9uIuhvelktDZF
	maIly6lYglifJ0kXckPR5Yk+1gIaAPn7JiAIol+qB5K3MLFmkGlfBwYeVm6uyu4FS/sSsYcBHoovO
	PVHI02Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ublBR-000000061No-1xMX;
	Tue, 15 Jul 2025 19:19:21 +0000
Received: from mail-ej1-f46.google.com ([209.85.218.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubiIw-00000005iR4-2Jvf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 16:14:55 +0000
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ae0d7b32322so928972266b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 09:14:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752596093; x=1753200893;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/BWaekXetU83aXLszdrOHzTcPZ86/9kj05RU+QM+Og=;
        b=ic3t2t0baWXE2RNSXX4VukBKTcTBtNDic1NVhZfPS+/Ug9xo+4Zf40oyk/E5OylhKt
         +j271HRdqv0dSqbR/zwXJnQgpYHaRcj4epAylAVfscJJxIAmTNWp1IlKXuyi5MdorcC5
         TCi4Fxe0Cn3FAQnHsfxi5XttkzHg6mL6DJmQbOmgcnVMW+57ajE9YBn+ZD4Gllu0MsYq
         D/s5ffSgDPiEuQaaZ3dZDxCL/j37izSapC9WWMrmAgQA0Y+wPGQys3NegA3hykc4m/Rf
         RlRWpDq5etAhkrP99eebcatRkFmTb4ueV2BKO+MF26/LxKkp1Lc1Yz4L91CpoF3/2M0x
         nz8A==
X-Forwarded-Encrypted: i=1; AJvYcCVukUPT1zuMxzLRnd52iV54l5PhtUDz64H/jH96Cv0d36CgU+xcGBNeHGRKpOsp79tF5pkFdPSt3N5Y9u5K/yv2@lists.infradead.org
X-Gm-Message-State: AOJu0YzJtBcZYxRj6+14vWBSYzSD4m0Clis+Ye5Iz219WssxJVuelE0K
	8nSliOiqDoeV40tToToAOLGs70xsH0LCsjek0Pkwtp24EHfNfYGvx3gF
X-Gm-Gg: ASbGncu5zUhyOWqG9D25rkZVDvLDr2DNKmH27skBrJIQuDXcQ7DkOaZTfCeaha7EwIZ
	Ip0hOk7IYyoEy4jNNQMAYCL/PJ3jqNj0B+nhkOqQ65BJwF2QDKpQCHaneWQdABN2bwn+WXM184+
	f54SB6FQuZSVElg0C+W85fzg1jSZiJrDKHUMAcFVih6FCjIRlgOEhtWb49qKducYJQkFeRM7+3z
	lm7cw6mtZl+g0/7QPk/2jxnGYSjtIZLwhFfj8zLWWpzlKfY29BzDVBdwuS0liDQwLkdjCYvqbMA
	xVYJB0LpXHDVAlk0E6rRZPEYi0XRrtqsYl1wallxeZI3wfmhyKIAakGj4bE3oiwml+wJhu/4CQE
	64z1BMJydTQtl
X-Google-Smtp-Source: AGHT+IEvOc8+OszJCyE/oEuX+OBcQTQBoSLU9a3OzY1TExv2Ip6GqBTNIFxBnwqU31lZn7voNTRXjQ==
X-Received: by 2002:a17:907:7f26:b0:ade:3dc4:e67f with SMTP id a640c23a62f3a-ae9c995530amr10284866b.9.1752596092658;
        Tue, 15 Jul 2025 09:14:52 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:2::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e826651csm1026354766b.101.2025.07.15.09.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 09:14:52 -0700 (PDT)
Date: Tue, 15 Jul 2025 09:14:49 -0700
From: Breno Leitao <leitao@debian.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Sascha Bischoff <sascha.bischoff@arm.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Timothy Hayes <timothy.hayes@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Peter Maydell <peter.maydell@linaro.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pci@vger.kernel.org
Subject: Re: [PATCH v7 18/31] arm64: smp: Support non-SGIs for IPIs
Message-ID: <sy2u3iyyfqk7ynccsb4lpbkto6pmkhamnlkkhf3mmh5dr47iyf@wmygyxypb26v>
References: <20250703-gicv5-host-v7-0-12e71f1b3528@kernel.org>
 <20250703-gicv5-host-v7-18-12e71f1b3528@kernel.org>
 <7mhnql75p3l4vaeaipge6m76bw4wivskkpvzy5vx3she3wogk4@k62f5hzgx5wr>
 <aHZm8BsqV1ighJ+2@lpieralisi>
 <aHZ81Kah1Uaa184N@lpieralisi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHZ81Kah1Uaa184N@lpieralisi>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_091454_590480_57687C4B 
X-CRM114-Status: GOOD (  18.52  )
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

Hello Lorenzo,

On Tue, Jul 15, 2025 at 06:07:48PM +0200, Lorenzo Pieralisi wrote:
> On Tue, Jul 15, 2025 at 04:34:24PM +0200, Lorenzo Pieralisi wrote:
> > Thank you for reporting it.
> > 
> > Does this patch below fix it ?
> 
> FWIW it does for me. I think you are booting with pseudo-nmi enabled and

> the below is a silly thinko (mea culpa) that is causing the IPI IRQ descs not
> to be set-up correctly for NMI and the prepare_percpu_nmi() call rightly
> screams on them.

Thanks for the quick reply. I don't see that warning anymore once this
patch is applied, so, the patch fixes the warning.

Regarding NMI, you are correct, I am using `CONFIG_ARM64_PSEUDO_NMI=y`
and `irqchip.gicv3_pseudo_nmi=1`

> If you confirm I hope it can be folded into the relevant patch.

Feel free to add "Tested-by: Breno Leitao <leitao@debian.org>", if
pertinent.

Thanks for the quick fix,
--breno

