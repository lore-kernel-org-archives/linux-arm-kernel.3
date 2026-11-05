Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C46606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 05:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oFmvwDrU;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ssgp8SBv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=; b=oFmvwDrUtyx0RvEdfTihSd2Zxz
	IKQ5GO9X+72FwZirsvowsOcf7PV7HyvV8WSXjlzV+obo3bUb7c183s8w7mnwPqmpdY1gbJCgl4VzN
	RXyPEMuacCTcC00IsCvrWr3o9LfxiIkYdK8FbKBSYXUOhsxuXpc8ONCrKzQ6L0XSg2zC+PfzHtNC6
	ART1nkCSZDNVOeoriPDr+dmfJCNQMQtJovrNFM6FpX87jQ1B40S2zmSfJaumDxOsSPIoDeT6g5zSb
	uEa/X3JwrA65Nm5myI0qmTzvcxKLsf15SOtQ8gypLoAkEfiEhsWtWJNYSimWJboVp8zOKDFqgLhp6
	JM3TNbVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOqGq-00000007tsg-29bo;
	Thu, 05 Nov 2026 05:44:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOqGp-00000007tsa-34Gv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 05:44:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C80EB601F7;
	Thu,  5 Nov 2026 05:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D6581F000C1;
	Thu,  5 Nov 2026 05:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793857458;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ssgp8SBvXBQddBD2jD9EpGEOfPT1JS9gifrz8qeuurJw3+MdiE3RzGB3jCQJACkf4
	 s3+v9ZRC7T1g1VjrcBcCHg9pYWZJRMMk+nmHqhr/SIpSvtkZt5G7aU72sqHWF0k9bX
	 MPAKLtGhY6AY+Ev0Okb88CtKbuGCxRturKr6o6vwvN6WChnp5BN/OoxGZT8W7gJBQz
	 Xu8sMv5D4rsaTaUNBiA/cRSOMNDlwA05+f9T7AplIrhw6XX4Th6d0aZR2uUs1CFIBm
	 lwwNcaYpuGaVzxsSAAVO/8iafCU8gDCm2OpMsOqx6Fs/B8JuRJOyuPzHZATG51RXE8
	 qzQVgV/FhMJUw==
From: netdev-bot+sinfo@kernel.org
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: netdev@vger.kernel.org, kuba@kernel.org, maxime.chevallier@bootlin.com,
 ansuelsmth@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, ast@kernel.org, daniel@iogearbox.net,
 hawk@kernel.org, john.fastabend@gmail.com, sdf@fomichev.me,
 faizal.abdul.rahim@intel.com, noor.azura.ahmad.tarmizi@intel.com,
 yoong.siang.song@intel.com, rohan.g.thomas@altera.com,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org
Subject: Re: [PATCH net v2] net: stmmac: Disable queues before
 netif_tx_disable in xdp_release
Date: Thu, 05 Nov 2026 05:44:16 +0000
Message-ID: <179385745676.488859.15047270659834143749@kernel.org>
In-Reply-To: <20261105053916.22353-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20261105053916.22353-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - How the issue was discovered, e.g. hit in production, hit during
   development, syzbot report, manual code inspection, LLM or static
   analysis tool scan.

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by code inspection). If it was triggered please include
   the symptoms, like the stack trace or error messages.

 - What hardware the change was tested on. For driver fixes please
   mention the device (and if relevant firmware version) used for
   testing, or say that the change was not tested on real hardware.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account. If the series needs another revision for
other reasons, please include the information in the commit messages
then.

The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.

