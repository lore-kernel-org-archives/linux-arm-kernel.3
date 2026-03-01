Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A361FD0060
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 12:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CHM6ea+T/SQTyKD6VE8gREYxtQS0AV0BBIY+fO3U/+Q=; b=c8/crKLwSS59d3xAJYBx9OKUbz
	Fx9aBp5CmzR036voz8yxLpyXkB2+ZnYqUJZGMKeqOtE58t85meJs4j4nMJdC6XpRd/JIlN+rqosw+
	qCrXyZuKjE3dNzioeB+98jtpcJBY999fDE6cb4pdEvVdnGTnRZ/VMn9yzd5nYz+IgLDDHIBnSi8g3
	792T69/Kt/ZGjzBBP1DS1MKjJ8Y59Yi5lVmShoDXk85AMEo4MfMKCcUXfUjbVIkgOPappI9HaQVEE
	tuYZ3nvR6DJEB6moMgAjYz2ZIAfmszvQAYtGItNP8Fh79vpqky2q10PsQ1wmiTHNuPBxQk0+Lqq3x
	H2ULUTVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwfZl-0000000B5aJ-1DUN;
	Sun, 01 Mar 2026 12:07:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwfZh-0000000B5Zw-38tW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 12:07:07 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 621AU6Vq2979634
	for <linux-arm-kernel@lists.infradead.org>; Sun, 1 Mar 2026 12:07:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CHM6ea+T/SQTyKD6VE8gREYx
	tQS0AV0BBIY+fO3U/+Q=; b=WoP5ZbKpVdVKlkXv2aH+KEPi03kUWMTYBCJXM+o0
	bueM9nMs/bFFYl420otJKZY2dXshgOWxzxAFKqgZHYZv9Y+wfE00JUx9gc9JCh6y
	V+d7SqShjxe+e3A4/hPi/TSmO2SHHa3u4E4bpGSwPJrOw7mX9mMBDw/bmCKTBp/I
	txGW5FF5wCHDF770OacBskjkh+vvedtPD21saeukgigmMIxit4IgxQAnS+fsvhPs
	F+p68LXBy/X93NlrWUCnmXUMXNp8Iordm9wjkO/Ua6JnTSz5zG0EFCHsrsYlGufg
	Kw00/KOKaJQnpLM74TWrU6XkLJxwFn1k/m3ivgU4SjGccA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksf8jp6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 12:07:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70fadd9a3so4004211085a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 04:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772366824; x=1772971624; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CHM6ea+T/SQTyKD6VE8gREYxtQS0AV0BBIY+fO3U/+Q=;
        b=ZziTjQk46zmzkSzo3fJCz1CIIElktNMn3ieaq8bMtfhu+sagEk1Rr7+86gaSWZtX+C
         YRpvaa6uRak5w6IfBXZW4cNyakNGis8ENmfTLIH8G+qYnivd5ME2RKQqOr09SU/TjSht
         Iy6MPvSVAXjuzOMl2ru5mHGGSVI/90quQw75qZnuVnzzGikrN71imwgglemLQJseVsCz
         500pO6CAdcUK0UrMNJ+BYcgigEOujacmiYmGq7sukHUyIFkPo381sGjfmDdFlGW7j1ul
         pRAiXCc657pr/1bbtdZlOcgyeRy/w+LyIy1UruaYGMGfqYXZBtgrp4SvI27Ws7RNgger
         VYLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772366824; x=1772971624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CHM6ea+T/SQTyKD6VE8gREYxtQS0AV0BBIY+fO3U/+Q=;
        b=Zxt38v1pJ+TlYyjlcXIH1a7HpryxB6lv47q8/47BBx+YfyEfSJF/eV0LCZCpPUihdI
         et4olZHablxp38w1l/GVjRm+dcTs5zKdEsBROl1A39gmWaFeDanZqOGQSpigOfKDmUKy
         Vj9ZmaWCGwRkAqYMKru8zfuEt09OyRXDu8e/dlpkixBtpFqOzdmcQ3aJ5Zx1hV7wLKN9
         pvrQUXWGyiWWhrfYxNgSa7u1B+Dh9T9XXPFeFTU4ZGdaNw3Yb/ZQD2O2oXoTb7a/woXo
         jkzszy8sYF34Srv3qfZrzWpYP3QWlg3HodtDBZjS1ux4e+p/pVUQ/Vv1hagdMkSByjxP
         I+lQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBqi13mvmoFvzlSwTG1QO8+btfopsFY0vnYigNX4oF0Tv7np2uh+nWEbT8q86CBJ3NdX9xyaVgTZTf+0nQq1B2@lists.infradead.org
