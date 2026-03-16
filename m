Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB146F53D91
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 19:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+cnQIkFDXwporw30NasLf4kSq8rzFR+Uzt/PemH3SE8=; b=eX/Jj6LLrGid7TuMVt7AUDY+Dw
	kbLr6OIg9oPxr9lWT96oZ23rp9ic3TYE7+7BwRJp2agAEsA5d+shlU5ZJPKyrbRjsmU2qhpeHPv1o
	ceiADPcrJXipu/JVa36g4MgsuMdYxCR6aIm1JdGbDkEVRkfBSf1L3U8m3EhOq+lIQHKgahtzFYuE8
	NkLYFf9iavC1aUYCYXDEE2FVEPjMF4glJJPu+c6kogkZBa+u1ybkcVd08aYoHfoLLn37+Ca6Sz4UM
	PatAQAHlMiiqjagkCzEEFX0aqlPsZCt5jfRWqYIylpI3gPRkVb1I+E7p9Z8zojyuPS5dgujj+iNCd
	n7trgBmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Dq6-00000004m4H-08ih;
	Mon, 16 Mar 2026 19:42:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Dq3-00000004m3u-2Kvq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 19:42:56 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GDeEdP042125
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 19:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+cnQIkFDXwporw30NasLf4kS
	q8rzFR+Uzt/PemH3SE8=; b=TZMBzrho1ZI9j3MecyDJMrQhyfYnbp7F+HbgPg7R
	mqfG+xh/rvJqlW2mwKsCyVLwfzrC53QO8yBljjCYZZZjYabFv0bm9U5n4/bMcabq
	YF91ns+etwVEXWpgUnVfpVioCHWVnw7Cx0EpIQWBBbaQQV+X0Z4FCLk/ECUB2gu9
	IFz9s4XLYnswCOPX/A5G3JbjNPfwmH51uRI3xjMeiVaFLgWnjFPeSppW8kGt/5db
	2TR/0eQePYHL75VvPioyDrfUy4lTd5GC02JHxagrRGm3bXDSnk3HmHyicFSh+ZvW
	B756UKaOFmyJet8cUhVlEyPQtuuFGVvOCTwZLpwxvLTArw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxdt82me3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 19:42:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd820c6a4fso4405550585a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 12:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773690173; x=1774294973; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+cnQIkFDXwporw30NasLf4kSq8rzFR+Uzt/PemH3SE8=;
        b=ZYYBE526aRYFRktua8yPxM6QSn+v4WpPFXm5pS6pfxMFh2/dqjMsNHCQA6HQVU8bkg
         F6zmkO/n9l/Bn1Ydcumea3bKoWKrm/dhRzwzLJ1WdfrJ5SN+TrFN0dY0VPXF9h1w2Uvs
         peYsK+kVlpTcqBK4qr6NW2HmcH6aaFv8ij4ufEO0UxEk6ffSLGB6rUYYQBY6bx4m2+/C
         NwRaVp6rPodh7mX7+jV3Rb9wRl0VKPRU297qDpQUlxAng4BhboDFUaCvWvp/d6u9DV/e
         Yfdyi+mH1IYdA5BG4Yz3E570+kEbMakFX5kY/fz4LEKrssb2moACsf6kYhy82usXL3e8
         XdEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773690173; x=1774294973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+cnQIkFDXwporw30NasLf4kSq8rzFR+Uzt/PemH3SE8=;
        b=bhTxT7By6JFsOamQ1bX4BwO+lfm8KlDxQNc8Ct+lKRXLdkn46kobeIga/JfoHPYUh7
         xF0gtISB1LFfvuEewkMvX/xR4iB7bw2ZPCgoLkJPrh9juOST1C6XXBYfwEUUC3o/iwPp
         1VaVAUH9GwsxrLBu8N0eBTp8nZSFDJmmdTM/hLhwsJf1kLSMwd4DS+o+vz868kvjEPI6
         hpdlpIWO6QF+RHBSB99jJYIuOOmC/Peysm3n7U80U9s/2NhFmrUhbPawjJRYBgFq/KhW
         /bUSK8AqUW+/vVFsvRrA57aNO/iLEz+m4UfTN+YjMgRX3nNdhBuolaw+c7sGv6kXv7/x
         2T8Q==
X-Forwarded-Encrypted: i=1; AJvYcCW3o65RxqYBDJGJRj9wfuyKqak0nnmnKDZyuXRUaZ2NZB2Dvj/oO2ZR6ypm1mB/cWFYE88s/088ulSL68Hjj4cC@lists.infradead.org
X-Gm-Message-State: AOJu0Yz10t0wZRIoUWGBj/xdkQAMr7V5Qz0z4unwBwVopkBKIw6/HlDI
	3Wafw7hrDVSHUseFXgoMwe4Vcf1+RlAWiAeFzHidRb4GVyKjuutXYVgaPu4335NPnyceJkEimBL
	zCYhXKaWBTHZSXkJ0RRcX55t/3tbOCkesQQF8mJhnb32ik356agtWv9DM7za65xl8dtQM+y9kHm
	EnVA==
