Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77815C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 03:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4t2Ei0gDk5QvwRDY4Z4sHn1iXc6O7O7DItvDoocJa0w=; b=E0KGl9gYX1nBHxK/rfrwWm1ooI
	WfJdBF4AoQpbHBKUzGuQYjgN4l4fHuNMJznVKUbfwZQY7dEI0Ej3BP4OmvmD3luVdbZezMPibTkh4
	w1J1QSfsvpyWdvD74R1zPV8R+RRZB/hUOhdYVVMP8DgoJG09//Tzh9DW4s91huwG/JBBmwvi+HEk8
	0KnJ0SRa39vMiU6cnP4eDi3xoM0gSoQ7WlNYc+dzfw4uhqvHuMjIHlXrmMRYmUPbzmHJCZ+gri0A4
	eBMaznuRsb1vSfW/RhweUUEvOOlkvc2Zwem12sYdEwZwyT1ur9x1vO9eSpMFLYCLavocCXKRepuej
	kngAikpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDEoU-00000002PMJ-1KeS;
	Fri, 09 May 2025 03:54:18 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDE2o-00000002JCq-0Sjf;
	Fri, 09 May 2025 03:05:03 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7396f13b750so1898967b3a.1;
        Thu, 08 May 2025 20:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746759901; x=1747364701; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4t2Ei0gDk5QvwRDY4Z4sHn1iXc6O7O7DItvDoocJa0w=;
        b=VQhUPG9TQ9jnl7id/vRKq/vFgj8OJx5b616I2jOH9jIw6OQVVB+5AuALH5t+VK2WVc
         wSs2dioTAuOT2hDMPI0rq8QzMNVZlQILvmoyj92FfKxz9o87HeypkjOK5+pzSmBMYHXm
         RAfdlG2YV+3QeIi6TbfglM1qEF6lusMxQiDkDf21xP6bJeTfr2riA1Zk9ONI38ZcxOgb
         pGPdEV8O4HVPWiINCZpsCMat+pBbFWsFFT0e3RIprkAofL/NGTBd2SaidmonIrum5mQP
         dsfH7HnVBqX4GblRHQoPvDUNvebdpx5Mw/UfQ/Y1BY0l5Sa2gUoG0LXv6JrOSA4I4vxn
         +Qxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746759901; x=1747364701;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4t2Ei0gDk5QvwRDY4Z4sHn1iXc6O7O7DItvDoocJa0w=;
        b=JzzzB+QLRaZz8YZFlirRgqKGQyvYgqELRcsmIG3lqw3oXU0taRPIGeIHoYmSQPLV11
         +ee3ypAqRwroyGpprLuV3xGuEyIfawA0Q/j65W2J5yg2nkqckziz7EsMv6YrLblcboJX
         fCIDn7LIyqeljTokoEMRDCW5IveNcmbV/aoDIZgrJQtPZkoQmjs7sWnRF+pweFWDSHjF
         Gmyx/o1p1s9/8qu2O1/YaD8Mvli4Phdm7uuK1XKhNZk2jgDnMoJCyott8nOQJU4Hnyf7
         bUvsEqhHNUNJt9TtgP4Cw+zfU3lleXeZnFK/e/2SEZCpOzyd96vEnyGmJVs4pv7XR5zp
         5rcw==
X-Forwarded-Encrypted: i=1; AJvYcCW1+Vb8cc97g+lkOszrLDQ0WE8JziK/bPy6wFIhzbpEtGItrDkOffePGqr9Wp+YTmWwz6WkdSgAA4MR6eLDEJLr@lists.infradead.org, AJvYcCX/8N6TKPE4TfdUgGU4I2PS6mHkn5ROkAGQ+xs2BVclfdLilW1WV0hQmEUHfyNJGe6b1cJFP5glX6XFbow=@lists.infradead.org
X-Gm-Message-State: AOJu0YxLAe3vfzgbPbYE8/zqS8JbBOtXmOWSzS8WF6EhIIw7vJzcRPs1
	gg5de1JUlzOP/1KyHsGw0cxfy7l7aF+2dUXex9cZfeNhUe4BUApXxWnXuNJd
X-Gm-Gg: ASbGncsVL400Zn5iNQUi2MOaI/nPCfoSkJQOUJ/nxK9qTQQ8RUVBhHssl3yik2km8v+
	h+HZ4T4n7lZ2cKQYQd0Vb5wQ6VKuTgF4fO3Qdyo2e84/UEVr2bvBJoQM7U2weScwQEi14MkA3ip
	Nrfujzep5zCWzbDloR6PmzLTjvkU8SfnHw5JmeiS4QSoQ0/rAWv9CHLxVp9JpZYkJjj/nwBEPD6
	qWPX1U9Y/wDHkDSzwTL5VOizksakwAtMoeWKcSEBu/6ZLaPtwbOUyTs0qTl02VJNfR8I7/kK4u5
	hSv1XhilZVPLMZ+0QQ8BLxEfc2yJchBhIIc9NHcFS4cWwMX953qmUhA=
X-Google-Smtp-Source: AGHT+IEwAifDsncJZmqJw68TT82q/qBue7rdP4C6uwfIpHf3Dur7C2E/ejrTbFWgc33C/qpZMOKFqQ==
X-Received: by 2002:a05:6a21:670d:b0:1f5:889c:3cbd with SMTP id adf61e73a8af0-215abc75623mr2418406637.35.1746759901018;
        Thu, 08 May 2025 20:05:01 -0700 (PDT)
Received: from [192.168.0.69] ([159.196.5.243])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a0f141sm775938b3a.117.2025.05.08.20.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 20:05:00 -0700 (PDT)
Message-ID: <09c558f2128c5f8ca1d4e51b0ba04646170d2de1.camel@gmail.com>
Subject: Re: [PATCH v4 1/5] PCI/ERR: Remove misleading TODO regarding kernel
 panic
From: Wilfred Mallawa <wilfred.opensource@gmail.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Mahesh J
 Salgaonkar <mahesh@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 Bjorn Helgaas	 <bhelgaas@google.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?=	
 <kw@linux.com>, Rob Herring <robh@kernel.org>, Zhou Wang
 <wangzhou1@hisilicon.com>,  Will Deacon <will@kernel.org>, Robert Richter
 <rric@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,  Marc Zyngier
 <maz@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	 <daire.mcnamara@microchip.com>
Cc: dingwei@marvell.com, cassel@kernel.org, Lukas Wunner <lukas@wunner.de>, 
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
Date: Fri, 09 May 2025 13:04:50 +1000
In-Reply-To: <20250508-pcie-reset-slot-v4-1-7050093e2b50@linaro.org>
References: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
	 <20250508-pcie-reset-slot-v4-1-7050093e2b50@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_200502_147874_23D0763E 
X-CRM114-Status: UNSURE (   6.98  )
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

On Thu, 2025-05-08 at 12:40 +0530, Manivannan Sadhasivam wrote:
> A PCI device is just another peripheral in a system. So failure to
> recover it, must not result in a kernel panic. So remove the TODO
> which
> is quite misleading.
>=20
> Signed-off-by: Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>

