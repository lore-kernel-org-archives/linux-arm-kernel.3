Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07DA8CF6BF4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 07:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7led787e+i2vaUrT8azQ6vTdLjYtlmX3vdFDoIZF9nM=; b=xvLwlPER0Dmjwguv9caw2a+RpI
	dj4to5SnITrmS0Y+uAW3YguScSeUGOKLLONKl/SRBXePMSW9lIfRPLz3R1sV67Av8sFsPn2t7BGCW
	+XmSCtARnIJYSxny0qXEyLh0gq4n9ZabxfcvG9YhsgYTQc4Kelmf8Gg5BwStICiZphlraatErAQBF
	ECI4D5t0EUvk+7faoV9aUGiMnQXjlv6Hi2TYp2q04G81e+zeY/CWX7kzxlLqSXyPwKKLOQtep9/KV
	ZpFdliHqORbDDk1xSCKXgsEkL7+GpWUyPhyMFlGChfGiD0H6wEhesnwinEN9xJcFK+MSeKbi9cqpx
	180LYuUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdODa-0000000EJL3-32Ic;
	Wed, 07 Jan 2026 07:44:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdODW-0000000EJK2-2iOR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 07:44:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 338C844082;
	Wed,  7 Jan 2026 07:44:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE5C8C19422;
	Wed,  7 Jan 2026 07:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767771870;
	bh=h4Km8v2AhofaUc/W5nIkW152feKKqdxJCoedk4XoDOQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QE+G7R1lUiBUQxxaWL+qLZItDP8TmCGLohvtgFhJLQ+ufUxk0ODDxKwnoEjveZJp6
	 Q7aX3kI7BgXawDTFUQjfAbGhMZr0mC0vi4o6hLsgQIONztbGLE2nGyeBWV65pGQF3L
	 Ow+V9OmhNIP1C7NN+nuHljlSg1ISmrdznvA0zBnXxwYahq1xVfwkrDQg6aBbVNJrN3
	 RJ9AK9Be+JuO5I2LmCJAveF93NkQEUX8jJ0elBfcHJ+etlbFbwXcMXxJuvcfNBiDlG
	 wmS9grbJSnurgmfwXcNDhB+7IYdKueREBvq3qu2W8G9mKPn0Ahmh329PyFn6TLJslD
	 vX9nRLqjwxIRQ==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Christophe Leroy <chleroy@kernel.org>
Subject: Re: [PATCH] soc: fsl: qe: Simplify with scoped for each OF child loop
Date: Wed,  7 Jan 2026 08:41:52 +0100
Message-ID: <176777167466.2143957.10187953098162634507.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260102124754.64122-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124754.64122-2-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=379; i=chleroy@kernel.org; h=from:subject:message-id; bh=UPZwj16OmC2X1hC/O9OcQ9FKR5YSJ2CGmCS1YrmwU5o=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWTG8fmo3O7nvLam/o37j9guxYjue8vNe9V5Vh9MCQ9z2 zWzZfqmjlIWBjEuBlkxRZbj/7l3zej6kpo/dZc+zBxWJpAhDFycAjARuZ8M/2zF73LVylnXVOqc XvLqyuYdaotbqvYJyiVXzIiSvcCgl8rwV/T6rwm+G9+LPNGcfvTWZKXkJ9ULkjf2SJ3nkP4p/69 mJgcA
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_234430_703437_56409F26 
X-CRM114-Status: UNSURE (   5.91  )
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


On Fri, 02 Jan 2026 13:47:55 +0100, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> 

Applied, thanks!

[1/1] soc: fsl: qe: Simplify with scoped for each OF child loop
      commit: 66a4ff38d7b213a1278840a754c6d357e7745b24

Best regards,
-- 
Christophe Leroy (CS GROUP) <chleroy@kernel.org>