X-Gm-Message-State: AOJu0YxrjJdTnh9OIOcD38RDwWUsQNGDJ/P+W8/xMtrhqTGUbcju9BHw
	RaC7ZuvD1Ag/Hzot3FqUsMQ5ilZBnbri2Sl4ycmjkQshhQ1I/IAEyYvFxNp0Cg8EfcsyTM1Rns9
	uEQZqNqsTIo2Hf2/4ByQLsCp+sQhh8oTKSLoRwwxYAuujGWFuMKkvIUjHQqivTebri7plTaXTEB
	aZ+Q==
X-Gm-Gg: ATEYQzzR/LSXHzU4YOEcEm0pd8HrIO3lYWFRzppdlR5Brvzx4VzEYG0XGX3uplb91rn
	CNtoTxkxGyY62K13mCrnt0HcWPyEVhCr+IE5tj9PHLewYcGkE8W29VVqwuiCVNCxAAcBdffxpZV
	Q+dpdD4Pp1opoPAKQfzX4ZzIphTHHR7eznpMGxvtcTt0Y+9AOWFEkUKwjjQE03F6JCuY8wPg6ul
	7FgiiMZUlZ/qOXy4qqp69BqFUZH0pgUfyihNcL6Q12ohksS3K9SvxT3qy+iSqZNcZVU9XNkUvYD
	jBsZKJZCgReMTTGYOxjzWv++pcqoXlX9zVfiBzNRUtNfWqG4CGMS2m488WCDm7ZmL5pgypF83Fa
	NQi+o+bwmmO+O0Rl5DkYASVQLhHzqz/OXh0u0to/ex9/c7GCldajTwCxwFGqfBKg5+rzdLb5jUy
	1tofFK3qAiINJGHSP9JT9Musk186BxIc/KIQQ=
X-Received: by 2002:a05:620a:198a:b0:8b2:7435:f5ef with SMTP id af79cd13be357-8cbc8e4f7a8mr1056039685a.41.1772366434877;
        Sun, 01 Mar 2026 04:00:34 -0800 (PST)
X-Received: by 2002:a05:620a:198a:b0:8b2:7435:f5ef with SMTP id af79cd13be357-8cbc8e4f7a8mr1056033185a.41.1772366434283;
        Sun, 01 Mar 2026 04:00:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115bd5a66sm1006367e87.34.2026.03.01.04.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 04:00:32 -0800 (PST)
Date: Sun, 1 Mar 2026 14:00:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
        Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
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
Subject: Re: [PATCH v9 2/3] of: factor arguments passed to of_map_id() into a
 struct
Message-ID: <khlwmcip3dacnkdc55w37sxplcshfb3uahgfb3cjm4kpdlfi4y@fletnzhayazf>
References: <20260301-parse_iommu_cells-v9-0-4d1bceecc5e1@oss.qualcomm.com>
 <20260301-parse_iommu_cells-v9-2-4d1bceecc5e1@oss.qualcomm.com>
 <861pi3amuu.wl-maz@kernel.org>
 <ehhnta6zvfua723llpb52hh3lwqdh4ttomzt7xqrmcjnsslbop@p4w3gjzxp4rn>
 <86zf4r93ns.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86zf4r93ns.wl-maz@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDEwOSBTYWx0ZWRfX29RToovWD8/z
 e/+TvRC8c3V3ZnE/5qjRoUA7Z/YEt7UkcrDkbIN6rTKIuIk1Gpc3VelnojbVJfzpBpOzDP2UXR7
 WtdD0v8fNEjZ9kh51CxdoCQ/2Bb7MzJSMOJMGLVNLPstDsb7VFWh8iONvLrdBiRLYlnCA1dnfjJ
 C6vYPYPRxZysoQN/aYvsQsDmDu/kWtsSJlrZDyT6fubTHHV1x6phD43LTSwExF2xWBtTndeOJkQ
 i75sOs3bpIpwiU4TTrFgBH6AqIzsNCdc4mwbkTuPi95szBTlFp8c5g+bVl5c67ipy8iCQ8mkx9o
 G43nKu2jyEXpzRg/GdwW9ZmWmK8KP9IXxaak6nTwPryjTE+iZzJiX2DHvX4nGhjepCa6rM+1NeT
 xVOsVSxkskNYiitfmKzw6iFc1R5PkHxFe7/NkyHApAZ2jieCaBleRFN0SFOr/kXx0sgtiOhoCgj
 H3y+DahtgdE/38z0ysA==