X-Gm-Gg: ATEYQzzCz0U4ubc4R6/SfCIZ2MLIki5SUEwZ4AcdGHdTkBOlu8tt5Fu0d8Okz66kyLQ
	7iU0TxkFbBlL5w821uBVygK59y5pyidGy87fyNwq5F1fOSY98t2jG/9pmo8N6YdLd4ecITtivnF
	rfosNjhVsafOYSUiBfaf9TmI87vyz+fj6IGVUS/GyNDWCbJpfntpWSUqH4Kar+0qD7J9ZfupufQ
	067Z27bJ4ojj8u85Ce2xSx//o2hncmfDY+UjjosdTnWjUho/CYJ3i85bIf4JH43Q4nD7YJcED9s
	6vTjtbb/LAyJIAt8H0rK0Ws2TME9WOg123XgVuCTFF6B4UpZANQKrCbQJwDdpMy79gVbFs/706O
	V3QS329OGEusgNZWOaSMX26HEVhfNb8awTdfXusNv4Ho4xod6fBBYaDb1Q566wMISdie6h6k/JA
	K+4c00WXPk1/la3bM3k3McNvYuod7ijfCXrhA=
X-Received: by 2002:a05:620a:28cc:b0:8cb:72b2:2a14 with SMTP id af79cd13be357-8cdb5a4b8f1mr1825089085a.16.1773690173124;
        Mon, 16 Mar 2026 12:42:53 -0700 (PDT)
X-Received: by 2002:a05:620a:28cc:b0:8cb:72b2:2a14 with SMTP id af79cd13be357-8cdb5a4b8f1mr1825082085a.16.1773690172393;
        Mon, 16 Mar 2026 12:42:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155f33be6sm3676665e87.7.2026.03.16.12.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 12:42:51 -0700 (PDT)
Date: Mon, 16 Mar 2026 21:42:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Marc Zyngier <maz@kernel.org>,
        Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] of/iommu: support multiple iommu-map entries per
 input ID
Message-ID: <z4eqsfnxiprfktxi5g7miqqukhjsqqbivs4jqmox6r75x6pbyd@hgtkiy3ltyzu>
References: <20260315-iommu_multi_map-v2-1-51b98cb79331@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260315-iommu_multi_map-v2-1-51b98cb79331@oss.qualcomm.com>
X-Proofpoint-GUID: MFVVGyMKf-QxKotuXpd1CVU2G0tPuBYd
X-Authority-Analysis: v=2.4 cv=CKInnBrD c=1 sm=1 tr=0 ts=69b85d3e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=b47Md4NF8ZsVKqcXDakA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: MFVVGyMKf-QxKotuXpd1CVU2G0tPuBYd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDE1OCBTYWx0ZWRfX9XFWMy9G1VjM
 6XAGfrHRMMFngT2yEQMGsJRe6K1rDJSYmBMQqCBk2rYkzXRPuXZMg9/6wFdq5C3TKHykbYnOxJB
 1Z6TfRnAMEEfuOSGdjdrZTfWkBiFqpdKNB9SkgNOtU9RcPwEDqS/ZVkfTRJfOH7ukDHM6nOdAce
 CW/EEBlH39JD3q+GR6r0lzzhqqEie1pZWUrwS10TzzUBfF2aYew8bRpdSjxvnoDy5/9t9Req2JL
 At3dNioq/PkcrkVAxeLv8qCgg1TjZEsG6Ts4S2rhHFh86xp6/u9lrCwKeYClILdlBLy+4Gb6Fji
 AydRCJ8tWEvTf5EfVJx0YcCAN1fCZMpbae0XOjEfNLtCfCTcqD1EHlsGJzLr6msWRkbB80EYBWt
 kX7FKT+FWnic93ZGokWM79bQKaOyZAfHoxpgnFEjju89EgZ+QlR6Tv76QW1spsI9dro0qGSSbzc
 fi1+XHftiYp50djaZ5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_05,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_124255_725395_42904977 
X-CRM114-Status: GOOD (  19.39  )
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

On Sun, Mar 15, 2026 at 10:37:43PM +0530, Vijayanand Jitta wrote:
> When multiple mappings are present for an input ID, linux matches
> just the first one. There is a usecase [1] where all the mappings
> are to be maintained in parallel for an iommu-map entry of a same
> input id.
> 
> Add a next_offset iterator parameter to of_map_iommu_id() and
> refactor of_map_id() internals into a static helper to carry it.
> Update of_iommu_configure_dev_id() to loop over all matching
> entries to support this case. All other callers pass NULL and
> are unaffected.
> 
> [1] https://lore.kernel.org/all/20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com/
> 
> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> ---
> On Qualcomm kaanapali, the VPU hardware has multiple internal blocks
> that generate different stream IDs for the same input ID. The device
> tree encodes them as separate iommu-map entries sharing the same input
> ID:

Vijayanand, even I would not understand what you mean here. What is the
"input ID". Please describe the issue _exactly_, which blocks, what do
they genrate and when.

> 
>   iommu-map = <0x100 &apps_smmu 0x1940 0x1>,
>               <0x100 &apps_smmu 0x1a20 0x1>, ...
> 
> This requires multiple iommu-map entries per device.
> of_iommu_configure_dev_id() currently stops at the first match,
> so only one stream ID gets registered with the IOMMU.
> 

-- 
With best wishes
Dmitry

