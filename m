Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D57B6C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 17:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K3ckKoOxDuvv4TatnpC5VMgUIUhUlljKqOBxiBCiL24=; b=HlIoyOnjskByKACQETVWdCsecA
	iSuyxjmh+fEtcC9Pg9PonKLjKCrNZZHKjfVudtxzUDNyAT++PJHu3HUUcxtTGPX16uxeCFS5JOohS
	e7d1pWcRU4yu6AaerbDKCROMPwHZhZtYJsTyXvym4ESGnFpex54x4XrONcYFlCZ/R+Y3dRBXPCY0w
	y50EnGd922dVM/lLhHLvmf+uee9sSBtz1XAscXkuBTm4k5zhPyKkhWiXPVky5+Gd0B1rDPVbEw3E1
	QBh8HkbUdi58GsRWkbVYhswoPKu4xEwamG/ITHeNE0VOL/u3CP/5DQOMHr1jeBn317yEvCgALRJfJ
	QbJAUYzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP3Bm-00000007hsU-2R93;
	Tue, 10 Jun 2025 17:55:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0RU-00000007CYv-2svU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 14:59:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6554949AEB;
	Tue, 10 Jun 2025 14:59:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1AA8C4CEED;
	Tue, 10 Jun 2025 14:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749567552;
	bh=K3ckKoOxDuvv4TatnpC5VMgUIUhUlljKqOBxiBCiL24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TDmztUpV+pmuz2CDYqmmwZhJsmv96tBvw6sVQgLo6Y4mZf07iW7vN2aqNf2W+ZI+J
	 9Ah2vpwvf+4pr1UqAerNoO63vgwvsq9gR7m2UDWs1BsR3mX2DxpYFZFzINkEDhw/u1
	 RnJaRGVpYEaFrnuMIo5N/ZvLNLswE+F9zFhHJAwN/hx48gjiCL1eN3wPeiImJeRnX+
	 Ym3jIXTk/ywZ40Q6lQSbs1eu8JfDPfQXx1mfCX0qoSFXvY/1xoMA/CntLARBrt8ovF
	 1Wvu1uCNZakBBfOVVcM6FMM1MPaOsvbCMJ07vHHoo6fSrLbItsBOtw3QMeNfMVm6UR
	 jzG/AaYG9caAg==
Date: Tue, 10 Jun 2025 17:59:08 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: sudeep.holla@arm.com, peterhuewe@gmx.de, jgg@ziepe.ca,
	stuart.yoder@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
Subject: Re: [PATCH v2 0/2] fix failure of integration IMA with tpm_crb_ffa
Message-ID: <aEhIPC95FisptBO5@kernel.org>
References: <20250610060334.2149041-1-yeoreum.yun@arm.com>
 <aEgmhwu1RP27yBpw@kernel.org>
 <aEgwpXXftXW6JNRy@e129823.arm.com>
 <aEg6Bgh8TqzK5nSu@kernel.org>
 <aEhDY4VlkIPYAjPE@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEhDY4VlkIPYAjPE@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_075912_744817_55DA49B2 
X-CRM114-Status: GOOD (  10.44  )
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

On Tue, Jun 10, 2025 at 03:38:27PM +0100, Yeoreum Yun wrote:
> Unfortunately, when these components are built as built-in drivers,
> the functions ffa_init(), tpm_crb_ffa_init(), and crb_acpi_driver_init() are
> all executed during the device_initcall phase.
> As a result, if crb_acpi_driver_init() is called before the ffa_device exists or
> has been probed, it returns -EPROBE_DEFER,

Please mention exactly this in the commit explicitly and then it should
be in detail enough.

> causing the probe to be deferred and retried later
> during the deferred_probe_initcall phase.

OK, if ffa_init() is leveled up in the initcall hierarchy, shouldn't
that be enough as long as ko's can be found from initramfs?

BR, Jarkko

