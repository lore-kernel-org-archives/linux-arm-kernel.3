Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 528C3D38FEC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 16:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YMt7a6YCbZcu3gG0Uc7t184YpWfvwkMxN/xuDQkIpF4=; b=4zTfZOhLsYZHWMxSYm9vZY+0do
	ESDltDxsmH8/mVMGihF6xUQZDKaRCgZM1JBwPmDwecFabPZl+Vije3IjPqs6Orp2pLOKjbBZS3zVh
	HL4doeC974myiJdZDy9hW7+v82pq51R1TDcdulWv8ERTHjwdtrNU/7e3mavilZLuplcCKhMarhhkq
	npVF/2VGMhAsTiiv/9bWUhdcllFvSssJ0QcHMeBbnNN4CMLOxkdlGHX7YXkNm1ZN8Y2BP+YFvYUb6
	2F/f27hnK0stloD00CjxYF7RMkkQfkvTKUd2jFjBzW733+5O3BjbMZbRwRDb1xKoipb4tiIVqtfbm
	leCvWuaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg46c-00000009zsQ-0KWc;
	Wed, 14 Jan 2026 16:52:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg46E-00000009zfE-2kbx;
	Wed, 14 Jan 2026 16:52:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E371B44418;
	Wed, 14 Jan 2026 16:52:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD28DC2BC9E;
	Wed, 14 Jan 2026 16:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768409521;
	bh=iEoIBUiTErZhAHEK88wMe4VPH+/PQ2T6ozGdaL9nesI=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=RxjoBzvgOnICXpxptA9kB27hjbg0sbut00Xp5odTH4aXtaf/0JBv2edoqvvMdPBsR
	 VtSTb2kVwvqevDTITaj8sUDDJ1lrkpOutV3jOh0SgSrYf5noe6qMBiJOuI+CKS4IfQ
	 +KbxYxfL1bVG9dokRTILT4YxmW4BjPmCQGdaR+QKu23Q4p/lSymscYYc/KWoW/xYNS
	 wxYvvlGo+siAu14ePbvKc+cyAOeKr0VV7lKr2WUlZyET6TtR8ZJWU5V6uyiRTyiohm
	 xoF5Rg9pZQh6nosBieDe4Yzzyk0/edTxBo2akevW9hzEBo1JkkRvHeHTFkn3S8AsQE
	 9TlXM6Spbgaaw==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260102124848.64474-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124848.64474-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] phy: socionext: usb2: Simplify with scoped for each OF
 child loop
Message-Id: <176840951952.979558.9345356688634586716.b4-ty@kernel.org>
Date: Wed, 14 Jan 2026 22:21:59 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_085202_729992_F64BCE99 
X-CRM114-Status: UNSURE (   4.21  )
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


On Fri, 02 Jan 2026 13:48:49 +0100, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> 

Applied, thanks!

[1/1] phy: socionext: usb2: Simplify with scoped for each OF child loop
      commit: f16741314f68091a8edf116ad5c134a72ffab854

Best regards,
-- 
~Vinod