X-Proofpoint-ORIG-GUID: oFO59TfLzdjmcEC-ajTSYYIz_8ruMRoU
X-Proofpoint-GUID: oFO59TfLzdjmcEC-ajTSYYIz_8ruMRoU
X-Authority-Analysis: v=2.4 cv=I5dohdgg c=1 sm=1 tr=0 ts=69a42be8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=YG64nluAAAAA:20
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=BCSTLeMbECCLQgZ0D0gA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603010109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_040705_801721_EE3BE069 
X-CRM114-Status: GOOD (  47.11  )
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

On Sun, Mar 01, 2026 at 11:42:47AM +0000, Marc Zyngier wrote:
> On Sun, 01 Mar 2026 10:46:57 +0000,
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > 
> > On Sun, Mar 01, 2026 at 10:02:49AM +0000, Marc Zyngier wrote:
> > > On Sun, 01 Mar 2026 08:34:20 +0000,
> > > Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com> wrote:
> > > > 
> > > > From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> > > > 
> > > > Change of_map_id() to take a pointer to struct of_phandle_args
> > > > instead of passing target device node and translated IDs separately.
> > > > Update all callers accordingly.
> > > > 
> > > > Subsequent patch will make use of the args_count field in
> > > > struct of_phandle_args.
> > > > 
> > > > Suggested-by: Rob Herring (Arm) <robh@kernel.org>
> > > > Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> > > > Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> > > > ---
> > > >  drivers/iommu/of_iommu.c              |  2 +-
> > > >  drivers/of/base.c                     | 37 +++++++++++++++++------------------
> > > >  drivers/pci/controller/dwc/pci-imx6.c |  8 +++++++-
> > > >  drivers/pci/controller/pcie-apple.c   |  4 +++-
> > > >  drivers/xen/grant-dma-ops.c           |  2 +-
> > > >  include/linux/of.h                    | 21 +++++++++++++-------
> > > >  6 files changed, 44 insertions(+), 30 deletions(-)
> > > > 
> > > > diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> > > > index a511ecf21fcd..d255d0f58e8c 100644
> > > > --- a/drivers/iommu/of_iommu.c
> > > > +++ b/drivers/iommu/of_iommu.c
> > > > @@ -48,7 +48,7 @@ static int of_iommu_configure_dev_id(struct device_node *master_np,
> > > >  	struct of_phandle_args iommu_spec = { .args_count = 1 };
> > > >  	int err;
> > > >  
> > > > -	err = of_map_iommu_id(master_np, *id, &iommu_spec.np, iommu_spec.args);
> > > > +	err = of_map_iommu_id(master_np, *id, &iommu_spec);
> > > >  	if (err)
> > > >  		return err;
> > > >  
> > > > diff --git a/drivers/of/base.c b/drivers/of/base.c
> > > > index 57420806c1a2..6c3628255908 100644
> > > > --- a/drivers/of/base.c
> > > > +++ b/drivers/of/base.c
> > > > @@ -2102,8 +2102,11 @@ int of_find_last_cache_level(unsigned int cpu)
> > > >   * @id: device ID to map.
> > > >   * @map_name: property name of the map to use.
> > > >   * @map_mask_name: optional property name of the mask to use.
> > > > - * @target: optional pointer to a target device node.
> > > > - * @id_out: optional pointer to receive the translated ID.
> > > > + * @arg: of_phandle_args structure,
> > > > + *	which includes:
> > > > + *	np: pointer to the target device node
> > > > + *	args_count: number of arguments
> > > 
> > > Number of arguments *to what*? Isn't that the size of args[] instead?
> > 
> > It is a number of values corresponding to the phandle in the DT
> > property.
> 
> No. It is what the *caller* expects. Not what is is in the DT, which
> could be (and generally is) a pile of random crap.

Nice

> If the two don't
> match, return an error. But don't randomly overwrite data that is not
> yours.

Mark, no. The caller can't know how many cell arguments the provider
uses until:
- the provider handle is parsed
- provider node is consulted for the #foo-cells

It is not a number of arguments for the _caller_. It is how many u32
values are used by the _provider_.

In case of IOMMUs, enough IOMMU devices have #iommu-cells = <2>, which
means that it uses two u32 values to identify the SID or set of SIDs.

Following your analogy, if we force 1 cell in the iommu-map property, we
are trying to force the function which expects to take two arguments to
accept just one. But it's not the caller, it's the IOMMU's xlate
function.


> 
> [...]
> 
> > It might be not obvious here for iommu-maps, but the struct is
> > idiomatic in OF world. Let me quote a (trimmed) example from
> > qcom/sm8650.dtsi (for a different property, but it explains the meaning
> > of the values here):
> > 
> > gem_noc: interconnect@24100000 {
> > 	#interconnect-cells = <2>;
> > };
> > 
> > epss_l3: interconnect@17d90000 {
> > 	#interconnect-cells = <1>;
> > };
> > 
> > interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> > 		 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
> > 		<&epss_l3 MASTER_EPSS_L3_APPS
> > 		 &epss_l3 SLAVE_EPSS_L3_SHARED>;
> > /* I skipped the second pair, it adds nothing here */
> > 
> > Here the parsing function for this property (of_icc_get_by_index()) will
> > call of_parse_phandle_with_args() 4 times and it expects to return the
> > following values in the of_phandle_args:
> > 
> > 1. { .np = gem_noc, .args_count = 2, .args = [MASTER_APPSS_PROC,
> >                                               QCOM_ICC_TAG_ACTIVE_ONLY] }
> > 2. { .np = gem_noc, .args_count = 2, .args = [SLAVE_LLCC,
> >                                               QCOM_ICC_TAG_ACTIVE_ONLY] }
> > 3. { .np = epss_l3, .args_count = 1, .args = [MASTER_EPSS_L3_APPS] }
> > 4. { .np = epss_l3, .args_count = 1, .args = [SLAVE_EPSS_L3_SHARED] }
> > 
> > The whole of_phandle_args is then typically passed to the corresponding
> > xlate function, specific to the paricular .np ('provider'), which will
> > use #args_count values from the #args array to return the object from
> > the provider.
> > 
> > Now let's see iommu-maps (again, qcom/sm8650.dtsi):
> > 
> > apps_smmu: iommu@15000000 {
> > 	#iommu-cells = <2>;
> > };
> > 
> > iommu-map = <0     &apps_smmu 0x1400 0x1>,
> > 	    <0x100 &apps_smmu 0x1401 0x1>;
> > 
> > The property matches current definition at [1], however this spec
> > doesn't match the DT practice. It forces that the property should use 1
> > cell for identifying the "object" in the IOMMU provider, even if the
> > provider expects to use 2 cells (two args).
> > 
> > The correct property should look like:
> > 
> > iommu-map = <0     &apps_smmu 0x1400 0x0 0x1>,
> > 	    <0x100 &apps_smmu 0x1401 0x0 0x1>;
> > 
> > [1] https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/pci/pci-iommu.yaml
> > 
> > > 
> > > > + *	args[]: array to receive the translated ID(s).
> > > >   *
> > > >   * Given a device ID, look up the appropriate implementation-defined
> > > >   * platform ID and/or the target device which receives transactions on that
> > > > @@ -2117,21 +2120,21 @@ int of_find_last_cache_level(unsigned int cpu)
> > > >   */
> > > >  int of_map_id(const struct device_node *np, u32 id,
> > > >  	       const char *map_name, const char *map_mask_name,
> > > > -	       struct device_node **target, u32 *id_out)
> > > > +	       struct of_phandle_args *arg)
> > > >  {
> > > >  	u32 map_mask, masked_id;
> > > >  	int map_len;
> > > >  	const __be32 *map = NULL;
> > > >  
> > > > -	if (!np || !map_name || (!target && !id_out))
> > > > +	if (!np || !map_name || !arg)
> > > >  		return -EINVAL;
> > > >  
> > > >  	map = of_get_property(np, map_name, &map_len);
> > > >  	if (!map) {
> > > > -		if (target)
> > > > +		if (arg->np)
> > > >  			return -ENODEV;
> > > >  		/* Otherwise, no map implies no translation */
> > > > -		*id_out = id;
> > > > +		arg->args[0] = id;
> > > 
> > > What if args_count is 0? Given that you place no restriction on the
> > > way this can be called, that'd be entirely legitimate, and you'd
> > > corrupt something you're not supposed to touch.
> > 
> > args is an array (not a pointer) in of_phandle_args. As such we know
> > that args[0] is legit.
> 
> Again, no. The caller is telling you what it expects. This is strictly
> equivalent to:
> 
> 	void func(void *blah[], int sz);
> 
> func() is not supposed to look beyond sz. As it stands, this change in
> not acceptable.

DT parsing functions follow a different approach, because of the "random
crap". It is:

    int parse(void *phandle, u32 **args, int *sz);

So, if the caller insists that it can handle only one argument, it
should call parse(), then check that (sz == 1) and return -EINVAL
otherwise (kfreeing *args and of_node_puting phandle while it does so).

I will quote of_phandle_args here:

struct of_phandle_args {
        struct device_node *np;
        int args_count;
        uint32_t args[MAX_PHANDLE_ARGS];
};


Please take a look at how of_parse_phandle_with_args() works.

-- 
With best wishes
Dmitry

