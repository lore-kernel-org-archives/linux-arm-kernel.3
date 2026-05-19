Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBCFCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 06:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8oDwrSodMvBGvwKhzolYFSIpXFCfxGjsM9lKI/VqheM=; b=1BnP5S9dNMm+0I2vaZk5s5WQZU
	rPDQP54oEgquOAI2j7UE9K9czn4C7LRDOL2mhH8lngJD9gexTnrWenDUkA4LnxP0XO/0MXBeVMXgZ
	W8OoBb83qz+37OV9auz/pCs0MA/pXSidP4ACi6U1vwfWE5wDqwqOSuHtl/PlXbSS645e87+fybNmJ
	S0qnteRl8omem50ysAtlsspt8mJDBXh5mqQQmuf2ggMdpEoy6C+/gTY76w/N/Vc04fP59fRi//JL8
	iBpeyLsxj86osifUX6e73fUB5m5erOIiQO1Qj9JoWBMh41OsasAyzp55b6DoIkKXOAOoM6Ekf+Igt
	oOAkeJLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDzr-00000000LmQ-2pUr;
	Tue, 19 May 2026 06:32:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDzq-00000000Lm9-42Ro
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 06:32:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0881360052;
	Tue, 19 May 2026 06:32:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 722BEC2BCB3;
	Tue, 19 May 2026 06:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779172325;
	bh=WsOs4HwWty+XwcBl+4eEJMq3peZJCA4ScKvm6Okeq1k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=M9Br/NoA7Y13k6DOUvKorOyDhgW8WdjCWD17N5yJmk27gZb5O/BWKB8rT+ky1N2um
	 mtmkt+IFTPOlZIjM35+k0o40++AtEup79dyN8FRqOSz0RqzIIAF+AeLyy+F74gkPpn
	 ekRVw0CiNP/Hc/ZwUbV/SMQnn0FCLFQwhFYECsNGcNe9DT02frdwsL7+G1zMQ2U0uK
	 /i2YEU595u8uNDp29E+rNMST4dFLN8g8uFolWCUcX0nDBcEdnHc4yh8W0vEzt1LjHA
	 /EVnPPPFabaQsYVplnaj6NtpCat1kKjzzYR36z7PRDaEyphkJLK8+Ot0PbrrfQyyWG
	 2mJhlaWoNpD8w==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
	Lorenzo.Pieralisi2@arm.com
Subject: Re: [PATCH v14 14/44] arm64: RMI: Basic infrastructure for creating
 a realm.
In-Reply-To: <20260513131757.116630-15-steven.price@arm.com>
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-15-steven.price@arm.com>
Date: Tue, 19 May 2026 12:01:55 +0530
Message-ID: <yq5a4ik3ucys.fsf@kernel.org>
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

Steven Price <steven.price@arm.com> writes:

> @@ -1114,7 +1119,10 @@ void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
>  	write_unlock(&kvm->mmu_lock);
>  
>  	if (pgt) {
> -		kvm_stage2_destroy(pgt);
> +		if (!kvm_is_realm(kvm))
> +			kvm_stage2_destroy(pgt);
> +		else
> +			kvm_pgtable_stage2_destroy_pgd(pgt);
>  		kfree(pgt);
>  	}
>  }

Maybe add a comment here explaining the difference.

We now have:

kvm_arch_destroy_vm()
  -> kvm_uninit_stage2_mmu()
       -> kvm_realm_uninit_stage2()
            -> unmap_range(0, max_ipa)        // for Realm VMs
       -> kvm_free_stage2_pgd()
            -> unmap and free PGD             // for non-Realm VMs
  -> kvm_destroy_realm()                      // for Realm VMs
       -> kvm_free_stage2_pgd()
            -> free PGD                       // for Realm VMs

I wonder whether this can be simplified using different functions names?
(can we call kvm_pgtable_stage2_destroy_pgd() from kvm_destroy_realm()? )

-aneesh

