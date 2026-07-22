Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1579C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 17:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wpXWpJ/XepBYidQLS4RBKK5VuWb9g6pAC0cnJOX/glE=; b=fMnAFWmw/UvizQStfXScHbCFtM
	1Dpn3tnlksel6dk9OatVFA5V64Um8b3ItwR1Hh0Zln6BW9JsZHzmysJWfiseyyOHFGq8rcpcUfecj
	0STGIw2FrtsGABxP4zpT3bvgDX6OBsivkjch+slhI05DBYm6zc5VvHfnZGafzNUKQN6RNX+8jURym
	U1teCxlaTAJxXSfe/Y5mvrQvqM03Ca115u5RKpQvf5mQmehQP48NeWVs90g2kEPafyUAdN4M3Xfl3
	T4YyQwTTZT38F15NYJ8CXLeJOOKYTOLiERwSX2Gq5H1Ukqcpvz04mKAtpRAkJIPyodJ9yrZ2C9QPm
	PzmoIhQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmb95-0000000CWCk-06qp;
	Wed, 22 Jul 2026 17:54:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmb93-0000000CWCW-3Ont
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 17:54:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CFD8660051
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 17:54:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 863DD1F00A3D
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 17:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784742852;
	bh=wpXWpJ/XepBYidQLS4RBKK5VuWb9g6pAC0cnJOX/glE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lmzq/d/YsVm++VKdefaHPw6n8u3G+Cz3jYzE4EbEkFxM1U05Gh4ajAdRQmCCKalIF
	 LgxaehzcXUmk30Qd3yXJYvwSn3WvN+WY3FOmGhKbeBzNx6RDGcWWtbyg0qA/k+4rMB
	 hjnjGiF53DnJ0W5XS1+tANf99npYBaCX4WSqRI/noHkO6exDliymqZcGRYcOqm+gK3
	 03maHksi5kRJwOhviXwnsiyFSDHn5qBqCezyJ0mexhNDvawjJ/GAnvv7aebfBZJuqY
	 atWo2Ad3w5mCAKFOulb8yT0vRlDOLBhoO2/EnRUG2fJIqcXgNL18DOutOzZH23dVbG
	 8InXvUW+xTlVw==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6983f20a8bfso7170949a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 10:54:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrYHai6ipyE99+O8oUdIBNY5oORnkZBKI6CTa1sLBM+KeIRz+d6krFIDSp+bYSHfPA1V5Ftrsk4z4zyuoeReXhD@lists.infradead.org
X-Gm-Message-State: AOJu0YxN597Ae1WNd5Pr3eRmP6NUmaWRbSheg+H01MFaipbCZkU/S4Kg
	kKR4xiV+eYCvcXXmF6vKK8IwQxsiK44jh/Kp7vpRDSHQrUPlzdM3B0AsQlJSrAqrw0N7zT3nDmR
	5RFQNaCIp6U8Ji8YTlxl5FpsHdLP11Q==
X-Received: by 2002:a17:906:478b:b0:c1c:4e00:3fe6 with SMTP id
 a640c23a62f3a-c1c4e004923mr15833966b.4.1784742851162; Wed, 22 Jul 2026
 10:54:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260716-tegra264-pcie-v8-0-23e51589229b@nvidia.com> <20260716-tegra264-pcie-v8-2-23e51589229b@nvidia.com>
In-Reply-To: <20260716-tegra264-pcie-v8-2-23e51589229b@nvidia.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 22 Jul 2026 12:53:58 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJpSTbJoxu6CCe_1LpG3gR=Yx5VydTKufTp13LRp5za3A@mail.gmail.com>
X-Gm-Features: AUfX_myKJ3ItLjHpG8Uc2Sapy4DnBxW0AxTenwVXA8NEdz1LrUYTCptHK5c-Gr8
Message-ID: <CAL_JsqJpSTbJoxu6CCe_1LpG3gR=Yx5VydTKufTp13LRp5za3A@mail.gmail.com>
Subject: Re: [PATCH v8 2/6] dt-bindings: pci: tegra264: Switch to PCIe root
 port bindings
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Kevin Xie <kevin.xie@starfivetech.com>, 
	Aksh Garg <a-garg7@ti.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Jul 16, 2026 at 12:07=E2=80=AFPM Thierry Reding
<thierry.reding@kernel.org> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> Switch to using the PCIe root port bindings in preparation for using the
> standard WAKE# handling.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/pci/nvidia,tegra264-pcie.yaml         | 40 ++++++++++++++++=
+-----
>  1 file changed, 32 insertions(+), 8 deletions(-)

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

