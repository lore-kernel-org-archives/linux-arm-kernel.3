Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B466AC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 17:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hepm8BAoxo/Ngcm/vlAF6o0xVWUqWkwjKGAY/RnUeYE=; b=1OaG9xZ6l6dVkYSoNeCejIloOm
	ByzXDY3YbLS7aC2Jn51wySHlJowTzLDujq/fujBHP3000BraH0IdnFek539d4GZ9T3C8DyGHRDj0q
	eVQOueBEDB1Cg0zbz6a68LfB3nhQo5CY8UP11kfc4LDIOLf7/QjZxHuXsIZYPgGAbWXRhddj63Wfd
	Kyi+/bPFAztvoQz67k/jgFC6+4ocnPQtT6SAy5wuZbEnbl6BNNQiaI/wL775oYIdri3wxyN3xEBqI
	26UPbD6/vmhMFCdBYh7yTv5gpxdsN3EyoA5VUvuLE8FPScUB8NF91qZu7k8K5Ns6IiMIirDasFZE1
	Qa7/YqHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts3R7-00000006Su8-3RtF;
	Tue, 11 Mar 2025 17:30:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts3Ep-00000006R25-3MQO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 17:17:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6975E5C6360;
	Tue, 11 Mar 2025 17:15:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8BB2C4CEEA;
	Tue, 11 Mar 2025 17:17:52 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: shuah@kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Will Deacon <will@kernel.org>,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	naveen@kernel.org,
	yury.khrustalev@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: Re: [PATCH] selftest/powerpc/mm/pkey: fix build-break introduced by commit 00894c3fc917
Date: Tue, 11 Mar 2025 17:17:50 +0000
Message-Id: <174171346335.3659993.17442583301270023148.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311084129.39308-1-maddy@linux.ibm.com>
References: <20250311084129.39308-1-maddy@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_101755_875703_BB32AA82 
X-CRM114-Status: UNSURE (   9.02  )
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

On Tue, 11 Mar 2025 14:11:29 +0530, Madhavan Srinivasan wrote:
> Build break was reported in the powerpc mailing list for next-20250218 with below errors
> 
> make[1]: Nothing to be done for 'all'.
> BUILD_TARGET=/root/venkat/linux-next/tools/testing/selftests/powerpc/mm; mkdir -p $BUILD_TARGET; make OUTPUT=$BUILD_TARGET -k -C mm all
>   CC       pkey_exec_prot
> In file included from pkey_exec_prot.c:18:
> /root/venkat/linux-next/tools/testing/selftests/powerpc/include/pkeys.h: In function ‘pkeys_unsupported’:
> /root/venkat/linux-next/tools/testing/selftests/powerpc/include/pkeys.h:96:34: error: ‘PKEY_UNRESTRICTED’ undeclared (first use in this function)
>    96 |         pkey = sys_pkey_alloc(0, PKEY_UNRESTRICTED);
>       |                                  ^~~~~~~~~~~~~~~~~
> 
> [...]

Applied to arm64 (for-next/pkey_unrestricted), thanks!

[1/1] selftest/powerpc/mm/pkey: fix build-break introduced by commit 00894c3fc917
      https://git.kernel.org/arm64/c/73276cee1a25

-- 
Catalin


