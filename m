Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BE4606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 16:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yKwk6zpD;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XdZujaRj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0neYk5YrzikJjtW8ZXq29ALRyYZ/j0M4VHLdoq0EH3s=; b=yKwk6zpDGew3lw
	1EXDqO2Q8VkpXmXWe3ziOmi+El2z06K9Xa80oR4ubfmOBYh4OrJ+rufoRdgnXKRmIGRK7o4BPErtN
	ZsiT5se510WujuQT3vM/2dZ0tZ7g68VuM/3UuyEJBxSvcSaGID7iecsWPTOSiJJfpMHrgEi62toQ7
	8O5qRbOnKGq7JenmjEU+nEn4aX+CgIV7GjM8gPP5USVGydgZJB7M8sLLr8+dND++Jc7fIqeuVIoZy
	rUTvjtmzy6Um9cucgvRsoBTXsjyuXyRyQZbRK7pq1MPaZnIdX51q7bRj348l9Psa7MbsHg6+dfhlp
	wqvGgj6X7s5BJ3CZuw2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLk1A-00000005M4k-3l1J;
	Tue, 27 Oct 2026 16:27:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLk19-00000005M4M-2jE1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 16:27:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E3BF41572;
	Tue, 27 Oct 2026 16:27:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98FC61F01825;
	Tue, 27 Oct 2026 16:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793118439;
	bh=0neYk5YrzikJjtW8ZXq29ALRyYZ/j0M4VHLdoq0EH3s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=XdZujaRj4O5z8foVBYdwhtk7pEGZ0SMFB+QidK1Qx8Fx7eUnjLyrXUkfs3YwZdzaO
	 AIuoyY9s5ByV8uDtnz7pL0yt75d1psMuK1r3gvEjRULw00dcw5Bi0KxgG6CDv9CdBB
	 lAPO/auka0BC0Rxv+lDjicwtqAAgnrs4SON8K5RRReQDwjB0a9DOdMpkEr4XVnecrE
	 0FsGqAk6tC2ajtJtYA2AjZQusgzf4pIu6xYsZwefsCYs5Pb6NJ/DlFSFOL3wyzzocf
	 I8mFGtPZTDbQabMkM2maMGWem7yM7pHoVHn23lJyF3M51RQyoxq3O6xWInuyCtddK6
	 n4lnbOiCU4W1A==
From: Manivannan Sadhasivam <mani@kernel.org>
To: linux-pci@vger.kernel.org, Jeff Barnes <jeffbarnes@linux.microsoft.com>
Cc: minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com, 
 lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
 bhelgaas@google.com, Zhiqiang.Hou@nxp.com, 
 easwar.hariharan@linux.microsoft.com, linuxppc-dev@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20261008173641.199142-1-jeffbarnes@linux.microsoft.com>
References: <20261008173641.199142-1-jeffbarnes@linux.microsoft.com>
Subject: Re: [PATCH v3] Revert "PCI: layerscape: Change default error
 response behavior"
Message-Id: <179311842858.16692.9389173908526877581.b4-ty@b4>
Date: Tue, 27 Oct 2026 21:57:08 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=350;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=oSZljKFgqNZT5ufuzpZRuVDIEd35DWYMJ1TbziJ9xds=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq4NDgZ5zady26m9K6haj/wBnaklC2m6VON1Uth
 fthEm/97AmJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCauDQ4AAKCRBVnxHm/pHO
 9Rg0B/0Yp4irU5NLfav7GFd57ZBMTVchSr4AOx/QhQT/NYiTpWZbAXk3PqQ+jiDyz6ve1sACZcb
 FIik6/0SbB2ZHYg1vpCv+QvsGauCZJkRCpE/LgYO1EcILA5JuIH57hoNl7Fs+Mh3H7qMSGv1IsE
 FBhn5M4BFnz87Y882zs/nUXVmlLRc90xr08qKclMYfJzlv0m0l4hrtfdyY5v+Z6E/15HVuKxTNS
 YzwOzzj7rETJVPX04kItadmv6KoQGSfYCZOEF2o5gdlTF/YfQg3cuavMRHDMFxHSa0BWMHTbKtk
 ZlAgEgsj6CoZVQ8ZeG14PtPR9eX2G2DuV6jeEGI+vzN8aHQZ
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Thu, 08 Oct 2026 13:36:41 -0400, Jeff Barnes wrote:
> Revert "PCI: layerscape: Change default error response behavior"

Applied, thanks!

[1/1] Revert "PCI: layerscape: Change default error response behavior"
      commit: d981c566d283ca074df2e485078b369cff088349

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



