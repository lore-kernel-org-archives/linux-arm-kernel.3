Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD4ECA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 09:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LO6oQYvzd+j6JJ+27I0KVimve6UrPTkIHXhZD5Zibfw=; b=Cngc0twOghMlbh8OThzJjjVfX6
	Q2bXU79rLQxVAVH5KhaNyF3ABPxoQqjQoiljUuK8PDVzeZVVs/m0lf2Z4GZhD7gzdckCQ0F01n2Fp
	kguL8GI6HV9UDw7iXxux9xFlO4FS433K4ZNDMBA570UNDIvZ0DzhSGz0XgccyxnEHDpvuQpKT429Y
	4FPR1uwFjKrFbWtKXvBu2cwqQGkqc6puLuTxCoZlXkL3HwxhQGLvPga8N2czg13R4fe6QAorPeua5
	FDpwt2/0uP8PYShAnwKArvt4Xbf9da02srFZ5U6DGzub2u6oDT0qHncGtv5pIq5D4izhOUaKfJDq7
	5Sct7Qsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0Sq-00000008PYb-1U3k;
	Fri, 12 Sep 2025 09:53:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0Sp-00000008PXz-1Z3b
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 12 Sep 2025 09:53:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LO6oQYvzd+j6JJ+27I0KVimve6UrPTkIHXhZD5Zibfw=; b=Z+O11o4oJN8ja+3uE/jxR+/EMG
	TSTYwwDFSYxns9uDG8fgTa+B9d2fpXSE60Wbuc+TPKWizPtv49QB3m+/oAETf0LpoZp047TlUjgDt
	F/uGA3OnPGMoz9ScSDHt1IHal7g0gZtMSfE3VaRd6Xw2ptIjZDmoTROqRVZ6ml7OuDlB5ZIZzddS6
	BtQJBqImtCGK/ThY6gUhO+Alfq1l1DWVrxVfXg8DPsV+RxP1YZcX1noZlO0VYy6Q6XLUoZIaJPw9X
	SYz6H20yjPYsZcaG9IUurYpi4kfOX0a/qocxR4i0uX0bkKfMbHgQaVqsQ/lSYeSpWD/EGbJ7TNR0l
	cCMjtkqg==;
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0Sl-00000006Jl7-22FL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 09:53:06 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58C9qxr01008759;
	Fri, 12 Sep 2025 04:52:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757670779;
	bh=LO6oQYvzd+j6JJ+27I0KVimve6UrPTkIHXhZD5Zibfw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=AHbERkDw3FV2IixdDYbLbm6rtAF8UL0ALN8OSq8wJd8RKU6KYs3+ez/i0emeOA1z3
	 No4x1rmeaobpjNs07qFmpTtStzUAknd8Q2NezETovu1YItCc+SRZMxubrQVg26X5dE
	 YdSGUPmPXlAhd1pLyfMondkqLfcbWrbtnCm87CzM=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58C9qxLS1895849
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 12 Sep 2025 04:52:59 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 12
 Sep 2025 04:52:58 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 12 Sep 2025 04:52:58 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58C9qwTK3416131;
	Fri, 12 Sep 2025 04:52:58 -0500
From: Nishanth Menon <nm@ti.com>
To: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        Wadim Egorov
	<w.egorov@phytec.de>
CC: Nishanth Menon <nm@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <upstream@lists.phytec.de>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am642-phyboard-electra: Add PEB-C-010 Overlay
Date: Fri, 12 Sep 2025 04:52:54 -0500
Message-ID: <175766787263.26980.13993594214350390779.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250910141716.2133707-1-w.egorov@phytec.de>
References: <20250910141716.2133707-1-w.egorov@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_105303_912052_87D3E644 
X-CRM114-Status: GOOD (  12.68  )
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

Hi Wadim Egorov,

On Wed, 10 Sep 2025 16:17:16 +0200, Wadim Egorov wrote:
> The PEB-C-010 expansion board adds two extra 1Gbps ethernet ports to
> the phyBOARD-Electra-AM64x.
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am642-phyboard-electra: Add PEB-C-010 Overlay
      commit: e53fbf955ea7753ef7970b866ca229abe32d5639

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource


