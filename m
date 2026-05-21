Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A83E0CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 17:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+FmAzQvTXDL4Pj4tgiqa+GkBPY2ik/1LnnIYJZAA6wU=; b=mGmT7QYz+vaQMM8SceXE3XxbR/
	MmyPZuSblVgnhEy9tTd6BElSWrr1wCHZWA+zaCoqwWw1xZTin7pFXFHKoEmp46pCLNMXtTt18lc0/
	TdzCqMAZhhXr3kVOobE3HlGk8sGaYwtwy87mzKihmH5iwzKr0qmaHHLagcECwkf3DsPF0oxVhnaM0
	6rrR7bfdGETlrGV8GbmtU04k3bqi8pAQla5OpFKHUQQeI9gZL5tC55B+rcXxE6hsw27hmLebhjD0x
	YqMWD8mqRIEJHd8IttM3q1h6N9QFUuPjmVx1UOT7wvM/78e3IRKkpfzWRE1rTev/FfEHQitrYxYvs
	+x2IvVuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ7Aw-00000008dbl-0DX0;
	Thu, 21 May 2026 17:27:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ7At-00000008daf-2VZp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 17:27:13 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64LGk47n3532248
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 17:27:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+FmAzQvTXDL4Pj4tgiqa+GkBPY2ik/1LnnIYJZAA6wU=; b=WSxreC+zI2Cjwhrd
	kQSl4+KqS2iyhyW758hXoX/WTxrBMQa7Y2ZZNSV2G9ecCLwnJTdbOXYKi0uHsWUH
	5CSjSHTZqlA/MquVk/3k7NSsuSbq9kPn89xcAj9506uWle4Tj0BPf8rirACtJPEp
	AVEeBTZt7BbxFua3EngfyQYQBNHmTrgAeIkUAvjXv57fbGuJohUFEYrCXzTZFhQQ
	oShFmIj201Nio+qUCOoSaFRn8/ex61LhRKlxYtHaa1pLYVMYCh7XZD0+sgb4fjHy
	iOAFOTzxmvqIBLRoMrVxYOq+5E1H48oTjd29WaWrnOv3Kpcq56W6jWBa4qiWUsks
	xzgtqw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea39gry91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 17:27:10 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2f525565b33so7816165eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 10:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779384430; x=1779989230; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+FmAzQvTXDL4Pj4tgiqa+GkBPY2ik/1LnnIYJZAA6wU=;
        b=Dm9FTbK0zwzuCO5hlDwzRpd/SBqPTLFjizu3bO/yYFYF2XqO+NJei0AqZS6/n6VDdB
         D2Ah9B8FCnBTYNvyP8H45ygwmqpinx9Esl2iMdxIKjm+9QTV9od1NcW4eK4sLNFfxqjv
         wZgOJto4C2MI3376pt2gWJ8io3hMF1Z0qayg+0WAFMZ2PDw8uWw3MKTUDPKkOfG/kMzw
         8Thj0ctXLrepeOBvaMP0fWocAyMSqOKwv0IkVfvWd+ZyZBHDNBkMMJutD3CCRADgMIY/
         zLah8I5V11qf2krAxYOX4rS8rhG3kKSNTCSIHN6gTy66iL8cPwltm5Sz1ivdX6la6u0L
         hP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779384430; x=1779989230;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+FmAzQvTXDL4Pj4tgiqa+GkBPY2ik/1LnnIYJZAA6wU=;
        b=YnI+1BAtwO/NT9fJv+ClldhonktII/NlcA6hhiROjD4oTA2EKxZZsMfxrugYuUKCq/
         eBb2R6LfDiN7o2LixvwI0EfxNJn09bFyMhEVC6jNO7pukEubHCXVOiOCoaOcRF53hZVt
         p6Ueivz0wTz2+4Wn54hFHtsAjZ4okR9ikHX4tl5yxR55OZbXn+gdkz0+vM0sOc4ps7gY
         VnftlYnpcoL4a08nmvXyBV1JlW9UyWRjmjrkKomCs07Nziqp8pIHJVMnIaCi8GO+PSDo
         lC6xbbBboRNwLAeetsjdBd4sRScsgjDb+/EeODBWpt8tns+zyCYIdhltkbG+n0/rk6d6
         h24g==
