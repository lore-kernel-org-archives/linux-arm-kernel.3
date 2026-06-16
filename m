Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6C1CD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 00:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KorrUBh94Ss7D1+qQOdc29iDhATuENeNSAm/3rBOeq8=; b=GOLrEmLZeuWzOnzgXP6UaqNNPq
	Pi8x3+k978LeO6lXhrp+PB5qjjXZiYy1M+QMK6QqE7upYLCcYClAYmEsakHMRigh4qo3LxskmyHA4
	3CyCuBgT64ZtwQ81JGOF11cpGca7sBL/1W6vcRZ1IDeyZdBa9lunpAs8/f4txUwayHCGgtmCJzOm4
	ce2XYsZ4WmnIcH7yzwb4yEmocTg0XrINeDnAriHSnE5T2qHlkA/sELJph0j7ufRi4t/ftFVQ/D0J8
	xE3fOj9Wb91y/1j2c2QzuhZbpOQNI0V4sbWkpl2Ch3v9nEKBaoAV4DVOJ9qkgXrWi/qP9pj4Ft133
	Xh+mmwMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZHWf-0000000F0Re-1JMS;
	Tue, 16 Jun 2026 00:19:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZHWb-0000000F0RH-1ERE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 00:19:32 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FJ1UhD1367678
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 00:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KorrUBh94Ss7D1+qQOdc29iD
	hATuENeNSAm/3rBOeq8=; b=Jx1rszsO5ny/jhVDUL2G+0JMtZimuv//fL1a16P5
	NMo8DG5M46RUtxvGs5tsjIQ5IMfOIlyLPuK9elyHvX3Tn9WNQRWxOSuJSFj5ptnc
	Oc9IBaxYqt+KL3PN40dok+x7ja8tuSMerz0U2sUMHmLx8Re2oB9hYzNO/8epGdF1
	WSO3IbThNLClG7ggxmwQvjtcaQEUSLpNtuddg0OSOjFam8gyCqfC7+2gjv/zxdPW
	vzJ/d6Nmp1S5rdHOly7BWGVylQ9IxL90Yvo8hgdKWUcrQucWpufnlpbk7Cavn4Nd
	mP8HuetMKTzvLygy47Im/2copivxy2j/Clk4fVF1j5cruQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eteguusth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 00:19:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915b6b63056so773365185a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 17:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781569168; x=1782173968; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KorrUBh94Ss7D1+qQOdc29iDhATuENeNSAm/3rBOeq8=;
        b=UCTP3vCanbiuCfkWMcdS0NYYjTFgwDzD+JxB+DIK7RgShTa97hyJPgkhqLBMNvjjai
         e1QYAny4u8R18oLTiv04Efrla6UOTTYL+7QEJysyNYTuLg24qvT8Z1CQUXcbbOFx/ENi
         z3tD+Z1+tfrggvsv5lWCLbvuWT1bP2svb8h5VTssGiePnQL5eNgbqy6Qce0sPEUPhZEV
         SGzRFiWKt5N94JDYJ6xWnvYF4tCq9zNHkThk5MJDxAt+OnTA91fZkGWd9OU32gVcltny
         9c75UpGSbB20ANjCgFNaJJ20k5x8i9UQaM69aLUDUb4iPW6bEEG6u4RvyfQrLgQLLGu2
         IsLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781569168; x=1782173968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KorrUBh94Ss7D1+qQOdc29iDhATuENeNSAm/3rBOeq8=;
        b=G/G2HqyYikJFNO+OQXyQBZzc8RI7JyeSC2AWKSB5axmqyGW90an1QykAiRhZGj030a
         ppr9aS1kMwJ3TrWrHWNj/HhBq+5wkBBN2YUqbDXkhETpo7c4LEPPCnHhF64dN8bL7Vw4
         4oo9hTW1/gN0TItiaDGNkjbUdGilkh4endI0j1P/T+frzijnPFLK8RYi38/zbvVHexnk
         cqOMtOKsRCXSfVJMV+aBeYucFKPjYQf3TiX7RLtNhsaDoxoPP7Ej1BWExFpgEYCo+xIN
         1pr8FFNadhUbUtP+OXnRIkern8nmIZmCW+ysTXJCShySf3NUY8UOcwa/RlIyFLAfUCZK
         hSqg==
