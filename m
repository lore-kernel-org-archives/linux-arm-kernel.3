Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE73EFCD99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 10:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7z1uNloZFcK2P1RS0CY2jk67G7pL+sNFuIKN/if5Dm0=; b=ajh16uJ5/dVd2GiJoBFX0oOziE
	ectbT2aC/sTaFzGzBubtV+DRODW+SDUmLWEPU1yDHNQJVn2IzV6Mx5DqeYYc4MRq427qty6Uc5DzZ
	lg/pI8r5udKnK0UIwtKzWac5WR849FmfxhwgTqv0H5cKudm68cl4bl3UDrdUudrIWfcpswsnkvOp8
	4rCseguFKGnYtsubMfdQKBIm6u+vCd6d0eLDIICAqPioiOKOCcxumn9rPww9aps6Ef7PwUfBOgkyU
	vw0xIVb9o+UFfkgzmFIEdshgmvXAkjh3br+FCy/ytSyXOMeYuUEtJA3mh7c5F2dEOHLeKBlmWTGDs
	nFiIm3sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYJC-000000077j9-3mhN;
	Mon, 09 Mar 2026 10:57:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYJB-000000077j3-2qho
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 10:57:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BC1BC60133;
	Mon,  9 Mar 2026 10:57:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DE20C4CEF7;
	Mon,  9 Mar 2026 10:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773053876;
	bh=IlyaL0xzcKbFXRcCNMmKvq3YIxGlatU2bZ5oGniuBKo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=raxXtsjynu4dcdS3YUuTzvfa0gfWyO/zp4f8tgmpFQ1aj/1BJUK1icZEKf8Kxu392
	 XfjkBSGCpDCUgWKe0t5Gz08v4hEl/q6j2by35/VpUuiZur0EtgLrICYNSugMguM8lP
	 tLgrd8H+8dA35Uk85gnxU3550ji8l2VTSiDWSVsbPzlbSrmOkJaZYxvkvvWgLInrpC
	 4fCueOAuXga34xva5d0FgSF/S65XJjaicqowrXp1GfEM9bjkGpsz9OBG+LUFDcNCFU
	 u2CA9dG+VIxjNRmhtq4/GE0xec6KTEcg5JhCKptIOOcb6a0ZTSX6aafZLQ6uVt+O/k
	 ZPLKI40i+yPwQ==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v3 0/2] Switch Arm CCA to use an auxiliary device from a
 platform device
In-Reply-To: <20260309100507.2303361-1-aneesh.kumar@kernel.org>
References: <20260309100507.2303361-1-aneesh.kumar@kernel.org>
Date: Mon, 09 Mar 2026 16:27:49 +0530
Message-ID: <yq5av7f51d8y.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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


As discussed here:
https://lore.kernel.org/all/20250728135216.48084-12-aneesh.kumar@kernel.org

The generic feedback was that a platform device should not be used when
there is no underlying platform resource to represent. The existing CCA
support uses a platform device solely to anchor the TSM interface in the
device hierarchy, which is not an appropriate use of a platform device.
Instead, introduce an auxiliary device to track CCA support.

The TSM framework uses the device abstraction to provide cross-architecture
TSM and TEE I/O functionality, including:
  Enumerating available platform TEE I/O capabilities
  Provisioning connections between the platform TSM and device DSM

For the CCA platform, the resulting device hierarchy appears as follows:

# cd /sys/class/tsm/
# ls -al
total 0
drwxr-xr-x  2 root root 0 Jan  1 00:01 .
drwxr-xr-x 23 root root 0 Jan  1 00:00 ..
lrwxrwxrwx  1 root root 0 Jan  1 00:01 tsm0 -> ../../devices/platform/arm-smccc/arm_cca_host.arm-rmi-dev.0/tsm/tsm0

-aneesh

