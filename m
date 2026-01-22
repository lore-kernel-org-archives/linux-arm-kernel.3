Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C268BD46977
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 17:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQi1ly6F0n/FOCXZAw2YzAzctCL9rRTNMffS+eclxdg=; b=xZEb2zgpqKjx6ex6lrIaxVHY1T
	6jFukhrYgJVw5JE5F/7m0HkfI54oVyZIaxYyYaZfRN5J6L5O2wg9pctWZlwe41knKHtn0n5WOYlKQ
	5aZhMoxKBbltkgZOZpWTbexnWAqH2ueoxn2bd+rn6QIZ4qKJBOdm18ziSYQ3SNNfnAgxyjVGZRpC1
	e7VoqBHYtz3IZdXm/5vWFXgXmISV61/zyrcsaTIT6L4mM5NjGH/lSMCxbqsmm2+X6gmi6eiKalPFp
	10C01ELkdf4XqLt1C7zx7/fatoMquig+Y90PqNyv9ygosjEMLpehtQ6ObWLHJRm2jLv9Z6Nj5Xpbf
	LDgNl0oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viyab-00000007Zcn-0kIp;
	Thu, 22 Jan 2026 17:35:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viyaY-00000007ZcA-1p7t;
	Thu, 22 Jan 2026 17:35:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 30C9A43AB5;
	Thu, 22 Jan 2026 17:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0567C116C6;
	Thu, 22 Jan 2026 17:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769103321;
	bh=x6oKsK4tsX/k/NIRjfg4qq6ZO9RvracVhuSMqKYde28=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=s3OkG3p6323vXxuW6xvJKOwIrhDIiIBPZvL0xeeA8lCOSRG/MZTUcXBPs1vU4rY8R
	 i6aze9u6G+sP6l8FCIlUSk+CtSLn51D4Owe8rVvxQAUj23VJ2S+QYeJMUE8s0glO99
	 sC0EZ46oTtYI6sFAL5yS7SZkppWMyS100iuTtoSStV0D1OcvZwdBCaP9WtW/5nHUbi
	 eVMZW7yhpXQ05l1Xw3guwvKRoO3tl+3dsBOk9iY7M6eI2+sCtBux3N7kav6/CQqnat
	 ijjGNalKxRSUJD13nlTPgxpsN7g+2AclyiZXwCCzGfNJ0UmhptC9WUrleR5qFGawhU
	 amnF3EVxVxkkg==
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 05AAB5FBF7;
	Fri, 23 Jan 2026 01:35:17 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Lukas Schmid <lukas.schmid@netcube.li>
Cc: linux-sunxi@lists.linux.dev, Alex Studer <alex@studer.dev>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
In-Reply-To: <20260113182951.1059690-1-lukas.schmid@netcube.li>
References: <20260113182951.1059690-1-lukas.schmid@netcube.li>
Subject: Re: [PATCH v2] riscv: dts: allwinner: d1: Add CPU thermal sensor
 and zone
Message-Id: <176910331795.3372333.1441179153534465132.b4-ty@kernel.org>
Date: Fri, 23 Jan 2026 01:35:17 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_093522_500415_EE3D1B1D 
X-CRM114-Status: GOOD (  10.27  )
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

On Tue, 13 Jan 2026 19:29:48 +0100, Lukas Schmid wrote:
> The sun20i THS (built in CPU thermal sensor) is supported in code, but
> was never added to the device tree. So, add it to the device tree,
> along with a thermal zone for the CPU.
> 
> Signed-off-by: Alex Studer <alex@studer.dev>
> 
> Changes since v1:
>  - Move include before defines in sun20i-d1s.dtsi
>  - Fix register size for thermal-sensor@2009400
>  - Move thermal-sensor@2009400 in SoC to match register address sorting
>  - Add thermal-zone for sun8i-t113s.dtsi and fix missing cooling-cells
> 
> [...]

Applied to sunxi/dt-for-6.20 in local tree, thanks!

[1/1] riscv: dts: allwinner: d1: Add CPU thermal sensor and zone
      commit: f36e738549d483878ebf4cc9826c46d9dc4aa496

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


