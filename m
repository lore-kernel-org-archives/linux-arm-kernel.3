Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09079CD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 00:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=izL0j4eEPLcRk3oT8/yUGunO6coycfc6sbBDJ25Cu4Q=; b=bK4zbgq2jaGL77VGpuuwPEJ+4Z
	vAEs7rOsjnmta0BZdmrCVRx8OuNYkxcmSCV6lmwLAvDK4nkqLw90wvu9v2cD+FTn6msW0wEgd12d6
	oH61NsCHDWqfsl9hgZ3l3sLyiCV6AN0lnmdrbsiEnZP+LusLpR4jyUAsIcirLBXzUWBBisePWGHxg
	6kJ6um752eOk/0m763VSmWEQBYLHhTIIfWmQjFtL9Z9Zc5C2X2vobXB39aXyV7sXLM6FB3z1PNAV/
	DJw5KTzqfdNSvtaDr35IDVCdRFpmORK86NP3OXpeKDp+GLFk+PFYItmR29+whgV4h6oE7p4z0jHoB
	HhD151Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXpvZ-0000000AE0M-0oyo;
	Fri, 12 Jun 2026 00:39:17 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXpvW-0000000ADzz-1saw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 00:39:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1781224742;
	bh=izL0j4eEPLcRk3oT8/yUGunO6coycfc6sbBDJ25Cu4Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=bNCUDtncB3TwH5DnGhWuYj9Awj9cB0VYxeNn+Bh+3DPjyU4iCsRDrBAz7lyShcWek
	 4OXgORZBkvjDoRCXol7F11hZu7b+EvOKUfM/sT2ewNRdRBLc9viKBvI/rV9VpjfBEQ
	 BCByz5Id+HGAlSwdI9Ruh/Kd/amKdbqe6RqHdK6XiuAoID9kQryoAJdn0tkGJM6KB3
	 rOoVwv0mvT7iiZFt4491QSTiuY87OPylPaFDc4CZXY9gG7a6l12QB7Q9L2HVo6c7Cj
	 gTBMRvJOE2U3+J8jqzqDHYggMMwYwOS3b4Vz1GC13aR2A4i+ONLuOo/iNoZ7DZ2QsA
	 XPrqaEgokFjKQ==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 45D6E60931;
	Fri, 12 Jun 2026 08:39:01 +0800 (AWST)
Message-ID: <7db557b8f6fc5751b19b148fc6afc4ad7ec2d1e1.camel@codeconstruct.com.au>
Subject: Re: [PATCH v5] soc: aspeed: lpc-snoop: Fix usercopy overflow in
 snoop_file_read
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: karthikeyan K S <karthiproffesional@gmail.com>
Cc: joel@jms.id.au, andrew@aj.id.au, Kees Cook <kees@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	stable@vger.kernel.org
Date: Fri, 12 Jun 2026 10:09:00 +0930
In-Reply-To: <CAP_JKPu9MTpMUZmg9BY3sxGhmBzgR0E6HnvAT7sQjVUpQp0dSQ@mail.gmail.com>
References: <033f2657ae6a94ad13d22f717a2900afb75d892d.camel@codeconstruct.com.au>
	 <20260610172310.163321-1-karthiproffesional@gmail.com>
	 <64f8d88bf4cd72d8120baaa304dfe34bb66cbe0b.camel@codeconstruct.com.au>
	 <CAP_JKPu9MTpMUZmg9BY3sxGhmBzgR0E6HnvAT7sQjVUpQp0dSQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_173914_703554_976C92B2 
X-CRM114-Status: UNSURE (   6.64  )
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

On Thu, 2026-06-11 at 23:01 +0530, karthikeyan K S wrote:
> Thanks Andrew. The __guarded_by annotation and context analysis integrati=
on
> look good, I wasn't aware of that infrastructure.
> Thanks for applying those changes on top.

Sorry, on reflection I chose my words poorly there. I applied that
patch I pasted on top as an experiment on my end. I haven't yet added
your patch to the fixes branch.

Do you mind integrating that rework, testing, and then sending the
result?

Cheers,

Andrew

