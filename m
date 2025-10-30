Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39CDCCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 03:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VFuC8RfE70bgOZewA1Z1YdN5oNtLTuOQ25IAfcVzoiE=; b=nVaQ9YqoY34Sx2YuK20AWtjEp6
	Wuptr/5SbbryKrpbWEMrrSbzGtwIIeR4TpnqK83XKV9h336wQs/h5ntpdgYdJNGeI2CBTBCZyz52P
	0y4txokrQ1Perh6sUBUUe2QB60zYDNOXIo8CpJn/F9CY0e/CjH3lNZbE4S/77nFCVjfoXDuJwIZ3D
	OznASai/qDfdwJoN/tkoEw4vSVN3wTNvVeZV6/Md34CNhIXqqBqtcu1z0DdJgL5+wbpmhrI5dk/36
	AwmERc78dca/+2jLxLSGOzxhwaKObDShIf9PQI81TPQOY/kyw8T/aLVyiqwdVQinaU8I+F9lXj5W9
	LkhV9Hyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEIzR-00000003OrN-1oLq;
	Thu, 30 Oct 2025 03:06:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEIzO-00000003Oqu-2elO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 03:06:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3557343B20;
	Thu, 30 Oct 2025 03:06:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1EE2C4CEF7;
	Thu, 30 Oct 2025 03:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761793574;
	bh=dVUd0kxP8SBgNKarJK8Wzf0YKtUqqRpN45iifynlBCo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G460pf5wZhF+5PaPtXWKUHL7xcNeYSTZq5hk994ffhXrjkGhrgreSpGNZyneEKfoD
	 PwDjfzcQDKLl4mDUwnv0v9ccHu48LXdI+LxeCtNmvPCEEJbLlaZ5k/ZFATc9bxk/79
	 sPPII1vhsbTRFwgdxKyQnXM61r0Kf2nMvvLB7v5ZWlquSgOxG3zVFqIBiRq6rX+8Ra
	 Bb6lAPLQSaYbv/9J6r8ZAwC066QnJMnbmdK5pTmgaFEDRUdXWwBgrFtkAwDpwHRpZL
	 RyxMPd7Gq4YechklQOWL+7lWM55HuaYxKL1P/QUz7dFcEL2F2C+7l2DQ+Ff9PmgkXg
	 CnMEEcH/JeC3A==
From: Kees Cook <kees@kernel.org>
To: Alexander Lobakin <aleksander.lobakin@intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Russell King <linux@armlinux.org.uk>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Michal Kubiak <michal.kubiak@intel.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org
Subject: Re: [PATCH 0/3] Resolve ARM kCFI build failure in idpf xsk.c
Date: Wed, 29 Oct 2025 20:06:09 -0700
Message-Id: <176179356659.2479588.16940248582240491111.b4-ty@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251025-idpf-fix-arm-kcfi-build-error-v1-0-ec57221153ae@kernel.org>
References: <20251025-idpf-fix-arm-kcfi-build-error-v1-0-ec57221153ae@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_200614_858513_F5DBD56F 
X-CRM114-Status: GOOD (  10.75  )
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

On Sat, 25 Oct 2025 21:53:17 +0100, Nathan Chancellor wrote:
> This series resolves a build failure that is seen in
> drivers/net/ethernet/intel/idpf/xsk.c after commit 9705d6552f58 ("idpf:
> implement Rx path for AF_XDP") in 6.18-rc1 with ARCH=arm and
> CONFIG_CFI=y. See patch 3 for a simplified reproducer on top of
> defconfig.
> 
> I think this could go via hardening or net.
> 
> [...]

Applied to for-linus/hardening, thanks!

[1/3] compiler_types: Introduce __nocfi_generic
      https://git.kernel.org/kees/c/39c89ee6e9c4
[2/3] ARM: Select ARCH_USES_CFI_GENERIC_LLVM_PASS
      https://git.kernel.org/kees/c/1ed9e6b1004f
[3/3] libeth: xdp: Disable generic kCFI pass for libeth_xdp_tx_xmit_bulk()
      https://git.kernel.org/kees/c/c57f5fee54df

Take care,

-- 
Kees Cook


