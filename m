Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA946CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 17:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UVFA7b5QNQKKgbY4Sgbk0fAZQJ8jQ8t0W8uUVANJyQ0=; b=Jk4o4EucOPuApIBFWoqHTeii8Z
	y9sWzJKXQhjjzYgNTgrvEXSY3rc0SE/Y3+5ldFFkRK0GSfHzsJD29zUemE5vwg4zFHoYCssLZyRJP
	dWUZoJ0xUGtqE3ScovjCDJJep4Qsg173s8RsrgorlwkAJacts1280CBN9gNB7ad5dEf+Hq9oISmIx
	SoAoGFOSTo2VeR7zlxMs4v4pEVvGFgz+HYJRMvScVH+BdiAaEx8DNoKmoSMdcSWVlxosyAnLYU13l
	OqzWOlDsk8MQUlLNk1j5RlpPL42HLyhkPLNVZzHebXd9nA7kDtQkDMiCLxi7lr/TLB98gXHTH2ekv
	RLuHpxtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH3sE-0000000G24d-0yLd;
	Thu, 06 Nov 2025 17:34:14 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH3sC-0000000G24C-0MQV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 17:34:13 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-64034284521so1953660a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 09:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762450450; x=1763055250; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UVFA7b5QNQKKgbY4Sgbk0fAZQJ8jQ8t0W8uUVANJyQ0=;
        b=U18JmAI5lNwjN3vcI7QDghnHc90dJW2UUM0IrRVSgx6Ko5upmf8MR1r369JFFfucgp
         3Lc7g9bQKVeM5m6N4XwzLhEPTTpGMWmWUE/hKFWdLTy9ikV2LWPykZQYmjJLe+/ShZ/Q
         03OsRqtmtefDD6Hs/mSKzNuAe3CFwfh32sdkSIF5Bh44Nz09WE0PagR0ATtHsKv96lOT
         bJ/mRyYTHZVeeU9jaBOxLqs9ZHxsO4Mano1xidByV76BAam4la+geq5JBAFZBG2CPL6M
         eF2dHChr66ha74DhQ2DmYpLagFVMhUvQnbnHjs614E1r8wtNEXGjcHFf8MQ1vhXBY1wJ
         Bkmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762450450; x=1763055250;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UVFA7b5QNQKKgbY4Sgbk0fAZQJ8jQ8t0W8uUVANJyQ0=;
        b=oH31jvjpmon054PNPrlNZtJT2T1ZMEGP8nPQI1RVx8P0uEAue/qdw/KO62dP5k465D
         keWHKT/URhMi0GvWzC4RAPbIe7iENf1QWg+z7WoT8hUBbLNE72NZFodXbqR0cQBwHBbg
         T3B1HQo25Ieoxa98Q/NLf+Q5G6TP8AKPsWuENRC2dYmddcflAfS/pJHXmBFBnJ22kULx
         p303D/+HBhyG2aJ9XZVERVzIb4NYU53e9sfoELGyEfsjQgWm4DGtNWVDGbhuDRUx6lGt
         fkfIiJvevp9nRPOTl57DkcTYo7GM64YbsF4Bn+/46zpQwDv8P0hmVtccJUb0z+9wa99d
         huAg==
X-Forwarded-Encrypted: i=1; AJvYcCVjigk59F4upuWTK+ATbA/Lu1+WrlonCI3rPrUqjNvwpN0+hxw5Wuha4iY37okxHIRZIeIkZPjQzzKrDGdhfO24@lists.infradead.org
X-Gm-Message-State: AOJu0YzH7hK40P+Nfh3RlkCzz8AB07WcRgfPREQRfIubv/euwrmNVMzC
	b9AhHKoOBfX1AkNDee60RwH5KRAcD91xcWDA0HshSIdoxMI4OHoElgIoLouzPVfj3dyfkhRXj+t
	uFGi+BYFyGiR15SEUTTj0r+fePYAP2cux+amd8PmRLw==
X-Gm-Gg: ASbGnctzWqGmnwLOaRUkAQgJGb4Qlsr4W9tXd005Y7FmzvvlZrwp/WdyGA5B8i1pdO7
	W2dzx/nv5+5ZKGZFnZnYbtdkCAUlssKwIcA/Ypr3e1XBB5+HBMTCNAe+nuv18zU1CgMQSAP2i8i
	tkD2uMPc4Ha5qiVHzcw2lBTK8EjOdPhshVxcA4AIBnJp5G5w5udzkE48YaWkLEN4s9ffXeUXx8c
	q1mhxAlZFJfYha/yjWUadgI6Efe9tsbLVLkGUlIhx+iwh/MJLMvFSLHx0O38w==
X-Google-Smtp-Source: AGHT+IHa3dttDqTITgV3tGTkp6TSuSmsFY+1K88280Yqh8YjVvfMj6OJH0DKtk3h1bhQap8rFtBGhpjoLqExb/O6Ijo=
X-Received: by 2002:a05:6402:35c3:b0:641:3090:cba3 with SMTP id
 4fb4d7f45d1cf-6413f094b4amr145941a12.37.1762450450078; Thu, 06 Nov 2025
 09:34:10 -0800 (PST)
MIME-Version: 1.0
References: <20251022174309.1180931-4-vincent.guittot@linaro.org> <20251106172312.GA1931285@bhelgaas>
In-Reply-To: <20251106172312.GA1931285@bhelgaas>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 6 Nov 2025 18:33:58 +0100
X-Gm-Features: AWmQ_bnxeRp9L3wzoigXubjMbIkUdPeZ-SXfzJV0HZAKsvwmODUh-S8pANI5ZcY
Message-ID: <CAKfTPtDn8r-YfgspLscd=4oE0GukFg6tORpsUqd7fUs7DJqnLA@mail.gmail.com>
Subject: Re: [PATCH 3/4 v3] PCI: s32g: Add initial PCIe support (RC)
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: chester62515@gmail.com, mbrugger@suse.com, ghennadi.procopciuc@oss.nxp.com, 
	s32@nxp.com, bhelgaas@google.com, jingoohan1@gmail.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com, 
	Ghennadi.Procopciuc@nxp.com, ciprianmarian.costea@nxp.com, 
	bogdan.hamciuc@nxp.com, Frank.li@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	cassel@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_093412_144526_A0554FE6 
X-CRM114-Status: GOOD (  13.69  )
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

On Thu, 6 Nov 2025 at 18:23, Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Wed, Oct 22, 2025 at 07:43:08PM +0200, Vincent Guittot wrote:
> > Add initial support of the PCIe controller for S32G Soc family. Only
> > host mode is supported.
>
> > +config PCIE_NXP_S32G
> > +     tristate "NXP S32G PCIe controller (host mode)"
> > +     depends on ARCH_S32 || COMPILE_TEST
> > +     select PCIE_DW_HOST
> > +     help
> > +       Enable support for the PCIe controller in NXP S32G based boards to
> > +       work in Host mode. The controller is based on DesignWare IP and
> > +       can work either as RC or EP. In order to enable host-specific
> > +       features PCIE_S32G must be selected.
>
> Did you mean PCIE_NXP_S32G here?
>
> PCIE_S32G itself doesn't appear in this series.

Yes I failed to rename this one.

