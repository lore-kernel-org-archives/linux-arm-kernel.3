Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C03C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 12:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MHytYTBz8Jqox6VQpT16hfvjWmYP5f5ufAlb0eIhBvs=; b=QFVuqDEpgB3jTelIqyZw5jb6bK
	2uJb/ewyxWfiimoTULKgii6Wow/N2IBZN6M84U0Uj9H1hjQ25sIF8v4J1Eju3/Qrs6xJNwuw8Ja4c
	/hpYbHqN6wqRu+f91Q7Tkb1+KJIsbqnnheCpapPxItRQE5/3rABCexyHnKSRCmcQRPrTZM6OyfyrU
	PTN2WnicPGaFX8S5BYaCrHZ+cY/PGv8OGRtOaXNmw9V1E3yBeud/lYTjDaovVHm7N3PQU7DcnEkj0
	23QEJ9Jqe/q40rLZoqEAPxy4KNqGERUZyK7sMjK8eljoEyEZIJAzu0xs5UWB2osu2HS9Wzve2Lrp8
	teBbxEeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN9vl-0000000FV78-3SEQ;
	Thu, 05 Jun 2025 12:42:49 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN9jT-0000000FTsY-0xCJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 12:30:08 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-4a58f79d6e9so8772201cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 05:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1749126605; x=1749731405; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MHytYTBz8Jqox6VQpT16hfvjWmYP5f5ufAlb0eIhBvs=;
        b=K05BOL6aoyxh9bEzSmTM5Q2pomeewBavpHGxuS5WrCHkRIBNrR7CKjz7ayEY+rnx19
         gaNjg3rAeLaaaXc/T5H7c9lTiLTGDjaPC1ezOso0+6OITL/435+WIoQM9MfOHtZw8wR4
         kSon4RzguMCdMCr1mySX6eWhnZ6tY8V9fntyPFkwVTHAfvPFwT0xK1QLSPECDGLLoP4w
         1bRRmjwGGOwmGkgaSNyUUvKOla8eTSNlhIOBPQqraeXrKxJ0BGjBpDdI0NUQ1ab3yBUf
         L/so/0or5zdnRnIrrniZOjxgvuUmdcymtSl2F5Dl2BDAUlcQcpCEYPTkSOe/Xp3LnO7v
         fnoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749126605; x=1749731405;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MHytYTBz8Jqox6VQpT16hfvjWmYP5f5ufAlb0eIhBvs=;
        b=t5zVeAS7QVWHUfnRzw+G6kYV8zMDTvCzWs7su0k3le0HmvCVyixipQ1sBonKyu7OEu
         MhnJAaq6/LByjSrO0nllEBRlPWiMd2KbN+jUP0AzV/0ark7ncqkLLB9vANmC75itzJ9l
         Gjf+tWQGPBa/dZSvYBLaJyn0Z1yYjAbIaLj7d+TEFsq+ufwnMFTxr8f5Y3Mqe2eMSE1B
         tXv4NN+Yfps0kogX4ki2pm5iJL+wR48kII6dPyICvjhC81+Rttd+o9uKzZEDiLKEfHDn
         WqJJgU0uMrVq3aCUvgs+kffDOjte1UMpc6dHJaomvBc/lTLVOtcOUYnC/vJTR0Xk2rHf
         N9bw==
X-Forwarded-Encrypted: i=1; AJvYcCWSxRbAnoyzl+lQ/8XP/fG5gWxJDeHph7iuycVX5pEuWvSuhliL4r3mF7Z+u7ojA+pcGVpokFY94Ud3ki3Lx/7Z@lists.infradead.org
X-Gm-Message-State: AOJu0YyuHB+7ui4y6XUIhBzNxIdq2JFAS5a57svLGE1gZZ6Et0u+6WMq
	25ANgKLqXACgiVi2KEd/5uI95lIodja/nzf3+eGQ08zotrJ52lrNPMMPaxFMa5wCPm/tMDVymDy
	YhVIJqQrwZV4QfzZwSRlTcOsdy8ZXDLd8FlqGWLr6gg==
X-Gm-Gg: ASbGnctGqab1JEbCRcukocvE/QCazR/AJtG/14K6sGh5GpbueWzmjbQJ5cbv8+6rQie
	TGM8aMF/2V+MJepg8s6FAH8YHG4gpTtxRHMDqYuYvSktuxdpYTEvVMV1ytacnZqxRVaCAmuuBTV
	fg/Y4R/wAp1NzOL8OcXim/BcVVFiLg704=
X-Google-Smtp-Source: AGHT+IGJAH4AP5XYgqu4Dz9W2BoN5h6LEeBf/9Q8A7vKd11Zim4MAapYM0SxBDOcqHNIkaF48u81Kw+0gnFTHvWWddM=
X-Received: by 2002:a05:622a:4010:b0:4a5:a5df:a95d with SMTP id
 d75a77b69052e-4a5a685bf82mr117127441cf.4.1749126605571; Thu, 05 Jun 2025
 05:30:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
 <20250604-6-10-rocket-v6-6-237ac75ddb5e@tomeuvizoso.net> <CAPj87rPv7Pd5tbXhpRLaUJCGB8JmD4kfF50WRsEiST2gvtg3Bg@mail.gmail.com>
 <cc21a090-801d-4b32-bac2-01cebf896c85@arm.com> <CAAObsKDMhuqYtn=+xR6-n=Uk+5_rU91OqVKyQ5cxhqfTo5svjg@mail.gmail.com>
In-Reply-To: <CAAObsKDMhuqYtn=+xR6-n=Uk+5_rU91OqVKyQ5cxhqfTo5svjg@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Jun 2025 13:29:54 +0100
X-Gm-Features: AX0GCFvvNcCeZ1g6JOrd8mRl54fhnHPJ-VauKDXwMUlQ5VUcNOU5PCV9zv8SWHk
Message-ID: <CAPj87rOKGcufM0xB+uMCxhs0SdXCHpViyTd+jQ0+=B1kSihvVw@mail.gmail.com>
Subject: Re: [PATCH v6 06/10] accel/rocket: Add IOCTL for BO creation
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Kever Yang <kever.yang@rock-chips.com>, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_053007_418040_B5ADAE1F 
X-CRM114-Status: GOOD (  12.91  )
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

Hey,

On Thu, 5 Jun 2025 at 08:41, Tomeu Vizoso <tomeu@tomeuvizoso.net> wrote:
> > Indeed if you're using the IOMMU API directly then you need to do your
> > own address space management either way, so matching bits of process VA
> > space is pretty simple to put on the table.
>
> My impression was that the VM_BIND facility is intended for SVM as in
> OpenCL and maybe Vulkan?
>
> Guess my question is, what would such an accelerator driver win by
> letting userspace manage the address space?

I mean, not a lot gained, but otoh there's also not much to be gained
by using the kernel's range allocator either, and it saves userspace a
roundtrip to discover the VA for a BO it just created/mapped?

Cheers,
Daniel