X-Forwarded-Encrypted: i=1; AFNElJ9aMDm6Jj+eX3E2WT4+31tJhO6yp8UduR0GaiRYfMc+tI6MUlNG87mmHHUrOrd77vzy4ffyKHxhBT/GB0IsjKqG@lists.infradead.org
X-Gm-Message-State: AOJu0YzfwYgfv3BXDtZV0CxRgoHMCItF6UWENlN/ioNwoIIuYxDZMPZf
	ebB3ZKVAdzwvItOrXCqaxlsd3oSB+gq5UmK5gw3sl5GjkFvCl1WFzS95kA9X9TFQRRP7JvGXSGI
	dssWdm2BvMjF5hy0dVKV3GEBe1jkH+nFKUbVGV+L8fY+F2HZNVWhV3SFR0X/H53TikpFmQw+2sT
	izIA==
X-Gm-Gg: Acq92OEgu5O2W6ERi7FDWQnpm9WshA6sbVUAo95KcPr8BlPX2ndEI39AP0SXuzZA36F
	QzyLzaNtVX6V7WyZ3JWxTbzYPbO6GAqfAt7k8iMue8Eiq4YlvTD4dF+LS3kcN5ChQ+0M99jExOM
	laNTJOf+rW0OSafHWHb9r+EU8l/daIyhERCuceettDskU7CuhgV23Zl3+dyZ8MJODh5Wfl67NIO
	Z7qKeJk80uwNzCfEoT5OVrnjJDYkQYrWHz3U+YH56GMuQLR0//u8BP1yYu1RdLHqPMRvPlcmsxD
	RKzI6Cd0KnasnjmRsvajoyqk80vg9TpmYyaaHyz4RcV9ajl6pIcVoLy1QPHOBkdqoB+tc8f0NE2
	noyaPqlLKOiQ1YatdC9k/uoh1BRIbVHqWKLJZzf+FMaGMVPD2FMahGH4+Gj+RUwJgkpNTAVSEQ2
	8ZWuT36m/ZRPH4bnI9UHADqrNjSRCi0lCI4qo=
X-Received: by 2002:a05:620a:19a1:b0:915:7f9e:a407 with SMTP id af79cd13be357-91c42cc5889mr232610085a.0.1781569167569;
        Mon, 15 Jun 2026 17:19:27 -0700 (PDT)
X-Received: by 2002:a05:620a:19a1:b0:915:7f9e:a407 with SMTP id af79cd13be357-91c42cc5889mr232606585a.0.1781569167101;
        Mon, 15 Jun 2026 17:19:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3995c05abe3sm2595591fa.15.2026.06.15.17.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:19:24 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:19:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: kodiak: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <zhdacu4upv5kyvyqx5hcm6im4p7r3z5bsnup7hqu2okxyxmeib@snpseurpvhtc>
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-3-2a6d8ca30d63@oss.qualcomm.com>
 <p4xnrkcpbufkkbv4kq5civbt6hiwv3warrz7jiyinsfkihfedh@jfa7sgyzot6j>
 <26d51cbb-2d87-4564-b3c6-cc61ab900e19@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26d51cbb-2d87-4564-b3c6-cc61ab900e19@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwMSBTYWx0ZWRfX8cg04KwSC4gH
 jF14KC30132K9HGaRCoEtTMJEzqWxW2X94nfTZ+L5rgeE055RCK0xzBZKS5FPeuN0ju3IHZ/HRV
 A/16qWb+T+NB7WYGWcd8eCyFx+JM8XAQse/yTJFf1SeOGyReK2QBcE847XyzR+VeeWsfRP4kPIA
 UtHGp43gZlUbcA9GsYfD22LkbzsgBA7dQEen7t5an8Rakm+1GKgHmQxxAdYWGhxQXkvx/Cj+v3L
 hUrsXebtCOqhwKz5v/9FZuTua3GZNmHStilXEe5SaHtjR4feRLKb7pn1U/GqQ+6pa4jO8x4XzPk
 OsXEsKRhoKW2CR8XCyp3PgNZt7gouXnqD3kvTVX3hO4FuNGu9t/lEnIIiEryVykG+3Um9tHzbdV
 fbfm8Rp/r63B0ybUtkUxn89Lzkep2xRAs2Uclx44ktyNzKyC1rS6oyOSkjG4sZPXHztJ7V8mA6v
 3aqdfwclQkWKkzXWOfw==
