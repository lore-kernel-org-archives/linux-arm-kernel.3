Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 193FFCCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 13:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LPJLetMPIdvYKqkTc8SZL1HtK8BtN16RAneelvqr+bw=; b=38So3Y4J0yvze6Gc2grCIuAOZ4
	+3UNhkDFXyZRudQj/klN5DUhcYTeHjKBPNr36Hb4Ed+vSUnBUe0KWvOnuw5w9PuX0lDSVKFowBnzc
	+pZBLHL+yW82Qmrs2vnA+fbVzK9/45KYEq4q62a9/eK2kZBbyQlDmFHtp33LL00BTkNxDB5BQdOBt
	y6eQCkAa9sDG9CykVd8vNvX+iHw+mJKAcjZ5WUKET2ixAyT+Iam5yLJHE7JUjjIm8XA7jtbER+Qj2
	oFEkB24QyNMXgVMo0XjOjZZS1sNfS+XORTUyQCWpIjEVKru0U3DXZxW7yj4vp345+gQko+S5imqQ+
	07wx/vFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH0Tj-0000000FeB3-3Wc1;
	Thu, 06 Nov 2025 13:56:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH0Ti-0000000FeAv-2IkF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 13:56:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 97E4C601B8;
	Thu,  6 Nov 2025 13:56:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFC85C4CEF7;
	Thu,  6 Nov 2025 13:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762437401;
	bh=CAPtG3qawnkmkv2IEXIZXUOloOY618BfaIpnP1GF1Mw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ByGmuJzM2cujoKMGT/JaCi6BvzNoQnznyt/Q878ToDqrJHMubMPtbW9IU4uGH3ypg
	 KfEMXXduaJJQ2nYIbJh5D1u24H2y2i3aWOdDVcejcq7a96IXDRN9skun5LzhGbg6X5
	 0NVwfmflt+6Zk8xzrdBXL6UUMA28HEt8dxieQ/MZjtPbMbMdMHkw4PuqfTzlUqgRaP
	 XXl/yqQRRel+0yztGVDIH/z3X3e5DRGaVSdgaMsjsQoOXxEBD3ymVqsqZJVTMFMnSg
	 s2nzTLI3+vnePHqS6U87XKAsaLNdrXzw48bi2tzOXLvTGRUK5gRyKzTe7Zz8uEZBCN
	 nDUP+GvX2YXNQ==
From: Lee Jones <lee@kernel.org>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
In-Reply-To: <20251025-macsmc-subdevs-v4-5-374d5c9eba0e@gmail.com>
References: <20251025-macsmc-subdevs-v4-5-374d5c9eba0e@gmail.com>
Subject: Re: (subset) [PATCH v4 05/11] mfd: macsmc: Add new __SMC_KEY macro
Message-Id: <176243739664.1858806.689981774095492869.b4-ty@kernel.org>
Date: Thu, 06 Nov 2025 13:56:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
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

On Sat, 25 Oct 2025 10:24:36 +1000, James Calligeros wrote:
> When using the _SMC_KEY macro in switch/case statements, GCC 15.2.1 errors
> out with 'case label does not reduce to an integer constant'. Introduce
> a new __SMC_KEY macro that can be used instead.
> 
> 

Applied, thanks!

[05/11] mfd: macsmc: Add new __SMC_KEY macro
        commit: 8c3290b4c975e35a01aecfb51e0e004b6f7c0480

--
Lee Jones [李琼斯]


