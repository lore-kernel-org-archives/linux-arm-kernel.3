Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A8DCCA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ao4SsCpXghJoETajbL4QQtlV/wE1QaimhHTfwdSMGMU=; b=ogBBv2Q1fnBLa3gLOU4LGJBbVt
	3VQb0ynyN889hJY5JEljVP1jntYUd/tucZctn3Eh3ClPoqSwgPH2lZ+4XpaVhwsXj9oax87JaAGNh
	Ck67/pPGQljY0AT8P5x7Ho57sJF+hctbpu2Exl/LFsYwg+sioi1zYmIBoHofMMzLAxfhjqyKZIZNh
	h9r4e3lWSSrpMQY+IjWlMNYzO/kF68lHmBPZHmozcpyLiusJZ/qb8lRRJ9chzklrx9ANJo1FolMKS
	Qx8qFCzkgDMV/A/cdRs/UJnZkOpeR+4m/AUqzu4PJTSlDgnUSNdn6oZN9t3nJ1wF17xtAWlTb55LH
	j60Tw0lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9lB-00000007A3v-3zBK;
	Sat, 30 Aug 2025 00:48:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us2A2-00000006Qsl-2DDb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 16:41:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C8BF45195;
	Fri, 29 Aug 2025 16:41:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0F0DC4CEF0;
	Fri, 29 Aug 2025 16:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756485670;
	bh=QLBTv41xRWK0HCpldcOBdeOLxGpiyGcqZujmArx47Ms=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Q9Os/lNcdCf4Uzum+cE3j5nXRy5ZscRCZhEdoSLsjWAlzWo9hN3BUUwsrbE+HIhde
	 hzI6DH2mawBbExNEvyx5ZpAvZWPfbOB8ALucuFuUY9/L0nSblX7ZT+T5xOvj3w0iHV
	 H7Xq0++BaGEoeeZVgR5ndkpLLCvyXBztp7ZXLymUKxS1iMdNGbPYcCsjoeRqg4sPxZ
	 VOBG2hgFHRQZmrfiDb8ix8VqCU7Tibt/ZgvAYALM0vvMv3vONCRafF+g0DJxGsXl9H
	 hZsHSmOOoTgSnjpUH3PR1qAqPBde8e+QtD9aDFl5QngDTpVcu1hpHp4txYdTVSL9eG
	 I2kzTOerW6fjQ==
Date: Fri, 29 Aug 2025 12:41:07 -0400
From: Kees Cook <kees@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>
CC: Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Yue Haibing <yuehaibing@huawei.com>, Marc Zyngier <maz@kernel.org>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Ryan Roberts <ryan.roberts@arm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Joey Gouly <joey.gouly@arm.com>, Yeoreum Yun <yeoreum.yun@arm.com>,
 James Morse <james.morse@arm.com>,
 Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Zhenhua Huang <quic_zhenhuah@quicinc.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dev Jain <dev.jain@arm.com>,
 Yicong Yang <yangyicong@hisilicon.com>, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_arm64=3A_mm=3A_Fix_CFI_failure_du?=
 =?US-ASCII?Q?e_to_kpti=5Fng=5Fpgd=5Falloc_function_signature?=
User-Agent: K-9 Mail for Android
In-Reply-To: <aLHP-TG3a1Im3kpa@J2N7QTR9R3>
References: <20250829154913.work.943-kees@kernel.org> <aLHP-TG3a1Im3kpa@J2N7QTR9R3>
Message-ID: <315CE055-A886-4322-9683-AFE7003B1664@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_094110_589084_9FE2A7F8 
X-CRM114-Status: UNSURE (   7.48  )
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



On August 29, 2025 12:06:17 PM EDT, Mark Rutland <mark=2Erutland@arm=2Ecom=
> wrote:
>On Fri, Aug 29, 2025 at 08:49:21AM -0700, Kees Cook wrote:
>> Fixes: 47546a1912fc ("arm64: mm: install KPTI nG mappings with MMU enab=
led")
>
>That doesn't look right; that commit is from June 2022, and we only
>introduced enum pgtable_type in May 2025 in commit:
>
>  c64f46ee13779616 ("arm64: mm: use enum to identify pgtable level instea=
d of *_SHIFT")
>
>=2E=2E=2E which landed in v6=2E16=2E
>
>AFAICT, that's the commit which broke things=2E

Oops, yes, I didn't look close enough=2E Want a v2 with that fixed up?


--=20
Kees Cook

