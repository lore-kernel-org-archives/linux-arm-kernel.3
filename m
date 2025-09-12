Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E24CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 09:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LmafhAICvh/gGRdQhgiSg69lGgUytxA1oJDjGahIJTE=; b=dkasfa7rt48RDtF2L0+LYcNFwK
	DOYpqZO1cTpDcgvJlVnG0tz+4QY9v9g1ky+X/9NRJUV+zTOtYlJycnvqDJLe1aqrs7ZO9OUfVoKEE
	/nMrRpx2JjmtwZ+YU3eI6bHXdI7TnALuS1ivQS06UB9Xeons0fXN9eLaAjRWXOLvRU2Fz84HRnUTH
	SgWPpuwWTU2CTeuRkExu6tcI41lv2FMJ2s2/hlbz4A7HTMTntVV/havXprpaHcqBYtPFjy5BolvqT
	+FdqjJ/PHzZ8cLstxnfT8Yh9lKiDAUZrWcKavt+2bc0GQhFlnWgBqmar4lMhCeQWtIAhxxSThCNiu
	k+4aGJhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0RE-00000008Oio-0fYM;
	Fri, 12 Sep 2025 09:51:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0RC-00000008Ohv-2vuv
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 12 Sep 2025 09:51:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LmafhAICvh/gGRdQhgiSg69lGgUytxA1oJDjGahIJTE=; b=fNJ4MgJKai2hXhF83y290eRYPj
	aAvbbRA+pDpwsfDxsW1MUXtf83ttp9X5fVZAeSfo8nFfmg3H+kUtToQO4fAzEsLo6gHipx/sLX6yb
	4/7T6B5A0/Y4ogCXuEuSf0YJJlFboa1lONv9gpxvapcTTnCF20GBuPKiqLOS3HmBaD2uqPiMh1hLH
	Ot5Kw6FKYuJme1BTay1dKmtyRL7phCcNy0cO+zUQtwbIA9WwK79YhEhpp2sArIqtr4W8h/i7C51Y7
	roQm4HZqD/zMGgLWxyxzqLY6y2UjtqxxdCu09PsK9RX0HUln0ieWDtbi7PeQoMwd5e4AjYNVhSEYt
	TWqQGD3A==;
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0R9-00000006JYR-261q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 09:51:25 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58C9pKGu496054;
	Fri, 12 Sep 2025 04:51:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757670680;
	bh=LmafhAICvh/gGRdQhgiSg69lGgUytxA1oJDjGahIJTE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=f/Uce/ZGBlKZ5tln+ujWK5YkVDkUAasP58ovixIKjTXYQgzueVHKR32YZSBVfr2Pk
	 V9LUmtZkDBCuyrYbCt6yoq0VND1Ais995xJWXcPgPon//UPx6xOWTeu+Not9X9pS16
	 r/mURdbdLPFB2Mu1IVs6KK6ZmIOq1DKQ4Mj6ERqc=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58C9pKBY1776813
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 12 Sep 2025 04:51:20 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 12
 Sep 2025 04:51:19 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 12 Sep 2025 04:51:19 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58C9pJJn3414861;
	Fri, 12 Sep 2025 04:51:19 -0500
From: Nishanth Menon <nm@ti.com>
To: <vigneshr@ti.com>, <praneeth@ti.com>, Paresh Bhagat <p-bhagat@ti.com>
CC: Nishanth Menon <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <khasim@ti.com>, <v-singh1@ti.com>,
        <afd@ti.com>, <bb@ti.com>, <devarsht@ti.com>, <s-vadapalli@ti.com>
Subject: Re: [PATCH v3 0/2] Add USB support for AM62D2
Date: Fri, 12 Sep 2025 04:51:14 -0500
Message-ID: <175766786895.26001.8838411000303413799.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250903062513.813925-1-p-bhagat@ti.com>
References: <20250903062513.813925-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_105123_826904_61E160CA 
X-CRM114-Status: GOOD (  15.25  )
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

Hi Paresh Bhagat,

On Wed, 03 Sep 2025 11:55:11 +0530, Paresh Bhagat wrote:
> This patch series introduces following changes:
> 
> * Patch 1 fixes the main pad length in main_pmx/padconfig for AM62D
>  and AM62A. This also fixes "i2c 0-003f: deferred probe pending".
> 
> * Patch 2 enables USB support for AM62D2-EVM by adding pinmux and device
>  tree nodes.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/2] arm64: dts: ti: k3-am62a-main: Fix main padcfg length
      commit: 4c4e48afb6d85c1a8f9fdbae1fdf17ceef4a6f5b
[2/2] arm64: dts: ti: k3-am62d2-evm: Enable USB support
      commit: 5cd40f33273bb41b5eec763bcfc7c9b2e9fe2e64

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


