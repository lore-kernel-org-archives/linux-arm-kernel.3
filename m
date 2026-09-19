Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E60C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 07:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UGhfY29435ZdNQDSOmq5JQmZERPFQeG+eHwDnrvLMxQ=; b=nr2YsNHliKoZU2fN8+r6/TBC11
	aupeyPUOWZFeU2jru2gO79O++zqhepTUgBG5moVLDRUjZ5D7kmW06O63tQXYLodc04w2O94esQ1fD
	ZeACiob3qi/vFEjBEIkeA4uX2hKfrBGP6CGTniNVwrOHFuQjOwSbTBbg+9VZYTRJs/+PW+/c3LTby
	80DuS1F9kDJmEWxubVskQg6cXGHXEgvL9+QpHvwCjZ1umKge8yQcnZsfyku5sxicvhzYIZd8Z7xNK
	ac1sGf2nPBGQGaXsSP3EyKy4DB09MmAfzhhYMRvNKQwvwUI8szn6IkrF84jZdmKmFBizEQSASjvr4
	SaoX23hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7onU-0000000FzMB-0XJ5;
	Sat, 19 Sep 2026 06:43:40 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7onS-0000000FzLq-1AgE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 06:43:39 +0000
Received: by mail-pz2-x10.google.com with SMTP id d2e1a72fcca58-86212a185dcso1712913b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 23:43:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789800217; cv=none;
        d=google.com; s=arc-20260327;
        b=Yxd71OvKfLSql3S+GCcj6dYIja+9K0K5KIrhHD8NEqBVKsJ4QllzFdejC48q4+GWJm
         +r5U78RMr1QequNlGv3xboughJzmiiUmTN4C8IFbCnLJPgGvddcH7MIGYxpWU/DfAv7k
         CYDoTrVpTLpjPU31sBxp6/WXLpDsx2XwXKZKLGTn8B+bc1TkgsmgUCyeaXN/aFVhyFyo
         +xDuEhR89g88zBElbegslHjD2XxqPreu+bLEUI51drfbDs/KXnccBPdTS81gSIJBegGd
         hlGXv+vFUrPW3w42zoTguh9GL/dZLqe2eoZAHDlYl9Slw5mhz9Zgzpg8s+oRNJyMqdKd
         pCBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UGhfY29435ZdNQDSOmq5JQmZERPFQeG+eHwDnrvLMxQ=;
        fh=LJ/+LLmSxBw3GbJl8afCg3W28X2pU8UIoVdmIOc6ocM=;
        b=rmTwPsZZt8lYTA3StsmWCz21PTsA7qsU7+wLHpIs2yADRx8Kc1nvrAb29OhEIi4dHg
         THiXefzsLCE2houmVRVN169alGV0vFf+8I6cBcLaEk2jsjm7LJtsZkty59z3Fch3w6EL
         MrkpDb8UiqHbRmoqjnD54sM+GFfQtd1Be0hkrZMn8x5JGWSP096/xIdiVGEUHdispjKm
         3ROdNZWhRr58+OUFOdVtbSiQLiN9JvK1v5TRX3O5PcQCkRAMOxQczDVCe+I9VSScasBm
         C3tzVjRApgfClbx6Ni4exeqX/P32OJl+R2B2bhFK07cM+OvajyTWSP0/1vSGUl4RMQED
         mhig==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789800217; x=1790405017; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UGhfY29435ZdNQDSOmq5JQmZERPFQeG+eHwDnrvLMxQ=;
        b=HW9wWGP+B6GSjWlrc3+rgjFSwUddT0/B0n4gh26W3tdetedkoe5PFkmO0KhN7+QNDj
         nsA2HWvZlJ7zQrhR3vvk0LxDEDHslM/2wrnMD7I0vWhhSuPGc3OPD7fUpg1JnxMbkaOW
         jp52H3C2Y5537gdLYviwhMoKodft4OUqKxYoju8Q2+3M3vr/ZUQ8PZ7l5Dr6Adm0tyXM
         Aaot/jR9pYvI+nr4A8m81gIciOJLhdAinaxQQ4nP95EEUt28DtqhsSRK7lbNnZpC2m1k
         HLpxqGt0zO8SvG754dVxgaMUqbcmJXQhlhu7y1D+WKcanpQmwG3TzG4zeoP6dz9aKwUI
         5G3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789800217; x=1790405017;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UGhfY29435ZdNQDSOmq5JQmZERPFQeG+eHwDnrvLMxQ=;
        b=QaplDkvxfHcw9J/vMThZA5tERTWgUCLKjkgwlakT1UkJcDY3FexCJl7SkAk4YiOu0G
         wUxu6wObqxE4OijRREyra//5LNmkR7sE6+2usi7gA6jtsQ7hqoYB3FDLHKIRPw5U3gUk
         y9umysAFyLfxyrTDI8nLlEQdiWll7N0UWunNwq1MWwdTQQ5e28zZxJ2Do/RRwRSd75Xt
         r2SHWAvzN+yGNPJQtyp6PXUfugncv/+8d8mFcrkHPKFj/1ynGt6FzED9epa6myOwyl44
         CPS+QugrEKKIZsYowZcAlA2MG78dsK7cE5maKabWJoOXDADf0u6m+gxnnz1HyI4AGT9Z
         a5Cw==
