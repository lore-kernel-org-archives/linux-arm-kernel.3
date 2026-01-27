Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3286D2F001
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 11:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rssywxCqcXYDR32yjOeHUD3HINxMnHOrj+Io1Y4CgYQ=; b=fxcIBMbDWiftHXDIrD7b81xTfz
	g4ZsDHOQNexVENDbCF0ipqAmi/HpbTFLNQMjJyxQkKBn0S0dT6xSP5Rl72GWB4YSdqn5X114Q13Fu
	pGpLs8z+ZwtB5QWrzIz+te80u+77kybVXiZytSFGO5P1npgXTfy+PRSZqVOR3W/wjSrrJXaR3kR8w
	ATZOXyy8GPU3A2B97VGTsaTtqN53XHlbyslaXUvBDWeyPzLolVq25mFQwqH5/WIa8qtLmdkWpgtkk
	w2Y0EywUx7QuA88K//wuOTk2jqJ4NDfps5EwNGtW4K7RWh1s02gP8KO9QWsl+1yHzKqR+S1cVINU/
	6aYD8r1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkhPt-0000000EAdH-14rA;
	Tue, 27 Jan 2026 11:39:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkhPq-0000000EAcT-1Yqc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 11:39:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E5AC43FF0;
	Tue, 27 Jan 2026 11:39:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A755DC116C6;
	Tue, 27 Jan 2026 11:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769513965;
	bh=RuTomhlbNE9tBHH5bdeCjMNZHDz/SnjRSVcc7LFJTiI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VKDKQm5tcxoG0eC6u8El+eWvTeznxANYk96mRGy16wkp3ue+ip+NFqnL1DdjHOT9D
	 ImjyVVkt4bm7vqdrQpsrSBy6JVrjXvy8Ol/ko67FTbQ5Hv57Rksst/Pv1vTX1strSg
	 3VaJLp1iGsBqSLMDDgXMed9M3sZlDr95QwNNK+0j6Dbw9R1iYEDFhhE4tufKXADU90
	 uhtob+OjHZiyeggRW3JukM6BHXdLPVzNEbVyB/QuZKExyGti6IjXTOwKgqeHQ+ydic
	 x9R1DRgTF9VV92qgdtUS52Cdg8kbSxWwkW1oR7I0wQnIybsLwFNMVhAEvgOClI3ohM
	 uEuM6ijW7KsBA==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Carl Worth <carl@os.amperecomputing.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Taehyun Noh <taehyun@utexas.edu>
Subject: Re: [PATCH v2 0/2] arm64: mte: Improve performance by explicitly disabling unwanted tag checking
Date: Tue, 27 Jan 2026 11:39:09 +0000
Message-ID: <176951239741.2185302.14847899262435443119.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251030-mte-tighten-tco-v2-0-e259dda9d5b3@os.amperecomputing.com>
References: <20251030-mte-tighten-tco-v2-0-e259dda9d5b3@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_033926_433658_E255B43E 
X-CRM114-Status: UNSURE (   7.87  )
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

On Thu, 15 Jan 2026 15:07:16 -0800, Carl Worth wrote:
> [Thanks to Taehyun Noh from UT Austin for originally reporting this
> bug. In this cover letter, "we" refers to a collaborative effort
> between indiviuals at both Ampere Computing and UT Austin.]
> 
> We measured severe performance overhead (25-50%) when enabling
> userspace MTE and running memcached on an AmpereOne machine, (detailed
> benchmark results are provided below).
> 
> [...]

Applied TCMA1 patch to arm64 (for-next/cpufeature), thanks!

[2/2] arm64: mte: Set TCMA1 whenever MTE is present in the kernel
      https://git.kernel.org/arm64/c/a4e5927115f3

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

