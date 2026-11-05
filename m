Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3F6606D807
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 15:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UZfGMwr2;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h4FefPg/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ofpeVWI3consGDzBWqgjB78mylADRIbQBjF1c/ZhASw=; b=UZfGMwr2rP618r
	0LYg+OKz+V60XIuvDrlO+E24Sz3I562zwNnFsyfU0AB5atyPai3EXQgd3paY9JY3qbIkvGa0uhqTn
	YezeX+Q4WgtUdlqTaGlPrxd+55uoMgoNr8aJWUrRCKl2w7DMCNs075xHSMClTDYDN7Xe8NG243jd+
	HJs+K3z5bXLTxgc29NeAmBefEN29qiMy+fs1iwNI2xOhsKBAJl7gIhiSDX/FjZEQh9fmOA0mtGwFY
	ySPBDaaLwrxqD7934e3PNLfbA838fdIyizvpduL2llKE+0OQFAYt4GWmUd+a/Qe7HuHbLz2OhoH4C
	lxgGvvuaSPclXER+5rwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzgK-00000009RQK-3S54;
	Thu, 05 Nov 2026 15:47:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzgJ-00000009RPu-3C62;
	Thu, 05 Nov 2026 15:47:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 369D56062A;
	Thu,  5 Nov 2026 15:47:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B5771F0093A;
	Thu,  5 Nov 2026 15:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793893634;
	bh=ofpeVWI3consGDzBWqgjB78mylADRIbQBjF1c/ZhASw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=h4FefPg/tCKfPxSNxbyzPRZaXt1/xvRCcjqzNiVIlnWnpX2M6KY8sfo+UcynUXX0f
	 3UVQI7oIKdgTP9qeDN1bCi759hX4PmzikSt/fGtYGAxEQ8wYmneKz7WGwhgTa7gUQa
	 BL3YjPD/sxdR1PLFV8U/ZzJLYQiong/qcZNQlxoSNUTB1E9qBUAt5585VTHKuYCsub
	 MWBY+MKhM7NRdvusgjVsuB0A+5tAqcLYvvdzDwQlb0F7z9+eHmmKlX1stdNFqA4+L5
	 GkFM1vM0bESYfsSH0wWbrRMLW6a41afoWRHCOeDnjepj2aAUzZq3GKvNtm0OZPXkNG
	 dUElBpUJoIBsA==
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: angelogioacchino.delregno@collabora.com, bhelgaas@google.com, 
 kwilczynski@kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-pci@vger.kernel.org, lpieralisi@kernel.org, matthias.bgg@gmail.com, 
 robh@kernel.org, ryder.lee@mediatek.com
In-Reply-To: <20261028113453.2599-1-sreekuttan2156239@gmail.com>
References: <20261028113453.2599-1-sreekuttan2156239@gmail.com>
Subject: Re: [PATCH v6] PCI: mediatek: Fix integer truncation and handle
 oversized resources
Message-Id: <179389361906.20463.1092137538074974205.b4-ty@b4>
Date: Thu, 05 Nov 2026 21:16:59 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=362;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=/1VoRA0E/iREIYQ2KlRfA9WVvI28uaBTMEbmFin8Rz4=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq7KUBL9pngpeeZERhCqQgGAZZWRNID/qto5z6U
 BAN9sYMiQeJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCauylAQAKCRBVnxHm/pHO
 9UIRB/0cfs+uBOQN+I4FfZQqp9Y9Zm1HUrlhmtZ4uf7IUrC53DnL/ef1ErkkHDfA9y1Tufx/8w0
 xXZpjOvnOKFIE2WNMa7Ugwsa7oMuB+4p7PbqLEj91JdPfngrBdrOvOSGG9G31tGnJMpL2vO+ejt
 dmQZANpReW00TBYvu8EAE1MHptSsgQdzXFYj0yvWi6hW9it5NedZkzvDgphvEYSi1z4PgJcVk7D
 1C85TZQ3fYLZYFvCo8zj94mjWtNX4cVXwzS4q9nABWav0YWQRiuwPWhmPWAdR7BR023XV3Fpvk/
 01AglaQHIMq1hCblhGcj6hHgY2ZBb+uALmbE4YV9WybYywF0
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Wed, 28 Oct 2026 11:34:53 +0000, Sreeraj S Kurup wrote:
> PCI: mediatek: Fix integer truncation and handle oversized resources

Applied, thanks!

[1/1] PCI: mediatek: Fix integer truncation and handle oversized resources
      commit: 0abd664998828adc30df21c1ca052d3a5de910d9

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