X-Forwarded-Encrypted: i=1; AKwUvBwy3OG4ezguHvQ0i9gxS4lxsHhUa6BJRZSlpv9LJ0ks3Ok5RkcRev8Ue+Ek4pVeEGxNjPACDP9dJ488lhypyFcn@lists.infradead.org
X-Gm-Message-State: AFuF++nfcmKfyZgPd8nGJJcuWAs/sPyz1d4Ub6rSmklBll9ZO/7yNcrG
	gt5ulOr1N6aY38X7rrD30UqWS2SZ5o99vxp9eXWXpsIkpmbL+LhvDthA4eNPIwquj7Iaz8i9Hy3
	I7a/YdAFywQexdLaEefwI1Nf0vZSpplk=
X-Gm-Gg: AYBFou3TyHKFLBB6ZlpvM9EVUFVkZWae1W3Rpue4Pydnm3ZumKRiuLQU9K+m3Fr84vf
	zXQ9iNqdBOrjrsW23C5BJp+sut1bhkVK+P46JJV0XKK5467Flk7MSVL6AnXt0Bg0Sxf5OEoRwDn
	AusXqRJ2KlyiCkxE+LDwlGIfkSoTBPUiPpHqtzSVG9PumsXdikiG1Mpc8QxUUXzxwodfHXokD6B
	IKFWhdIpY+lGpmv95EGuT+4g4XKwSaz15N0qsVjFF89q2xyiIyKgQLR9//WfAvtUtDzXpuKvZ4e
	QhxJrJXEuwy5coTHWYxCox44Wi1uKcJl3za6/ezklsFDLfTGAn8f/DUQ5l6WqLwXO3C9neDbCdS
	80FobTYzA/micQlG11F/AK6EahoB2Y+Clt9g=
X-Received: by 2002:a05:6a00:2e84:b0:878:3783:8a88 with SMTP id
 d2e1a72fcca58-87837839369mr597351b3a.52.1789800216631; Fri, 18 Sep 2026
 23:43:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260917183602.GA1036092@bhelgaas> <7c2a8582-280e-471a-b4b0-037b2cda6ad8@app.fastmail.com>
 <CAAsRjRnV-RTddO6h2XCUz2N5pB0pS8i_-_2XRcD=WOTA7AAFZQ@mail.gmail.com>
 <dc370463-125e-48d2-af6b-c3b4783f57ea@app.fastmail.com> <CAAsRjR=sHgZMgXuTid+D7Vst=N_GBUZUrduZ4YZax5rbotHNMg@mail.gmail.com>
 <95e4b5ed-2f72-4bfe-85d8-9cd7b45a5fa7@app.fastmail.com>
In-Reply-To: <95e4b5ed-2f72-4bfe-85d8-9cd7b45a5fa7@app.fastmail.com>
From: Semih Baskan <strst.gs@gmail.com>
Date: Sat, 19 Sep 2026 09:43:25 +0300
X-Gm-Features: AcwNN1U_0lkg8y2XnHbhWP-8wPtV3LWjYNH5bn8KemEcXAz8Qk2UF5fs0iHq3zA
Message-ID: <CAAsRjRn=Kmft8-wBk5xYdSet2hSF094+f1WLDwRsbFpy5YB3Vg@mail.gmail.com>
Subject: Re: [PATCH] PCI: iproc: Use pci_alloc_host_bridge() on BCMA
To: Arnd Bergmann <arnd@arndb.de>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, bhelgaas@google.com, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Rosen Penev <rosenp@gmail.com>, rani.hod@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_234338_320726_C5A2677A 
X-CRM114-Status: GOOD (  18.86  )
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

On Fri, Sep 18, 2026 at 07:46:42PM +0200, Arnd Bergmann wrote:
> Ah, interesting. So if the problem with the platform driver
> is that the outbound windows are mismatched between the register
> settings and the ranges property, wouldn't it make sense to always
> set "brcm,pcie-ob" for boards that are known to have more than
> one possible setting in their firmware?
> That way I would hope the platform driver can just work in the cases
> that currently fail.

On the RT-N18U the window is not what the board fails on. The device is
on the first controller, where ranges and the EROM agree (0x08000000 on
both revisions), and the board still does not come up with
pcie-iproc-platform on it. Clearing has_apb_err_disable for
IPROC_PCIE_PAXB, one line, so the driver never touches APB_ERR_EN
(0xf40), makes the same platform-only kernel boot and enumerate the
BCM4360. The flag is set for that type whether or not "brcm,pcie-ob" is
present, and with the property the driver would program OARR in
iproc_pcie_setup() before the enumeration that touches APB_ERR_EN.

The base follows the core revision rather than the firmware. On
revision 0x01 the EROM window of the second and third controller is
0x40000000 and 0x48000000, and Broadcom's driver picks its OMAP/OARR
values by core revision the same way. With "brcm,pcie-ob" the
platform driver would write the ranges value into OARR, which in
bcm-ns.dtsi is the revision 0x07 one for every SoC. Whether a
revision 0x01 core decodes 0x20000000 once OARR says so I have not
tried. In the tree only ns2.dtsi sets the property.

Best regards,
Semih

