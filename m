Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44466C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 18:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3i45atEj/Em1zgDsdIfHqKPyZD2/NFVdU7m9egEFrkg=; b=4Em9eGzCxIIQAcr/VoW8I5jOvi
	C5vhTjnNVuzUAqV37k0V0Jv1ZC9+MaK+yww3M05PHdQbxexj1SyeoC0PFWKUuWUXBIcDeob+Edt0h
	WTUr5LhlhZ6fRCi2rNC/13Y7DNCCG4voxQxPkohDx8fLN3uGbU/xOw9p+A25+nWJgpSoBlMdl7ecY
	Vu1eOCzIOxx/mjmnrQR7ECmZeqUkGvvtW3wWffrRX4kBFsOuKQgz6tQJgjf5XsUCk3/OEDfxy/U9w
	3+v4xcrgf2Nmdu6/MNsEjjg+gzCJKodfXUOzfci6it4vLMNkUalO+uoKYfXvItxoL7i4obFmptEmt
	d0ZxzlCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twmoT-00000003yZA-1XPQ;
	Mon, 24 Mar 2025 18:46:17 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twmmk-00000003yOe-2Nl1;
	Mon, 24 Mar 2025 18:44:31 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1742841851; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jV18Lr3WTYIwr0VI2NcmhfG0ucWBw3XpA4ZLsKhvb5kvwFLQXK20hR6HZNmlLmjDlQT7cI1bkqRhOLrjpslLrBFI6AJ58Q/5IcbEB8AmzdXVEA4Dq13mvbGJMKeqiyZ8mjF5hcsUueSPwRv6tqwRsEtxUe0H9Esn8cdUi+o/IIQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1742841851; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3i45atEj/Em1zgDsdIfHqKPyZD2/NFVdU7m9egEFrkg=; 
	b=cDn1geDA7XOV87TV37z9IW2J87l1HmdTS78uig6xXK/sM5sK1IXGQNWmLRz3bvKtotjKfKQnWNTu+1cvRwEJKE8R7AH4QsOXA9pDXO2E2YgD/OdX6Qe52bwVB6uaIDmLhu/+Eej4s0Z4xdCSb1Eb0DXkFCWyfonJ7RzTWAPBITA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742841851;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=3i45atEj/Em1zgDsdIfHqKPyZD2/NFVdU7m9egEFrkg=;
	b=CYhCmkbnpAtqmznlseu04bydQY+U12ExisubT8wS/U7AiTY1OXhIXVdf/nic22dS
	jCGNhkINUOfj6Xpr9MEqXYLqAb1yOggK9z+xMauUpXP0WRy+Ae6uBY7zTkSQFPLS36q
	istxulDhzmrK4P/W/AVPcv18FjZtDX6xCsEaaa7Y=
Received: by mx.zohomail.com with SMTPS id 1742841849727969.7923025073931;
	Mon, 24 Mar 2025 11:44:09 -0700 (PDT)
Message-ID: <69da05c4-7471-47aa-a72d-b08d9b97e8dc@collabora.com>
Date: Mon, 24 Mar 2025 15:44:03 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] drm/panfrost: Add support for AARCH64_4K page
 table format
To: Adrian Larumbe <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, robh@kernel.org, steven.price@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, kernel@collabora.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sjoerd@collabora.com, angelogioacchino.delregno@collabora.com
References: <20250317145245.910566-1-ariel.dalessandro@collabora.com>
 <20250317145245.910566-5-ariel.dalessandro@collabora.com>
 <5hl2ahnxeunqebenguxjwwie6ura3lxknu766xthov2m4qvsot@imrrfqftlmv4>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <5hl2ahnxeunqebenguxjwwie6ura3lxknu766xthov2m4qvsot@imrrfqftlmv4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_114430_654963_698D74E6 
X-CRM114-Status: GOOD (  13.16  )
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

Adrian,

On 3/22/25 3:48 PM, Adrian Larumbe wrote:
> On 17.03.2025 11:52, Ariel D'Alessandro wrote:
>> Currently, Panfrost only supports MMU configuration in "LEGACY" (as
>> Bifrost calls it) mode, a (modified) version of LPAE "Large Physical
>> Address Extension", which in Linux we've called "mali_lpae".
>>
>> This commit adds support for conditionally enabling AARCH64_4K page
>> table format. To achieve that, a "GPU optional quirks" field was added
>> to `struct panfrost_features` with the related flag.
>>
>> Note that, in order to enable AARCH64_4K mode, the GPU variant must have
>> the HW_FEATURE_AARCH64_MMU feature flag present.
>>
>> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
>> ---
>>   drivers/gpu/drm/panfrost/panfrost_device.h |  16 +++
>>   drivers/gpu/drm/panfrost/panfrost_mmu.c    | 140 +++++++++++++++++++--
>>   drivers/gpu/drm/panfrost/panfrost_regs.h   |  34 +++++
>>   3 files changed, 183 insertions(+), 7 deletions(-)

[snip]

>> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
>> index 294f86b3c25e7..506f42ccfd5fc 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c

[snip]

>> +static int panfrost_mmu_cfg_init(struct panfrost_mmu *mmu,
>> +				  enum io_pgtable_fmt fmt)
>> +{
>> +	struct panfrost_device *pfdev = mmu->pfdev;
>> +
>> +	switch (fmt) {
>> +	case ARM_64_LPAE_S1:
>> +		return mmu_cfg_init_aarch64_4k(mmu);
>> +	case ARM_MALI_LPAE:
>> +		return mmu_cfg_init_mali_lpae(mmu);
>> +	default:
>> +		/* This should never happen */
>> +		drm_WARN(pfdev->ddev, "Invalid pgtable format");
> 
> I think there's a '1' missing here before the string literal.
> Other than that,
> 
> Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>

Fixed, thanks!

Will send v5 right away.

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718


