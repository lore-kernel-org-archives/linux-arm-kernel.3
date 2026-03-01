Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8B1FD004A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 10:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AaYtDY7i19JC+kgo6Aub+wpdCRyygwATCwFfvf7SeLs=; b=wtJ+BWea23gBkprlQBOkjQ0/qa
	Pv8eoNnSpEXmfLx8UwVDs5NNe+1ulwoT57wO1XWyfTGqj6MhdjwSRbKHTFhzJFLUWhVDHUjcHJwof
	sRdjz5ruSxL9xhgDo/GqbgTlb5UEjmOI/SzK4zGrm70cINZEpCdK9tlIxIioXdEHOUuPVbjXmQ1JI
	bUxrSyLNv4T3oIgmmE/37RjDokwXlKkFr1QPZBzBumhNczJNPBIesOeJEEjVzJGzXciyfuAsa0UUo
	jtIKjutUwyC3h2zY/TtMaDOqYRsKKPAgIlr+CVdoTRbXVkcQaALeUT6qvbkwmYKDrQSWTncKResLv
	FlFT/ZNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwdom-0000000B1C4-46cg;
	Sun, 01 Mar 2026 10:14:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwdok-0000000B1Bi-0NDu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 10:14:31 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6219p7wB2626592
	for <linux-arm-kernel@lists.infradead.org>; Sun, 1 Mar 2026 10:14:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AaYtDY7i19JC+kgo6Aub+wpd
	CRyygwATCwFfvf7SeLs=; b=hppjOok7n3kZEvdpFxy+oGrOFaOPC7WA6YKIHC/P
	RLEYZxYbkUwgyYloRukhuv54XIuvwPWWpkPINmqgr0ipcG19c+mBC/unxCISJ5r8
	zv7oYZVSJSJYmp55jiMff6vOdPdxkh2HD9IUTL9/EGMSQq7cxEt5ifcUcnLdvyPQ
	CC0CKVFN4N93C/eKDl3lfXTKt14GvBGu6SOZqNz1kipYOf05iepCsnG0pQWfv/Tj
	WFKOcpyXYTiGyABliGv3BCzT079+WL77nYdK0AQqkVT1B1nEmAl3yQKyr4QgxvnL
	0GB6owfy1UPawDPjWgbesksP+P/Io90JOQoe94KPSYHL8w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksf6jfwk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 10:14:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb390a0c4eso2202313985a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 02:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772360068; x=1772964868; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AaYtDY7i19JC+kgo6Aub+wpdCRyygwATCwFfvf7SeLs=;
        b=PVDyzre3ECSLcreit5U/XU794FrYBjBhW0k1HsZKbPNAGHa6YSfbCl8w8kiofTc8jK
         PQJVUWPkpvyXX6Rix6Mbyb/ESMFm8Oyywn5FOwWzNx/0zIdhvJpfwQ3mKEAeO+bnQxTa
         fxCp5751S8egZjDwuVs+5695TjOrsxgJWNG8V6YceGd8ocwq9fTgidJ79eZmm2mq8jXe
         jAoc6cYr66WZqdj82qFevyAyXejX6Mcqj0ZBpz4CHDk4/k5YhvviJPiw3rYdxGmviLZH
         qEqRw9fizqRgP9W6ZvcI2oZgfN99Striw/UHUqMiZ1WtzAlQ7awfFgBpp8bIuw5UdUo2
         svxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772360068; x=1772964868;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AaYtDY7i19JC+kgo6Aub+wpdCRyygwATCwFfvf7SeLs=;
        b=CD/Fqfh3dCcN8ArHUZW405U38riFc9EuXOdAvwtN2NAsSAKo6UEjtKnOncD/tmoPRP
         AhDuXjl5dtbsakFeMa7Lv1pV6NS24b8VAQ7HgnE5ZUi/6bPqN4lLLo1OEqQWh0ldNZfX
         IKT34VbMhNNuS4JEoIkiqYiFyXFQ9xvQsoZZB4U1j+sp1uHESEw9wHCJw+qrQLwUdqCH
         8Zv1P0w2dPnO3hQ0A/pSqhnxKLYT+gJ6OVM6CF1uLGGP2Fr233gTKuY4V36Pp1kabjb5
         j6ITugmnvcFpuqaYmP1XmHCgtkqZ0BWJ8FX1f1D6oO4t84olviUiTIV0hWMaaJPFDhZd
         fL0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVBtdPEgWBh0wGU7eSbSMSyRbb9SRw/nqvUl6VRVHxcpWfkzZuy7nC4JO06is+zJT/XBYZGR0can690Efrn0uc9@lists.infradead.org
X-Gm-Message-State: AOJu0YyaM1sUSe0qw+ncxZXxIs7K70mC6ln8ScymhjVeJWk+HdVEWnzu
	YgiYapntcskixpKYQ53zMSwNUE/yiDPn5vZ+M7VciDRCc2YCTiDDcmV4G19sTYgdNnDvexZxmNd
	mDB+d2ENreuXgRo0FkJduizdalMlpw/GXK9m2Isho9j6LAhJUBxwVEppeqISYwCVws3FdtcjU4g
	me1Q==
X-Gm-Gg: ATEYQzxMf7sMoDmS1OxoE3a9xXLejyi4LCpR1eGcHinWLrk5LhsgaZyIV5mHkb6AA0C
	+cOWjfYj4FozTf7OCQyGTGfQ2F8S79u+09lWyXpZSgSRzVN4ahYK6WTgIvL1Afgth7jIBnJwh7V
	4Hq+AzLI4dHVm5b9HM7nKi1CR8r+fvEA53tmV+pbJ7Wdz0dkFGjqaRaZVqS92njqUFUBkdlsXHl
	SMBZQgzzIHf935z0FEHQxu9vXI2RI1wn0hPuxrQF28BY2DhHc0Drkm+jB1DC3jVwapCqWD1Gfbr
	2BnuQDATqWq/RFClwx9JIaEYGgokfJjskDQuwKArkq8VqmQqcYgYbHF+ENyzfYY7m7RUT9S7VlB
	KiEX+Y5JQHnLhNTkDytsA5Y2gr6F4NnRyHvOcgkyAEv8uso8tooHkAchxafudEgkduCZncDrKUy
	CkhpdsAF2gT7oxAooCEf9G5YPKbYIWwcuE6LU=
X-Received: by 2002:a05:620a:c4a:b0:8b6:1877:3689 with SMTP id af79cd13be357-8cbc8d9f7f5mr1039716185a.35.1772360067924;
        Sun, 01 Mar 2026 02:14:27 -0800 (PST)
X-Received: by 2002:a05:620a:c4a:b0:8b6:1877:3689 with SMTP id af79cd13be357-8cbc8d9f7f5mr1039712785a.35.1772360067368;
        Sun, 01 Mar 2026 02:14:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115bce377sm961212e87.15.2026.03.01.02.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 02:14:26 -0800 (PST)
Date: Sun, 1 Mar 2026 12:14:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Subject: Re: [PATCH v9 3/3] of: Respect #{iommu,msi}-cells in maps
Message-ID: <laif6gacqyacvchnfuyhu4w3f4746xlrlxrr23klrgtkbn7dn3@rracfqemavwd>
References: <20260301-parse_iommu_cells-v9-0-4d1bceecc5e1@oss.qualcomm.com>
 <20260301-parse_iommu_cells-v9-3-4d1bceecc5e1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301-parse_iommu_cells-v9-3-4d1bceecc5e1@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: e6ddXdkimeTA5_O2cC7BQX-9HZrecZ4Q
X-Authority-Analysis: v=2.4 cv=JoL8bc4C c=1 sm=1 tr=0 ts=69a41184 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=7CQSdrXTAAAA:8
 a=EUspDBNiAAAA:8 a=7GgscoS1Nejt2LJ9sp4A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDA5MSBTYWx0ZWRfX0xsvrW3/MIYK
 BD9DGk434FnxjwwxM1MJpZYo+z/H/F6vWvX/H9B/mL9kWh13uRv4ZMzyJ0EsYfKTXnvfw+qFVjr
 niByCe6u0z61XC36XK/ok73Z01LhJP9N2DNJ+aV229Bj0uGkcE6/uugmjwvTVXVNZWER7yfZsPF
 mMiVjaRPTfWGOTEjsy65AjyySwMasWbdNso5UsgIPM3Ydvv6IZV4np/UIlbVp5et/E8PQAp33Or
 wEJKElMG4aFTpTuizGSHFC7+9h0lpphfo4Detu1UUEUcyuNctdBKdOiSI+YN9zCXFHxronJSD35
 bRRzFT305wR/Ie1T9iDZ/c0dXW/QHVaj6mdwhgbDRZ2h4xTrISpOLH4JQM0e59IqgxJz0fY+tyh
 HCc0AyHgVQDy3fr166HUJ9tqhih/In7P0XgtbEg7MUnUr5B9KlluChKaer5iE9+5L83NrdTPOEo
 Osg7fpN1Nxqvof2nj1w==
X-Proofpoint-GUID: e6ddXdkimeTA5_O2cC7BQX-9HZrecZ4Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603010091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_021430_252762_EAB86E47 
X-CRM114-Status: GOOD (  38.91  )
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

On Sun, Mar 01, 2026 at 02:04:21PM +0530, Vijayanand Jitta wrote:
> From: Robin Murphy <robin.murphy@arm.com>
> 
> So far our parsing of {iommu,msi}-map properites has always blindly
> assumed that the output specifiers will always have exactly 1 cell.
> This typically does happen to be the case, but is not actually enforced
> (and the PCI msi-map binding even explicitly states support for 0 or 1
> cells) - as a result we've now ended up with dodgy DTs out in the field
> which depend on this behaviour to map a 1-cell specifier for a 2-cell
> provider, despite that being bogus per the bindings themselves.
> 
> Since there is some potential use in being able to map at least single
> input IDs to multi-cell output specifiers (and properly support 0-cell
> outputs as well), add support for properly parsing and using the target
> nodes' #cells values, albeit with the unfortunate complication of still
> having to work around expectations of the old behaviour too.
> 
> Since there are multi-cell output specifiers, the callers of of_map_id()
> may need to get the exact cell output value for further processing.
> Added support for that part --charan
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> ---
>  drivers/iommu/of_iommu.c |   2 +-
>  drivers/of/base.c        | 117 +++++++++++++++++++++++++++++++++++++----------
>  include/linux/of.h       |  16 +++----
>  3 files changed, 102 insertions(+), 33 deletions(-)
> 

>  /**
>   * of_map_id - Translate an ID through a downstream mapping.
>   * @np: root complex device node.
>   * @id: device ID to map.
>   * @map_name: property name of the map to use.
> + * @cells_name: property name of target specifier cells.
>   * @map_mask_name: optional property name of the mask to use.
>   * @arg: of_phandle_args structure,
>   *	which includes:
> @@ -2118,18 +2145,19 @@ int of_find_last_cache_level(unsigned int cpu)
>   *
>   * Return: 0 on success or a standard error code on failure.
>   */
> -int of_map_id(const struct device_node *np, u32 id,
> -	       const char *map_name, const char *map_mask_name,
> -	       struct of_phandle_args *arg)
> +int of_map_id(const struct device_node *np, u32 id, const char *map_name,
> +	      const char *cells_name, const char *map_mask_name,
> +	      struct of_phandle_args *arg)

Some extra whitespace-related noise in here. Last line wasn't changed,
so there is no need to touch it.

>  {
>  	u32 map_mask, masked_id;
> -	int map_len;
> +	int map_bytes, map_len, offset = 0;
> +	bool bad_map = false;
>  	const __be32 *map = NULL;
>  
>  	if (!np || !map_name || !arg)
>  		return -EINVAL;
>  
> -	map = of_get_property(np, map_name, &map_len);
> +	map = of_get_property(np, map_name, &map_bytes);
>  	if (!map) {
>  		if (arg->np)
>  			return -ENODEV;
> @@ -2138,11 +2166,9 @@ int of_map_id(const struct device_node *np, u32 id,
>  		return 0;
>  	}
>  
> -	if (!map_len || map_len % (4 * sizeof(*map))) {
> -		pr_err("%pOF: Error: Bad %s length: %d\n", np,
> -			map_name, map_len);
> -		return -EINVAL;
> -	}
> +	if (map_bytes % sizeof(*map))
> +		goto err_map_len;
> +	map_len = map_bytes / sizeof(*map);
>  
>  	/* The default is to select all bits. */
>  	map_mask = 0xffffffff;
> @@ -2155,27 +2181,63 @@ int of_map_id(const struct device_node *np, u32 id,
>  		of_property_read_u32(np, map_mask_name, &map_mask);
>  
>  	masked_id = map_mask & id;
> -	for ( ; map_len > 0; map_len -= 4 * sizeof(*map), map += 4) {
> +
> +	while (offset < map_len) {
>  		struct device_node *phandle_node;
> -		u32 id_base = be32_to_cpup(map + 0);
> -		u32 phandle = be32_to_cpup(map + 1);
> -		u32 out_base = be32_to_cpup(map + 2);
> -		u32 id_len = be32_to_cpup(map + 3);
> +		u32 id_base, phandle, id_len, id_off, cells = 0;
> +		const __be32 *out_base;
> +
> +		if (map_len - offset < 2)
> +			goto err_map_len;
> +
> +		id_base = be32_to_cpup(map + offset);
>  
>  		if (id_base & ~map_mask) {
> -			pr_err("%pOF: Invalid %s translation - %s-mask (0x%x) ignores id-base (0x%x)\n",
> -				np, map_name, map_name,
> -				map_mask, id_base);
> +			pr_err("%pOF: Invalid %s translation - %s (0x%x) ignores id-base (0x%x)\n",
> +			       np, map_name, map_mask_name, map_mask, id_base);
>  			return -EFAULT;
>  		}
>  
> -		if (masked_id < id_base || masked_id >= id_base + id_len)
> -			continue;
> -
> +		phandle = be32_to_cpup(map + offset + 1);
>  		phandle_node = of_find_node_by_phandle(phandle);
>  		if (!phandle_node)
>  			return -ENODEV;
>  
> +		if (!bad_map && of_property_read_u32(phandle_node, cells_name, &cells)) {
> +			pr_err("%pOF: missing %s property\n", phandle_node, cells_name);
> +			return -EINVAL;
> +		}

This will trigger the cells_name property check even if later we
discover that we have a "bad" map. Is it intended / required?

> +
> +		if (map_len - offset < 3 + cells)

of_node_put(phandle_node);

> +			goto err_map_len;
> +
> +		if (offset == 0 && cells == 2) {

... if it's not required, then the bad_map check can be moved before the
loop.

> +			bad_map = of_check_bad_map(map, map_len);
> +			if (bad_map) {
> +				pr_warn_once("%pOF: %s mismatches target %s, assuming extra cell of 0\n",
> +					     np, map_name, cells_name);
> +				cells = 1;
> +			}
> +		}
> +
> +		out_base = map + offset + 2;
> +		offset += 3 + cells;
> +
> +		id_len = be32_to_cpup(map + offset - 1);
> +		if (id_len > 1 && cells > 1) {
> +			/*
> +			 * With 1 output cell we reasonably assume its value
> +			 * has a linear relationship to the input; with more,
> +			 * we'd need help from the provider to know what to do.
> +			 */
> +			pr_err("%pOF: Unsupported %s - cannot handle %d-ID range with %d-cell output specifier\n",
> +			       np, map_name, id_len, cells);
> +			return -EINVAL;
> +		}
> +		id_off = masked_id - id_base;
> +		if (masked_id < id_base || id_off >= id_len)
> +			continue;
> +
>  		if (arg->np)
>  			of_node_put(phandle_node);
>  		else
> @@ -2184,11 +2246,14 @@ int of_map_id(const struct device_node *np, u32 id,
>  		if (arg->np != phandle_node)
>  			continue;
>  
> -		arg->args[0] = masked_id - id_base + out_base;
> +		for (int i = 0; i < cells; i++)
> +			arg->args[i] = (id_off + be32_to_cpu(out_base[i]));
> +
> +		arg->args_count = cells;
>  
>  		pr_debug("%pOF: %s, using mask %08x, id-base: %08x, out-base: %08x, length: %08x, id: %08x -> %08x\n",
> -			np, map_name, map_mask, id_base, out_base,
> -			id_len, id, masked_id - id_base + out_base);
> +			 np, map_name, map_mask, id_base, be32_to_cpup(out_base),
> +			 id_len, id, id_off + be32_to_cpup(out_base));

Again, having whitespace changes doesn't simplify reviewing.

>  		return 0;
>  	}
>  
> @@ -2198,5 +2263,9 @@ int of_map_id(const struct device_node *np, u32 id,
>  	/* Bypasses translation */
>  	arg->args[0] = id;
>  	return 0;
> +
> +err_map_len:
> +	pr_err("%pOF: Error: Bad %s length: %d\n", np, map_name, map_bytes);
> +	return -EINVAL;
>  }
>  EXPORT_SYMBOL_GPL(of_map_id);

-- 
With best wishes
Dmitry

