Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17262C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 11:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kD8M/YKHqWqzGIENajqOC2rY0txazHy/e/Ja7hOOoXE=; b=NFbzajXB7HOzW09D1Opi33exC1
	muPZ8nClaoCnNFlMw2VxpMijfHRYtVygUB54C+aOBuxVLeJX78gKk//skMdwnldJ6RqZahHHfwoBk
	X1Zn3Tlm/exR+LkjCVh/VxCNpTKIzb1ppzyinwRHL4BrzZarTh8fT/uTaVifi74+dz4jWZiMGl3VO
	+Pz7H6iadXh8CUQ/ZDmUg8KFAN2DOurXXU91vNSZdvTFP4o0YyL1w0ePY8u8ABWRQ5kye1hgiokBh
	QhmjalcrZ3pHLCIYQClQ8O7MFpracE9P4rttt6142dZrwCmheVQS7siv4Oe5mXqTL0DkY++eN1/TV
	wIjcefow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0n6-0000000BQz3-1p2i;
	Thu, 20 Aug 2026 11:18:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0n4-0000000BQyu-21R2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 11:18:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D4D5C60A9E;
	Thu, 20 Aug 2026 11:18:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10A531F000E9;
	Thu, 20 Aug 2026 11:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787224713;
	bh=kD8M/YKHqWqzGIENajqOC2rY0txazHy/e/Ja7hOOoXE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=N4ejpgkcSr7xuovl0VUw3yUMsE5hXE63S3pSHaRM7XjXdVv/+Brt0GYH7OKMHkg+W
	 QMy1BeBvHx0o3sXHvln8dA8ma/oYy4+2Zyl0fDHb11veUnnYoAQyUePu6qPwMnxJnc
	 ljUeDCitQA/l7zP1BsEnJ9QYTBZKypvZ46isguSOlpNj8oZlXo29rpaMuLX73m6B+x
	 /f6Q5SaTCtcfgXiKmpncrMXtkZE6urbY8H2nenEICEeiNnVuZCcz3V3XWYGQBmuuco
	 GVnVaCIN85PNKewAUOYrH943fuMrZuVKIPvJZZtdo9fgYiijyrjFoU0MzgkmVv28nm
	 3dAf1vXRPuUNA==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Kameron Carr <kameroncarr@linux.microsoft.com>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexey Kardashevskiy <aik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jonathan Cameron <jic23@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>
Subject: Re: [RFC PATCH v4 08/11] coco: guest: arm64: Verify DA evidence
 with RSI_VDEV_GET_INFO digests
In-Reply-To: <da92b216-e4ee-4392-9a35-de7bc1683f83@linux.microsoft.com>
References: <20260427082805.931832-1-aneesh.kumar@kernel.org>
 <20260427082805.931832-9-aneesh.kumar@kernel.org>
 <da92b216-e4ee-4392-9a35-de7bc1683f83@linux.microsoft.com>
Date: Thu, 20 Aug 2026 16:48:23 +0530
Message-ID: <yq5alda1vy4g.fsf@kernel.org>
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

Kameron Carr <kameroncarr@linux.microsoft.com> writes:

> On 4/27/2026 1:28 AM, Aneesh Kumar K.V (Arm) wrote:
>
>> +struct rsi_vdevice_info {
>> +	union {
>> +		struct {
>> +			u64 flags;
>> +			u64 id_index;
>> +			union {
>> +				u8 hash_algo;
>> +				u64 padding0;
>> +			};
>> +			u64 lock_nonce;
>> +			u64 meas_nonce;
>> +			u64 report_nonce;
>
> Nit:
> I found the name `lock_nonce` confusing. I originally assumed this was the
> nonce passed in when calling RHI_DA_VDEV_GET_MEASUREMENTS. The new RSI spec
> (2.0 beta 3) names these lock_seq, meas_seq, report_seq. Consider matching
> these names since the values represent sequence counters and to
> differentiate them from the nonce used in RHI_DA_VDEV_GET_MEASUREMENTS.
>

Will switch to that name.

>
>> +			union {
>> +				u8 format_type;
>> +				u64 padding1;
>> +			};
>> +			u64 format_version;
>> +			union {
>> +				u8 state;
>> +				u64 padding2;
>> +			};
>> +
>> +		};
>> +		u8 padding3[0x80];
>> +	};

...

>> +static int cca_apply_evidence_report_range(struct pci_dev *pdev,
>> +		struct pci_tsm_mmio *mmio, bool map)
>> +{
>> +	int i, ret;
>> +	struct resource *res;
>> +	unsigned long mmio_flags = 0; /* non coherent, not limited order */
>> +	int vdev_id = rsi_vdev_id(pdev);
>> +	struct pci_tsm_mmio_entry *entry;
>> +	struct cca_guest_dsc *dsc = to_cca_guest_dsc(pdev);
>> +
>> +	for (i = 0; i < mmio->nr; i++) {
>
> In the tsm unlock code path cca_tsm_unlock() ->
> cca_unmap_evidence_report_range() -> cca_apply_evidence_report_range()
> there is no null pointer check on mmio / dsc->pci.mmio.
>
> dsc->pci.mmio is only initialized in the tsm accept path, so if the device
> is locked then unlocked without an accept, this will lead to a null pointer
> dereference.
>

I already have a fix for it in my development branch.


modified   drivers/virt/coco/arm-cca-guest/arm-cca.c
@@ -489,13 +489,15 @@ static void cca_tsm_unlock(struct pci_tsm *tsm)
 	}
 
 	cca_device_unlock(tsm->pdev);
-	pci_tsm_mmio_teardown(cca_dsc->pci.mmio);
+	if (cca_dsc->pci.mmio)
+		pci_tsm_mmio_teardown(cca_dsc->pci.mmio);
 
 err_out:
 	/*
 	 * No error handling from this function. Leave the device locked
 	 */
-	pci_tsm_mmio_free(tsm->pdev, cca_dsc->pci.mmio);
+	if (cca_dsc->pci.mmio)
+		pci_tsm_mmio_free(tsm->pdev, cca_dsc->pci.mmio);
 	kfree(cca_dsc);
 }
 
modified   drivers/virt/coco/arm-cca-guest/rsi-da.c
@@ -155,7 +155,9 @@ int cca_unmap_evidence_report_range(struct pci_dev *pdev)
 	struct cca_guest_dsc *dsc = to_cca_guest_dsc(pdev);
 	struct pci_tsm_mmio *tsm_mmio = dsc->pci.mmio;
 
-	return cca_apply_evidence_report_range(pdev, tsm_mmio, false);
+	if (tsm_mmio)
+		return cca_apply_evidence_report_range(pdev, tsm_mmio, false);
+	return 0;
 }
 
 int cca_verify_digest(u64 hash_algo, uint8_t *report,


-aneesh

