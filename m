Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68341C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 03:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZxQEcAvzVs5hRAXlrlOyX5QOnKVlWvMiWvM9EPXP2kg=; b=NR/8/Gm3cF2sOBNChNLplF81Br
	kslJ8y9IR59m+nONwz6+TOCdRehqbiO/eOXR8Rs/1f77VNckOEVp24rbLXkoGBDHZRHJLQOxOcqS4
	UIC1Pu84a4kUa0e2sddt9Ebplmh97gcNcJvHl5iY284F0mYJ5z8SQ0/NLvgwWAlsTChr6aX5H0KgO
	ngbJusSlI2eGwOFhLl2NdqRv+p6+c2BkJo1NoQn2GKkXEwIjjyr6ZVKpHdujE3REGTly/OzRWUhbZ
	jSeItD9OR2BYg6/7Ixume3p4C1JXneh5bsJ6DcYxXvl4/oHTyAoxjsu9dt/T9YxOg5XZz3Kg8gdkB
	mvA6EjZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDDzn-00000002IKZ-22i0;
	Fri, 09 May 2025 03:01:55 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDDxn-00000002I7b-1qMF;
	Fri, 09 May 2025 02:59:52 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-22e09f57ed4so30568565ad.0;
        Thu, 08 May 2025 19:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746759590; x=1747364390; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZxQEcAvzVs5hRAXlrlOyX5QOnKVlWvMiWvM9EPXP2kg=;
        b=JdHsm80lPzVlP7FVXV7zHT0yqi/lpwQRtINxmaEHwziLtrpowDw85670aQo6fVxWKA
         /JoEeYZp7KvmSVvqF1SHyrNUX8UIicTC0VZ+BV19AWIAX0EFUrSyP1EpY8LCEMFGiJXP
         ZJtRNSKeP0wnZ5MVM7r6ct9mUoILfTMu7CdE0MHWX3JwYFKqNYd3hsrvEs9VJuVBP2eP
         I9NZH5GLrhaS1J+Rz0uPZNNITMI2ZSN66vl/TkBLNZ4//d6Fd6SBE9AkaEJ4bbHqGxtY
         xoVu/q2MjX81SVOmNt3/zNnfVxiOT3uGR1O7LkT7wl6YExXHHHz7ayMa6S4Pp1avqkNd
         +gJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746759590; x=1747364390;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZxQEcAvzVs5hRAXlrlOyX5QOnKVlWvMiWvM9EPXP2kg=;
        b=QRcSeNm0dMb3a4VD0eRHaBGX9kWL+84GDufzxIO4ixV648vE57XL4wKOMncLKkqjG6
         CroGAvXMVoizmwUA+k6woxVrdcDk4tBK4xDxTbzy5JQyGMaDOZZ1sUwuehELWq8INu31
         EiA5EiyfZYiKWrRG3zssUwnPhSodnkaZVdrBEUrZKylyvz5B5CS2z6NFIH72HguFeZUM
         Q5jCKf+Lh8NkOoSCqlIT/a4i/cjMZmCFb5p2RmGYPivXu4dBe8PZE5ZjQcXIKNQFCbet
         VtdzursUNCY4h2ZmkvIPAsbecXk5XCfGeMGE7A1pPUV6GwnDBttrC6xYB67gpXLPI7x+
         atFQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2XhmP6tq5soXfMF3TcnGAAfHAM3r182eHNshs47Otsxvr/3wfn7Jq+JjTpjoIVXCQxCiUEbmeKpPzRZ2mloGm@lists.infradead.org, AJvYcCWEGo9CC9YSetpzD+LCMHs3mieloieH/wHLhQ68o3VVwYJZbgi1ELeGnbbgppk79WytFvIWst68fX/zKt0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzwrLN4WsIthI9X/5PD/xc+y1BWq6PHzink0bA6xFTDdFsdL3qi
	Sp9sgSoLRmUe9Rxt286I0cNsrxaRyqzO9YfRjz+At+vpfSo0MzEF
X-Gm-Gg: ASbGnctmnfGcc69zhPK7KIIdaJAghP7eH3TUqiobjBFLd9Sl3spgWSKij0d9cDwmRVC
	2LOlHbVURFx7Q2slEurFe3H2178t/Ln+7/mEdszNjVc5R5Sh/lv67O37f4y/XbMv/Kwx0wJdjjy
	tqWyp1fM3k0ryl7RtBkKjnpiGkL9revxNtEEQajUeHjvrBgvHYpmmiYYfgR8bbTIOrYN5Wb3Ljz
	Ds06NEZs0WFyWdvbgCS5gv8oGjfxIOyZCt+vwMd8bVDAXQnuJ9AFmoZRKu98qCKqgfD1pzKbflQ
	USTcuLjwBkDml5figT2n+7pOLlvRRQLlU1fvYUUPQriox3FtoQaZ8fA=
X-Google-Smtp-Source: AGHT+IFKUhpmwc9Rxvi6M/bPhs3f04cu9R3C2Hy466xXe6CJzKmuEEz15S5GyyqX36uHXpmQGFCOwA==
X-Received: by 2002:a17:903:3d06:b0:216:4676:dfb5 with SMTP id d9443c01a7336-22fc93dc352mr25153235ad.21.1746759590482;
        Thu, 08 May 2025 19:59:50 -0700 (PDT)
Received: from [192.168.0.69] ([159.196.5.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc828b216sm6976305ad.168.2025.05.08.19.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 19:59:49 -0700 (PDT)
Message-ID: <ad737e02dd4b7958ecac1d67ac2f3da7a238d012.camel@gmail.com>
Subject: Re: [PATCH v4 2/5] PCI/ERR: Add support for resetting the slots in
 a platform specific way
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
Date: Fri, 09 May 2025 12:59:40 +1000
In-Reply-To: <20250508-pcie-reset-slot-v4-2-7050093e2b50@linaro.org>
References: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
	 <20250508-pcie-reset-slot-v4-2-7050093e2b50@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_195951_480361_81ED46FD 
X-CRM114-Status: GOOD (  11.21  )
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
> Some host bridge devices require resetting the slots in a platform
> specific
> way to recover them from error conditions such as Fatal AER errors,
> Link
> Down etc... So introduce pci_host_bridge::reset_slot callback and
> call it
> from pcibios_reset_secondary_bus() if available.
>=20
> The 'reset_slot' callback is responsible for resetting the given slot
> referenced by the 'pci_dev' pointer in a platform specific way and
> bring it
> back to the working state if possible. If any error occurs during the
> slot
> reset operation, relevant errno should be returned.
>=20
> Signed-off-by: Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org>
>=20
Hey Manivannan,

I've been testing this by adding support for the reset_slot() callback
in the dw-rockchip driver. Which has now fixed issues with sysfs issued
bus resets to endpoints. So feel free to use:

Tested-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Regards,
Wilfred


