Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD533CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 08:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ELiAnLN1MRJWb3uMjFWvYgUHlwb/yPvFPMqP6pYWVMw=; b=qdtqkKycywkN1JqR8/QEfRCpPe
	a0kPJ9CN8DF1LI3xmh2/w5jkbMLzmMe5WTlNEpJjPZRpb6WxPX6qcXy6GYRt8ie9+uTFh4RTG+rKn
	JVsk8mVf3Yh6Uzz6POFDcUWWM5MTLgbTKS3LQ/ZEMtuidJJeNWQd9XhV+3WM6m0XzPX32FUrpnmsM
	DJJyNPw7rBvV0LdxjmOBc4PkYzeSBILXYMDLZKjllrDv6Y8prJM77VHrsjHtqZCXKh8z3sPG8MeQU
	/BxQY/D1M0y1+uv7hNrKVRMKPszt1s2QMzOUgKYUoWoDFmJbQHyXPK+OgUlMPqwlNZneHdQrq9NMG
	dNGIqetA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGvNt-0000000F4K2-41HY;
	Thu, 06 Nov 2025 08:30:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGvNq-0000000F4J7-2S1l;
	Thu, 06 Nov 2025 08:30:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3202543F24;
	Thu,  6 Nov 2025 08:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83E05C4CEFB;
	Thu,  6 Nov 2025 08:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762417818;
	bh=Ftrv5VuX0KTJ6Y75vcl+0ke3OVFcYfWC+jWlBD5cdk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YkrFpF8RzslCd2MrwxHGpTvWokWV3g8YYoCwZcjZgf0kS6PJhA+2eHZdbxcAPFJH/
	 E/DZ0Icl49dYFQYzMEyEK+XdS/2IBasr2V+HWN3M6V15PU/+ljUwZ9r4ripGhRVPnW
	 ysDXPiepUiHXtAMlNJ0uX3ubKVaeI/c2mPSPgVvdPMSZXEyQjqUNxSSZIXMOBnraQR
	 OGX5zkycAUa1moTk5DdfuXxqfkKcHNCpMZ97Av2qQYfEbMi/yx0I4o3y4JtlvelqOQ
	 rjzt5sYuuLN/+y7HP6FWK8GWZUt1ROoWu7KQPX9ghGqS6gNy19Bbg2ZUl0VJfLlVHO
	 Y0YJGREKbvcYg==
Date: Thu, 6 Nov 2025 09:30:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Hanjie Lin <hanjie.lin@amlogic.com>, 
	Yue Wang <yue.wang@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Andrew Murray <amurray@thegoodpenguin.co.uk>, Jingoo Han <jingoohan1@gmail.com>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH RESEND 1/3] dt-bindings: PCI: amlogic: Fix the register
 name of the DBI region
Message-ID: <20251106-positive-attractive-tiger-ec9c1c@kuoka>
References: <20251101-pci-meson-fix-v1-0-c50dcc56ed6a@oss.qualcomm.com>
 <20251101-pci-meson-fix-v1-1-c50dcc56ed6a@oss.qualcomm.com>
 <31271df3-73e1-4eea-9bba-9e5b3bf85409@linaro.org>
 <rguwscxck7vel3hjdd2hlkypzdbwdvafdryxtz5benweduh4eg@sny4rr2nx5aq>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <rguwscxck7vel3hjdd2hlkypzdbwdvafdryxtz5benweduh4eg@sny4rr2nx5aq>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_003018_673473_843B4C2C 
X-CRM114-Status: GOOD (  12.71  )
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

On Mon, Nov 03, 2025 at 03:42:58PM +0530, Manivannan Sadhasivam wrote:
> On Mon, Nov 03, 2025 at 10:47:36AM +0100, Neil Armstrong wrote:
> > Hi Mani,
> > 
> > On 11/1/25 05:29, Manivannan Sadhasivam wrote:
> > > Binding incorrectly specifies the 'DBI' region as 'ELBI'. DBI is a must
> > > have region for DWC controllers as it has the Root Port and controller
> > > specific registers, while ELBI has optional registers.
> > > 
> > > Hence, fix the binding. Though this is an ABI break, this change is needed
> > > to accurately describe the PCI memory map.
> > 
> > Not fan of this ABI break, the current bindings should be marked as deprecated instead.
> > 
> 
> Fair enough. Will make it as deprecated.

The true question is what value was being passed as that item (ELBI)?
Because if this was always DBI - device has DBI there - then what
deprecation would change?

Best regards,
Krzysztof


