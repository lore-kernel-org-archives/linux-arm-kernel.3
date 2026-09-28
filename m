Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6687FCA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 22:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9MPDcqcdVPxLHwAEsIz514gjGwXbAqqJQTEEaOtjMO4=; b=iPoc7WJs7pHwfFv5O6FY4oz4Rd
	XRm31XdcCJFH+ZkhyGoYrVYDcYbunwYgO+PudxAdk4OAV8aKofu3NPyaKHIVAj4jqY814pnifEjK7
	eV+UhRHa25BT511eCDAN8tv37kIGgoQrKWESZLCGkCDiF15g1yDk9guyRxVK/Ml0/uImwRXXokx5w
	kNFsRquT4bndmzRvXIYsdlmnyAXj7rksN12Ntvx6oNi1pV+pUaTOTZ+NN0tul1cf9jrN5+2r2BbbL
	kpx0yKLqme4DPE6K8rKBUeL/h2SDpx6St1qhn9zNk053T7MQklUFF7HkrepOXF2xxt4OGyhQ30roy
	3nPEPZdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBJq6-00000001kdh-3CIL;
	Mon, 28 Sep 2026 22:28:50 +0000
Received: from fout-b1-smtp.messagingengine.com ([202.12.124.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBJq4-00000001kdC-0Vql
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 22:28:49 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 7BE121D000F5;
	Mon, 28 Sep 2026 18:28:43 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 28 Sep 2026 18:28:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1790634523;
	 x=1790720923; bh=9MPDcqcdVPxLHwAEsIz514gjGwXbAqqJQTEEaOtjMO4=; b=
	j3wTQjhTxx52qxsu1bMl9sKoMbMl1BZnN2+NpHHsZ1BT1YX0ehYUiK+LN6iVE063
	3S1nhAJxVe83MoBpHjPj7GgMuckze7YcDr2ou8eq5SZUFeiHo2cDGZrWmryik7Ug
	2GcUmh10FNCI9nPAXfwliw/MwL7C9munsoXET0YAyTaSrxtuLCudZPGVk/ljg9eF
	Fg4Md0EtUhzkvATPsRMG1STwkbwXdVoycpy2lwQUmixG/wWvuHRsUCUGdzaI99Rb
	ljr75nX+RM5LGjZ4kqxe59u5FVZVGUxh+yDSJ3rdZgbZr9XO9gRY/gwKL/XBYtDX
	51Ge7V3EcRiYZH0mlJdhXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790634523; x=
	1790720923; bh=9MPDcqcdVPxLHwAEsIz514gjGwXbAqqJQTEEaOtjMO4=; b=E
	Wj7CksjYMwdPK8xmqIDeZ54MgQKToCMAwtXGQnbdFgizxPZEbaaCRcOwRKhbLkvf
	WWQO0ySQW0Q50JWuP41HcANiYfqSfAlGcVvdUngsv946b3zoMHO373s8LnIcWId1
	lruw2cmo//rKffEaK85yShp9HxKkz2gPFIaW00nxaXidasZ2v8WninLDGEGpIkCT
	XKYo0UeT9m/Md8S3J4LFin3vyHova+adSRIOcM/VJjh8Wm7zAYNjWS8qJUvJYGOq
	4ROh8NaCZB55hb8Wn6spfS8sPAtRPJ5INVzAWrotx/mU7papQsS07ciY1CK/OMxw
	2/CyIUvDf85bEGAhfv+hg==
X-ME-Sender: <xms:Guq6alx2AwZECemahxNwQPKZ7z2_KexZDXZep-GdBOy7y9lt9eKJMg>
    <xme:Guq6am-o_CPnO-6avvxCwsvF3DQeaU7YHlzI4jOH_Gr2BphmbvMuajDKqUBoRegrH
    ObMBuDdJbvm6JIy5sH-zZE9dmTJPHjMm-5Dwd33S9Z1dZ13LCYB8BY>
X-ME-Received: <xmr:Guq6aiwiOtcexKnuJj_2UZ1VkvwSmIzme9mbKJHqYV22rM-iKb5ELfk3eadttg>
X-ME-Proxy-Cause: dmFkZTFtelLzGYVdByzqF87ZFqdfB2mHNpYaUcMvT3rUJICZTimYyNFKN0gvw38v8OfulS
    V+LtKiv9pTdKAJkxNact9rNtRfWcp1ZGRLo4EiS7QK47poRep96qaNDx+k6VLf1aCP9ajp
    GWmIqF5zmAislVGo3WAhg9qeGF8kjw6J+atOHc9LOkjvP7htlA1d3beVjPXdbRSDFuWPTA
    EZxQlx4IuRccXM0/a9U+aBKw7ikA0m6o/ohVm1qZUYvBgIzPJIcNlZadEAp4dVzTaJwS+w
    GqjOfEWO15mdHZS2k6h2kgUs6G4fLmoKfmzbX/9m5D2PJV5Q2VMghmHV5RYGgbv2BfLicD
    RiuG3VRpRNoyntw+Dl6M04vackSXZ88Gp/Kv/qDC1sqzEdnB7MqH7e31vaYP37e587LiAv
    jL6xJ1skQVPk8FSKPEByOnYvqa3tVOYH2oua34FfOtXwLHUQpV8tx3Z3cu1oJSmL+hCOoR
    ZRAL9ObWl+fdooqw/6hxw1SoTYJuStMAq7isswv8fC59VOXq1G0vRuMTltm2m52iUXn9Zp
    dFZ4tzCir3cHpBVykLjIDXnFS5qC25visDUh6ehKSgADHqM1s2ktp9CrNTJ+m7vt6JjapV
    mgpeSq81kVD2g60MTQSU60KQNwJZ4DBESmWvMzhcEgokS9EvnwdHMR7FHtMg
X-ME-Proxy: <xmx:Guq6anUKc-C8WE-WKXQPOmycrnrMSdVJRemt4J2GHIHz1HXivqoHLg>
    <xmx:Guq6atbuqApBLPkF6syEogeopjD3l2-LLL3UJmVVRlZe0BhYquI_oQ>
    <xmx:Guq6akR0rDJQQdbvTWSWxhBWyH5wuswX8TXhlJQh7uo46aIlGeUSlg>
    <xmx:Guq6atSfagFSZAJcoRygzwN_UhBzo1gyKK3Dl1y5UzFps-oWKtl6Pw>
    <xmx:G-q6ai7wgQ7FDkIe0PnIuexj2YKVBzji4IlLXWlWk_2uxff7tT7h7M2Y>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Sep 2026 18:28:40 -0400 (EDT)
Date: Mon, 28 Sep 2026 16:28:38 -0600
From: Alex Williamson <alex@shazbot.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: David Matlack <dmatlack@google.com>, Fuad Tabba <fuad.tabba@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev, Leon Romanovsky <leon@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org,
 linux-rdma@vger.kernel.org, Marc Zyngier <maz@kernel.org>, Mark Bloch
 <mbloch@nvidia.com>, netdev@vger.kernel.org, Oliver Upton
 <oupton@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Saeed Mahameed
 <saeedm@nvidia.com>, Sean Christopherson <seanjc@google.com>, Steffen Eiden
 <seiden@linux.ibm.com>, Shuah Khan <shuah@kernel.org>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Tariq Toukan <tariqt@nvidia.com>, Zenghui Yu
 <yuzenghui@huawei.com>, patches@lists.linux.dev, alex@shazbot.org
Subject: Re: [PATCH v7 00/10] mlx5 support for VFIO self test
Message-ID: <20260928162838.44dc6abb@shazbot.org>
In-Reply-To: <0-v7-c6d30e8ce1e4+3dfa6-mlx5st_jgg@nvidia.com>
References: <0-v7-c6d30e8ce1e4+3dfa6-mlx5st_jgg@nvidia.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_152848_515292_827D15B3 
X-CRM114-Status: GOOD (  24.11  )
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

On Mon, 21 Sep 2026 19:35:40 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> Add an mlx5 driver to VFIO self test. This is largely a remix of the
> existing VFIO mlx5 driver in rdma-core. It uses an RDMA loopback QP
> to issue RDMA WRITE operations which effectively perform memory
> copies using DMA. Since mlx5 has a stable programming ABI this
> should work on devices from CX5 to current HW. The device FW must
> support the QP loopback configuration.
> 
> Also support send_msi by arming completion events of the RDMA WRITE
> to trigger MSI delivery.
> 
> mlx5 device startup is very complex and most of this code is just
> booting the device, with a smaller amount for operating the QP.
> 
> This entire series was coded by Claude Code in about 4 days. It
> used about 4.5M output tokens, 30 individual sessions and 5600 lines
> of AI-generated .md files. I spent an annoying amount of time
> de-slopping and cleaning its work product to make it presentable.
> However, previous VFIO drivers have taken on the order of 1-2
> months to write, so getting one in a week is pretty remarkable.
> 
> For those interested, the flow I used was broadly a prompt sequence
> sort of like:
> 
>  - Hey Claude, go look at the falcon series, VFIO self test, the
>    mlx5 driver, rdma-core and some PDF documentation and make a
>    plan to put mlx5 under the selftest.
>  - Write an rdma-core application using the built-in VFIO provider
>    that can do the required memcpy operations that vfio selftests
>    wants.
>    (This resulted in a 1k loc C file that compiled and ran the
>     first time but had a few bugs related to device programming
>     that the AI resolved.)
>  - Replace the rdma-core components with open-coded versions to
>    create a fully stand-alone program that does the DMA memcpy.
>  - Review and audit the thing.
>  [Pause and de-slop it]
>  - Make it work on a PF too (this is surprisingly hard!).
>  [Move to a kernel tree and copy all the .md files and .c program
>   it made]
>  - Hey Claude, look at all this stuff and make a broad plan to
>    actually build a VFIO self test.
>  - Here is my 1 sentence advice on what each patch should look
>    like, make a detailed plan to make a patch for every one.
>  [Pause and polish the patch plans]
>  - Execute plan X then commit it [pause and de-slop each patch,
>    repeat].
>  [Review and final polish]
> eeb2cc76b0b4
> v7:
>  - Fix some compilation problems, kvm and the igb

Applied to vfio next branch for v7.4.  Topic branch published as
mlx5-vfio-selftest-v7[1] for conflict management.  Thanks,

Alex

[1]https://github.com/awilliam/linux-vfio.git mlx5-vfio-selftest-v7

