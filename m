Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FACDE9B251
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 11:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ppgkxpzS1xy8IHabClBbYtaJIbql9qLl5gMQ4HCrJg=; b=4podUhKJC0CVvMH2t7JHfoPi02
	5YDxVTIIKBTOG1R49cx1MHmaIhGONYjIHHhcG6C78CFicdWZ43Yvy0ivP2sxwN6Df64xkmsj+2owq
	FRtVq19eyCpBq3yeeaH/5VVs5Vd9nBNglhU57cn92/spItrpqMuXg4a5jWp/ySnuJ96CDbLDW2KQM
	X8aNzvErsj9xTGgbCLf9oEbCgA+Tgx+clfTUHBd4ddgU9rlSU8gk28TNLN7w58hfOPk3d7oPn7d0n
	VEbZDnWQGfd3J5p1GiJvhWeFU+6z86xkxZEEPbvrDEf+0fyMI9XIFBwvgjpacx0MCdRLPm23NWM9c
	dAMpBsxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuqlS-00000001zkp-1S8s;
	Tue, 24 Feb 2026 11:39:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuqlP-00000001zkS-1Laa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 11:39:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E116740B63;
	Tue, 24 Feb 2026 11:39:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26D86C116D0;
	Tue, 24 Feb 2026 11:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771933178;
	bh=XciIbqU0M6TfQN6a2di9ZkjY1Gufztdl8IPqFNkmZUc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=McI+sIPdYrfgC2TLM3Fs+Rp3irXWV6tfxny4WrfQg13JtnWuR0lxbzDTnpjwQ3ZR9
	 0sR5DDieMj5azyqWLtuY7cP01GqJP/xyH+tysMBoLXfvTIzj0jwGfSPuM21uPm7VmH
	 21AxkcPTuVHTMgktpctk8jk+OrOZf4fHDSrNViX6MXLpbDWElKvUXPXD2BnJ+QCCty
	 T6soimrym5fSFipWCgmzuemIA6WkzoZhxB7cq9TIUqaSW0zw/5JOF2bLlXmqtLsBXO
	 26d4JtUmXx2ceBRs1ZQI7tL/kSoCVxT0/XqBNmZ0EqQK3HrZcjO4+BWo0EEeEengcw
	 d27S60t/SkeVQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 jesper.nilsson@axis.com, lars.persson@axis.com, mturquette@baylibre.com, 
 sboyd@kernel.org, alim.akhtar@samsung.com, s.nawrocki@samsung.com, 
 cw00.choi@samsung.com, Ravi Patel <ravi.patel@samsung.com>
Cc: ksk4725@coasia.com, smn1196@coasia.com, linux-arm-kernel@axis.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, pjsin865@coasia.com, gwk1013@coasia.com, 
 bread@coasia.com, jspark@coasia.com, limjh0823@coasia.com, 
 lightwise@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com, 
 shradha.t@samsung.com, swathi.ks@samsung.com, kenkim@coasia.com
In-Reply-To: <20251029130731.51305-3-ravi.patel@samsung.com>
References: <20251029130731.51305-1-ravi.patel@samsung.com>
 <CGME20251029130841epcas5p404125f4d8ee865275a73b3bf9ae6cf52@epcas5p4.samsung.com>
 <20251029130731.51305-3-ravi.patel@samsung.com>
Subject: Re: (subset) [PATCH v3 2/4] clk: samsung: Add clock PLL support
 for ARTPEC-9 SoC
Message-Id: <177193317288.54984.11991926930863142214.b4-ty@kernel.org>
Date: Tue, 24 Feb 2026 12:39:32 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_033939_393946_9865F77E 
X-CRM114-Status: UNSURE (   6.15  )
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


On Wed, 29 Oct 2025 18:37:29 +0530, Ravi Patel wrote:
> Add below clock PLL support for Axis ARTPEC-9 SoC platform:
> - pll_a9fracm: Integer PLL with mid frequency FVCO (800 to 6400 MHz)
>              This is used in ARTPEC-9 SoC for shared PLL
> 
> - pll_a9fraco: Integer/Fractional PLL with mid frequency FVCO
>              (600 to 2400 MHz)
>              This is used in ARTPEC-9 SoC for Audio PLL
> 
> [...]

Applied, thanks!

[2/4] clk: samsung: Add clock PLL support for ARTPEC-9 SoC
      https://git.kernel.org/krzk/linux/c/f051dc5bc8e785b221d2e69094e774507c3a52dd

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