X-Proofpoint-ORIG-GUID: fQR2la03EATv8lXzJWxpqv6Dsg7N2uBG
X-Authority-Analysis: v=2.4 cv=HMvz0Itv c=1 sm=1 tr=0 ts=6a309690 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=zWXYthO56evGz8b0qtEA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwMSBTYWx0ZWRfX/mKhKQG6rAic
 KxaU0Mb5xwwx410LygxZQdhIetHMehfy9anKpqHNSzbx/aavEcrDFgr7hWefJW2rhFZON7qH4rj
 xr7nIQGUfnJ58kcW8/f0yXGs0HQ/gFE=
X-Proofpoint-GUID: fQR2la03EATv8lXzJWxpqv6Dsg7N2uBG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_171929_451975_2D19AF74 
X-CRM114-Status: GOOD (  30.19  )
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

On Mon, Jun 08, 2026 at 08:07:07PM +0530, Bibek Kumar Patro wrote:
> 
> 
> On 6/8/2026 7:27 PM, Dmitry Baryshkov wrote:
> > On Tue, May 26, 2026 at 08:12:04PM +0530, Bibek Kumar Patro wrote:
> > > On Kodiak platforms, the Adreno SMMU requires a bandwidth vote on
> > > the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
> > > are accessible. Without this vote, the SMMU may become unreachable,
> > > leading to intermittent probe failures and runtime issues.
> > > 
> > > Add the required interconnect to ensure reliable register access.
> > 
> > Does it only concern the GPU SMMU? What about the APPS SMMU? Should it
> > be voting on other interconnects too? I guess so, because currently I
> > see that TBUs vote for various interconnects. BTW: should apps_smmu also
> > vote on the power domains?
> > 
> 
> This race mainly occurs in GPU SMMU, where the GDSC can have an
> independent vote on the Adreno SMMU. However, the GEM_NOC vote may
> already have been removed by the GPU (or any consumer of adreno_smmu,
> e.g gmu), unless it is explicitly voted by the GPU SMMU (which acts as a
> supplier for the GPU). This mismatch can lead to SHUB timeouts or NoC
> errors.
> 
> Mostly this race reported in suspend/resume cycle (when gpu/gmu devices
> moves to slumber/suspend state before adreno_smmu powers down
> and the later doesn't have explicit interconnect voting).
> 
> In the case of APPS SMMU, such a race is not expected for any known
> use case. APPS SMMU is part of a shared infrastructure block, and its
> power is typically kept enabled as long as attached master devices are
> active. Therefore, explicit power-domain voting from APPS SMMU may not
> be required.

This looks like a good part of the commit message. Please add it where
it belongs.

> 
> Thanks,
> Bibek
> 
> 
> > > 
> > > Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
> > >   1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > > index fa540d8c2615dc02d941eb16bc7253204c2750bd..eefa4b836a81374ff437ab4bbcbc3fecc1590ab6 100644
> > > --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > > @@ -3386,6 +3386,8 @@ adreno_smmu: iommu@3da0000 {
> > >   			power-domains = <&gpucc GPU_CC_CX_GDSC>;
> > >   			dma-coherent;
> > > +			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
> > > +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> > >   		};
> > >   		gfx_0_tbu: tbu@3dd9000 {
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry

