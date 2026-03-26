Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A51C109E54B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 05:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=808xdNmKLCaAFJRD8fSiUQE9ujHk0+F2A04hZAqckLw=; b=f8BSuSGkUuB1OEuoycgeS49OUw
	DNkKObEnoE9c4XmX+rkANxzvYgAyjItkevPq2Yy36ndSLERdczP6KCj+C2Zk5AjxxVrqNT/R1Qtie
	wF1Gj5s4UNxyYQFEg/nxlY0VPEwv5kgabqw76h1xjYxItqltr1ekA5LhMh4HgUw9QvmFFvSS2A9CW
	8VkQN09XZghnH91REeWOyf9vq5HQUSMEyaTJON0/YVzr5MK8v2nRQoxa06p3YbbEtnyg3GeJ17uIK
	7Ic17uKPt7T+t3hA9C992XHqbRB1HZp2fvuAncHssIQzHZkLk3yGfr1QlLpubhdPY3nslygml4BWY
	jiRduPPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5dgd-00000004lU4-3I6j;
	Thu, 26 Mar 2026 05:55:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5dgb-00000004lTf-2t2E
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 05:55:19 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PKwLhQ1175797
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 05:55:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	808xdNmKLCaAFJRD8fSiUQE9ujHk0+F2A04hZAqckLw=; b=g6USjlaGedJfM+6c
	sh043EGNYzelCOV0izT4tNV/QLb3n01n46Bcfmfqhk0dekR80UJbYOv+ECiKyqF5
	hDGBoDW4HjYW1FAnHB6HQjPL6wiU4HzOonNQwpb/m8z7iZT58NXSi3dOBPrIjoKw
	wuQ+A2qImDN45is0qhRImk0Fg9/VXYXt4bbMo7IOL2woERqueHmWAt0hrmhyhiv0
	JLF5Kd2kqXU71weN+dS35T63ejg75uq5aWodNW+gv5W1MJbCfegg49wHfqx8ROk+
	Zh+yu0VCeaDvVnApliD+U5Gk5SVWVPwHYOe3DC9JmVtMZhekVG/bxeogXSihbsCE
	J0PCCw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4q76sd4n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 05:55:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2adef9d486bso11898545ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 22:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774504516; x=1775109316; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=808xdNmKLCaAFJRD8fSiUQE9ujHk0+F2A04hZAqckLw=;
        b=PPmBBnFhNA6ApKMgqRUudbvIAeBGDGFyp8Ql4sdwb2r/JBlkalmv5Ge+Su5sAcmPHe
         jnUGnDGqefBwAsMpmCOsSBUfWAsWTcD/Z0CKivtmg16AdyTowQ/YtLGQc4rfr+52XynB
         FKg0q+ftLUXXxGycECKGrb3cPQMUU+wfL7LmDvU9ePqV2JY3NyschUjK/bO/aBqk7OpQ
         +OvfMLgcjunA19KIvPPIzjWHAiF1Gzha8J6PDfwdpiMqX6Z4NFX19/K7Z4/a+WSNZTXM
         DHEaL2NCRB0YfTdvOyZ32bwxD7PtvU+NTknpNN+2Gp7I4t8K3DYIAYKFJ5+6xEAGHAS2
         YFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774504516; x=1775109316;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=808xdNmKLCaAFJRD8fSiUQE9ujHk0+F2A04hZAqckLw=;
        b=Qc9uaiY1NA+CeKZzElarZGNpNyv8iuV2RR5b5KLz3wLUnJe22QP2qV5WJX6Bgyu9sY
         hmB72HVYnBwM1UyEli6V5ChY/Cv8XNvltP6vX/JoNDd3Llt26/tbb92G9kCjJ6egegoy
         mEK+NTKfj9Ed9cOpz/WIe/Y/4U0dIV2bPzcJI8+dT7pAZGLlsmj5iimfsVNL84YuuBEr
         IzUctRL4nWAU+t3Q2yTcUesV6qlsPvElq3BuBfIbDjIOivXr3zLCniGv2UvMDiNB3g2J
         vopknDEKlPgbkdi3EN3mfBxUyRbjymE/TCbwHfo3sAOzy3dGPfClqCTeDh6uTC8cwtPa
         bqCA==
X-Forwarded-Encrypted: i=1; AJvYcCViR20kzDMy6D7omm1TlN5AFKSSsit4xbqua7kCbA1bRZiLgb2NSvbLEJCY9gYvRitJSLmcEofapYHQYmaxU+cY@lists.infradead.org
X-Gm-Message-State: AOJu0YwuLSCettwePnrmgUpx+aMa2sRh937PHKsONat6xZNzAJ/ZMWPh
	EBGHIvxBEylUWLeBRaxRq8up451cSy3RfwAsDcBzFAW0k/iHLoZ3sIkRYfbNWwBfLxUaH+HixL8
	6u+xFsjy9E3cERhW5ARHc4dQSAUEDDcH5w7ozLtegK1DB8CmFsYNNATRN5bi9d1N/df49GXQl/a
	FNyw==
X-Gm-Gg: ATEYQzwPAhuz2cTLJt72zycpSuL/5PcYag1BlQ5axETJ9AmXIT2PQjiuiTIS8c2sTns
	7rzlNpjPhPHYiUzxDPAExa/62rfLrpZ2huJdPaoP5s57b+JcNYtGi9LzVonS2gTyR9lmJZZOL0/
	+J+ZM6K23PuTQ687YIabnvWJi8+uCjsJFOgicJXUyKc/B9gAjQszOZXmdrwaTQvoDSKss88uKJo
	PVfj5e9hNtgk97EnGClrIQIXB7nKd5fLg0Tq9YOYUdvdQstISbNMLLiFRdX+LX3th7dZu5aScGO
	Gqk4jOETSEN1JQujZjquAhaG6u1LTj9XtCtcEGxniql9HFCL+UGidNT9+0NYQHQUCFX+hzLwsuv
	NKliVXQ+FewFCFxd/RUWRGqiddCBz3nsonSHZqsGpOVJ/L9UUvfpw25lL
X-Received: by 2002:a17:903:1b10:b0:2b0:673a:7c90 with SMTP id d9443c01a7336-2b0b0aad881mr74442665ad.28.1774504515823;
        Wed, 25 Mar 2026 22:55:15 -0700 (PDT)
X-Received: by 2002:a17:903:1b10:b0:2b0:673a:7c90 with SMTP id d9443c01a7336-2b0b0aad881mr74442365ad.28.1774504515275;
        Wed, 25 Mar 2026 22:55:15 -0700 (PDT)
Received: from [10.219.57.109] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc87e820sm17098715ad.50.2026.03.25.22.55.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 22:55:14 -0700 (PDT)
Message-ID: <65f76d05-1474-46d3-aa71-4acfe86c5718@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 11:23:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 0/3] of: parsing of multi #{iommu,msi}-cells in maps
To: Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal
 <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas
 <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
References: <20260325-parse_iommu_cells-v11-0-1fefa5c0e82c@oss.qualcomm.com>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <20260325-parse_iommu_cells-v11-0-1fefa5c0e82c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NOPYOk6g c=1 sm=1 tr=0 ts=69c4ca44 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=G4NFmJWIaiRLgIwbil8A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: MdgrOLIBkcLSN_TsT11plRcytLGRteCm
X-Proofpoint-GUID: MdgrOLIBkcLSN_TsT11plRcytLGRteCm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA0MiBTYWx0ZWRfX5oRrYeM1Q0d1
 +A9fRRIEaaysxVGXsHMpkHH/jQf0cgpKLxS8KnDD0hCYyDDDDuUZQySCHBpdoFICzs4mSVglyFU
 cFcANYPWc5uOa1C0i2hQn8y2vy9VnigraRNGgl1uWGDXI2veLwdYpO2/hei2e3clMwJkQyWMWDH
 K+4FQPOqVxIeRhy6QCnH2F8aLFIFLOc8/ymacuG/4okMaTkNesEj5ipNtGLr/+IWTTWbzz/ZJyk
 lZMrv9a3IIIxFf+eLT/n1fAhdedE04nKDIboU39Dur5HXbfKUJt1hhGJ3RdEb6LYB5F4j+P2fSk
 +cM4OlOMEdQJ4qxXRq3HTQu4R+xZ9f62bIY5LRKuJlRGapPChUfne7U4Oit6OY46lSCH9nzIgwt
 +r9P6m4CjXqq4RaWirDouJEgDlkbvySqVfQBGBAkpClQM2lIFJlVkWMv4Kt1R8KuCOlxzw2TUYb
 O5KHjn51rgRanCt/nkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_225517_766137_BBA3410C 
X-CRM114-Status: GOOD (  34.43  )
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



On 3/25/2026 4:38 PM, Vijayanand Jitta wrote:
> So far our parsing of {iommu,msi}-map properties has always blindly
> assumed that the output specifiers will always have exactly 1 cell.
> This typically does happen to be the case, but is not actually enforced
> (and the PCI msi-map binding even explicitly states support for 0 or 1
> cells) - as a result we've now ended up with dodgy DTs out in the field
> which depend on this behaviour to map a 1-cell specifier for a 2-cell
> provider, despite that being bogus per the bindings themselves.
> 
> Since there is some potential use[1] in being able to map at least
> single input IDs to multi-cell output specifiers (and properly support
> 0-cell outputs as well), add support for properly parsing and using the
> target nodes' #cells values, albeit with the unfortunate complication of
> still having to work around expectations of the old behaviour too.
> 							-- Robin.
> 
> Unlike single #{}-cell, it is complex to establish a linear relation
> between input 'id' and output specifier for multi-cell properties, thus
> it is always expected that len never going to be > 1. 
> 
> These changes have been tested on QEMU for the arm64 architecture.
> 
> Since, this would also need update in dt-schema, raised PR[2] for the
> same.
> 
> [1] https://lore.kernel.org/all/20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com/
> [2] PR for iommu-map dtschema: https://github.com/devicetree-org/dt-schema/pull/184
> 
> V11:
>   - Added explicit filter_np parameter to of_map_id() and of_map_msi_id()
>     per Dmitry Baryshkov's review feedback, making the filter explicit
>     instead of overloading arg->np as both input filter and output parameter.
>   - Removed of_node_put() from inside of_map_id(), making the caller responsible
>     for reference management. Updated of_msi_xlate() to properly handle reference counting.
>   - Collected ACKed by tags, and fixed minor typos.
>   Link to v10:
>   https://lore.kernel.org/r/20260309-parse_iommu_cells-v10-0-c62fcaa5a1d8@oss.qualcomm.com
> 
> V10:
>   - Move of_map_iommu_id()/of_map_msi_id() from include/linux/of.h to
>     drivers/of/base.c as out-of-line helpers per feedback from Marc Zyngier
>     and Rob Herring.
>   - Add kernel-doc to document both helpers for discoverability and
>     usage clarity.
>   - Fix of_map_msi_id() wrapper and all its callers (cdx_msi.c,
>     irq-gic-its-msi-parent.c, drivers/of/irq.c) to correctly use the new
>     struct of_phandle_args-based API with proper of_node_put() handling
>     as per feeback from Dmitry.
>   Link to v9:
>   https://lore.kernel.org/r/20260301-parse_iommu_cells-v9-0-4d1bceecc5e1@oss.qualcomm.com
> 
> V9:
>   - Updated TO/CC list based on feedback to include all relevant
>     maintainers.
>   - No functional changes to the patches themselves.
> 
>   Link to V8:
>   https://lore.kernel.org/all/20260226074245.3098486-1-vijayanand.jitta@oss.qualcomm.com/
> 
> V8:
>   - Removed mentions of of_map_args from commit message to match code.
> 
>   Link to V7:
>   https://lore.kernel.org/all/20260210101157.2145113-1-vijayanand.jitta@oss.qualcomm.com/
> 
> V7:
>   - Removed of_map_id_args structure and replaced it with
>     of_phandle_args as suggested by Dmitry.
> 
>   Link to V6:
>   https://lore.kernel.org/all/20260121055400.937856-1-vijayanand.jitta@oss.qualcomm.com/
> 
> V6:
>   - Fixed build error reported by kernel test bot.
> 
>   Link to V5:
>   https://lore.kernel.org/all/20260118181125.1436036-1-vijayanand.jitta@oss.qualcomm.com/
> 
> V5:
>   - Fixed Build Warnings.
>   - Raised PR for iommu-map dtschema: https://github.com/devicetree-org/dt-schema/pull/184
> 
>   Link to V4:
>   https://lore.kernel.org/all/20251231114257.2382820-1-vijayanand.jitta@oss.qualcomm.com/
> 
> V4:
>   - Added Reviewed-by tag.
>   - Resolved warnings reported by kernel test bot, minor code
>     reorganization.
> 
>   Link to V3:
>   https://lore.kernel.org/all/20251221213602.2413124-1-vijayanand.jitta@oss.qualcomm.com/
> 
> V3:
>   - Added Reviewed-by tag.
>   - Updated of_map_id_args struct as a wrapper to of_phandle_args and
>     added comment description as suggested by Rob Herring.
> 
>   Link to V2:
>   https://lore.kernel.org/all/20251204095530.8627-1-vijayanand.jitta@oss.qualcomm.com/
> 
> V2:
>   - Incorporated the patches from Robin that does the clean implementation.
>   - Dropped the patches the were adding multi-map support from this series
>     as suggested.
> 
> V1:
>  https://lore.kernel.org/all/cover.1762235099.git.charan.kalla@oss.qualcomm.com/
> 
> RFC:
>  https://lore.kernel.org/all/20250928171718.436440-1-charan.kalla@oss.qualcomm.com/#r
> 
> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> ---
> 
> ---
> Charan Teja Kalla (1):
>       of: Factor arguments passed to of_map_id() into a struct
> 
> Robin Murphy (2):
>       of: Add convenience wrappers for of_map_id()
>       of: Respect #{iommu,msi}-cells in maps
> 
>  drivers/cdx/cdx_msi.c                    |   8 +-
>  drivers/iommu/of_iommu.c                 |   6 +-
>  drivers/irqchip/irq-gic-its-msi-parent.c |  11 +-
>  drivers/of/base.c                        | 213 ++++++++++++++++++++++++-------
>  drivers/of/irq.c                         |  11 +-
>  drivers/pci/controller/dwc/pci-imx6.c    |  18 ++-
>  drivers/pci/controller/pcie-apple.c      |   6 +-
>  drivers/xen/grant-dma-ops.c              |   5 +-
>  include/linux/of.h                       |  30 ++++-
>  9 files changed, 237 insertions(+), 71 deletions(-)
> ---
> base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
> change-id: 20260301-parse_iommu_cells-1c33768aebba
> 
> Best regards,

Hi Robin,

Could this series be pulled into an immutable branch/tag, if it doesn't
make it into the v7.1 merge window ? There are client changes dependent on it,
So it would help to get them moving forward rather than waiting another cycle.

Thanks,
Vijay

