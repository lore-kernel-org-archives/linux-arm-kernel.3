Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE954606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 07:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BIE7UAtf;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ofhfZw26
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kaQKtpGNCV3VICS3ZoD8AqFxMAdg5Nt2CMBhCVVlohE=; b=BIE7UAtf7qGkGF
	gkxDiUyAZkZUZBE2RcG5TUFqBE/sB0QgpbuwJYdskqaG87GaaL0sP2VjFXivvhne2rgHMf76ppBqH
	00ZHrRMAoRuXlgOipcbBQaHxXCH41DuqF8zyQXS9Skt3ugISdkVwZQ5Y9M2AjSyLWNWqs3tpfcWTQ
	hoWkOBXFRDTAXxtn1vs4dc9Pgo2aBsXsjvaLzP7GpfArVacj8xHwPtbNWchFDXlru8APnEqo2lUPD
	3/vEiKBoRlwvb4vyVY/MAbmJK+MgvKnhf62PK2YbS31CUrQkbTsTRNBgeqzjpGM6M7+M9FYaUsJ1j
	KuxIi4sg7cmfA9mNFGYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN3W4-0000000D0Mg-101S;
	Sat, 31 Oct 2026 07:28:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN3W3-0000000D0Ma-2c6p
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 07:28:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B7B6436AB;
	Sat, 31 Oct 2026 07:28:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A399D1F000C1;
	Sat, 31 Oct 2026 07:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793431719;
	bh=kaQKtpGNCV3VICS3ZoD8AqFxMAdg5Nt2CMBhCVVlohE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ofhfZw2663YnNtfsO7hGUQOAyvuyLUOnsqzxsSJ3EvypbjndpAWYxSqDc0N89ipl3
	 n8K03ndZB/Buk3NgtXpyEt1uJ5XrGw/fiZbYidsX8gTZcQLOKW88cKrtK845KxvaHS
	 0OjO4gU9PYnwFtKQBki4g3Jl+EakLu/m+/qeL/TBt7npm7KAud/FX2ZRz8OhxUjcij
	 n2ADhzXythhkHw0dUTlMB4qmQntbf1mcs477Hf4zwoxEAFp6VRcdZ4FQAu0Nc/+Hdc
	 r9+UF5o2IGTxXDgIVK46ED2x8T0uyKLAc2BzN1FMswNdl5Y3W+P26m/qSid1ycrcUd
	 eOOvNmkIHP6wA==
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Semih Baskan <strst.gs@gmail.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, bcm-kernel-feedback-list@broadcom.com, 
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
In-Reply-To: <20261019065249.552-1-strst.gs@gmail.com>
References: <20261019065249.552-1-strst.gs@gmail.com>
Subject: Re: [PATCH] PCI: iproc: Skip BCMA-attached controllers in the
 platform bus driver
Message-Id: <179343169507.4244.184173926392440151.b4-ty@b4>
Date: Sat, 31 Oct 2026 12:58:15 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=361;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=r8M8RLNtFCfKfZyDz6n5ADB1vpME3zRi4JkGfSuPlEY=;
 b=kA0DAAoBVZ8R5v6RzvUByyZiAGrlmJ6gHmvVVgi3wmfeP477tjOsNZDRxs7Xt+jN6SO6NTxIi
 IkBMwQAAQoAHRYhBGelQyqBSMvYpFgnl1WfEeb+kc71BQJq5ZieAAoJEFWfEeb+kc71DZUH/j0o
 7LKG2vQQSrf/oLw9G0b1Qyks03kQeytg+Cjj5a4mOhpxsRkUsZGx4s5I1SfndfvKPRIxyqpOs0F
 uHPK/6vKGPXdk3Srixnd9m7aHPmPW2TvmVDkTc4zdf2O9Wu+xtv+x3sn5knRc96ct3i7xcMCth2
 hJ6V2qHvt8UfncrLSjmrhrkHhyoBmY1apesbV4NaTb+Xvw4cTImBZOFa7Mv3WRhO1ib21IafilN
 Kh02UQcSYU7m5FVYhWFF/K+s8UZTrD/7dcB/sbRmTB089wVeW37NIVhjWr4XV7neZLfaQUQ9/DD
 v6F7mvuyErISEnMT9tigcVXzr+asGa5J1A8aZ4w=
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Mon, 19 Oct 2026 06:52:49 +0000, Semih Baskan wrote:
> PCI: iproc: Skip BCMA-attached controllers in the platform bus driver

Applied, thanks!

[1/1] PCI: iproc: Skip BCMA-attached controllers in the platform bus driver
      commit: 4d3e0b32afedfcbed5f1e38ddec035af545e64ef

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



