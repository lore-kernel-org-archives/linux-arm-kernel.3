Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E5DCD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LGhej1zV9SsScRnqX0ZxRNyVUgM2VwABqVEaCOKBN1k=; b=0Afrfx+pWC2ukeDpL/1dvcOGy4
	u4MQoXI63rjWiFZ3fMPlmwXGQThqmHyncV6nbqWU0YhnsP2oQ+TzFk3v+c2X0Uz1L9ScON2ofxr/8
	TVvvV0SCiE0UtfgBwNFBugdaW7+RDmGj/zYAjKmXtbWPS0SD/XJGBBnituN3dZgEOK61psKg+HtH5
	dQ26HF7kmWiMU3KJEso+u/jUzQM2w3Evcz1b8WfJX/eIY/6sByO+tZXky3crjdjM/7m3h9esypxPC
	Y1N4zgER5rr1M9LI0H/BobcJe7Q1Gnzgb9HmpDPGyaWT+NGwBOwHF2I8uZaF992l05VM7IuiifofW
	DNghH3jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMIa-000000020nF-31X1;
	Tue, 19 May 2026 15:24:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMIO-000000020gf-2lMa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:23:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 212F06020B;
	Tue, 19 May 2026 15:23:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5BC0C2BCB8;
	Tue, 19 May 2026 15:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779204227;
	bh=6yqTKhOzINRqxhgHIIHuzNNax6y9HoQqwecCU6JkSp0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q24e9pfv2KuKn6q3VH1mQh+3RxFrlaEyLK9u6ZPv0hPPxl9T3Nvcmvyhze/Vm77Uh
	 9XAo2VNImCcbnCi3jfpsVvUOcgGXs3LkoeMKuUF7BPvhVGx81SmTwECl4MTDck6u7m
	 xcoQ+rgt+2JK/daa0jsW+ZvE41fCB6flLEBO3jrEXbVAbnpGaTQwvvE+F2UDGOkig7
	 42Xkli385qZH+fiyEn7CipmNOwyo1KTsV55o1eyvrQ2s7aom5dcQsXXQQ3f0nyou2q
	 KeSfVx3zP/X7s+H4wIcpbyjZZ4ov1TCx6G8J+2fShBefLWJYtu0S1RFSqIyNYgaK3l
	 m/fkIUcXYpaMg==
From: Will Deacon <will@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	zengheng4@huawei.com,
	James Morse <james.morse@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	wangkefeng.wang@huawei.com,
	xry111@xry111.site,
	yang@os.amperecomputing.com,
	reinette.chatre@intel.com,
	thuth@redhat.com,
	ben.horgan@arm.com,
	mrigendra.chaubey@gmail.com,
	fenghuay@nvidia.com,
	ahmed.genidi@arm.com
Subject: Re: [PATCH v3 0/4] arm_mpam: Add support for the MPAM v0.1 architecture version
Date: Tue, 19 May 2026 16:22:57 +0100
Message-ID: <177919226960.822648.8647128359314187704.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260508162341.3762549-1-james.morse@arm.com>
References: <20260508162341.3762549-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Fri, 08 May 2026 17:23:37 +0100, James Morse wrote:
> This is a v3 of Zeng's series to add support for MPAM v0.1.
> Included are the changes Ben and I suggested, and a couple of bugs found while
> testing it.
> 
> I've put the bug fixes first as you can hit these with mainline.
> The patches for v0.1 enable MPAM on those platforms as this extra ID register
> was missed.
> 
> [...]

Applied to arm64 (for-next/mpam), thanks!

[1/4] arm_mpam: Fix false positive assert failure during mpam_disable()
      (no commit info)
[2/4] arm_mpam: Check whether the config array is allocated before destroying it
      (no commit info)
[3/4] arm64: cpufeature: Add support for the MPAM v0.1 architecture version
      https://git.kernel.org/arm64/c/5302bc1493be
[4/4] arm_mpam: Update architecture version check for MPAM MSC
      https://git.kernel.org/arm64/c/50a42e03cdbd

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

