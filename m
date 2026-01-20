Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 743F2D262A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 20:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XuShmbIsWHkVNMchEJAOvTV/LRlfC3PDeUwV/9Gb9tw=; b=tx908Y7KXWLpDB9BKzxkFRSowU
	G5MTsL/IJiSf6NO6tJscqVftHyQ2D5JIgZ6+jeubioqOEYzqWjqMLw0E2H28sopC50UzmUExuPARr
	HM0WJOl3ayHswwRgf8JCGcI9r8nqKUTYOto72/Y9fPWOz53LsJ7zRtoQxL2OzjkZYCdSgDhx313dV
	5ms1HP5CbDE709UTdhskoYObF1wH9ErI424/UPXGZ9ak0IYa4/UaWoEB4kk3g+3Ra3AVmQVWVknjT
	cfhrE31BKeJtmkdfI3EtYTrguwQFcXd51jOk68DO/z8QH8QbcqJ13dGfP27ywiWcS8IK0AY38izuz
	IAm6GpIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viIf0-00000004SkA-14az;
	Tue, 20 Jan 2026 20:49:10 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viIex-00000004Sjr-3mQq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 20:49:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=XuShmbIsWHkVNMchEJAOvTV/LRlfC3PDeUwV/9Gb9tw=; b=B9NFqMHsuVdpi53LPqtVcEevCC
	vkkuVm0zCdGkepUf/uYbkRE6zxo7T5lmJqRmj/OZUc1hl9Gu5g+4uNZIZGReL6zGdq/aBJTSeq3kZ
	4ZJEv/DtTs5Z/QKrFMqLppeGw/Bg5zzQvAatuwl4JlXXYb8+l8nl5VAhsKrzUZQoxkA8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1viIes-003inO-RL; Tue, 20 Jan 2026 21:49:02 +0100
Date: Tue, 20 Jan 2026 21:49:02 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Mark Brown <broonie@kernel.org>, Michal Simek <michal.simek@amd.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] spi: xilinx: use device property accessors.
Message-ID: <e8259a1b-ad3a-4f87-ae56-00eb3f4aa4a1@lunn.ch>
References: <b9ad8ab8-7985-4c89-a82b-c7f31d32c167@sirena.org.uk>
 <a6d57890-89c1-445e-836c-d8239d20c621@amd.com>
 <b03307f7-93f6-4680-9241-cf28b5456fd0@sirena.org.uk>
 <a3fcef3a-d1e9-4b46-b114-3a82575e052e@amd.com>
 <980ad372-a2c7-417c-91f9-4958d3d1aaca@sirena.org.uk>
 <4831B269-DFC1-40E0-96B7-67981AC72562@nexthop.ai>
 <6e06696e-09a4-46e0-98fa-252690b888e0@sirena.org.uk>
 <BF71A04E-7FFB-42D1-8C8D-6FD13415EED5@nexthop.ai>
 <c3fc04a4-4b09-4c6a-a0f1-e5aa92a22976@sirena.org.uk>
 <80A8F67E-7A01-4F9F-9D84-29722678A2CE@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80A8F67E-7A01-4F9F-9D84-29722678A2CE@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_124907_942501_18F7DB35 
X-CRM114-Status: UNSURE (   9.90  )
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

> This is not for a normal off the shelf server. In our case we are
> building an embedded switch with an AMD CPU and Xilinx FPGAs that
> happens to use EDK2 based BIOS and ACPI.

I would actually say, that is the core of your problem.

Look around at the networking world. Nobody uses x86 for core
networking. Nobody uses ACPI. Everything is MIPS, ARM, or Risc-V and
using DT.  Linux has mature and complex DT bindings for networking,
ACPI has nothing.

You might want to consider using DT with x86. It is possible. Take a
look at drivers/misc/lan966x_pci.dtso, which is used for networking,
and can be used on x86.

    Andrew

