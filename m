Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90749606EE93
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T9vOcuR8;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fCOphDhg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MXlTLVrJ+8VyZnT5b9Rq3zNGNivlya/OsfintA2OPZU=; b=T9vOcuR8k9HdV9
	647TwNOoa9w7oRGgMnNdWC+ODVV8kWrlFKmQH+XCKAD/U6cii0FHziJNWWFqGm3pLHkMdQ5t/iIiH
	/SX3jpfXps0ppXxGhCLIi+xW9Zr1Vk75srKCrx79OdRkF19n2cIeqtxyjIXv8ChX6oTChB3uAmkjQ
	WgBa4D3vdk7D7lfsc9ofl/3m31vCuqo4+HkQHUpf2NYaoxvuFyO7E3b4+5Lgi7hFLt17s8h09Ujg7
	EdsoMw0yQuZ7IJnU+rn1iE/7wNwkFdx1avL5aps1mo63e0MqlINA/Xh6bpnqjQw/JrvM+WdyuTW5L
	ge+W2gA6TBAJf7TNXdxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOE8y-00000002S1u-3Ti2;
	Tue, 03 Nov 2026 13:01:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOE8y-00000002S1Z-0TBy;
	Tue, 03 Nov 2026 13:01:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 88FFB43E2E;
	Tue,  3 Nov 2026 13:01:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3D431F00A02;
	Tue,  3 Nov 2026 13:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793710899;
	bh=MXlTLVrJ+8VyZnT5b9Rq3zNGNivlya/OsfintA2OPZU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fCOphDhgwQ8NGxMZqa2+B+NPzkOmO1szZRb+kGZkqho8TLMxoDAdJZPwJhNpB+IuN
	 pr/x3sk6mMUMpNrYL7weXFezxfyS0R9IUgVv+I3lCv/T3/CIzeBua199bTL7Lm6c0+
	 /PJB7T6/XEnrH7/1ANUGOHOy3Z+kbDaSvKcRuKRIaqUpfqn5nVjvV05pDD641Ufk0T
	 qWUaM0tkWNr19cF4q+v7V5wymrt4GNDg4QjRpbUEkOfQJDP8iIKqloQI7wjkq+V6p7
	 Cc/YoEACpfpvgudlj0SsAqJ2yLZe+AH8xqDhxXbAjLvkFAJAPfvBC/YbXC4u32oJE5
	 eN1MUnkMWew5Q==
From: Sasha Levin <sashal@kernel.org>
To: Shuah Khan <shuah@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	sparclinux@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	=?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] selftests: report per-suite build results without failing the build
Date: Tue,  3 Nov 2026 08:01:25 -0500
Message-ID: <20261103130131.4069212-2-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261014200115.1363363-1-sashal@kernel.org>
References: <20261014200115.1363363-1-sashal@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Shuah,

Thanks for taking 1/7 and 2/7. 3/7 through 7/7 are still pending and
still apply on 7.4-rc1. Catalin acked and Mark reviewed the arm64 one.

Without them a failed subdirectory in futex, arm64, riscv, powerpc or
sparc64 still gets lost, and for arm64 and riscv a failure in the last
subdirectory drops the whole suite from the install. Could you pick
them up?

-- 
Thanks,
Sasha