X-Forwarded-Encrypted: i=1; AFNElJ+LTIUlIzW+CHrzmsajPZSZ5vV94JSTru13v013h6OEvbWyHvlUqMeRh2e7hDKeEu87zDuBS2+RxoMY80K2CiUP@lists.infradead.org
X-Gm-Message-State: AOJu0YwB7WOhdrAQC/cVeyJh8HUuRSI3xa/3lgmJgbmcMTu5DbmWZZSY
	Gd6kTeBLf61s4cp3AraCIIWgtA5ufwpvjJ2BF7XBANtXNESkRzZIsGox0u4D1JWaVCIaXohCoAS
	vs0AmCequHoSWjtc/uIkurP+buR7lHOLlBaI83GRd90LzxTU9esz66NxYbmPKjxfMC72Qu4HENg
	guHA==
X-Gm-Gg: Acq92OFMqIWSJ83YorxE4ScVYuoCvLhLc1zH7XI0WvLMeOqFPFztjR+/WojqFL8e/KC
	47PjH0ARW9j2IHFv6f7WVlMwtwy+DGSeSs9PE1V6Yh586f9Q70TF9nIJBvc2a81NGOTSfVDK+B+
	SMZaAQHQJVLrzh7YzZP8FCqymomGcfLgPrFQJ14QXHmPLHpPpBQYz3ANkBp4hxrV3ygX8gr97CA
	fZCXQp10oFMh6+Li/jGMj+YXdYk5fVFjWed/wLGsCKM9ZqMGJREJ8UB4jrme/SYzdtiHlA48blH
	5p5vd2D/cguItOm/rU2JOw5+1VssesIG8QWSUmASVdROl4MIQciimi+syULu0I2t7pKAjxJP7hb
	md+YWQB27HpX0/QICoVEcZI53nMrtWvMEL9nyAxBWghL50m3rcyxWpd8=
X-Received: by 2002:a05:7301:608e:b0:2f2:b544:2fca with SMTP id 5a478bee46e88-304490e65femr33136eec.33.1779384429989;
        Thu, 21 May 2026 10:27:09 -0700 (PDT)
X-Received: by 2002:a05:7301:608e:b0:2f2:b544:2fca with SMTP id 5a478bee46e88-304490e65femr33100eec.33.1779384429350;
        Thu, 21 May 2026 10:27:09 -0700 (PDT)
Received: from [192.168.1.106] ([106.51.193.136])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3044359ecaesm941567eec.25.2026.05.21.10.27.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 10:27:08 -0700 (PDT)
Message-ID: <fdaf3bf7-378b-4384-90a1-b64a2389a00b@oss.qualcomm.com>
Date: Thu, 21 May 2026 22:57:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
Subject: Re: [PATCH 1/5] arm_mpam: Parse the rest of the ACPI table
To: Andre Przywara <andre.przywara@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Hanjun Guo
 <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>
References: <20260429141339.3171205-1-andre.przywara@arm.com>
 <20260429141339.3171205-2-andre.przywara@arm.com>
Content-Language: en-US
In-Reply-To: <20260429141339.3171205-2-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Yr8/gYYX c=1 sm=1 tr=0 ts=6a0f406e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=7w7G2qr1pZSYnhmQ0Jjmug==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=7CQSdrXTAAAA:8 a=DsZDJ7UI_9TAX8a9LM0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: 3Yq244c-t6s_HoDKBt1WSSiFXQlSAgZz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDE3NSBTYWx0ZWRfX5j8MWw4ott/8
 aCtfCsuJsICJ6Ya+RoWkq/3kIfdWJvyjFr2qR6rJQVXImRlbhOG1xPz8UXCteNTMPveadDp4x25
 lBN3Zc+PCP1WAhK5zRxC/FEdPdkFT1qX0N5kbe9erZ+uU27/K+upFERDupq6fAaD0RzUrgdp95X
 bCi7HCLwzDwBxbUd77cxrMXDXPKP/5ftGvvJkQO5ffhOO2fajVnXJGGFua4mKfnDMakDlwty5oN
 ELUdELGBdqPnL5d1pcvPAt4V3WqK/YQhjwhJdnq2RWWKzafJUzzVD8QWvtbOHbM/IHJobnFNzYq
 pXNOsMAY2sFxpzAjBJxj+evXQRDjxT6i+ewQsaqbmZCGMhQp5tTS6Wo/yPhD6aqe3uKEwMBamRm
 uK034BcUwKA12QGQNF1Qzqn3Q7/E9ARL5Pp4xRfo/nn8rRAGPOMh6gtMi438GBykQHLgGnmHBuh
 qTJKWZexdJQ0WPptvaQ==
