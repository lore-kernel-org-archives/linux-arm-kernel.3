Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0C6606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 19:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I34oVETy;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=LsNssMMc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=wqNWBCsndisgX4lcRXrNuSI/oi3Ees/aVl5C9Q8zm+U=; b=I34oVETyEVqaRZb5aXU2ugc7zA
	Wzc6mkNM/xBOx0A/6QjUdwvN8P5KNcbHXU5mhsexWhx7OAZkYzbaxQZMbv1naoNRiKpsX+8ZizxkG
	RuDCvfSe5lanmby81uiZV+mCS4YBE8xLbMbl5/rw32UzbobeUeyNVfMzNAhPC4GkQNwfyGKIqBoM0
	jWZU7XrqZgz4C1VoNY2GKxtnbyN2RjY/DF2loTRzGcxjzobbE/rG1n4Is7rSektSmAQHaWecYG4uq
	prhLjvKQVYw8HlR8mkdzVaosRiJP38sFtzJ8ZMADVzxOaXH2y63hHbRFY4Ra+khdMRRR0nuOXpuVW
	4ueotrqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM98t-00000007qbb-0QDg;
	Wed, 28 Oct 2026 19:16:59 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM98l-00000007qZE-2ral
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 19:16:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=wqNWBCsndisgX4lcRXrNuSI/oi3Ees/aVl5C9Q8zm+U=; t=1793215011; x=1794424611; 
	b=LsNssMMcujNF5plBQFNRE5GyzKI8CjJJRB/+ZLpGIa9PspnQc5X6hFpgwppsXVSx60D6+HVHUqi
	FvBb0WgCulKdT3+Pbjeb/4qVyklxH6btLhF16MsEnM0z7nGW9gMVXwD0nZvA389NB8llRWP/LMZFJ
	oPb6ry5f/I3Yop9ZtszbSvtDdLn1i69ssmoYsgrPaoi5Bkeyj7Xp7Kvh5Lc+RgxispoGjKdmQNA3Q
	5mkLJOFDrm5ohQeY2NV8zcyNj0x7ub0dTan6R7BxO+UYjAUfeMTDPkvHVXEwlxFRTU36rZtO0KG5h
	BHI0se8UZSDKRjhHqdXgNuytYclQ41nx4J9w==;
From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 0/2] ARM: omap: cpuidle34xx: Fix unbalanced
 cpu_pm_enter()/exit() and cleanup
Date: Wed, 28 Oct 2026 20:15:10 +0100
Message-Id: <20261028-susp2-v1-0-174b52857d89@kemnade.info>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL5J4moC/yXMyw5AMBCF4VeRWWvSzsLtVcSiajAWJR1EIn13x
 fJL/nNuEApMAk12Q6CThVefYPIM3Gz9RIqHZECNhdFYKTlkQ0Voa4uuptKMkNot0MjX99N2v+X
 oF3L7O4YYH3hZNQtpAAAA
X-Change-ID: 20261028-susp2-e2a9a2c9e71f
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=654; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=LNDW6Cp6A7t6pOlJ0sLQRvudT0nQe3f2z0UosvyIAs8=;
 b=owEBbQKS/ZANAwAKAYRhRfpAKNzxAcsmYgBq4knArntyhwMIQ5Rze9gZxm3Ygnj0qkFy90VL7
 aH+EX9W6VSJAjMEAAEKAB0WIQTY6xCZL0TEE1XHfFiEYUX6QCjc8QUCauJJwAAKCRCEYUX6QCjc
 8fm/D/9Pv4Hlwg8vSDUrw3D6P4xKf0kq+BQ9UvDH7FIRfCfeJ4aFP2YXCLgiW8rEC7hplHEPDmB
 YYBdz8o6adGKcOj7vbWWG4qVckFXBxB6qDpRnHRl4dQrCEULDyjr0NU7LHucVsqBcNXNJz04RLb
 6GMiLAgwqI/40482eg7eNArkDH9lgQYH/uDUU6DBQFLx58c7kMArSjrqoDFYgGT4IGqJG5Uxvaj
 RvXzrviwohvfr9mWkEz54AOrTaZ27EnbRUTX6scRNCuX6LoO7PzXynBWl8D7eEQjWdHNPkIvWzq
 LCvHrFr2YMhF6xoEhURUkAex7Uk4ZxNzj17xNeR77VakHQ1n3hMX8UCmwtId1OUxpfBzl7no7yb
 pbZjfzF6rUSNwxQzLbOh/gmUb00ZrAwa3SdEycOssr+LBXBKuL86bmsBfICDVY+/S19CgMdc/A8
 1YZLyjacFbejadA8aG5OAonZM7ox+bLjIVPUqBQvCDQ8Hm6R6ecj9/p1yjOYuqCrlb2KSC9rjoy
 1eBKP8gRZAYkYvJSnWMH0a9/BDlVHqgyQQHA9v8c86GDtCVoiGBK6w0nqhbhpFLZc5p6nNnsz1B
 PBX7KU6AW+TR3T7vjagfwTTy7Q7XAYfWBKT6+WmfAzJnh92BtfbXA1D/TbpJV7B0BuP7dzkz5eG
 pOL+pVYndNoZvmA==
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_121651_724228_481CE676 
X-CRM114-Status: UNSURE (   5.92  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fix unbalanced CPU pm calls and delegate the question whether the
cx pointer contents could change to the compiler.
During research for some spurios FPU issues, this oddity come to
light.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
Andreas Kemnade (2):
      ARM: omap: cpuidle34xx: balance cpu_pm_enter/exit()
      ARM: omap: cpuidle34xx: Constify state info

 arch/arm/mach-omap2/cpuidle34xx.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)
---
base-commit: 5fd8fdf561e0e6093305b6c993ee9b7c25bc8b51
change-id: 20261028-susp2-e2a9a2c9e71f

Best regards,
--  
Andreas Kemnade <andreas@kemnade.info>


