Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2856CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 09:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wqsl90K8VON6BboRubqU8w1H96gQXUcu5dsnaHXzI6M=; b=2VmYX4KiPYO/cA/sQZNSb3UmMI
	czFDQFVIW6yY9cVywhDPhlQCYOvOAcj/lN0++96I2WwWcIp+aGymfgUEREl+F0dfWL0wTVkk0GcKg
	bpfxl2HExEVor6albQ+1Esx3wjrQtuh1Mi/pVsuyCsprmmhwS9YaNy6szHtHI+bXLB9GdJeBK56hC
	tt/nBbN6g5Oa/vh/NpkJdS6UtebMDgQR8YZGv+crjqdiBqSp1F10HUp7jlZIlspyd0aplZQZM4ODh
	dfaWNjn3MHnfLND1/A0twX+yoqmD9n5491jHCAExt2fDl7P/sLDsrmJWc6SFn6d3qQVb+GYJQyLWL
	amvtvfMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxMaM-0000000E6yz-1YE2;
	Sat, 13 Sep 2025 09:30:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxMaL-0000000E6yD-17BS;
	Sat, 13 Sep 2025 09:30:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 58A9460219;
	Sat, 13 Sep 2025 09:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3766C4CEEB;
	Sat, 13 Sep 2025 09:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757755820;
	bh=c12/xNUXslNQin2axApjPv7ljtSkh0GTCsEFL44BFio=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sjvqPnzqsYnWNxyxRDIBh+NQRy7Qf3VKRmVD4aWDVkjjK3X2qgB0ociCTcXT7rRE6
	 KfyVY9CT/R53w5AbTPrvFD6V+X7BNzx6nA8630xM3lyo8BOak1vIoZ7am0QF8RKhOs
	 YcRJqaB/bFH3UuSVFOUszO9gxEu6jkHslv5dqfv0khkLOnOaSQlAHXStkj0rNlV1wq
	 rA2ezBsW7mDqHW1IPxDgNFl9oqv6vAp+GhPcd+HnrE3KU/CpvrvJZjkj57WajF+u01
	 iA95YWsidRyYVZrbjeQ3EGCSG1VJKBgAdFMQJxUtrJQ+unTyhnye6JG0AaPKbqlKrF
	 b0eH7QGVeY3OA==
Received: by wens.tw (Postfix, from userid 1000)
	id 7C2145FC8D; Sat, 13 Sep 2025 17:30:17 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Maxime Ripard <mripard@kernel.org>,
	Lukas Schmid <lukas.schmid@netcube.li>
Cc: Chen-Yu Tsai <wens@csie.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 0/5] Add support for NetCube Systems Nagami SoM and its carrier boards
Date: Sat, 13 Sep 2025 17:30:16 +0800
Message-Id: <175775572870.3891284.1456456718289976149.b4-ty@csie.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250831162536.2380589-1-lukas.schmid@netcube.li>
References: <20250831162536.2380589-1-lukas.schmid@netcube.li>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

From: Chen-Yu Tsai <wens@csie.org>

On Sun, 31 Aug 2025 18:25:29 +0200, Lukas Schmid wrote:
> This series adds support for the NetCube Systems Nagami SoM and its
> associated carrier boards, the Nagami Basic Carrier and the Nagami Keypad
> Carrier.
> 
> Changes in v8:
>   - Use a gpio-mux instead of the gpio-hog for the USB0_SEC_EN signal
>   - Fix the dt-schema issues
> 
> [...]

Applied to sunxi/dt-for-6.18 in local tree, thanks!

[1/5] dt-bindings: arm: sunxi: Add NetCube Systems Nagami SoM and carrier board bindings
      commit: db5796c5c5c6db72339e818b54e6a2e043f7032c
[2/5] riscv: dts: allwinner: d1s-t113: Add pinctrl's required by NetCube Systems Nagami SoM
      commit: cbce6d5326b116f55dc29f7fc0a7d56a9a03d9e5
[3/5] ARM: dts: sunxi: add support for NetCube Systems Nagami SoM
      commit: cba2febbd6465aabdff157fb95b1c07d090af1f0
[4/5] ARM: dts: sunxi: add support for NetCube Systems Nagami Basic Carrier
      commit: e36d4d54eefb60144666b27754007e1c0dd0a581
[5/5] ARM: dts: sunxi: add support for NetCube Systems Nagami Keypad Carrier
      commit: caffed0800ef4dd29cc29ee17a89d015e867e03a

Note that there were some cases in the device tree files where lines were
indented more than necessary, like for gpio-line-names and the board level
fallback compatible string. Wrapped lines for lists of items should align
with the first item on the first line.


Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>