X-Proofpoint-GUID: 3Yq244c-t6s_HoDKBt1WSSiFXQlSAgZz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1011
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_102711_646628_446E5073 
X-CRM114-Status: GOOD (  33.69  )
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


Hi Andre,

On 4/29/2026 7:43 PM, Andre Przywara wrote:
> From: James Morse<james.morse@arm.com>
>
> The MPAM ACPI table lists the MPAM MSCs and indicates which resources
> in the system they control. Not everything this table can describe is
> supported by resctrl, e.g. memory-side-caches.
>
> Add the additional table parsing to avoid reporting these as 'unknown'
> to the MPAM driver. This allows class+component hierarchys to be built.
>
> Until resctrl has support for any of these resources, users would be
> in-kernel managers of a resource/PARTID or perf to query bandwidth
> counters on a resource resctrl is unaware of.
>
> Signed-off-by: James Morse<james.morse@arm.com>
> Signed-off-by: Andre Przywara<andre.przywara@arm.com>
> ---
>   drivers/acpi/arm64/mpam.c | 91 +++++++++++++++++++++++++++++++++++++--
>   1 file changed, 88 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/acpi/arm64/mpam.c b/drivers/acpi/arm64/mpam.c
> index 84963a20c3e7..99c2bdbb3314 100644
> --- a/drivers/acpi/arm64/mpam.c
> +++ b/drivers/acpi/arm64/mpam.c
> @@ -95,17 +95,51 @@ static void acpi_mpam_parse_irqs(struct platform_device *pdev,
>   		res[(*res_idx)++] = DEFINE_RES_IRQ_NAMED(irq, "error");
>   }
>   
> -static int acpi_mpam_parse_resource(struct mpam_msc *msc,
> +#define UUID_MPAM_INTERCONNECT_TABLE		"fe2bd645-033b-49e6-9479-2e0b8b21d1cd"
> +
> +struct acpi_mpam_interconnect_descriptor_table {
> +	u8	type_uuid[16];
> +	u32	num_descriptors;
> +};
> +
> +struct acpi_mpam_interconnect_descriptor {
> +	u32	source_id;
> +	u32	destination_id;
> +	u8	link_type;
> +	u8	reserved[3];
> +};
> +
> +static int acpi_mpam_parse_resource(struct acpi_mpam_msc_node *tbl_msc,
> +				    struct mpam_msc *msc,
>   				    struct acpi_mpam_resource_node *res)
>   {
> +	struct acpi_mpam_interconnect_descriptor_table *tbl_int_tbl;
> +	struct acpi_mpam_interconnect_descriptor *tbl_int;
> +	guid_t int_tbl_uuid, spec_uuid;
>   	int level, nid;
>   	u32 cache_id;
> +	off_t offset;
>   
> +	/*
> +	 * Class IDs are somewhat arbitrary, but need to be co-ordinated.
> +	 * 0-N are caches,
> +	 * 64, 65: Interconnect, but ideally these would appear between the
> +	 *     classes the controls are adjacent to.
> +	 * 128: SMMU,
> +	 * 192-192+level: Memory Side Caches, nothing checks that N is a
> +	 *                small number.
> +	 * 255: Memory Controllers
> +	 *
> +	 * ACPI devices would need a class id allocated based on the _HID.
> +	 *
> +	 * Classes that the mpam driver can't currently plumb into resctrl
> +	 * are registered as UNKNOWN.
> +	 */
>   	switch (res->locator_type) {
>   	case ACPI_MPAM_LOCATION_TYPE_PROCESSOR_CACHE:
>   		cache_id = res->locator.cache_locator.cache_reference;
>   		level = find_acpi_cache_level_from_id(cache_id);
> -		if (level <= 0) {
> +		if (level <= 0 || level >= 64) {
>   			pr_err_once("Bad level (%d) for cache with id %u\n", level, cache_id);
>   			return -EINVAL;
>   		}
> @@ -120,6 +154,57 @@ static int acpi_mpam_parse_resource(struct mpam_msc *msc,
>   		}
>   		return mpam_ris_create(msc, res->ris_index, MPAM_CLASS_MEMORY,
>   				       MPAM_CLASS_ID_DEFAULT, nid);
> +	case ACPI_MPAM_LOCATION_TYPE_SMMU:
> +		return mpam_ris_create(msc, res->ris_index, MPAM_CLASS_UNKNOWN,
> +				       128, res->locator.smmu_locator.smmu_interface);
> +	case ACPI_MPAM_LOCATION_TYPE_MEMORY_CACHE:
> +		cache_id = res->locator.mem_cache_locator.reference;
> +		level = res->locator.mem_cache_locator.level;
> +		if (192 + level >= 255) {
> +			pr_err_once("Bad level for memory side cache with reference %u\n",
> +				    cache_id);
> +			return -EINVAL;
> +		}
> +
> +		return mpam_ris_create(msc, res->ris_index, MPAM_CLASS_CACHE,
> +				       192 + level, cache_id);
> +
> +	case ACPI_MPAM_LOCATION_TYPE_INTERCONNECT:
> +		/* Find the descriptor table, and check it lands in the parent msc */
> +		offset = res->locator.interconnect_ifc_locator.inter_connect_desc_tbl_off;
> +		if (offset >= tbl_msc->length) {
> +			pr_err_once("Bad offset for interconnect descriptor on msc %u\n",
> +				    tbl_msc->identifier);
> +			return -EINVAL;
> +		}
> +		tbl_int_tbl = ACPI_ADD_PTR(struct acpi_mpam_interconnect_descriptor_table,
> +					   tbl_msc, offset);
> +		guid_parse(UUID_MPAM_INTERCONNECT_TABLE, &spec_uuid);
> +		import_guid(&int_tbl_uuid, tbl_int_tbl->type_uuid);
> +		if (guid_equal(&spec_uuid, &int_tbl_uuid)) {
> +			pr_err_once("Bad UUID for interconnect descriptor on msc %u\n",
> +				    tbl_msc->identifier);
> +			return -EINVAL;
> +		
>
> Looks like the condition seems to be inverted. This currently returns -EINVAL when the UUID matches the expected spec UUID, and accepts mismatched UUIDs.It probably should be:
>    if (!guid_equal(&spec_uuid, &int_tbl_uuid)) {
>
>
> +		offset += sizeof(*tbl_int_tbl);
> +		offset += tbl_int_tbl->num_descriptors * sizeof(*tbl_int);
> +		if (offset >= tbl_msc->length) {
> +			pr_err_once("Bad num_descriptors for interconnect descriptor on msc %u\n",
> +				    tbl_msc->identifier);
> +			return -EINVAL;
> +		}
> +
> +		tbl_int = ACPI_ADD_PTR(struct acpi_mpam_interconnect_descriptor,
> +				       tbl_int_tbl, sizeof(*tbl_int_tbl));
> +		cache_id = tbl_int->source_id;
> +
> +		/* Unknown link type? */
> +		if (tbl_int->link_type != 0 && tbl_int->link_type == 1)
> +			return 0;
>
> And here I think != 0 && == 1 simplifies to just == 1, so this drops the valid PROC link type (0x01) while letting any unknown value (≥ 2) fall through to mpam_ris_create with an arbitrary class ID. Per DEN0065B, only 0x00 (NUMA) and 0x01 (PROC) are defined. So it probably should be:
>
>    if (tbl_int->link_type != 0 && tbl_int->link_type != 1)
>        return 0;
>
> +
> +		return mpam_ris_create(msc, res->ris_index, MPAM_CLASS_UNKNOWN,
> +				       64 + tbl_int->link_type, cache_id);
>   	default:
>   		/* These get discovered later and are treated as unknown */
>   		return 0;
> @@ -150,7 +235,7 @@ int acpi_mpam_parse_resources(struct mpam_msc *msc,
>   			return -EINVAL;
>   		}
>   
> -		err = acpi_mpam_parse_resource(msc, resource);
> +		err = acpi_mpam_parse_resource(tbl_msc, msc, resource);
>   		if (err)
>   			return err;
>   
> Best Regards,
> Srivathsa

